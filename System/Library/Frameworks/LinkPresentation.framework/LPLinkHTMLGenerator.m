@interface LPLinkHTMLGenerator
+ (void)initialize;
- (BOOL)_allowsTapToLoad;
- (BOOL)_canTapToLoad;
- (BOOL)_disableAutoPlay;
- (BOOL)_includeClassNamesWhenUsingInlineStyles;
- (BOOL)_includeDarkInterfaceInlineStyles;
- (BOOL)_useVariablesWhenUsingInlineStyles;
- (BOOL)applyCornerRadiusToLink;
- (BOOL)generateEmailCompatibleMarkup;
- (BOOL)isPreliminary;
- (BOOL)useInlineStyles;
- (DOMDocument)parentDocument;
- (DOMDocumentFragment)documentFragment;
- (LPCSSResolver)cssResolver;
- (LPLinkHTMLGenerator)init;
- (LPLinkHTMLGenerator)initWithMetadataLoadedFromURL:(id)a3 document:(id)a4;
- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4 document:(id)a5;
- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 document:(id)a4;
- (LPLinkHTMLGenerator)initWithURL:(id)a3 document:(id)a4;
- (LPLinkHTMLGeneratorDelegate)delegate;
- (LPLinkMetadata)metadata;
- (LPPointUnit)rootWidth;
- (LPTheme)theme;
- (NSURL)URL;
- (UIColor)backgroundColor;
- (UIColor)dominantImageBackgroundColor;
- (id)_URLForImage:(id)a3;
- (id)_URLForResource:(id)a3 withMIMEType:(id)a4;
- (id)_createCaptionBar;
- (id)_createMediaBottomCaptionBar;
- (id)_createMediaComponent;
- (id)_createMediaTopCaptionBar;
- (id)_createQuoteComponent;
- (id)_createRootElement;
- (id)_presentationOverrideBackgroundColorForProperties:(id)a3;
- (int64_t)style;
- (void)_computePresentationPropertiesFromMetadata;
- (void)_fetchMetadata;
- (void)_rebuildView;
- (void)_setDisableAutoPlay:(BOOL)a3;
- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4;
- (void)_setPresentationProperties:(id)a3;
- (void)clearCurrentLayout;
- (void)setApplyCornerRadiusToLink:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation LPLinkHTMLGenerator

+ (void)initialize
{
}

- (LPLinkHTMLGenerator)init
{
  return 0;
}

- (LPLinkHTMLGenerator)initWithMetadataLoadedFromURL:(id)a3 document:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(LPLinkHTMLGenerator *)self initWithURL:v6 document:v7];
  v9 = v8;
  if (v8)
  {
    [(LPLinkHTMLGenerator *)v8 _fetchMetadata];
    v10 = v9;
  }

  return v9;
}

- (LPLinkHTMLGenerator)initWithURL:(id)a3 document:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LPLinkHTMLGenerator;
  v9 = [(LPLinkHTMLGenerator *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v10->_usesComputedPresentationProperties = 1;
    v10->_applyCornerRadiusToLink = 1;
    LPWebLock(v11, v12);
    objc_storeStrong((id *)&v10->_parentDocument, a4);
    v13 = v10;
  }

  return v10;
}

- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 document:(id)a4
{
  v4 = [(LPLinkHTMLGenerator *)self initWithPresentationProperties:a3 URL:0 document:a4];
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }

  return v5;
}

- (LPLinkHTMLGenerator)initWithPresentationProperties:(id)a3 URL:(id)a4 document:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LPLinkHTMLGenerator;
  uint64_t v11 = [(LPLinkHTMLGenerator *)&v17 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_URL, a4);
    v12->_applyCornerRadiusToLink = 1;
    LPWebLock(v13, v14);
    objc_storeStrong((id *)&v12->_parentDocument, a5);
    [(LPLinkHTMLGenerator *)v12 _setPresentationProperties:v8];
    objc_super v15 = v12;
  }

  return v12;
}

- (id)_createRootElement
{
  return [(DOMDocument *)self->_parentDocument createElement:@"div"];
}

- (void)_fetchMetadata
{
  *(_WORD *)&self->_mayReceiveAdditionalMetadata = 257;
  URL = self->_URL;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke;
  v5[3] = &unk_1E5B050B8;
  v5[4] = self;
  v4 = +[LPMetadataProvider requestMetadataForURL:URL completionHandler:v5];
  objc_storeWeak((id *)&self->_pendingMetadataProvider, v4);
}

void __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke_2;
  v5[3] = &unk_1E5B04E18;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __37__LPLinkHTMLGenerator__fetchMetadata__block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 8), 0);
  [*(id *)(a1 + 32) _setMetadata:*(void *)(a1 + 40) isFinal:1];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 96));
    [v4 linkHTMLGenerator:*(void *)(a1 + 32) didFetchMetadata:*(void *)(*(void *)(a1 + 32) + 104)];
  }
}

- (DOMDocumentFragment)documentFragment
{
  LPWebLock(self, a2);
  if (!self->_everBuiltView) {
    [(LPLinkHTMLGenerator *)self _rebuildView];
  }
  id v3 = [(DOMElement *)self->_rootElement ownerDocument];
  id v4 = [v3 createDocumentFragment];

  id v5 = (id)[v4 appendChild:self->_rootElement];

  return (DOMDocumentFragment *)v4;
}

- (BOOL)_allowsTapToLoad
{
  return 0;
}

- (BOOL)generateEmailCompatibleMarkup
{
  return 1;
}

- (BOOL)useInlineStyles
{
  return 1;
}

- (BOOL)_useVariablesWhenUsingInlineStyles
{
  return 0;
}

- (BOOL)_includeClassNamesWhenUsingInlineStyles
{
  return 1;
}

- (BOOL)_includeDarkInterfaceInlineStyles
{
  return 1;
}

- (void)setApplyCornerRadiusToLink:(BOOL)a3
{
  if (self->_applyCornerRadiusToLink != a3)
  {
    self->_applyCornerRadiusToLink = a3;
    if (self->_everBuiltView) {
      [(LPLinkHTMLGenerator *)self _rebuildView];
    }
  }
}

- (id)_URLForResource:(id)a3 withMIMEType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [WeakRetained linkHTMLGenerator:self URLForResource:v6 withMIMEType:v7];
  id v10 = [v9 absoluteString];

  return v10;
}

- (id)_URLForImage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 _alternateHTMLImageGenerator];

  if (v5)
  {
    id v6 = [v4 _alternateHTMLImageGenerator];
    uint64_t v7 = v6[2]();

    id v4 = (id)v7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && (id v9 = WeakRetained,
        id v10 = objc_loadWeakRetained((id *)&self->_delegate),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    uint64_t v12 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v13 = [v4 data];
    uint64_t v14 = [v4 MIMEType];
    objc_super v15 = [v12 linkHTMLGenerator:self URLForResource:v13 withMIMEType:v14];
    v16 = [v15 absoluteString];
  }
  else
  {
    objc_super v17 = NSString;
    uint64_t v12 = [v4 MIMEType];
    uint64_t v13 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
    uint64_t v14 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v13];
    objc_super v15 = [v4 data];
    v18 = [v15 base64EncodedStringWithOptions:0];
    v16 = [v17 stringWithFormat:@"data:%@;base64,%@", v14, v18];
  }

  return v16;
}

- (void)clearCurrentLayout
{
  LPWebLock(self, a2);
  while ([(DOMElement *)self->_rootElement childElementCount])
  {
    rootElement = self->_rootElement;
    id v4 = [(DOMElement *)rootElement childNodes];
    id v5 = [v4 item:0];
    id v6 = (id)[(DOMElement *)rootElement removeChild:v5];
  }
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
  [(LPLinkHTMLGenerator *)self _computePresentationPropertiesFromMetadata];
  if (self->_everBuiltView)
  {
    [(LPLinkHTMLGenerator *)self _rebuildView];
  }
}

- (void)_setMetadata:(id)a3 isFinal:(BOOL)a4
{
  self->_mayReceiveAdditionalMetadata = !a4;
  [(LPLinkHTMLGenerator *)self setMetadata:a3];
}

- (void)_computePresentationPropertiesFromMetadata
{
  if (self->_usesComputedPresentationProperties)
  {
    id v4 = objc_alloc_init(LPLinkMetadataPresentationTransformer);
    [(LPLinkMetadataPresentationTransformer *)v4 setMetadata:self->_metadata];
    [(LPLinkMetadataPresentationTransformer *)v4 setURL:self->_URL];
    [(LPLinkMetadataPresentationTransformer *)v4 setComplete:!self->_mayReceiveAdditionalMetadata];
    [(LPLinkMetadataPresentationTransformer *)v4 setAllowsTapToLoad:0];
    id v3 = [(LPLinkMetadataPresentationTransformer *)v4 presentationProperties];
    [(LPLinkHTMLGenerator *)self _setPresentationProperties:v3];
  }
}

- (void)_setPresentationProperties:(id)a3
{
  id v52 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v52 isPreliminary];
  }
  else {
    char v4 = 0;
  }
  self->_isPreliminary = v4;
  if (objc_opt_respondsToSelector()) {
    int64_t v5 = [v52 style];
  }
  else {
    int64_t v5 = 0;
  }
  self->_int64_t style = v5;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v52 topCaption];
  }
  else
  {
    uint64_t v6 = 0;
  }
  v51 = (void *)v6;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = [v52 bottomCaption];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v50 = (void *)v7;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v52 trailingTopCaption];
  }
  else
  {
    id v8 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v52 trailingBottomCaption];
    if (v6) {
      goto LABEL_25;
    }
  }
  else
  {
    id v9 = 0;
    if (v6)
    {
LABEL_25:
      uint64_t v12 = objc_alloc_init(LPCaptionBarPresentationProperties);
      captionBar = self->_captionBar;
      self->_captionBar = v12;

      uint64_t v14 = [(LPCaptionBarPresentationProperties *)self->_captionBar top];
      objc_super v15 = [v14 leading];
      [v15 setText:v6];

      v16 = [(LPCaptionBarPresentationProperties *)self->_captionBar bottom];
      objc_super v17 = [v16 leading];
      [v17 setText:v7];

      v18 = [(LPCaptionBarPresentationProperties *)self->_captionBar top];
      v19 = [v18 trailing];
      [v19 setText:v8];

      char v11 = [(LPCaptionBarPresentationProperties *)self->_captionBar bottom];
      v20 = [v11 trailing];
      [v20 setText:v9];

      goto LABEL_27;
    }
  }
  if (v7 || v8 || v9) {
    goto LABEL_25;
  }
  if (objc_opt_respondsToSelector())
  {
    id v10 = [v52 captionBar];
    char v11 = self->_captionBar;
    self->_captionBar = v10;
  }
  else
  {
    char v11 = self->_captionBar;
    self->_captionBar = 0;
  }
LABEL_27:

  if (objc_opt_respondsToSelector())
  {
    v21 = [v52 icon];
    if (v21) {
      [(LPCaptionBarPresentationProperties *)self->_captionBar setTrailingIcon:v21];
    }
  }
  else
  {
    v21 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v22 = [v52 mediaTopCaption];
  }
  else
  {
    uint64_t v22 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v23 = [v52 mediaBottomCaption];
  }
  else
  {
    uint64_t v23 = 0;
  }
  if (v22 | v23)
  {
    v24 = objc_alloc_init(LPCaptionBarPresentationProperties);
    mediaBottomCaptionBar = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = v24;

    v26 = [(LPCaptionBarPresentationProperties *)self->_mediaBottomCaptionBar top];
    v27 = [v26 leading];
    [v27 setText:v22];

    v28 = [(LPCaptionBarPresentationProperties *)self->_mediaBottomCaptionBar bottom];
    v29 = [v28 leading];
    [v29 setText:v23];
  }
  else if (objc_opt_respondsToSelector())
  {
    v30 = [v52 mediaBottomCaptionBar];
    v28 = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = v30;
  }
  else
  {
    v28 = self->_mediaBottomCaptionBar;
    self->_mediaBottomCaptionBar = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    v31 = [v52 mediaTopCaptionBar];
    mediaTopCaptionBar = self->_mediaTopCaptionBar;
    self->_mediaTopCaptionBar = v31;
  }
  else
  {
    mediaTopCaptionBar = self->_mediaTopCaptionBar;
    self->_mediaTopCaptionBar = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    v33 = [v52 quotedText];
    quotedText = self->_quotedText;
    self->_quotedText = v33;
  }
  else
  {
    quotedText = self->_quotedText;
    self->_quotedText = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    v35 = [v52 image];
    image = self->_image;
    self->_image = v35;
  }
  else
  {
    image = self->_image;
    self->_image = 0;
  }

  if (objc_opt_respondsToSelector())
  {
    v37 = [v52 imageProperties];
    imageProperties = self->_imageProperties;
    self->_imageProperties = v37;
  }
  else
  {
    imageProperties = self->_imageProperties;
    self->_imageProperties = 0;
  }

  int64_t style = self->_style;
  v40 = [(LPCaptionBarPresentationProperties *)self->_captionBar trailingIcon];
  v41 = v40;
  if (!v40)
  {
    v41 = [(LPCaptionBarPresentationProperties *)self->_captionBar leadingIcon];
  }
  v42 = +[LPTheme themeWithStyle:style icon:v41 platform:3 sizeClass:0 sizeClassParameters:0 hasButton:0 preferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
  theme = self->_theme;
  self->_theme = v42;

  if (!v40) {
  v44 = [(LPLinkHTMLGenerator *)self _presentationOverrideBackgroundColorForProperties:v52];
  }
  v45 = v44;
  if (v44)
  {
    v46 = v44;
  }
  else
  {
    v46 = [(LPTheme *)self->_theme backgroundColor];
  }
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v46;

  if (objc_opt_respondsToSelector())
  {
    v48 = [v52 dominantImageBackgroundColor];
    dominantImageBackgroundColor = self->_dominantImageBackgroundColor;
    self->_dominantImageBackgroundColor = v48;
  }
  else
  {
    dominantImageBackgroundColor = self->_dominantImageBackgroundColor;
    self->_dominantImageBackgroundColor = 0;
  }
}

- (id)_presentationOverrideBackgroundColorForProperties:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(LPTheme *)self->_theme mediaImage];
  [v5 darkeningAmount];
  uint64_t v6 = presentationOverrideBackgroundColorForProperties(v4);

  return v6;
}

- (LPPointUnit)rootWidth
{
  BOOL v3 = shouldUseSkinnyWidth(self->_style, self->_quotedText, self->_image, 0, 0);
  id v4 = [(LPLinkHTMLGenerator *)self theme];
  int64_t v5 = [v4 captionBar];
  uint64_t v6 = [v5 minimumWidth];
  [v6 value];
  double v8 = v7;

  id v9 = [(LPLinkHTMLGenerator *)self theme];
  id v10 = [v9 mediaTopCaptionBar];
  char v11 = [v10 minimumWidth];
  [v11 value];
  double v13 = v12;

  uint64_t v14 = [(LPLinkHTMLGenerator *)self theme];
  objc_super v15 = [v14 mediaBottomCaptionBar];
  v16 = [v15 minimumWidth];
  [v16 value];
  double v18 = 300.0;
  if (v3) {
    double v18 = 228.0;
  }
  double v19 = fmax(fmax(fmax(v18, v8), v13), v17);

  v20 = [[LPPointUnit alloc] initWithValue:v19];

  return v20;
}

- (id)_createCaptionBar
{
  BOOL v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  id v4 = [(LPTheme *)self->_theme captionBar];
  int64_t v5 = [(LPEmailCompatibleHTMLCaptionBarComponent *)v3 initWithStyle:v4 presentationProperties:self->_captionBar themePath:@"captionBar" generator:self];

  return v5;
}

- (id)_createMediaTopCaptionBar
{
  BOOL v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  id v4 = [(LPTheme *)self->_theme mediaTopCaptionBar];
  int64_t v5 = [(LPEmailCompatibleHTMLCaptionBarComponent *)v3 initWithStyle:v4 presentationProperties:self->_mediaTopCaptionBar themePath:@"mediaTopCaptionBar" generator:self];

  return v5;
}

- (id)_createMediaBottomCaptionBar
{
  BOOL v3 = [LPEmailCompatibleHTMLCaptionBarComponent alloc];
  id v4 = [(LPTheme *)self->_theme mediaBottomCaptionBar];
  int64_t v5 = [(LPEmailCompatibleHTMLCaptionBarComponent *)v3 initWithStyle:v4 presentationProperties:self->_mediaBottomCaptionBar themePath:@"mediaBottomCaptionBar" generator:self];

  return v5;
}

- (id)_createMediaComponent
{
  if (self->_image)
  {
    BOOL v3 = [LPEmailCompatibleHTMLImageComponent alloc];
    image = self->_image;
    int64_t v5 = [(LPTheme *)self->_theme mediaImage];
    uint64_t v6 = [(LPEmailCompatibleHTMLImageComponent *)v3 initWithImage:image style:v5 themePath:@"mediaImage" generator:self];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_createQuoteComponent
{
  BOOL v3 = [LPEmailCompatibleHTMLQuoteComponent alloc];
  quotedText = self->_quotedText;
  int64_t v5 = [(LPTheme *)self->_theme quotedText];
  uint64_t v6 = [(LPEmailCompatibleHTMLQuoteComponent *)v3 initWithText:quotedText style:v5 themePath:@"quotedText" generator:self];

  return v6;
}

- (void)_rebuildView
{
  LPWebLock(self, a2);
  if (!self->_rootElement)
  {
    BOOL v3 = [(LPLinkHTMLGenerator *)self _createRootElement];
    rootElement = self->_rootElement;
    self->_rootElement = v3;
  }
  int64_t v5 = [[LPCSSResolver alloc] initWithTheme:self->_theme];
  cssResolver = self->_cssResolver;
  self->_cssResolver = v5;

  [(LPLinkHTMLGenerator *)self clearCurrentLayout];
  BOOL v7 = [(LPCaptionBarPresentationProperties *)self->_captionBar hasAnyContent];
  quotedText = self->_quotedText;
  image = self->_image;
  id v10 = [[LPEmailCompatibleHTMLLinkComponent alloc] initWithURL:self->_URL generator:self];
  linkComponent = self->_linkComponent;
  self->_linkComponent = &v10->super;

  v20 = [[LPEmailCompatibleHTMLTableComponent alloc] initWithThemePath:@"emailBaseTable" generator:self];
  if (image)
  {
    double v12 = [(LPLinkHTMLGenerator *)self _createMediaComponent];
    if (v12) {
      [(LPEmailCompatibleHTMLTableComponent *)v20 addChildAsRow:v12];
    }
  }
  if (quotedText)
  {
    double v13 = [(LPLinkHTMLGenerator *)self _createQuoteComponent];
    if (v13) {
      [(LPEmailCompatibleHTMLTableComponent *)v20 addChildAsRow:v13];
    }
  }
  if (v7)
  {
    if ([(LPCaptionBarPresentationProperties *)self->_mediaTopCaptionBar hasAnyContent])
    {
      uint64_t v14 = [(LPLinkHTMLGenerator *)self _createMediaTopCaptionBar];
      [(LPEmailCompatibleHTMLTableComponent *)v20 addChildAsRow:v14];
    }
    if ([(LPCaptionBarPresentationProperties *)self->_mediaBottomCaptionBar hasAnyContent])
    {
      objc_super v15 = [(LPLinkHTMLGenerator *)self _createMediaBottomCaptionBar];
      [(LPEmailCompatibleHTMLTableComponent *)v20 addChildAsRow:v15];
    }
    v16 = [(LPLinkHTMLGenerator *)self _createCaptionBar];
    [(LPEmailCompatibleHTMLTableComponent *)v20 addChildAsRow:v16];
  }
  [(LPHTMLComponent *)self->_linkComponent addChild:v20];
  double v17 = self->_rootElement;
  double v18 = [(LPHTMLComponent *)self->_linkComponent element];
  id v19 = (id)[(DOMElement *)v17 appendChild:v18];

  self->_everBuiltView = 1;
}

- (BOOL)_canTapToLoad
{
  return 0;
}

- (LPLinkHTMLGeneratorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LPLinkHTMLGeneratorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)applyCornerRadiusToLink
{
  return self->_applyCornerRadiusToLink;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)URL
{
  return self->_URL;
}

- (DOMDocument)parentDocument
{
  return self->_parentDocument;
}

- (LPCSSResolver)cssResolver
{
  return self->_cssResolver;
}

- (int64_t)style
{
  return self->_style;
}

- (LPTheme)theme
{
  return self->_theme;
}

- (BOOL)isPreliminary
{
  return self->_isPreliminary;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)dominantImageBackgroundColor
{
  return self->_dominantImageBackgroundColor;
}

- (BOOL)_disableAutoPlay
{
  return self->__disableAutoPlay;
}

- (void)_setDisableAutoPlay:(BOOL)a3
{
  self->__disableAutoPlay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dominantImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_cssResolver, 0);
  objc_storeStrong((id *)&self->_parentDocument, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkComponent, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_quotedText, 0);
  objc_storeStrong((id *)&self->_mediaBottomCaptionBar, 0);
  objc_storeStrong((id *)&self->_mediaTopCaptionBar, 0);
  objc_storeStrong((id *)&self->_captionBar, 0);

  objc_destroyWeak((id *)&self->_pendingMetadataProvider);
}

@end