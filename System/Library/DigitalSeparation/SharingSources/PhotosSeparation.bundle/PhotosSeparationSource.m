@interface PhotosSeparationSource
- (NSString)name;
- (PhotosSeparationSource)init;
- (PhotosSeparationSource)initWithPhotoLibrary:(id)a3;
- (id)sharedResourceForParticipant:(id)a3;
- (void)cacheSharedResources:(id)a3;
- (void)fetchSharedResourcesWithCompletion:(id)a3;
- (void)stopAllSharingWithCompletion:(id)a3;
- (void)stopSharing:(id)a3 withCompletion:(id)a4;
- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4;
- (void)updateVisibilityTo:(int64_t)a3 onResource:(id)a4 withCompletion:(id)a5;
@end

@implementation PhotosSeparationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedResourcesByParticipantUuid, 0);

  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (id)sharedResourceForParticipant:(id)a3
{
  sharedResourcesByParticipantUuid = self->_sharedResourcesByParticipantUuid;
  v4 = [a3 uuid];
  v5 = [(NSMutableDictionary *)sharedResourcesByParticipantUuid objectForKeyedSubscript:v4];

  return v5;
}

- (void)cacheSharedResources:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableDictionary dictionary];
  sharedResourcesByParticipantUuid = self->_sharedResourcesByParticipantUuid;
  self->_sharedResourcesByParticipantUuid = v5;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v19 = *(void *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v9);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v11 = [v10 participants];
        id v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            v15 = 0;
            do
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = self->_sharedResourcesByParticipantUuid;
              v17 = [*(id *)(*((void *)&v20 + 1) + 8 * (void)v15) uuid];
              [(NSMutableDictionary *)v16 setObject:v10 forKeyedSubscript:v17];

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v8);
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }
}

- (void)updateVisibilityTo:(int64_t)a3 onResource:(id)a4 withCompletion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2DC8;
  v9[3] = &unk_82C8;
  id v10 = a4;
  id v11 = a5;
  id v7 = v10;
  id v8 = v11;
  [v7 updateVisibility:a3 completion:v9];
}

- (void)stopAllSharingWithCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2E80;
  v5[3] = &unk_82A0;
  id v6 = a3;
  id v4 = v6;
  [(PhotosSeparationSource *)self fetchSharedResourcesWithCompletion:v5];
}

- (void)stopSharingWithParticipant:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PhotosSeparationSource *)self sharedResourceForParticipant:v7];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_32D8;
  v10[3] = &unk_82F8;
  id v11 = v6;
  id v9 = v6;
  [v8 stopSharingToParticipant:v7 withCompletion:v10];
}

- (void)stopSharing:(id)a3 withCompletion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_3384;
  v6[3] = &unk_82F8;
  id v7 = a4;
  id v5 = v7;
  [a3 stopSharingWithCompletion:v6];
}

- (void)fetchSharedResourcesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  photoLibrary = self->_photoLibrary;
  id v15 = 0;
  id v7 = +[PhotosSeparationSharedAlbumResource fetchSharedAlbumResourcesInLibrary:photoLibrary error:&v15];
  id v8 = v15;
  if ([v7 count])
  {
    [v5 addObjectsFromArray:v7];
  }
  else if (v8)
  {
    [0 addObject:v8];
  }
  id v9 = self->_photoLibrary;
  id v14 = 0;
  id v10 = +[PhotosSeparationSharedLibraryResource fetchSharedLibraryResourcesInLibrary:v9 error:&v14];
  id v11 = v14;

  if ([v10 count])
  {
    [v5 addObjectsFromArray:v10];
  }
  else if (v11)
  {
    [0 addObject:v11];
  }
  if (v4)
  {
    if ([0 count])
    {
      v16[0] = NSLocalizedDescriptionKey;
      v16[1] = NSMultipleUnderlyingErrorsKey;
      v17[0] = @"Failed to fetch shared resources";
      v17[1] = 0;
      id v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      id v13 = +[NSError errorWithDomain:@"com.apple.photos.PhotosSeparation" code:64 userInfo:v12];
    }
    else
    {
      id v13 = 0;
    }
    [(PhotosSeparationSource *)self cacheSharedResources:v5];
    v4[2](v4, v5, v13);
  }
}

- (NSString)name
{
  return (NSString *)DSSourceNamePhotos;
}

- (PhotosSeparationSource)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PhotosSeparationSource;
  id v6 = [(PhotosSeparationSource *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
  }

  return v7;
}

- (PhotosSeparationSource)init
{
  v11.receiver = self;
  v11.super_class = (Class)PhotosSeparationSource;
  v2 = [(PhotosSeparationSource *)&v11 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)PHPhotoLibrary);
    id v4 = +[PHPhotoLibrary systemPhotoLibraryURL];
    id v5 = (PHPhotoLibrary *)[v3 initWithPhotoLibraryURL:v4];
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = v5;

    id v7 = v2->_photoLibrary;
    id v10 = 0;
    [(PHPhotoLibrary *)v7 openAndWaitWithUpgrade:0 error:&v10];
    id v8 = v10;
    if (!v2->_photoLibrary)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't open the system library: %@", buf, 0xCu);
      }

      v2 = 0;
    }
  }
  return v2;
}

@end