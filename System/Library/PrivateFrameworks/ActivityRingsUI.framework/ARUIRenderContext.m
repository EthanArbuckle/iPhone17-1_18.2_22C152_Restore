@interface ARUIRenderContext
- (ARUIRenderContext)initWithDrawableSize:(ARUIRenderContext *)self;
- (ARUIRenderContext)initWithSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)opaque;
- (BOOL)presentsWithTransaction;
- (__n128)skewAdjustmentMatrix;
- (double)drawableSize;
- (float)drawableDiameter;
- (float)screenScale;
- (id)description;
- (unint64_t)hash;
- (void)setOpaque:(BOOL)a3;
- (void)setPresentsWithTransaction:(BOOL)a3;
@end

@implementation ARUIRenderContext

- (unint64_t)hash
{
  v3 = +[ARUIHashBuilder builder];
  [v3 appendFloat2:*(double *)&self->_drawableSize[4]];
  [v3 appendBool:LOBYTE(self->_screenScale)];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (float)screenScale
{
  return *(float *)self->_drawableSize;
}

- (__n128)skewAdjustmentMatrix
{
  return a1[1];
}

- (float)drawableDiameter
{
  return self->_drawableDiameter;
}

- (BOOL)opaque
{
  return LOBYTE(self->_screenScale);
}

- (BOOL)presentsWithTransaction
{
  return BYTE1(self->_screenScale);
}

- (double)drawableSize
{
  return *(double *)(a1 + 88);
}

- (void)setOpaque:(BOOL)a3
{
  LOBYTE(self->_screenScale) = a3;
}

- (ARUIRenderContext)initWithSize:(CGSize)a3
{
  CGFloat width = a3.width;
  CGFloat height = a3.height;
  unint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  *(float *)&double v5 = v5;
  float v9 = *(float *)&v5;

  v6.f64[0] = width;
  v6.f64[1] = height;
  double v7 = COERCE_DOUBLE(vmul_n_f32(vcvt_f32_f64(v6), v9));

  return [(ARUIRenderContext *)self initWithDrawableSize:v7];
}

- (ARUIRenderContext)initWithDrawableSize:(ARUIRenderContext *)self
{
  uint64_t v14 = v2;
  v15.receiver = self;
  v15.super_class = (Class)ARUIRenderContext;
  v3 = [(ARUIRenderContext *)&v15 init];
  if (v3)
  {
    unint64_t v4 = [MEMORY[0x263F82B60] mainScreen];
    [v4 scale];
    *(float *)&double v5 = v5;
    *(_DWORD *)v3->_drawableSize = LODWORD(v5);

    *(void *)&v3->_drawableSize[4] = v14;
    LOWORD(v3->_screenScale) = 1;
    if (ARUIFloatEqual(*(float *)&v14, *((float *)&v14 + 1)))
    {
      LODWORD(v3->_drawableDiameter) = v14;
      uint64_t v6 = MEMORY[0x263EF89A8];
      long long v7 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
      *(_OWORD *)&v3->_anon_10[4] = *MEMORY[0x263EF89A8];
      *(_OWORD *)&v3->_anon_10[20] = v7;
      long long v8 = *(_OWORD *)(v6 + 48);
      *(_OWORD *)&v3->_anon_10[36] = *(_OWORD *)(v6 + 32);
      *(_OWORD *)&v3->_anon_10[52] = v8;
    }
    else
    {
      if (ARUIFloatGreater(*((float *)&v14 + 1), *(float *)&v14))
      {
        LODWORD(v3->_drawableDiameter) = v14;
        *(double *)&long long v9 = matrix_float4x4_scale_y();
      }
      else
      {
        v3->_drawableDiameter = *((float *)&v14 + 1);
        matrix_float4x4_scale_x();
      }
      *(_OWORD *)&v3->_anon_10[4] = v9;
      *(_OWORD *)&v3->_anon_10[20] = v10;
      *(_OWORD *)&v3->_anon_10[36] = v11;
      *(_OWORD *)&v3->_anon_10[52] = v12;
    }
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    float32x2_t v6 = *(float32x2_t *)&self->_drawableSize[4];
    [v5 drawableSize];
    if (ARUIFloat2Equal(v6, v7))
    {
      int screenScale_low = LOBYTE(self->_screenScale);
      BOOL v9 = screenScale_low == [v5 opaque];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:LOBYTE(self->_screenScale) withName:@"opaque"];
  id v5 = (id)[v3 appendFloat:@"drawableSize.x" withName:COERCE_FLOAT(*(void *)&self->_drawableSize[4])];
  id v6 = (id)[v3 appendFloat:@"drawableSize.y" withName:*(float *)&self->_drawableSize[8]];
  id v7 = (id)[v3 appendFloat:@"screenScale" withName:*(float *)self->_drawableSize];
  id v8 = (id)[v3 appendBool:BYTE1(self->_screenScale) withName:@"presentsWithTransaction"];
  BOOL v9 = [v3 build];

  return v9;
}

- (void)setPresentsWithTransaction:(BOOL)a3
{
  BYTE1(self->_screenScale) = a3;
}

@end