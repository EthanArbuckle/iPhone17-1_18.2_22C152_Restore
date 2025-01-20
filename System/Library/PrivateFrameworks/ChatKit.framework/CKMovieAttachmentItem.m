@interface CKMovieAttachmentItem
+ (id)UTITypes;
- (BOOL)isIrisAsset;
- (BOOL)isJellyfishVideo;
- (CGSize)_defaultSize;
- (CGSize)size;
- (id)_generateThumbnailFillToSize:(CGSize)a3;
- (id)previewItemTitle;
- (void)generatePreviewWithCompletion:(id)a3;
@end

@implementation CKMovieAttachmentItem

- (BOOL)isJellyfishVideo
{
  v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  v4 = [(CKAttachmentItem *)self transferGUID];
  v5 = [v3 transferForGUID:v4];

  v6 = [v5 attributionInfo];
  v7 = [v6 objectForKey:*MEMORY[0x1E4F6D3E0]];
  if (v7)
  {
    v8 = IMBalloonExtensionIDWithSuffix();
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)UTITypes
{
  v2 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_241];
  v4 = [v2 objectsAtIndexes:v3];

  return v4;
}

BOOL __33__CKMovieAttachmentItem_UTITypes__block_invoke(int a1, CFStringRef inUTI)
{
  return UTTypeConformsTo(inUTI, (CFStringRef)*MEMORY[0x1E4F22660]) != 0;
}

- (void)generatePreviewWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() previewCache];
  v6 = CKAttachmentPreviewCacheKey(self);
  v7 = +[CKUIBehavior sharedBehaviors];
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 previewMaxWidth];
  double v10 = v9;
  [(CKMovieAttachmentItem *)self size];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", v10, v11, v12);
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  if (([v5 isGeneratingPreviewForKey:v6] & 1) == 0)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke;
    v22[3] = &unk_1E5623A10;
    v22[4] = self;
    v22[5] = v14;
    v22[6] = v16;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_2;
    v17[3] = &unk_1E5622F40;
    id v18 = v5;
    id v19 = v6;
    v20 = self;
    id v21 = v4;
    [v18 enqueueGenerationBlock:v22 completion:v17 withPriority:1 forKey:v19];
  }
}

uint64_t __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_generateThumbnailFillToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_2(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_3;
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

void __55__CKMovieAttachmentItem_generatePreviewWithCompletion___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  id v4 = v2;
  if (v2)
  {
    [*(id *)(a1 + 48) _savePreview:v2];
    id v2 = v4;
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v2);
    id v2 = v4;
  }
}

- (id)_generateThumbnailFillToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = MEMORY[0x192FBA870]("kCMTimeZero", @"CoreMedia");
  long long v83 = *(_OWORD *)v6;
  uint64_t v84 = *(void *)(v6 + 16);
  [(CKMovieAttachmentItem *)self size];
  double v8 = v7;
  double v10 = v9;
  double v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 scale];
  double v13 = v12;

  double v14 = width * v13 / v8;
  if (v8 == 0.0) {
    double v14 = 0.0;
  }
  double v15 = height * v13 / v10;
  if (v10 == 0.0) {
    double v15 = 0.0;
  }
  double v16 = fmax(v14, v15);
  double v17 = ceil(v8 * v16);
  double v18 = ceil(v10 * v16);
  id v19 = [(CKAttachmentItem *)self fileURL];
  v20 = CKAVURLAssetForURL(v19);

  id v21 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v20];
  [v21 setAppliesPreferredTrackTransform:1];
  objc_msgSend(v21, "setMaximumSize:", v17, v18);
  long long v81 = v83;
  uint64_t v82 = v84;
  v22 = (CGImage *)[v21 copyCGImageAtTime:&v81 actualTime:0 error:0];
  if (v22)
  {
    v23 = v22;
    double v24 = (double)CGImageGetWidth(v22);
    size_t v25 = CGImageGetHeight(v23);
    double v26 = 1.0 / v13 * v24;
    double v27 = 1.0 / v13 * (double)v25;
    if (v26 == width && v27 == height)
    {
      v45 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:scale:orientation:", v23, objc_msgSend(0, "imageOrientation"), v13);
      double v39 = *MEMORY[0x1E4F1DAD8];
      double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else
    {
      double v29 = width / v26;
      if (v26 == 0.0) {
        double v29 = 0.0;
      }
      if (v27 == 0.0) {
        double v30 = 0.0;
      }
      else {
        double v30 = height / v27;
      }
      double v31 = fmax(v29, v30);
      if (CKMainScreenScale_once_93 != -1) {
        dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
      }
      double v32 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
        double v32 = 1.0;
      }
      double v33 = ceil(v31 * v32) / v32;
      v34 = [MEMORY[0x1E4F42D90] mainScreen];
      [v34 scale];
      double v36 = v35 / v33;

      v37 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:v23 scale:0 orientation:v36];
      v86.double width = width;
      v86.double height = height;
      UIGraphicsBeginImageContextWithOptions(v86, 0, 0.0);
      double v39 = *MEMORY[0x1E4F1DAD8];
      double v38 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v37 size];
      double v41 = v40;
      double v43 = v42;
      if (CKMainScreenScale_once_93 != -1) {
        dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
      }
      double v44 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
        double v44 = 1.0;
      }
      objc_msgSend(v37, "drawAtPoint:", 1.0 / v44 * (v39 * v44 + floor((width * v44 - v41 * v44) * 0.5)), 1.0 / v44 * (v38 * v44 + floor((height * v44 - v43 * v44) * 0.5)));
      v45 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
    v47 = +[CKUIBehavior sharedBehaviors];
    v48 = [v47 playButtonImage];
    v49 = [v47 playButtonArrowImage];
    int v50 = [v47 playButtonPunchesOutArrow];
    uint64_t v51 = [v47 playButtonBackdropStyle];
    v87.double width = width;
    v87.double height = height;
    UIGraphicsBeginImageContextWithOptions(v87, 0, 0.0);
    [v48 size];
    double v53 = v52;
    double v55 = v54;
    if (CKMainScreenScale_once_93 != -1) {
      dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
    }
    double v56 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
      double v56 = 1.0;
    }
    double v79 = v39;
    double v80 = v38;
    double v57 = v39 * v56 + floor((width * v56 - v53 * v56) * 0.5);
    double v58 = v38 * v56 + floor((height * v56 - v55 * v56) * 0.5);
    double v59 = 1.0 / v56;
    double v60 = v59 * v57;
    double v61 = v59 * v58;
    [v49 size];
    double v63 = v62;
    double v65 = v64;
    if (CKMainScreenScale_once_93 != -1) {
      dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
    }
    if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
      double v66 = 1.0;
    }
    else {
      double v66 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
    }
    double v67 = v63 * v66;
    double v68 = v65 * v66;
    double v69 = 1.0 / v66;
    objc_msgSend(v48, "drawAtPoint:", v60, v61);
    if (v50) {
      objc_msgSend(v49, "drawAtPoint:blendMode:alpha:", 23, v69 * (v79 * v66 + floor((width * v66 - v67) * 0.5)), v69 * (v80 * v66 + floor((height * v66 - v68) * 0.5)), 1.0);
    }
    v70 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v71 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v51 graphicsQuality:100];
    [v71 setGrayscaleTintMaskImage:v70];
    [v71 setColorTintMaskImage:v70];
    [v71 setFilterMaskImage:v70];
    v72 = [v45 _applyBackdropViewSettings:v71];

    v88.double width = width;
    v88.double height = height;
    UIGraphicsBeginImageContextWithOptions(v88, 0, 0.0);
    if (CKMainScreenScale_once_93 != -1) {
      dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
    }
    double v73 = v67 * v69;
    double v74 = v68 * v69;
    double v75 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
      double v75 = 1.0;
    }
    objc_msgSend(v72, "drawInRect:", 1.0 / v75 * (v79 * v75 + floor((width * v75 - width * v75) * 0.5)), 1.0 / v75 * (v80 * v75 + floor((height * v75 - height * v75) * 0.5)), width * v75 * (1.0 / v75), height * v75 * (1.0 / v75));
    if (v50)
    {
      if (CKMainScreenScale_once_93 != -1) {
        dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
      }
      double v76 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
        double v76 = 1.0;
      }
      objc_msgSend(v49, "drawInRect:blendMode:alpha:", 26, 1.0 / v76 * (v79 * v76 + floor((width * v76 - v73 * v76) * 0.5)), 1.0 / v76 * (v80 * v76 + floor((height * v76 - v74 * v76) * 0.5)), v73 * v76 * (1.0 / v76), v74 * v76 * (1.0 / v76), 0.4);
    }
    else
    {
      if (CKMainScreenScale_once_93 != -1) {
        dispatch_once(&CKMainScreenScale_once_93, &__block_literal_global_68_0);
      }
      double v77 = *(double *)&CKMainScreenScale_sMainScreenScale_93;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_93 == 0.0) {
        double v77 = 1.0;
      }
      objc_msgSend(v49, "drawInRect:", 1.0 / v77 * (v79 * v77 + floor((width * v77 - v73 * v77) * 0.5)), 1.0 / v77 * (v80 * v77 + floor((height * v77 - v74 * v77) * 0.5)), v73 * v77 * (1.0 / v77), v74 * v77 * (1.0 / v77));
    }
    v46 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    CFRelease(v23);
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (CGSize)size
{
  p_size = &self->super._size;
  double width = self->super._size.width;
  double height = self->super._size.height;
  double v6 = *MEMORY[0x1E4F1DB30];
  double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (width == *MEMORY[0x1E4F1DB30] && height == v7)
  {
    double v9 = [(CKAttachmentItem *)self fileURL];
    double v10 = CKAVURLAssetForURL(v9);

    double v11 = [v10 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
    if ([v11 count])
    {
      double v12 = [v11 firstObject];
      CGFloat v13 = *MEMORY[0x1E4F1DAD8];
      CGFloat v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [v12 naturalSize];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      if (v12) {
        [v12 preferredTransform];
      }
      else {
        memset(&v20, 0, sizeof(v20));
      }
      v22.origin.x = v13;
      v22.origin.y = v14;
      v22.size.double width = v16;
      v22.size.double height = v18;
      CGRect v23 = CGRectApplyAffineTransform(v22, &v20);
      p_size->double width = v23.size.width;
      p_size->double height = v23.size.height;
    }
    double width = p_size->width;
    double height = p_size->height;
  }
  if (width == v6 && height == v7)
  {
    [(CKMovieAttachmentItem *)self _defaultSize];
    p_size->double width = width;
    p_size->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_defaultSize
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)isIrisAsset
{
  return 0;
}

- (id)previewItemTitle
{
  if ([(CKMovieAttachmentItem *)self isJellyfishVideo])
  {
    double v3 = CKFrameworkBundle();
    id v4 = v3;
    v5 = @"ANIMOJI";
  }
  else
  {
    double v6 = [(CKAttachmentItem *)self fileURL];
    double v7 = [v6 lastPathComponent];
    int v8 = [v7 isEqualToString:@"Video Message.mov"];

    double v3 = CKFrameworkBundle();
    id v4 = v3;
    if (v8) {
      v5 = @"PREVIEW_TITLE_VIDEO_MESSAGE";
    }
    else {
      v5 = @"PREVIEW_TITLE_VIDEO";
    }
  }
  double v9 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v9;
}

@end