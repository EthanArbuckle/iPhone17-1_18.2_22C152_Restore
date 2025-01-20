@interface AEWrappedMediaProvider
- (AEWrappedMediaProvider)initWithMediaProvider:(id)a3;
- (PUMediaProvider)_internalMediaProvider;
- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7;
- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5;
- (void)cancelImageRequest:(int64_t)a3;
@end

@implementation AEWrappedMediaProvider

- (void).cxx_destruct
{
}

- (PUMediaProvider)_internalMediaProvider
{
  return self->__internalMediaProvider;
}

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v17 = [v14 photoKitRequestOptions];

  LODWORD(v14) = objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v13, width, height);
  return (int)v14;
}

- (void)cancelImageRequest:(int64_t)a3
{
  id v4 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  [v4 cancelImageRequest:a3];
}

- (int64_t)requestAnimatedImageForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  LODWORD(v9) = [v11 requestAnimatedImageForAsset:v10 options:v12 resultHandler:v8];
  return (int)v9;
}

- (int64_t)requestLivePhotoForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v13 = a7;
  id v14 = a6;
  id v15 = a3;
  v16 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v17 = [v14 photoKitRequestOptions];

  LODWORD(v14) = objc_msgSend(v16, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v15, a5, v17, v13, width, height);
  return (int)v14;
}

- (int64_t)requestPlayerItemForVideo:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  LODWORD(v9) = [v11 requestPlayerItemForVideo:v10 options:v12 resultHandler:v8];
  return (int)v9;
}

- (int64_t)requestImageURLForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  LODWORD(v9) = [v11 requestImageURLForAsset:v10 options:v12 resultHandler:v8];
  return (int)v9;
}

- (int64_t)requestImageDataForAsset:(id)a3 options:(id)a4 resultHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(AEWrappedMediaProvider *)self _internalMediaProvider];
  v12 = [v9 photoKitRequestOptions];

  LODWORD(v9) = [v11 requestImageDataForAsset:v10 options:v12 resultHandler:v8];
  return (int)v9;
}

- (AEWrappedMediaProvider)initWithMediaProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEWrappedMediaProvider;
  v6 = [(AEWrappedMediaProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->__internalMediaProvider, a3);
  }

  return v7;
}

@end