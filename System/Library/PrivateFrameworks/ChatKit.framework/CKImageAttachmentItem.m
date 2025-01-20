@interface CKImageAttachmentItem
+ (id)UTITypes;
- (BOOL)backgroundEnqueued;
- (BOOL)useDefaultSize;
- (CGSize)_calculateImageSize;
- (CGSize)imageSize;
- (CGSize)size;
- (id)_newImageData;
- (id)imageData;
- (void)generatePreviewWithCompletion:(id)a3;
- (void)setBackgroundEnqueued:(BOOL)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setUseDefaultSize:(BOOL)a3;
- (void)startDeferredSetup;
@end

@implementation CKImageAttachmentItem

+ (id)UTITypes
{
  CFArrayRef v2 = CGImageSourceCopyTypeIdentifiers();

  return v2;
}

- (id)_newImageData
{
  id v3 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  v4 = [(CKAttachmentItem *)self fileURL];
  v5 = (void *)[v3 initWithContentsOfURL:v4 options:1 error:0];

  if (v5) {
    v6 = [[CKImageData alloc] initWithData:v5];
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)imageData
{
  id v2 = [(CKImageAttachmentItem *)self _newImageData];

  return v2;
}

- (CGSize)size
{
  [(CKImageAttachmentItem *)self imageSize];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if ([(CKImageAttachmentItem *)self backgroundEnqueued])
    {
      [(CKImageAttachmentItem *)self setUseDefaultSize:1];
    }
    else
    {
      [(CKImageAttachmentItem *)self _calculateImageSize];
      -[CKImageAttachmentItem setImageSize:](self, "setImageSize:");
    }
  }
  if ([(CKImageAttachmentItem *)self useDefaultSize])
  {
    double v6 = 100.0;
    double v7 = 100.0;
  }
  else
  {
    [(CKImageAttachmentItem *)self imageSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)startDeferredSetup
{
  [(CKImageAttachmentItem *)self imageSize];
  if (v4 == *MEMORY[0x1E4F1DB30]
    && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8)
    && ![(CKImageAttachmentItem *)self backgroundEnqueued])
  {
    [(CKImageAttachmentItem *)self setBackgroundEnqueued:1];
    double v6 = [(id)objc_opt_class() previewSizingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__CKImageAttachmentItem_startDeferredSetup__block_invoke;
    v7[3] = &unk_1E5620C40;
    v7[4] = self;
    [v6 addBlock:v7 withQueuePriority:1];
  }
}

uint64_t __43__CKImageAttachmentItem_startDeferredSetup__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [v1 _calculateImageSize];

  return objc_msgSend(v1, "setImageSize:");
}

- (CGSize)_calculateImageSize
{
  double v3 = [(CKAttachmentItem *)self cachedPreview];
  double v4 = v3;
  if (v3)
  {
    [v3 size];
    double v6 = v5;
    double v8 = v7;
    id v9 = [MEMORY[0x1E4F42D90] mainScreen];
    [v9 scale];
    double v11 = v6 * v10;
    double v12 = v8 * v10;
  }
  else
  {
    id v9 = [(CKImageAttachmentItem *)self _newImageData];
    [v9 pxSize];
    double v11 = v13;
    double v12 = v14;
  }

  if (v11 == *MEMORY[0x1E4F1DB30] && v12 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    double v11 = 50.0;
    double v12 = 50.0;
  }

  double v15 = v11;
  double v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(id)objc_opt_class() previewCache];
  double v6 = CKAttachmentPreviewCacheKey(self);
  double v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = +[CKUIBehavior sharedBehaviors];
  [v8 previewMaxWidth];
  double v10 = v9;
  [(CKImageAttachmentItem *)self size];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (([v5 isGeneratingPreviewForKey:v6] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v6;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Queue Generate preview for: %@", buf, 0xCu);
      }
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v23[3] = &unk_1E5623A10;
    v23[4] = self;
    v23[5] = v14;
    v23[6] = v16;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_41;
    v18[3] = &unk_1E5622F40;
    id v19 = v5;
    id v20 = v6;
    v21 = self;
    id v22 = v4;
    [v19 enqueueGenerationBlock:v23 completion:v18 withPriority:1 forKey:v20];
  }
}

id __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Run generation block for %@", (uint8_t *)&v31, 0xCu);
    }
  }
  double v5 = (void *)[*(id *)(a1 + 32) _newImageData];
  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "backing image data: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  double v7 = objc_msgSend(v5, "thumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      id v32 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "thumbnail: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  [v7 size];
  if (v7)
  {
    double v11 = *(double *)(a1 + 40);
    double v12 = *(double *)(a1 + 48);
    if (v11 != v9 || v12 != v10)
    {
      if (v9 == 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = v11 / v9;
      }
      if (v10 == 0.0) {
        double v14 = 0.0;
      }
      else {
        double v14 = v12 / v10;
      }
      if (CKMainScreenScale_once_31 != -1) {
        dispatch_once(&CKMainScreenScale_once_31, &__block_literal_global_73);
      }
      if (*(double *)&CKMainScreenScale_sMainScreenScale_31 == 0.0) {
        double v15 = 1.0;
      }
      else {
        double v15 = *(double *)&CKMainScreenScale_sMainScreenScale_31;
      }
      uint64_t v16 = [MEMORY[0x1E4F42D90] mainScreen];
      [v16 scale];
      double v18 = v17;

      id v19 = objc_alloc(MEMORY[0x1E4F42A80]);
      id v20 = v7;
      v21 = objc_msgSend(v19, "initWithCGImage:scale:orientation:", objc_msgSend(v20, "CGImage"), objc_msgSend(v20, "imageOrientation"), v18 / (ceil(fmax(v13, v14) * v15) / v15));
      v35.width = v11;
      v35.height = v12;
      UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
      [v21 size];
      double v23 = v22;
      double v25 = v24;
      double v26 = *MEMORY[0x1E4F1DAD8];
      double v27 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (CKMainScreenScale_once_31 != -1) {
        dispatch_once(&CKMainScreenScale_once_31, &__block_literal_global_73);
      }
      double v28 = *(double *)&CKMainScreenScale_sMainScreenScale_31;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_31 == 0.0) {
        double v28 = 1.0;
      }
      objc_msgSend(v21, "drawAtPoint:", 1.0 / v28 * (v26 * v28 + floor((v11 * v28 - v23 * v28) * 0.5)), 1.0 / v28 * (v27 * v28 + floor((v12 * v28 - v25 * v28) * 0.5)));
      double v7 = UIGraphicsGetImageFromCurrentImageContext();

      UIGraphicsEndImageContext();
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v31 = 138412290;
          id v32 = v7;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "crop/resize: %@", (uint8_t *)&v31, 0xCu);
        }
      }
    }
  }

  return v7;
}

void __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_41(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5622F40;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __55__CKImageAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v9 = (id)v2;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = [v9 image];
      id v4 = [v3 images];
      uint64_t v5 = [v4 firstObject];

      id v6 = (id)v5;
    }
    else
    {
      id v6 = v9;
    }
    id v10 = v6;
    objc_msgSend(*(id *)(a1 + 48), "_savePreview:");
  }
  else
  {
    id v10 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = v10;
  if (v7)
  {
    (*(void (**)(void))(v7 + 16))();
    uint64_t v8 = v10;
  }
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

- (BOOL)backgroundEnqueued
{
  return self->_backgroundEnqueued;
}

- (void)setBackgroundEnqueued:(BOOL)a3
{
  self->_backgroundEnqueued = a3;
}

- (BOOL)useDefaultSize
{
  return self->_useDefaultSize;
}

- (void)setUseDefaultSize:(BOOL)a3
{
  self->_useDefaultSize = a3;
}

@end