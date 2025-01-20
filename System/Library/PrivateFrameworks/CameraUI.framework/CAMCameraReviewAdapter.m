@interface CAMCameraReviewAdapter
+ (Class)cameraReviewViewControllerClass;
+ (id)reviewAssetForAVAsset:(id)a3 audioMix:(id)a4 properties:(id)a5;
+ (id)reviewAssetForLivePhoto:(id)a3 withProperties:(id)a4;
+ (id)reviewAssetForPhoto:(id)a3 withProperties:(id)a4;
- (CAMCameraReviewAdapter)init;
- (CAMCameraReviewViewController)_cachedReviewViewController;
- (CAMCameraReviewViewController)cameraReviewViewController;
- (NSMutableArray)_pendingAssetsForReview;
- (void)_setCachedReviewViewController:(id)a3;
- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7;
- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6;
- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6;
@end

@implementation CAMCameraReviewAdapter

- (CAMCameraReviewAdapter)init
{
  v7.receiver = self;
  v7.super_class = (Class)CAMCameraReviewAdapter;
  v2 = [(CAMCameraReviewAdapter *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingAssetsForReview = v2->__pendingAssetsForReview;
    v2->__pendingAssetsForReview = v3;

    v5 = v2;
  }

  return v2;
}

- (CAMCameraReviewViewController)cameraReviewViewController
{
  v3 = [(CAMCameraReviewAdapter *)self _cachedReviewViewController];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v5 = [(CAMCameraReviewAdapter *)self _pendingAssetsForReview];
    v6 = (void *)[v5 copy];
    objc_super v7 = (objc_class *)[(id)objc_opt_class() cameraReviewViewControllerClass];
    if ([(objc_class *)v7 conformsToProtocol:&unk_26BE4B958]) {
      v8 = v7;
    }
    else {
      v8 = (objc_class *)CAMReviewViewController;
    }
    v9 = (void *)[[v8 alloc] initWithAssets:v6];
    [v5 removeAllObjects];
    [(CAMCameraReviewAdapter *)self _setCachedReviewViewController:v9];
    id v4 = v9;
  }
  return (CAMCameraReviewViewController *)v4;
}

+ (Class)cameraReviewViewControllerClass
{
  return (Class)objc_opt_class();
}

+ (id)reviewAssetForPhoto:(id)a3 withProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_super v7 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureMode"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  BOOL v25 = v8 == 3;
  v9 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPixelWidth"];
  uint64_t v24 = [v9 unsignedIntegerValue];

  v10 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPixelHeight"];
  uint64_t v23 = [v10 unsignedIntegerValue];

  v11 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureDate"];
  v12 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerBurstIdentifier"];
  v13 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerBurstRepresentedCount"];
  uint64_t v14 = [v13 unsignedIntegerValue];

  v15 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];
  v16 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerUnadjustedPhotoURL"];
  v17 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerAdjustments"];
  v18 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerUniquePersistenceIdentifier"];
  v19 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];

  v20 = (void *)[v19 mutableCopy];
  [v20 setObject:0 forKeyedSubscript:@"{Diagnostic}"];
  v21 = (void *)[objc_alloc(MEMORY[0x263F5E440]) initWithPhoto:v6 mediaSubtypes:v25 width:v24 height:v23 captureDate:v11 metadata:v20 burstIdentifier:v12 representedCount:v14 fullsizeImageURL:v15 fullsizeUnadjustedImageURL:v16 assetAdjustments:v17 identifier:v18];

  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  return v21;
}

+ (id)reviewAssetForLivePhoto:(id)a3 withProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  objc_super v7 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPixelWidth"];
  uint64_t v23 = [v7 unsignedIntegerValue];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPixelHeight"];
  uint64_t v9 = [v8 unsignedIntegerValue];

  v10 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureDate"];
  v11 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerVideoDuration"];
  [v11 doubleValue];
  double v13 = v12;

  uint64_t v14 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPreviewImage"];
  v15 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerUniquePersistenceIdentifier"];
  v16 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerUnadjustedPhotoURL"];
  v17 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerUnadjustedVideoURL"];
  v18 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerAdjustments"];
  v19 = [v5 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];

  v20 = (void *)[v19 mutableCopy];
  [v20 setObject:0 forKeyedSubscript:@"{Diagnostic}"];
  v21 = (void *)[objc_alloc(MEMORY[0x263F5E440]) initWithLivePhoto:v6 fullsizeUnadjustedImageURL:v16 fullsizeUnadjustedVideoURL:v17 assetAdjustments:v18 width:v23 height:v9 captureDate:v13 metadata:v10 duration:v20 previewImage:v14 identifier:v15];

  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  return v21;
}

+ (id)reviewAssetForAVAsset:(id)a3 audioMix:(id)a4 properties:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  CAMSignpostWithIDAndArgs(25, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);
  v10 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerPixelWidth"];
  uint64_t v24 = [v10 unsignedIntegerValue];

  v11 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerPixelHeight"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  double v13 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerCaptureDate"];
  uint64_t v14 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerVideoDuration"];
  [v14 doubleValue];
  double v16 = v15;

  v17 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerPreviewImage"];
  v18 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
  v19 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerUnadjustedVideoURL"];
  v20 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerAdjustments"];
  v21 = [v7 objectForKeyedSubscript:@"CAMCameraViewControllerUniquePersistenceIdentifier"];

  v22 = (void *)[objc_alloc(MEMORY[0x263F5E440]) initWithAVAsset:v9 audioMix:v8 width:v24 height:v12 captureDate:v13 duration:v17 previewImage:v16 videoURL:v18 unadjustedVideoURL:v19 adjustments:v20 identifier:v21];
  CAMSignpostWithIDAndArgs(26, 0xEEEEB0B5B2B2EEEELL, 0, 0, 0, 0);

  return v22;
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  if (!a6)
  {
    id v9 = a5;
    id v10 = a4;
    id v12 = [(id)objc_opt_class() reviewAssetForPhoto:v10 withProperties:v9];

    v11 = [(CAMCameraReviewAdapter *)self _pendingAssetsForReview];
    [v11 addObject:v12];
    [(CAMCameraReviewAdapter *)self _setCachedReviewViewController:0];
  }
}

- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  if (!a6)
  {
    id v9 = a5;
    id v10 = a4;
    id v12 = [(id)objc_opt_class() reviewAssetForLivePhoto:v10 withProperties:v9];

    v11 = [(CAMCameraReviewAdapter *)self _pendingAssetsForReview];
    [v11 addObject:v12];
    [(CAMCameraReviewAdapter *)self _setCachedReviewViewController:0];
  }
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  if (!a7)
  {
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v15 = [(id)objc_opt_class() reviewAssetForAVAsset:v13 audioMix:v12 properties:v11];

    uint64_t v14 = [(CAMCameraReviewAdapter *)self _pendingAssetsForReview];
    [v14 addObject:v15];
    [(CAMCameraReviewAdapter *)self _setCachedReviewViewController:0];
  }
}

- (NSMutableArray)_pendingAssetsForReview
{
  return self->__pendingAssetsForReview;
}

- (CAMCameraReviewViewController)_cachedReviewViewController
{
  return self->_cachedReviewViewController;
}

- (void)_setCachedReviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedReviewViewController, 0);
  objc_storeStrong((id *)&self->__pendingAssetsForReview, 0);
}

@end