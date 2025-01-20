@interface MRUImageLoaderCoordinator
+ (id)sharedCoordinator;
- (CGSize)requestSize;
- (MRUImageLoaderCoordinator)init;
- (NSHashTable)loaders;
- (NSSet)registeredLoaderArtworkIdentifiers;
- (void)recalculateArtworkIdentifiers;
- (void)recalculateRequestSize;
- (void)registerLoader:(id)a3;
- (void)setRegisteredLoaderArtworkIdentifiers:(id)a3;
- (void)setRequestSize:(CGSize)a3;
- (void)unregisterLoader:(id)a3;
@end

@implementation MRUImageLoaderCoordinator

+ (id)sharedCoordinator
{
  if (sharedCoordinator_onceToken != -1) {
    dispatch_once(&sharedCoordinator_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedCoordinator___shared;

  return v2;
}

void __46__MRUImageLoaderCoordinator_sharedCoordinator__block_invoke()
{
  v0 = objc_alloc_init(MRUImageLoaderCoordinator);
  v1 = (void *)sharedCoordinator___shared;
  sharedCoordinator___shared = (uint64_t)v0;
}

- (MRUImageLoaderCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)MRUImageLoaderCoordinator;
  v2 = [(MRUImageLoaderCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    *(_OWORD *)(v2 + 24) = *MEMORY[0x1E4F1DB30];
    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;
  }
  return (MRUImageLoaderCoordinator *)v2;
}

- (void)registerLoader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRUImageLoaderCoordinator *)self loaders];
  [v5 addObject:v4];

  [(MRUImageLoaderCoordinator *)self recalculateRequestSize];

  [(MRUImageLoaderCoordinator *)self recalculateArtworkIdentifiers];
}

- (void)unregisterLoader:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MRUImageLoaderCoordinator *)self loaders];
  [v5 removeObject:v4];

  [(MRUImageLoaderCoordinator *)self recalculateRequestSize];

  [(MRUImageLoaderCoordinator *)self recalculateArtworkIdentifiers];
}

- (void)recalculateArtworkIdentifiers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRUImageLoaderCoordinator *)self loaders];
  id v4 = [v3 allObjects];

  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "lastVendedArtworkIdentifier", (void)v22);

        if (v12)
        {
          v13 = [v11 lastVendedArtworkIdentifier];
          v14 = [v13 stringRepresentation];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v8);
  }

  v15 = [(MRUImageLoaderCoordinator *)self registeredLoaderArtworkIdentifiers];
  char v16 = [v5 isEqualToSet:v15];

  if ((v16 & 1) == 0)
  {
    [(MRUImageLoaderCoordinator *)self setRegisteredLoaderArtworkIdentifiers:v5];
    v17 = [MEMORY[0x1E4F770F0] currentSettings];
    int v18 = [v17 verboseImageLoadingLogging];

    if (v18)
    {
      v19 = MCLogCategoryImageLoading();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(MRUImageLoaderCoordinator *)self registeredLoaderArtworkIdentifiers];
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_1AE7DF000, v19, OS_LOG_TYPE_DEFAULT, "[MRUImageLoaderCoordinator] [MRUImageLoaderCoordinator] artwork identifiers changed: %@.", buf, 0xCu);
      }
    }
    v21 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", (void)v22);
    [v21 postNotificationName:@"MRUImageLoaderCoordinatorArtworkIdentifiersDidChangeNotification" object:0];
  }
}

- (void)recalculateRequestSize
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v3 = [(MRUImageLoaderCoordinator *)self loaders];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) scaledFittingSize];
        if (v10 < (double)v6) {
          double v10 = (double)v6;
        }
        uint64_t v6 = (uint64_t)v10;
        double v12 = (double)v7;
        if (v11 >= (double)v7) {
          double v12 = v11;
        }
        uint64_t v7 = (uint64_t)v12;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v5);
    double v13 = (double)v6;
    double v14 = (double)v7;
  }
  else
  {
    double v13 = 0.0;
    double v14 = 0.0;
  }

  [(MRUImageLoaderCoordinator *)self requestSize];
  if (v16 != v13 || v15 != v14)
  {
    int v18 = MCLogCategoryImageLoading();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v28.width = v13;
      v28.height = v14;
      v19 = NSStringFromCGSize(v28);
      *(_DWORD *)buf = 138412290;
      long long v25 = v19;
      _os_log_impl(&dword_1AE7DF000, v18, OS_LOG_TYPE_DEFAULT, "[MRUImageLoaderCoordinator] [MRUImageLoaderCoordinator] coordinated size changed to %@.", buf, 0xCu);
    }
    -[MRUImageLoaderCoordinator setRequestSize:](self, "setRequestSize:", v13, v14);
  }
}

- (CGSize)requestSize
{
  double width = self->_requestSize.width;
  double height = self->_requestSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRequestSize:(CGSize)a3
{
  self->_requestSize = a3;
}

- (NSSet)registeredLoaderArtworkIdentifiers
{
  return self->_registeredLoaderArtworkIdentifiers;
}

- (void)setRegisteredLoaderArtworkIdentifiers:(id)a3
{
}

- (NSHashTable)loaders
{
  return self->_loaders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loaders, 0);

  objc_storeStrong((id *)&self->_registeredLoaderArtworkIdentifiers, 0);
}

@end