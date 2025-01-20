@interface CKPassPreviewMediaObject
+ (BOOL)isPreviewable;
+ (BOOL)isSupported;
+ (BOOL)shouldUseTranscoderGeneratedPreviewSize;
+ (id)_colorFromColorString:(id)a3;
+ (id)_darkenColor:(id)a3;
+ (void)_setTextForPresentationRow:(id)a3 representation:(id)a4;
+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4;
+ (void)_updatePresentationPropertiesForRow:(id)a3 text:(id)a4 color:(id)a5;
- (BOOL)generatePreviewOutOfProcess;
- (BOOL)supportsPreviewMetadata;
- (BOOL)writePreviewMetadata:(id)a3 toURL:(id)a4 error:(id *)a5;
- (Class)balloonViewClassForWidth:(double)a3 orientation:(char)a4;
- (Class)previewBalloonViewClass;
- (LPWebLinkPresentationProperties)presentationProperties;
- (NSString)previewMetadataFilenameExtension;
- (NSURL)overrideFileURL;
- (NSURL)overrideMetadataProperties;
- (PKPassSecurePreviewContext)passPreview;
- (id)_initWithOverrideFileURL:(id)a3;
- (id)fileURL;
- (id)generatePreviewMetadata;
- (id)generateThumbnailFillToSize:(CGSize)a3 contentAlignmentInsets:(UIEdgeInsets)a4;
- (id)presentationPropertiesForReplyPreview;
- (id)previewMetadata;
- (id)previewMetadataWithContentsOfURL:(id)a3 error:(id *)a4;
- (void)generatePreviewMetadata;
- (void)setOverrideFileURL:(id)a3;
- (void)setOverrideMetadataProperties:(id)a3;
- (void)setPassPreview:(id)a3;
- (void)setPresentationProperties:(id)a3;
@end

@implementation CKPassPreviewMediaObject

+ (BOOL)isSupported
{
  return 1;
}

- (id)_initWithOverrideFileURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKPassPreviewMediaObject;
  v5 = [(CKPassPreviewMediaObject *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CKPassPreviewMediaObject *)v5 setOverrideFileURL:v4];
  }

  return v6;
}

- (BOOL)generatePreviewOutOfProcess
{
  if ([(CKMediaObject *)self isFromMe]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKPassPreviewMediaObject;
  return [(CKMediaObject *)&v4 generatePreviewOutOfProcess];
}

- (id)fileURL
{
  v3 = [(CKPassPreviewMediaObject *)self overrideFileURL];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKPassPreviewMediaObject;
    id v5 = [(CKMediaObject *)&v8 fileURL];
  }
  v6 = v5;

  return v6;
}

- (id)previewMetadata
{
  v3 = [(CKPassPreviewMediaObject *)self overrideMetadataProperties];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKPassPreviewMediaObject;
    id v5 = [(CKMediaObject *)&v8 previewMetadata];
  }
  v6 = v5;

  return v6;
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
  if ([(CKPassbookMediaObject *)self isSupported]
    && ([(CKPassPreviewMediaObject *)self previewMetadata],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (objc_super v8 = (void *)v7,
        BOOL v9 = [(CKMediaObject *)self shouldSuppressPreview],
        v8,
        !v9))
  {
    v10 = objc_opt_class();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CKPassPreviewMediaObject;
    v10 = [(CKMediaObject *)&v12 balloonViewClassForWidth:v4 orientation:a3];
  }

  return (Class)v10;
}

- (Class)previewBalloonViewClass
{
  if ([(CKPassbookMediaObject *)self isSupported]) {
    objc_opt_class();
  }
  else {
  v3 = [(CKMediaObject *)self placeholderBalloonViewClass];
  }

  return (Class)v3;
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
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }
    }
    v14 = 0;
  }
  else
  {
    if (v12)
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Generating thumbnail", v17, 2u);
      }
    }
    v14 = +[CKWalletMediaObjectMetadataHandler generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:](CKWalletMediaObjectMetadataHandler, "generateThumbnailFillToSize:contentAlignmentInsets:presentationProperties:", self->_presentationProperties, width, height, top, left, bottom, right);
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
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to generate preview in MobileSMS. transcoderPreviewGenerationFailed = YES", buf, 2u);
      }
    }
    v6 = 0;
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Generating metadata", v46, 2u);
      }
    }
    objc_super v8 = [(CKPassPreviewMediaObject *)self passPreview];
    if (v8)
    {
      BOOL v9 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = objc_opt_class();
      BOOL v11 = [v8 backgroundColor];
      int v12 = [v10 _colorFromColorString:v11];
      v13 = +[CKWalletMediaObjectMetadataHandler colorDictionaryFromColor:v12];

      if (v13)
      {
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E4D0], v13);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[CKPassPreviewMediaObject generatePreviewMetadata].cold.4();
      }

      if (objc_opt_respondsToSelector())
      {
        [v8 backgroundImage];
        id v15 = (id)IMCreatePNGImageDataFromCGImageRef();
        if (v15)
        {
          v16 = v15;
          CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E4D8], v15);
        }
      }
      uint64_t v17 = [v8 primaryText];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [v8 primaryColor];

        if (v19)
        {
          v20 = [v8 primaryText];
          v21 = objc_opt_class();
          v22 = [v8 primaryColor];
          v23 = [v21 _colorFromColorString:v22];
          v24 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v20 color:v23];

          if (v24)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E518], v24);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata]();
          }
        }
      }
      uint64_t v25 = [v8 secondaryText];
      if (v25)
      {
        v26 = (void *)v25;
        v27 = [v8 secondaryColor];

        if (v27)
        {
          v28 = [v8 secondaryText];
          v29 = objc_opt_class();
          v30 = [v8 secondaryColor];
          v31 = [v29 _colorFromColorString:v30];
          v32 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v28 color:v31];

          if (v32)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E520], v32);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata]();
          }
        }
      }
      uint64_t v33 = [v8 tertiaryText];
      if (v33)
      {
        v34 = (void *)v33;
        v35 = [v8 tertiaryColor];

        if (v35)
        {
          v36 = [v8 tertiaryText];
          v37 = objc_opt_class();
          v38 = [v8 tertiaryColor];
          v39 = [v37 _colorFromColorString:v38];
          v40 = +[CKWalletMediaObjectMetadataHandler dictionaryRepresentationForText:v36 color:v39];

          if (v40)
          {
            CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E528], v40);
          }
          else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            -[CKPassPreviewMediaObject generatePreviewMetadata]();
          }
        }
      }
      id v41 = v8;
      [v41 image];
      v42 = (void *)IMCreatePNGImageDataFromCGImageRef();
      if (v42) {
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E508], v42);
      }
      [v41 icon];
      v43 = (void *)IMCreatePNGImageDataFromCGImageRef();
      if (v43) {
        CFDictionarySetValue(v9, (const void *)*MEMORY[0x1E4F6E500], v43);
      }

      v6 = (void *)[(__CFDictionary *)v9 copy];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v45 = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Unable to generate pass preview", v45, 2u);
        }
      }
      v6 = 0;
    }
  }

  return v6;
}

- (id)presentationPropertiesForReplyPreview
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [(CKPassPreviewMediaObject *)self previewMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F30AF8]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F30A18]);
    [v3 setCaptionBar:v4];

    id v5 = objc_opt_class();
    v6 = [v3 captionBar];
    uint64_t v7 = [v6 top];
    objc_super v8 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E518]];
    [v5 _setTextForPresentationRow:v7 representation:v8];

    BOOL v9 = objc_opt_class();
    v10 = [v3 captionBar];
    BOOL v11 = [v10 bottom];
    int v12 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E520]];
    [v9 _setTextForPresentationRow:v11 representation:v12];

    v13 = objc_opt_class();
    v14 = [v3 captionBar];
    id v15 = [v14 belowBottom];
    v16 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E528]];
    [v13 _setTextForPresentationRow:v15 representation:v16];

    uint64_t v17 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F6E500]];
    if (v17)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v18 = [MEMORY[0x1E4F42A80] imageWithData:v17];
        v19 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v18];
        v20 = [v3 captionBar];
        [v20 setLeadingIcon:v19];
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        v24 = v2;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Invalid metadata file %@", (uint8_t *)&v23, 0xCu);
      }
    }
    id v3 = 0;
  }

  return v3;
}

+ (id)_colorFromColorString:(id)a3
{
  id v3 = a3;
  if (_colorFromColorString__onceToken != -1) {
    dispatch_once(&_colorFromColorString__onceToken, &__block_literal_global_202);
  }
  id v4 = [(id)_colorFromColorString__sPKPassClass colorFromString:v3];
  id v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithCGColor:", objc_msgSend(v4, "CGColor"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __50__CKPassPreviewMediaObject__colorFromColorString___block_invoke()
{
  uint64_t result = MEMORY[0x192FBA860](@"PKColor", @"PassKitCore");
  _colorFromColorString__sPKPassClass = result;
  return result;
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  presentationProperties = self->_presentationProperties;
  if (presentationProperties)
  {
LABEL_14:
    v14 = presentationProperties;
    goto LABEL_15;
  }
  id v4 = [(CKPassPreviewMediaObject *)self previewMetadata];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F30AF8]);
    [v5 setStyle:44];
    uint64_t v33 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E508]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [MEMORY[0x1E4F42A80] ckImageWithData:v33];
      uint64_t v7 = +[CKWalletMediaObjectMetadataHandler paddedImage:v6 horizontalPadding:20.0 verticalPadding:20.0];
      objc_super v8 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v7];
      [v5 setImage:v8];
    }
    BOOL v9 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E4D0]];
    v32 = +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:v9];

    [v5 setBackgroundColor:v32];
    v31 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E4D8]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = [MEMORY[0x1E4F42A80] ckImageWithData:v31];
      BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v10];
      [v5 setBackgroundImage:v11];

      int v12 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.05];
    }
    else
    {
      int v12 = [(id)objc_opt_class() _darkenColor:v32];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F30A50]);
    [v15 setBackgroundColor:v12];
    [v5 setImageProperties:v15];
    id v16 = objc_alloc_init(MEMORY[0x1E4F30A18]);
    [v5 setCaptionBar:v16];

    uint64_t v17 = objc_opt_class();
    v18 = [v5 captionBar];
    v19 = [v18 top];
    v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E518]];
    [v17 _updatePresentationPropertiesForRow:v19 representation:v20];

    v21 = objc_opt_class();
    v22 = [v5 captionBar];
    int v23 = [v22 bottom];
    v24 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E520]];
    [v21 _updatePresentationPropertiesForRow:v23 representation:v24];

    uint64_t v25 = objc_opt_class();
    v26 = [v5 captionBar];
    v27 = [v26 belowBottom];
    v28 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6E528]];
    [v25 _updatePresentationPropertiesForRow:v27 representation:v28];

    v29 = self->_presentationProperties;
    self->_presentationProperties = (LPWebLinkPresentationProperties *)v5;

    presentationProperties = self->_presentationProperties;
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v4;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Invalid metadata file %@", buf, 0xCu);
    }
  }
  v14 = 0;
LABEL_15:

  return v14;
}

+ (void)_updatePresentationPropertiesForRow:(id)a3 representation:(id)a4
{
  if (a4)
  {
    uint64_t v6 = *MEMORY[0x1E4F6E530];
    id v7 = a4;
    id v8 = a3;
    BOOL v9 = [v7 objectForKeyedSubscript:v6];
    id v11 = +[CKWalletMediaObjectMetadataHandler colorFromDictionaryRepresentation:v9];

    v10 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6E538]];

    [a1 _updatePresentationPropertiesForRow:v8 text:v10 color:v11];
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

+ (void)_updatePresentationPropertiesForRow:(id)a3 text:(id)a4 color:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [v9 leading];
  [v10 setText:v8];

  id v11 = [v9 leading];

  [v11 setColor:v7];
}

+ (id)_darkenColor:(id)a3
{
  double v8 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 0.0;
  [a3 getRed:&v8 green:&v7 blue:&v6 alpha:&v5];
  id v3 = [MEMORY[0x1E4F428B8] colorWithRed:v8 * 0.8 green:v7 * 0.8 blue:v6 * 0.8 alpha:v5];

  return v3;
}

- (PKPassSecurePreviewContext)passPreview
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (![(CKMediaObject *)self transcoderPreviewGenerationFailed])
  {
    passPreview = self->_passPreview;
    if (!passPreview)
    {
      double v5 = (void *)MEMORY[0x1E4F1CB10];
      double v6 = IMSafeTemporaryDirectory();
      double v7 = [v6 path];
      v22[0] = v7;
      v22[1] = @"PassPreview";
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      id v9 = [v5 fileURLWithPathComponents:v8];

      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v19 = 0;
      LOBYTE(v8) = [v10 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:0 error:&v19];
      id v11 = v19;

      if ((v8 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v21 = v11;
            _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Failed to create temp directory: %@", buf, 0xCu);
          }
        }
        goto LABEL_15;
      }
      int v12 = [(CKPassPreviewMediaObject *)self fileURL];
      uint64_t MessagesPreview = PKPassSecurePreviewContextCreateMessagesPreview(v12, v9);
      p_passPreview = &self->_passPreview;
      id v15 = *p_passPreview;
      *p_passPreview = (PKPassSecurePreviewContext *)MessagesPreview;

      passPreview = *p_passPreview;
    }
    id v16 = passPreview;
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKPassPreviewMediaObject: Attempting to load PKPassSecurePreviewContext. transcoderPreviewGenerationFailed = YES", buf, 2u);
    }
  }
LABEL_15:
  id v16 = 0;
LABEL_16:

  return v16;
}

- (void)setPresentationProperties:(id)a3
{
}

- (void)setPassPreview:(id)a3
{
}

- (NSURL)overrideFileURL
{
  return self->_overrideFileURL;
}

- (void)setOverrideFileURL:(id)a3
{
}

- (NSURL)overrideMetadataProperties
{
  return self->_overrideMetadataProperties;
}

- (void)setOverrideMetadataProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideMetadataProperties, 0);
  objc_storeStrong((id *)&self->_overrideFileURL, 0);
  objc_storeStrong((id *)&self->_passPreview, 0);

  objc_storeStrong((id *)&self->_presentationProperties, 0);
}

- (void)generatePreviewMetadata
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18EF18000, MEMORY[0x1E4F14500], v0, "REQUIRED_ATTRIBUTE - Warning, missing %@ to add to %s", v1, v2, v3, v4, v5);
}

@end