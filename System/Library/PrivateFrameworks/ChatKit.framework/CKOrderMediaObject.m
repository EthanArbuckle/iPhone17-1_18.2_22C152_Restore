@interface CKOrderMediaObject
+ (BOOL)isPreviewable;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (id)UTITypes;
+ (id)_modifyColor:(id)a3 lighten:(BOOL)a4;
+ (id)_paddedImage:(id)a3 imageType:(unsigned __int8)a4 bubbleWidth:(double)a5;
+ (id)fallbackFilenamePrefix;
+ (void)_setTextForPresentationRow:(id)a3 representation:(id)a4;
+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4;
- (BOOL)generatePreviewOutOfProcess;
- (BOOL)isSupported;
- (BOOL)shouldBeQuickLooked;
- (BOOL)shouldShowDisclosure;
- (BOOL)shouldShowViewer;
- (BOOL)supportsPreviewMetadata;
- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5;
- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4;
- (Class)previewBalloonViewClass;
- (Class)replyContextBalloonViewClass;
- (FKOrderMessagesPreviewMetadata)metadata;
- (LPWebLinkPresentationProperties)presentationProperties;
- (NSString)previewMetadataFilenameExtension;
- (NSURL)overrideFileURL;
- (NSURL)overrideMetadataProperties;
- (id)_initWithOverrideFileURL:(id)a3;
- (id)attachmentSummary:(unint64_t)a3;
- (id)generatePreviewMetadata;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4;
- (id)metricsCollectorMediaType;
- (id)presentationPropertiesForReplyPreview;
- (id)presentationPropertiesForWidth:(double)a3;
- (id)previewForWidth:(double)a3 orientation:(char)a4;
- (id)previewItemTitle;
- (id)previewMetadata;
- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4;
- (int)mediaType;
- (void)generatePreviewMetadata;
- (void)setMetadata:(id)a3;
- (void)setOverrideFileURL:(id)a3;
- (void)setOverrideMetadataProperties:(id)a3;
- (void)setPresentationProperties:(id)a3;
@end

@implementation CKOrderMediaObject

- (id)_initWithOverrideFileURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKOrderMediaObject;
  v5 = [(CKOrderMediaObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CKOrderMediaObject *)v5 setOverrideFileURL:v4];
  }

  return v6;
}

- (BOOL)isSupported
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 supportsPassbookAttachments];

  return v3;
}

+ (id)UTITypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.finance.order";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)metricsCollectorMediaType
{
  return (id)*MEMORY[0x1E4F6D9A0];
}

+ (id)fallbackFilenamePrefix
{
  return @"ORDER";
}

- (id)attachmentSummary:(unint64_t)a3
{
  id v4 = NSString;
  v5 = IMSharedUtilitiesFrameworkBundle();
  v6 = [v5 localizedStringForKey:@"%lu Orders" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);

  return v7;
}

- (int)mediaType
{
  return 9;
}

- (id)previewMetadata
{
  char v3 = [(CKOrderMediaObject *)self overrideMetadataProperties];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKOrderMediaObject;
    id v5 = [(CKMediaObject *)&v8 previewMetadata];
  }
  v6 = v5;

  return v6;
}

- (id)previewForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  if ([(CKOrderMediaObject *)self isSupported])
  {
    v9.receiver = self;
    v9.super_class = (Class)CKOrderMediaObject;
    v7 = [(CKMediaObject *)&v9 previewForWidth:v4 orientation:a3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)generateThumbnailForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  v7 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v7, "thumbnailFillSizeForWidth:imageSize:", a3, 4.0, 3.0);
  double v9 = v8;
  double v11 = v10;

  v12 = +[CKUIBehavior sharedBehaviors];
  [v12 thumbnailContentAlignmentInsetsForOrientation:v4];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  return -[CKOrderMediaObject generateThumbnailFillToSize:contentAlignmentInsets:](self, "generateThumbnailFillToSize:contentAlignmentInsets:", v9, v11, v14, v16, v18, v20);
}

- (BOOL)shouldShowViewer
{
  v2 = [(CKMediaObject *)self transfer];
  char v3 = [v2 isFileDataReady];

  return v3;
}

- (BOOL)shouldBeQuickLooked
{
  return 0;
}

- (BOOL)shouldShowDisclosure
{
  return 0;
}

- (id)previewItemTitle
{
  v2 = CKFrameworkBundle();
  char v3 = [v2 localizedStringForKey:@"PREVIEW_TITLE_ORDER" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v3;
}

- (BOOL)generatePreviewOutOfProcess
{
  if ([(CKMediaObject *)self isFromMe]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKOrderMediaObject;
  return [(CKMediaObject *)&v4 generatePreviewOutOfProcess];
}

+ (BOOL)isPreviewable
{
  return 1;
}

+ (BOOL)shouldUseTranscoderGeneratedPreviewSize
{
  return 0;
}

- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4
{
  uint64_t v4 = a4;
  if ([(CKOrderMediaObject *)self isSupported]
    && ([(CKOrderMediaObject *)self previewMetadata], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (double v8 = (void *)v7,
        BOOL v9 = [(CKMediaObject *)self shouldSuppressPreview],
        v8,
        !v9))
  {
    double v10 = objc_opt_class();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKOrderMediaObject;
    double v10 = [(CKMediaObject *)&v12 balloonViewClassForWidth:v4 orientation:a3];
  }

  return (Class)v10;
}

- (Class)previewBalloonViewClass
{
  if ([(CKOrderMediaObject *)self isSupported]) {
    objc_opt_class();
  }
  else {
  char v3 = [(CKMediaObject *)self placeholderBalloonViewClass];
  }

  return (Class)v3;
}

- (Class)replyContextBalloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double height = a3.height;
  double width = a3.width;
  BOOL v11 = [(CKMediaObject *)self transcoderPreviewGenerationFailed];
  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      double v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }
    }
    double v14 = 0;
  }
  else
  {
    if (v12)
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v19 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail", v19, 2u);
      }
    }
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      double v16 = [(CKOrderMediaObject *)self presentationPropertiesForWidth:width];
    }
    else
    {
      double v16 = self->_presentationProperties;
    }
    double v17 = v16;
    double v14 = +[CKWalletMediaObjectMetadataHandler generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:](CKWalletMediaObjectMetadataHandler, "generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:", v16, width, height, top, left, bottom, right);
  }

  return v14;
}

- (BOOL)supportsPreviewMetadata
{
  return 1;
}

- (NSString)previewMetadataFilenameExtension
{
  return (NSString *)@"plist";
}

- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4
{
  return +[CKWalletMediaObjectMetadataHandler previewMetadataWithContentsOfURL:a3 error:a4];
}

- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return +[CKWalletMediaObjectMetadataHandler writePreviewMetadata:a3 toURL:a4 error:a5];
}

- (id)generatePreviewMetadata
{
  BOOL v3 = [(CKMediaObject *)self transcoderPreviewGenerationFailed];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }
    }
LABEL_40:
    v54 = 0;
    goto LABEL_41;
  }
  if (v4)
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v56 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Generating metadata", v56, 2u);
    }
  }
  uint64_t v7 = [(CKOrderMediaObject *)self metadata];

  if (!v7) {
    goto LABEL_40;
  }
  double v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v9 = [(CKOrderMediaObject *)self metadata];
  double v10 = [v9 headerImage];

  if (v10)
  {
    BOOL v11 = [(CKOrderMediaObject *)self metadata];
    int v12 = [v11 headerImage];
    double v13 = [v12 data];

    if (v13) {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E508], v13);
    }

    double v14 = NSNumber;
    double v15 = [(CKOrderMediaObject *)self metadata];
    double v16 = [v15 headerImage];
    double v17 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "kind"));

    if (v17) {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E510], v17);
    }
  }
  double v18 = [(CKOrderMediaObject *)self metadata];
  uint64_t v19 = [v18 backgroundColor];

  if (v19)
  {
    double v20 = (void *)MEMORY[0x1E4F428B8];
    v21 = [(CKOrderMediaObject *)self metadata];
    v22 = objc_msgSend(v20, "colorWithCGColor:", objc_msgSend(v21, "backgroundColor"));
    v23 = +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:v22];

    if (v23) {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E4D0], v23);
    }
  }
  v24 = [(CKOrderMediaObject *)self metadata];
  v25 = [v24 primaryText];

  if (v25)
  {
    v26 = [(CKOrderMediaObject *)self metadata];
    v27 = [v26 primaryText];
    v28 = [v27 text];
    v29 = (void *)MEMORY[0x1E4F428B8];
    v30 = [(CKOrderMediaObject *)self metadata];
    v31 = [v30 primaryText];
    v32 = objc_msgSend(v29, "colorWithCGColor:", objc_msgSend(v31, "overrideColor"));
    v33 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v28 optionalColor:v32];

    if (v33)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E518], v33);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata]();
    }
  }
  v34 = [(CKOrderMediaObject *)self metadata];
  v35 = [v34 secondaryText];

  if (v35)
  {
    v36 = [(CKOrderMediaObject *)self metadata];
    v37 = [v36 secondaryText];
    v38 = [v37 text];
    v39 = (void *)MEMORY[0x1E4F428B8];
    v40 = [(CKOrderMediaObject *)self metadata];
    v41 = [v40 secondaryText];
    v42 = objc_msgSend(v39, "colorWithCGColor:", objc_msgSend(v41, "overrideColor"));
    v43 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v38 optionalColor:v42];

    if (v43)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E520], v43);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata]();
    }
  }
  v44 = [(CKOrderMediaObject *)self metadata];
  v45 = [v44 tertiaryText];

  if (v45)
  {
    v46 = [(CKOrderMediaObject *)self metadata];
    v47 = [v46 tertiaryText];
    v48 = [v47 text];
    v49 = (void *)MEMORY[0x1E4F428B8];
    v50 = [(CKOrderMediaObject *)self metadata];
    v51 = [v50 tertiaryText];
    v52 = objc_msgSend(v49, "colorWithCGColor:", objc_msgSend(v51, "overrideColor"));
    v53 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v48 optionalColor:v52];

    if (v53)
    {
      CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6E528], v53);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[CKOrderMediaObject generatePreviewMetadata]();
    }
  }
  v54 = (void *)[(__CFDictionary *)v8 copy];

LABEL_41:

  return v54;
}

- (FKOrderMessagesPreviewMetadata)metadata
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  metadata = self->_metadata;
  if (metadata) {
    goto LABEL_20;
  }
  if (![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    v6 = (void *)MEMORY[0x1E4F1C9B8];
    uint64_t v7 = [(CKMediaObject *)self fileURL];
    double v8 = [v6 dataWithContentsOfURL:v7];

    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x2050000000;
    BOOL v9 = (void *)getFKOrderMessagesPreviewMetadataClass_softClass_0;
    uint64_t v22 = getFKOrderMessagesPreviewMetadataClass_softClass_0;
    if (!getFKOrderMessagesPreviewMetadataClass_softClass_0)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v24 = __getFKOrderMessagesPreviewMetadataClass_block_invoke_0;
      v25 = &unk_1E5620B90;
      v26 = &v19;
      __getFKOrderMessagesPreviewMetadataClass_block_invoke_0((uint64_t)&buf);
      BOOL v9 = (void *)v20[3];
    }
    double v10 = v9;
    _Block_object_dispose(&v19, 8);
    id v18 = 0;
    BOOL v11 = (FKOrderMessagesPreviewMetadata *)[[v10 alloc] initWithOrderData:v8 workingDirectory:0 error:&v18];
    id v12 = v18;
    double v13 = self->_metadata;
    self->_metadata = v11;

    int v14 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v14)
      {
        double v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          double v16 = [v12 localizedDescription];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v16;
          _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Failed to load preview metadata in-process: %@", (uint8_t *)&buf, 0xCu);
        }
LABEL_18:
      }
    }
    else if (v14)
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Unpacked order into metadata", (uint8_t *)&buf, 2u);
      }
      goto LABEL_18;
    }

    metadata = self->_metadata;
LABEL_20:
    id v5 = metadata;
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Attempting to load FKOrderMessagesPreviewMetadata. transcoderPreviewGenerationFailed = YES", (uint8_t *)&buf, 2u);
    }
  }
  id v5 = 0;
LABEL_21:

  return v5;
}

+ (id)_modifyColor:(id)a3 lighten:(BOOL)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  [a3 getHue:&v12 saturation:&v11 brightness:&v10 alpha:&v9];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CKOrderMediaObject__modifyColor_lighten___block_invoke;
  v7[3] = &__block_descriptor_65_e36___UIColor_16__0__UITraitCollection_8l;
  BOOL v8 = a4;
  v7[4] = v11;
  v7[5] = v10;
  v7[6] = v12;
  v7[7] = v9;
  id v5 = [MEMORY[0x1E4F428B8] colorWithDynamicProvider:v7];

  return v5;
}

uint64_t __43__CKOrderMediaObject__modifyColor_lighten___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  uint64_t v4 = [a2 userInterfaceStyle];
  double v5 = *(double *)(a1 + 40);
  if (v4 == 2)
  {
    double v3 = *(double *)(a1 + 32);
    if (*(unsigned char *)(a1 + 64))
    {
      double v6 = v5 + 0.13;
      double v3 = v3 + 0.03;
      goto LABEL_9;
    }
    double v7 = -0.07;
  }
  else if (*(unsigned char *)(a1 + 64))
  {
    double v7 = 0.03;
  }
  else
  {
    double v7 = -0.1;
  }
  double v6 = v5 + v7;
LABEL_9:
  if (v6 < 0.0) {
    double v6 = 0.0;
  }
  double v8 = fmin(v6, 1.0);
  if (v3 >= 0.0) {
    double v9 = v3;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = fmin(v9, 1.0);
  uint64_t v11 = (void *)MEMORY[0x1E4F428B8];
  double v12 = *(double *)(a1 + 48);
  double v13 = *(double *)(a1 + 56);

  return [v11 colorWithHue:v12 saturation:v10 brightness:v8 alpha:v13];
}

- (id)presentationPropertiesForWidth:(double)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  presentationProperties = self->_presentationProperties;
  if (presentationProperties)
  {
LABEL_18:
    double v12 = presentationProperties;
    goto LABEL_19;
  }
  double v6 = [(CKOrderMediaObject *)self previewMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F30AF8]);
    [v7 setStyle:53];
    double v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E508]];
    double v9 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E510]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned __int8 v10 = [v9 intValue];
    }
    else {
      unsigned __int8 v10 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v13 = [MEMORY[0x1E4F42A80] ckImageWithData:v8];
      int v14 = [(id)objc_opt_class() _paddedImage:v13 imageType:v10 bubbleWidth:a3];

      double v15 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v14];
      [v7 setImage:v15];
    }
    uint64_t v16 = *MEMORY[0x1E4F6E4D0];
    double v17 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E4D0]];

    if (v17)
    {
      id v18 = [v6 objectForKeyedSubscript:v16];
      uint64_t v19 = +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:v18];

      [v7 setBackgroundColor:v19];
      if (v10 == 1)
      {
        [v19 _luminance];
        uint64_t v21 = [(id)objc_opt_class() _modifyColor:v19 lighten:v20 > 0.5];
        [v7 setBackgroundColor:v21];
      }
      uint64_t v22 = (objc_class *)MEMORY[0x1E4F30A50];
      id v23 = v19;
      id v24 = objc_alloc_init(v22);
      [v24 setBackgroundColor:v23];

      [v7 setImageProperties:v24];
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F30A18]);
    [v7 setCaptionBar:v25];

    v26 = objc_opt_class();
    uint64_t v27 = [v7 captionBar];
    v28 = [v27 top];
    v29 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E518]];
    [v26 _updatePresentationPropertiesForRow:v28 representation:v29];

    v30 = objc_opt_class();
    v31 = [v7 captionBar];
    v32 = [v31 bottom];
    v33 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E520]];
    [v30 _updatePresentationPropertiesForRow:v32 representation:v33];

    v34 = objc_opt_class();
    v35 = [v7 captionBar];
    v36 = [v35 belowBottom];
    v37 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F6E528]];
    [v34 _updatePresentationPropertiesForRow:v36 representation:v37];

    v38 = self->_presentationProperties;
    self->_presentationProperties = (LPWebLinkPresentationProperties *)v7;

    presentationProperties = self->_presentationProperties;
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v40 = 138412290;
      v41 = v6;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid metadata file %@", (uint8_t *)&v40, 0xCu);
    }
  }
  double v12 = 0;
LABEL_19:

  return v12;
}

- (id)presentationPropertiesForReplyPreview
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [(CKOrderMediaObject *)self previewMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F30AF8]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F30A18]);
    [v3 setCaptionBar:v4];

    double v5 = objc_opt_class();
    double v6 = [v3 captionBar];
    id v7 = [v6 top];
    double v8 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E518]];
    [v5 _setTextForPresentationRow:v7 representation:v8];

    double v9 = objc_opt_class();
    unsigned __int8 v10 = [v3 captionBar];
    uint64_t v11 = [v10 bottom];
    double v12 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E520]];
    [v9 _setTextForPresentationRow:v11 representation:v12];

    double v13 = objc_opt_class();
    int v14 = [v3 captionBar];
    double v15 = [v14 belowBottom];
    uint64_t v16 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E528]];
    [v13 _setTextForPresentationRow:v15 representation:v16];

    double v17 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E508]];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v18 = [MEMORY[0x1E4F42A80] imageWithData:v17];
        uint64_t v19 = +[CKWalletMediaObjectMetadataHandler replyPreviewIconFromFullImage:v18];
        double v20 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v19];
        uint64_t v21 = [v3 captionBar];
        [v21 setLeadingIcon:v20];
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        id v25 = v2;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid metadata file %@", (uint8_t *)&v24, 0xCu);
      }
    }
    id v3 = 0;
  }

  return v3;
}

+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4
{
  id v5 = a3;
  if (a4)
  {
    uint64_t v6 = *MEMORY[0x1E4F6E538];
    id v13 = v5;
    id v7 = a4;
    double v8 = [v7 objectForKeyedSubscript:v6];
    double v9 = [v13 leading];
    [v9 setText:v8];

    unsigned __int8 v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6E530]];

    if (v10)
    {
      uint64_t v11 = +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:v10];
      double v12 = [v13 leading];
      [v12 setColor:v11];
    }
    id v5 = v13;
  }
}

+ (void)_setTextForPresentationRow:(id)a3 representation:(id)a4
{
  if (a4)
  {
    uint64_t v5 = *MEMORY[0x1E4F6E538];
    id v6 = a3;
    id v8 = [a4 objectForKeyedSubscript:v5];
    id v7 = [v6 leading];

    [v7 setText:v8];
  }
}

+ (id)_paddedImage:(id)a3 imageType:(unsigned __int8)a4 bubbleWidth:(double)a5
{
  int v6 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v6 == 1)
  {
    double v10 = (a5 + -100.0) * 0.5;
    if (v10 < 20.0) {
      double v10 = 20.0;
    }
    +[CKWalletMediaObjectMetadataHandler paddedImage:horizontalPadding:verticalPadding:](CKWalletMediaObjectMetadataHandler, "paddedImage:horizontalPadding:verticalPadding:", v7, v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 && IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v13[0] = 67109120;
        v13[1] = v6;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKOrderMediaObject: Invalid image type %d. Not applying padding.", (uint8_t *)v13, 8u);
      }
    }
    id v9 = v7;
  }
  uint64_t v11 = v9;

  return v11;
}

- (void)setMetadata:(id)a3
{
}

- (NSURL)overrideMetadataProperties
{
  return self->_overrideMetadataProperties;
}

- (void)setOverrideMetadataProperties:(id)a3
{
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  return self->_presentationProperties;
}

- (void)setPresentationProperties:(id)a3
{
}

- (NSURL)overrideFileURL
{
  return self->_overrideFileURL;
}

- (void)setOverrideFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFileURL, 0);
  objc_storeStrong((id *)&self->_presentationProperties, 0);
  objc_storeStrong((id *)&self->_overrideMetadataProperties, 0);

  objc_storeStrong((id *)&self->_metadata, 0);
}

- (void)generatePreviewMetadata
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

@end