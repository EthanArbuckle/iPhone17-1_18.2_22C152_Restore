@interface CABasicAnimation
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)roundsToInteger;
- (double)endAngle;
- (double)startAngle;
- (id)byValue;
- (id)fromValue;
- (id)toValue;
- (void)CA_prepareRenderValue;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5;
- (void)setByValue:(id)byValue;
- (void)setEndAngle:(double)a3;
- (void)setFromValue:(id)fromValue;
- (void)setRoundsToInteger:(BOOL)a3;
- (void)setStartAngle:(double)a3;
- (void)setToValue:(id)toValue;
@end

@implementation CABasicAnimation

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  v43[1] = *(double *)MEMORY[0x1E4F143B8];
  v43[0] = a3;
  if (![(CAAnimation *)self isEnabled]) {
    return;
  }
  v8 = [(CAPropertyAnimation *)self keyPath];
  if (!v8) {
    return;
  }
  v9 = v8;
  int v42 = 0;
  if (!mapAnimationTime(&self->super.super, v43, &v42)) {
    return;
  }
  v10 = [(CABasicAnimation *)self fromValue];
  v11 = [(CABasicAnimation *)self toValue];
  id v12 = [(CABasicAnimation *)self byValue];
  id v13 = v12;
  if (v10 && v11) {
    goto LABEL_18;
  }
  if (!v10 || !v12)
  {
    if (v11 && v12)
    {
      uint64_t v16 = [(objc_object *)v11 CA_addValue:v12 multipliedBy:0xFFFFFFFFLL];
    }
    else
    {
      if (v10)
      {
        uint64_t v15 = [a5 valueForKeyPath:v9];
        goto LABEL_17;
      }
      if (!v11)
      {
        if (!v12) {
          return;
        }
        v14 = (objc_object *)[a4 valueForKeyPath:v9];
        v10 = v14;
        goto LABEL_9;
      }
      uint64_t v16 = [a4 valueForKeyPath:v9];
    }
    v10 = (objc_object *)v16;
    if (!v16) {
      return;
    }
    goto LABEL_19;
  }
  v14 = v10;
LABEL_9:
  uint64_t v15 = [(objc_object *)v14 CA_addValue:v13 multipliedBy:1];
LABEL_17:
  v11 = (objc_object *)v15;
LABEL_18:
  if (!v10) {
    return;
  }
LABEL_19:
  if (!v11) {
    return;
  }
  double v17 = v43[0];
  v18 = v10;
  if (v43[0] <= 0.0) {
    goto LABEL_30;
  }
  v18 = v11;
  if (v43[0] >= 1.0) {
    goto LABEL_30;
  }
  [(CABasicAnimation *)self _timeFunction:v43[0]];
  double v20 = v19;
  v43[0] = v19;
  [(CABasicAnimation *)self startAngle];
  double v22 = v21;
  [(CABasicAnimation *)self endAngle];
  double v24 = v23;
  if ((v22 != 0.0 || v23 != 0.0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v25 = (const char *)[(objc_object *)v10 objCType]) != 0
    && !strcmp(v25, "{CGPoint=dd}"))
  {
    v29 = (const char *)[(objc_object *)v10 objCType];
    v30 = (float64x2_t *)MEMORY[0x1E4F28AD0];
    if (v29 && !strcmp(v29, "{CGPoint=dd}"))
    {
      [(objc_object *)v10 pointValue];
      v31.f64[1] = v32;
    }
    else
    {
      float64x2_t v31 = *v30;
    }
    v33 = (const char *)[(objc_object *)v11 objCType];
    if (v33 && !strcmp(v33, "{CGPoint=dd}"))
    {
      [(objc_object *)v11 pointValue];
      v37.f64[0] = v38;
      v37.f64[1] = v39;
    }
    else
    {
      float64x2_t v37 = *v30;
    }
    float64x2_t v41 = 0uLL;
    CA::Render::point_interpolate(&v41, v34, v35, v36, v40, v37, v20, v22, v24);
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v41.f64[0], v41.f64[1]);
  }
  else
  {
    *(float *)&double v23 = v20;
    v18 = (objc_object *)[(objc_object *)v10 CA_interpolateValue:v11 byFraction:v23];
    if (![(CABasicAnimation *)self roundsToInteger]) {
      goto LABEL_30;
    }
    uint64_t v26 = [(objc_object *)v18 CA_roundToIntegerFromValue:v10];
  }
  v18 = (objc_object *)v26;
LABEL_30:
  if ([(CAPropertyAnimation *)self isCumulative] && v42)
  {
    if ([(CAAnimation *)self autoreverses]) {
      v27 = v10;
    }
    else {
      v27 = v11;
    }
    v18 = (objc_object *)[(objc_object *)v18 CA_addValue:v27 multipliedBy:v42];
  }
  v28 = [(CAPropertyAnimation *)self valueFunction];
  if (v28) {
    v18 = (objc_object *)applyValueFunction(v28, v18, &self->super, (objc_object *)a4);
  }
  if ([(CAPropertyAnimation *)self isAdditive]) {
    v18 = (objc_object *)objc_msgSend((id)objc_msgSend(a4, "valueForKeyPath:", v9), "CA_addValue:multipliedBy:", v18, 1);
  }
  [a4 setValue:v18 forKeyPath:v9];
}

- (void)setFromValue:(id)fromValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = fromValue;
  CAAnimation_setter((uint64_t)self, (const void *)0xF3, 2, (unsigned __int8 *)v3);
}

- (void)setByValue:(id)byValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = byValue;
  CAAnimation_setter((uint64_t)self, (const void *)0x4E, 2, (unsigned __int8 *)v3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
  v7 = (atomic_uint *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((void *)v6 + 9) = 0;
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((void *)v6 + 12) = 0;
    *((void *)v6 + 13) = 0;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((void *)v6 + 18) = 0;
    *((_DWORD *)v6 + 3) = 5;
    ++dword_1EB2ADDDC;
    *(void *)v6 = &unk_1ED02DD28;
    if (![(CABasicAnimation *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CABasicAnimation *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (void)CA_prepareRenderValue
{
  objc_msgSend(-[CABasicAnimation fromValue](self, "fromValue"), "CA_prepareRenderValue");
  objc_msgSend(-[CABasicAnimation toValue](self, "toValue"), "CA_prepareRenderValue");
  id v3 = [(CABasicAnimation *)self byValue];

  objc_msgSend(v3, "CA_prepareRenderValue");
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)CABasicAnimation;
  BOOL v6 = [(CAPropertyAnimation *)&v20 _setCARenderAnimation:a3 layer:a4];
  if (v6)
  {
    id v7 = [(CABasicAnimation *)self fromValue];
    if (v7)
    {
      v8 = (atomic_uint *)objc_msgSend(v7, "CA_copyRenderValue");
      CA::Render::ShapeLayer::set_dash_pattern((CA::Render::ShapeLayer *)a3, (CA::Render::Vector *)v8);
      if (v8)
      {
        if (atomic_fetch_add(v8 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
        }
      }
    }
    id v9 = [(CABasicAnimation *)self toValue];
    if (v9)
    {
      v10 = (atomic_uint *)objc_msgSend(v9, "CA_copyRenderValue");
      v11 = (atomic_uint *)*((void *)a3 + 15);
      if (v11 != v10)
      {
        if (v11 && atomic_fetch_add(v11 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v11 + 16))(v11);
        }
        if (v10)
        {
          id v12 = v10;
          if (!atomic_fetch_add(v10 + 2, 1u))
          {
            id v12 = 0;
            atomic_fetch_add(v10 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          id v12 = 0;
        }
        *((void *)a3 + 15) = v12;
      }
      if (v10 && atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v10 + 16))(v10);
      }
    }
    id v13 = [(CABasicAnimation *)self byValue];
    if (v13)
    {
      v14 = (atomic_uint *)objc_msgSend(v13, "CA_copyRenderValue");
      uint64_t v15 = (atomic_uint *)*((void *)a3 + 16);
      if (v15 != v14)
      {
        if (v15 && atomic_fetch_add(v15 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v15 + 16))(v15);
        }
        if (v14)
        {
          uint64_t v16 = v14;
          if (!atomic_fetch_add(v14 + 2, 1u))
          {
            uint64_t v16 = 0;
            atomic_fetch_add(v14 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          uint64_t v16 = 0;
        }
        *((void *)a3 + 16) = v16;
      }
      if (v14 && atomic_fetch_add(v14 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v14 + 16))(v14);
      }
    }
    if ([(CABasicAnimation *)self roundsToInteger]) {
      *((_DWORD *)a3 + 3) |= 0x1000000u;
    }
    [(CABasicAnimation *)self startAngle];
    if (v17 != 0.0) {
      *((double *)a3 + 17) = v17;
    }
    [(CABasicAnimation *)self endAngle];
    if (v18 != 0.0) {
      *((double *)a3 + 18) = v18;
    }
  }
  return v6;
}

- (id)fromValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 243, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (id)toValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 561, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (id)byValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 78, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (double)endAngle
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 214, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)roundsToInteger
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 484, (const CGAffineTransform *)6, (CA::Mat4Impl *)&v3);
  return v3;
}

- (double)startAngle
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 535, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setToValue:(id)toValue
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = toValue;
  CAAnimation_setter((uint64_t)self, (const void *)0x231, 2, (unsigned __int8 *)v3);
}

- (void)setEndAngle:(double)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  float v4 = v3;
  CAAnimation_setter((uint64_t)self, (const void *)0xD6, 17, (unsigned __int8 *)&v4);
}

- (void)setStartAngle:(double)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  float v4 = v3;
  CAAnimation_setter((uint64_t)self, (const void *)0x217, 17, (unsigned __int8 *)&v4);
}

- (void)setRoundsToInteger:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1E4, 6, (unsigned __int8 *)&v3);
}

@end