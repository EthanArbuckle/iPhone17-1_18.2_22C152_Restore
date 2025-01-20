@interface PDCRemoteAssetOriginalPreviewController
- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5;
@end

@implementation PDCRemoteAssetOriginalPreviewController

- (id)imageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = sub_100002534;
  v35 = sub_100002544;
  id v36 = 0;
  id v9 = [v8 mediaType];
  if (v9 == (id)1)
  {
    id v15 = objc_alloc_init((Class)PHImageRequestOptions);
    [v15 setVersion:1];
    [v15 setDeliveryMode:1];
    [v15 setSynchronous:1];
    v16 = +[PHImageManager defaultManager];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000254C;
    v24[3] = &unk_100004210;
    v27 = &v31;
    v10 = v15;
    v25 = v10;
    id v26 = v8;
    double v28 = width;
    double v29 = height;
    int64_t v30 = a5;
    objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v26, a5, v10, v24, width, height);

    v13 = v25;
  }
  else
  {
    if (v9 != (id)2) {
      goto LABEL_6;
    }
    v10 = objc_alloc_init((Class)PHVideoRequestOptions);
    [v10 setVersion:1];
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    v12 = +[PHImageManager defaultManager];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000262C;
    v19[3] = &unk_100004238;
    v21 = &v31;
    double v22 = width;
    double v23 = height;
    v13 = v11;
    v20 = v13;
    [v12 requestAVAssetForVideo:v8 options:v10 resultHandler:v19];

    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v13, v14);
  }
LABEL_6:
  id v17 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v17;
}

@end