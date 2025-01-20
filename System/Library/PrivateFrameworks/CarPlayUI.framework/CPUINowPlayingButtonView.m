@interface CPUINowPlayingButtonView
+ (id)classSubstitions;
- (BOOL)isHighlighted;
- (CPUINowPlayingButtonView)initWithCAML:(id)a3;
- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4;
- (NSString)stateName;
- (void)_handleGlyphLayerDidLoad:(id)a3;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setStateName:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CPUINowPlayingButtonView

- (CPUINowPlayingButtonView)initWithCAML:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPUINowPlayingButtonView;
  v5 = -[CPUINowPlayingButtonView initWithFrame:](&v11, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    barLayers = v5->_barLayers;
    v5->_barLayers = (NSMutableArray *)v6;

    v8 = [MEMORY[0x263F157F8] parser];
    [v8 setDelegate:v5];
    [v8 parseContentsOfURL:v4];
    v9 = [v8 result];
    [v9 setGeometryFlipped:1];
    [(CPUINowPlayingButtonView *)v5 _handleGlyphLayerDidLoad:v9];
    [(CPUINowPlayingButtonView *)v5 setStateName:@"Pause"];
  }
  return v5;
}

- (void)_handleGlyphLayerDidLoad:(id)a3
{
  p_animatedGlyphLayer = &self->_animatedGlyphLayer;
  objc_storeStrong((id *)&self->_animatedGlyphLayer, a3);
  id v6 = a3;
  v7 = (CAStateController *)[objc_alloc(MEMORY[0x263F158B0]) initWithLayer:v6];
  stateController = self->_stateController;
  self->_stateController = v7;

  v9 = [(CPUINowPlayingButtonView *)self layer];
  [v9 addSublayer:v6];

  v10 = [(CPUINowPlayingButtonView *)self stateName];
  objc_super v11 = [(CALayer *)*p_animatedGlyphLayer stateWithName:v10];
  [(CAStateController *)self->_stateController setState:v11 ofLayer:*p_animatedGlyphLayer];
  v12 = *p_animatedGlyphLayer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__CPUINowPlayingButtonView__handleGlyphLayerDidLoad___block_invoke;
  v13[3] = &unk_26482D370;
  v13[4] = self;
  [(CALayer *)v12 cpui_enumerateSublayersWithBlock:v13];
  [(CPUINowPlayingButtonView *)self _updateColors];
  [(CPUINowPlayingButtonView *)self setNeedsLayout];
}

void __53__CPUINowPlayingButtonView__handleGlyphLayerDidLoad___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v4 = [v5 name];
  if ([v4 hasPrefix:@"Bar"]
    && ([v4 isEqualToString:@"Bars"] & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 424) addObject:v5];
  }
  else if ([v4 isEqualToString:@"Platter"])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 432), a2);
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CPUINowPlayingButtonView;
  [(CPUINowPlayingButtonView *)&v7 layoutSubviews];
  [(CPUINowPlayingButtonView *)self bounds];
  UIRectGetCenter();
  -[CALayer setPosition:](self->_animatedGlyphLayer, "setPosition:");
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v6.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v6.c = v3;
  *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v5.a = *(_OWORD *)&v6.a;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)&v6.tx;
  CGAffineTransformScale(&v6, &v5, 0.5, 0.5);
  animatedGlyphLayer = self->_animatedGlyphLayer;
  CGAffineTransform v5 = v6;
  [(CALayer *)animatedGlyphLayer setAffineTransform:&v5];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(CPUINowPlayingButtonView *)self _updateColors];
  }
}

- (void)_updateColors
{
  long long v3 = [(CPUINowPlayingButtonView *)self traitCollection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  CGAffineTransform v6 = __41__CPUINowPlayingButtonView__updateColors__block_invoke;
  objc_super v7 = &unk_26482D398;
  v8 = self;
  if (v3)
  {
    id v4 = [MEMORY[0x263F82DA0] _currentTraitCollection];
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v3];
    v6((uint64_t)v5);
    [MEMORY[0x263F82DA0] _setCurrentTraitCollection:v4];
  }
}

void __41__CPUINowPlayingButtonView__updateColors__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  if ([*(id *)(a1 + 32) isHighlighted])
  {
    v2 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
    [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else
  {
    v2 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    [MEMORY[0x263F825C8] _carSystemQuaternaryColor];
  }
  id v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setBackgroundColor:", objc_msgSend(v3, "CGColor"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 424);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v10 = v2;
        objc_msgSend(v9, "setBackgroundColor:", objc_msgSend(v10, "CGColor", (void)v11));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [MEMORY[0x263F158F8] commit];
}

- (void)setStateName:(id)a3
{
  id v8 = a3;
  if ((-[NSString isEqual:](self->_stateName, "isEqual:") & 1) == 0)
  {
    id v4 = (NSString *)[v8 copy];
    stateName = self->_stateName;
    self->_stateName = v4;

    uint64_t v6 = [(CALayer *)self->_animatedGlyphLayer stateWithName:v8];
    LODWORD(v7) = 1.0;
    [(CAStateController *)self->_stateController setState:v6 ofLayer:self->_animatedGlyphLayer transitionSpeed:v7];
    [(CALayer *)self->_animatedGlyphLayer cpui_startAnimating];
  }
}

+ (id)classSubstitions
{
  if (classSubstitions_onceToken != -1) {
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)classSubstitions_substitutions;
  return v2;
}

void __44__CPUINowPlayingButtonView_classSubstitions__block_invoke()
{
  v3[11] = *MEMORY[0x263EF8340];
  v2[0] = @"LKState";
  v3[0] = objc_opt_class();
  v2[1] = @"LKEventHandler";
  v3[1] = objc_opt_class();
  v2[2] = @"LKStateAddAnimation";
  v3[2] = objc_opt_class();
  v2[3] = @"LKStateAddElement";
  v3[3] = objc_opt_class();
  v2[4] = @"LKStateElement";
  v3[4] = objc_opt_class();
  v2[5] = @"LKStateRemoveAnimation";
  v3[5] = objc_opt_class();
  v2[6] = @"LKStateRemoveElement";
  v3[6] = objc_opt_class();
  v2[7] = @"LKStateSetValue";
  v3[7] = objc_opt_class();
  v2[8] = @"LKStateSetProperty";
  v3[8] = objc_opt_class();
  v2[9] = @"LKStateTransition";
  v3[9] = objc_opt_class();
  v2[10] = @"LKStateTransitionElement";
  v3[10] = objc_opt_class();
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:11];
  v1 = (void *)classSubstitions_substitutions;
  classSubstitions_substitutions = v0;
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4 = a4;
  uint64_t v5 = [(id)objc_opt_class() classSubstitions];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return (Class)v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPUINowPlayingButtonView;
  [(CPUINowPlayingButtonView *)&v4 traitCollectionDidChange:a3];
  [(CPUINowPlayingButtonView *)self _updateColors];
}

- (NSString)stateName
{
  return self->_stateName;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_platterLayer, 0);
  objc_storeStrong((id *)&self->_barLayers, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_animatedGlyphLayer, 0);
}

@end