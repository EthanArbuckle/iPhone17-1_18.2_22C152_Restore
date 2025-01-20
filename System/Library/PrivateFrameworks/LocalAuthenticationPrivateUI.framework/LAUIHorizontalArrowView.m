@interface LAUIHorizontalArrowView
- (BOOL)isAnimating;
- (CGSize)maximumLineSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LAUIHorizontalArrowView)initWithFrame:(CGRect)a3;
- (NSString)text;
- (double)displacement;
- (id).cxx_construct;
- (int64_t)direction;
- (void)_layoutIfNeededAnimated:(BOOL)a3;
- (void)_updateAnimatingAnimated:;
- (void)_updateAnimatingAnimated:(BOOL)a3;
- (void)_updateDirectionTransform;
- (void)_updateFont;
- (void)_updateLabelSize;
- (void)_updatePulsingWithDelay:(double)a3;
- (void)_updateViewsWithColor;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setDirection:(int64_t)a3;
- (void)setDisplacement:(double)a3;
- (void)setMaximumLineSize:(CGSize)a3;
- (void)setText:(id)a3;
- (void)tintColorDidChange;
@end

@implementation LAUIHorizontalArrowView

- (LAUIHorizontalArrowView)initWithFrame:(CGRect)a3
{
  v28.receiver = self;
  v28.super_class = (Class)LAUIHorizontalArrowView;
  v3 = -[LAUIHorizontalArrowView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_direction = 0;
    uint64_t v5 = [MEMORY[0x263F1C550] whiteColor];
    color = v4->_color;
    v4->_color = (UIColor *)v5;

    id v7 = objc_alloc(MEMORY[0x263F1CB60]);
    v8 = (double *)MEMORY[0x263F001A8];
    uint64_t v9 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    container = v4->_container;
    v4->_container = (UIView *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    arrow_container = v4->_arrow_container;
    v4->_arrow_container = (UIView *)v11;

    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", *v8, v8[1], v8[2], v8[3]);
    tail_container = v4->_tail_container;
    v4->_tail_container = (UIView *)v13;

    v15 = [(UIView *)v4->_tail_container layer];
    objc_msgSend(v15, "setAnchorPoint:", 0.0, 0.5);

    [(UIView *)v4->_tail_container setClipsToBounds:1];
    uint64_t v16 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    head = v4->_head;
    v4->_head = (UIImageView *)v16;

    v18 = [(UIImageView *)v4->_head layer];
    objc_msgSend(v18, "setAnchorPoint:", 0.0, 0.5);

    uint64_t v19 = [objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:0];
    tail = v4->_tail;
    v4->_tail = (UIImageView *)v19;

    v21 = [(UIImageView *)v4->_tail layer];
    objc_msgSend(v21, "setAnchorPoint:", 1.0, 0.5);

    v22 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    label = v4->_label;
    v4->_label = v22;

    [(UILabel *)v4->_label setNumberOfLines:3];
    v24 = v4->_label;
    v25 = [MEMORY[0x263F1C550] clearColor];
    [(UILabel *)v24 setBackgroundColor:v25];

    [(LAUIHorizontalArrowView *)v4 addSubview:v4->_container];
    [(UIView *)v4->_container addSubview:v4->_arrow_container];
    [(UIView *)v4->_arrow_container addSubview:v4->_tail_container];
    [(UIView *)v4->_arrow_container addSubview:v4->_head];
    [(UIView *)v4->_tail_container addSubview:v4->_tail];
    [(UIView *)v4->_container addSubview:v4->_label];
    [(LAUIHorizontalArrowView *)v4 setTintColor:v4->_color];
    [(LAUIHorizontalArrowView *)v4 _updateViewsWithColor];
    [(LAUIHorizontalArrowView *)v4 _updateAnimatingAnimated:0];
    [(LAUIHorizontalArrowView *)v4 _updateDirectionTransform];
    [(LAUIHorizontalArrowView *)v4 _updateFont];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    [v26 addObserver:v4 selector:sel_boldTextStatusDidChange_ name:*MEMORY[0x263F1CDD8] object:0];
    [v26 addObserver:v4 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x263F1D158] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)LAUIHorizontalArrowView;
  [(LAUIHorizontalArrowView *)&v4 dealloc];
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)LAUIHorizontalArrowView;
  [(LAUIHorizontalArrowView *)&v7 tintColorDidChange];
  v3 = [(LAUIHorizontalArrowView *)self tintColor];
  color = self->_color;
  if (color != v3 && (!v3 || !color || ([(UIColor *)color isEqual:v3] & 1) == 0))
  {
    uint64_t v5 = (UIColor *)[(UIColor *)v3 copy];
    v6 = self->_color;
    self->_color = v5;

    [(LAUIHorizontalArrowView *)self _updateViewsWithColor];
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)LAUIHorizontalArrowView;
  [(LAUIHorizontalArrowView *)&v4 didMoveToWindow];
  v3 = [(LAUIHorizontalArrowView *)self window];

  if (v3)
  {
    if (self->_animating == self->_effective_animating)
    {
      if (self->_animating || self->_dismissal_animation_count) {
        [(LAUIHorizontalArrowView *)self _updatePulsingWithDelay:0.0];
      }
    }
    else
    {
      [(LAUIHorizontalArrowView *)self _updateAnimatingAnimated:1];
    }
  }
  else
  {
    self->_pulsing = 0;
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_head_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_container_pulse);
    LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_counter_pulse);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double resting_height = self->_resting_height;
  double v4 = 52.0;
  result.height = resting_height;
  result.width = v4;
  return result;
}

- (void)_layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  [(LAUIHorizontalArrowView *)self layoutIfNeeded];
  self->_animated = 0;
}

- (void)layoutSubviews
{
}

- (void)_updateViewsWithColor
{
  uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  head = self->_head;
  id v24 = (id)v3;
  uint64_t v5 = objc_msgSend(MEMORY[0x263F1C6B0], "imageNamed:inBundle:compatibleWithTraitCollection:", @"arrow_head");
  v6 = v5;
  if (self->_color)
  {
    uint64_t v7 = objc_msgSend(v5, "_flatImageWithColor:");

    v6 = (void *)v7;
  }
  v8 = head;
  id v9 = v6;
  [(UIImageView *)v8 setImage:v9];
  [v9 size];
  if (v11 >= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  uint64_t v13 = (double *)MEMORY[0x263F00148];
  -[UIImageView setBounds:](v8, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v10, v11);

  tail = self->_tail;
  v15 = [MEMORY[0x263F1C6B0] imageNamed:@"arrow_tail" inBundle:v24 compatibleWithTraitCollection:0];
  uint64_t v16 = v15;
  if (self->_color)
  {
    uint64_t v17 = objc_msgSend(v15, "_flatImageWithColor:");

    uint64_t v16 = (void *)v17;
  }
  v18 = objc_msgSend(v16, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 5.0);
  uint64_t v19 = tail;
  id v20 = v18;
  [(UIImageView *)v19 setImage:v20];
  [v20 size];
  double v22 = v21;
  -[UIImageView setBounds:](v19, "setBounds:", *v13, v13[1], v23, v21);
  if (v22 < v12) {
    double v22 = v12;
  }

  self->_double resting_height = v22;
  [(UILabel *)self->_label setTextColor:self->_color];
  [(LAUIHorizontalArrowView *)self setNeedsLayout];
}

- (void)_updateAnimatingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v21 = a3;
  [(LAUIHorizontalArrowView *)self layoutIfNeeded];
  BOOL v5 = self->_effective_animating || self->_dismissal_animation_count != 0;
  unsigned int animating = self->_animating;
  self->_effective_unsigned int animating = animating;
  unsigned __int8 v20 = animating;
  if (animating) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v3;
  }
  double v19 = (double)animating;
  if (v7)
  {
    ++self->_dismissal_animation_count;
    uint64_t v16 = &v19;
    uint64_t v17 = &v21;
    v18 = &v20;
    [MEMORY[0x263F158F8] begin];
    objc_initWeak(&location, self);
    v8 = (void *)MEMORY[0x263F158F8];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3321888768;
    v13[2] = __52__LAUIHorizontalArrowView__updateAnimatingAnimated___block_invoke;
    v13[3] = &__block_descriptor_40_ea8_32c65_ZTSKZ52__LAUIHorizontalArrowView__updateAnimatingAnimated__E3__3_e5_v8__0l;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v14, &v12);
    [v8 setCompletionBlock:v13];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    unsigned int animating = v20;
  }
  else
  {
    uint64_t v16 = &v19;
    uint64_t v17 = &v21;
    v18 = &v20;
  }
  if (animating) {
    int v9 = v5;
  }
  else {
    int v9 = 1;
  }
  double v10 = 0.045;
  if (v9)
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    double v11 = 0.27;
  }
  -[LAUIHorizontalArrowView _updateAnimatingAnimated:]::$_2::operator()(&v16, self->_arrow_container, v10);
  -[LAUIHorizontalArrowView _updateAnimatingAnimated:]::$_2::operator()(&v16, self->_label, v11);
  if (v7) {
    [MEMORY[0x263F158F8] commit];
  }
  [(LAUIHorizontalArrowView *)self setNeedsLayout];
  [(LAUIHorizontalArrowView *)self _layoutIfNeededAnimated:v21];
}

void __52__LAUIHorizontalArrowView__updateAnimatingAnimated___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __int16 v1 = WeakRetained[209] - 1;
    WeakRetained[209] = v1;
    if (!*((unsigned char *)WeakRetained + 416) && v1 == 0)
    {
      [WeakRetained setNeedsLayout];
      [WeakRetained _layoutIfNeededAnimated:0];
    }
  }
}

- (void)_updateAnimatingAnimated:
{
  id v5 = a2;
  if (v5)
  {
    id v26 = v5;
    v6 = [v5 layer];
    [v6 opacity];
    if (**a1 != v7)
    {
      [v6 removeAnimationForKey:@"opacity"];
      double v8 = **a1;
      *(float *)&double v8 = v8;
      [v6 setOpacity:v8];
      if (*(unsigned char *)a1[1])
      {
        uint64_t v9 = [v6 presentationLayer];
        double v10 = (void *)v9;
        if (v9) {
          double v11 = (void *)v9;
        }
        else {
          double v11 = v6;
        }
        id v12 = v11;

        [v12 opacity];
        float v14 = v13;
        double v15 = **a1;
        int v16 = *(unsigned __int8 *)a1[2];
        uint64_t v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        [v17 setAdditive:1];
        [v17 setBeginTimeMode:*MEMORY[0x263F15980]];
        LODWORD(v18) = 1036831949;
        LODWORD(v19) = 0.25;
        LODWORD(v20) = 0.25;
        LODWORD(v21) = 1.0;
        double v22 = [MEMORY[0x263F15808] functionWithControlPoints:v19 :v18 :v20 :v21];
        [v17 setTimingFunction:v22];

        double v23 = 0.5;
        if (!v16) {
          double v23 = 0.25;
        }
        [v17 setDuration:v23];
        id v24 = v17;
        v25 = [NSNumber numberWithDouble:v14 - v15];
        [v24 setFromValue:v25];

        [v24 setToValue:&unk_26C5341C0];
        if (a3 > 0.0)
        {
          [v24 setFillMode:*MEMORY[0x263F15AA0]];
          [v24 setBeginTime:a3];
        }
        [v6 addAnimation:v24 forKey:@"opacity"];
      }
      else
      {
        [v6 removeAnimationForKey:@"opacity"];
      }
    }

    id v5 = v26;
  }
}

- (void)_updateDirectionTransform
{
  memset(&v11, 0, sizeof(v11));
  if (self->_direction)
  {
    CATransform3DMakeScale(&v11, -1.0, 1.0, 1.0);
  }
  else
  {
    long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    *(_OWORD *)&v11.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    *(_OWORD *)&v11.m33 = v3;
    long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    *(_OWORD *)&v11.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    *(_OWORD *)&v11.m43 = v4;
    long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    *(_OWORD *)&v11.m11 = *MEMORY[0x263F15740];
    *(_OWORD *)&v11.m13 = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    *(_OWORD *)&v11.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    *(_OWORD *)&v11.m23 = v6;
  }
  container = self->_container;
  CATransform3D v10 = v11;
  [(UIView *)container setTransform3D:&v10];
  label = self->_label;
  CATransform3D v9 = v11;
  [(UILabel *)label setTransform3D:&v9];
}

- (void)_updatePulsingWithDelay:(double)a3
{
  if (self->_effective_animating)
  {
    if (self->_pulsing) {
      return;
    }
    self->_pulsing = 1;
LABEL_7:
    [MEMORY[0x263F158F8] begin];
    double v15 = [MEMORY[0x263F15760] animationWithKeyPath:@"position.x"];
    [(CAAnimation *)v15 setBeginTimeMode:*MEMORY[0x263F15980]];
    [(CAAnimation *)v15 setAdditive:1];
    [(CAAnimation *)v15 setDuration:0.75];
    LODWORD(v7) = 2139095039;
    [(CAAnimation *)v15 setRepeatCount:v7];
    LODWORD(v8) = 0.5;
    LODWORD(v9) = 0.5;
    LODWORD(v10) = 1.0;
    CATransform3D v11 = [MEMORY[0x263F15808] functionWithControlPoints:v8 :0.0 :v9 :v10];
    [(CAAnimation *)v15 setTimingFunction:v11];

    [(CAAnimation *)v15 setBeginTime:a3];
    [(CAAnimation *)v15 setFromValue:&unk_26C5341C0];
    [(CAAnimation *)v15 setToValue:&unk_26C5344A8];
    [(CAAnimation *)v15 setAutoreverses:1];
    id v12 = [(UIImageView *)self->_head layer];
    LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_head_pulse, v12, v15, &cfstr_Pulse.isa);

    float v13 = [(UIView *)self->_tail_container layer];
    LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_tail_container_pulse, v13, v15, &cfstr_Pulse.isa);

    [(CAAnimation *)v15 setFromValue:&unk_26C5341C0];
    [(CAAnimation *)v15 setToValue:&unk_26C5344B8];
    float v14 = [(UIImageView *)self->_tail layer];
    LAUI_CA_utilities::periodic_animation_state::attach_animation((id *)&self->_tail_counter_pulse, v14, v15, &cfstr_Pulse.isa);

    [MEMORY[0x263F158F8] commit];

    return;
  }
  int dismissal_animation_count = self->_dismissal_animation_count;
  BOOL v6 = self->_dismissal_animation_count != 0;
  if (self->_pulsing == v6) {
    return;
  }
  self->_pulsing = v6;
  if (dismissal_animation_count) {
    goto LABEL_7;
  }
  LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_head_pulse);
  LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_container_pulse);
  LAUI_CA_utilities::periodic_animation_state::detach_animation((id *)&self->_tail_counter_pulse);
}

- (void)_updateFont
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  long long v3 = [MEMORY[0x263F1C660] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D260]];
  objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v3, "symbolicTraits") | 2);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  long long v4 = [MEMORY[0x263F1C658] fontWithDescriptor:v17 size:0.0];
  long long v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  [v4 lineHeight];
  double v9 = v8;
  [v4 leading];
  double v10 = fmax(v7, 1.0);
  double v12 = ceil(v10 * (v9 + v11)) / v10;
  id v13 = v4;
  float v14 = v13;
  double height = self->_maximum_line_size.height;
  int v16 = v13;
  if (v12 > height)
  {
    int v16 = [v13 _fontScaledByScaleFactor:height / v12];
  }
  [(UILabel *)self->_label setFont:v16];
  [(LAUIHorizontalArrowView *)self _updateLabelSize];
}

- (void)_updateLabelSize
{
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", self->_maximum_line_size.width, 1.79769313e308);
  -[UILabel setBounds:](self->_label, "setBounds:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v3, v4);
  [(LAUIHorizontalArrowView *)self setNeedsLayout];
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_unsigned int animating = a3;
    double v4 = [(LAUIHorizontalArrowView *)self window];

    BOOL v5 = self->_animating && v4 == 0;
    BOOL v6 = !v5;
    if (self->_effective_animating != self->_animating && v6)
    {
      [(LAUIHorizontalArrowView *)self _updateAnimatingAnimated:v4 != 0];
    }
  }
}

- (void)setDirection:(int64_t)a3
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    [(LAUIHorizontalArrowView *)self _updateDirectionTransform];
  }
}

- (void)setDisplacement:(double)a3
{
  if (self->_displacement != a3)
  {
    self->_displacement = a3;
    [(LAUIHorizontalArrowView *)self setNeedsLayout];
  }
}

- (void)setMaximumLineSize:(CGSize)a3
{
  if (a3.width <= 0.0) {
    a3.width = 1.79769313e308;
  }
  if (a3.height <= 0.0) {
    a3.double height = 1.79769313e308;
  }
  if (self->_maximum_line_size.width != a3.width || self->_maximum_line_size.height != a3.height)
  {
    self->_maximum_line_size = a3;
    [(LAUIHorizontalArrowView *)self _updateFont];
  }
}

- (void)setText:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  id v9 = v4;
  if (![v4 length])
  {

LABEL_5:
    BOOL v5 = 0;
    goto LABEL_6;
  }
  BOOL v5 = (NSString *)v9;
LABEL_6:
  text = self->_text;
  double v10 = v5;
  if (text != v5 && (!v5 || !text || ![(NSString *)text isEqualToString:v5]))
  {
    double v7 = (NSString *)[(NSString *)v10 copy];
    double v8 = self->_text;
    self->_text = v7;

    [(UILabel *)self->_label setText:self->_text];
    [(LAUIHorizontalArrowView *)self _updateLabelSize];
  }
}

- (CGSize)maximumLineSize
{
  double width = self->_maximum_line_size.width;
  double height = self->_maximum_line_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)displacement
{
  return self->_displacement;
}

- (NSString)text
{
  return self->_text;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_destroyWeak((id *)&self->_tail_counter_pulse._layer);
  objc_destroyWeak((id *)&self->_tail_container_pulse._layer);

  objc_destroyWeak((id *)&self->_head_pulse._layer);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_tail_container, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_arrow_container, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

- (id).cxx_construct
{
  p_head_pulse = &self->_head_pulse;
  p_head_pulse->_key = 0;
  p_head_pulse->_layer = 0;
  p_head_pulse->_removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)p_head_pulse);
  self->_tail_container_pulse._key = 0;
  self->_tail_container_pulse._layer = 0;
  self->_tail_container_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_tail_container_pulse);
  self->_tail_counter_pulse._key = 0;
  self->_tail_counter_pulse._layer = 0;
  self->_tail_counter_pulse._removal_timer = 0;
  LAUI_CA_utilities::periodic_animation_state::clear_removal_timer((LAUI_CA_utilities::periodic_animation_state *)&self->_tail_counter_pulse);
  return self;
}

@end