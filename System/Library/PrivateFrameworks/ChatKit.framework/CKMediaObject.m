@interface CKMediaObject
+ (BOOL)canGeneratePreviewInMVSHostProcess;
+ (BOOL)isPreviewable;
+ (BOOL)shouldScaleUpPreview;
+ (BOOL)shouldShadePreview;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (BOOL)supportsSecureCoding;
+ (Class)__ck_attachmentItemClass;
+ (id)UTITypes;
+ (id)fallbackFilenamePrefix;
+ (id)iconCache;
+ (id)mediaClasses;
+ (id)spatialMetadataProcessingQueue;
+ (id)transferGUIDSFailingPreviewGeneration;
- (BOOL)_shouldDenyUTITypeFromRichIcon;
- (BOOL)cachedValidPreviewExists;
- (BOOL)canExport;
- (BOOL)canPerformQuickAction;
- (BOOL)canShareItem;
- (BOOL)didRequestAdaptiveImageGlyphDerivedFromPreviewImage;
- (BOOL)forceInlinePreviewGeneration;
- (BOOL)generatePreviewOutOfProcess;
- (BOOL)isDirectory;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isMonoskiAsset;
- (BOOL)isPhotosCompatible;
- (BOOL)isPreviewable;
- (BOOL)isPromisedItem;
- (BOOL)needsAnimation;
- (BOOL)shouldBeQuickLooked;
- (BOOL)shouldShowViewer;
- (BOOL)shouldSuppressPreview;
- (BOOL)supportsUnknownSenderPreview;
- (BOOL)transcoderPreviewGenerationFailed;
- (BOOL)validPreviewExistsAtURL:(id)a3;
- (BOOL)validatePreviewFormat;
- (CGSize)bbSize;
- (CGSize)transcoderGeneratedSizeForConstraints:(IMPreviewConstraints *)a3;
- (CGSize)transcodingPreviewPxSize;
- (CKFileTransfer)transfer;
- (CKMediaObject)initWithCoder:(id)a3;
- (CKMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5;
- (CKMessageContext)messageContext;
- (Class)balloonViewClass;
- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4;
- (Class)inlineStickerBalloonViewClass;
- (Class)placeholderBalloonViewClass;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (IMHandle)senderHandle;
- (IMPreviewConstraints)_previewConstraintsForWidth:(SEL)a3;
- (IMPreviewConstraints)transcodingPreviewConstraints;
- (IMSenderContext)senderContext;
- (NSAdaptiveImageGlyph)internalCachedAdaptiveImageGlyph;
- (NSData)data;
- (NSData)generativePlaygroundRecipeData;
- (NSDate)time;
- (NSDictionary)transcoderUserInfo;
- (NSString)UTIType;
- (NSString)description;
- (NSString)filename;
- (NSString)metricsCollectorMediaType;
- (NSString)mimeType;
- (NSString)syndicationIdentifier;
- (NSString)transferGUID;
- (NSURL)alternateShareURL;
- (NSURL)cachedHighQualityFileURL;
- (NSURL)fileURL;
- (NSURL)previewItemURL;
- (OS_dispatch_group)highQualityFetchInProgressGroup;
- (UITraitCollection)transcriptTraitCollection;
- (double)defaultPreviewWidth;
- (id)ASTCDataFromImage:(id)a3;
- (id)JPEGDataFromImage:(id)a3;
- (id)_balloonViewForClassWithWidth:(double)a3 orientation:(char)a4;
- (id)_composeImageForBalloonView:(id)a3 colorType:(char)a4 traitCollection:(id)a5;
- (id)_generateIconWithSize:(CGSize)a3 scale:(double)a4;
- (id)_qlThumbnailGeneratorSharedGenerator;
- (id)_transcodeControllerSharedInstance;
- (id)adaptiveImageGlyph;
- (id)attachmentSummary:(unint64_t)a3;
- (id)bbPreviewFillToSize:(CGSize)a3;
- (id)blastdooredAdaptiveImageGlyphFileURL;
- (id)cachedBlastdooredAdaptiveImageGlyph;
- (id)composeImagesForEntryContentViewWidth:(double)a3 traitCollection:(id)a4;
- (id)fileManager;
- (id)fileSizeString;
- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5;
- (id)generateSingleStrikeAdaptiveImageGlyphFromBlastdooredPreviewImage;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)icon;
- (id)image:(id)a3 withBackgroundColor:(id)a4;
- (id)invisibleInkEffectImageWithPreview:(id)a3;
- (id)location;
- (id)pasteboardItemProvider;
- (id)previewCacheKeyWithOrientation:(char)a3;
- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5;
- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5 transferGUID:(id)a6;
- (id)previewDispatchCache;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewMetadata;
- (id)richIcon;
- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4;
- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4;
- (id)title;
- (int)mediaType;
- (int64_t)commSafetySensitive;
- (int64_t)spatialState;
- (unint64_t)oopPreviewRequestCount;
- (void)_refreshSpatialMetadata;
- (void)_sampleImageEdges:(id)a3 usingRect:(CGRect)a4 forMostlyWhitePixels:(unint64_t *)a5 otherPixels:(unint64_t *)a6;
- (void)_transferUpdated:(id)a3;
- (void)cacheAndPersistPreview:(id)a3 orientation:(char)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)fetchHighQualityFile:(id)a3;
- (void)generateAndCacheBlastdooredAdaptiveImageGlyph;
- (void)generateOOPPreviewForWidth:(double)a3 orientation:(char)a4;
- (void)mediaIsSpatialBasedOnMetadata:(id)a3;
- (void)mediaIsSpatialUsingPhotosFormats:(id)a3;
- (void)postPreviewDidChangeNotifications;
- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4;
- (void)saveAdaptiveImageGlyphToFileCache:(id)a3;
- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5;
- (void)setAdaptiveImageGlyph:(id)a3;
- (void)setAlternateShareURL:(id)a3;
- (void)setCachedHighQualityFileURL:(id)a3;
- (void)setCachedValidPreviewExists:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:(BOOL)a3;
- (void)setFileURL:(id)a3;
- (void)setFilename:(id)a3;
- (void)setForceInlinePreviewGeneration:(BOOL)a3;
- (void)setGeneratePreviewOutOfProcess:(BOOL)a3;
- (void)setGenerativePlaygroundRecipeData:(id)a3;
- (void)setHighQualityFetchInProgressGroup:(id)a3;
- (void)setInternalCachedAdaptiveImageGlyph:(id)a3;
- (void)setIsFromMe:(BOOL)a3;
- (void)setIsPhotosCompatible:(BOOL)a3;
- (void)setMessageContext:(id)a3;
- (void)setMimeType:(id)a3;
- (void)setOopPreviewRequestCount:(unint64_t)a3;
- (void)setSpatialState:(int64_t)a3;
- (void)setTime:(id)a3;
- (void)setTranscriptTraitCollection:(id)a3;
- (void)setTransfer:(id)a3;
- (void)setTransferGUID:(id)a3;
- (void)setUTIType:(id)a3;
- (void)setValidatePreviewFormat:(BOOL)a3;
- (void)syndicationIdentifier;
@end

@implementation CKMediaObject

- (id)cachedBlastdooredAdaptiveImageGlyph
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    id v3 = 0;
    goto LABEL_39;
  }
  v4 = [(CKMediaObject *)self transfer];
  if (![(CKMediaObject *)self isPreviewable]
    || ([v4 isFileDataReady] & 1) == 0 && (objc_msgSend(v4, "isRestoring") & 1) == 0)
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.9();
    }
    id v3 = 0;
    goto LABEL_38;
  }
  v5 = [(CKMediaObject *)self previewDispatchCache];
  v6 = CKEmojiImagePreviewCacheKey(self);
  v7 = [v5 cachedPreviewForKey:v6];
  if (!v7)
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.7();
    }
LABEL_16:

    if ([v4 isFileURLFinalized])
    {
      v9 = [(CKMediaObject *)self blastdooredAdaptiveImageGlyphFileURL];
      v10 = [v9 path];
      if ([v10 length])
      {
        v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v12 = [v11 fileExistsAtPath:v10];
        v13 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v13 trackEvent:*MEMORY[0x1E4F6DA60]];

        if (v12)
        {
          id v22 = 0;
          v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v9 options:1 error:&v22];
          id v15 = v22;
          v16 = IMLogHandleForCategory();
          v17 = v16;
          if (v14)
          {
            v21 = v15;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.6();
            }

            id v3 = (id)[objc_alloc(MEMORY[0x1E4FB0820]) initWithImageContent:v14];
            v18 = IMLogHandleForCategory();
            v17 = v18;
            if (v3)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.5();
              }

              [v5 setCachedPreview:v3 key:v6];
              goto LABEL_37;
            }
            id v15 = v21;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.4();
            }
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph]();
          }
        }
      }
      else
      {
        v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph]();
        }
      }
    }
    v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph]();
    }

    id v3 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKMediaObject(EmojiImage) cachedBlastdooredAdaptiveImageGlyph].cold.8();
    }
    goto LABEL_16;
  }
  id v3 = v7;
LABEL_37:

LABEL_38:
LABEL_39:

  return v3;
}

- (id)blastdooredAdaptiveImageGlyphFileURL
{
  id v3 = [(CKMediaObject *)self transfer];
  if ([v3 isFileURLFinalized])
  {
    v4 = [(CKMediaObject *)self fileURL];
    v5 = IMAttachmentEmojiImagePreviewFileURL();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)generateAndCacheBlastdooredAdaptiveImageGlyph
{
  id v3 = [(CKMediaObject *)self previewDispatchCache];
  v4 = CKEmojiImagePreviewCacheKey(self);
  if ([v3 isGeneratingPreviewForKey:v4])
  {
    v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CKMediaObject(EmojiImage) generateAndCacheBlastdooredAdaptiveImageGlyph]();
    }
  }
  else
  {
    id location = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke;
    aBlock[3] = &unk_1E562C1A8;
    objc_copyWeak(&v13, &location);
    v6 = _Block_copy(aBlock);
    v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CKMediaObject(EmojiImage) generateAndCacheBlastdooredAdaptiveImageGlyph]();
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_42;
    v8[3] = &unk_1E5620AA8;
    id v9 = v3;
    id v10 = v4;
    v11 = self;
    [v9 enqueueGenerationBlock:v6 completion:v8 withPriority:1 forKey:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (id)_balloonViewForClassWithWidth:(double)a3 orientation:(char)a4
{
  v4 = [(CKMediaObject *)self balloonViewClassForWidth:a4 orientation:a3];

  return CKBalloonViewForClass(v4);
}

- (id)_composeImageForBalloonView:(id)a3 colorType:(char)a4 traitCollection:(id)a5
{
  uint64_t v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"CKBalloonView_CKMediaObject.m", 315, @"A traitCollection is needed to create a compose image for balloon view %@", v9 object file lineNumber description];
  }
  [v9 setColor:v6];
  [v9 prepareForDisplayIfNeeded];
  [v9 layoutIfNeeded];
  [v10 displayScale];
  objc_msgSend(v9, "ck_recursivelySetContentScaleFactor:");
  [v9 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v10 displayScale];
  CGFloat v16 = v15;
  v22.width = v12;
  v22.height = v14;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v16);
  v17 = [v9 layer];
  [v17 renderInContext:UIGraphicsGetCurrentContext()];

  v18 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v18;
}

- (id)composeImagesForEntryContentViewWidth:(double)a3 traitCollection:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v8 = +[CKUIBehavior sharedBehaviors];
  [v8 previewMaxWidth];
  double v10 = v9;

  double v11 = [(CKMediaObject *)self _balloonViewForClassWithWidth:1 orientation:v10];
  [v11 configureForMediaObject:self previewWidth:1 orientation:v10];
  [v11 prepareForDisplayIfNeeded];
  [v11 setOrientation:1];
  [v11 setCanUseOpaqueMask:0];
  [v11 setHasTail:0];
  if (objc_opt_respondsToSelector())
  {
    CGFloat v12 = [v11 chevron];
    [v12 setHidden:1];
  }
  if (objc_opt_respondsToSelector()) {
    [v11 setControlHidden:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 prepareForDisplayIfNeeded];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    CGFloat v14 = +[CKUIBehavior sharedBehaviors];
    [v14 composeBalloonMaxWidthForEntryContentViewWidth:a3];
    double v16 = v15;

    objc_msgSend(v11, "sizeThatFits:", v16, 1.79769313e308);
    if (v17 >= v16) {
      double v19 = v16;
    }
    else {
      double v19 = v17;
    }
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v19, v18);
    [v11 setNeedsLayout];
    [v11 layoutIfNeeded];
    v20 = [(CKMediaObject *)self _composeImageForBalloonView:v11 colorType:0xFFFFFFFFLL traitCollection:v6];
    [v7 setObject:v20 forKey:&unk_1EDF16040];
    if (isKindOfClass)
    {
      [v7 setObject:v20 forKey:&unk_1EDF16058];
      [v7 setObject:v20 forKey:&unk_1EDF16070];
      [v7 setObject:v20 forKey:&unk_1EDF16088];
    }
    else
    {
      v21 = [(CKMediaObject *)self _composeImageForBalloonView:v11 colorType:0 traitCollection:v6];
      [v7 setObject:v21 forKey:&unk_1EDF16058];

      CGSize v22 = [(CKMediaObject *)self _composeImageForBalloonView:v11 colorType:1 traitCollection:v6];
      [v7 setObject:v22 forKey:&unk_1EDF16070];

      v23 = [(CKMediaObject *)self _composeImageForBalloonView:v11 colorType:6 traitCollection:v6];
      [v7 setObject:v23 forKey:&unk_1EDF16088];
    }
    goto LABEL_30;
  }
  if (([v11 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([v11 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([v11 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ![v11 isMemberOfClass:objc_opt_class()])
  {
    v35 = +[CKUIBehavior sharedBehaviors];
    [v35 composeBalloonMaxWidthForEntryContentViewWidth:a3];
    double v37 = v36;

    [v11 prepareForDisplayIfNeeded];
    objc_msgSend(v11, "sizeThatFits:", v37, 1.79769313e308);
    if (v38 >= v37) {
      double v40 = v37;
    }
    else {
      double v40 = v38;
    }
    objc_msgSend(v11, "setFrame:", 0.0, 0.0, v40, v39);
    [v11 layoutIfNeeded];
    [v11 bounds];
    v63.width = v41;
    v63.height = v42;
    UIGraphicsBeginImageContextWithOptions(v63, 0, 0.0);
    if (CKIsRunningInMacCatalyst())
    {
      [v11 bounds];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      [v11 contentScaleFactor];
      CGFloat v48 = v47;
      v64.width = v44;
      v64.height = v46;
      UIGraphicsBeginImageContextWithOptions(v64, 0, v48);
      +[CKTranscriptPrintPageRenderer renderViewWithText:v11 withOffsetVertical:0.0];
    }
    else
    {
      v49 = [v11 layer];
      [v49 renderInContext:UIGraphicsGetCurrentContext()];
    }
    v50 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [v7 setObject:v50 forKey:&unk_1EDF16058];
    [v7 setObject:v50 forKey:&unk_1EDF16070];
    [v7 setObject:v50 forKey:&unk_1EDF16088];
    [v7 setObject:v50 forKey:&unk_1EDF16040];

    goto LABEL_31;
  }
  v24 = +[CKUIBehavior sharedBehaviors];
  [v24 composeBalloonMaxWidthForEntryContentViewWidth:a3];
  double v26 = v25;

  objc_msgSend(v11, "sizeThatFits:", v26, 1.79769313e308);
  if (v27 >= v26) {
    double v29 = v26;
  }
  else {
    double v29 = v27;
  }
  objc_msgSend(v11, "setFrame:", 0.0, 0.0, v29, v28);
  [v11 prepareForDisplayIfNeeded];
  [v11 layoutIfNeeded];
  v20 = [v11 image];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  if (v11) {
    [v11 balloonDescriptor];
  }
  BYTE1(v57) = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = v20;
    if (!v30) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  v31 = [MEMORY[0x1E4F42A60] preferredFormat];
  [v31 setScale:0.0];
  [v31 setPreferredRange:0];
  [v31 setOpaque:0];
  id v32 = objc_alloc(MEMORY[0x1E4F42A58]);
  [v11 bounds];
  v33 = objc_msgSend(v32, "initWithBounds:format:", v31);
  uint64_t v51 = MEMORY[0x1E4F143A8];
  uint64_t v52 = 3221225472;
  v53 = __80__CKMediaObject_Compose__composeImagesForEntryContentViewWidth_traitCollection___block_invoke;
  v54 = &unk_1E5620F00;
  id v55 = v11;
  id v56 = v20;
  id v30 = [v33 imageWithActions:&v51];

  if (v30)
  {
LABEL_28:
    objc_msgSend(v7, "setObject:forKey:", v30, &unk_1EDF16058, v51, v52, v53, v54);
    [v7 setObject:v30 forKey:&unk_1EDF16070];
    [v7 setObject:v30 forKey:&unk_1EDF16088];
    [v7 setObject:v30 forKey:&unk_1EDF16040];
  }
LABEL_29:

LABEL_30:
LABEL_31:
  CKBalloonViewReuse(v11);

  return v7;
}

uint64_t __80__CKMediaObject_Compose__composeImagesForEntryContentViewWidth_traitCollection___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F427D0];
  [*(id *)(a1 + 32) bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 composeBalloonCornerRadius];
  double v13 = objc_msgSend(v2, "bezierPathWithRoundedRect:cornerRadius:", v4, v6, v8, v10, v12);
  [v13 addClip];

  CGFloat v14 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) bounds];

  return objc_msgSend(v14, "drawInRect:");
}

- (void)dealloc
{
  [(CKFileTransfer *)self->_transfer mediaObjectRemoved];
  v3.receiver = self;
  v3.super_class = (Class)CKMediaObject;
  [(CKMediaObject *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKMediaObject;
  double v4 = [(CKMediaObject *)&v8 description];
  double v5 = [(CKMediaObject *)self transfer];
  double v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

+ (id)UTITypes
{
  return &unk_1EDF151E8;
}

+ (id)fallbackFilenamePrefix
{
  return @"FILE";
}

- (CKMediaObject)initWithTransfer:(id)a3 context:(id)a4 forceInlinePreview:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKMediaObject;
  double v10 = [(CKMediaObject *)&v15 init];
  double v11 = v10;
  if (v10)
  {
    [(CKMediaObject *)v10 setTransfer:v8];
    double v12 = [(CKMediaObject *)v11 transfer];
    [v12 mediaObjectAdded];

    [(CKMediaObject *)v11 setMessageContext:v9];
    [(CKMediaObject *)v11 setForceInlinePreviewGeneration:v5];
    [(CKMediaObject *)v11 _refreshSpatialMetadata];
    [(CKMediaObject *)v11 setSpatialState:0];
    double v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v11 selector:sel__transferUpdated_ name:*MEMORY[0x1E4F6BB08] object:0];
  }
  return v11;
}

- (void)_transferUpdated:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 object];
  double v6 = [v5 guid];
  double v7 = [(CKFileTransfer *)self->_transfer guid];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v5 transferState];

    if (v8 == 5)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          double v10 = [v5 guid];
          int v11 = 138412290;
          double v12 = v10;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Transfer finished for guid: %@; refreshing spatial metadata",
            (uint8_t *)&v11,
            0xCu);
        }
      }
      [(CKMediaObject *)self _refreshSpatialMetadata];
    }
  }
  else
  {
  }
}

- (void)mediaIsSpatialBasedOnMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Checking spatial state using metadata for %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  double v6 = [(CKMediaObject *)self previewFilenameExtension];
  double v7 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:0 extension:v6 generateIntermediaries:0];

  uint64_t v8 = +[CKMediaObject spatialMetadataProcessingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CKMediaObject_mediaIsSpatialBasedOnMetadata___block_invoke;
  block[3] = &unk_1E5624C38;
  id v13 = v4;
  p_long long buf = &buf;
  id v12 = v7;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(&buf, 8);
}

void __47__CKMediaObject_mediaIsSpatialBasedOnMetadata___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) URLByDeletingPathExtension];
  id v6 = [v2 URLByAppendingPathExtension:@"plist"];

  objc_super v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6D4E8]];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 BOOLValue];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)mediaIsSpatialUsingPhotosFormats:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Checking spatial state using PhotosFormats for %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  if (![(CKMediaObject *)self isFromMe])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)objc_super v15 = 138412290;
        uint64_t v16 = self;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Not checking mediaIsSpatialUsingPhotosFormats because media isn't from self: %@", v15, 0xCu);
      }
    }
    v4[2](v4, *(unsigned __int8 *)(*((void *)&buf + 1) + 24));
  }
  double v7 = [(CKMediaObject *)self fileURL];
  uint64_t v8 = +[CKMediaObject spatialMetadataProcessingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CKMediaObject_mediaIsSpatialUsingPhotosFormats___block_invoke;
  block[3] = &unk_1E5624C38;
  id v13 = v4;
  p_long long buf = &buf;
  id v12 = v7;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(v8, block);

  _Block_object_dispose(&buf, 8);
}

void __50__CKMediaObject_mediaIsSpatialUsingPhotosFormats___block_invoke(void *a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithMediaURL:a1[4] detail:1 timeZoneLookup:0 shouldCache:1];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 isSpatialMedia];
  (*(void (**)(void))(a1[5] + 16))();
}

+ (id)spatialMetadataProcessingQueue
{
  if (spatialMetadataProcessingQueue_once != -1) {
    dispatch_once(&spatialMetadataProcessingQueue_once, &__block_literal_global_57);
  }
  id v2 = (void *)spatialMetadataProcessingQueue_sSpatialQueue;

  return v2;
}

void __47__CKMediaObject_spatialMetadataProcessingQueue__block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Messages.CKMediaObjectSpatialMetadataProcessingQueue", v2);
  v1 = (void *)spatialMetadataProcessingQueue_sSpatialQueue;
  spatialMetadataProcessingQueue_sSpatialQueue = (uint64_t)v0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    double v7 = [(CKMediaObject *)self transferGUID];
    uint64_t v8 = [v4 transferGUID];
    char v6 = [v7 isEqualToString:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)transferGUID
{
  id v2 = [(CKMediaObject *)self transfer];
  objc_super v3 = [v2 guid];

  return (NSString *)v3;
}

- (int64_t)commSafetySensitive
{
  id v2 = [(CKMediaObject *)self transfer];
  int64_t v3 = [v2 commSafetySensitive];

  return v3;
}

- (NSData)data
{
  id v2 = [(CKMediaObject *)self fileURL];
  if (v2)
  {
    int64_t v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:8 error:0];
  }
  else
  {
    int64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)attachmentSummary:(unint64_t)a3
{
  id v4 = NSString;
  uint64_t v5 = IMSharedUtilitiesFrameworkBundle();
  char v6 = [v5 localizedStringForKey:@"%lu Files" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  double v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (NSURL)fileURL
{
  id v2 = [(CKMediaObject *)self transfer];
  int64_t v3 = [v2 fileURL];

  return (NSURL *)v3;
}

- (NSString)filename
{
  id v2 = [(CKMediaObject *)self transfer];
  int64_t v3 = [v2 filename];

  return (NSString *)v3;
}

- (NSDictionary)transcoderUserInfo
{
  id v2 = [(CKMediaObject *)self transfer];
  int64_t v3 = [v2 transcoderUserInfo];

  return (NSDictionary *)v3;
}

- (NSString)mimeType
{
  int64_t v3 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
  id v4 = [(CKMediaObject *)self filename];
  uint64_t v5 = [v3 MIMETypeOfPath:v4];

  return (NSString *)v5;
}

- (BOOL)isDirectory
{
  id v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 isDirectory];

  return v3;
}

- (NSString)UTIType
{
  if ([(CKMediaObject *)self isDirectory]
    && ([(CKMediaObject *)self filename],
        char v3 = objc_claimAutoreleasedReturnValue(),
        [v3 pathExtension],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v3,
        !v5))
  {
    id v8 = (id)*MEMORY[0x1E4F225C8];
  }
  else
  {
    char v6 = +[CKMediaObjectManager sharedInstance];
    double v7 = [(CKMediaObject *)self filename];
    id v8 = [v6 UTITypeForFilename:v7];
  }

  return (NSString *)v8;
}

- (NSString)metricsCollectorMediaType
{
  return (NSString *)(id)*MEMORY[0x1E4F6D980];
}

- (id)pasteboardItemProvider
{
  char v3 = [(CKMediaObject *)self fileURL];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithContentsOfURL:v3];
  uint64_t v5 = [(CKMediaObject *)self filename];
  [v4 setSuggestedName:v5];

  return v4;
}

- (id)rtfDocumentItemsWithFormatString:(id)a3 selectedTextRange:(_NSRange)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = [(CKMediaObject *)self fileURL];
  if (!v6)
  {
    id v13 = objc_alloc(MEMORY[0x1E4FB0870]);
    CGFloat v14 = [(CKMediaObject *)self data];
    objc_super v15 = [(CKMediaObject *)self UTIType];
    id v10 = (id)[v13 initWithData:v14 ofType:v15];

LABEL_13:
    double v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v10];
    uint64_t v18 = v7;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    goto LABEL_14;
  }
  id v17 = 0;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initWithURL:v6 options:0 error:&v17];
  id v8 = v17;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB0870]);
    [v10 setFileWrapper:v7];

    goto LABEL_13;
  }
  id v10 = v8;
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Unable to create file wrapper for NSItemProvider with error: %@", buf, 0xCu);
    }
  }
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_14:

  return v12;
}

- (int)mediaType
{
  return 0;
}

- (BOOL)needsAnimation
{
  return 0;
}

- (BOOL)generatePreviewOutOfProcess
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKMediaObject *)self UTIType];
  int v4 = IMIsSupportedUTIType();

  id v5 = [(CKMediaObject *)self transfer];
  int v6 = [v5 isFileURLFinalized];

  BOOL v7 = [(CKMediaObject *)self forceInlinePreviewGeneration];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      BOOL v9 = @"NO";
      if (v4) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      if (v6) {
        int v11 = @"YES";
      }
      else {
        int v11 = @"NO";
      }
      int v13 = 138412802;
      CGFloat v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      if (v7) {
        BOOL v9 = @"YES";
      }
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Generating Preview OOP: isSupported(%@), isFinalized(%@), forceInline(%@)", (uint8_t *)&v13, 0x20u);
    }
  }
  if (v4) {
    return v6 & !v7;
  }
  else {
    return 0;
  }
}

- (BOOL)validatePreviewFormat
{
  return 0;
}

- (BOOL)isPhotosCompatible
{
  return 0;
}

- (void)fetchHighQualityFile:(id)a3
{
  id v4 = a3;
  id v5 = [(CKMediaObject *)self highQualityFetchInProgressGroup];

  if (v5)
  {
    int v6 = [(CKMediaObject *)self highQualityFetchInProgressGroup];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__CKMediaObject_fetchHighQualityFile___block_invoke;
    block[3] = &unk_1E5622330;
    void block[4] = self;
    id v17 = v4;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
  }
  BOOL v7 = [(CKMediaObject *)self cachedHighQualityFileURL];

  if (v7)
  {
    if (v4)
    {
      id v8 = [(CKMediaObject *)self cachedHighQualityFileURL];
      (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 1, v8);
    }
  }
  else
  {
    BOOL v9 = [(CKMediaObject *)self transfer];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      dispatch_group_t v11 = dispatch_group_create();
      [(CKMediaObject *)self setHighQualityFetchInProgressGroup:v11];

      id v12 = [(CKMediaObject *)self highQualityFetchInProgressGroup];
      dispatch_group_enter(v12);

      int v13 = [(CKMediaObject *)self transfer];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __38__CKMediaObject_fetchHighQualityFile___block_invoke_2;
      v14[3] = &unk_1E5624C60;
      v14[4] = self;
      id v15 = v4;
      [v13 fetchHighQualityFile:v14];
    }
    else if (v4)
    {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
}

uint64_t __38__CKMediaObject_fetchHighQualityFile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchHighQualityFile:*(void *)(a1 + 40)];
}

void __38__CKMediaObject_fetchHighQualityFile___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if (a2) {
    [*(id *)(a1 + 32) setCachedHighQualityFileURL:v7];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v7);
  }
  int v6 = [*(id *)(a1 + 32) highQualityFetchInProgressGroup];
  dispatch_group_leave(v6);

  [*(id *)(a1 + 32) setHighQualityFetchInProgressGroup:0];
}

- (NSString)syndicationIdentifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [(CKMediaObject *)self transferGUID];
  if (v2)
  {
    if (!IMFileTransferGUIDIsTemporary())
    {
      id v12 = v2;
      goto LABEL_31;
    }
    char v3 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    id v4 = [v3 transferForGUID:v2];

    if (!v4)
    {
      int v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObject syndicationIdentifier]();
      }
      id v12 = 0;
      goto LABEL_30;
    }
    uint64_t v5 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    int v6 = [v5 chatForTransfer:v4];

    if (!v6)
    {
      id v7 = IMLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObject syndicationIdentifier]();
      }
      id v12 = 0;
      goto LABEL_29;
    }
    id v7 = [v4 messageGUID];
    id v8 = [v6 messageItemForGUID:v7];
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          uint64_t v16 = v2;
          __int16 v17 = 2112;
          uint64_t v18 = v7;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Found message item for transfer with GUID %@, messageGUID: %@", (uint8_t *)&v15, 0x16u);
        }
      }
      if ([v8 messagePartIndexForAttachmentMessagePartWithTransferGUID:v2] != 0x7FFFFFFFFFFFFFFFLL)
      {
        IMFileTransferGUIDForAttachmentMessagePartAtMessageGUIDAndMessagePartIndex();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      char v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CKMediaObject syndicationIdentifier].cold.4();
      }
    }
    else
    {
      char v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        CGFloat v14 = [v6 guid];
        int v15 = 138412802;
        uint64_t v16 = v2;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_error_impl(&dword_18EF18000, v10, OS_LOG_TYPE_ERROR, "Could not get message item to derive attachment index. transferGUID: %@. messageGUID: %@. chat: %@", (uint8_t *)&v15, 0x20u);
      }
    }

    id v12 = 0;
LABEL_28:

LABEL_29:
LABEL_30:

    goto LABEL_31;
  }
  dispatch_group_t v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CKMediaObject syndicationIdentifier]();
  }

  id v12 = 0;
LABEL_31:

  return (NSString *)v12;
}

- (BOOL)isFromMe
{
  id v2 = [(CKMediaObject *)self messageContext];
  char v3 = [v2 isFromMe];

  return v3;
}

- (BOOL)shouldSuppressPreview
{
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed]) {
    return 1;
  }
  id v4 = [(CKMediaObject *)self messageContext];
  char v5 = [v4 isFromMe];

  if (v5) {
    return 0;
  }
  int v6 = [(CKMediaObject *)self messageContext];
  id v7 = [v6 chatContext];
  uint64_t v8 = [v7 filterCategory];

  BOOL v9 = [(CKMediaObject *)self messageContext];
  LODWORD(v7) = [v9 isSpam];

  if (v7)
  {
    if ((unint64_t)(v8 - 5) < 0xFFFFFFFFFFFFFFFELL) {
      return 1;
    }
  }
  if ([(CKMediaObject *)self supportsUnknownSenderPreview]) {
    return 0;
  }
  char v10 = [(CKMediaObject *)self messageContext];
  dispatch_group_t v11 = [v10 chatContext];
  char v12 = [v11 hasResponded];

  if (v12) {
    return 0;
  }
  int v13 = [(CKMediaObject *)self messageContext];
  char v14 = [v13 isSenderUnknown];

  if (v14) {
    return 1;
  }
  int v15 = [(CKMediaObject *)self messageContext];
  char v16 = [v15 isSenderUnauthenticated];

  return (v16 & 1) != 0;
}

- (IMHandle)senderHandle
{
  id v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 IMMessage];
  id v4 = [v3 sender];

  return (IMHandle *)v4;
}

- (BOOL)canShareItem
{
  return 1;
}

- (NSURL)previewItemURL
{
  char v3 = [(CKMediaObject *)self cachedHighQualityFileURL];

  if (v3) {
    [(CKMediaObject *)self cachedHighQualityFileURL];
  }
  else {
  id v4 = [(CKMediaObject *)self fileURL];
  }

  return (NSURL *)v4;
}

- (BOOL)isPromisedItem
{
  id v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 isRestoring];

  return v3;
}

+ (id)mediaClasses
{
  if (mediaClasses_once != -1) {
    dispatch_once(&mediaClasses_once, &__block_literal_global_83_0);
  }
  id v2 = (void *)mediaClasses_classes;

  return v2;
}

void __29__CKMediaObject_mediaClasses__block_invoke()
{
  v2[15] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:15];
  v1 = (void *)mediaClasses_classes;
  mediaClasses_classes = v0;
}

- (CKMediaObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKMediaObject;
  char v5 = [(CKMediaObject *)&v13 init];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_FILEURL_KEY"];
    [(CKMediaObject *)v5 setFileURL:v6];

    -[CKMediaObject setForceInlinePreviewGeneration:](v5, "setForceInlinePreviewGeneration:", [v4 decodeBoolForKey:@"CKMEDIAOBJECT_FORCEINLINEPREVIEWGENERATION_KEY"]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_TRANSFERGUID_KEY"];
    [(CKMediaObject *)v5 setTransferGUID:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_DATA_KEY"];
    [(CKMediaObject *)v5 setData:v8];

    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_FILENAME_KEY"];
    [(CKMediaObject *)v5 setFilename:v9];

    char v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_MIMETYPE_KEY"];
    [(CKMediaObject *)v5 setMimeType:v10];

    dispatch_group_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CKMEDIAOBJECT_UTITYPE_KEY"];
    [(CKMediaObject *)v5 setUTIType:v11];

    -[CKMediaObject setGeneratePreviewOutOfProcess:](v5, "setGeneratePreviewOutOfProcess:", [v4 decodeBoolForKey:@"CKMEDIAOBJECT_GENERATEPREIVIEWOOP_KEY"]);
    -[CKMediaObject setIsPhotosCompatible:](v5, "setIsPhotosCompatible:", [v4 decodeBoolForKey:@"CKMEDIAOBJECT_ISPHOTOSCOMPTAIBLE_KEY"]);
    -[CKMediaObject setValidatePreviewFormat:](v5, "setValidatePreviewFormat:", [v4 decodeBoolForKey:@"CKMEDIAOBJECT_VALIDATEPREVIEWFORMAT_KEY"]);
    -[CKMediaObject setIsFromMe:](v5, "setIsFromMe:", [v4 decodeBoolForKey:@"CKMEDIAOBJECT_ISFROMME_KEY"]);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(CKMediaObject *)self fileURL];
  [v10 encodeObject:v4 forKey:@"CKMEDIAOBJECT_FILEURL_KEY"];

  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject forceInlinePreviewGeneration](self, "forceInlinePreviewGeneration"), @"CKMEDIAOBJECT_FORCEINLINEPREVIEWGENERATION_KEY");
  char v5 = [(CKMediaObject *)self transferGUID];
  [v10 encodeObject:v5 forKey:@"CKMEDIAOBJECT_TRANSFERGUID_KEY"];

  int v6 = [(CKMediaObject *)self data];
  [v10 encodeObject:v6 forKey:@"CKMEDIAOBJECT_DATA_KEY"];

  id v7 = [(CKMediaObject *)self filename];
  [v10 encodeObject:v7 forKey:@"CKMEDIAOBJECT_FILENAME_KEY"];

  uint64_t v8 = [(CKMediaObject *)self mimeType];
  [v10 encodeObject:v8 forKey:@"CKMEDIAOBJECT_MIMETYPE_KEY"];

  BOOL v9 = [(CKMediaObject *)self UTIType];
  [v10 encodeObject:v9 forKey:@"CKMEDIAOBJECT_UTITYPE_KEY"];

  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject generatePreviewOutOfProcess](self, "generatePreviewOutOfProcess"), @"CKMEDIAOBJECT_GENERATEPREIVIEWOOP_KEY");
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject isPhotosCompatible](self, "isPhotosCompatible"), @"CKMEDIAOBJECT_ISPHOTOSCOMPTAIBLE_KEY");
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject validatePreviewFormat](self, "validatePreviewFormat"), @"CKMEDIAOBJECT_VALIDATEPREVIEWFORMAT_KEY");
  objc_msgSend(v10, "encodeBool:forKey:", -[CKMediaObject isFromMe](self, "isFromMe"), @"CKMEDIAOBJECT_ISFROMME_KEY");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKFileTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
}

- (NSAdaptiveImageGlyph)internalCachedAdaptiveImageGlyph
{
  return self->_internalCachedAdaptiveImageGlyph;
}

- (void)setInternalCachedAdaptiveImageGlyph:(id)a3
{
}

- (void)setFileURL:(id)a3
{
}

- (BOOL)forceInlinePreviewGeneration
{
  return self->_forceInlinePreviewGeneration;
}

- (void)setForceInlinePreviewGeneration:(BOOL)a3
{
  self->_forceInlinePreviewGeneration = a3;
}

- (void)setTransferGUID:(id)a3
{
}

- (void)setData:(id)a3
{
}

- (void)setFilename:(id)a3
{
}

- (void)setMimeType:(id)a3
{
}

- (void)setUTIType:(id)a3
{
}

- (CKMessageContext)messageContext
{
  return self->_messageContext;
}

- (void)setMessageContext:(id)a3
{
}

- (IMSenderContext)senderContext
{
  return self->_senderContext;
}

- (void)setIsFromMe:(BOOL)a3
{
  self->_isFromMe = a3;
}

- (void)setGeneratePreviewOutOfProcess:(BOOL)a3
{
  self->_generatePreviewOutOfProcess = a3;
}

- (void)setValidatePreviewFormat:(BOOL)a3
{
  self->_validatePreviewFormat = a3;
}

- (void)setIsPhotosCompatible:(BOOL)a3
{
  self->_isPhotosCompatible = a3;
}

- (UITraitCollection)transcriptTraitCollection
{
  return self->_transcriptTraitCollection;
}

- (void)setTranscriptTraitCollection:(id)a3
{
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (NSData)generativePlaygroundRecipeData
{
  return self->_generativePlaygroundRecipeData;
}

- (void)setGenerativePlaygroundRecipeData:(id)a3
{
}

- (BOOL)supportsUnknownSenderPreview
{
  return self->_supportsUnknownSenderPreview;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (NSURL)cachedHighQualityFileURL
{
  return self->_cachedHighQualityFileURL;
}

- (void)setCachedHighQualityFileURL:(id)a3
{
}

- (OS_dispatch_group)highQualityFetchInProgressGroup
{
  return self->_highQualityFetchInProgressGroup;
}

- (void)setHighQualityFetchInProgressGroup:(id)a3
{
}

- (unint64_t)oopPreviewRequestCount
{
  return self->_oopPreviewRequestCount;
}

- (void)setOopPreviewRequestCount:(unint64_t)a3
{
  self->_oopPreviewRequestCount = a3;
}

- (BOOL)cachedValidPreviewExists
{
  return self->_cachedValidPreviewExists;
}

- (void)setCachedValidPreviewExists:(BOOL)a3
{
  self->_cachedValidPreviewExists = a3;
}

- (NSURL)alternateShareURL
{
  return self->_alternateShareURL;
}

- (void)setAlternateShareURL:(id)a3
{
}

- (int64_t)spatialState
{
  return self->_spatialState;
}

- (void)setSpatialState:(int64_t)a3
{
  self->_spatialState = a3;
}

- (BOOL)didRequestAdaptiveImageGlyphDerivedFromPreviewImage
{
  return self->_didRequestAdaptiveImageGlyphDerivedFromPreviewImage;
}

- (void)setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:(BOOL)a3
{
  self->_didRequestAdaptiveImageGlyphDerivedFromPreviewImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateShareURL, 0);
  objc_storeStrong((id *)&self->_highQualityFetchInProgressGroup, 0);
  objc_storeStrong((id *)&self->_cachedHighQualityFileURL, 0);
  objc_storeStrong((id *)&self->_generativePlaygroundRecipeData, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_transcriptTraitCollection, 0);
  objc_storeStrong((id *)&self->_senderContext, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_UTIType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_transferGUID, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_internalCachedAdaptiveImageGlyph, 0);

  objc_storeStrong((id *)&self->_transfer, 0);
}

- (void)_refreshSpatialMetadata
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Refreshing spatial metadata for: %@", buf, 0xCu);
    }
  }
  if ([(CKMediaObject *)self spatialState])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Spatial state is already known or being fetched - bailing.", buf, 2u);
      }
    }
  }
  else
  {
    [(CKMediaObject *)self setSpatialState:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke;
    aBlock[3] = &unk_1E5620BF0;
    void aBlock[4] = self;
    char v5 = _Block_copy(aBlock);
    if ([(CKMediaObject *)self isFromMe]) {
      [(CKMediaObject *)self mediaIsSpatialUsingPhotosFormats:v5];
    }
    else {
      [(CKMediaObject *)self mediaIsSpatialBasedOnMetadata:v5];
    }
  }
}

void __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke(uint64_t a1, char a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke_2;
  v2[3] = &unk_1E5622A18;
  char v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __50__CKMediaObject_Internal___refreshSpatialMetadata__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        id v4 = @"YES";
      }
      else {
        id v4 = @"NO";
      }
      int v7 = 138412546;
      uint64_t v8 = v4;
      __int16 v9 = 2112;
      uint64_t v10 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Determined spatial state = %@ for %@", (uint8_t *)&v7, 0x16u);
    }
  }
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t result = [*(id *)(a1 + 32) setSpatialState:v5];
  if (*(unsigned char *)(a1 + 40)) {
    return [*(id *)(a1 + 32) postPreviewDidChangeNotifications];
  }
  return result;
}

- (IMPreviewConstraints)_previewConstraintsForWidth:(SEL)a3
{
  *(void *)&retstr->var3 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.height = 0u;
  int v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 scale];
  double v9 = v8;
  retstr->var2 = v8;

  retstr->var0 = v9 * a4;
  retstr->var1.width = v9 * 50.0;
  retstr->var1.height = v9 * 50.0;
  id v12 = [(CKMediaObject *)self transfer];
  retstr->var3 = [v12 isSticker];
  retstr->var5 = [v12 isAdaptiveImageGlyph];
  if ([(CKMediaObject *)self conformsToProtocol:&unk_1EDFC3460]) {
    char v10 = [(CKMediaObject *)self supportsPreviewMetadata];
  }
  else {
    char v10 = 1;
  }
  retstr->var4 = v10;

  return result;
}

+ (Class)__ck_attachmentItemClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isPreviewable
{
  return 0;
}

- (BOOL)isPreviewable
{
  id v2 = objc_opt_class();

  return [v2 isPreviewable];
}

- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self shouldSuppressPreview])
  {
    int v7 = [(CKMediaObject *)self placeholderBalloonViewClass];
    goto LABEL_30;
  }
  double v8 = [(CKMediaObject *)self transfer];
  if (([v8 isSticker] & 1) == 0)
  {

    goto LABEL_7;
  }
  double v9 = [(CKMediaObject *)self transfer];
  char v10 = [v9 fileURL];

  if (!v10)
  {
LABEL_7:
    id v12 = [(CKMediaObject *)self previewCacheKeyWithOrientation:v4];
    objc_super v13 = [(CKMediaObject *)self previewDispatchCache];
    char v14 = [v13 cachedPreviewForKey:v12];
    if (v14)
    {
      uint64_t v11 = [(CKMediaObject *)self previewBalloonViewClass];
      if (v11)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    int v15 = [(CKMediaObject *)self previewFilenameExtension];
    char v16 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v4 extension:v15 generateIntermediaries:0];

    __int16 v17 = [(CKMediaObject *)self transfer];
    if ([v17 isDownloadable])
    {
    }
    else
    {
      BOOL v18 = [(CKMediaObject *)self validPreviewExistsAtURL:v16];

      if (v18)
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v24 = 138412290;
            uint64_t v25 = 0;
            _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Got disk preview exists preview, class is %@", (uint8_t *)&v24, 0xCu);
          }
        }
        uint64_t v11 = [(CKMediaObject *)self previewBalloonViewClass];

        if (v11) {
          goto LABEL_24;
        }
        goto LABEL_19;
      }
    }

LABEL_19:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = +[CKUIBehavior sharedBehaviors];
      [v20 mapPreviewMaxWidth];
      a3 = v21;
    }
    CGSize v22 = [(CKMediaObject *)self previewForWidth:v4 orientation:a3];
    if (!v22
      || (uint64_t v11 = [(CKMediaObject *)self previewBalloonViewClass], v22, !v11))
    {
      uint64_t v11 = [(CKMediaObject *)self placeholderBalloonViewClass];
    }
    goto LABEL_24;
  }
  uint64_t v11 = [(CKMediaObject *)self inlineStickerBalloonViewClass];
LABEL_25:
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed]) {
    uint64_t v11 = [(CKMediaObject *)self placeholderBalloonViewClass];
  }
  if (!v11) {
    uint64_t v11 = [(CKMediaObject *)self balloonViewClass];
  }
  int v7 = v11;
LABEL_30:

  return v7;
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)previewBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)replyContextBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (Class)placeholderBalloonViewClass
{
  uint64_t v3 = [(CKMediaObject *)self transfer];
  int v4 = [v3 isFromMomentShare];

  if (v4) {
    objc_opt_class();
  }
  else {
  uint64_t v5 = [(CKMediaObject *)self balloonViewClass];
  }

  return (Class)v5;
}

- (Class)inlineStickerBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)title
{
  uint64_t v3 = [(CKMediaObject *)self filename];
  int v4 = CKIsAttachmentFallbackFilename(v3);

  if (!v4 || (uint64_t v5 = (void *)UTTypeCopyDescription((CFStringRef)[(CKMediaObject *)self UTIType])) == 0)
  {
    int v6 = [(CKMediaObject *)self filename];
    uint64_t v5 = CKAttachmentTitleFromFilename();
  }

  return v5;
}

- (id)icon
{
  uint64_t v3 = +[CKMediaObject iconCache];
  int v4 = [(CKMediaObject *)self UTIType];
  if (v4)
  {
    uint64_t v5 = [v3 objectForKey:v4];
    if (!v5)
    {
      int v6 = +[CKUIBehavior sharedBehaviors];
      [v6 mediaObjectCachedIconSize];
      double v8 = v7;
      double v10 = v9;

      uint64_t v11 = [MEMORY[0x1E4F42D90] mainScreen];
      [v11 scale];
      double v13 = v12;

      uint64_t v5 = -[CKMediaObject _generateIconWithSize:scale:](self, "_generateIconWithSize:scale:", v8, v10, v13);
      if (v5) {
        [v3 setObject:v5 forKey:v4];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_generateIconWithSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  double v8 = [(CKMediaObject *)self fileURL];
  if (v8)
  {
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithURL:v8];
  }
  else
  {
    double v10 = [(CKMediaObject *)self UTIType];
    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithType:v10];
  }
  uint64_t v11 = objc_opt_new();
  objc_msgSend(v11, "setSize:", width, height);
  [v11 setScale:a4];
  if (CKIsRunningInMacCatalyst()) {
    [v11 setVariantOptions:1];
  }
  double v12 = [v9 prepareImageForDescriptor:v11];
  double v13 = v12;
  if (v12)
  {
    char v14 = (void *)MEMORY[0x1E4F42A80];
    uint64_t v15 = [v12 CGImage];
    [v13 scale];
    __int16 v17 = [v14 imageWithCGImage:v15 scale:0 orientation:v16 + v16];
  }
  else
  {
    __int16 v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldDenyUTITypeFromRichIcon
{
  CFStringRef v3 = [(CKMediaObject *)self UTIType];
  int v4 = UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F22730]);
  CFStringRef v5 = [(CKMediaObject *)self UTIType];
  int v6 = UTTypeConformsTo(v5, (CFStringRef)*MEMORY[0x1E4F225E8]);
  CFStringRef v7 = [(CKMediaObject *)self UTIType];
  int v8 = UTTypeConformsTo(v7, (CFStringRef)*MEMORY[0x1E4F226C0]);
  int v9 = UTTypeConformsTo((CFStringRef)[(CKMediaObject *)self UTIType], @"public.xhtml");
  CFStringRef v10 = [(CKMediaObject *)self UTIType];
  int v11 = UTTypeConformsTo(v10, (CFStringRef)*MEMORY[0x1E4F22668]);
  int v12 = UTTypeConformsTo((CFStringRef)[(CKMediaObject *)self UTIType], @"com.pixar.universal-scene-description-mobile");
  int v13 = UTTypeConformsTo((CFStringRef)[(CKMediaObject *)self UTIType], @"com.apple.reality");
  if (v4) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v6 == 0;
  }
  return !v14 || v8 != 0 || v9 != 0 || v11 != 0 || (v12 | v13) != 0;
}

- (id)richIcon
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self generatePreviewOutOfProcess]
    || [(CKMediaObject *)self shouldSuppressPreview])
  {
LABEL_3:
    id v3 = 0;
    goto LABEL_4;
  }
  if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Skipping rich icon generation - we are in Lockdown mode", buf, 2u);
      }
    }
    goto LABEL_3;
  }
  int v6 = CKRichIconPreviewCacheKey(self);
  CFStringRef v7 = [(CKMediaObject *)self previewDispatchCache];
  int v8 = [v7 cachedPreviewForKey:v6];
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      double v27 = v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Got cached rich icon %@", buf, 0xCu);
    }
  }
  CFStringRef v10 = [MEMORY[0x1E4F1CA98] null];
  BOOL v11 = v8 == v10;

  if (v11) {
    goto LABEL_24;
  }
  if (v8 || ([v7 isGeneratingPreviewForKey:v6] & 1) != 0) {
    goto LABEL_28;
  }
  if (![(CKMediaObject *)self _shouldDenyUTITypeFromRichIcon])
  {
    BOOL v14 = [(CKMediaObject *)self fileURL];
    if (!v14)
    {
      uint64_t v15 = [(CKMediaObject *)self transfer];
      BOOL v14 = [v15 thumbnailURL];

      if (!v14)
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Not generating rich icon due to nil fileURL", buf, 2u);
          }
        }
        goto LABEL_24;
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __34__CKMediaObject_Display__richIcon__block_invoke;
    v22[3] = &unk_1E562BD50;
    id v23 = v14;
    int v24 = self;
    id v25 = v7;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __34__CKMediaObject_Display__richIcon__block_invoke_111;
    v18[3] = &unk_1E5620AA8;
    id v19 = v25;
    id v20 = v6;
    double v21 = self;
    id v16 = v14;
    [v19 enqueueGenerationBlock:v22 completion:v18 withPriority:0 forKey:v20];

LABEL_28:
    id v3 = v8;
    goto LABEL_29;
  }
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = [(CKMediaObject *)self UTIType];
      *(_DWORD *)long long buf = 138412290;
      double v27 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Don't generate rich icon for %@", buf, 0xCu);
    }
  }
LABEL_24:
  id v3 = 0;
LABEL_29:

LABEL_4:

  return v3;
}

id __34__CKMediaObject_Display__richIcon__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v41 = 0;
  CGFloat v42 = &v41;
  uint64_t v43 = 0x3032000000;
  CGFloat v44 = __Block_byref_object_copy__70;
  double v45 = __Block_byref_object_dispose__70;
  id v46 = 0;
  int v4 = +[CKUIBehavior sharedBehaviors];
  [v4 attachmentBalloonSize];
  double v6 = v5;
  double v8 = v7;

  int v9 = +[CKUIBehavior sharedBehaviors];
  [v9 attachmentBalloonRichIconInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  BOOL v18 = [MEMORY[0x1E4F42D90] mainScreen];
  [v18 scale];
  double v20 = v19;

  double v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A6C0]), "initWithFileAtURL:size:scale:representationTypes:", *(void *)(a1 + 32), 4, v6 - (v13 + v17), v8 - (v11 + v15), v20);
  [v21 setShouldUseRestrictedExtension:1];
  if (IMOSLoggingEnabled())
  {
    CGSize v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CGFloat v48 = v21;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Requesting rich icon generation with request %@", buf, 0xCu);
    }
  }
  id v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  int v24 = [*(id *)(a1 + 40) _qlThumbnailGeneratorSharedGenerator];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __34__CKMediaObject_Display__richIcon__block_invoke_107;
  double v36 = &unk_1E562BD28;
  double v40 = &v41;
  id v37 = *(id *)(a1 + 48);
  id v25 = v3;
  id v38 = v25;
  uint64_t v26 = v23;
  double v39 = v26;
  [v24 generateBestRepresentationForRequest:v21 completionHandler:&v33];

  dispatch_time_t v27 = dispatch_time(0, 3000000000);
  if (dispatch_group_wait(v26, v27))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        CGFloat v48 = v21;
        _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Timed out getting rich icon from QuickLookThumbnailing for request %@", buf, 0xCu);
      }
    }
    double v29 = *(void **)(a1 + 48);
    id v30 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v33, v34, v35, v36, v37, v38);
    [v29 setCachedPreview:v30 key:v25];
  }
  id v31 = (id)v42[5];

  _Block_object_dispose(&v41, 8);

  return v31;
}

void __34__CKMediaObject_Display__richIcon__block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 UIImage];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  int v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (IMOSLoggingEnabled())
  {
    double v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      int v15 = 138412546;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Generation completed with result %@ error %@", (uint8_t *)&v15, 0x16u);
    }
  }
  double v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [MEMORY[0x1E4F1CA98] null];
  }
  double v14 = v13;
  [*(id *)(a1 + 32) setCachedPreview:v13 key:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __34__CKMediaObject_Display__richIcon__block_invoke_111(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__CKMediaObject_Display__richIcon__block_invoke_2;
    v5[3] = &unk_1E5620AF8;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    id v6 = v3;
    uint64_t v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

void __34__CKMediaObject_Display__richIcon__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Posting rich icon change notif for generating rich icon for key: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"CKRichIconDidChangeNotification" object:*(void *)(a1 + 40)];
}

- (id)_qlThumbnailGeneratorSharedGenerator
{
  return (id)[MEMORY[0x1E4F3A6C8] sharedGenerator];
}

- (id)location
{
  return 0;
}

- (BOOL)shouldShowViewer
{
  if (![(CKMediaObject *)self shouldBeQuickLooked]) {
    return 0;
  }
  uint64_t v3 = [(CKMediaObject *)self transfer];
  if ([v3 isFileDataReady]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isRestoring];
  }

  return v4;
}

- (BOOL)shouldBeQuickLooked
{
  uint64_t v3 = [(CKMediaObject *)self transfer];
  if (+[CKCommSafetyHelper shouldDisableTranscriptCapabilitiesForCKFileTransfer:v3])
  {
    char v4 = 0;
  }
  else
  {
    char v4 = [MEMORY[0x1E4F3A650] canPreviewItem:self];
  }

  return v4;
}

- (BOOL)canExport
{
  return 0;
}

- (BOOL)canPerformQuickAction
{
  if ([(CKMediaObject *)self isFromMe])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v3 = [(CKMediaObject *)self canExport];
    if (v3) {
      LOBYTE(v3) = [(CKMediaObject *)self mediaType] == 3
    }
                || [(CKMediaObject *)self mediaType] == 2;
  }
  return v3;
}

- (id)previewCacheKeyWithOrientation:(char)a3
{
  char v4 = [(CKMediaObject *)self transfer];
  int v5 = [v4 isSticker];

  if (v5) {
    CKStickerPreviewCacheKey(self);
  }
  else {
  uint64_t v6 = [(CKMediaObject *)self transferGUID];
  }

  return v6;
}

- (double)defaultPreviewWidth
{
  id v2 = +[CKUIBehavior sharedBehaviors];
  [v2 previewMaxWidth];
  double v4 = v3;

  return v4;
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5 transferGUID:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  double v10 = [(CKMediaObject *)self fileURL];
  uint64_t v11 = IMAttachmentPreviewFileURL();

  if (!v11)
  {
    double v12 = [(CKMediaObject *)self transfer];
    [v12 filename];
    [(CKMediaObject *)self mimeType];
    [(CKMediaObject *)self UTIType];
    id v13 = (void *)IMDCopyAttachmentPersistentPath();
    if (v13)
    {
      double v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
    }
    else
    {
      double v14 = 0;
    }
    uint64_t v11 = IMAttachmentPreviewFileURL();
  }

  return v11;
}

- (id)previewCachesFileURLWithOrientation:(char)a3 extension:(id)a4 generateIntermediaries:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = [(CKMediaObject *)self transfer];
  double v10 = [v9 guid];
  uint64_t v11 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v6 extension:v8 generateIntermediaries:v5 transferGUID:v10];

  return v11;
}

- (BOOL)transcoderPreviewGenerationFailed
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKMediaObject *)self transfer];
  int v4 = [v3 isRejected];

  if (v4)
  {
    int v5 = IMOSLoggingEnabled();
    if (v5)
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "transcoderPreviewGenerationFailed: Transfer Rejected for preview", (uint8_t *)&v17, 2u);
      }

      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v7 = [(CKMediaObject *)self transfer];
    uint64_t v8 = [v7 previewGenerationState];

    if (v8 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          double v10 = [(CKMediaObject *)self transfer];
          uint64_t v11 = [v10 guid];
          int v17 = 138412290;
          id v18 = v11;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "transcoderPreviewGenerationFailed: Preview not allowed for transfer %@ due to failure", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else
    {
      double v12 = +[CKMediaObject transferGUIDSFailingPreviewGeneration];
      id v13 = [(CKMediaObject *)self transferGUID];
      int v14 = [v12 containsObject:v13];

      if (!v14)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (IMOSLoggingEnabled())
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "transcoderPreviewGenerationFailed: Failed to generate preview OOP from CKMediaObject", (uint8_t *)&v17, 2u);
        }
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (id)fileSizeString
{
  id v2 = [(CKMediaObject *)self transfer];
  uint64_t v3 = [v2 totalBytes];

  if (v3 == -1)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = [MEMORY[0x1E4F28B68] stringFromByteCount:v3 countStyle:0];
  }

  return v4;
}

+ (BOOL)shouldScaleUpPreview
{
  return CKIsRunningInMacCatalyst() == 0;
}

+ (BOOL)shouldShadePreview
{
  return 1;
}

- (void)cacheAndPersistPreview:(id)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (CKIsRunningInFullCKClient())
  {
    uint64_t v7 = [(CKMediaObject *)self previewCacheKeyWithOrientation:v4];
    uint64_t v8 = [(CKMediaObject *)self previewDispatchCache];
    [v8 setCachedPreview:v6 key:v7];
    id v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CKMediaObject_Display__cacheAndPersistPreview_orientation___block_invoke;
    block[3] = &unk_1E5623DE8;
    void block[4] = self;
    char v12 = v4;
    id v11 = v6;
    dispatch_async(v9, block);
  }
}

void __61__CKMediaObject_Display__cacheAndPersistPreview_orientation___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 48);
  uint64_t v4 = [v2 previewFilenameExtension];
  int v5 = [v2 previewCachesFileURLWithOrientation:v3 extension:v4 generateIntermediaries:1];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Persisting preview to URL %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [*(id *)(a1 + 32) savePreview:*(void *)(a1 + 40) toURL:v5 forOrientation:*(char *)(a1 + 48)];
}

- (id)invisibleInkEffectImageWithPreview:(id)a3
{
  id v4 = a3;
  int v5 = NSString;
  id v6 = [(CKMediaObject *)self transferGUID];
  int v7 = [v5 stringWithFormat:@"%@-invisibleInk", v6];

  uint64_t v8 = [(CKMediaObject *)self previewDispatchCache];
  uint64_t v9 = [v8 cachedPreviewForKey:v7];
  if (!v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v4;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:
        uint64_t v9 = 0;
        goto LABEL_9;
      }
      id v10 = [v4 image];
    }
    id v11 = v10;
    if (v10)
    {
      char v12 = +[CKUIBehavior sharedBehaviors];
      id v13 = [v12 theme];
      int v14 = [v13 transcriptBackgroundColor];
      uint64_t v9 = [(CKMediaObject *)self image:v11 withBackgroundColor:v14];

      [v8 setCachedPreview:v9 key:v7];
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (id)image:(id)a3 withBackgroundColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 size];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [v6 scale];
  CGFloat v12 = v11;
  v24.double width = v8;
  v24.double height = v10;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  int v14 = (CGColor *)[v5 cgColor];

  CGContextSetFillColorWithColor(CurrentContext, v14);
  [v6 size];
  CGFloat v16 = v15;
  [v6 size];
  v25.size.double height = v17;
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.double width = v16;
  CGContextFillRect(CurrentContext, v25);
  [v6 size];
  double v19 = v18;
  [v6 size];
  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v19, v20);

  double v21 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v21;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  double v7 = -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:");
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(2);
    CGFloat v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      double v9 = [(CKMediaObject *)self transferGUID];
      CGFloat v10 = [(CKMediaObject *)self filename];
      *(_DWORD *)long long buf = 134218754;
      uint64_t v51 = self;
      __int16 v52 = 2112;
      v53 = v9;
      __int16 v54 = 2112;
      id v55 = v10;
      __int16 v56 = 1024;
      LODWORD(v57) = v4;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] previewForOrientation:%d", buf, 0x26u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    double v11 = [(CKMediaObject *)self transferGUID];
    double v47 = [(CKMediaObject *)self filename];
    uint64_t v49 = (int)v4;
    double v45 = self;
    id v46 = v11;
    _CKLog();
  }
  if (![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    int v14 = [(CKMediaObject *)self transfer];
    if (![(CKMediaObject *)self isPreviewable]
      || ([v14 isFileDataReady] & 1) == 0 && (objc_msgSend(v14, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        double v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v51 = self;
          _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_DEBUG, "%@ isn't previewable.", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      id v13 = 0;
      goto LABEL_78;
    }
    double v15 = [(CKMediaObject *)self previewDispatchCache];
    id v13 = [v15 cachedPreviewForKey:v7];
    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(2);
        CGFloat v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          CGFloat v17 = [(CKMediaObject *)self transferGUID];
          double v18 = [(CKMediaObject *)self filename];
          *(_DWORD *)long long buf = 134218754;
          uint64_t v51 = self;
          __int16 v52 = 2112;
          v53 = v17;
          __int16 v54 = 2112;
          id v55 = v18;
          __int16 v56 = 2112;
          id v57 = v13;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "[%p, %@, %@] found in cache! returning %@", buf, 0x2Au);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        double v19 = [(CKMediaObject *)self transferGUID];
        CGFloat v48 = [(CKMediaObject *)self filename];
        _CKLog();
      }
LABEL_77:

LABEL_78:
      goto LABEL_79;
    }
    double v21 = [(CKMediaObject *)self transfer];
    if ([v21 isFileURLFinalized])
    {
    }
    else
    {
      CGSize v22 = [(CKMediaObject *)self transfer];
      int v23 = [v22 isSticker];

      if (!v23) {
        goto LABEL_56;
      }
    }
    CGSize v24 = [(CKMediaObject *)self previewFilenameExtension];
    CGRect v25 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v4 extension:v24 generateIntermediaries:0];

    if ([(CKMediaObject *)self validPreviewExistsAtURL:v25])
    {
      uint64_t v26 = [(CKMediaObject *)self savedPreviewFromURL:v25 forOrientation:v4];
      dispatch_time_t v27 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v27 trackEvent:*MEMORY[0x1E4F6DA60]];

      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          BOOL v29 = [(CKMediaObject *)self isFromMe];
          id v30 = @"NO";
          *(_DWORD *)long long buf = 138412802;
          uint64_t v51 = v25;
          __int16 v52 = 2112;
          if (v29) {
            id v30 = @"YES";
          }
          v53 = v30;
          __int16 v54 = 2112;
          id v55 = v26;
          _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "Persisted preview at url %@ isFromMe %@ is %@", buf, 0x20u);
        }
      }
      if (v26)
      {
        if (IMOSLoggingEnabled())
        {
          id v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v51 = self;
            _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "%@ preview read from disk.", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          id v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            BOOL v33 = [(CKMediaObject *)self isFromMe];
            uint64_t v34 = @"NO";
            if (v33) {
              uint64_t v34 = @"YES";
            }
            *(_DWORD *)long long buf = 138412546;
            uint64_t v51 = v25;
            __int16 v52 = 2112;
            v53 = v34;
            _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Got persisted preview from disk at URL %@ isFromMe %@", buf, 0x16u);
          }
        }
        [v15 setCachedPreview:v26 key:v7];
        id v13 = v26;

        goto LABEL_77;
      }
    }

LABEL_56:
    if ([(CKMediaObject *)self generatePreviewOutOfProcess])
    {
      [(CKMediaObject *)self generateOOPPreviewForWidth:v4 orientation:a3];
      id v13 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Using legacy preview generator", buf, 2u);
        }
      }
      double v36 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      [(__CFString *)v36 startTimingForKey:@"CKMediaObject_PreviewGenerationTime"];
      if ([(CKMediaObject *)self mediaType] == 7 || [(CKMediaObject *)self mediaType] == 9)
      {
        id v13 = [(CKMediaObject *)self generateThumbnailForWidth:v4 orientation:a3];
      }
      else
      {
        id v37 = [(CKMediaObject *)self generateThumbnailForWidth:v4 orientation:a3];
        id v13 = [(CKMediaObject *)self generatePreviewFromThumbnail:v37 width:v4 orientation:a3];
      }
      [(__CFString *)v36 stopTimingForKey:@"CKMediaObject_PreviewGenerationTime"];
      if (IMOSLoggingEnabled())
      {
        id v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          double v39 = [(CKMediaObject *)self UTIType];
          *(_DWORD *)long long buf = 138412546;
          uint64_t v51 = v39;
          __int16 v52 = 2112;
          v53 = v36;
          _os_log_impl(&dword_18EF18000, v38, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);
        }
      }
      double v40 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v40 trackEvent:*MEMORY[0x1E4F6DA68]];

      if (v13)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            CGFloat v42 = [(CKMediaObject *)self transferGUID];
            uint64_t v43 = [(CKMediaObject *)self filename];
            *(_DWORD *)long long buf = 134218498;
            uint64_t v51 = self;
            __int16 v52 = 2112;
            v53 = v42;
            __int16 v54 = 2112;
            id v55 = v43;
            _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "[%p, %@, %@] preview generated.", buf, 0x20u);
          }
        }
        [(CKMediaObject *)self cacheAndPersistPreview:v13 orientation:v4];
      }
    }
    goto LABEL_77;
  }
  if (IMOSLoggingEnabled())
  {
    CGFloat v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Preview generation failed - returning no preview", buf, 2u);
    }
  }
  id v13 = 0;
LABEL_79:

  return v13;
}

- (void)prewarmPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = [(CKMediaObject *)self previewCacheKeyWithOrientation:a3];
  if (IMOSLoggingEnabled())
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Prewarm: Asked to prewarm preview for key %@", buf, 0xCu);
    }
  }
  if (![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    double v9 = [(CKMediaObject *)self transfer];
    if (![(CKMediaObject *)self isPreviewable]
      || ([v9 isFileDataReady] & 1) == 0 && (objc_msgSend(v9, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v6;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, not previewable", buf, 0xCu);
        }
      }
      goto LABEL_31;
    }
    CGFloat v10 = [(CKMediaObject *)self previewDispatchCache];
    double v11 = [v10 cachedPreviewForKey:v6];
    if (v11)
    {
      if (IMOSLoggingEnabled())
      {
        CGFloat v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v6;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Prewarm: %@ already in cache", buf, 0xCu);
        }
      }
      goto LABEL_30;
    }
    int v14 = [(CKMediaObject *)self transfer];
    if ([v14 isFileURLFinalized])
    {
    }
    else
    {
      double v15 = [(CKMediaObject *)self transfer];
      int v16 = [v15 isSticker];

      if (!v16)
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
    }
    CGFloat v17 = [(CKMediaObject *)self previewFilenameExtension];
    double v18 = [(CKMediaObject *)self previewCachesFileURLWithOrientation:v4 extension:v17 generateIntermediaries:0];

    if (IMOSLoggingEnabled())
    {
      double v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v6;
        __int16 v29 = 2112;
        id v30 = v18;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Prewarm: Async fetching %@ at path %@", buf, 0x16u);
      }
    }
    *(void *)long long buf = 0;
    objc_initWeak((id *)buf, self);
    double v20 = +[CKPreviewDispatchCache previewPrewarmQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke;
    block[3] = &unk_1E562BD78;
    objc_copyWeak(&v26, (id *)buf);
    id v23 = v18;
    char v27 = v4;
    id v24 = v6;
    id v25 = v10;
    id v21 = v18;
    dispatch_async(v20, block);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);
    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    CGFloat v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Prewarm: Not prewarming %@, transcode generation failed", buf, 0xCu);
    }
  }
LABEL_32:
}

void __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v4 = [WeakRetained validPreviewExistsAtURL:*(void *)(a1 + 32)];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 savedPreviewFromURL:*(void *)(a1 + 32) forOrientation:*(char *)(a1 + 64)];

    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = objc_loadWeakRetained(v2);
        int v16 = 138412546;
        CGFloat v17 = v6;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Prewarm: preview %@, welf %@", (uint8_t *)&v16, 0x16u);
      }
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke_145;
    v12[3] = &unk_1E5620AA8;
    id v13 = v6;
    id v14 = *(id *)(a1 + 40);
    id v15 = *(id *)(a1 + 48);
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
  else if (IMOSLoggingEnabled())
  {
    CGFloat v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v11 = *(void **)(a1 + 32);
      int v16 = 138412290;
      CGFloat v17 = v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Prewarm: No valid preview exists at %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

void __61__CKMediaObject_Display__prewarmPreviewForWidth_orientation___block_invoke_145(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v3;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Prewarm: returned value is %@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v4 = *(void *)(a1 + 32) == 0;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Prewarm: No preview on disk for %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }
  else
  {
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 40);
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Prewarm: Successfully prewarmed %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [*(id *)(a1 + 48) setCachedPreview:*(void *)(a1 + 32) key:*(void *)(a1 + 40)];
  }
}

- (void)generateOOPPreviewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  -[CKMediaObject previewCacheKeyWithOrientation:](self, "previewCacheKeyWithOrientation:");
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [(CKMediaObject *)self UTIType];
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(double *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v31 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Request to generate OOP preview for type %@ width %f key %@", buf, 0x20u);
    }
  }
  int v10 = [(CKMediaObject *)self previewDispatchCache];
  if ([v10 isGeneratingPreviewForKey:v7])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v7;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v12 startTimingForKey:@"OOPPreviewGeneration"];
    uint64_t v29 = 0;
    long long v28 = 0u;
    long long v27 = 0u;
    [(CKMediaObject *)self _previewConstraintsForWidth:a3];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    uint64_t v31 = __Block_byref_object_copy__70;
    id v32 = __Block_byref_object_dispose__70;
    id v33 = 0;
    id v13 = [(CKMediaObject *)self fileURL];
    id v14 = [(CKMediaObject *)self previewFilenameExtension];
    IMAttachmentPreviewFileURL();
    id v33 = (id)objc_claimAutoreleasedReturnValue();

    id v15 = [(CKMediaObject *)self transferGUID];
    int v16 = v15;
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke;
      v18[3] = &unk_1E562BDC8;
      CGSize v22 = buf;
      void v18[4] = self;
      long long v23 = v27;
      long long v24 = v28;
      uint64_t v25 = v29;
      id v19 = v15;
      char v26 = a4;
      id v20 = v10;
      id v21 = v12;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_150;
      v17[3] = &unk_1E562B170;
      v17[4] = self;
      v17[5] = buf;
      [v20 enqueueGenerationBlock:v18 completion:v17 withPriority:0 forKey:v7];
    }
    _Block_object_dispose(buf, 8);
  }
}

id __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [*(id *)(a1 + 32) fileURL];
  int v5 = [*(id *)(a1 + 32) previewFilenameExtension];
  uint64_t v6 = IMAttachmentPreviewFileURL();
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy__70;
  uint64_t v34 = __Block_byref_object_dispose__70;
  id v35 = 0;
  uint64_t v9 = [*(id *)(a1 + 32) senderContext];
  int v10 = [*(id *)(a1 + 32) _transcodeControllerSharedInstance];
  uint64_t v11 = [*(id *)(a1 + 32) fileURL];
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(*(void *)(v12 + 8) + 40);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2;
  v23[3] = &unk_1E562BDA0;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  long long v27 = &v30;
  uint64_t v28 = v12;
  v23[4] = v14;
  char v29 = *(unsigned char *)(a1 + 112);
  id v24 = *(id *)(a1 + 48);
  id v16 = v3;
  id v25 = v16;
  id v26 = *(id *)(a1 + 40);
  long long v17 = *(_OWORD *)(a1 + 88);
  buf[0] = *(_OWORD *)(a1 + 72);
  buf[1] = v17;
  uint64_t v37 = *(void *)(a1 + 104);
  LOBYTE(v22) = 1;
  [v10 generatePreview:v11 previewURL:v13 senderContext:v9 constraints:buf balloonBundleID:0 transferGUID:v15 completionBlock:v23 blockUntilReply:v22];

  if (v31[5]) {
    [*(id *)(a1 + 32) setCachedValidPreviewExists:1];
  }
  [*(id *)(a1 + 56) stopTimingForKey:@"OOPPreviewGeneration"];
  if (IMOSLoggingEnabled())
  {
    __int16 v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 56);
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = v19;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Preview generation timing %@", (uint8_t *)buf, 0xCu);
    }
  }
  id v20 = (id)v31[5];

  _Block_object_dispose(&v30, 8);

  return v20;
}

void __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) savedPreviewFromURL:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forOrientation:*(char *)(a1 + 80)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with preview %@ error %@", (uint8_t *)&v12, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v10)
  {
    [*(id *)(a1 + 40) setCachedPreview:v10 key:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v11 = +[CKMediaObject transferGUIDSFailingPreviewGeneration];
    [v11 addObject:*(void *)(a1 + 56)];
  }
}

void __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_150(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2_151;
  v1[3] = &unk_1E562B170;
  long long v2 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v1);
}

uint64_t __65__CKMediaObject_Display__generateOOPPreviewForWidth_orientation___block_invoke_2_151(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    long long v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }
  }
  [*(id *)(a1 + 32) postPreviewDidChangeNotifications];
  [*(id *)(a1 + 32) _refreshSpatialMetadata];
  return [*(id *)(a1 + 32) updateIntentFileManagerIfNecessaryWith:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (id)_transcodeControllerSharedInstance
{
  return (id)[MEMORY[0x1E4F6EBE0] sharedInstance];
}

- (void)_sampleImageEdges:(id)a3 usingRect:(CGRect)a4 forMostlyWhitePixels:(unint64_t *)a5 otherPixels:(unint64_t *)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v39 = a3;
  [v39 size];
  uint64_t v13 = v39;
  int64_t v15 = (uint64_t)v14;
  if ((unint64_t)((uint64_t)v14 - 0x2000000000000000) >> 62 != 3) {
    goto LABEL_53;
  }
  double v16 = v12;
  uint64_t v17 = 4 * v15;
  __int16 v18 = (__IOSurface *)[v39 ioSurface];
  uint64_t v19 = v18;
  if (v18)
  {
    IOSurfaceLock(v18, 1u, 0);
    BaseAddress = (char *)IOSurfaceGetBaseAddress(v19);
    if (!BaseAddress)
    {
      id v25 = 0;
      unint64_t v26 = 0;
LABEL_47:
      IOSurfaceUnlock(v19, 1u, 0);
      goto LABEL_49;
    }
LABEL_4:
    uint64_t v21 = (uint64_t)x;
    uint64_t v22 = (uint64_t)width;
    uint64_t v23 = (uint64_t)y;
    uint64_t v24 = (uint64_t)height;
    if ((uint64_t)y >= (uint64_t)height)
    {
      unint64_t v26 = 0;
      id v25 = 0;
    }
    else
    {
      id v25 = 0;
      unint64_t v26 = 0;
      uint64_t v27 = 4 * v15 * v23;
      uint64_t v28 = &BaseAddress[4 * v21 + 1 + v27];
      uint64_t v29 = 8 * v15;
      uint64_t v30 = (uint64_t)y;
      do
      {
        if ((v28[1] < 0xFBu || *v28 < 0xFBu || *(v28 - 1) <= 0xFAu)
          && v28[2] > 0x31u)
        {
          id v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v30 += 2;
        v28 += v29;
      }
      while (v30 < v24);
      uint64_t v31 = &BaseAddress[4 * v22 - 2 + v27];
      uint64_t v32 = (uint64_t)y;
      do
      {
        if ((*v31 < 0xFBu
           || *(v31 - 1) < 0xFBu
           || *(v31 - 2) <= 0xFAu)
          && v31[1] > 0x31u)
        {
          id v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v32 += 2;
        v31 += v29;
      }
      while (v32 < v24);
    }
    if (v21 < v22)
    {
      double v36 = &BaseAddress[4 * v21 + 3 + v17 * v23];
      uint64_t v37 = (uint64_t)x;
      do
      {
        if ((*(v36 - 1) < 0xFBu
           || *(v36 - 2) < 0xFBu
           || *(v36 - 3) <= 0xFAu)
          && *v36 > 0x31u)
        {
          id v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v37 += 2;
        v36 += 8;
      }
      while (v37 < v22);
      uint64_t v38 = &BaseAddress[4 * v21 + 3 + v17 * (v24 - 1)];
      do
      {
        if ((*(v38 - 1) < 0xFBu
           || *(v38 - 2) < 0xFBu
           || *(v38 - 3) <= 0xFAu)
          && *v38 > 0x31u)
        {
          id v25 = (CGImage *)((char *)v25 + 1);
        }
        else
        {
          ++v26;
        }
        v21 += 2;
        v38 += 8;
      }
      while (v21 < v22);
    }
    if (!v19)
    {
      free(BaseAddress);
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  id v25 = (CGImage *)[v39 CGImage];
  if (v25)
  {
    int64_t v33 = (uint64_t)v16 * v17;
    uint64_t v13 = v39;
    if ((unsigned __int128)((uint64_t)v16 * (__int128)v17) >> 64 != v33 >> 63) {
      goto LABEL_53;
    }
    BaseAddress = (char *)malloc_type_malloc(v33, 0x77DBAB86uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    id v35 = CGBitmapContextCreate(BaseAddress, v15, (uint64_t)v16, 8uLL, 4 * v15, DeviceRGB, 0x4001u);
    v41.size.double width = (double)v15;
    v41.size.double height = (double)(uint64_t)v16;
    v41.origin.double x = 0.0;
    v41.origin.double y = 0.0;
    CGContextDrawImage(v35, v41, v25);
    CGContextRelease(v35);
    CGColorSpaceRelease(DeviceRGB);
    if (BaseAddress) {
      goto LABEL_4;
    }
    id v25 = 0;
  }
  unint64_t v26 = 0;
LABEL_49:
  uint64_t v13 = v39;
  if (a5) {
    *a5 = v26;
  }
  if (a6) {
    *a6 = (unint64_t)v25;
  }
LABEL_53:
}

- (id)generatePreviewFromThumbnail:(id)a3 width:(double)a4 orientation:(char)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F42A60] preferredFormat];
    [v8 setScale:0.0];
    [v8 setPreferredRange:0];
    [v8 setOpaque:0];
    uint64_t v9 = +[CKUIBehavior sharedBehaviors];
    [v7 size];
    objc_msgSend(v9, "thumbnailFillSizeForWidth:imageSize:", a4, v10, v11);
    double v13 = v12;
    double v15 = v14;

    double v16 = objc_msgSend(v7, "__ck_imageScaledToFillSize:", v13, v15);
    [v16 size];
    double v18 = (v13 - v17) * 0.5;
    [v16 size];
    double v20 = (v15 - v19) * 0.5;
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v8, v13, v15);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __73__CKMediaObject_Display__generatePreviewFromThumbnail_width_orientation___block_invoke;
    v26[3] = &unk_1E5628E58;
    double v29 = v18;
    double v30 = v20;
    id v27 = v16;
    uint64_t v28 = self;
    id v22 = v16;
    uint64_t v23 = [v21 imageWithActions:v26];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v32 = "-[CKMediaObject(Display) generatePreviewFromThumbnail:width:orientation:]";
        _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "passed %s a nil thumbnail", buf, 0xCu);
      }
    }
    uint64_t v23 = 0;
  }

  return v23;
}

void __73__CKMediaObject_Display__generatePreviewFromThumbnail_width_orientation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ([(id)objc_opt_class() shouldShadePreview])
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v6 = a1 + 32;
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v6 + 8);
    id v7 = [v3 format];
    [v7 bounds];
    objc_msgSend(v5, "_sampleImageEdges:usingRect:forMostlyWhitePixels:otherPixels:", v4, &v11, &v10);

    if ((double)(v10 + v11) / 5.0 < (double)v11)
    {
      id v8 = [MEMORY[0x1E4F428B8] colorWithRed:0.525490196 green:0.525490196 blue:0.525490196 alpha:0.06];
      [v8 set];

      uint64_t v9 = [v3 format];
      [v9 bounds];
      UIRectFillUsingBlendMode(v12, kCGBlendModeSourceAtop);
    }
  }
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v2 = objc_msgSend(a1, "UTITypes", 0, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (IMIsSupportedUTIType())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

+ (BOOL)canGeneratePreviewInMVSHostProcess
{
  return 1;
}

- (CGSize)transcoderGeneratedSizeForConstraints:(IMPreviewConstraints *)a3
{
  [(CKMediaObject *)self transcodingPreviewConstraints];
  IMPreviewConstraints v13 = *a3;
  double v5 = 0.0;
  if (!IMPreviewConstraintsEqualToConstraints()
    || (([(CKMediaObject *)self transcodingPreviewPxSize], v6 == *MEMORY[0x1E4F1DB30])? (BOOL v8 = v7 == *(double *)(MEMORY[0x1E4F1DB30] + 8)): (BOOL v8 = 0), v8))
  {
    double v10 = 0.0;
  }
  else
  {
    double var2 = a3->var2;
    double v10 = 0.0;
    if (var2 > 0.0)
    {
      double v10 = v6 / var2;
      double v5 = v7 / var2;
    }
  }
  double v11 = v10;
  double v12 = v5;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (IMPreviewConstraints)transcodingPreviewConstraints
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v5 = [(CKMediaObject *)self transfer];
  double v6 = [v5 attributionInfo];
  double v7 = [v6 objectForKey:*MEMORY[0x1E4F6D3F8]];

  if (v7)
  {
    *(void *)&retstr->var3 = 0;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1.double height = 0u;
    IMPreviewConstraintsFromDictionary();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        long long v9 = [(CKMediaObject *)self transferGUID];
        int v11 = 138412290;
        double v12 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKMediaObject_Display: no generated preview constraints dictionary found for media object %@", (uint8_t *)&v11, 0xCu);
      }
    }
    IMPreviewConstraintsZero();
  }

  return result;
}

- (CGSize)transcodingPreviewPxSize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CKMediaObject *)self transfer];
  uint64_t v4 = [v3 attributionInfo];
  double v5 = [v4 objectForKey:*MEMORY[0x1E4F6D410]];

  double v6 = [v3 attributionInfo];
  double v7 = [v6 objectForKey:*MEMORY[0x1E4F6D408]];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      long long v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        double v10 = [(CKMediaObject *)self transferGUID];
        int v17 = 138412290;
        double v18 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "CKMediaObject_Display: no generated preview size value found for media object %@", (uint8_t *)&v17, 0xCu);
      }
    }
    double v12 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    [v5 floatValue];
    double v12 = v11;
    [v7 floatValue];
    double v14 = v13;
  }

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)savePreview:(id)a3 toURL:(id)a4 forOrientation:(char)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    long long v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      int v17 = "-[CKMediaObject(Display) savePreview:toURL:forOrientation:]";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "%s persisting to %@", buf, 0x16u);
    }
  }
  if (v8
    && ([(CKMediaObject *)self fileManager],
        double v10 = objc_claimAutoreleasedReturnValue(),
        [v8 path],
        float v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v10 fileExistsAtPath:v11],
        v11,
        v10,
        (v12 & 1) == 0))
  {
    id v14 = v7;
    id v15 = v8;
    im_perform_with_task_assertion();
  }
  else if (IMOSLoggingEnabled())
  {
    float v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      int v17 = (const char *)v8;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "No need to persist preview, URL already exists: %@", buf, 0xCu);
    }
  }
}

void __59__CKMediaObject_Display__savePreview_toURL_forOrientation___block_invoke(id *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v2 = [a1[4] transferGUID];
  if (v2)
  {
    id v3 = a1[5];

    if (v3)
    {
      [a1[5] size];
      double v5 = v4;
      double v7 = v6;
      [a1[5] scale];
      double v9 = v8;
      [a1[5] scale];
      double v11 = v10;
      char v12 = [MEMORY[0x1E4F6BC98] sharedInstance];
      float v13 = [v12 remoteDaemon];
      id v14 = [a1[4] transferGUID];
      objc_msgSend(v13, "successfullyGeneratedPreviewForTransfer:withPreviewSize:", v14, v5 * v11, v7 * v9);
    }
  }
  if (+[CKImageData supportsASTC])
  {
    BOOL v15 = +[CKImageData supportsASTC];
    id v16 = a1[4];
    id v17 = a1[5];
    if (v15) {
      [v16 ASTCDataFromImage:v17];
    }
    else {
    uint64_t v21 = [v16 JPEGDataFromImage:v17];
    }
    CKFreeSpaceWriteDataToURL(v21, a1[6], 1);
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = a1[4];
        id v24 = a1[6];
        int v25 = 138412546;
        id v26 = v23;
        __int16 v27 = 2112;
        id v28 = v24;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "%@ preview saved to %@.", (uint8_t *)&v25, 0x16u);
      }
    }
  }
  else
  {
    __int16 v18 = (void *)MEMORY[0x1E4F6E7D8];
    uint64_t v19 = [a1[5] CGImage];
    id v20 = a1[6];
    [v18 persistCPBitmapWithImage:v19 url:v20];
  }
}

- (id)savedPreviewFromURL:(id)a3 forOrientation:(char)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    double v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Prewarm: %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    double v6 = [v4 lastPathComponent];
    v15[1] = 0;
    IMAttachmentFileNameAndExtension();
    id v7 = 0;

    if ([v7 isEqualToString:@"cpbitmap"])
    {
      v15[0] = 0;
      double v8 = +[CKMultiFrameImage firstFrameImageWithContentsOfCPBitmapURL:v4 error:v15];
      id v9 = v15[0];
      id v10 = v8;
      if (IMOSLoggingEnabled())
      {
        double v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v17 = v10;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Prewarm got bitmap %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4 options:1 error:0];
      if (IMOSLoggingEnabled())
      {
        char v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v17 = v9;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Prewarm got data %@", buf, 0xCu);
        }
      }
      if (v9)
      {
        id v10 = [MEMORY[0x1E4F42A80] ckImageWithData:v9];
        if (IMOSLoggingEnabled())
        {
          float v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v17 = v10;
            _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Prewarm got image %@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)validPreviewExistsAtURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKMediaObject *)self cachedValidPreviewExists])
  {
    double v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = [v4 path];
    int v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      if (![(CKMediaObject *)self validatePreviewFormat]
        || !+[CKImageData supportsASTC])
      {
        goto LABEL_10;
      }
      id v9 = CGImageSourceGetTypeWithURL();
      id v10 = v9;
      if (v9
        && (([v9 isEqualToString:@"org.khronos.ktx"] & 1) != 0
         || ([v10 isEqualToString:@"com.apple.atx"] & 1) != 0))
      {

LABEL_10:
        double v11 = [(CKMediaObject *)self transfer];
        uint64_t v12 = [v11 previewGenerationState];

        if (v12 == 3)
        {
          float v13 = [MEMORY[0x1E4F6BC98] sharedController];
          id v14 = [v13 remoteDaemon];
          BOOL v15 = [(CKMediaObject *)self transfer];
          id v16 = [v15 guid];
          [v14 successfullyGeneratedPreviewForTransfer:v16];
        }
        BOOL v5 = 1;
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v19 = 138412802;
          id v20 = v4;
          __int16 v21 = 2112;
          id v22 = @"org.khronos.ktx";
          __int16 v23 = 2112;
          id v24 = v10;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Persisted preview at %@ expected %@ got %@", (uint8_t *)&v19, 0x20u);
        }
      }
    }
    BOOL v5 = 0;
LABEL_19:
    [(CKMediaObject *)self setCachedValidPreviewExists:v5];
    goto LABEL_20;
  }
  LOBYTE(v5) = 1;
LABEL_20:

  return v5;
}

- (id)previewMetadata
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (![(CKMediaObject *)self conformsToProtocol:&unk_1EDFC3460])
  {
    id v4 = 0;
    goto LABEL_75;
  }
  id v3 = self;
  if ([(CKMediaObject *)v3 supportsPreviewMetadata]
    && ![(CKMediaObject *)v3 transcoderPreviewGenerationFailed])
  {
    BOOL v5 = [(CKMediaObject *)v3 transfer];
    if (![(CKMediaObject *)v3 isPreviewable]
      || ([v5 isFileDataReady] & 1) == 0 && (objc_msgSend(v5, "isRestoring") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LODWORD(v63) = 138412290;
          *(void *)((char *)&v63 + 4) = v3;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%@ isn't previewable.", (uint8_t *)&v63, 0xCu);
        }
      }
      id v4 = 0;
      goto LABEL_73;
    }
    *(void *)&long long v63 = 0;
    *((void *)&v63 + 1) = &v63;
    uint64_t v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__70;
    v66 = __Block_byref_object_dispose__70;
    id v67 = 0;
    CKPreviewMetadataCacheKey(v3);
    double v6 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();
    id v7 = [(CKMediaObject *)v3 previewDispatchCache];
    uint64_t v8 = [v7 cachedPreviewForKey:v6];
    id v9 = *(void **)(*((void *)&v63 + 1) + 40);
    *(void *)(*((void *)&v63 + 1) + 40) = v8;

    if (*(void *)(*((void *)&v63 + 1) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          double v11 = [(CKMediaObject *)v3 transferGUID];
          uint64_t v12 = [(CKMediaObject *)v3 filename];
          uint64_t v13 = *(void *)(*((void *)&v63 + 1) + 40);
          *(_DWORD *)long long buf = 134218754;
          __int16 v56 = v3;
          __int16 v57 = 2112;
          uint64_t v58 = v11;
          __int16 v59 = 2112;
          long long v60 = v12;
          __int16 v61 = 2112;
          uint64_t v62 = v13;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "[%p, %@, %@] found in cache! returning %@", buf, 0x2Au);
        }
      }
      id v4 = *(id *)(*((void *)&v63 + 1) + 40);
      goto LABEL_72;
    }
    BOOL v15 = [(CKMediaObject *)v3 fileURL];
    id v16 = [(CKMediaObject *)v3 previewMetadataFilenameExtension];
    IMAttachmentPreviewMetadataFileURL();
    id v17 = (CKMediaObject *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = [(CKMediaObject *)v3 transfer];
    LODWORD(v16) = [v18 isFileURLFinalized];

    if (!v16) {
      goto LABEL_80;
    }
    int v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = [(CKMediaObject *)v17 path];
    int v21 = [v19 fileExistsAtPath:v20];

    if (!v21) {
      goto LABEL_80;
    }
    uint64_t v22 = _CKMediaObjectPreviewMetadataWithContentsOfURL(v3, v17, 0);
    __int16 v23 = *(void **)(*((void *)&v63 + 1) + 40);
    *(void *)(*((void *)&v63 + 1) + 40) = v22;

    id v24 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v24 trackEvent:*MEMORY[0x1E4F6DA60]];

    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        BOOL v26 = [(CKMediaObject *)v3 isFromMe];
        __int16 v27 = @"NO";
        id v28 = *(void **)(*((void *)&v63 + 1) + 40);
        if (v26) {
          __int16 v27 = @"YES";
        }
        *(_DWORD *)long long buf = 138412802;
        __int16 v56 = v17;
        __int16 v57 = 2112;
        uint64_t v58 = v27;
        __int16 v59 = 2112;
        long long v60 = v28;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Persisted preview metadata at url %@ isFromMe %@ is %@", buf, 0x20u);
      }
    }
    if (*(void *)(*((void *)&v63 + 1) + 40))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          BOOL v30 = [(CKMediaObject *)v3 isFromMe];
          uint64_t v31 = @"NO";
          if (v30) {
            uint64_t v31 = @"YES";
          }
          *(_DWORD *)long long buf = 138412546;
          __int16 v56 = v17;
          __int16 v57 = 2112;
          uint64_t v58 = v31;
          _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "Got persisted preview metadata from disk at URL %@ isFromMe %@", buf, 0x16u);
        }
      }
      [v7 setCachedPreview:*(void *)(*((void *)&v63 + 1) + 40) key:v6];
    }
    else
    {
LABEL_80:
      if ([(CKMediaObject *)v3 generatePreviewOutOfProcess])
      {
        if ([v7 isGeneratingPreviewForKey:v6])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              __int16 v56 = v6;
              _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "Already generating OOP preview for key %@", buf, 0xCu);
            }
          }
        }
        else
        {
          CGRect v41 = [(CKMediaObject *)v3 fileURL];
          CGFloat v42 = [(CKMediaObject *)v3 previewMetadataFilenameExtension];
          uint64_t v43 = IMAttachmentPreviewMetadataFileURL();

          if (v43)
          {
            if (IMOSLoggingEnabled())
            {
              CGFloat v44 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                __int16 v56 = v6;
                _os_log_impl(&dword_18EF18000, v44, OS_LOG_TYPE_INFO, "Request to generate OOP preview metadata with key %@", buf, 0xCu);
              }
            }
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke;
            v49[3] = &unk_1E562BE18;
            v50 = v3;
            id v17 = v43;
            uint64_t v51 = v17;
            __int16 v54 = &v63;
            id v52 = v7;
            v53 = v50;
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke_190;
            v48[3] = &unk_1E5620C40;
            v48[4] = v50;
            [v52 enqueueGenerationBlock:v49 completion:v48 withPriority:0 forKey:v6];
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              double v45 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                id v46 = [(CKMediaObject *)v3 fileURL];
                *(_DWORD *)long long buf = 138412290;
                __int16 v56 = v46;
                _os_log_impl(&dword_18EF18000, v45, OS_LOG_TYPE_INFO, "Failed to create destination for %@", buf, 0xCu);
              }
            }
            id v17 = 0;
          }
        }
        id v4 = 0;
        goto LABEL_71;
      }
      if (objc_opt_respondsToSelector())
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_18EF18000, v33, OS_LOG_TYPE_INFO, "Generating preview metadata in process", buf, 2u);
          }
        }
        uint64_t v34 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F6C3F8]);
        [(__CFString *)v34 startTimingForKey:@"CKMediaObject_PreviewMetadataGenerationTime"];
        uint64_t v35 = [(CKMediaObject *)v3 generatePreviewMetadata];
        double v36 = *(void **)(*((void *)&v63 + 1) + 40);
        *(void *)(*((void *)&v63 + 1) + 40) = v35;

        [(__CFString *)v34 stopTimingForKey:@"CKMediaObject_PreviewMetadataGenerationTime"];
        if (IMOSLoggingEnabled())
        {
          uint64_t v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            uint64_t v38 = [(CKMediaObject *)v3 UTIType];
            *(_DWORD *)long long buf = 138412546;
            __int16 v56 = v38;
            __int16 v57 = 2112;
            uint64_t v58 = v34;
            _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Cache miss on UTI type %@ generated with timing: %@", buf, 0x16u);
          }
        }
        id v39 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v39 trackEvent:*MEMORY[0x1E4F6DA68]];

        if (*(void *)(*((void *)&v63 + 1) + 40))
        {
          if (IMOSLoggingEnabled())
          {
            double v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              __int16 v56 = v3;
              _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_INFO, "%@ preview metadata generated.", buf, 0xCu);
            }
          }
          _CKMediaObjectWritePreviewMetadata(v3, *(void **)(*((void *)&v63 + 1) + 40));
        }
      }
    }
    id v4 = *(id *)(*((void *)&v63 + 1) + 40);
LABEL_71:

LABEL_72:
    _Block_object_dispose(&v63, 8);

LABEL_73:
    goto LABEL_74;
  }
  id v4 = 0;
LABEL_74:

LABEL_75:

  return v4;
}

uint64_t __41__CKMediaObject_Display__previewMetadata__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v4 startTimingForKey:@"OOPPreviewGeneration"];
  BOOL v5 = *(void **)(a1 + 32);
  double v6 = *(void **)(a1 + 40);
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  int v21 = __41__CKMediaObject_Display__previewMetadata__block_invoke_2;
  uint64_t v22 = &unk_1E562BDF0;
  uint64_t v28 = *(void *)(a1 + 64);
  id v23 = v5;
  id v24 = *(id *)(a1 + 40);
  id v25 = *(id *)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 56);
  id v26 = v7;
  uint64_t v27 = v8;
  id v9 = v23;
  id v10 = v6;
  double v11 = &v19;
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v9, "generateOOPPreviewMetadataToURL:WithCompletionBlock:", v10, v11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
  }
  else
  {
    uint64_t v35 = 0;
    *(_OWORD *)long long buf = 0u;
    long long v34 = 0u;
    objc_msgSend(v9, "defaultPreviewWidth", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28);
    if (v9)
    {
      objc_msgSend(v9, "_previewConstraintsForWidth:");
    }
    else
    {
      uint64_t v35 = 0;
      *(_OWORD *)long long buf = 0u;
      long long v34 = 0u;
    }
    BYTE1(v35) = 1;
    uint64_t v12 = [v9 messageContext];
    uint64_t v13 = [v12 isSenderUnknown];

    id v14 = [MEMORY[0x1E4F6E950] contextWithKnownSender:v13];
    BOOL v15 = [v9 _transcodeControllerSharedInstance];
    id v16 = [v9 fileURL];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = ___CKMediaObjectGenerateOOPPreviewMetadata_block_invoke;
    v31[3] = &unk_1E562BE40;
    uint64_t v32 = v11;
    v29[0] = *(_OWORD *)buf;
    v29[1] = v34;
    uint64_t v30 = v35;
    [v15 generateMetadata:v16 metadataURL:v10 senderContext:v14 constraints:v29 completionBlock:v31 blockUntilReply:1];
  }
  [v4 stopTimingForKey:@"OOPPreviewGeneration"];
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Preview generation timing %@", buf, 0xCu);
    }
  }
  return 0;
}

void __41__CKMediaObject_Display__previewMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v15 = a2;
  id v5 = a2;
  uint64_t v6 = _CKMediaObjectPreviewMetadataWithContentsOfURL(v3, v4, &v15);
  id v7 = v15;

  uint64_t v8 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;

  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "IMTranscoderAgent preview generation completed with metadata: %@, error: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v12)
  {
    [*(id *)(a1 + 48) setCachedPreview:v12 key:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v13 = +[CKMediaObject transferGUIDSFailingPreviewGeneration];
    id v14 = [*(id *)(a1 + 64) transferGUID];
    [v13 addObject:v14];
  }
}

void __41__CKMediaObject_Display__previewMetadata__block_invoke_190(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CKMediaObject_Display__previewMetadata__block_invoke_2_191;
  block[3] = &unk_1E5620C40;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __41__CKMediaObject_Display__previewMetadata__block_invoke_2_191(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    long long v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Posting preview change notif for OOP generation completion", v4, 2u);
    }
  }
  return [*(id *)(a1 + 32) postPreviewDidChangeNotifications];
}

- (void)postPreviewDidChangeNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"CKPreviewDidChangeNotification" object:self];
  if ([(CKMediaObject *)self didRequestAdaptiveImageGlyphDerivedFromPreviewImage]&& ![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    [v3 postNotificationName:@"CKAdaptiveImageGlyphGeneratedNotification" object:self];
  }
}

- (id)bbPreviewFillToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [(CKMediaObject *)self transferGUID];
        int v10 = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Transfer %@ was marked as failed for preview generation, not showing preview in notification", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = -[CKMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", width, height, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
  }

  return v8;
}

- (CGSize)bbSize
{
  double v2 = 0.0;
  double v3 = 0.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  return 0;
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  return 0;
}

- (id)previewDispatchCache
{
  return +[CKPreviewDispatchCache transcriptPreviewCache];
}

- (id)fileManager
{
  return (id)[MEMORY[0x1E4F28CB8] defaultManager];
}

- (id)JPEGDataFromImage:(id)a3
{
  return (id)CKUIImageJPEGRepresentationWithHardwareAcceleration();
}

- (id)ASTCDataFromImage:(id)a3
{
  return (id)objc_msgSend(a3, "__ck_ASTCRepresentation");
}

+ (id)iconCache
{
  if (iconCache_once != -1) {
    dispatch_once(&iconCache_once, &__block_literal_global_234);
  }
  double v2 = (void *)iconCache_sIconCache;

  return v2;
}

void __35__CKMediaObject_Display__iconCache__block_invoke()
{
  uint64_t v0 = CKCreateNSCache(0);
  v1 = (void *)iconCache_sIconCache;
  iconCache_sIconCache = v0;
}

+ (id)transferGUIDSFailingPreviewGeneration
{
  if (transferGUIDSFailingPreviewGeneration_once != -1) {
    dispatch_once(&transferGUIDSFailingPreviewGeneration_once, &__block_literal_global_196);
  }
  double v2 = (void *)transferGUIDSFailingPreviewGeneration_sFailureSet;

  return v2;
}

void __63__CKMediaObject_Display__transferGUIDSFailingPreviewGeneration__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = (void *)transferGUIDSFailingPreviewGeneration_sFailureSet;
  transferGUIDSFailingPreviewGeneration_sFailureSet = (uint64_t)v0;
}

id __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained generateNewBlastdooredAdaptiveImageGlyph];

  return v2;
}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_42(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2;
  block[3] = &unk_1E5620AA8;
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cachedPreviewForKey:*(void *)(a1 + 40)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 48) saveAdaptiveImageGlyphToFileCache:v2];
    uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"CKAdaptiveImageGlyphGeneratedNotification" object:*(void *)(a1 + 48)];
  }
  else
  {
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2_cold_1();
    }
  }
}

- (void)saveAdaptiveImageGlyphToFileCache:(id)a3
{
  id v4 = a3;
  if (!CKIsRunningInFullCKClient())
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CKMediaObject(EmojiImage) saveAdaptiveImageGlyphToFileCache:]();
    }
  }
  id v6 = [(CKMediaObject *)self previewDispatchCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke;
  v8[3] = &unk_1E562C1D0;
  id v9 = v4;
  id v7 = v4;
  [v6 enqueueSaveBlock:v8 forMediaObject:self withPriority:0];
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 blastdooredAdaptiveImageGlyphFileURL];
  id v4 = [v3 path];
  if ([v4 length])
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v5 fileExistsAtPath:v4])
    {
      id v6 = IMLogHandleForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_2();
      }
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) imageContent];
      id v10 = 0;
      char v8 = [v7 writeToFile:v4 atomically:1 error:&v10];
      id v6 = v10;
      if ((v8 & 1) == 0)
      {
        id v9 = IMLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_3();
        }
      }
    }
  }
  else
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_1();
    }
  }
}

- (id)adaptiveImageGlyph
{
  uint64_t v3 = [(CKMediaObject *)self internalCachedAdaptiveImageGlyph];
  if (!v3)
  {
    uint64_t v3 = [(CKMediaObject *)self cachedBlastdooredAdaptiveImageGlyph];
    if (v3) {
      [(CKMediaObject *)self setInternalCachedAdaptiveImageGlyph:v3];
    }
    else {
      [(CKMediaObject *)self generateAndCacheBlastdooredAdaptiveImageGlyph];
    }
  }

  return v3;
}

- (void)setAdaptiveImageGlyph:(id)a3
{
  id v7 = a3;
  id v4 = [(CKMediaObject *)self internalCachedAdaptiveImageGlyph];

  if (v4 != v7)
  {
    [(CKMediaObject *)self setInternalCachedAdaptiveImageGlyph:v7];
    if (v7)
    {
      id v5 = [(CKMediaObject *)self previewDispatchCache];
      id v6 = CKEmojiImagePreviewCacheKey(self);
      [v5 setCachedPreview:v7 key:v6];
      [(CKMediaObject *)self saveAdaptiveImageGlyphToFileCache:v7];
    }
  }
}

- (id)generateSingleStrikeAdaptiveImageGlyphFromBlastdooredPreviewImage
{
  v18[1] = *MEMORY[0x1E4F143B8];
  [(CKMediaObject *)self setDidRequestAdaptiveImageGlyphDerivedFromPreviewImage:1];
  uint64_t v3 = +[CKUIBehavior sharedBehaviors];
  [v3 previewMaxWidth];
  id v4 = -[CKMediaObject previewForWidth:orientation:](self, "previewForWidth:orientation:", 0);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 CGImage];
    if (!v5)
    {
LABEL_9:
      id v16 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_9;
    }
    id v6 = [v4 frames];
    id v7 = [v6 firstObject];

    id v8 = v7;
    uint64_t v5 = [v8 CGImage];

    if (!v5) {
      goto LABEL_9;
    }
  }
  id v9 = objc_alloc(MEMORY[0x1E4FB0830]);
  uint64_t v10 = objc_msgSend(v9, "initWithImage:alignmentInset:", v5, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    v18[0] = v10;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    uint64_t v13 = [(CKMediaObject *)self transferGUID];
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB0828]) initWithContentIdentifier:v13 shortDescription:@"Preview Image" strikeImages:v12];
    id v15 = [v14 imageData];
    if ([v15 length]) {
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4FB0820]) initWithImageContent:v15];
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

LABEL_14:

  return v16;
}

- (void)syndicationIdentifier
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "Could not derive attachment index from message item. transferGUID: %@. messageGUID: %@", v2, 0x16u);
}

void __74__CKMediaObject_EmojiImage__generateAndCacheBlastdooredAdaptiveImageGlyph__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Generated adaptive image glyph is of unexpected type. Not saving to file cache.", v2, v3, v4, v5, v6);
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot write emoji image to disk cache without a valid file path for blastdoored emoji image preview.", v2, v3, v4, v5, v6);
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "Not saving generated emoji image to file cache, file already exists.", v1, 2u);
}

void __63__CKMediaObject_EmojiImage__saveAdaptiveImageGlyphToFileCache___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to write generated emoji image to file cache. Error: %@", v2, v3, v4, v5, v6);
}

@end