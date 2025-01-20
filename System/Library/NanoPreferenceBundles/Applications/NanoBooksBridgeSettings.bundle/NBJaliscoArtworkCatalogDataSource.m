@interface NBJaliscoArtworkCatalogDataSource
+ (id)instance;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (NBJaliscoArtworkCatalogDataSource)init;
- (NSMapTable)pendingTasks;
- (NSString)imageDirectoryPath;
- (NSURLSession)artworkURLSession;
- (id)_cacheKeyForSize:(CGSize)a3 withBaseKey:(id)a4;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)setArtworkURLSession:(id)a3;
- (void)setImageDirectoryPath:(id)a3;
- (void)setPendingTasks:(id)a3;
@end

@implementation NBJaliscoArtworkCatalogDataSource

+ (id)instance
{
  if (qword_280E8 != -1) {
    dispatch_once(&qword_280E8, &stru_20960);
  }
  v2 = (void *)qword_280E0;

  return v2;
}

- (NBJaliscoArtworkCatalogDataSource)init
{
  v16.receiver = self;
  v16.super_class = (Class)NBJaliscoArtworkCatalogDataSource;
  v2 = [(NBJaliscoArtworkCatalogDataSource *)&v16 init];
  if (v2)
  {
    v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v4 = [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
    [v3 setURLCache:v4];
    uint64_t v5 = +[NSURLSession sessionWithConfiguration:v3];
    artworkURLSession = v2->_artworkURLSession;
    v2->_artworkURLSession = (NSURLSession *)v5;

    uint64_t v7 = +[NSMapTable strongToStrongObjectsMapTable];
    pendingTasks = v2->_pendingTasks;
    v2->_pendingTasks = (NSMapTable *)v7;

    v2->_pendingTaskLock._os_unfair_lock_opaque = 0;
    v9 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v10 = [v9 lastObject];
    uint64_t v11 = [v10 stringByAppendingPathComponent:@"bridge-jalisco-artwork"];
    imageDirectoryPath = v2->_imageDirectoryPath;
    v2->_imageDirectoryPath = (NSString *)v11;

    v13 = +[NSFileManager defaultManager];
    v14 = +[NSURL fileURLWithPath:v2->_imageDirectoryPath];
    [v13 createDirectoryAtURL:v14 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v2;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  uint64_t v5 = [v4 token];
  v6 = BUDynamicCast();

  [v4 scaledFittingSize];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = -[NBJaliscoArtworkCatalogDataSource _cacheKeyForSize:withBaseKey:](self, "_cacheKeyForSize:withBaseKey:", v6);
  v12 = [v4 cache];
  v13 = [v12 objectForKey:v11];

  if (v13)
  {
    id v14 = v13;
  }
  else if (([v4 renderHint] & 8) != 0)
  {
    id v14 = 0;
  }
  else
  {
    v15 = [(NBJaliscoArtworkCatalogDataSource *)self imageDirectoryPath];
    objc_super v16 = [v15 stringByAppendingPathComponent:v11];
    v17 = +[UIImage imageWithContentsOfFile:v16];

    if (v17)
    {
      +[MPArtworkRepresentation representationWithSize:image:](MPArtworkRepresentation, "representationWithSize:image:", v17, v8, v10);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v18 = [v4 cache];
      [v18 setObject:v14 forKey:v11];
    }
    else
    {
      id v14 = 0;
    }
  }

  return v14;
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 token];
  p_pendingTaskLock = &self->_pendingTaskLock;
  os_unfair_lock_lock(&self->_pendingTaskLock);
  double v10 = [(NBJaliscoArtworkCatalogDataSource *)self pendingTasks];
  uint64_t v11 = [v10 objectForKey:v8];

  if (v11)
  {
    v12 = 0;
  }
  else
  {
    id v13 = objc_alloc((Class)NSMutableURLRequest);
    id v14 = +[NSURL URLWithString:v8];
    id v15 = [v13 initWithURL:v14];

    [v15 setHTTPShouldUsePipelining:1];
    objc_super v16 = [(NBJaliscoArtworkCatalogDataSource *)self artworkURLSession];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_6F58;
    v22 = &unk_20988;
    v23 = self;
    id v24 = v6;
    id v17 = v8;
    id v25 = v17;
    id v26 = v7;
    v12 = [v16 dataTaskWithRequest:v15 completionHandler:&v19];

    v18 = [(NBJaliscoArtworkCatalogDataSource *)self pendingTasks];
    [v18 setObject:v12 forKey:v17];
  }
  os_unfair_lock_unlock(p_pendingTaskLock);
  [v12 resume];
}

- (void)cancelLoadingRepresentationForArtworkCatalog:(id)a3
{
  id v8 = [a3 token];
  p_pendingTaskLock = &self->_pendingTaskLock;
  os_unfair_lock_lock(&self->_pendingTaskLock);
  uint64_t v5 = [(NBJaliscoArtworkCatalogDataSource *)self pendingTasks];
  id v6 = [v5 objectForKey:v8];

  [v6 cancel];
  id v7 = [(NBJaliscoArtworkCatalogDataSource *)self pendingTasks];
  [v7 removeObjectForKey:v8];

  os_unfair_lock_unlock(p_pendingTaskLock);
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  v3 = [a3 token];
  id v4 = [[_NBStaticArtworkVisualIdenticalityIdentifier alloc] initWithArtworkIdentifier:v3];

  return v4;
}

- (id)_cacheKeyForSize:(CGSize)a3 withBaseKey:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld-{%f,%f}", [a4 hash], *(void *)&a3.width, *(void *)&a3.height);
}

- (NSURLSession)artworkURLSession
{
  return self->_artworkURLSession;
}

- (void)setArtworkURLSession:(id)a3
{
}

- (NSMapTable)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
}

- (NSString)imageDirectoryPath
{
  return self->_imageDirectoryPath;
}

- (void)setImageDirectoryPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDirectoryPath, 0);
  objc_storeStrong((id *)&self->_pendingTasks, 0);

  objc_storeStrong((id *)&self->_artworkURLSession, 0);
}

@end