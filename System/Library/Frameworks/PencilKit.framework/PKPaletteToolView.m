@interface PKPaletteToolView
+ (PKPaletteToolView)toolViewWithIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (BOOL)isCustomTool;
- (BOOL)isErasingTool;
- (BOOL)isGenerationTool;
- (BOOL)isHandwritingTool;
- (BOOL)isInkingTool;
- (BOOL)isLassoTool;
- (BOOL)isRulerTool;
- (BOOL)supportsDisplayingSelectedColor;
- (CGSize)intrinsicContentSize;
- (NSDictionary)toolProperties;
- (NSLayoutConstraint)imageViewBottomAnchorConstraint;
- (NSLayoutConstraint)imageViewHeightAnchorConstraint;
- (NSLayoutConstraint)imageViewLeftAnchorConstraint;
- (NSLayoutConstraint)imageViewRightAnchorConstraint;
- (NSLayoutConstraint)imageViewTopAnchorConstraint;
- (NSLayoutConstraint)imageViewWidthAnchorConstraint;
- (NSLayoutConstraint)toolShadowViewBottomAnchorConstraint;
- (NSLayoutConstraint)toolShadowViewLeftAnchorConstraint;
- (NSLayoutConstraint)toolShadowViewRightAnchorConstraint;
- (NSLayoutConstraint)toolShadowViewTopAnchorConstraint;
- (NSString)toolIdentifier;
- (NSString)toolName;
- (NSString)toolVariant;
- (PKPaletteAttributeViewController)attributeViewController;
- (PKPaletteErasingTool)erasingTool;
- (PKPaletteHandwritingTool)handwritingTool;
- (PKPaletteInkingTool)inkingTool;
- (PKPaletteToolImageContentView)imageContentView;
- (PKPaletteToolShadowPathView)toolShadowView;
- (PKPaletteToolView)initWithToolIdentifier:(id)a3 configuration:(id)a4 toolProperties:(id)a5;
- (PKPaletteToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (PKToolConfiguration)configuration;
- (UIPointerInteraction)pointerInteraction;
- (double)_toolSelectedOffset;
- (double)scalingFactor;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)colorUserInterfaceStyle;
- (unint64_t)cornerLocation;
- (unint64_t)edgeLocation;
- (void)_reloadToolImage;
- (void)_reloadToolImageSizeConstraints;
- (void)_setToolImageNeedsReload;
- (void)_updateToolShadowView;
- (void)layoutSubviews;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)setColorUserInterfaceStyle:(int64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setCornerLocation:(unint64_t)a3;
- (void)setEdgeLocation:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageViewBottomAnchorConstraint:(id)a3;
- (void)setImageViewHeightAnchorConstraint:(id)a3;
- (void)setImageViewLeftAnchorConstraint:(id)a3;
- (void)setImageViewRightAnchorConstraint:(id)a3;
- (void)setImageViewTopAnchorConstraint:(id)a3;
- (void)setImageViewWidthAnchorConstraint:(id)a3;
- (void)setPointerInteraction:(id)a3;
- (void)setScalingFactor:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSupportsDisplayingSelectedColor:(BOOL)a3;
- (void)setToolProperties:(id)a3;
- (void)setToolShadowView:(id)a3;
- (void)setToolShadowViewBottomAnchorConstraint:(id)a3;
- (void)setToolShadowViewLeftAnchorConstraint:(id)a3;
- (void)setToolShadowViewRightAnchorConstraint:(id)a3;
- (void)setToolShadowViewTopAnchorConstraint:(id)a3;
- (void)showTooltip:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation PKPaletteToolView

+ (PKPaletteToolView)toolViewWithIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  v7 = (__CFString *)a3;
  id v8 = a4;
  id v9 = a5;
  if (([(__CFString *)v7 isEqualToString:@"com.apple.ink.eraser"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.objectEraser"] & 1) != 0)
  {
    v10 = off_1E64C3E88;
LABEL_13:
    v11 = v7;
    goto LABEL_14;
  }
  if (([(__CFString *)v7 isEqualToString:@"com.apple.ink.pen"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.pencil"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.marker"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.custom"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.fountainpen"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.watercolor"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.monoline"] & 1) != 0
    || ([(__CFString *)v7 isEqualToString:@"com.apple.ink.crayon"] & 1) != 0)
  {
    v10 = off_1E64C3EB0;
    goto LABEL_13;
  }
  if ([(__CFString *)v7 isEqualToString:@"com.apple.ink.lasso"])
  {
    v10 = off_1E64C3F38;
    goto LABEL_13;
  }
  v11 = @"com.apple.ink.handwriting";
  if (([(__CFString *)v7 isEqualToString:@"com.apple.ink.handwriting"] & 1) == 0)
  {
    int v14 = [(__CFString *)v7 isEqualToString:@"com.apple.ink.generationtool"];
    v10 = off_1E64C3FC8;
    if (v14) {
      v10 = off_1E64C3EA8;
    }
    goto LABEL_13;
  }
  v10 = off_1E64C3E98;
LABEL_14:
  v12 = (void *)[objc_alloc(*v10) initWithToolIdentifier:v11 variant:v8 configuration:v9];

  return (PKPaletteToolView *)v12;
}

- (PKPaletteToolView)initWithToolIdentifier:(id)a3 configuration:(id)a4 toolProperties:(id)a5
{
  id v8 = a5;
  id v9 = [(PKPaletteToolView *)self initWithToolIdentifier:a3 variant:0 configuration:a4];
  [(PKPaletteToolView *)v9 setToolProperties:v8];

  return v9;
}

- (PKPaletteToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  v75[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v74.receiver = self;
  v74.super_class = (Class)PKPaletteToolView;
  v11 = -[PKPaletteToolView initWithFrame:](&v74, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    toolIdentifier = v11->_toolIdentifier;
    v11->_toolIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    toolVariant = v11->_toolVariant;
    v11->_toolVariant = (NSString *)v14;

    toolProperties = v11->_toolProperties;
    v11->_toolProperties = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v11->_scalingFactor = 1.0;
    uint64_t v17 = [v10 copy];
    configuration = v11->_configuration;
    v11->_configuration = (PKToolConfiguration *)v17;

    v11->_supportsDisplayingSelectedColor = [v10 supportsColor];
    v19 = [[PKPaletteToolShadowPathView alloc] initWithToolConfiguration:v10];
    toolShadowView = v11->_toolShadowView;
    v11->_toolShadowView = v19;

    [(PKPaletteToolShadowPathView *)v11->_toolShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolView *)v11 addSubview:v11->_toolShadowView];
    v21 = [PKPaletteToolImageContentView alloc];
    id v22 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    uint64_t v23 = -[PKPaletteToolImageContentView initWithImageView:]((uint64_t)v21, v22);
    imageContentView = v11->_imageContentView;
    v11->_imageContentView = (PKPaletteToolImageContentView *)v23;

    [(PKPaletteToolImageContentView *)v11->_imageContentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKPaletteToolImageContentView *)v11->_imageContentView setUserInteractionEnabled:0];
    v25 = [(PKPaletteToolImageContentView *)v11->_imageContentView layer];
    [v25 setMasksToBounds:0];

    [(PKPaletteToolView *)v11 addSubview:v11->_imageContentView];
    v26 = [(PKPaletteToolImageContentView *)v11->_imageContentView widthAnchor];
    uint64_t v27 = [v26 constraintEqualToConstant:0.0];
    imageViewWidthAnchorConstraint = v11->_imageViewWidthAnchorConstraint;
    v11->_imageViewWidthAnchorConstraint = (NSLayoutConstraint *)v27;

    v29 = [(PKPaletteToolImageContentView *)v11->_imageContentView heightAnchor];
    uint64_t v30 = [v29 constraintEqualToConstant:0.0];
    imageViewHeightAnchorConstraint = v11->_imageViewHeightAnchorConstraint;
    v11->_imageViewHeightAnchorConstraint = (NSLayoutConstraint *)v30;

    LODWORD(v32) = 1148829696;
    [(NSLayoutConstraint *)v11->_imageViewWidthAnchorConstraint setPriority:v32];
    LODWORD(v33) = 1148829696;
    [(NSLayoutConstraint *)v11->_imageViewHeightAnchorConstraint setPriority:v33];
    v34 = (void *)MEMORY[0x1E4F28DC8];
    v75[0] = v11->_imageViewWidthAnchorConstraint;
    v75[1] = v11->_imageViewHeightAnchorConstraint;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:2];
    [v34 activateConstraints:v35];

    v36 = [(PKPaletteToolImageContentView *)v11->_imageContentView topAnchor];
    v37 = [(PKPaletteToolView *)v11 topAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37];
    imageViewTopAnchorConstraint = v11->_imageViewTopAnchorConstraint;
    v11->_imageViewTopAnchorConstraint = (NSLayoutConstraint *)v38;

    v40 = [(PKPaletteToolImageContentView *)v11->_imageContentView bottomAnchor];
    v41 = [(PKPaletteToolView *)v11 bottomAnchor];
    uint64_t v42 = [v40 constraintEqualToAnchor:v41];
    imageViewBottomAnchorConstraint = v11->_imageViewBottomAnchorConstraint;
    v11->_imageViewBottomAnchorConstraint = (NSLayoutConstraint *)v42;

    v44 = [(PKPaletteToolImageContentView *)v11->_imageContentView leftAnchor];
    v45 = [(PKPaletteToolView *)v11 leftAnchor];
    uint64_t v46 = [v44 constraintEqualToAnchor:v45];
    imageViewLeftAnchorConstraint = v11->_imageViewLeftAnchorConstraint;
    v11->_imageViewLeftAnchorConstraint = (NSLayoutConstraint *)v46;

    v48 = [(PKPaletteToolImageContentView *)v11->_imageContentView rightAnchor];
    v49 = [(PKPaletteToolView *)v11 rightAnchor];
    uint64_t v50 = [v48 constraintEqualToAnchor:v49];
    imageViewRightAnchorConstraint = v11->_imageViewRightAnchorConstraint;
    v11->_imageViewRightAnchorConstraint = (NSLayoutConstraint *)v50;

    v52 = [(PKPaletteToolShadowPathView *)v11->_toolShadowView topAnchor];
    v53 = [(PKPaletteToolImageContentView *)v11->_imageContentView topAnchor];
    uint64_t v54 = [v52 constraintEqualToAnchor:v53];
    toolShadowViewTopAnchorConstraint = v11->_toolShadowViewTopAnchorConstraint;
    v11->_toolShadowViewTopAnchorConstraint = (NSLayoutConstraint *)v54;

    v56 = [(PKPaletteToolShadowPathView *)v11->_toolShadowView leftAnchor];
    v57 = [(PKPaletteToolImageContentView *)v11->_imageContentView leftAnchor];
    uint64_t v58 = [v56 constraintEqualToAnchor:v57];
    toolShadowViewLeftAnchorConstraint = v11->_toolShadowViewLeftAnchorConstraint;
    v11->_toolShadowViewLeftAnchorConstraint = (NSLayoutConstraint *)v58;

    v60 = [(PKPaletteToolShadowPathView *)v11->_toolShadowView bottomAnchor];
    v61 = [(PKPaletteToolImageContentView *)v11->_imageContentView bottomAnchor];
    uint64_t v62 = [v60 constraintEqualToAnchor:v61];
    toolShadowViewBottomAnchorConstraint = v11->_toolShadowViewBottomAnchorConstraint;
    v11->_toolShadowViewBottomAnchorConstraint = (NSLayoutConstraint *)v62;

    v64 = [(PKPaletteToolShadowPathView *)v11->_toolShadowView rightAnchor];
    v65 = [(PKPaletteToolImageContentView *)v11->_imageContentView rightAnchor];
    uint64_t v66 = [v64 constraintEqualToAnchor:v65];
    toolShadowViewRightAnchorConstraint = v11->_toolShadowViewRightAnchorConstraint;
    v11->_toolShadowViewRightAnchorConstraint = (NSLayoutConstraint *)v66;

    uint64_t v68 = [objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v11];
    pointerInteraction = v11->_pointerInteraction;
    v11->_pointerInteraction = (UIPointerInteraction *)v68;

    [(PKPaletteToolView *)v11 addInteraction:v11->_pointerInteraction];
    [(PKPaletteToolView *)v11 _setToolImageNeedsReload];
    [(PKPaletteToolView *)v11 _reloadToolImage];
    [(PKPaletteToolView *)v11 _updateToolShadowView];
    [(PKPaletteToolView *)v11 setUserInteractionEnabled:1];
    -[PKPaletteToolView setHitTestInsets:](v11, "setHitTestInsets:", -8.0, -8.0, -8.0, -8.0);
    [(PKPaletteToolView *)v11 setTintAdjustmentMode:1];
    v70 = [(PKPaletteToolView *)v11 toolName];
    [(PKPaletteToolView *)v11 setAccessibilityLabel:v70];

    [(PKPaletteToolView *)v11 setShowsLargeContentViewer:1];
    id v71 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PKPaletteToolView *)v11 addInteraction:v71];

    v72 = [(PKPaletteToolView *)v11 toolName];
    [(PKPaletteToolView *)v11 setLargeContentTitle:v72];

    [(PKPaletteToolView *)v11 _updateRemoteEffects];
  }

  return v11;
}

- (void)layoutSubviews
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PKPaletteToolView;
  [(PKPaletteToolView *)&v14 layoutSubviews];
  v3 = [(PKPaletteToolView *)self layer];
  [v3 setAllowsEdgeAntialiasing:1];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v4 = [(PKPaletteToolView *)self layer];
  v5 = [v4 sublayers];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) setAllowsEdgeAntialiasing:1];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  if (self->_toolImageNeedsReload)
  {
    [(PKPaletteToolView *)self _reloadToolImage];
    self->_toolImageNeedsReload = 0;
  }
}

- (BOOL)isInkingTool
{
  return [(PKPaletteToolView *)self conformsToProtocol:&unk_1F204ABD8];
}

- (PKPaletteInkingTool)inkingTool
{
  if ([(PKPaletteToolView *)self isInkingTool]) {
    v3 = self;
  }
  else {
    v3 = 0;
  }

  return (PKPaletteInkingTool *)v3;
}

- (BOOL)isRulerTool
{
  v2 = [(PKPaletteToolView *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.tool.ruler"];

  return v3;
}

- (BOOL)isErasingTool
{
  return [(PKPaletteToolView *)self conformsToProtocol:&unk_1F2061A40];
}

- (PKPaletteErasingTool)erasingTool
{
  if ([(PKPaletteToolView *)self isErasingTool]) {
    char v3 = self;
  }
  else {
    char v3 = 0;
  }

  return (PKPaletteErasingTool *)v3;
}

- (BOOL)isLassoTool
{
  return [(PKPaletteToolView *)self conformsToProtocol:&unk_1F2076AF0];
}

- (BOOL)isGenerationTool
{
  v2 = [(PKPaletteToolView *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.generationtool"];

  return v3;
}

- (BOOL)isHandwritingTool
{
  return [(PKPaletteToolView *)self conformsToProtocol:&unk_1F2044338];
}

- (PKPaletteHandwritingTool)handwritingTool
{
  if ([(PKPaletteToolView *)self isHandwritingTool]) {
    char v3 = self;
  }
  else {
    char v3 = 0;
  }

  return (PKPaletteHandwritingTool *)v3;
}

- (BOOL)isCustomTool
{
  v2 = [(PKPaletteToolView *)self toolIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.ink.custom"];

  return v3;
}

- (NSString)toolName
{
  v2 = [(PKPaletteToolView *)self configuration];
  char v3 = [v2 localizedName];

  return (NSString *)v3;
}

- (PKPaletteAttributeViewController)attributeViewController
{
  if (!self->_attributeViewController)
  {
    char v3 = [(PKPaletteToolView *)self configuration];
    v4 = [v3 viewControllerProvider];

    if (v4)
    {
      v5 = [(PKPaletteToolView *)self configuration];
      uint64_t v6 = [v5 viewControllerProvider];
      uint64_t v7 = v6[2]();

      if (!v7)
      {
        id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"view controller from configuration must not be nil." userInfo:0];
        objc_exception_throw(v12);
      }
      uint64_t v8 = [[PKPaletteAttributeViewControllerContainer alloc] initWithContentViewController:v7];
      attributeViewController = self->_attributeViewController;
      self->_attributeViewController = &v8->super;
    }
  }
  long long v10 = self->_attributeViewController;

  return v10;
}

- (void)setScalingFactor:(double)a3
{
  double scalingFactor = self->_scalingFactor;
  if (scalingFactor != a3 && vabdd_f64(scalingFactor, a3) >= fabs(a3 * 0.000000999999997))
  {
    self->_double scalingFactor = a3;
    [(PKPaletteToolView *)self _updateToolShadowView];
    [(PKPaletteToolView *)self _reloadToolImageSizeConstraints];
    [(PKPaletteToolView *)self invalidateIntrinsicContentSize];
    [(PKPaletteToolView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateToolShadowView
{
  unint64_t v3 = [(PKPaletteToolView *)self edgeLocation];
  v4 = [(PKPaletteToolView *)self toolShadowView];
  [v4 setEdgeLocation:v3];

  [(PKPaletteToolView *)self scalingFactor];
  double v6 = v5;
  uint64_t v7 = [(PKPaletteToolView *)self toolShadowView];
  [v7 setScalingFactor:v6];

  uint64_t v8 = [(PKToolConfiguration *)self->_configuration shadowPath];
  long long v13 = v8;
  if (!v8 || (int v9 = [v8 isEmpty], v10 = v13, v9))
  {
    long long v11 = [(PKPaletteToolView *)self toolShadowView];
    id v12 = [(PKPaletteToolView *)self layer];
    [v11 applyShadowToLayer:v12];

    long long v10 = v13;
  }
}

- (void)_reloadToolImageSizeConstraints
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PKPaletteToolView *)self imageContentView];
  v4 = (void *)v3;
  if (v3) {
    double v5 = *(void **)(v3 + 416);
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 image];
  [v7 size];
  double v9 = v8;
  [(PKPaletteToolView *)self scalingFactor];
  double v11 = v9 * v10;

  uint64_t v12 = [(PKPaletteToolView *)self imageContentView];
  long long v13 = (void *)v12;
  if (v12) {
    objc_super v14 = *(void **)(v12 + 416);
  }
  else {
    objc_super v14 = 0;
  }
  id v15 = v14;
  uint64_t v16 = [v15 image];
  [v16 size];
  double v18 = v17;
  [(PKPaletteToolView *)self scalingFactor];
  double v20 = v19;

  v21 = os_log_create("com.apple.pencilkit", "PKPalette");
  double v22 = v18 * v20;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [(PKPaletteToolView *)self imageContentView];
    v24 = (void *)v23;
    if (v23) {
      v25 = *(void **)(v23 + 416);
    }
    else {
      v25 = 0;
    }
    id v26 = v25;
    uint64_t v27 = [v26 image];
    [v27 size];
    v28 = NSStringFromCGSize(v37);
    [(PKPaletteToolView *)self scalingFactor];
    int v32 = 138478083;
    double v33 = v28;
    __int16 v34 = 2049;
    uint64_t v35 = v29;
    _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "Reload tool image size constraints, image size: %{private}@, scaling factor: %{private}.2f", (uint8_t *)&v32, 0x16u);
  }
  uint64_t v30 = [(PKPaletteToolView *)self imageViewWidthAnchorConstraint];
  [v30 setConstant:v11];

  v31 = [(PKPaletteToolView *)self imageViewHeightAnchorConstraint];
  [v31 setConstant:v22];
}

- (void)_setToolImageNeedsReload
{
  self->_toolImageNeedsReload = 1;
  [(PKPaletteToolView *)self setNeedsLayout];
}

- (void)_reloadToolImage
{
  if (self->_toolImageNeedsReload)
  {
    *(void *)buf = 0;
    uint64_t v36 = buf;
    uint64_t v37 = 0x3032000000;
    uint64_t v38 = __Block_byref_object_copy__19;
    v39 = __Block_byref_object_dispose__19;
    id v40 = 0;
    uint64_t v3 = [(PKPaletteToolView *)self configuration];
    v4 = (void *)v3;
    if (v3) {
      double v5 = *(void **)(v3 + 160);
    }
    else {
      double v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      uint64_t v7 = [(PKPaletteToolView *)self toolIdentifier];
      double v8 = [(PKPaletteToolView *)self toolProperties];
      double v9 = +[PKInk inkWithIdentifier:v7 properties:v8];

      double v10 = [(PKPaletteToolView *)self traitCollection];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __37__PKPaletteToolView__reloadToolImage__block_invoke;
      v34[3] = &unk_1E64C9010;
      v34[5] = v9;
      v34[6] = buf;
      v34[4] = self;
      [v10 performAsCurrentTraitCollection:v34];

      double v11 = [*((id *)v36 + 5) accessibilityLabel];
      if (v11)
      {
        [(PKPaletteToolView *)self setAccessibilityLabel:v11];
      }
      else
      {
        double v20 = [(PKPaletteToolView *)self toolName];
        [(PKPaletteToolView *)self setAccessibilityLabel:v20];
      }
    }
    else
    {
      long long v13 = [(PKPaletteToolView *)self configuration];
      uint64_t v14 = [v13 baseImage];
      id v15 = (void *)*((void *)v36 + 5);
      *((void *)v36 + 5) = v14;

      uint64_t v16 = [*((id *)v36 + 5) configuration];
      double v17 = [(PKPaletteToolView *)self traitCollection];
      double v9 = [v16 configurationWithTraitCollection:v17];

      uint64_t v18 = [*((id *)v36 + 5) imageWithConfiguration:v9];
      double v19 = (void *)*((void *)v36 + 5);
      *((void *)v36 + 5) = v18;
    }
    if ([(PKPaletteToolView *)self edgeLocation] == 2)
    {
      v21 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v22 = [*((id *)v36 + 5) CGImage];
      [*((id *)v36 + 5) scale];
      uint64_t v23 = objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 3);
    }
    else
    {
      if ([(PKPaletteToolView *)self edgeLocation] != 8)
      {
LABEL_18:
        uint64_t v27 = *((void *)v36 + 5);
        uint64_t v28 = [(PKPaletteToolView *)self imageContentView];
        uint64_t v29 = (void *)v28;
        if (v28) {
          uint64_t v30 = *(void **)(v28 + 416);
        }
        else {
          uint64_t v30 = 0;
        }
        id v31 = v30;
        [v31 setImage:v27];

        long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v33[0] = *MEMORY[0x1E4F1DAB8];
        v33[1] = v32;
        v33[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        [(PKPaletteToolView *)self setTransform:v33];
        [(PKPaletteToolView *)self _reloadToolImageSizeConstraints];
        _Block_object_dispose(buf, 8);

        return;
      }
      v24 = (void *)MEMORY[0x1E4FB1818];
      uint64_t v25 = [*((id *)v36 + 5) CGImage];
      [*((id *)v36 + 5) scale];
      uint64_t v23 = objc_msgSend(v24, "imageWithCGImage:scale:orientation:", v25, 2);
    }
    id v26 = (void *)*((void *)v36 + 5);
    *((void *)v36 + 5) = v23;

    goto LABEL_18;
  }
  uint64_t v12 = os_log_create("com.apple.pencilkit", "PKPalette");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_ERROR, "Skip reloading tool image as it is not marked as needing reload.", buf, 2u);
  }
}

void __37__PKPaletteToolView__reloadToolImage__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) configuration];
  id v8 = (id)v2;
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 160);
  }
  else {
    uint64_t v3 = 0;
  }
  v4 = v3;
  uint64_t v5 = v4[2](v4, *(void *)(a1 + 40));
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)setEdgeLocation:(unint64_t)a3
{
  v27[8] = *MEMORY[0x1E4F143B8];
  if (self->_edgeLocation != a3)
  {
    self->_edgeLocation = a3;
    uint64_t v23 = (void *)MEMORY[0x1E4F28DC8];
    v4 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
    v27[0] = v4;
    uint64_t v5 = [(PKPaletteToolView *)self imageViewLeftAnchorConstraint];
    v27[1] = v5;
    uint64_t v6 = [(PKPaletteToolView *)self imageViewRightAnchorConstraint];
    v27[2] = v6;
    uint64_t v7 = [(PKPaletteToolView *)self imageViewBottomAnchorConstraint];
    v27[3] = v7;
    id v8 = [(PKPaletteToolView *)self toolShadowViewTopAnchorConstraint];
    v27[4] = v8;
    double v9 = [(PKPaletteToolView *)self toolShadowViewLeftAnchorConstraint];
    v27[5] = v9;
    double v10 = [(PKPaletteToolView *)self toolShadowViewRightAnchorConstraint];
    v27[6] = v10;
    double v11 = [(PKPaletteToolView *)self toolShadowViewBottomAnchorConstraint];
    v27[7] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:8];
    [v23 deactivateConstraints:v12];

    switch([(PKPaletteToolView *)self edgeLocation])
    {
      case 1uLL:
      case 4uLL:
        long long v13 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v14 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
        v26[0] = v14;
        id v15 = [(PKPaletteToolView *)self imageViewLeftAnchorConstraint];
        v26[1] = v15;
        uint64_t v16 = [(PKPaletteToolView *)self imageViewRightAnchorConstraint];
        v26[2] = v16;
        double v17 = [(PKPaletteToolView *)self toolShadowViewTopAnchorConstraint];
        v26[3] = v17;
        uint64_t v18 = [(PKPaletteToolView *)self toolShadowViewLeftAnchorConstraint];
        v26[4] = v18;
        double v19 = [(PKPaletteToolView *)self toolShadowViewRightAnchorConstraint];
        v26[5] = v19;
        double v20 = (void *)MEMORY[0x1E4F1C978];
        v21 = v26;
        goto LABEL_6;
      case 2uLL:
        long long v13 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v14 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
        v25[0] = v14;
        id v15 = [(PKPaletteToolView *)self imageViewRightAnchorConstraint];
        v25[1] = v15;
        uint64_t v16 = [(PKPaletteToolView *)self imageViewBottomAnchorConstraint];
        v25[2] = v16;
        double v17 = [(PKPaletteToolView *)self toolShadowViewTopAnchorConstraint];
        v25[3] = v17;
        uint64_t v18 = [(PKPaletteToolView *)self toolShadowViewRightAnchorConstraint];
        v25[4] = v18;
        double v19 = [(PKPaletteToolView *)self toolShadowViewBottomAnchorConstraint];
        v25[5] = v19;
        double v20 = (void *)MEMORY[0x1E4F1C978];
        v21 = v25;
        goto LABEL_6;
      case 8uLL:
        long long v13 = (void *)MEMORY[0x1E4F28DC8];
        uint64_t v14 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
        v24[0] = v14;
        id v15 = [(PKPaletteToolView *)self imageViewLeftAnchorConstraint];
        v24[1] = v15;
        uint64_t v16 = [(PKPaletteToolView *)self imageViewBottomAnchorConstraint];
        v24[2] = v16;
        double v17 = [(PKPaletteToolView *)self toolShadowViewTopAnchorConstraint];
        v24[3] = v17;
        uint64_t v18 = [(PKPaletteToolView *)self toolShadowViewLeftAnchorConstraint];
        v24[4] = v18;
        double v19 = [(PKPaletteToolView *)self toolShadowViewBottomAnchorConstraint];
        v24[5] = v19;
        double v20 = (void *)MEMORY[0x1E4F1C978];
        v21 = v24;
LABEL_6:
        uint64_t v22 = [v20 arrayWithObjects:v21 count:6];
        [v13 activateConstraints:v22];

        break;
      default:
        break;
    }
    [(PKPaletteToolView *)self _setToolImageNeedsReload];
    [(PKPaletteToolView *)self _updateToolShadowView];
    [(PKPaletteToolView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setConfiguration:(id)a3
{
  id v8 = a3;
  if (!-[PKToolConfiguration isEqual:](self->_configuration, "isEqual:"))
  {
    v4 = (PKToolConfiguration *)[v8 copy];
    configuration = self->_configuration;
    self->_configuration = v4;

    uint64_t v6 = [(PKPaletteToolView *)self toolName];
    [(PKPaletteToolView *)self setAccessibilityLabel:v6];

    uint64_t v7 = [(PKPaletteToolView *)self toolName];
    [(PKPaletteToolView *)self setLargeContentTitle:v7];

    [(PKPaletteToolView *)self _setToolImageNeedsReload];
  }
}

- (void)updateConstraints
{
  uint64_t v3 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
  [v3 setConstant:0.0];

  v4 = [(PKPaletteToolView *)self imageViewLeftAnchorConstraint];
  [v4 setConstant:0.0];

  uint64_t v5 = [(PKPaletteToolView *)self imageViewBottomAnchorConstraint];
  [v5 setConstant:0.0];

  uint64_t v6 = [(PKPaletteToolView *)self imageViewRightAnchorConstraint];
  [v6 setConstant:0.0];

  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    [(PKPaletteToolView *)self _toolSelectedOffset];
    double v8 = -v7;
    double v9 = [(PKPaletteToolView *)self imageViewRightAnchorConstraint];
  }
  else
  {
    unint64_t v10 = [(PKPaletteToolView *)self edgeLocation];
    [(PKPaletteToolView *)self _toolSelectedOffset];
    double v8 = v11;
    if (v10 == 8) {
      [(PKPaletteToolView *)self imageViewLeftAnchorConstraint];
    }
    else {
    double v9 = [(PKPaletteToolView *)self imageViewTopAnchorConstraint];
    }
  }
  uint64_t v12 = v9;
  [v9 setConstant:v8];

  v13.receiver = self;
  v13.super_class = (Class)PKPaletteToolView;
  [(PKPaletteToolView *)&v13 updateConstraints];
}

- (double)_toolSelectedOffset
{
  uint64_t v3 = [(PKPaletteToolView *)self traitCollection];
  v4 = [(PKPaletteToolView *)self window];
  uint64_t v5 = [v4 windowScene];
  BOOL v6 = PKUseCompactSize(v3, v5);

  if ([(PKPaletteToolView *)self isSelected])
  {
    double v7 = 0.0;
    double result = 0.0;
    if (v6) {
      return result;
    }
LABEL_8:
    [(PKPaletteToolView *)self scalingFactor];
    return v7 * v10;
  }
  int v9 = [(PKPaletteToolView *)self isHighlighted];
  double result = 10.0;
  if (v9)
  {
    double result = 11.0;
    double v7 = 22.0;
  }
  else
  {
    double v7 = 20.0;
  }
  if (!v6) {
    goto LABEL_8;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  uint64_t v3 = [(PKPaletteToolView *)self imageContentView];
  v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = *(void **)(v3 + 416);
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  double v7 = [v6 image];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  unint64_t v12 = [(PKPaletteToolView *)self edgeLocation];
  if (v12 == 8) {
    double v13 = v11;
  }
  else {
    double v13 = v9;
  }
  if (v12 == 8) {
    double v14 = v9;
  }
  else {
    double v14 = v11;
  }
  if (v12 == 2)
  {
    double v15 = v9;
  }
  else
  {
    double v11 = v13;
    double v15 = v14;
  }
  [(PKPaletteToolView *)self scalingFactor];
  double v17 = v11 * v16;
  [(PKPaletteToolView *)self scalingFactor];
  double v19 = v15 * v18;
  double v20 = v17;
  result.height = v19;
  result.width = v20;
  return result;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaletteToolView;
  -[PKPaletteToolView setSelected:](&v9, sel_setSelected_);
  uint64_t v5 = [(PKPaletteToolView *)self pointerInteraction];
  id v6 = v5;
  if (v3)
  {
    [v5 setEnabled:0];

    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v8[0] = *MEMORY[0x1E4F1DAB8];
    v8[1] = v7;
    v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(PKPaletteToolView *)self setTransform:v8];
  }
  else
  {
    [v5 setEnabled:1];
  }
  [(PKPaletteToolView *)self _updateRemoteEffects];
  [(PKPaletteToolView *)self setNeedsUpdateConstraints];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaletteToolView;
  [(PKPaletteToolView *)&v4 setHighlighted:a3];
  [(PKPaletteToolView *)self setNeedsUpdateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPaletteToolView;
  [(PKPaletteToolView *)&v13 traitCollectionDidChange:v4];
  int v5 = [v4 userInterfaceStyle] == 2;
  id v6 = [(PKPaletteToolView *)self traitCollection];
  int v7 = [v6 userInterfaceStyle] == 2;

  if (v5 != v7) {
    [(PKPaletteToolView *)self _setToolImageNeedsReload];
  }
  double v8 = [(PKPaletteToolView *)self traitCollection];
  uint64_t v9 = [v8 verticalSizeClass];
  if (v9 == [v4 verticalSizeClass])
  {
    double v10 = [(PKPaletteToolView *)self traitCollection];
    uint64_t v11 = [v10 horizontalSizeClass];
    uint64_t v12 = [v4 horizontalSizeClass];

    if (v11 == v12) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  [(PKPaletteToolView *)self setNeedsUpdateConstraints];
LABEL_8:
}

- (void)setColorUserInterfaceStyle:(int64_t)a3
{
  if (self->_colorUserInterfaceStyle != a3)
  {
    self->_colorUserInterfaceStyle = a3;
    [(PKPaletteToolView *)self _setToolImageNeedsReload];
  }
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v7 = a5;
  double v8 = [a3 view];
  memset(&v16, 0, sizeof(v16));
  [(PKPaletteToolView *)self scalingFactor];
  double v10 = v9 * 4.5;
  if ([(PKPaletteToolView *)self edgeLocation] == 2)
  {
    double v11 = 0.0;
    double v12 = v10;
  }
  else if ([(PKPaletteToolView *)self edgeLocation] == 8)
  {
    double v11 = 0.0;
    double v12 = -v10;
  }
  else
  {
    double v12 = 0.0;
    double v11 = -v10;
  }
  CGAffineTransformMakeTranslation(&v16, v12, v11);
  if (([(PKPaletteToolView *)self isSelected] & 1) == 0)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__PKPaletteToolView_pointerInteraction_willEnterRegion_animator___block_invoke;
    v13[3] = &unk_1E64C8F50;
    id v14 = v8;
    CGAffineTransform v15 = v16;
    [v7 addAnimations:v13];
  }
}

uint64_t __65__PKPaletteToolView_pointerInteraction_willEnterRegion_animator___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [a3 view];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKPaletteToolView_pointerInteraction_willExitRegion_animator___block_invoke;
  v9[3] = &unk_1E64C61C0;
  id v10 = v7;
  id v8 = v7;
  [v6 addAnimations:v9];
}

uint64_t __64__PKPaletteToolView_pointerInteraction_willExitRegion_animator___block_invoke(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1AE8], "systemPointerStyle", a3, a4);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_msgSend(a5, "rect", a3, a4);
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [(PKPaletteToolView *)self hitTestInsets];
  CGFloat v15 = v14;
  [(PKPaletteToolView *)self hitTestInsets];
  CGFloat v17 = v16;
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  CGRect v22 = CGRectInset(v21, v15, v17);
  double v18 = (void *)MEMORY[0x1E4FB1AD8];

  return (id)objc_msgSend(v18, "regionWithRect:identifier:", 0, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (void)showTooltip:(id)a3
{
  id v4 = a3;
  id v15 = [(PKPaletteToolView *)self toolName];
  [(PKPaletteToolView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(PKPaletteToolView *)self edgeLocation];
  double v14 = [(PKPaletteToolView *)self traitCollection];
  objc_msgSend(v4, "showWithText:fromView:rect:atEdge:offset:traitCollection:", v15, self, v13, v14, v6, v8, v10, v12, 10.0);
}

- (NSString)toolIdentifier
{
  return self->_toolIdentifier;
}

- (NSString)toolVariant
{
  return self->_toolVariant;
}

- (unint64_t)edgeLocation
{
  return self->_edgeLocation;
}

- (unint64_t)cornerLocation
{
  return self->_cornerLocation;
}

- (void)setCornerLocation:(unint64_t)a3
{
  self->_cornerLocation = a3;
}

- (double)scalingFactor
{
  return self->_scalingFactor;
}

- (NSDictionary)toolProperties
{
  return self->_toolProperties;
}

- (void)setToolProperties:(id)a3
{
}

- (int64_t)colorUserInterfaceStyle
{
  return self->_colorUserInterfaceStyle;
}

- (BOOL)supportsDisplayingSelectedColor
{
  return self->_supportsDisplayingSelectedColor;
}

- (void)setSupportsDisplayingSelectedColor:(BOOL)a3
{
  self->_supportsDisplayingSelectedColor = a3;
}

- (PKToolConfiguration)configuration
{
  return self->_configuration;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
}

- (PKPaletteToolImageContentView)imageContentView
{
  return self->_imageContentView;
}

- (PKPaletteToolShadowPathView)toolShadowView
{
  return self->_toolShadowView;
}

- (void)setToolShadowView:(id)a3
{
}

- (NSLayoutConstraint)toolShadowViewTopAnchorConstraint
{
  return self->_toolShadowViewTopAnchorConstraint;
}

- (void)setToolShadowViewTopAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolShadowViewLeftAnchorConstraint
{
  return self->_toolShadowViewLeftAnchorConstraint;
}

- (void)setToolShadowViewLeftAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolShadowViewBottomAnchorConstraint
{
  return self->_toolShadowViewBottomAnchorConstraint;
}

- (void)setToolShadowViewBottomAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolShadowViewRightAnchorConstraint
{
  return self->_toolShadowViewRightAnchorConstraint;
}

- (void)setToolShadowViewRightAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewTopAnchorConstraint
{
  return self->_imageViewTopAnchorConstraint;
}

- (void)setImageViewTopAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewBottomAnchorConstraint
{
  return self->_imageViewBottomAnchorConstraint;
}

- (void)setImageViewBottomAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewLeftAnchorConstraint
{
  return self->_imageViewLeftAnchorConstraint;
}

- (void)setImageViewLeftAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewRightAnchorConstraint
{
  return self->_imageViewRightAnchorConstraint;
}

- (void)setImageViewRightAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewWidthAnchorConstraint
{
  return self->_imageViewWidthAnchorConstraint;
}

- (void)setImageViewWidthAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewHeightAnchorConstraint
{
  return self->_imageViewHeightAnchorConstraint;
}

- (void)setImageViewHeightAnchorConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewHeightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewWidthAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_imageViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewRightAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewLeftAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_toolShadowView, 0);
  objc_storeStrong((id *)&self->_imageContentView, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_toolProperties, 0);
  objc_storeStrong((id *)&self->_toolVariant, 0);
  objc_storeStrong((id *)&self->_toolIdentifier, 0);

  objc_storeStrong((id *)&self->_attributeViewController, 0);
}

@end