@interface ABDeviceDisplayView
- (ABDeviceDisplayView)initWithFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)_resetSprings;
- (void)_setSilentModeEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)_shake;
- (void)_toggleSilentMode;
- (void)_transitionIslandToCompact;
- (void)_transitionIslandToGrowing;
- (void)_transitionIslandToInert;
- (void)_transitionIslandToLarge;
- (void)layoutSubviews;
- (void)setIslandMode:(void *)result;
@end

@implementation ABDeviceDisplayView

- (ABDeviceDisplayView)initWithFrame:(CGRect)a3
{
  v37[4] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)ABDeviceDisplayView;
  v3 = -[ABDeviceDisplayView initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = ABDisplayPackageName();
    v6 = [v4 URLForResource:v5 withExtension:@"ca"];

    uint64_t v7 = [MEMORY[0x263F15838] packageWithContentsOfURL:v6 type:*MEMORY[0x263F15EE8] options:0 error:0];
    package = v3->_package;
    v3->_package = (CAPackage *)v7;

    v9 = [(CAPackage *)v3->_package rootLayer];
    [v9 setGeometryFlipped:1];

    uint64_t v10 = [(CAPackage *)v3->_package publishedObjectWithName:@"island"];
    islandLayer = v3->_islandLayer;
    v3->_islandLayer = (CALayer *)v10;

    uint64_t v12 = [(CAPackage *)v3->_package publishedObjectWithName:@"ringer"];
    ringerLayer = v3->_ringerLayer;
    v3->_ringerLayer = (CALayer *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x263F158B0]) initWithLayer:v3->_ringerLayer];
    ringerStateController = v3->_ringerStateController;
    v3->_ringerStateController = (CAStateController *)v14;

    [(ABDeviceDisplayView *)v3 _setSilentModeEnabled:1 animated:0];
    uint64_t v16 = objc_opt_new();
    islandY = v3->_islandY;
    v3->_islandY = (ABFloatSpringProperty *)v16;

    uint64_t v18 = objc_opt_new();
    islandWidth = v3->_islandWidth;
    v3->_islandWidth = (ABFloatSpringProperty *)v18;

    uint64_t v20 = objc_opt_new();
    islandHeight = v3->_islandHeight;
    v3->_islandHeight = (ABFloatSpringProperty *)v20;

    uint64_t v22 = objc_opt_new();
    islandShake1 = v3->_islandShake1;
    v3->_islandShake1 = (ABFloatSpringProperty *)v22;

    [(ABFloatSpringProperty *)v3->_islandShake1 setBounce:0.0 duration:0.45];
    uint64_t v24 = objc_opt_new();
    islandShake2 = v3->_islandShake2;
    v3->_islandShake2 = (ABFloatSpringProperty *)v24;

    [(ABFloatSpringProperty *)v3->_islandShake2 setBounce:0.82322 duration:0.22214];
    uint64_t v26 = objc_opt_new();
    ringerVisible = v3->_ringerVisible;
    v3->_ringerVisible = (ABFloatSpringProperty *)v26;

    [(ABDeviceDisplayView *)v3 _transitionIslandToInert];
    [(ABDeviceDisplayView *)v3 _resetSprings];
    objc_initWeak(&location, v3);
    v28 = (void *)MEMORY[0x263F1CB60];
    v37[0] = v3->_islandY;
    v37[1] = v3->_islandWidth;
    v37[2] = v3->_islandHeight;
    v37[3] = v3->_ringerVisible;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __37__ABDeviceDisplayView_initWithFrame___block_invoke;
    v33[3] = &unk_265212F20;
    objc_copyWeak(&v34, &location);
    [v28 _createTransformerWithInputAnimatableProperties:v29 presentationValueChangedCallback:v33];

    v30 = [(ABDeviceDisplayView *)v3 layer];
    v31 = [(CAPackage *)v3->_package rootLayer];
    [v30 addSublayer:v31];

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __37__ABDeviceDisplayView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)setIslandMode:(void *)result
{
  if (result)
  {
    v2 = result;
    if (result[62] != a2)
    {
      result[62] = a2;
      switch(a2)
      {
        case 0:
          result = (void *)[result _transitionIslandToInert];
          break;
        case 1:
          result = (void *)[result _transitionIslandToCompact];
          break;
        case 2:
          result = (void *)[result _transitionIslandToGrowing];
          break;
        case 3:
          [result _transitionIslandToLarge];
          result = (void *)[v2 _toggleSilentMode];
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(CAPackage *)self->_package rootLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)ABDeviceDisplayView;
  [(ABDeviceDisplayView *)&v27 layoutSubviews];
  uint64_t v3 = [MEMORY[0x263F158F8] disableActions];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(ABDeviceDisplayView *)self bounds];
  double v5 = v4 * 0.5;
  double v7 = v6 * 0.5;
  double v8 = [(CAPackage *)self->_package rootLayer];
  objc_msgSend(v8, "setPosition:", v5, v7);

  [(ABFloatSpringProperty *)self->_islandWidth output];
  double v10 = v9;
  [(ABFloatSpringProperty *)self->_islandHeight output];
  double v12 = v11;
  if (v11 > 105.0)
  {
    -[CALayer setBounds:](self->_islandLayer, "setBounds:", 0.0, 0.0, v10, v11);
    [(ABFloatSpringProperty *)self->_islandShake1 output];
    double v14 = v5 + v13;
    [(ABFloatSpringProperty *)self->_islandShake2 output];
    double v16 = v14 + v15;
    [(ABFloatSpringProperty *)self->_islandY output];
    -[CALayer setPosition:](self->_islandLayer, "setPosition:", v16, v17);
    [(CALayer *)self->_islandLayer setCornerRadius:v12 * 0.5];
    [(ABFloatSpringProperty *)self->_ringerVisible output];
    long double v19 = pow(v18, 3.0);
    double v20 = v19;
    *(float *)&long double v19 = v19;
    [(CALayer *)self->_ringerLayer setOpacity:(double)v19];
    ringerLayer = self->_ringerLayer;
    uint64_t v22 = [NSNumber numberWithDouble:20.0 - v20 * 20.0];
    [(CALayer *)ringerLayer setValue:v22 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    double v23 = v12 / 110.0 * (v20 * 0.5 + 0.5);
    uint64_t v24 = self->_ringerLayer;
    v25 = [NSNumber numberWithDouble:v23];
    [(CALayer *)v24 setValue:v25 forKeyPath:@"transform.scale.xy"];

    [(CALayer *)self->_ringerLayer bounds];
    -[CALayer setPosition:](self->_ringerLayer, "setPosition:", v23 * v26 * 0.5 + (v12 - v23 * v26) * 0.5, v12 * 0.5);
  }
  [MEMORY[0x263F158F8] setDisableActions:v3];
}

- (void)_resetSprings
{
  [(ABFloatSpringProperty *)self->_islandY input];
  -[ABFloatSpringProperty setOutput:](self->_islandY, "setOutput:");
  [(ABFloatSpringProperty *)self->_islandWidth input];
  -[ABFloatSpringProperty setOutput:](self->_islandWidth, "setOutput:");
  [(ABFloatSpringProperty *)self->_islandHeight input];
  -[ABFloatSpringProperty setOutput:](self->_islandHeight, "setOutput:");
  [(ABFloatSpringProperty *)self->_ringerVisible input];
  ringerVisible = self->_ringerVisible;

  -[ABFloatSpringProperty setOutput:](ringerVisible, "setOutput:");
}

- (void)_setSilentModeEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_isSilentModeEnabled = a3;
  ringerLayer = self->_ringerLayer;
  if (a3) {
    double v7 = @"silent";
  }
  else {
    double v7 = @"ringer";
  }
  uint64_t v8 = [(CALayer *)ringerLayer stateWithName:v7];
  double v9 = 0.0;
  if (v4) {
    *(float *)&double v9 = 1.0;
  }
  id v11 = (id)v8;
  -[CAStateController setState:ofLayer:transitionSpeed:](self->_ringerStateController, "setState:ofLayer:transitionSpeed:", v9);
  if (self->_isSilentModeEnabled && v4) {
    [(ABDeviceDisplayView *)self _shake];
  }
}

- (void)_toggleSilentMode
{
}

- (void)_shake
{
  islandShake1 = self->_islandShake1;
  [(ABFloatSpringProperty *)islandShake1 input];
  [(ABFloatSpringProperty *)islandShake1 setInput:v4 + 20.0];
  dispatch_time_t v5 = dispatch_time(0, 275000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ABDeviceDisplayView__shake__block_invoke;
  block[3] = &unk_265212E38;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x263EF83A0], block);
}

uint64_t __29__ABDeviceDisplayView__shake__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 472);
  [v1 input];
  double v3 = v2 + -20.0;

  return [v1 setInput:v3];
}

- (void)_transitionIslandToInert
{
  [(ABFloatSpringProperty *)self->_islandWidth setBounce:0.0 duration:0.5];
  [(ABFloatSpringProperty *)self->_islandWidth setInput:371.0];
  [(ABFloatSpringProperty *)self->_islandHeight setBounce:0.0 duration:0.5];
  [(ABFloatSpringProperty *)self->_islandHeight setInput:110.0];
  [(ABFloatSpringProperty *)self->_islandY setBounce:0.0 duration:0.55];
  [(ABFloatSpringProperty *)self->_islandY setInput:90.0];
  ringerVisible = self->_ringerVisible;

  [(ABFloatSpringProperty *)ringerVisible setInput:0.0];
}

- (void)_transitionIslandToCompact
{
  [(ABFloatSpringProperty *)self->_islandWidth setBounce:0.0 duration:0.35];
  [(ABFloatSpringProperty *)self->_islandWidth setInput:540.0];
  [(ABFloatSpringProperty *)self->_islandHeight setBounce:0.0 duration:0.35];
  [(ABFloatSpringProperty *)self->_islandHeight setInput:110.0];
  [(ABFloatSpringProperty *)self->_islandY setBounce:0.0 duration:0.55];
  [(ABFloatSpringProperty *)self->_islandY setInput:90.0];
  ringerVisible = self->_ringerVisible;

  [(ABFloatSpringProperty *)ringerVisible setInput:1.0];
}

- (void)_transitionIslandToGrowing
{
  [(ABFloatSpringProperty *)self->_islandWidth setBounce:0.0 duration:2.5];
  [(ABFloatSpringProperty *)self->_islandWidth setInput:624.0];
  [(ABFloatSpringProperty *)self->_islandHeight setBounce:0.0 duration:2.5];
  [(ABFloatSpringProperty *)self->_islandHeight setInput:171.0];
  [(ABFloatSpringProperty *)self->_islandY setBounce:0.0 duration:2.5];
  [(ABFloatSpringProperty *)self->_islandY setInput:105.0];
  ringerVisible = self->_ringerVisible;

  [(ABFloatSpringProperty *)ringerVisible setInput:1.0];
}

- (void)_transitionIslandToLarge
{
  [(ABFloatSpringProperty *)self->_islandWidth setBounce:0.4 duration:0.5];
  [(ABFloatSpringProperty *)self->_islandWidth setInput:624.0];
  [(ABFloatSpringProperty *)self->_islandHeight setBounce:0.4 duration:0.55];
  [(ABFloatSpringProperty *)self->_islandHeight setInput:171.0];
  [(ABFloatSpringProperty *)self->_islandY setBounce:0.0 duration:0.55];
  [(ABFloatSpringProperty *)self->_islandY setInput:105.0];
  ringerVisible = self->_ringerVisible;

  [(ABFloatSpringProperty *)ringerVisible setInput:1.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerVisible, 0);
  objc_storeStrong((id *)&self->_islandShake2, 0);
  objc_storeStrong((id *)&self->_islandShake1, 0);
  objc_storeStrong((id *)&self->_islandHeight, 0);
  objc_storeStrong((id *)&self->_islandWidth, 0);
  objc_storeStrong((id *)&self->_islandY, 0);
  objc_storeStrong((id *)&self->_ringerStateController, 0);
  objc_storeStrong((id *)&self->_ringerLayer, 0);
  objc_storeStrong((id *)&self->_islandLayer, 0);

  objc_storeStrong((id *)&self->_package, 0);
}

@end