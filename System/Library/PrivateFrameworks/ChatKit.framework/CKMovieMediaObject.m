@interface CKMovieMediaObject
+ (BOOL)isPreviewable;
+ (CGImage)playButtonPreviewForCGImage:(CGImage *)a3 scale:(double)a4 isFromMe:(BOOL)a5;
+ (Class)__ck_attachmentItemClass;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
+ (id)playButtonPreviewForUIImage:(id)a3 scale:(double)a4 contentAlignmentInsets:(UIEdgeInsets)a5;
- (AVURLAsset)asset;
- (BOOL)_assetContainsMetadataKey:(id)a3;
- (BOOL)allowAutoplay;
- (BOOL)canExport;
- (BOOL)checkedVideoInfo;
- (BOOL)hasNoVideoTrack;
- (BOOL)hasVideoTrack;
- (BOOL)isAutoloopVideo;
- (BOOL)isAutoloopVideoInitialized;
- (BOOL)isJellyfishInitialized;
- (BOOL)isJellyfishVideo;
- (BOOL)isPhotosCompatible;
- (BOOL)supportsUnknownSenderPreview;
- (BOOL)validatePreviewFormat;
- (CGSize)bbSize;
- (CGSize)pxSize;
- (Class)balloonViewClass;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (UIImage)thumbnail;
- (id)attachmentSummary:(unint64_t)a3;
- (id)bbPreviewFillToSize:(CGSize)a3;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)metricsCollectorMediaType;
- (id)previewCacheKeyWithOrientation:(char)a3;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewItemTitle;
- (int)mediaType;
- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4;
- (void)setAsset:(id)a3;
- (void)setCheckedVideoInfo:(BOOL)a3;
- (void)setHasVideoTrack:(BOOL)a3;
- (void)setIsAutoloopVideo:(BOOL)a3;
- (void)setIsAutoloopVideoInitialized:(BOOL)a3;
- (void)setIsJellyfishInitialized:(BOOL)a3;
- (void)setIsJellyfishVideo:(BOOL)a3;
- (void)setPxSize:(CGSize)a3;
- (void)setThumbnail:(id)a3;
- (void)updateVideoInfo;
@end

@implementation CKMovieMediaObject

+ (id)UTITypes
{
  if (UTITypes_onceToken != -1) {
    dispatch_once(&UTITypes_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)UTITypes_types;

  return v2;
}

void __30__CKMovieMediaObject_UTITypes__block_invoke()
{
  id v3 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v0 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_73];
  uint64_t v1 = [v3 objectsAtIndexes:v0];
  v2 = (void *)UTITypes_types;
  UTITypes_types = v1;
}

uint64_t __30__CKMovieMediaObject_UTITypes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  uint64_t v3 = [v2 conformsToType:*MEMORY[0x1E4F44448]];

  return v3;
}

- (id)metricsCollectorMediaType
{
  BOOL v2 = [(CKMovieMediaObject *)self isAutoloopVideo];
  uint64_t v3 = (void **)MEMORY[0x1E4F6D968];
  if (!v2) {
    uint64_t v3 = (void **)MEMORY[0x1E4F6D998];
  }
  v4 = *v3;

  return v4;
}

+ (id)fallbackFilenamePrefix
{
  return @"MOV";
}

- (id)attachmentSummary:(unint64_t)a3
{
  if ([(CKMovieMediaObject *)self isJellyfishVideo])
  {
    v5 = NSString;
    v6 = IMSharedUtilitiesFrameworkBundle();
    v7 = v6;
    v8 = @"%lu Animoji";
  }
  else
  {
    v9 = [(CKMediaObject *)self filename];
    int v10 = [v9 isEqualToString:@"Video Message.mov"];

    v5 = NSString;
    v6 = IMSharedUtilitiesFrameworkBundle();
    v7 = v6;
    if (v10) {
      v8 = @"%lu Video Messages";
    }
    else {
      v8 = @"%lu Videos";
    }
  }
  v11 = [v6 localizedStringForKey:v8 value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v12 = objc_msgSend(v5, "localizedStringWithFormat:", v11, a3);

  return v12;
}

- (int)mediaType
{
  return 2;
}

- (BOOL)isAutoloopVideo
{
  if (![(CKMovieMediaObject *)self isAutoloopVideoInitialized])
  {
    [(CKMovieMediaObject *)self setIsAutoloopVideoInitialized:1];
    if ([(CKMovieMediaObject *)self isJellyfishVideo])
    {
      self->_isAutoloopVideo = 1;
    }
    else
    {
      id location = 0;
      objc_initWeak(&location, self);
      uint64_t v3 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __37__CKMovieMediaObject_isAutoloopVideo__block_invoke;
      block[3] = &unk_1E5623328;
      block[4] = self;
      objc_copyWeak(&v6, &location);
      dispatch_async(v3, block);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
  return self->_isAutoloopVideo;
}

void __37__CKMovieMediaObject_isAutoloopVideo__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [*(id *)(a1 + 32) asset];
  if (v2)
  {
    id v19 = 0;
    id v20 = 0;
    int v3 = [MEMORY[0x1E4F8CE38] readMetadataType:4 fromAVAsset:v2 value:&v20 error:&v19];
    id v4 = v20;
    id v5 = v19;
    if (v4) {
      int v6 = v3;
    }
    else {
      int v6 = 0;
    }
    if (v6 == 1)
    {
      int v7 = [v4 intValue];
      if (v7 != 3)
      {
        if (v7) {
          goto LABEL_18;
        }
      }
    }
  }
  else
  {
    id v4 = 0;
    id v5 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = [*(id *)(a1 + 32) asset];
      *(_DWORD *)buf = 138412802;
      id v22 = v4;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      v26 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "Failed to load video playback style {styleIdentifier: %@, error: %@, asset: %@}", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v15 = [*(id *)(a1 + 32) asset];
    _CKLog();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v11 = [WeakRetained _assetContainsMetadataKey:@"LOOP"];

  if ((v11 & 1) == 0)
  {
    id v14 = objc_loadWeakRetained((id *)(a1 + 40));
    char v12 = [v14 _assetContainsMetadataKey:@"GREY"];

    char v13 = v12;
    goto LABEL_20;
  }
LABEL_18:
  char v12 = 0;
  char v13 = 1;
LABEL_20:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CKMovieMediaObject_isAutoloopVideo__block_invoke_104;
  block[3] = &unk_1E5623BB0;
  block[4] = *(void *)(a1 + 32);
  char v17 = v13;
  char v18 = v12;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __37__CKMovieMediaObject_isAutoloopVideo__block_invoke_104(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 185) != v2)
  {
    *(unsigned char *)(v1 + 185) = v2;
    *(unsigned char *)(*(void *)(result + 32) + 186) = *(unsigned char *)(result + 41);
    return [*(id *)(result + 32) postPreviewDidChangeNotifications];
  }
  return result;
}

- (BOOL)isJellyfishVideo
{
  if (![(CKMovieMediaObject *)self isJellyfishInitialized])
  {
    int v3 = [(CKMediaObject *)self transfer];
    id v4 = [v3 attributionInfo];

    id v5 = [v4 objectForKey:*MEMORY[0x1E4F6D3E0]];
    if (v5)
    {
      int v6 = IMBalloonExtensionIDWithSuffix();
      self->_isJellyfishVideo = [v5 isEqualToString:v6];
    }
  }
  return self->_isJellyfishVideo;
}

- (BOOL)_assetContainsMetadataKey:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6E5F0];
  id v5 = a3;
  int v6 = [(CKMovieMediaObject *)self asset];
  LOBYTE(v4) = [v4 asset:v6 containsMetadataKey:v5];

  return (char)v4;
}

- (BOOL)supportsUnknownSenderPreview
{
  return 1;
}

- (BOOL)allowAutoplay
{
  int v3 = [(CKMediaObject *)self messageContext];
  char v4 = [v3 isFromMe];

  if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v6 = [(CKMediaObject *)self messageContext];
    int v5 = [v6 isSpam] ^ 1;
  }
  return v5;
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  return CKOrientedPreviewCacheKey(self, a3);
}

- (Class)balloonViewClass
{
  if ([(CKMovieMediaObject *)self isAutoloopVideo])
  {
    int v3 = [(CKMediaObject *)self transfer];
    if ([v3 isFileDataReady])
    {
      BOOL v4 = [(CKMediaObject *)self transcoderPreviewGenerationFailed];

      if (!v4)
      {
        int v5 = [(CKMovieMediaObject *)self previewBalloonViewClass];
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)CKMovieMediaObject;
  int v5 = [(CKMediaObject *)&v7 balloonViewClass];
LABEL_7:

  return (Class)v5;
}

- (Class)previewBalloonViewClass
{
  if (![(CKMovieMediaObject *)self allowAutoplay]
    || ![(CKMovieMediaObject *)self isAutoloopVideo]
    || !+[CKAutoloopMovieBalloonView isEnabled])
  {
    CKIsRunningInMacCatalyst();
  }
  int v3 = objc_opt_class();

  return (Class)v3;
}

- (Class)replyContextBalloonViewClass
{
  if ([(CKMovieMediaObject *)self allowAutoplay]
    && [(CKMovieMediaObject *)self isAutoloopVideo])
  {
    +[CKAutoloopMovieBalloonView isEnabled];
  }
  int v3 = objc_opt_class();

  return (Class)v3;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  if ([(CKMovieMediaObject *)self hasNoVideoTrack])
  {
    objc_super v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKMovieMediaObject;
    objc_super v7 = [(CKMediaObject *)&v9 previewForWidth:v4 orientation:a3];
  }

  return v7;
}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  v4.receiver = self;
  v4.super_class = (Class)CKMovieMediaObject;
  [(CKMediaObject *)&v4 prewarmPreviewForWidth:a4 orientation:a3];
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  id v5 = a3;

  return v5;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  [(CKMovieMediaObject *)self pxSize];
  double v8 = v7;
  double v10 = v9;
  char v11 = [MEMORY[0x1E4F42D90] mainScreen];
  [v11 scale];
  double v13 = 1.0 / v12;
  double v14 = v8 * v13;
  double v15 = v10 * v13;

  v16 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v16, "thumbnailFillSizeForWidth:imageSize:", a3, v14, v15);
  double v18 = v17;
  double v20 = v19;

  v21 = +[CKUIBehavior sharedBehaviors];
  [v21 thumbnailContentAlignmentInsetsForOrientation:v4];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  return -[CKMovieMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v18, v20, v23, v25, v27, v29);
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double bottom = a4.bottom;
  double right = a4.right;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = MEMORY[0x192FBA870]("kCMTimeZero", @"CoreMedia");
  long long v57 = *(_OWORD *)v9;
  uint64_t v58 = *(void *)(v9 + 16);
  [(CKMovieMediaObject *)self pxSize];
  double v11 = v10;
  double v13 = v12;
  uint64_t v53 = 0;
  v54 = (double *)&v53;
  uint64_t v55 = 0x2020000000;
  uint64_t v56 = 0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    double v14 = [MEMORY[0x1E4F42D90] mainScreen];
    [v14 scale];
    *((void *)v54 + 3) = v15;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__CKMovieMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke;
    block[3] = &unk_1E5620B90;
    block[4] = &v53;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
  double v16 = v54[3];
  double v17 = width * v16;
  double v18 = height * v16;
  double v19 = v17 / v11;
  if (v11 == 0.0) {
    double v20 = 0.0;
  }
  else {
    double v20 = v19;
  }
  double v21 = v18 / v13;
  if (v13 == 0.0) {
    double v22 = 0.0;
  }
  else {
    double v22 = v21;
  }
  double v23 = [(CKMovieMediaObject *)self thumbnail];
  double v24 = v23;
  if (v23)
  {
    double v25 = (void *)[v23 CGImage];
    CFRetain(v25);
  }
  else
  {
    double v26 = [(CKMovieMediaObject *)self asset];
    double v27 = [MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v26];
    [v27 setAppliesPreferredTrackTransform:1];
    double v28 = fmax(v20, v22);
    objc_msgSend(v27, "setMaximumSize:", ceil(v11 * v28), ceil(v13 * v28));
    *(_OWORD *)buf = v57;
    *(void *)&buf[16] = v58;
    double v25 = (void *)[v27 copyCGImageAtTime:buf actualTime:0 error:0];
  }
  if (v25)
  {
    double v29 = v54[3];
    size_t v30 = CGImageGetWidth((CGImageRef)v25);
    size_t v31 = CGImageGetHeight((CGImageRef)v25);
    double v32 = v54[3];
    if ([(id)objc_opt_class() shouldScaleUpPreview])
    {
      double v33 = 1.0 / v32 * (double)v30;
      double v34 = 1.0 / v32 * (double)v31;
      if (v33 + 1.0 < width || v34 + 1.0 < height)
      {
        double v36 = width / v33;
        double v37 = 0.0;
        if (v33 == 0.0) {
          double v36 = 0.0;
        }
        if (v34 != 0.0) {
          double v37 = height / v34;
        }
        double v38 = fmax(v36, v37);
        double v39 = v54[3];
        double v40 = v39 / v38;
        double v41 = v39 * 0.5;
        if (v40 >= v41) {
          double v29 = v40;
        }
        else {
          double v29 = v41;
        }
        if (IMOSLoggingEnabled())
        {
          CKLogCStringForType(2);
          v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v63.double width = v33;
            v63.double height = v34;
            NSStringFromCGSize(v63);
            id v43 = (id)objc_claimAutoreleasedReturnValue();
            v64.double width = width;
            v64.double height = height;
            v44 = NSStringFromCGSize(v64);
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v43;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v29;
            *(_WORD *)&buf[22] = 2112;
            v60 = v44;
            _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_DEBUG, "Scale thumbnail of size (%@) by with image scale %f to try to fill target (%@)", buf, 0x20u);
          }
        }
        if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        {
          v65.double width = v33;
          v65.double height = v34;
          v45 = NSStringFromCGSize(v65);
          v66.double width = width;
          v66.double height = height;
          v49 = NSStringFromCGSize(v66);
          _CKLog();
        }
      }
    }
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:scale:orientation:", v25, objc_msgSend(v24, "imageOrientation"), v29);

    if (![(CKMovieMediaObject *)self isJellyfishVideo]
      && ![(CKMovieMediaObject *)self isAutoloopVideo])
    {
      uint64_t v47 = objc_msgSend((id)objc_opt_class(), "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v46, v54[3], top, left, bottom, right);

      v46 = (void *)v47;
    }
    CFRelease(v25);
    double v24 = v46;
  }
  _Block_object_dispose(&v53, 8);

  return v24;
}

void __73__CKMovieMediaObject_generateThumbnailFillToSize_contentAlignmentInsets___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 scale];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v2;
}

+ (CGImage)playButtonPreviewForCGImage:(CGImage *)a3 scale:(double)a4 isFromMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v9 = +[CKUIBehavior sharedBehaviors];
  [v9 thumbnailContentAlignmentInsetsForOrientation:v5];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = [MEMORY[0x1E4F42A80] imageWithCGImage:a3 scale:0 orientation:a4];
  double v19 = objc_msgSend(a1, "playButtonPreviewForUIImage:scale:contentAlignmentInsets:", v18, a4, v11, v13, v15, v17);

  id v20 = v19;
  double v21 = (CGImage *)[v20 CGImage];

  return v21;
}

+ (id)playButtonPreviewForUIImage:(id)a3 scale:(double)a4 contentAlignmentInsets:(UIEdgeInsets)a5
{
  CGFloat right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v10 = a3;
  double v11 = +[CKUIBehavior sharedBehaviors];
  double v12 = [v11 playButtonImage];
  double v13 = [v11 playButtonArrowImage];
  int v14 = [v11 playButtonPunchesOutArrow];
  uint64_t v15 = [v11 playButtonBackdropStyle];
  [v12 size];
  double v17 = v16;
  double v19 = v18;
  id v20 = +[CKUIBehavior sharedBehaviors];
  [v20 minimumPlayButtonInsets];
  double v23 = v17 + v21 + v22;
  double v26 = v19 + v24 + v25;

  double v27 = +[CKUIBehavior sharedBehaviors];
  [v27 balloonMaskTailSizeForTailShape:1];
  double v29 = v28;

  [v10 size];
  if (v31 < v23 + v29 * 2.0 || v30 < v26)
  {
    id v33 = v10;
    double v34 = v33;
  }
  else
  {
    [v10 size];
    UIGraphicsBeginImageContextWithOptions(v72, 0, a4);
    double v35 = *MEMORY[0x1E4F1DAD8];
    double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v10 size];
    double v68 = v36;
    double v69 = v35;
    double v37 = right;
    double v38 = top + v36;
    double v64 = top + v36;
    double v40 = v39 - (left + v37);
    double v65 = left + v35;
    double v42 = v41 - (top + bottom);
    [v12 size];
    double v44 = v43;
    double v46 = v45;
    [v12 scale];
    double v48 = v47 / a4;
    double v49 = v44 * v48;
    double v50 = v46 * v48;
    double v66 = v38 + floor((v42 - v46 * v48) * 0.5);
    double v67 = v65 + floor((v40 - v44 * v48) * 0.5);
    [v13 size];
    double v52 = v51;
    double v54 = v53;
    [v12 scale];
    double scale = a4;
    double v56 = v55 / a4;
    double v57 = v52 * v56;
    double v58 = v54 * v56;
    double v59 = v65 + floor((v40 - v57) * 0.5);
    double v60 = v64 + floor((v42 - v58) * 0.5);
    objc_msgSend(v12, "drawInRect:", v67, v66, v49, v50);
    if (v14) {
      objc_msgSend(v13, "drawInRect:blendMode:alpha:", 23, v59, v60, v57, v58, 1.0);
    }
    uint64_t v61 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    v62 = [MEMORY[0x1E4F430B0] settingsForPrivateStyle:v15 graphicsQuality:100];
    [v62 setGrayscaleTintMaskImage:v61];
    [v62 setColorTintMaskImage:v61];
    [v62 setFilterMaskImage:v61];
    id v33 = [v10 _applyBackdropViewSettings:v62];

    [v33 size];
    UIGraphicsBeginImageContextWithOptions(v73, 0, scale);
    objc_msgSend(v33, "drawAtPoint:", v69, v68);
    if (v14) {
      objc_msgSend(v13, "drawInRect:blendMode:alpha:", 26, v59, v60, v57, v58, 0.4);
    }
    else {
      objc_msgSend(v13, "drawInRect:", v59, v60, v57, v58);
    }
    double v34 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    double v12 = (void *)v61;
  }

  return v34;
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        BOOL v5 = [(CKMediaObject *)self transferGUID];
        int v12 = 138412290;
        double v13 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);
      }
    }
    int v6 = 0;
  }
  else
  {
    double v7 = [(CKMediaObject *)self fileURL];
    double v8 = [(CKMediaObject *)self previewFilenameExtension];
    uint64_t v9 = IMAttachmentPreviewFileURL();

    int v6 = [(CKMediaObject *)self savedPreviewFromURL:v9 forOrientation:0];
    if (!v6 && IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        double v13 = v9;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (CGSize)bbSize
{
  [(CKMovieMediaObject *)self pxSize];
  double v3 = v2;
  double v5 = v4;
  int v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 scale];
  double v8 = 1.0 / v7;
  double v9 = v3 * v8;
  double v10 = v5 * v8;

  double v11 = v9;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)canExport
{
  double v3 = [(CKMediaObject *)self transfer];
  int v4 = [v3 isFileDataReady];

  if (!v4) {
    return 0;
  }
  double v5 = [(CKMediaObject *)self fileURL];
  int v6 = [v5 path];

  if (v6) {
    BOOL IsCompatibleWithSavedPhotosAlbum = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(v6);
  }
  else {
    BOOL IsCompatibleWithSavedPhotosAlbum = 0;
  }

  return IsCompatibleWithSavedPhotosAlbum;
}

- (BOOL)isPhotosCompatible
{
  return 1;
}

- (id)previewItemTitle
{
  if ([(CKMovieMediaObject *)self isJellyfishVideo])
  {
    double v3 = CKFrameworkBundle();
    int v4 = v3;
    double v5 = @"PREVIEW_TITLE_ANIMOJI";
  }
  else
  {
    int v6 = [(CKMediaObject *)self filename];
    int v7 = [v6 isEqualToString:@"Video Message.mov"];

    double v3 = CKFrameworkBundle();
    int v4 = v3;
    if (v7) {
      double v5 = @"PREVIEW_TITLE_VIDEO_MESSAGE";
    }
    else {
      double v5 = @"PREVIEW_TITLE_VIDEO";
    }
  }
  double v8 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v8;
}

- (CGSize)pxSize
{
  if (![(CKMovieMediaObject *)self checkedVideoInfo])
  {
    double v3 = [(CKMediaObject *)self transfer];
    int v4 = [v3 isFileDataReady];

    if (v4)
    {
      [(CKMovieMediaObject *)self updateVideoInfo];
      [(CKMovieMediaObject *)self setCheckedVideoInfo:1];
    }
  }
  double width = self->_pxSize.width;
  double height = self->_pxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (AVURLAsset)asset
{
  if (!self->_asset)
  {
    double v3 = [(CKMediaObject *)self transfer];
    if ([v3 isFileDataReady])
    {
      BOOL v4 = [(CKMovieMediaObject *)self hasNoVideoTrack];

      if (v4) {
        goto LABEL_6;
      }
      double v3 = [(CKMediaObject *)self fileURL];
      CKAVURLAssetForURL(v3);
      double v5 = (AVURLAsset *)objc_claimAutoreleasedReturnValue();
      asset = self->_asset;
      self->_asset = v5;
    }
  }
LABEL_6:
  int v7 = self->_asset;

  return v7;
}

- (BOOL)hasNoVideoTrack
{
  BOOL v3 = [(CKMovieMediaObject *)self checkedVideoInfo];
  if (v3) {
    LOBYTE(v3) = ![(CKMovieMediaObject *)self hasVideoTrack];
  }
  return v3;
}

- (void)updateVideoInfo
{
  BOOL v3 = [(CKMovieMediaObject *)self asset];
  BOOL v4 = [v3 tracksWithMediaType:*MEMORY[0x1E4F15C18]];
  double v5 = [v4 lastObject];

  if (v5)
  {
    [(CKMovieMediaObject *)self setHasVideoTrack:1];
    CGFloat v6 = *MEMORY[0x1E4F1DAD8];
    CGFloat v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [v5 naturalSize];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [v5 preferredTransform];
    v13.origin.x = v6;
    v13.origin.y = v7;
    v13.size.double width = v9;
    v13.size.double height = v11;
    CGRect v14 = CGRectApplyAffineTransform(v13, &v12);
    -[CKMovieMediaObject setPxSize:](self, "setPxSize:", v14.size.width, v14.size.height);
  }
}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (BOOL)hasVideoTrack
{
  return self->_hasVideoTrack;
}

- (void)setHasVideoTrack:(BOOL)a3
{
  self->_hasVideoTrack = a3;
}

- (void)setIsAutoloopVideo:(BOOL)a3
{
  self->_isAutoloopVideo = a3;
}

- (void)setIsJellyfishVideo:(BOOL)a3
{
  self->_isJellyfishVideo = a3;
}

- (void)setPxSize:(CGSize)a3
{
  self->_pxSize = a3;
}

- (void)setAsset:(id)a3
{
}

- (BOOL)checkedVideoInfo
{
  return self->_checkedVideoInfo;
}

- (void)setCheckedVideoInfo:(BOOL)a3
{
  self->_checkedVideoInfo = a3;
}

- (BOOL)isAutoloopVideoInitialized
{
  return self->_isAutoloopVideoInitialized;
}

- (void)setIsAutoloopVideoInitialized:(BOOL)a3
{
  self->_isAutoloopVideoInitialized = a3;
}

- (BOOL)isJellyfishInitialized
{
  return self->_isJellyfishInitialized;
}

- (void)setIsJellyfishInitialized:(BOOL)a3
{
  self->_isJellyfishInitialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);

  objc_storeStrong((id *)&self->_thumbnail, 0);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

@end