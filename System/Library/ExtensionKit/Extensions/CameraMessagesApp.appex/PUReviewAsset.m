@interface PUReviewAsset
+ (CGSize)cam_screenPixelSize;
+ (id)_assetAdjustmentsFromCFXMediaItem:(id)a3;
+ (id)_photoReviewAssetFromCFXMediaItem:(id)a3;
+ (id)_videoReviewAssetFromCFXMediaItem:(id)a3;
+ (id)reviewAssetFromCFXMediaItem:(id)a3;
@end

@implementation PUReviewAsset

+ (id)reviewAssetFromCFXMediaItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 originalAssetURL];
  if (v5)
  {
    CAMSignpostWithIDAndArgs();
    id v6 = [v4 type];
    if (v6 == (id)2)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000AE04(v10);
      }

      v7 = 0;
      goto LABEL_14;
    }
    if (v6 == (id)1)
    {
      uint64_t v8 = [a1 _videoReviewAssetFromCFXMediaItem:v4];
    }
    else
    {
      v7 = 0;
      if (v6)
      {
LABEL_14:
        CAMSignpostWithIDAndArgs();
        goto LABEL_15;
      }
      uint64_t v8 = [a1 _photoReviewAssetFromCFXMediaItem:v4];
    }
    v7 = (void *)v8;
    goto LABEL_14;
  }
  v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CFXMediaItem does not have originalAssetURL", v12, 2u);
  }

  v7 = 0;
LABEL_15:

  return v7;
}

+ (id)_photoReviewAssetFromCFXMediaItem:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  CFURLRef v6 = [v4 originalAssetURL];
  v7 = CGImageSourceCreateWithURL(v6, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    id v34 = v4;
    v9 = CGImageSourceCopyPropertiesAtIndex(v7, 0, 0);
    v10 = [v9 objectForKeyedSubscript:kCGImagePropertyOrientation];
    uint64_t v11 = [v9 objectForKeyedSubscript:kCGImagePropertyPixelWidth];
    uint64_t v12 = [v9 objectForKeyedSubscript:kCGImagePropertyPixelHeight];
    v33 = v10;
    unsigned int v13 = [v10 intValue] - 5;
    if (v13 >= 4) {
      v14 = (void *)v11;
    }
    else {
      v14 = (void *)v12;
    }
    v31 = (void *)v12;
    v32 = (void *)v11;
    if (v13 >= 4) {
      v15 = (void *)v12;
    }
    else {
      v15 = (void *)v11;
    }
    id v16 = [v14 integerValue];
    id v17 = [v15 integerValue];
    objc_msgSend(a1, "cam_screenPixelSize");
    PLScaledSizeToFitSize();
    if (v18 < v19) {
      double v18 = v19;
    }
    v37[0] = kCGImageSourceCreateThumbnailFromImageIfAbsent;
    v37[1] = kCGImageSourceCreateThumbnailFromImageAlways;
    v38[0] = kCFBooleanTrue;
    v38[1] = kCFBooleanTrue;
    v37[2] = kCGImageSourceThumbnailMaxPixelSize;
    v20 = +[NSNumber numberWithInteger:(uint64_t)v18];
    v37[3] = kCGImageSourceCreateThumbnailWithTransform;
    v38[2] = v20;
    v38[3] = kCFBooleanTrue;
    CFDictionaryRef v21 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:4];

    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v8, 0, v21);
    CFRelease(v8);
    if (ThumbnailAtIndex)
    {
      v23 = +[UIImage imageWithCGImage:ThumbnailAtIndex];
      CGImageRelease(ThumbnailAtIndex);
    }
    else
    {
      v23 = 0;
    }
    v25 = +[NSDate date];
    v26 = +[PLUUIDString UUIDString];
    v27 = [a1 _assetAdjustmentsFromCFXMediaItem:v34];
    id v24 = [objc_alloc((Class)PUReviewAsset) initWithPhoto:v23 mediaSubtypes:0 width:v16 height:v17 captureDate:v25 metadata:v9 burstIdentifier:0 representedCount:0 fullsizeImageURL:v6 fullsizeUnadjustedImageURL:0 assetAdjustments:v27 identifier:v26];
    double v28 = CFAbsoluteTimeGetCurrent();
    v29 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v36 = v28 - Current;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Creating review asset for photo took %.3f seconds", buf, 0xCu);
    }

    id v4 = v34;
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000AE48(v6);
    }
    id v24 = 0;
  }

  return v24;
}

+ (id)_videoReviewAssetFromCFXMediaItem:(id)a3
{
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  CFURLRef v6 = [v4 originalAssetURL];
  v7 = +[AVAsset assetWithURL:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    long long v47 = 0uLL;
    uint64_t v48 = 0;
    [v7 duration];
    if (!((unsigned __int128)0 >> 96))
    {
      v9 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000AF50(v6);
      }
      id v10 = 0;
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v12 = [v8 tracksWithMediaType:AVMediaTypeVideo];
    unsigned int v13 = [v12 firstObject];
    id v16 = v13;
    if (v13)
    {
      [v13 naturalSize];
      double v18 = v17;
      double v20 = v19;
      long long v50 = 0u;
      memset(time, 0, sizeof(time));
      [v16 preferredTransform];
      v52.size.double width = v20 * 0.0 + 0.0 * v18;
      v52.size.double height = v52.size.width;
      v52.origin.x = 0.0;
      v52.origin.y = 0.0;
      *(CGRect *)&double v14 = CGRectStandardize(v52);
      double width = v21;
      double height = v23;
    }
    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
    }
    objc_msgSend(a1, "cam_screenPixelSize", v14, v15);
    PLScaledSizeToFitSize();
    double v26 = v25;
    double v28 = v27;
    id v29 = [objc_alloc((Class)AVAssetImageGenerator) initWithAsset:v8];
    [v29 setAppliesPreferredTrackTransform:1];
    objc_msgSend(v29, "setMaximumSize:", v26, v28);
    CMTimeMakeWithSeconds(&v46, 0.0, 1);
    id v45 = 0;
    id v30 = [v29 copyCGImageAtTime:&v46 actualTime:0 error:&v45];
    id v31 = v45;
    v44 = v16;
    v42 = v31;
    v43 = v29;
    if (v31 || !v30)
    {
      v33 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_10000AFD4(v6, (uint64_t)v31, v33);
      }

      uint64_t v32 = 0;
      id v34 = 0;
      if (!v30) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v32 = +[UIImage imageWithCGImage:v30];
    }
    CFRelease(v30);
    id v34 = (void *)v32;
LABEL_19:
    v35 = +[NSDate date];
    double v36 = +[PLUUIDString UUIDString];
    v37 = [a1 _assetAdjustmentsFromCFXMediaItem:v4];
    id v38 = objc_alloc((Class)PUReviewAsset);
    *(_OWORD *)time = v47;
    *(void *)&time[16] = v48;
    id v10 = [v38 initWithAVAsset:v8 audioMix:0 width:(unint64_t)width height:(unint64_t)height captureDate:v35 duration:v34 previewImage:CMTimeGetSeconds((CMTime *)time) videoURL:v6 adjustments:v37 identifier:v36];
    double v39 = CFAbsoluteTimeGetCurrent();
    v40 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)time = 134217984;
      *(double *)&time[4] = v39 - Current;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Creating review asset for video took %.3f seconds", time, 0xCu);
    }

    v9 = v12;
    goto LABEL_22;
  }
  uint64_t v11 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_10000AECC(v6);
  }

  id v10 = 0;
LABEL_23:

  return v10;
}

+ (CGSize)cam_screenPixelSize
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];
  double v4 = v3;
  [v2 _referenceBounds];
  double v6 = v4 * v5;
  double v8 = v4 * v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

+ (id)_assetAdjustmentsFromCFXMediaItem:(id)a3
{
  double v3 = [a3 adjustmentsData];
  if (v3)
  {
    id v4 = objc_alloc((Class)PFAssetAdjustments);
    id v5 = [v4 initWithFormatIdentifier:PUFunEffectsAdjustmentFormatIdentifier formatVersion:PUFunEffectsAdjustmentFormatVersion data:v3 baseVersion:0 editorBundleID:0 renderTypes:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end