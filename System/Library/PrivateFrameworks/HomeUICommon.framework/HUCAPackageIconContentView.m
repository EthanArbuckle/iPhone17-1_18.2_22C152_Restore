@interface HUCAPackageIconContentView
+ (BOOL)_isAnimationEnabled;
- (BOOL)useAssetMarginSize;
- (CALayer)rootLayer;
- (CAPackage)package;
- (CAStateController)stateController;
- (CGSize)assetNoMarginSize;
- (CGSize)assetSize;
- (CGSize)iconContentIntrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HFIconDescriptor)renouncedPackageDescriptor;
- (HUCAPackageIconContentView)initWithFrame:(CGRect)a3;
- (NSArray)packageLayers;
- (NSString)stateName;
- (void)_applyModifiers;
- (void)_tryRenouncePackageForIconDescriptor:(id)a3;
- (void)_updateStateAnimated:(BOOL)a3;
- (void)_updateWithPackage:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)layoutRootLayer;
- (void)layoutSubviews;
- (void)reclaimIconIfPossible;
- (void)renounceIconIfPossible;
- (void)setAssetNoMarginSize:(CGSize)a3;
- (void)setAssetSize:(CGSize)a3;
- (void)setPackage:(id)a3;
- (void)setPackageLayers:(id)a3;
- (void)setRenouncedPackageDescriptor:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setState:(id)a3;
- (void)setState:(id)a3 animated:(BOOL)a4;
- (void)setStateController:(id)a3;
- (void)setStateName:(id)a3;
- (void)setUseAssetMarginSize:(BOOL)a3;
- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5;
- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5;
- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5;
@end

@implementation HUCAPackageIconContentView

void __45__HUCAPackageIconContentView__applyModifiers__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconModifiers];
  [v3 applyModifiers:v4];
}

HUCAPackageLayer *__58__HUCAPackageIconContentView__updateWithPackage_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) package];
  v5 = [v4 publishedObjectWithName:v3];

  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8) {
    v9 = [[HUCAPackageLayer alloc] initWithName:v3 layer:v8];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [(HUIconContentView *)self iconDescriptor];
  v10 = [v9 identifier];
  v11 = [v8 identifier];
  int v12 = [v10 isEqualToString:v11];

  v29.receiver = self;
  v29.super_class = (Class)HUCAPackageIconContentView;
  [(HUIconContentView *)&v29 updateWithIconDescriptor:v8 displayStyle:a4 animated:v5];
  objc_opt_class();
  id v13 = v8;
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (v15)
  {
    v16 = v9;
    unint64_t v26 = a4;
    uint64_t v17 = v5;
    v18 = [v13 identifier];
    v19 = [(HUCAPackageIconContentView *)self renouncedPackageDescriptor];
    v20 = [v19 identifier];
    int v21 = [v18 isEqualToString:v20];

    if (!v12 || v21)
    {
      v9 = v16;
      [(HUCAPackageIconContentView *)self _tryRenouncePackageForIconDescriptor:v16];
      unint64_t v22 = v26;
      if (v21)
      {
        v23 = [(HUCAPackageIconContentView *)self package];
      }
      else
      {
        v23 = 0;
      }
      -[HUCAPackageIconContentView _updateWithPackage:animated:](self, "_updateWithPackage:animated:", v23, [MEMORY[0x263F47AF0] iconDescriptorShouldAlwaysAnimate:v15]);
      if (v21) {

      }
      if (v9) {
        uint64_t v17 = [MEMORY[0x263F47AF0] iconDescriptorShouldAlwaysAnimate:v15];
      }
    }
    else
    {
      unint64_t v22 = v26;
      v9 = v16;
    }
    v24 = [v15 state];
    if (v22 == 2)
    {
      v25 = HFVibrantStateForHFCAPackageState();
      [(HUCAPackageIconContentView *)self setStateName:v25];
    }
    else
    {
      [(HUCAPackageIconContentView *)self setStateName:v24];
    }

    [(HUCAPackageIconContentView *)self _updateStateAnimated:v17];
    CGAffineTransformMakeScale(&v28, 1.0, 1.0);
    CGAffineTransform v27 = v28;
    [(HUCAPackageIconContentView *)self setTransform:&v27];
    [(HUCAPackageIconContentView *)self _applyModifiers];
  }
  else
  {
    NSLog(&cfstr_NoCaPackageDes.isa);
  }
}

- (void)setUseAssetMarginSize:(BOOL)a3
{
  self->_useAssetMarginSize = a3;
}

- (void)setStateName:(id)a3
{
}

- (HFIconDescriptor)renouncedPackageDescriptor
{
  return self->_renouncedPackageDescriptor;
}

- (void)_updateStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUCAPackageIconContentView *)self stateName];
  [(HUCAPackageIconContentView *)self setState:v5 animated:v3];
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)_applyModifiers
{
  objc_opt_class();
  BOOL v3 = [(HUIconContentView *)self iconDescriptor];
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [(HUCAPackageIconContentView *)self packageLayers];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__HUCAPackageIconContentView__applyModifiers__block_invoke;
    v7[3] = &unk_2653812A8;
    id v8 = v5;
    objc_msgSend(v6, "na_each:", v7);
  }
}

- (NSArray)packageLayers
{
  return self->_packageLayers;
}

- (CGSize)iconContentIntrinsicContentSize
{
  if (![(HUCAPackageIconContentView *)self useAssetMarginSize]
    || (([(HUCAPackageIconContentView *)self assetNoMarginSize], v4 == *MEMORY[0x263F001B0])
      ? (BOOL v5 = v3 == *(double *)(MEMORY[0x263F001B0] + 8))
      : (BOOL v5 = 0),
        v5))
  {
    [(HUCAPackageIconContentView *)self assetSize];
  }
  else
  {
    [(HUCAPackageIconContentView *)self assetNoMarginSize];
  }
  result.height = v7;
  result.width = v6;
  return result;
}

- (HUCAPackageIconContentView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUCAPackageIconContentView;
  double v3 = -[HUIconContentView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    BOOL v5 = [(HUCAPackageIconContentView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    double v6 = [(HUCAPackageIconContentView *)v4 layer];
    [v6 setAllowsGroupOpacity:0];
  }
  return v4;
}

- (void)_updateWithPackage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(HUIconContentView *)self iconDescriptor];

  if (v7)
  {
    objc_super v8 = +[HUCAPackageIconManager sharedInstance];
    v9 = [(HUIconContentView *)self iconDescriptor];
    v10 = [v8 tryReclaimPackage:v6 forIconDescriptor:v9];

    [(HUCAPackageIconContentView *)self setRenouncedPackageDescriptor:0];
    objc_opt_class();
    v11 = [v10 publishedObjectWithName:@"Icon"];
    if (objc_opt_isKindOfClass()) {
      int v12 = v11;
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;

    if (!v13) {
      NSLog(&cfstr_FailedToIdenti_0.isa, v10);
    }
    objc_opt_class();
    v14 = [v10 publishedObjectWithName:@"IconNoMargin"];
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    id v16 = v15;

    if (v16)
    {
      [v16 size];
      -[HUCAPackageIconContentView setAssetNoMarginSize:](self, "setAssetNoMarginSize:");
    }
    [MEMORY[0x263F158F8] begin];
    if (!a4)
    {
      [MEMORY[0x263F158F8] setAnimationDuration:0.0];
      [MEMORY[0x263F158F8] setDisableActions:1];
    }
    uint64_t v17 = [(HUCAPackageIconContentView *)self rootLayer];
    v18 = [v17 superlayer];
    v19 = [(HUCAPackageIconContentView *)self layer];

    if (v18 == v19)
    {
      v20 = [(HUCAPackageIconContentView *)self rootLayer];
      [v20 removeFromSuperlayer];
    }
    [(HUCAPackageIconContentView *)self setPackage:v10];
    int v21 = [(HUCAPackageIconContentView *)self stateController];
    [v21 setDelegate:0];

    unint64_t v22 = [(HUCAPackageIconContentView *)self package];
    v23 = [v22 rootLayer];
    [(HUCAPackageIconContentView *)self setRootLayer:v23];

    v24 = [(HUCAPackageIconContentView *)self traitCollection];
    [v24 displayScale];
    double v26 = v25;
    CGAffineTransform v27 = [(HUCAPackageIconContentView *)self rootLayer];
    [v27 setRasterizationScale:v26];

    id v28 = objc_alloc(MEMORY[0x263F158B0]);
    objc_super v29 = [(HUCAPackageIconContentView *)self rootLayer];
    v30 = (void *)[v28 initWithLayer:v29];
    [(HUCAPackageIconContentView *)self setStateController:v30];

    v31 = [(HUCAPackageIconContentView *)self stateController];
    [v31 setDelegate:self];

    if (!v13)
    {
      v11 = [(HUCAPackageIconContentView *)self rootLayer];
    }
    [v11 size];
    -[HUCAPackageIconContentView setAssetSize:](self, "setAssetSize:");
    if (!v13) {

    }
    v32 = [(HUCAPackageIconContentView *)self package];
    v33 = [v32 publishedObjectNames];
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __58__HUCAPackageIconContentView__updateWithPackage_animated___block_invoke;
    v37[3] = &unk_265381230;
    v37[4] = self;
    v34 = objc_msgSend(v33, "na_map:", v37);
    [(HUCAPackageIconContentView *)self setPackageLayers:v34];

    v35 = [(HUCAPackageIconContentView *)self layer];
    v36 = [(HUCAPackageIconContentView *)self rootLayer];
    [v35 addSublayer:v36];

    [(HUCAPackageIconContentView *)self layoutRootLayer];
    [MEMORY[0x263F158F8] commit];
  }
}

- (CAPackage)package
{
  return self->_package;
}

- (void)layoutRootLayer
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.0];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(HUCAPackageIconContentView *)self assetSize];
  double v4 = v3;
  double v6 = v5;
  if ([(HUCAPackageIconContentView *)self useAssetMarginSize])
  {
    [(HUCAPackageIconContentView *)self assetNoMarginSize];
    if (v8 != *MEMORY[0x263F001B0] || v7 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      [(HUCAPackageIconContentView *)self assetNoMarginSize];
      double v4 = v10;
      double v6 = v11;
    }
  }
  [(HUCAPackageIconContentView *)self frame];
  double v13 = v12 / v4;
  [(HUCAPackageIconContentView *)self frame];
  if (v13 >= v14 / v6) {
    double v15 = v14 / v6;
  }
  else {
    double v15 = v13;
  }
  [(HUCAPackageIconContentView *)self center];
  double v17 = v16;
  double v19 = v18;
  v20 = [(HUCAPackageIconContentView *)self rootLayer];
  objc_msgSend(v20, "setPosition:", v17, v19);

  CATransform3DMakeScale(&v23, v15, v15, 1.0);
  int v21 = [(HUCAPackageIconContentView *)self rootLayer];
  CATransform3D v22 = v23;
  [v21 setTransform:&v22];

  [MEMORY[0x263F158F8] commit];
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (BOOL)useAssetMarginSize
{
  return self->_useAssetMarginSize;
}

- (CGSize)assetSize
{
  double width = self->_assetSize.width;
  double height = self->_assetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUCAPackageIconContentView;
  [(HUCAPackageIconContentView *)&v3 layoutSubviews];
  [(HUCAPackageIconContentView *)self layoutRootLayer];
}

- (void)setState:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = [(HUCAPackageIconContentView *)self stateController];
  double v8 = [(HUCAPackageIconContentView *)self rootLayer];
  v9 = [v7 stateOfLayer:v8];

  double v10 = [(HUCAPackageIconContentView *)self stateController];
  double v11 = [v10 layer];
  double v12 = [v11 stateWithName:v6];

  if (!v12)
  {
    if (([v6 isEqualToString:*MEMORY[0x263F478E0]] & 1) != 0
      || [v6 isEqualToString:*MEMORY[0x263F47900]])
    {
      double v13 = [(HUCAPackageIconContentView *)self stateController];
      double v14 = [v13 layer];
      double v12 = [v14 stateWithName:*MEMORY[0x263F478E8]];

      if (v12) {
        goto LABEL_12;
      }
      double v15 = [(HUCAPackageIconContentView *)self stateController];
      double v16 = [v15 layer];
      double v17 = v16;
      double v18 = (void *)MEMORY[0x263F478F8];
      goto LABEL_8;
    }
    if ([v6 isEqualToString:*MEMORY[0x263F478D8]])
    {
      double v15 = [(HUCAPackageIconContentView *)self stateController];
      double v16 = [v15 layer];
      double v17 = v16;
      double v18 = (void *)MEMORY[0x263F478D0];
LABEL_8:
      double v12 = [v16 stateWithName:*v18];

      goto LABEL_12;
    }
    double v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      CATransform3D v23 = [(HUIconContentView *)self iconDescriptor];
      v24 = [v23 identifier];
      int v25 = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v24;
      _os_log_error_impl(&dword_25275A000, v19, OS_LOG_TYPE_ERROR, "Failed to identify state named: %@ for iconDescriptor: %@", (uint8_t *)&v25, 0x16u);
    }
    double v12 = 0;
  }
LABEL_12:
  if (([v12 isEqual:v9] & 1) == 0)
  {
    if (v4 && [(id)objc_opt_class() _isAnimationEnabled])
    {
      v20 = [(HUCAPackageIconContentView *)self stateController];
      int v21 = [(HUCAPackageIconContentView *)self rootLayer];
      LODWORD(v22) = 1.0;
      [v20 setState:v12 ofLayer:v21 transitionSpeed:v22];
    }
    else
    {
      v20 = [(HUCAPackageIconContentView *)self stateController];
      int v21 = [(HUCAPackageIconContentView *)self rootLayer];
      [v20 setState:v12 ofLayer:v21];
    }
  }
}

- (CAStateController)stateController
{
  return self->_stateController;
}

+ (BOOL)_isAnimationEnabled
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (void)setStateController:(id)a3
{
}

- (void)setRootLayer:(id)a3
{
}

- (void)setRenouncedPackageDescriptor:(id)a3
{
}

- (void)setPackageLayers:(id)a3
{
}

- (void)setPackage:(id)a3
{
}

- (void)setAssetSize:(CGSize)a3
{
  self->_assetSize = a3;
}

- (void)setAssetNoMarginSize:(CGSize)a3
{
  self->_assetNoMarginSize = a3;
}

- (void)_tryRenouncePackageForIconDescriptor:(id)a3
{
  id v18 = a3;
  BOOL v4 = [(HUCAPackageIconContentView *)self stateController];

  if (v4)
  {
    double v5 = [(HUCAPackageIconContentView *)self stateController];
    id v6 = (id)[v5 removeAllStateChanges];

    double v7 = [(HUCAPackageIconContentView *)self stateController];
    [v7 cancelTimers];

    [(HUCAPackageIconContentView *)self setStateController:0];
  }
  double v8 = [(HUCAPackageIconContentView *)self package];
  if (!v18 || !v8) {
    goto LABEL_7;
  }
  v9 = [(HUCAPackageIconContentView *)self renouncedPackageDescriptor];
  if (v9)
  {

LABEL_7:
    goto LABEL_8;
  }
  double v10 = [(HUCAPackageIconContentView *)self package];
  double v11 = [v10 rootLayer];
  double v12 = [v11 superlayer];
  double v13 = [(HUCAPackageIconContentView *)self layer];

  if (v12 == v13)
  {
    double v14 = [(HUCAPackageIconContentView *)self package];
    double v15 = [v14 rootLayer];
    [v15 removeFromSuperlayer];

    double v16 = +[HUCAPackageIconManager sharedInstance];
    double v17 = [(HUCAPackageIconContentView *)self package];
    [v16 returnPackageToCache:v17 forIconDescriptor:v18];

    [(HUCAPackageIconContentView *)self setRenouncedPackageDescriptor:v18];
  }
LABEL_8:
}

- (void)stateController:(id)a3 transitionDidStart:(id)a4 speed:(float)a5
{
  id v5 = [(HUCAPackageIconContentView *)self rootLayer];
  [v5 setShouldRasterize:0];
}

- (void)dealloc
{
  objc_super v3 = [(HUIconContentView *)self iconDescriptor];
  [(HUCAPackageIconContentView *)self _tryRenouncePackageForIconDescriptor:v3];

  v4.receiver = self;
  v4.super_class = (Class)HUCAPackageIconContentView;
  [(HUCAPackageIconContentView *)&v4 dealloc];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (![(HUCAPackageIconContentView *)self useAssetMarginSize]
    || (([(HUCAPackageIconContentView *)self assetNoMarginSize], v5 == *MEMORY[0x263F001B0])
      ? (BOOL v6 = v4 == *(double *)(MEMORY[0x263F001B0] + 8))
      : (BOOL v6 = 0),
        v6))
  {
    [(HUCAPackageIconContentView *)self assetSize];
  }
  else
  {
    [(HUCAPackageIconContentView *)self assetNoMarginSize];
  }
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setState:(id)a3
{
}

- (void)reclaimIconIfPossible
{
  id v3 = [(HUIconContentView *)self iconDescriptor];
  [(HUCAPackageIconContentView *)self updateWithIconDescriptor:v3 displayStyle:[(HUIconContentView *)self displayStyle] animated:0];
}

- (void)renounceIconIfPossible
{
  id v3 = [(HUIconContentView *)self iconDescriptor];
  [(HUCAPackageIconContentView *)self _tryRenouncePackageForIconDescriptor:v3];
}

- (void)stateController:(id)a3 transitionDidStop:(id)a4 completed:(BOOL)a5
{
  id v5 = [(HUCAPackageIconContentView *)self rootLayer];
  [v5 setShouldRasterize:1];
}

- (CGSize)assetNoMarginSize
{
  double width = self->_assetNoMarginSize.width;
  double height = self->_assetNoMarginSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renouncedPackageDescriptor, 0);
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_packageLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
}

@end