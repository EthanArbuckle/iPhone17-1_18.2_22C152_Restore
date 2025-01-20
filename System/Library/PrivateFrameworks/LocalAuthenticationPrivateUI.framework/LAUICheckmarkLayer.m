@interface LAUICheckmarkLayer
- (BOOL)isRevealed;
- (CGColor)color;
- (CGSize)aspectSize;
- (CGSize)defaultSizeForCircleWithDiameter:(double)a3 scale:(double)a4;
- (LAUICheckmarkLayer)init;
- (UIColor)primaryColor;
- (double)lineWidthScale;
- (id).cxx_construct;
- (void)_animationsDidResolve;
- (void)_executeCompletions:(BOOL)a3;
- (void)_updateRevealedAnimated:(BOOL)a3;
- (void)dealloc;
- (void)layoutSublayers;
- (void)setColor:(CGColor *)a3 animated:(BOOL)a4;
- (void)setLineWidthScale:(double)a3;
- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4;
- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation LAUICheckmarkLayer

- (LAUICheckmarkLayer)init
{
  v2 = self;
  v28[12] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x2166A1B20](self, a2);
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = (void *)MEMORY[0x263F15838];
  v6 = [v4 URLForResource:@"checkmark" withExtension:@"caml"];
  v7 = [v5 packageWithContentsOfURL:v6 type:*MEMORY[0x263F15EF0] options:0 error:0];

  v8 = [v7 rootLayer];
  v9 = [MEMORY[0x263EFF9D0] null];
  v27[0] = @"position";
  v27[1] = @"bounds";
  v28[0] = v9;
  v28[1] = v9;
  v27[2] = @"transform";
  v27[3] = @"backgroundColor";
  v28[2] = v9;
  v28[3] = v9;
  v27[4] = @"cornerRadius";
  v27[5] = @"contents";
  v28[4] = v9;
  v28[5] = v9;
  v27[6] = @"anchorPoint";
  v27[7] = @"opacity";
  v28[6] = v9;
  v28[7] = v9;
  v27[8] = @"strokeStart";
  v27[9] = @"strokeEnd";
  v28[8] = v9;
  v28[9] = v9;
  v27[10] = @"strokeColor";
  v27[11] = @"fillColor";
  v28[10] = v9;
  v28[11] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:12];

  [v8 setActions:v10];
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = (_anonymous_namespace_ *)v8;
  }
  else {
  v13 = v12 = 0;
  }

  if (v13)
  {
    v26.receiver = v2;
    v26.super_class = (Class)LAUICheckmarkLayer;
    v14 = [(LAUICheckmarkLayer *)&v26 init];
    v15 = v14;
    if (v14)
    {
      p_shape_layer = (id *)&v14->_shape_layer;
      objc_storeStrong((id *)&v14->_shape_layer, v13);
      if (*p_shape_layer) {
        [*p_shape_layer transform];
      }
      else {
        memset(&a, 0, sizeof(a));
      }
      long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
      *(_OWORD *)&v24.m31 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      *(_OWORD *)&v24.m33 = v18;
      long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      *(_OWORD *)&v24.m41 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      *(_OWORD *)&v24.m43 = v19;
      long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      *(_OWORD *)&v24.m11 = *MEMORY[0x263F15740];
      *(_OWORD *)&v24.m13 = v20;
      long long v21 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      *(_OWORD *)&v24.m21 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      *(_OWORD *)&v24.m23 = v21;
      if (!CATransform3DEqualToTransform(&a, &v24)) {
        __assert_rtn("[(LAUICheckmarkLayer *)[_shape_layer transform] init]");
      }
      [*p_shape_layer bounds];
      v15->_line_width = v22 * 0.144021524;
      v15->_effective_line_width = v22 * 0.144021524;
      v15->_line_width_scale = 1.0;
      [*p_shape_layer setLineWidth:v15->_line_width];
      if (*p_shape_layer)
      {
        -[LAUICheckmarkLayer addSublayer:](v15, "addSublayer:");
        [(LAUICheckmarkLayer *)v15 _updateRevealedAnimated:0];
      }
    }
    v2 = v15;
    v17 = v2;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)dealloc
{
  LAUI_CA_utilities::animation_completion_handler_container::execute((LAUI_CA_utilities::animation_completion_handler_container **)&self->_completions, 0);
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)LAUICheckmarkLayer;
  [(LAUICheckmarkLayer *)&v3 dealloc];
}

- (void)layoutSublayers
{
  v41.receiver = self;
  v41.super_class = (Class)LAUICheckmarkLayer;
  [(LAUICheckmarkLayer *)&v41 layoutSublayers];
  [(CAShapeLayer *)self->_shape_layer bounds];
  double v4 = v3;
  double v5 = self->_effective_line_width * 0.5;
  double v6 = v5 + v3 + v5;
  double v35 = v7;
  double v8 = v5 + v7 + v5;
  [(LAUICheckmarkLayer *)self bounds];
  double v33 = v10;
  double v34 = v11;
  double v13 = v12;
  double v14 = v9;
  double v15 = v12 / v6;
  double v16 = 1.0;
  if (v6 == 0.0) {
    double v15 = 1.0;
  }
  if (v8 != 0.0) {
    double v16 = v9 / v8;
  }
  if (v16 >= v15) {
    CGFloat v17 = v15;
  }
  else {
    CGFloat v17 = v16;
  }
  long long v18 = 0uLL;
  memset(&v40, 0, sizeof(v40));
  shape_layer = self->_shape_layer;
  if (shape_layer)
  {
    [(CAShapeLayer *)shape_layer transform];
    long long v18 = 0uLL;
  }
  *(_OWORD *)&v39.m41 = v18;
  *(_OWORD *)&v39.m43 = v18;
  *(_OWORD *)&v39.m31 = v18;
  *(_OWORD *)&v39.m33 = v18;
  *(_OWORD *)&v39.m21 = v18;
  *(_OWORD *)&v39.m23 = v18;
  *(_OWORD *)&v39.m11 = v18;
  *(_OWORD *)&v39.m13 = v18;
  CATransform3DMakeScale(&v39, v17, v17, 1.0);
  CATransform3D a = v40;
  CATransform3D b = v39;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    long long v20 = self->_shape_layer;
    CATransform3D v36 = v39;
    [(CAShapeLayer *)v20 setTransform:&v36];
  }
  double v21 = v6 * v17;
  double v22 = v8 * v17;
  [(LAUICheckmarkLayer *)self contentsScale];
  double v24 = v33 + (v13 - v21) * 0.5;
  if (v23 == 0.0)
  {
    double v25 = round(v24);
    double v26 = round(v34 + (v14 - v22) * 0.5);
  }
  else
  {
    double v25 = round(v24 * v23) / v23;
    double v26 = round((v34 + (v14 - v22) * 0.5) * v23) / v23;
  }
  CGFloat v27 = v25 + v17 * v5;
  CGFloat v28 = v26 + v17 * v5;
  CGFloat v29 = v4 * v17;
  v30 = self->_shape_layer;
  CGFloat v31 = v35 * v17;
  v42.origin.x = v27;
  v42.origin.y = v28;
  v42.size.width = v29;
  v42.size.height = v35 * v17;
  double MidX = CGRectGetMidX(v42);
  v43.origin.x = v27;
  v43.origin.y = v28;
  v43.size.width = v29;
  v43.size.height = v31;
  -[CAShapeLayer setPosition:](v30, "setPosition:", MidX, CGRectGetMidY(v43));
}

- (void)setLineWidthScale:(double)a3
{
  if (self->_line_width_scale != a3)
  {
    self->_line_width_scale = a3;
    if (a3 < 0.0) {
      a3 = 0.0;
    }
    self->_effective_line_width = a3 * self->_line_width;
    -[CAShapeLayer setLineWidth:](self->_shape_layer, "setLineWidth:");
    [(LAUICheckmarkLayer *)self setNeedsLayout];
  }
}

- (void)setPrimaryColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (UIColor *)a3;
  primary_color = self->_primary_color;
  double v10 = v6;
  if (primary_color != v6 && (!v6 || !primary_color || ([(UIColor *)primary_color isEqual:v6] & 1) == 0))
  {
    double v8 = (UIColor *)[(UIColor *)v10 copy];
    double v9 = self->_primary_color;
    self->_primary_color = v8;

    [(LAUICheckmarkLayer *)self setColor:[(UIColor *)self->_primary_color CGColor] animated:v4];
  }
}

- (void)setColor:(CGColor *)a3 animated:(BOOL)a4
{
  color = self->_color;
  if (color != a3)
  {
    BOOL v6 = a4;
    if (a3 && color)
    {
      if (CGColorEqualToColor(color, a3)) {
        return;
      }
      color = self->_color;
    }
    CGColorRelease(color);
    double v8 = CGColorRetain(a3);
    self->_color = v8;
    if (v6)
    {
      [(CAShapeLayer *)self->_shape_layer removeAnimationForKey:@"strokeColor"];
      id v9 = objc_alloc(MEMORY[0x263F15808]);
      LODWORD(v10) = 1043928040;
      LODWORD(v11) = 1058272560;
      LODWORD(v12) = 1063980840;
      double v13 = (CAMediaTimingFunction *)[v9 initWithControlPoints:v10 :0.0 :v11 :v12];
      LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v19, 2.0, 300.0, 400.0, 0.0, v13);

      double v14 = [(CAShapeLayer *)self->_shape_layer presentationLayer];
      shape_layer = v14;
      if (!v14) {
        shape_layer = self->_shape_layer;
      }
      double v16 = shape_layer;

      uint64_t v17 = [(CAShapeLayer *)v16 strokeColor];
      animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v19, &cfstr_Strokecolor.isa);
      [animation setAdditive:0];
      [animation setFromValue:v17];
      [animation setToValue:self->_color];
      [(CAShapeLayer *)self->_shape_layer addAnimation:animation forKey:@"strokeColor"];

      double v8 = self->_color;
    }
    [(CAShapeLayer *)self->_shape_layer setStrokeColor:v8];
  }
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setRevealed:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  double v15 = v8;
  if (self->_revealed == v6)
  {
    if (v8)
    {
      if (self->_animating)
      {
        std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>((uint64_t *)&self->_completions, &v15);
      }
      else
      {
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3321888768;
        v13[2] = __58__LAUICheckmarkLayer_setRevealed_animated_withCompletion___block_invoke;
        v13[3] = &__block_descriptor_40_ea8_32c71_ZTSKZ58__LAUICheckmarkLayer_setRevealed_animated_withCompletion__E3__0_e5_v8__0l;
        double v12 = (void *)MEMORY[0x2166A1D50](v8, v9, v10, v11);
        id v14 = (id)MEMORY[0x2166A1D50]();
        dispatch_async(MEMORY[0x263EF83A0], v13);
      }
    }
  }
  else
  {
    [(LAUICheckmarkLayer *)self _executeCompletions:0];
    self->_revealed = v6;
    if (v15) {
      std::vector<LAUI_CA_utilities::animation_completion_handler_container>::emplace_back<void({block_pointer} {__strong}&)(BOOL)>((uint64_t *)&self->_completions, &v15);
    }
    [(LAUICheckmarkLayer *)self _updateRevealedAnimated:v5];
  }
}

uint64_t __58__LAUICheckmarkLayer_setRevealed_animated_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CGSize)aspectSize
{
  [(CAShapeLayer *)self->_shape_layer bounds];
  double v4 = 1.0;
  if (v2 >= 1.0) {
    double v5 = v2;
  }
  else {
    double v5 = 1.0;
  }
  if (v3 >= 1.0) {
    double v4 = v3;
  }
  result.height = v4;
  result.width = v5;
  return result;
}

- (CGSize)defaultSizeForCircleWithDiameter:(double)a3 scale:(double)a4
{
  [(LAUICheckmarkLayer *)self aspectSize];
  double v8 = v7;
  double v9 = a3 * 0.434065934;
  if (a4 == 0.0)
  {
    double v10 = round(v9);
    double v11 = round(v6 * (v10 / v8));
  }
  else
  {
    double v10 = round(v9 * a4) / a4;
    double v11 = round(v6 * (v10 / v8) * a4) / a4;
  }
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_updateRevealedAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 1.0;
  if (!self->_revealed)
  {
    [(CAShapeLayer *)self->_shape_layer strokeStart];
    double v5 = v6;
  }
  BOOL animating = self->_animating;
  self->_BOOL animating = v3;
  unsigned int v8 = self->_animation_index + 1;
  self->_animation_index = v8;
  if (v3)
  {
    id v9 = objc_alloc(MEMORY[0x263F15808]);
    LODWORD(v10) = 1043928040;
    LODWORD(v11) = 1058272560;
    LODWORD(v12) = 1063980840;
    double v13 = (CAMediaTimingFunction *)[v9 initWithControlPoints:v10 :0.0 :v11 :v12];
    LAUI_CA_utilities::spring_factory::spring_factory((LAUI_CA_utilities::spring_factory *)v37, 2.0, 300.0, 400.0, 0.0, v13);

    if (self->_revealed)
    {
      if (animating)
      {
        std::vector<UIView * {__strong}>::emplace_back<UIView * {__strong}&>((char **)&self->_transient_shape_layers, (id *)&self->_shape_layer);
        double v16 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
        shape_layer = self->_shape_layer;
        self->_shape_layer = v16;

        if (self->_shape_layer) {
          -[LAUICheckmarkLayer addSublayer:](self, "addSublayer:");
        }
      }
      LODWORD(v14) = 1.0;
      [(CAShapeLayer *)self->_shape_layer setOpacity:v14];
      animation = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v37, &cfstr_Strokeend.isa);
      [(CAShapeLayer *)self->_shape_layer strokeStart];
      double v20 = v19;
      double v21 = animation;
      double v22 = [NSNumber numberWithDouble:v20 - v5];
      [(CAAnimation *)v21 setFromValue:v22];

      [(CAAnimation *)v21 setToValue:&unk_26C534478];
      [(CAShapeLayer *)self->_shape_layer setStrokeEnd:v5];
      double v23 = @"strokeEnd";
      if (!v21) {
        goto LABEL_16;
      }
    }
    else
    {
      double v25 = LAUI_CA_utilities::spring_factory::create_animation((LAUI_CA_utilities::spring_factory *)v37, &cfstr_Opacity.isa);
      [(CAShapeLayer *)self->_shape_layer opacity];
      int v27 = v26;
      double v21 = v25;
      LODWORD(v28) = v27;
      CGFloat v29 = [NSNumber numberWithFloat:v28];
      [(CAAnimation *)v21 setFromValue:v29];

      [(CAAnimation *)v21 setToValue:&unk_26C534478];
      [(CAShapeLayer *)self->_shape_layer setOpacity:0.0];
      double v23 = @"opacity";
      if (!v21) {
        goto LABEL_16;
      }
    }
    if (self->_shape_layer)
    {
      objc_initWeak(&location, self);
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3321888768;
      v33[2] = __46__LAUICheckmarkLayer__updateRevealedAnimated___block_invoke;
      v33[3] = &__block_descriptor_48_ea8_32c59_ZTSKZ46__LAUICheckmarkLayer__updateRevealedAnimated__E3__1_e8_v12__0B8l;
      objc_copyWeak(&v31, &location);
      unsigned int v32 = v8;
      objc_copyWeak(&v34, &v31);
      unsigned int v35 = v32;
      [(CAAnimation *)v21 laui_setDidStopHandler:v33];
      objc_destroyWeak(&v31);
      id v30 = LAUILayerAddAdditiveAnimation(&self->_shape_layer->super, &v23->isa, v21);
      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
LABEL_17:

      return;
    }
LABEL_16:
    self->_BOOL animating = 0;
    [(LAUICheckmarkLayer *)self _executeCompletions:1];
    [(LAUICheckmarkLayer *)self _animationsDidResolve];
    goto LABEL_17;
  }
  [(CAShapeLayer *)self->_shape_layer setStrokeEnd:v5];
  LODWORD(v24) = 1.0;
  [(CAShapeLayer *)self->_shape_layer setOpacity:v24];
  [(CAShapeLayer *)self->_shape_layer removeAllAnimations];
  [(LAUICheckmarkLayer *)self _executeCompletions:1];
  [(LAUICheckmarkLayer *)self _animationsDidResolve];
}

void __46__LAUICheckmarkLayer__updateRevealedAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && *((_DWORD *)WeakRetained + 17) == *(_DWORD *)(a1 + 40))
  {
    WeakRetained[64] = 0;
    [WeakRetained _executeCompletions:a2];
    [WeakRetained _animationsDidResolve];
  }
}

- (void)_executeCompletions:(BOOL)a3
{
  p_completions = (void ***)&self->_completions;
  LAUI_CA_utilities::animation_completion_handler_container::execute((LAUI_CA_utilities::animation_completion_handler_container **)&self->_completions, a3);
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__base_destruct_at_end[abi:ne180100]((uint64_t)p_completions, *p_completions);
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::shrink_to_fit((uint64_t *)p_completions);
}

- (void)_animationsDidResolve
{
  p_transient_shape_layers = &self->_transient_shape_layers;
  begin = self->_transient_shape_layers.__begin_;
  var0 = self->_transient_shape_layers.var0;
  if (var0 != begin)
  {
    do
    {
      double v7 = *begin++;
      [v7 removeFromSuperlayer];
    }
    while (begin != var0);
    unsigned int v8 = (char *)p_transient_shape_layers->__begin_;
    for (i = (char *)p_transient_shape_layers->var0; i != v8; i -= 8)
    {
      double v10 = (void *)*((void *)i - 1);
    }
    p_transient_shape_layers->var0 = (__end_cap_ **)v8;
    std::vector<CAShapeLayer * {__strong}>::shrink_to_fit((char **)p_transient_shape_layers);
  }
  if (!self->_revealed)
  {
    LODWORD(v2) = 1.0;
    [(CAShapeLayer *)self->_shape_layer setOpacity:v2];
    shape_layer = self->_shape_layer;
    [(CAShapeLayer *)shape_layer strokeStart];
    -[CAShapeLayer setStrokeEnd:](shape_layer, "setStrokeEnd:");
  }
}

- (UIColor)primaryColor
{
  return self->_primary_color;
}

- (double)lineWidthScale
{
  return self->_line_width_scale;
}

- (CGColor)color
{
  return self->_color;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primary_color, 0);
  p_begin = (void **)&self->_completions.__begin_;
  std::vector<LAUI_CA_utilities::animation_completion_handler_container>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  p_begin = (void **)&self->_transient_shape_layers.__begin_;
  std::vector<UIView * {__strong}>::__destroy_vector::operator()[abi:ne180100](&p_begin);
  objc_storeStrong((id *)&self->_shape_layer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 11) = 0;
  return self;
}

@end