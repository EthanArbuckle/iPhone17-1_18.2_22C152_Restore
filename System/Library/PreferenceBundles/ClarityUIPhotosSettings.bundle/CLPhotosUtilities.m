@interface CLPhotosUtilities
+ (CLPhotosUtilities)sharedInstance;
- (NSDictionary)sharedAlbumsCloudIDMappings;
- (NSDictionary)sharedAlbumsLocalIDMappings;
- (id)_loadSharedAlbumsCloudIdentifiersFromLocalIdentifiers:(id)a3;
- (id)_loadSharedAlbumsLocalIdentifiers;
- (id)previewImageForSharedAlbum:(id)a3;
- (id)sharedAlbums;
- (void)setSharedAlbumsCloudIDMappings:(id)a3;
- (void)setSharedAlbumsLocalIDMappings:(id)a3;
@end

@implementation CLPhotosUtilities

+ (CLPhotosUtilities)sharedInstance
{
  if (qword_10AD8 != -1) {
    dispatch_once(&qword_10AD8, &stru_C7C8);
  }
  v2 = (void *)qword_10AD0;

  return (CLPhotosUtilities *)v2;
}

- (id)_loadSharedAlbumsLocalIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_4FEC;
  v10 = sub_4FFC;
  id v11 = (id)objc_opt_new();
  v2 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:101 options:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5004;
  v5[3] = &unk_C788;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_loadSharedAlbumsCloudIdentifiersFromLocalIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = +[PHPhotoLibrary sharedPhotoLibrary];
  v22 = v3;
  v5 = [v4 cloudIdentifierMappingsForLocalIdentifiers:v3];

  uint64_t v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v13 = [v7 objectForKey:v12];
        v14 = [v13 error];

        if (v14)
        {
          v15 = CLFLogCommon();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            goto LABEL_15;
          }
          v16 = [v13 error];
          *(_DWORD *)buf = 138412546;
          uint64_t v28 = v12;
          __int16 v29 = 2112;
          v30 = v16;
          _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Cloud ID Mapping for Local ID: %@, has an error: %@", buf, 0x16u);
          goto LABEL_12;
        }
        uint64_t v17 = [v13 cloudIdentifier];
        if (v17)
        {
          v18 = (void *)v17;
          v19 = [v13 cloudIdentifier];
          v20 = [v19 stringValue];

          if (v20)
          {
            v15 = [v13 cloudIdentifier];
            v16 = [v15 stringValue];
            [v6 setValue:v16 forKey:v12];
LABEL_12:

            goto LABEL_15;
          }
        }
        v15 = CLFLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v28 = v12;
          _os_log_error_impl(&dword_0, v15, OS_LOG_TYPE_ERROR, "Cloud ID Mapping for Local ID: %@, has a nil cloud ID", buf, 0xCu);
        }
LABEL_15:
      }
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)sharedAlbums
{
  id v3 = [(CLPhotosUtilities *)self _loadSharedAlbumsLocalIdentifiers];
  sharedAlbumsLocalIDMappings = self->_sharedAlbumsLocalIDMappings;
  self->_sharedAlbumsLocalIDMappings = v3;

  v5 = [(NSDictionary *)self->_sharedAlbumsLocalIDMappings allKeys];
  uint64_t v6 = [(CLPhotosUtilities *)self _loadSharedAlbumsCloudIdentifiersFromLocalIdentifiers:v5];
  sharedAlbumsCloudIDMappings = self->_sharedAlbumsCloudIDMappings;
  self->_sharedAlbumsCloudIDMappings = v6;

  id v8 = objc_opt_new();
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  id v9 = (void *)qword_10AE0;
  uint64_t v29 = qword_10AE0;
  if (!qword_10AE0)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    long long v23 = sub_5CFC;
    long long v24 = &unk_C890;
    long long v25 = &v26;
    sub_5CFC((uint64_t)&v21);
    id v9 = (void *)v27[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v26, 8);
  id v11 = [v10 applicationWithBundleIdentifier:AX_PhotosBundleName];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  uint64_t v12 = (void *)qword_10AF0;
  uint64_t v29 = qword_10AF0;
  if (!qword_10AF0)
  {
    v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    long long v23 = sub_5EC4;
    long long v24 = &unk_C890;
    long long v25 = &v26;
    sub_5EC4((uint64_t)&v21);
    uint64_t v12 = (void *)v27[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v26, 8);
  v14 = [v13 sharedGuard];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_55D4;
  v19[3] = &unk_C7F0;
  v19[4] = self;
  id v15 = v8;
  id v20 = v15;
  [v14 authenticateForSubject:v11 completion:v19];

  v16 = v20;
  id v17 = v15;

  return v17;
}

- (id)previewImageForSharedAlbum:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 localIdentifier];
  uint64_t v28 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v28 count:1];
  id v7 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v6 options:0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_5B50;
  v20[3] = &unk_C840;
  id v8 = v4;
  id v21 = v8;
  [v7 enumerateObjectsUsingBlock:v20];

  id v9 = objc_opt_new();
  id v10 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"creationDate" ascending:0];
  id v27 = v10;
  id v11 = +[NSArray arrayWithObjects:&v27 count:1];
  [v9 setSortDescriptors:v11];

  uint64_t v12 = +[PHAsset fetchAssetsWithLocalIdentifiers:v8 options:v9];
  if ([v12 count])
  {
    id v13 = objc_alloc_init((Class)PHImageRequestOptions);
    [v13 setDeliveryMode:1];
    [v13 setSynchronous:1];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v23 = 0x3032000000;
    long long v24 = sub_4FEC;
    long long v25 = sub_4FFC;
    id v26 = 0;
    v14 = +[PHImageManager defaultManager];
    id v15 = [v12 firstObject];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_5C80;
    v19[3] = &unk_C868;
    v19[4] = &buf;
    objc_msgSend(v14, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, 0, v13, v19, 256.0, 256.0);

    id v16 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v13 = CLFLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v17 = [v3 localIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v17;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "No images found for shared album with Local ID: %@", (uint8_t *)&buf, 0xCu);
    }
    id v16 = 0;
  }

  return v16;
}

- (NSDictionary)sharedAlbumsLocalIDMappings
{
  return self->_sharedAlbumsLocalIDMappings;
}

- (void)setSharedAlbumsLocalIDMappings:(id)a3
{
}

- (NSDictionary)sharedAlbumsCloudIDMappings
{
  return self->_sharedAlbumsCloudIDMappings;
}

- (void)setSharedAlbumsCloudIDMappings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsCloudIDMappings, 0);

  objc_storeStrong((id *)&self->_sharedAlbumsLocalIDMappings, 0);
}

@end