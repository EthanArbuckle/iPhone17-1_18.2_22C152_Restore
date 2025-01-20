@interface CKImageMediaObject
+ (BOOL)isPreviewable;
+ (BOOL)supportsSecureCoding;
+ (Class)__ck_attachmentItemClass;
+ (Class)imageDataClass;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
- (BOOL)canExport;
- (BOOL)canShareItem;
- (BOOL)isAdaptiveImageGlyph;
- (BOOL)isIrisAsset;
- (BOOL)isPhotosCompatible;
- (BOOL)isScreenshot;
- (BOOL)isSticker;
- (BOOL)supportsUnknownSenderPreview;
- (BOOL)validatePreviewFormat;
- (CGSize)bbSize;
- (CGSize)originalSize;
- (CKImageData)imageData;
- (CKImageMediaObject)initWithCoder:(id)a3;
- (CKImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5;
- (Class)replyContextBalloonViewClass;
- (IMSticker)sticker;
- (PHLivePhoto)livePhoto;
- (UIImage)thumbnail;
- (id)attachmentSummary:(unint64_t)a3;
- (id)bbPreviewFillToSize:(CGSize)a3;
- (id)calculateIrisVideoPath;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)getIrisVideoPath;
- (id)location;
- (id)metricsCollectorMediaType;
- (id)pasteboardItemProvider;
- (id)previewItemTitle;
- (id)previewItemURL;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (int)mediaType;
- (void)encodeWithCoder:(id)a3;
- (void)legacyExport;
- (void)setSticker:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation CKImageMediaObject

- (CKImageMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKImageMediaObject;
  v9 = [(CKMediaObject *)&v39 initWithTransfer:v8 context:a4 forceInlinePreview:v5];
  v10 = v9;
  if (v9)
  {
    appendedBundleURL = v9->_appendedBundleURL;
    v9->_appendedBundleURL = 0;

    v10->_isSticker = [v8 isSticker];
    int v12 = [v8 isAdaptiveImageGlyph];
    v10->_isAdaptiveImageGlyph = v12;
    if (v10->_isSticker || v12 != 0)
    {
      v14 = [MEMORY[0x1E4F28CB8] defaultManager];
      v15 = [(CKMediaObject *)v10 fileURL];
      v16 = [v15 path];
      char v17 = [v14 fileExistsAtPath:v16];

      if ((v17 & 1) == 0)
      {
        v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[CKImageMediaObject initWithTransfer:context:forceInlinePreview:](v10, v18);
        }
      }
      v19 = [(CKMediaObject *)v10 transfer];
      v20 = [v19 stickerUserInfo];

      id v37 = objc_alloc(MEMORY[0x1E4F6EA58]);
      v38 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6E3A0]];
      v35 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6E3B8]];
      v34 = [(CKMediaObject *)v10 fileURL];
      v36 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EB70]];
      v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EB78]];
      v22 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EBA0]];
      v23 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EB98]];
      v24 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EB88]];
      v25 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6EB90]];
      uint64_t v26 = [v37 initWithStickerID:v38 stickerPackID:v35 fileURL:v34 accessibilityLabel:v36 accessibilityName:v21 searchText:v22 sanitizedPrompt:v23 moodCategory:v24 stickerName:v25];
      sticker = v10->_sticker;
      v10->_sticker = (IMSticker *)v26;

      v28 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6E360]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[IMSticker setInitialFrameIndex:](v10->_sticker, "setInitialFrameIndex:", [v28 unsignedIntegerValue]);
      }
      v29 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F6E390]];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        -[IMSticker setStickerEffectType:](v10->_sticker, "setStickerEffectType:", [v29 integerValue]);
      }
      v30 = [v8 animatedImageCacheURL];
      [(IMSticker *)v10->_sticker setAnimatedImageCacheURLFromExtension:v30];

      v31 = [v8 adaptiveImageGlyphContentIdentifier];
      [(IMSticker *)v10->_sticker setAdaptiveImageGlyphContentIdentifier:v31];

      v32 = [v8 adaptiveImageGlyphContentDescription];
      [(IMSticker *)v10->_sticker setAdaptiveImageGlyphContentDescription:v32];
    }
  }

  return v10;
}

+ (id)UTITypes
{
  CFArrayRef v2 = CGImageSourceCopyTypeIdentifiers();
  v3 = [MEMORY[0x1E4F1CA48] array];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__CKImageMediaObject_UTITypes__block_invoke;
  v9[3] = &unk_1E5624C88;
  id v10 = v3;
  id v4 = v3;
  BOOL v5 = [(__CFArray *)v2 indexesOfObjectsPassingTest:v9];
  v6 = [(__CFArray *)v2 objectsAtIndexes:v5];
  v7 = [v4 arrayByAddingObjectsFromArray:v6];

  return v7;
}

uint64_t __30__CKImageMediaObject_UTITypes__block_invoke(uint64_t a1, void *a2)
{
  int v3 = [a2 isEqualToString:@"public.avci"];
  if (v3) {
    [*(id *)(a1 + 32) addObject:@"public.avci"];
  }
  return v3 ^ 1u;
}

- (id)metricsCollectorMediaType
{
  BOOL v2 = [(CKImageMediaObject *)self isSticker];
  int v3 = (void **)MEMORY[0x1E4F6D990];
  if (!v2) {
    int v3 = (void **)MEMORY[0x1E4F6D988];
  }
  id v4 = *v3;

  return v4;
}

+ (id)fallbackFilenamePrefix
{
  return @"IMG";
}

- (id)attachmentSummary:(unint64_t)a3
{
  id v4 = NSString;
  BOOL v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Photos" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 3;
}

- (id)location
{
  return 0;
}

- (BOOL)supportsUnknownSenderPreview
{
  return 1;
}

+ (BOOL)isPreviewable
{
  return 1;
}

- (Class)replyContextBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        BOOL v5 = [(CKMediaObject *)self transferGUID];
        int v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v12, 0xCu);
      }
    }
    v6 = 0;
  }
  else
  {
    v7 = [(CKMediaObject *)self fileURL];
    id v8 = [(CKMediaObject *)self previewFilenameExtension];
    v9 = IMAttachmentPreviewFileURL();

    v6 = [(CKMediaObject *)self savedPreviewFromURL:v9 forOrientation:0];
    if (!v6 && IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Expected OOP preview for SB at %@, got nil", (uint8_t *)&v12, 0xCu);
      }
    }
  }

  return v6;
}

- (CGSize)bbSize
{
  BOOL v2 = [(CKImageMediaObject *)self imageData];
  [v2 ptSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)validatePreviewFormat
{
  return 1;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  double v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = [(CKImageMediaObject *)self imageData];
  [v8 ptSize];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, v9, v10);
  double v12 = v11;
  double v14 = v13;

  v15 = +[CKUIBehavior sharedBehaviors];
  [v15 thumbnailContentAlignmentInsetsForOrientation:v4];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  return -[CKImageMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v12, v14, v17, v19, v21, v23);
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = [(CKImageMediaObject *)self thumbnail];
  double v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    double v10 = [(CKImageMediaObject *)self imageData];
    objc_msgSend(v10, "thumbnailFillToSize:", width, height);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  [v9 size];
  double v12 = v11;
  double v14 = v13;
  if (![(id)objc_opt_class() shouldScaleUpPreview]) {
    goto LABEL_15;
  }
  v15 = [(CKMediaObject *)self transfer];
  if ([v15 isSticker])
  {

LABEL_15:
    id v28 = v9;
    id v9 = v28;
    goto LABEL_16;
  }
  double v16 = v14 + 1.0;

  if (v12 + 1.0 >= width && v16 >= height) {
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F6E7D8] isCroppingAvoidanceEnabled])
  {
    [v9 scale];
    double v19 = width * v18;
    [v9 scale];
    double v21 = height * v20;
    -[CKMediaObject _previewConstraintsForWidth:](self, "_previewConstraintsForWidth:", width, 0);
    double v22 = (void *)MEMORY[0x1E4F6E7D8];
    id v9 = v9;
    uint64_t v23 = objc_msgSend(v22, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", objc_msgSend(v9, "CGImage"), -[CKImageMediaObject isScreenshot](self, "isScreenshot"), v19, v21, 0.0, 0.0);
    if (v23)
    {
      v24 = (CGImage *)v23;
      v25 = (void *)MEMORY[0x1E4F42A80];
      [v9 scale];
      uint64_t v27 = objc_msgSend(v25, "imageWithCGImage:scale:orientation:", v24, objc_msgSend(v9, "imageOrientation"), v26);

      CGImageRelease(v24);
      id v9 = (id)v27;
    }
    goto LABEL_15;
  }
  objc_msgSend(v9, "__ck_imageScaledToFillSize:", width, height);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v29 = v28;

  return v29;
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  if ([MEMORY[0x1E4F6E7D8] isCroppingAvoidanceEnabled])
  {
    uint64_t v33 = 0;
    long long v31 = 0u;
    long long v32 = 0u;
    [(CKMediaObject *)self _previewConstraintsForWidth:a4];
    id v9 = +[CKUIBehavior sharedBehaviors];
    BOOL v10 = [(CKImageMediaObject *)self isSticker];
    [v8 size];
    if (v10) {
      objc_msgSend(v9, "unconstrainedAspectFillSizeForWidth:imageSize:", a4, v11, v12);
    }
    else {
      objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a4, v11, v12);
    }
    double v16 = v13;
    double v17 = v14;
    [v8 scale];
    double v19 = v16 * v18;
    [v8 scale];
    double v21 = v17 * v20;
    double v22 = (void *)MEMORY[0x1E4F6E7D8];
    id v23 = v8;
    uint64_t v24 = objc_msgSend(v22, "newUncroppedPreviewImageFromImage:isScreenshot:maximumSizeInPx:minimumSizeInPx:", objc_msgSend(v23, "CGImage"), -[CKImageMediaObject isScreenshot](self, "isScreenshot"), v19, v21, *((double *)&v31 + 1), *(double *)&v32);
    if (v24)
    {
      v25 = (CGImage *)v24;
      double v26 = (void *)MEMORY[0x1E4F42A80];
      [v23 scale];
      v15 = objc_msgSend(v26, "imageWithCGImage:scale:orientation:", v25, objc_msgSend(v23, "imageOrientation"), v27);
      CGImageRelease(v25);
    }
    else
    {
      v30.receiver = self;
      v30.super_class = (Class)CKImageMediaObject;
      v15 = [(CKMediaObject *)&v30 generatePreviewFromThumbnail:v23 width:v5 orientation:a4];
    }
  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CKImageMediaObject;
    v15 = [(CKMediaObject *)&v29 generatePreviewFromThumbnail:v8 width:v5 orientation:a4];
  }

  return v15;
}

- (BOOL)canExport
{
  double v3 = [(CKMediaObject *)self transfer];
  char v4 = [v3 isSticker];

  if (v4) {
    return 0;
  }
  double v6 = [(CKMediaObject *)self transfer];
  char v7 = [v6 isFileDataReady];

  return v7;
}

- (BOOL)isIrisAsset
{
  isIrisAsset = self->_isIrisAsset;
  if (!isIrisAsset)
  {
    char v4 = NSNumber;
    uint64_t v5 = [(CKImageMediaObject *)self calculateIrisVideoPath];
    [v4 numberWithBool:v5 != 0];
    double v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    char v7 = self->_isIrisAsset;
    self->_isIrisAsset = v6;

    isIrisAsset = self->_isIrisAsset;
  }

  return [(NSNumber *)isIrisAsset BOOLValue];
}

- (void)legacyExport
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  if ([(CKImageMediaObject *)self isIrisAsset])
  {
    double v3 = [(CKMediaObject *)self fileURL];
    char v4 = [v3 path];

    uint64_t v5 = [(CKImageMediaObject *)self calculateIrisVideoPath];
    id v6 = objc_alloc(MEMORY[0x1E4F8CE20]);
    uint64_t v7 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
    long long v8 = *(_OWORD *)v7;
    uint64_t v26 = *(void *)(v7 + 16);
    long long v25 = v8;
    id v9 = (void *)[v6 initWithPathToVideo:v5 pathToImage:v4 imageDisplayTime:&v25 pairingIdentifier:0];
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        double v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v9;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Trying to save iris asset using video complement %@ ", buf, 0xCu);
        }
      }
      double v12 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __34__CKImageMediaObject_legacyExport__block_invoke;
      v23[3] = &unk_1E5620C40;
      id v24 = v9;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __34__CKImageMediaObject_legacyExport__block_invoke_2;
      v20[3] = &unk_1E5624CB0;
      double v22 = &v27;
      double v13 = v10;
      double v21 = v13;
      [v12 performChanges:v23 completionHandler:v20];

      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
    else if (IMOSLoggingEnabled())
    {
      double v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v4;
        __int16 v35 = 2112;
        v36 = v5;
        __int16 v37 = 2112;
        uint64_t v38 = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "CKMediaObject Could not create video complement object using imagePath %@ and videoPath %@ vc %@", buf, 0x20u);
      }
    }
  }
  if (!*((unsigned char *)v28 + 24))
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    double v16 = [(CKMediaObject *)self fileURL];
    double v17 = (void *)[v15 initWithContentsOfURL:v16];

    if (v17) {
      UIImageDataWriteToSavedPhotosAlbum();
    }
  }
  double v18 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v31 = *MEMORY[0x1E4F6DB58];
  uint64_t v32 = *MEMORY[0x1E4F6DB60];
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  [v18 trackEvent:*MEMORY[0x1E4F6DB28] withDictionary:v19];

  _Block_object_dispose(&v27, 8);
}

id __34__CKImageMediaObject_legacyExport__block_invoke(uint64_t a1)
{
  return (id)[MEMORY[0x1E4F38ED0] creationRequestForAssetFromVideoComplementBundle:*(void *)(a1 + 32)];
}

void __34__CKImageMediaObject_legacyExport__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "got result back", (uint8_t *)&v9, 2u);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      long long v8 = @"NO";
      if (a2) {
        long long v8 = @"YES";
      }
      int v9 = 138412546;
      dispatch_semaphore_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Saved iris asset %@ with error %@", (uint8_t *)&v9, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)getIrisVideoPath
{
  return 0;
}

- (id)calculateIrisVideoPath
{
  irisVideoPath = self->_irisVideoPath;
  if (!irisVideoPath)
  {
    char v4 = [(CKMediaObject *)self fileURL];
    id v5 = +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:v4];
    id v6 = self->_irisVideoPath;
    self->_irisVideoPath = v5;

    irisVideoPath = self->_irisVideoPath;
  }

  return irisVideoPath;
}

- (id)pasteboardItemProvider
{
  v12.receiver = self;
  v12.super_class = (Class)CKImageMediaObject;
  double v3 = [(CKMediaObject *)&v12 pasteboardItemProvider];
  if ([(CKImageMediaObject *)self isIrisAsset])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke;
    v11[3] = &unk_1E5621A58;
    v11[4] = self;
    [v3 registerDataRepresentationForTypeIdentifier:@"com.apple.MobileSMS.appendedURL" visibility:0 loadHandler:v11];
  }
  char v4 = [v3 registeredContentTypes];
  int v5 = [v4 containsObject:*MEMORY[0x1E4F443E0]];

  if (v5)
  {
    id v6 = [(id)*MEMORY[0x1E4F44460] identifier];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_2;
    v10[3] = &unk_1E5621A58;
    v10[4] = self;
    [v3 registerDataRepresentationForTypeIdentifier:v6 visibility:0 loadHandler:v10];

    uint64_t v7 = [(id)*MEMORY[0x1E4F44410] identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_3;
    v9[3] = &unk_1E5621A58;
    void v9[4] = self;
    [v3 registerDataRepresentationForTypeIdentifier:v7 visibility:0 loadHandler:v9];
  }

  return v3;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke(uint64_t a1, void (**a2)(void, void, void))
{
  double v3 = *(void **)(a1 + 32);
  char v4 = a2;
  int v5 = [v3 calculateIrisVideoPath];
  id v6 = [v5 dataUsingEncoding:4];
  ((void (**)(void, void *, void))a2)[2](v4, v6, 0);

  return 0;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F42A80]);
  int v5 = [*(id *)(a1 + 32) fileURL];
  id v6 = [v5 path];
  uint64_t v7 = (UIImage *)[v4 initWithContentsOfFile:v6];

  if (v7 && (UIImagePNGRepresentation(v7), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v9 = (void *)v8;
    v3[2](v3, v8, 0);
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v9 = (void *)[v10 initWithDomain:*MEMORY[0x1E4F284A0] code:-1000 userInfo:0];
    ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v9);
  }

  return 0;
}

uint64_t __44__CKImageMediaObject_pasteboardItemProvider__block_invoke_3(uint64_t a1, void *a2)
{
  double v3 = a2;
  id v4 = objc_alloc(MEMORY[0x1E4F42A80]);
  int v5 = [*(id *)(a1 + 32) fileURL];
  id v6 = [v5 path];
  uint64_t v7 = (UIImage *)[v4 initWithContentsOfFile:v6];

  if (v7 && (UIImageJPEGRepresentation(v7, 1.0), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v9 = (void *)v8;
    v3[2](v3, v8, 0);
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F28C58]);
    int v9 = (void *)[v10 initWithDomain:*MEMORY[0x1E4F284A0] code:-1000 userInfo:0];
    ((void (**)(id, uint64_t, void *))v3)[2](v3, 0, v9);
  }

  return 0;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)CKImageMediaObject;
  int v5 = -[CKMediaObject rtfDocumentItemsWithFormatString:selectedTextRange:](&v13, sel_rtfDocumentItemsWithFormatString_selectedTextRange_, a3, a4.location, a4.length);
  if ([(CKImageMediaObject *)self isIrisAsset])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
    int v9 = [(CKImageMediaObject *)self calculateIrisVideoPath];
    id v10 = [v8 URLWithString:v9];

    objc_msgSend(v7, "addAttribute:value:range:", @"com.apple.MobileSMS.appendedURL", v10, 0, objc_msgSend(v7, "length"));
    v14[0] = v7;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];

    int v5 = (void *)v11;
  }

  return v5;
}

- (BOOL)isPhotosCompatible
{
  return 1;
}

- (BOOL)canShareItem
{
  double v3 = [(CKMediaObject *)self transfer];
  BOOL v4 = !+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:v3]&& !self->_isSticker;

  return v4;
}

- (id)previewItemURL
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKMediaObject *)self fileURL];
  BOOL v4 = +[CKLivePhotoBundleUtilities getLivePhotoBundleURL:v3];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(CKMediaObject *)self fileURL];
        *(_DWORD *)buf = 138412546;
        objc_super v12 = v4;
        __int16 v13 = 2112;
        double v14 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Passing back iris url %@ to QL for fileURL  %@", buf, 0x16u);
      }
    }
    id v7 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKImageMediaObject;
    id v7 = [(CKMediaObject *)&v10 previewItemURL];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)previewItemTitle
{
  BOOL v2 = CKFrameworkBundle();
  double v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_PHOTO" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

+ (Class)imageDataClass
{
  return (Class)objc_opt_class();
}

- (CKImageData)imageData
{
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    uint64_t v3 = 168;
  }
  else {
    uint64_t v3 = 176;
  }
  BOOL v4 = (void **)((char *)&self->super.super.isa + v3);
  int v5 = *(Class *)((char *)&self->super.super.isa + v3);
  if (!v5)
  {
    id v6 = objc_alloc((Class)[(id)objc_opt_class() imageDataClass]);
    id v7 = [(CKMediaObject *)self data];
    uint64_t v8 = [v6 initWithData:v7];
    int v9 = *v4;
    *BOOL v4 = (void *)v8;

    int v5 = *v4;
  }
  id v10 = v5;

  return (CKImageData *)v10;
}

- (BOOL)isScreenshot
{
  BOOL v2 = [(CKMediaObject *)self transfer];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 isScreenshot];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (CGSize)originalSize
{
  p_originalSize = &self->_originalSize;
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    CFURLRef v6 = [(CKMediaObject *)self fileURL];
    p_originalSize->double width = CKSizeOfImageAtURL(v6);
    p_originalSize->double height = v7;

    double width = p_originalSize->width;
    double height = p_originalSize->height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (PHLivePhoto)livePhoto
{
  v26[2] = *MEMORY[0x1E4F143B8];
  p_livePhoto = &self->_livePhoto;
  livePhoto = self->_livePhoto;
  if (livePhoto)
  {
    char v4 = livePhoto;
    goto LABEL_17;
  }
  if (![(CKImageMediaObject *)self isIrisAsset])
  {
    char v4 = 0;
    goto LABEL_17;
  }
  CFURLRef v6 = [(CKImageMediaObject *)self previewItemURL];
  CGFloat v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v6];
  uint64_t v8 = [v7 imagePath];
  if (!v8
    || ([v7 videoPath],
        int v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {
    if (IMOSLoggingEnabled())
    {
      double v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Couldn't generate a PFVideoComplement from the given url: %@", buf, 0xCu);
      }
    }
    id v19 = 0;
    double v18 = 0;
    goto LABEL_15;
  }
  id v10 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v11 = [v7 imagePath];
  objc_super v12 = [v10 fileURLWithPath:v11];

  __int16 v13 = (void *)MEMORY[0x1E4F1CB10];
  double v14 = [v7 videoPath];
  uint64_t v15 = [v13 fileURLWithPath:v14];

  double v16 = (void *)MEMORY[0x1E4F39138];
  v26[0] = v12;
  v26[1] = v15;
  double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  id v23 = 0;
  double v18 = [v16 livePhotoWithResourceFileURLs:v17 error:&v23];
  id v19 = v23;

  if (v19 || !v18)
  {
    if (IMOSLoggingEnabled())
    {
      double v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v19;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Couldn't generate a PHLivePhoto, error: %@", buf, 0xCu);
      }
    }
LABEL_15:
    char v4 = 0;
    goto LABEL_16;
  }
  objc_storeStrong((id *)p_livePhoto, v18);
  char v4 = *p_livePhoto;
  id v19 = 0;
LABEL_16:

LABEL_17:

  return v4;
}

- (CKImageMediaObject)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKImageMediaObject;
  return [(CKMediaObject *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKImageMediaObject;
  [(CKMediaObject *)&v3 encodeWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isSticker
{
  return self->_isSticker;
}

- (BOOL)isAdaptiveImageGlyph
{
  return self->_isAdaptiveImageGlyph;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (void)setThumbnail:(id)a3
{
}

- (IMSticker)sticker
{
  return self->_sticker;
}

- (void)setSticker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sticker, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_isIrisAsset, 0);
  objc_storeStrong((id *)&self->_irisVideoPath, 0);
  objc_storeStrong((id *)&self->_appendedBundleURL, 0);
  objc_storeStrong((id *)&self->_backgroundImageData, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

- (void)initWithTransfer:(void *)a1 context:(NSObject *)a2 forceInlinePreview:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = [a1 fileURL];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Sticker does not exist at path: %@", (uint8_t *)&v4, 0xCu);
}

@end