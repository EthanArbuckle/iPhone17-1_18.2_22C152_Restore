@interface LAUIRadialPingView
- (BOOL)isAnimating;
- (LAUIRadialPingView)initWithFrame:(CGRect)a3;
- (id).cxx_construct;
- (void)_attachExpandAnimationToContainer:(blur_container *)a3 withDelay:(double)a4;
- (void)_attachPulseAnimationWithDelay:(double)a3;
- (void)_endExpand;
- (void)_setExpand:(BOOL)a3 forBlurAtIndex:(unint64_t)a4 withDelay:(double)a5;
- (void)_setPulse:(BOOL)a3 withDelay:(double)a4;
- (void)_startExpandWithDelay:(double)a3;
- (void)_updateAnimatingAnimated:(BOOL)a3;
- (void)_updateExpandForBlurAtIndex:(unint64_t)a3 withDelay:(double)a4;
- (void)_updateViewsWithColor;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)initWithFrame:;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation LAUIRadialPingView

- (LAUIRadialPingView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)LAUIRadialPingView;
  v3 = -[LAUIRadialPingView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
    color = v3->_color;
    v3->_color = (UIColor *)v4;

    id v6 = objc_alloc(MEMORY[0x263F1CB60]);
    v7 = (double *)MEMORY[0x263F001A8];
    uint64_t v8 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    container = v3->_container;
    v3->_container = (UIView *)v8;

    [(UIView *)v3->_container setClipsToBounds:1];
    [(LAUIRadialPingView *)v3 addSubview:v3->_container];
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v7, v7[1], v7[2], v7[3]);
    primary = v3->_primary;
    v3->_primary = (UIView *)v10;

    [(UIView *)v3->_container addSubview:v3->_primary];
    p_container = (id *)&v3->_container;
    -[LAUIRadialPingView initWithFrame:]::$_0::operator()(&p_container, (void **)&v3->_blurs, 0.15);
    -[LAUIRadialPingView initWithFrame:]::$_0::operator()(&p_container, (void **)&v3->_blurs.__elems_[1].view, 0.1);
    [(LAUIRadialPingView *)v3 setTintColor:v3->_color];
    [(LAUIRadialPingView *)v3 _updateViewsWithColor];
    [(LAUIRadialPingView *)v3 _updateAnimatingAnimated:0];
    uint64_t v12 = 0;
    char v13 = 1;
    do
    {
      char v14 = v13;
      [(LAUIRadialPingView *)v3 _updateExpandForBlurAtIndex:v12 withDelay:0.0];
      char v13 = 0;
      uint64_t v12 = 1;
    }
    while ((v14 & 1) != 0);
  }
  return v3;
}

- (void)initWithFrame:
{
  id v6 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
  v7 = [v6 layer];
  CATransform3DMakeScale(&v9, 0.001, 0.001, 1.0);
  [v7 setTransform:&v9];

  [v6 setAlpha:a3];
  [**a1 addSubview:v6];
  uint64_t v8 = *a2;
  *a2 = v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)LAUIRadialPingView;
  [(LAUIRadialPingView *)&v2 dealloc];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)LAUIRadialPingView;
  [(LAUIRadialPingView *)&v7 tintColorDidChange];
  v3 = [(LAUIRadialPingView *)self tintColor];
  color = self->_color;
  if (color != v3 && (!v3 || !color || ([(UIColor *)color isEqual:v3] & 1) == 0))
  {
    v5 = (UIColor *)[(UIColor *)v3 copy];
    id v6 = self->_color;
    self->_color = v5;

    [(LAUIRadialPingView *)self _updateViewsWithColor];
  }
}

- (void)didMoveToWindow
{
  v7.receiver = self;
  v7.super_class = (Class)LAUIRadialPingView;
  [(LAUIRadialPingView *)&v7 didMoveToWindow];
  if (self->_animating)
  {
    v3 = [(LAUIRadialPingView *)self window];

    if (v3)
    {
      if (self->_animating_dirty)
      {
        uint64_t v4 = self;
        uint64_t v5 = 1;
LABEL_9:
        [(LAUIRadialPingView *)v4 _updateAnimatingAnimated:v5];
        return;
      }
      [(LAUIRadialPingView *)self _startExpandWithDelay:0.0];
    }
    else
    {
      LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_pulse);
      for (uint64_t i = 8; i != 88; i += 40)
        LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)((char *)&self->_blurs + i));
      if (self->_animating_dirty)
      {
        uint64_t v4 = self;
        uint64_t v5 = 0;
        goto LABEL_9;
      }
      [(LAUIRadialPingView *)self _endExpand];
    }
  }
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)LAUIRadialPingView;
  [(LAUIRadialPingView *)&v34 layoutSubviews];
  [(LAUIRadialPingView *)self bounds];
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  double width = v36.size.width;
  double height = v36.size.height;
  double MidX = CGRectGetMidX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  double MidY = CGRectGetMidY(v37);
  if (height >= width) {
    double v9 = width;
  }
  else {
    double v9 = height;
  }
  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  [(UIView *)self->_container bounds];
  v42.origin.CGFloat x = v10;
  v42.origin.CGFloat y = v11;
  v42.size.double width = v9;
  v42.size.double height = v9;
  if (!CGRectEqualToRect(v38, v42))
  {
    -[UIView setBounds:](self->_container, "setBounds:", v10, v11, v9, v9);
    uint64_t v12 = [(UIView *)self->_container layer];
    [v12 setCornerRadius:v9 * 0.5];
  }
  [(UIView *)self->_container center];
  if (v14 != MidX || v13 != MidY) {
    -[UIView setCenter:](self->_container, "setCenter:", MidX, MidY);
  }
  v39.origin.CGFloat x = v10;
  v39.origin.CGFloat y = v11;
  v39.size.double width = v9;
  v39.size.double height = v9;
  double v16 = CGRectGetMidX(v39);
  v40.origin.CGFloat x = v10;
  v40.origin.CGFloat y = v11;
  v40.size.double width = v9;
  v40.size.double height = v9;
  double v17 = CGRectGetMidY(v40);
  [(UIView *)self->_primary bounds];
  v43.origin.CGFloat x = v10;
  v43.origin.CGFloat y = v11;
  v43.size.double width = v9;
  v43.size.double height = v9;
  if (!CGRectEqualToRect(v41, v43))
  {
    -[UIView setBounds:](self->_primary, "setBounds:", v10, v11, v9, v9);
    v18 = [(UIView *)self->_primary layer];
    [v18 setCornerRadius:v9 * 0.5];
  }
  [(UIView *)self->_primary center];
  if (v20 != v16 || v19 != v17) {
    -[UIView setCenter:](self->_primary, "setCenter:", v16, v17);
  }
  uint64_t v22 = 0;
  p_blurs = &self->_blurs;
  double v24 = v9 / 1000.0;
  do
  {
    v25 = p_blurs->__elems_[v22].view;
    id v26 = [(UIImageView *)v25 layer];
    [v26 bounds];
    if (v28 >= v27) {
      double v29 = v27;
    }
    else {
      double v29 = v28;
    }
    CATransform3DMakeScale(&v35, v24 * (v29 / 1000.0) * 0.001, v24 * (v29 / 1000.0) * 0.001, 1.0);
    [v26 setTransform:&v35];

    v30 = v25;
    [(UIImageView *)v30 center];
    if (v32 != v16 || v31 != v17) {
      -[UIImageView setCenter:](v30, "setCenter:", v16, v17);
    }

    ++v22;
  }
  while (v22 != 2);
}

- (void)_updateViewsWithColor
{
  id v13 = a2;
  uint64_t v5 = (void *)MEMORY[0x263F1C6B0];
  id v6 = [**(id **)a1 pathForResource:a3 ofType:@"png"];
  objc_super v7 = [v5 imageWithContentsOfFile:v6];

  if (**(void **)(a1 + 8))
  {
    uint64_t v8 = objc_msgSend(v7, "_flatImageWithColor:");

    objc_super v7 = (void *)v8;
  }
  [v13 setImage:v7];
  double v9 = *MEMORY[0x263F00148];
  double v10 = *(double *)(MEMORY[0x263F00148] + 8);
  [v7 size];
  objc_msgSend(v13, "setBounds:", v9, v10, v11, v12);
}

- (void)_setPulse:(BOOL)a3 withDelay:(double)a4
{
  if (a3)
  {
    id v6 = [(LAUIRadialPingView *)self window];
    BOOL v7 = v6 != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  p_pulse = (dispatch_source_t *)&self->_pulse;
  if (self->_pulse.enabled != v7)
  {
    *(unsigned char *)p_pulse = v7;
    LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse);
    keCGFloat y = self->_pulse._key;
    if (*(unsigned char *)p_pulse)
    {
      if (!key)
      {
        [(LAUIRadialPingView *)self _attachPulseAnimationWithDelay:a4];
      }
    }
    else if (key)
    {
      if (LAUI_CA_utilities::periodic_animation_state::elapsed_duration((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse) <= 0.0
        || (double v10 = LAUI_CA_utilities::periodic_animation_state::remaining_duration((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse),
            v10 <= 0.0))
      {
        LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_pulse);
      }
      else
      {
        double v11 = v10;
        objc_initWeak(&location, self);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3321888768;
        v13[2] = __42__LAUIRadialPingView__setPulse_withDelay___block_invoke;
        v13[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ42__LAUIRadialPingView__setPulse_withDelay__E3__4_e5_v8__0l;
        objc_copyWeak(&to, &location);
        objc_copyWeak(&v14, &to);
        LAUI_CA_utilities::periodic_animation_state::create_removal_timer(p_pulse, v13, v11);
        objc_destroyWeak(&to);
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __42__LAUIRadialPingView__setPulse_withDelay___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v2 = WeakRetained;
    LAUI_CA_utilities::periodic_animation_state::detach_animation(WeakRetained + 64);
    WeakRetained = v2;
  }
}

- (void)_attachPulseAnimationWithDelay:(double)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  p_pulse = (id *)&self->_pulse;
  if (!self->_pulse._key)
  {
    id v6 = [(LAUIRadialPingView *)self window];

    if (v6)
    {
      BOOL v7 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale.xy"];
      [(CAAnimation *)v7 setBeginTimeMode:*MEMORY[0x263F15980]];
      [(CAAnimation *)v7 setBeginTime:a3];
      [(CAAnimation *)v7 setAdditive:1];
      [(CAAnimation *)v7 setDuration:2.0];
      [(CAAnimation *)v7 setCalculationMode:*MEMORY[0x263F15958]];
      LODWORD(v8) = 2139095039;
      [(CAAnimation *)v7 setRepeatCount:v8];
      [(CAAnimation *)v7 setKeyTimes:&unk_26C534728];
      [(CAAnimation *)v7 setValues:&unk_26C534740];
      LODWORD(v9) = 1054280253;
      LODWORD(v10) = 1.0;
      LODWORD(v11) = 1.0;
      double v12 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :0.0 :v10 :v11];
      v18[0] = v12;
      LODWORD(v13) = 1058306785;
      LODWORD(v14) = 1.0;
      v15 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v13 :v14];
      v18[1] = v15;
      double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
      [(CAAnimation *)v7 setTimingFunctions:v16];

      double v17 = [(UIView *)self->_container layer];
      LAUI_CA_utilities::periodic_animation_state::attach_animation(p_pulse, v17, v7, &cfstr_Pulse.isa);
    }
  }
}

- (void)_setExpand:(BOOL)a3 forBlurAtIndex:(unint64_t)a4 withDelay:(double)a5
{
  if (a3)
  {
    double v8 = [(LAUIRadialPingView *)self window];
    int v9 = v8 != 0;
  }
  else
  {
    int v9 = 0;
  }
  if (a4 >= 2) {
    -[LAUIRadialPingView _setExpand:forBlurAtIndex:withDelay:]();
  }
  double v10 = &self->_blurs.__elems_[a4];
  int enabled = v10->pulse.enabled;
  p_pulse = &v10->pulse;
  if (enabled != v9)
  {
    p_pulse->int enabled = v9;
    [(LAUIRadialPingView *)self _updateExpandForBlurAtIndex:a4 withDelay:a5];
  }
}

- (void)_updateExpandForBlurAtIndex:(unint64_t)a3 withDelay:(double)a4
{
  if (a3 >= 2) {
    -[LAUIRadialPingView _updateExpandForBlurAtIndex:withDelay:]();
  }
  p_blurs = &self->_blurs;
  double v8 = &self->_blurs.__elems_[a3];
  p_pulse = (LAUI_CA_utilities::periodic_animation_state *)&v8->pulse;
  if (v8->pulse.enabled)
  {
    [(UIImageView *)v8->view setHidden:0];
    if (!p_blurs->__elems_[a3].pulse._key)
    {
      [(LAUIRadialPingView *)self _attachExpandAnimationToContainer:v8 withDelay:a4];
    }
  }
  else if (p_blurs->__elems_[a3].pulse._key)
  {
    double v10 = LAUI_CA_utilities::periodic_animation_state::elapsed_duration(p_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)p_pulse);
    double v11 = [(UIImageView *)v8->view layer];
    uint64_t v12 = [v11 presentationLayer];
    double v13 = (void *)v12;
    if (v10 <= 0.0 || v12 == 0)
    {
      [(UIImageView *)v8->view setHidden:1];
    }
    else
    {
      double v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long to = 0u;
      long long v51 = 0u;
      [v13 transform];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long location = 0u;
      long long v43 = 0u;
      if (v11) {
        [v11 transform];
      }
      double v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
      uint64_t v18 = *MEMORY[0x263F15980];
      [v17 setBeginTimeMode:*MEMORY[0x263F15980]];
      [v17 setAdditive:1];
      LODWORD(v19) = 1.0;
      LODWORD(v20) = 1055369095;
      v21 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v20 :v19];
      [v17 setTimingFunction:v21];

      [v17 setDuration:0.25];
      v41[5] = v55;
      v41[6] = v56;
      v41[7] = v57;
      v41[1] = v51;
      v41[2] = v52;
      v41[3] = v53;
      v41[4] = v54;
      v40[2] = v44;
      v40[3] = v45;
      v40[0] = location;
      v40[1] = v43;
      v40[7] = v49;
      v41[0] = to;
      v40[5] = v47;
      v40[6] = v48;
      v40[4] = v46;

      [v16 addObject:v17];
      [v13 opacity];
      float v23 = v22;
      [v11 opacity];
      float v25 = v24;
      id v26 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
      [v26 setBeginTimeMode:v18];
      [v26 setAdditive:1];
      LODWORD(v27) = 1.0;
      LODWORD(v28) = 1055369095;
      double v29 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v28 :v27];
      [v26 setTimingFunction:v29];

      [v26 setDuration:0.25];
      v30 = [NSNumber numberWithDouble:v23 - v25];
      [v26 setFromValue:v30];

      double v31 = [NSNumber numberWithDouble:-v25];
      [v26 setToValue:v31];

      [v16 addObject:v26];
      double v32 = [MEMORY[0x263F15750] animation];
      [(CAAnimation *)v32 setBeginTimeMode:v18];
      [(CAAnimation *)v32 setFillMode:*MEMORY[0x263F15AA0]];
      [(CAAnimation *)v32 setBeginTime:a4];
      [(CAAnimation *)v32 setDuration:0.25];
      [(CAAnimation *)v32 setAnimations:v16];
      objc_initWeak((id *)&location, self);
      unsigned __int8 animating_counter = self->_animating_counter;
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3321888768;
      v36[2] = __60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay___block_invoke;
      v36[3] = &__block_descriptor_56_ea8_32c73_ZTSKZ60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay__E3__5_e8_v12__0B8l;
      objc_copyWeak((id *)&to, (id *)&location);
      BYTE8(to) = animating_counter;
      objc_super v34 = v11;
      *(void *)&long long v51 = v34;
      objc_copyWeak(&v37, (id *)&to);
      char v38 = BYTE8(to);
      id v39 = (id)v51;
      [(CAAnimation *)v32 laui_setDidStopHandler:v36];

      objc_destroyWeak((id *)&to);
      id v35 = LAUILayerAddAdditiveAnimation(v34, 0, v32);

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)&location);
    }
  }
  else
  {
    view = v8->view;
    [(UIImageView *)view setHidden:1];
  }
}

void __60__LAUIRadialPingView__updateExpandForBlurAtIndex_withDelay___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[545] == *(unsigned __int8 *)(a1 + 40)) {
    [*(id *)(a1 + 48) setHidden:1];
  }
}

- (void)_attachExpandAnimationToContainer:(blur_container *)a3 withDelay:(double)a4
{
  v45[3] = *MEMORY[0x263EF8340];
  if (!a3->pulse._key)
  {
    id v6 = [(LAUIRadialPingView *)self window];

    if (v6)
    {
      id v39 = [(UIImageView *)a3->view layer];
      BOOL v7 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
      double v8 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform"];
      uint64_t v9 = *MEMORY[0x263F15980];
      [v8 setBeginTimeMode:*MEMORY[0x263F15980]];
      [v8 setAdditive:1];
      [v8 setDuration:2.0];
      uint64_t v10 = *MEMORY[0x263F15970];
      [v8 setCalculationMode:*MEMORY[0x263F15970]];
      [v8 setKeyTimes:&unk_26C534758];
      double v11 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeScale(&v42, 0.0, 0.0, 0.0);
      uint64_t v12 = [v11 valueWithCATransform3D:&v42];
      v45[0] = v12;
      double v13 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeScale(&v41, 1000.0, 1000.0, 0.0);
      double v14 = [v13 valueWithCATransform3D:&v41];
      v45[1] = v14;
      v15 = (void *)MEMORY[0x263F08D40];
      CATransform3DMakeScale(&v40, 1000.0, 1000.0, 0.0);
      double v16 = [v15 valueWithCATransform3D:&v40];
      v45[2] = v16;
      double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:3];
      [v8 setValues:v17];

      LODWORD(v18) = 1054280253;
      LODWORD(v19) = 1061901975;
      LODWORD(v20) = 1.0;
      v21 = [MEMORY[0x263F15808] functionWithControlPoints:v18 :0.0 :v19 :v20];
      [v8 setTimingFunction:v21];

      [v7 addObject:v8];
      [(CALayer *)v39 opacity];
      float v23 = v22;
      float v24 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
      [v24 setBeginTimeMode:v9];
      [v24 setAdditive:1];
      [v24 setDuration:2.0];
      [v24 setCalculationMode:v10];
      [v24 setKeyTimes:&unk_26C534770];
      v44[0] = &unk_26C534448;
      v44[1] = &unk_26C534448;
      double v25 = -v23;
      id v26 = [NSNumber numberWithDouble:v25];
      v44[2] = v26;
      double v27 = [NSNumber numberWithDouble:v25];
      v44[3] = v27;
      double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
      [v24 setValues:v28];

      LODWORD(v29) = 1.0;
      LODWORD(v30) = 1058306785;
      double v31 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v30 :v29];
      v43[0] = v31;
      LODWORD(v32) = 1.0;
      LODWORD(v33) = 1058306785;
      objc_super v34 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v33 :v32];
      v43[1] = v34;
      id v35 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC8]];
      v43[2] = v35;
      CGRect v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:3];
      [v24 setTimingFunctions:v36];

      [v7 addObject:v24];
      id v37 = [MEMORY[0x263F15750] animation];
      [(CAAnimation *)v37 setBeginTimeMode:v9];
      [(CAAnimation *)v37 setBeginTime:a4];
      [(CAAnimation *)v37 setDuration:2.0];
      LODWORD(v38) = 2139095039;
      [(CAAnimation *)v37 setRepeatCount:v38];
      [(CAAnimation *)v37 setAnimations:v7];
      LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&a3->pulse, v39, v37, &cfstr_Expand.isa);
    }
  }
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    uint64_t v4 = [(LAUIRadialPingView *)self window];

    if (self->_animating && v4 == 0)
    {
      self->_animating_dirtCGFloat y = 1;
    }
    else
    {
      [(LAUIRadialPingView *)self _updateAnimatingAnimated:v4 != 0];
    }
  }
}

- (void)_updateAnimatingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_animating_dirtCGFloat y = 0;
  unsigned __int8 v5 = self->_animating_counter + 1;
  self->_unsigned __int8 animating_counter = v5;
  id v6 = [(UIView *)self->_primary layer];
  BOOL animating = self->_animating;
  double v8 = 0.001;
  if (self->_animating) {
    double v8 = 1.0;
  }
  memset(&v37, 0, sizeof(v37));
  CATransform3DMakeScale(&v37, v8, v8, 1.0);
  [v6 removeAnimationForKey:@"transform"];
  CATransform3D v36 = v37;
  [v6 setTransform:&v36];
  if (v3)
  {
    uint64_t v9 = [v6 presentationLayer];
    uint64_t v10 = (void *)v9;
    if (v9) {
      double v11 = (void *)v9;
    }
    else {
      double v11 = v6;
    }
    id v12 = v11;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    if (v12) {
      [v12 transform];
    }
    double v13 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform"];
    [v13 setBeginTimeMode:*MEMORY[0x263F15980]];
    [v13 setAdditive:1];
    LODWORD(v14) = 1055369095;
    LODWORD(v15) = 1.0;
    double v16 = [MEMORY[0x263F15808] functionWithControlPoints:0.0 :0.0 :v14 :v15];
    [v13 setTimingFunction:v16];

    double v17 = 1.0;
    if (!self->_animating) {
      double v17 = 0.25;
    }
    [v13 setDuration:v17];
    [v13 setFillMode:*MEMORY[0x263F15AB8]];
    v27[5] = v33;
    v27[6] = v34;
    v27[7] = v35;
    v27[1] = v29;
    v27[2] = v30;
    v27[3] = v31;
    v27[4] = v32;
    CATransform3D v26 = v37;
    v27[0] = v28;

    objc_initWeak(&location, self);
    if (self->_animating)
    {
      [v6 setHidden:!animating];
      [(LAUIRadialPingView *)self _startExpandWithDelay:0.135];
    }
    else
    {
      [(LAUIRadialPingView *)self _endExpand];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3321888768;
      v21[2] = __47__LAUIRadialPingView__updateAnimatingAnimated___block_invoke;
      v21[3] = &__block_descriptor_56_ea8_32c60_ZTSKZ47__LAUIRadialPingView__updateAnimatingAnimated__E3__6_e8_v12__0B8l;
      objc_copyWeak(&to, &location);
      LOBYTE(v19) = v5;
      HIBYTE(v19) = !animating;
      id v20 = v6;
      objc_copyWeak(&v22, &to);
      __int16 v23 = v19;
      id v24 = v20;
      objc_msgSend(v13, "laui_setDidStopHandler:", v21);

      objc_destroyWeak(&to);
      objc_destroyWeak(&v22);
    }
    [v6 addAnimation:v13 forKey:@"transform"];
    objc_destroyWeak(&location);
  }
  else
  {
    [v6 setHidden:!animating];
    if (self->_animating) {
      [(LAUIRadialPingView *)self _startExpandWithDelay:0.0];
    }
    else {
      [(LAUIRadialPingView *)self _endExpand];
    }
  }
}

void __47__LAUIRadialPingView__updateAnimatingAnimated___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[545] == *(unsigned __int8 *)(a1 + 40)) {
    [*(id *)(a1 + 48) setHidden:*(unsigned __int8 *)(a1 + 41)];
  }
}

- (void)_startExpandWithDelay:(double)a3
{
  [(LAUIRadialPingView *)self _setPulse:1 withDelay:a3 + 0.115];
  [(LAUIRadialPingView *)self _setExpand:1 forBlurAtIndex:0 withDelay:a3];
  [(LAUIRadialPingView *)self _setExpand:1 forBlurAtIndex:1 withDelay:a3 + 0.265];
}

- (void)_endExpand
{
  [(LAUIRadialPingView *)self _setPulse:0 withDelay:0.0];
  [(LAUIRadialPingView *)self _setExpand:0 forBlurAtIndex:0 withDelay:0.0];
  [(LAUIRadialPingView *)self _setExpand:0 forBlurAtIndex:1 withDelay:0.0];
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void).cxx_destruct
{
  p_pulse = &self->_pulse;

  objc_destroyWeak((id *)&p_pulse->_layer);
  unint64_t v4 = 0;
  p_blurs = &self->_blurs;
  do
  {

    objc_destroyWeak((id *)&p_blurs->__elems_[v4 / 0x28 + 1].pulse._layer);
    v4 -= 40;
  }
  while (v4 != -80);
  objc_storeStrong((id *)&self->_primary, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (id).cxx_construct
{
  uint64_t v3 = 0;
  p_blurs = &self->_blurs;
  do
  {
    unsigned __int8 v5 = (array<(anonymous namespace)::blur_container, 2UL> *)((char *)p_blurs + v3 * 40);
    v5->__elems_[0].view = 0;
    v5->__elems_[0].pulse._keCGFloat y = 0;
    v5->__elems_[0].pulse._layer = 0;
    v5->__elems_[0].pulse._removal_timer = 0;
    LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&p_blurs->__elems_[v3++].pulse);
  }
  while (v3 != 2);
  self->_pulse._keCGFloat y = 0;
  self->_pulse._layer = 0;
  self->_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_pulse);
  return self;
}

- (void)_setExpand:forBlurAtIndex:withDelay:.cold.1()
{
}

- (void)_updateExpandForBlurAtIndex:withDelay:.cold.1()
{
}

@end