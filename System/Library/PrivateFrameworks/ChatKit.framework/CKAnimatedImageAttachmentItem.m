@interface CKAnimatedImageAttachmentItem
+ (BOOL)shouldScaleUpPreview;
+ (id)UTITypes;
- (CGSize)imageSize;
- (CGSize)size;
- (NSURL)animatedPreviewURL;
- (id)_newImageData;
- (id)_savedPreviewFromURL:(id)a3;
- (id)animatedPreviewURL:(BOOL)a3;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4;
- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 withImageData:(id)a5;
- (void)generatePreviewWithCompletion:(id)a3;
- (void)setAnimatedPreviewURL:(id)a3;
- (void)setImageSize:(CGSize)a3;
@end

@implementation CKAnimatedImageAttachmentItem

+ (id)UTITypes
{
  return (id)MEMORY[0x1F4124608](a1, a2);
}

- (CGSize)size
{
  v3 = [(CKAttachmentItem *)self cachedPreview];
  if (!v3) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 size];
LABEL_7:
      double v6 = v9;
      double v8 = v10;
      goto LABEL_8;
    }
LABEL_6:
    v13.receiver = self;
    v13.super_class = (Class)CKAnimatedImageAttachmentItem;
    [(CKImageAttachmentItem *)&v13 size];
    goto LABEL_7;
  }
  v4 = [v3 image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

LABEL_8:
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)animatedPreviewURL:(BOOL)a3
{
  animatedPreviewURL = self->_animatedPreviewURL;
  if (!animatedPreviewURL)
  {
    double v5 = [(CKAttachmentItem *)self fileURL];
    double v6 = +[CKAnimatedImage filenameExtension];
    IMAttachmentPreviewFileURL();
    double v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
    double v8 = self->_animatedPreviewURL;
    self->_animatedPreviewURL = v7;

    animatedPreviewURL = self->_animatedPreviewURL;
  }

  return animatedPreviewURL;
}

- (id)_savedPreviewFromURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(CKAnimatedImageAttachmentItem *)self animatedPreviewURL:0];
    id v12 = 0;
    double v6 = +[CKAnimatedImage animatedImageFromOptimizedBitmapAtFileURL:v5 error:&v12];
    id v7 = v12;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CKAnimatedImageAttachmentItem;
      id v8 = [(CKAttachmentItem *)&v11 _savedPreviewFromURL:v4];
    }
    double v9 = v8;
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(id)objc_opt_class() previewCache];
  double v6 = CKAttachmentPreviewCacheKey(self);
  id v7 = +[CKUIBehavior sharedBehaviors];
  [v7 previewMaxWidth];
  uint64_t v9 = v8;

  double v10 = [v5 cachedPreviewForKey:v6];

  if (!v10)
  {
    v23.receiver = self;
    v23.super_class = (Class)CKAnimatedImageAttachmentItem;
    [(CKImageAttachmentItem *)&v23 generatePreviewWithCompletion:v4];
  }
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__4;
  v21[4] = __Block_byref_object_dispose__4;
  id v22 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke;
  v20[3] = &unk_1E56219B8;
  v20[4] = self;
  v20[5] = v21;
  v20[6] = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
  v14[3] = &unk_1E5621A08;
  id v11 = v5;
  id v15 = v11;
  id v12 = v6;
  id v16 = v12;
  id v13 = v4;
  v17 = self;
  id v18 = v13;
  v19 = v21;
  [v11 enqueueGenerationBlock:v20 completion:v14 withPriority:-1 forKey:v12];

  _Block_object_dispose(v21, 8);
}

CKAnimatedImage *__63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = IMSafeTemporaryDirectory();
  id v4 = [v3 path];
  v27[0] = v4;
  v27[1] = @"CKAnimatedImageAttachmentItemPreview";
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  double v6 = [v2 fileURLWithPathComponents:v5];

  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];

  uint64_t v8 = [*(id *)(a1 + 32) guid];
  uint64_t v9 = [v6 URLByAppendingPathComponent:v8 isDirectory:0];
  double v10 = +[CKAnimatedImage filenameExtension];
  uint64_t v11 = [v9 URLByAppendingPathExtension:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  v14 = (void *)[*(id *)(a1 + 32) _newImageData];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E5621990;
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v26 = *(void *)(a1 + 48);
  aBlock[4] = v15;
  id v25 = v14;
  id v16 = v14;
  v17 = _Block_copy(aBlock);
  id v18 = [v16 durationsWithMaxCount:*MEMORY[0x1E4F6D500]];
  v19 = -[CKMultiFrameImage initWithFrameCount:frameProvider:frameDurations:]([CKMultiFrameImage alloc], "initWithFrameCount:frameProvider:frameDurations:", [v18 count], v17, v18);
  v20 = [[CKAnimatedImage alloc] initWithMultiFrameImage:v19];
  uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v23 = 0;
  [(CKAnimatedImage *)v20 writeAsOptimizedBitmapToFileURL:v21 error:&v23];

  return v20;
}

id __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) thumbnailAtIndex:a2 forWidth:*(void *)(a1 + 40) withImageData:*(double *)(a1 + 48)];
  id v4 = [*(id *)(a1 + 32) generatePreviewFromThumbnail:v3 width:*(double *)(a1 + 48)];

  return v4;
}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_4;
  block[3] = &unk_1E5621A08;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = v2;
  uint64_t v8 = *(void *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
  if (v2)
  {
    if (CKIsRunningInFullCKClient())
    {
      id v4 = *(void **)(a1 + 32);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_5;
      v8[3] = &unk_1E56219E0;
      v8[4] = *(void *)(a1 + 48);
      id v5 = v2;
      uint64_t v6 = *(void *)(a1 + 64);
      id v9 = v5;
      uint64_t v10 = v6;
      [v4 enqueueSaveBlock:v8 withPriority:-1];
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v7 removeItemAtURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error:0];
    }
  }
}

void __63__CKAnimatedImageAttachmentItem_generatePreviewWithCompletion___block_invoke_5(uint64_t *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (_IMWillLog())
  {
    uint64_t v14 = a1[4];
    _IMAlwaysLog();
  }
  id v2 = objc_msgSend((id)a1[4], "animatedPreviewURL:", 1, v14);
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  if (v5) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = a1[4];
        uint64_t v13 = a1[5];
        *(_DWORD *)buf = 138412802;
        uint64_t v19 = v12;
        __int16 v20 = 2112;
        uint64_t v21 = v2;
        __int16 v22 = 2112;
        uint64_t v23 = v13;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "%@ animated preview NOT saved to %@ because %@ isn't a CKAnimatedImage.", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      id v16 = v2;
      uint64_t v17 = a1[5];
      uint64_t v15 = a1[4];
      _CKLog();
    }
    goto LABEL_5;
  }
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 moveItemAtURL:*(void *)(*(void *)(a1[6] + 8) + 40) toURL:v2 error:0];

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = a1[4];
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v2;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "%@ animated preview saved to %@.", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v15 = a1[4];
    id v16 = v2;
    _CKLog();
  }
  if ((v8 & 1) == 0)
  {
LABEL_5:
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v15, v16, v17);
    [v6 removeItemAtURL:*(void *)(*(void *)(a1[6] + 8) + 40) error:0];
  }
}

- (id)_newImageData
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  id v4 = [(CKAttachmentItem *)self fileURL];
  char v5 = (void *)[v3 initWithContentsOfURL:v4 options:8 error:0];

  if (v5) {
    uint64_t v6 = [[CKImageData alloc] initWithData:v5];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)thumbnailAtIndex:(unint64_t)a3 forWidth:(double)a4 withImageData:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  char v8 = +[CKUIBehavior sharedBehaviors];
  [v7 ptSize];
  objc_msgSend(v8, "thumbnailFillSizeForWidth:imageSize:", a4, v9, v10);
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = objc_msgSend(v7, "thumbnailAtIndex:fillToSize:maxCount:", a3, *MEMORY[0x1E4F6D500], v12, v14);
  [v15 size];
  double v17 = v16;
  double v19 = v18;
  __int16 v20 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v20, "thumbnailFillSizeForWidth:imageSize:", a4, v17, v19);
  double v22 = v21;
  double v24 = v23;

  if ([(id)objc_opt_class() shouldScaleUpPreview])
  {
    if (v17 + 1.0 < v22 || v19 + 1.0 < v24)
    {
      if (v17 == 0.0) {
        double v26 = 0.0;
      }
      else {
        double v26 = v22 / v17;
      }
      if (v19 == 0.0) {
        double v27 = 0.0;
      }
      else {
        double v27 = v24 / v19;
      }
      v28 = [MEMORY[0x1E4F42D90] mainScreen];
      [v28 scale];
      double v30 = v29;

      v31 = [MEMORY[0x1E4F42D90] mainScreen];
      double v32 = v30 / fmax(v26, v27);
      [v31 scale];
      double v34 = v33 * 0.5;

      if (v32 < v34) {
        double v32 = v34;
      }
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v51.width = v17;
          v51.height = v19;
          NSStringFromCGSize(v51);
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          v52.width = v22;
          v52.height = v24;
          v37 = NSStringFromCGSize(v52);
          *(_DWORD *)buf = 138412802;
          id v44 = v36;
          __int16 v45 = 2048;
          double v46 = v32;
          __int16 v47 = 2112;
          v48 = v37;
          _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v53.width = v17;
        v53.height = v19;
        v38 = NSStringFromCGSize(v53);
        v54.width = v22;
        v54.height = v24;
        v42 = NSStringFromCGSize(v54);
        _CKLog();
      }
      id v39 = objc_alloc(MEMORY[0x1E4F42A80]);
      id v40 = v15;
      uint64_t v15 = objc_msgSend(v39, "initWithCGImage:scale:orientation:", objc_msgSend(v40, "CGImage"), objc_msgSend(v40, "imageOrientation"), v32);
    }
  }

  return v15;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    [v5 size];
    double v8 = v7;
    double v10 = v9;
    double v11 = +[CKUIBehavior sharedBehaviors];
    [v11 balloonMaskSizeWithTailShape:1 isMultiline:0];
    double v13 = v12;
    double v15 = v14;

    if (v8 < v13 || v10 < v15)
    {
      id v17 = v6;
      double v18 = (CGImage *)[v17 CGImage];
      if (v18)
      {
        double v19 = v18;
        size_t Width = CGImageGetWidth(v18);
        size_t Height = CGImageGetHeight(v19);
        double v22 = [MEMORY[0x1E4F42D90] mainScreen];
        [v22 scale];
        double v24 = 1.0 / v23;
        double v25 = v24 * (double)Width;
        double v26 = v24 * (double)Height;

        double v27 = v13 / v25;
        double v28 = 0.0;
        if (v25 == 0.0) {
          double v27 = 0.0;
        }
        if (v26 != 0.0) {
          double v28 = v15 / v26;
        }
        double v29 = fmax(v27, v28);
        if (CKMainScreenScale_once_6 != -1) {
          dispatch_once(&CKMainScreenScale_once_6, &__block_literal_global_10);
        }
        double v30 = *(double *)&CKMainScreenScale_sMainScreenScale_6;
        if (*(double *)&CKMainScreenScale_sMainScreenScale_6 == 0.0) {
          double v30 = 1.0;
        }
        double v31 = ceil(v29 * v30) / v30;
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          double v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v63.width = v25;
            v63.height = v26;
            NSStringFromCGSize(v63);
            double v33 = (char *)(id)objc_claimAutoreleasedReturnValue();
            v64.width = v13;
            v64.height = v15;
            double v34 = NSStringFromCGSize(v64);
            *(_DWORD *)buf = 138412802;
            v56 = v33;
            __int16 v57 = 2048;
            double v58 = v31;
            __int16 v59 = 2112;
            v60 = v34;
            _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by a factor of %f to fill minimum (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v65.width = v25;
          v65.height = v26;
          v35 = NSStringFromCGSize(v65);
          v66.width = v13;
          v66.height = v15;
          CGSize v54 = NSStringFromCGSize(v66);
          double v53 = v31;
          CGSize v52 = v35;
          _CKLog();
        }
        id v36 = objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", v52, *(void *)&v53, v54);
        [v36 scale];
        double v38 = v37;

        id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:scale:orientation:", v19, objc_msgSend(v17, "imageOrientation"), v38 / v31);
        [v6 size];
        double v8 = v39;
        double v10 = v40;
      }
      else
      {
        id v6 = v17;
      }
    }
    v43 = +[CKUIBehavior sharedBehaviors];
    objc_msgSend(v43, "thumbnailFillSizeForWidth:imageSize:", a4, v8, v10);
    double v45 = v44;
    double v47 = v46;

    double v48 = fmin(v8, v45);
    double v49 = fmin(v10, v47);
    if (CKMainScreenScale_once_6 != -1) {
      dispatch_once(&CKMainScreenScale_once_6, &__block_literal_global_10);
    }
    if (*(double *)&CKMainScreenScale_sMainScreenScale_6 == 0.0) {
      double v50 = 1.0;
    }
    else {
      double v50 = *(double *)&CKMainScreenScale_sMainScreenScale_6;
    }
    v67.width = v48;
    v67.height = v49;
    UIGraphicsBeginImageContextWithOptions(v67, 0, 0.0);
    objc_msgSend(v6, "drawAtPoint:", 1.0 / v50 * (*MEMORY[0x1E4F1DAD8] * v50 + floor((v48 * v50 - v8 * v50) * 0.5)), 1.0 / v50 * (*(double *)(MEMORY[0x1E4F1DAD8] + 8) * v50 + floor((v49 * v50 - v10 * v50) * 0.5)));
    v42 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v56 = "-[CKAnimatedImageAttachmentItem generatePreviewFromThumbnail:width:]";
        _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_DEBUG, "passed %s a nil thumbnail", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    v42 = 0;
    id v6 = 0;
  }

  return v42;
}

+ (BOOL)shouldScaleUpPreview
{
  return 1;
}

- (NSURL)animatedPreviewURL
{
  return self->_animatedPreviewURL;
}

- (void)setAnimatedPreviewURL:(id)a3
{
}

- (CGSize)imageSize
{
  objc_copyStruct(v4, &self->_imageSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_imageSize, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
}

@end