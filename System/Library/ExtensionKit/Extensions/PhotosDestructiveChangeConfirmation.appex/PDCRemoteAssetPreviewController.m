@interface PDCRemoteAssetPreviewController
- (NSArray)assetLocalIdentifiers;
- (NSURL)photoLibraryURL;
- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5;
- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5;
- (void)setAssetLocalIdentifiers:(id)a3;
- (void)setPhotoLibraryURL:(id)a3;
@end

@implementation PDCRemoteAssetPreviewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetLocalIdentifiers, 0);

  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
}

- (void)setAssetLocalIdentifiers:(id)a3
{
}

- (NSArray)assetLocalIdentifiers
{
  return self->_assetLocalIdentifiers;
}

- (void)setPhotoLibraryURL:(id)a3
{
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100001ABC;
  v26 = sub_100001ACC;
  id v27 = 0;
  id v9 = objc_alloc_init((Class)PHImageRequestOptions);
  [v9 setDeliveryMode:1];
  [v9 setSynchronous:1];
  v10 = +[PHImageManager defaultManager];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100001AD4;
  v15[3] = &unk_100004210;
  v18 = &v22;
  id v11 = v9;
  id v16 = v11;
  id v12 = v8;
  id v17 = v12;
  double v19 = width;
  double v20 = height;
  int64_t v21 = a5;
  objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v12, a5, v11, v15, width, height);

  id v13 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v13;
}

- (id)imagesWithTargetSize:(CGSize)a3 contentMode:(int64_t)a4 maximumCount:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  v10 = [(PDCRemoteAssetPreviewController *)self assetLocalIdentifiers];
  id v11 = objc_alloc_init((Class)PHPhotoLibraryManager);
  id v12 = [(PDCRemoteAssetPreviewController *)self photoLibraryURL];
  id v31 = 0;
  id v13 = [v11 openPhotoLibraryWithURL:v12 options:0 error:&v31];
  id v14 = v31;

  v15 = +[NSMutableArray arrayWithCapacity:a5];
  if (v13)
  {
    id v24 = v14;
    id v25 = v11;
    id v16 = +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v13];
    [v16 setFetchLimit:a5];
    v26 = v10;
    id v17 = +[PHAsset fetchAssetsWithLocalIdentifiers:v10 options:v16];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = [v17 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v28;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = -[PDCRemoteAssetPreviewController imageForAsset:targetSize:contentMode:](self, "imageForAsset:targetSize:contentMode:", *(void *)(*((void *)&v27 + 1) + 8 * i), a4, width, height);
          if (v22) {
            [v15 addObject:v22];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v19);
    }

    id v11 = v25;
    v10 = v26;
    id v14 = v24;
  }
  else
  {
    id v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to open library %@", buf, 0xCu);
    }
  }

  return v15;
}

@end