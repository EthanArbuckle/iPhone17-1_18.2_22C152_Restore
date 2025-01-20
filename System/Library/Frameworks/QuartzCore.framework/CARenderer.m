@interface CARenderer
+ (CARenderer)rendererWithEAGLContext:(id)a3 options:(id)a4;
+ (CARenderer)rendererWithMTLTexture:(id)tex options:(NSDictionary *)dict;
- (CAContext)context;
- (CALayer)layer;
- (CARendererDelegate)delegate;
- (CFTimeInterval)nextFrameTime;
- (CGRect)bounds;
- (CGRect)updateBounds;
- (id)_initWithEAGLContext:(id)a3 options:(id)a4;
- (id)_initWithMTLTexture:(id)a3 options:(id)a4;
- (id)_initWithOptions:(id)a3;
- (void)addUpdateRect:(CGRect)r;
- (void)beginFrameAtTime:(CFTimeInterval)t timeStamp:(CVTimeStamp *)ts;
- (void)dealloc;
- (void)endFrame;
- (void)render;
- (void)setBounds:(CGRect)bounds;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDestination:(id)tex;
- (void)setLayer:(CALayer *)layer;
@end

@implementation CARenderer

- (void)beginFrameAtTime:(CFTimeInterval)t timeStamp:(CVTimeStamp *)ts
{
  priv = self->_priv;
  if (priv[10])
  {
    [(CARenderer *)self endFrame];
    priv = self->_priv;
  }
  v6 = (char *)priv + 4 * *((unsigned __int8 *)priv + 112);
  int v9 = *((_DWORD *)v6 + 25);
  v7 = v6 + 100;
  int v8 = v9;
  if (v9)
  {
    *((_DWORD *)priv + 27) = v8;
    _DWORD *v7 = 0;
  }
  operator new();
}

- (void)endFrame
{
  priv = (void **)self->_priv;
  if (priv[10])
  {
    (*(void (**)(void *, BOOL))(*priv[3] + 408))(priv[3], ((_WORD)priv[14] & 0x200) == 0);
    v5 = self->_priv;
    v6 = (CA::Render::Update *)*((void *)v5 + 10);
    if (v6)
    {
      CA::Render::Update::~Update(v6, v4);
      MEMORY[0x185323DC0]();
      v5 = self->_priv;
    }
    *((void *)v5 + 10) = 0;
  }
}

- (void)render
{
  v17[1] = *MEMORY[0x1E4F143B8];
  priv = self->_priv;
  v4 = (CA::Render::Update *)priv[10];
  if (v4)
  {
    uint64_t v5 = *((void *)v4 + 2);
    if (v5)
    {
      if (v5 == 1) {
        return;
      }
    }
    else if (*(_DWORD *)(v5 + 4) == 6)
    {
      return;
    }
    if (BYTE5(ca_debug_options))
    {
      CA::Render::Update::print_trees(v4);
      priv = self->_priv;
    }
    if (priv[4])
    {
      uint64_t v6 = [MEMORY[0x1E4F38D58] currentContext];
      v7 = self->_priv;
      int v8 = (CA::Render::Update *)*((void *)v7 + 2);
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E4F38D58], "setCurrentContext:");
        v7 = self->_priv;
      }
      if ((*((_WORD *)v7 + 56) & 0x100) != 0)
      {
        uint64_t v9 = *((void *)v7 + 3);
        v17[0] = 0;
        (*(void (**)(uint64_t, void *, void *))(*(void *)v9 + 912))(v9, &CA::Shape::_infinite_shape, v17);
        v7 = self->_priv;
      }
      CA::OGL::render(*((CA::OGL **)v7 + 4), *((CA::OGL::Renderer **)v7 + 10), v8);
      v10 = self->_priv;
      v11 = (char *)v10 + 4 * *((unsigned __int8 *)v10 + 112);
      int v13 = *((_DWORD *)v11 + 25);
      v12 = v11 + 100;
      if (!v13)
      {
        _DWORD *v12 = *(_DWORD *)(v10[10] + 248);
        *((_WORD *)v10 + 56) = v10[14] & 0xFF01 ^ 1;
      }
      uint64_t v14 = mach_absolute_time();
      double v15 = CATimeWithHostTime(v14);
      CA::Render::collect(0, v15);
      v16 = (CA::Render *)CA::OGL::Renderer::collect(*((CA::OGL::Renderer **)self->_priv + 4), *((const CA::Render::Update **)self->_priv + 10), v15);
      if (*((void *)self->_priv + 2)) {
        v16 = (CA::Render *)[MEMORY[0x1E4F38D58] setCurrentContext:v6];
      }
      if (BYTE6(ca_debug_options)) {
        CA::Render::show_statistics(v16);
      }
    }
  }
}

- (void)setLayer:(CALayer *)layer
{
}

- (void)setBounds:(CGRect)bounds
{
  *(CGRect *)((char *)self->_priv + 40) = bounds;
}

- (void)setDestination:(id)tex
{
}

- (CFTimeInterval)nextFrameTime
{
  uint64_t v2 = *((void *)self->_priv + 10);
  if (v2) {
    return *(double *)(v2 + 80);
  }
  else {
    return INFINITY;
  }
}

- (void)addUpdateRect:(CGRect)r
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *((void *)self->_priv + 10);
  if (v4)
  {
    v5.i64[0] = *(void *)&r.origin.x;
    v5.i64[1] = *(void *)&r.origin.y;
    v3.f64[0] = 0.0;
    v6.i64[0] = *(void *)&r.size.width;
    v6.i64[1] = *(void *)&r.size.height;
    int8x16_t v7 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v3, (float64x2_t)r.size).i64[0], 0);
    v8.i64[1] = *(void *)&r.size.height;
    *(double *)v8.i64 = -r.size.width;
    float64x2_t v9 = (float64x2_t)vbslq_s8(v7, v8, v6);
    CGFloat y = r.origin.y;
    r.size.width = r.size.width + r.origin.x;
    float64x2_t v11 = (float64x2_t)vbslq_s8(v7, (int8x16_t)r.size, v5);
    if (r.size.height < 0.0)
    {
      v11.f64[1] = r.size.height + r.origin.y;
      v9.f64[1] = -r.size.height;
    }
    int8x16_t v12 = (int8x16_t)vceqzq_f64(v9);
    if ((vorrq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)v12, 1), v12).u64[0] & 0x8000000000000000) != 0
      || (int8x16_t v13 = vorrq_s8((int8x16_t)vcltzq_f64(v9), (int8x16_t)vcgezq_f64(v9)),
          (vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v13), 1), v13).u64[0] & 0x8000000000000000) != 0))
    {
      int32x4_t v16 = 0uLL;
    }
    else
    {
      int32x4_t v14 = (int32x4_t)vcvtmq_s64_f64(vmaxnmq_f64(v11, (float64x2_t)vdupq_n_s64(0xC1BFFFFFFF000000)));
      int32x4_t v16 = vuzp1q_s32(v14, (int32x4_t)vsubq_s64(vcvtpq_s64_f64(vminnmq_f64(vaddq_f64(v11, v9), (float64x2_t)vdupq_n_s64(0x41C0000000000000uLL))), (int64x2_t)v14));
    }
    long long v18 = 0u;
    long long v19 = 0u;
    *(_OWORD *)v17 = 0u;
    CA::Shape::operator=((uint64_t)v17, &v16);
    CA::shape_union((CA::Shape **)(v4 + 16), v17, v15);
  }
}

- (CGRect)updateBounds
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)self->_priv + 10);
  if (!v2) {
    goto LABEL_4;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  if (v3)
  {
    if (v3 == 1) {
      goto LABEL_4;
    }
  }
  else if (*(_DWORD *)(v3 + 4) == 6)
  {
LABEL_4:
    int8x16_t v4 = *(int8x16_t *)MEMORY[0x1E4F1DB20];
    double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    goto LABEL_14;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  CA::Shape::get_bounds(v3, (int *)&v12);
  if ((int)v13 <= SHIDWORD(v13)) {
    int v9 = HIDWORD(v13);
  }
  else {
    int v9 = v13;
  }
  v7.i32[0] = 1073741822;
  v8.i32[0] = v9;
  v10.i64[0] = (int)v12;
  v10.i64[1] = SHIDWORD(v12);
  int8x16_t v4 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v8, v7), 0), (int8x16_t)vdupq_n_s64(0xFFDFFFFFFFFFFFFFLL), (int8x16_t)vcvtq_f64_s64(v10));
  double v6 = (double)SHIDWORD(v13);
  if (v9 <= 1073741822) {
    double v5 = (double)(int)v13;
  }
  else {
    double v5 = 1.79769313e308;
  }
  if (v9 > 1073741822) {
    double v6 = 1.79769313e308;
  }
LABEL_14:
  double v11 = *(double *)&v4.i64[1];
  result.origin.x = *(double *)v4.i64;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v11;
  return result;
}

- (CGRect)bounds
{
  priv = (double *)self->_priv;
  double v3 = priv[5];
  double v4 = priv[6];
  double v5 = priv[7];
  double v6 = priv[8];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.x = v3;
  return result;
}

- (CALayer)layer
{
  return (CALayer *)[*(id *)self->_priv layer];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  priv = (CGColorSpaceRef *)self->_priv;
  if (priv)
  {
    remove_observer(self);
    CGColorSpaceRelease(priv[9]);
    if (priv[10]) {
      [(CARenderer *)self endFrame];
    }
    CGColorSpaceRef v4 = priv[4];
    if (v4)
    {
      CA::OGL::Renderer::~Renderer(priv[4]);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      malloc_zone_free(malloc_zone, v4);
    }
    CGColorSpaceRef v6 = priv[3];
    if (v6)
    {
      (*(void (**)(CGColorSpaceRef, void, void, void))(*(void *)v6 + 16))(v6, 0, 0, 0);
      CGColorSpaceRef v7 = priv[3];
      (*(void (**)(CGColorSpaceRef, uint64_t))(*(void *)v7 + 224))(v7, 1);
      (*(void (**)(CGColorSpaceRef))(*(void *)v7 + 8))(v7);
    }
    if (*priv) {
      CFRelease(*priv);
    }
    CGColorSpaceRef v8 = priv[2];
    if (v8) {
      CFRelease(v8);
    }
    free(priv);
    self->_priv = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)CARenderer;
  [(CARenderer *)&v9 dealloc];
}

- (id)_initWithEAGLContext:(id)a3 options:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    return 0;
  }
  double v5 = [(CARenderer *)self _initWithOptions:a4];
  if (!v5) {
    return v5;
  }
  int v6 = [a3 API];
  if (v6 != 3)
  {
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      v17 = x_log_category_api;
      if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = v6;
        _os_log_impl(&dword_184668000, v17, OS_LOG_TYPE_FAULT, "CoreAnimation: GLES%d not supported by CARenderer on this device", buf, 8u);
      }
    }

    return 0;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  CGColorSpaceRef v8 = (id *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x8A8uLL, 0x743898A5uLL);
  if (v8) {
    CGColorSpaceRef v8 = CA::OGL::GLESContext::GLESContext(v8, a3);
  }
  *(void *)(v5[1] + 24) = v8;
  objc_super v9 = (malloc_zone_t *)get_malloc_zone();
  uint64_t v10 = malloc_type_zone_malloc(v9, 0x68uLL, 0x8BB15036uLL);
  double v11 = v10;
  if (v10)
  {
    uint64_t v12 = *(void *)(v5[1] + 24);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = v12;
    v10[6] = malloc_type_malloc(0x40000uLL, 0xA44586FDuLL);
    v11[7] = 0;
    *((_DWORD *)v11 + 24) = 1;
    *((_WORD *)v11 + 50) = 0;
  }
  *(void *)(v5[1] + 32) = v11;
  uint64_t v13 = v5[1];
  uint64_t v14 = *(CA::OGL::Context **)(v13 + 24);
  int v15 = *(_DWORD *)(v13 + 88);
  int v16 = *((_DWORD *)v14 + 56);
  *((_DWORD *)v14 + 56) = v15;
  *((_DWORD *)v14 + 108) = global_feature_flags | v15;
  if (((v16 ^ v15) & 0x2000200) != 0)
  {
    CA::OGL::Context::update_color_program_cache((uint64_t)v14);
    uint64_t v13 = v5[1];
    uint64_t v14 = *(CA::OGL::Context **)(v13 + 24);
  }
  CA::OGL::Context::set_colorspace(v14, *(CGColorSpace **)(v13 + 72));
  *(_WORD *)(*(void *)(v5[1] + 24) + 832) |= 2u;
  *(_WORD *)(*(void *)(v5[1] + 24) + 832) |= 4u;
  *(void *)(v5[1] + 16) = a3;
  CFRetain(a3);
  return v5;
}

- (id)_initWithMTLTexture:(id)a3 options:(id)a4
{
  if (!a3)
  {

    return 0;
  }
  int v6 = [(CARenderer *)self _initWithOptions:a4];
  if (!v6) {
    return v6;
  }
  CGColorSpaceRef v7 = (void *)[a3 device];
  CGColorSpaceRef v8 = (void *)[a4 objectForKey:@"kCARendererMetalCommandQueue"];
  uint64_t v9 = v6[1];
  if (v8)
  {
    *(_WORD *)(v9 + 112) |= 0x200u;
    uint64_t v9 = v6[1];
  }
  *(void *)(v6[1] + 24) = CA::OGL::new_metal_context(v7, v8, 0, *(_DWORD *)(v9 + 88), 0, @"com.apple.coreanimation.CARenderer");
  uint64_t v10 = *(void *)(v6[1] + 24);
  if (!v10)
  {

    return 0;
  }
  (*(void (**)(uint64_t, void, id, void))(*(void *)v10 + 16))(v10, 0, a3, 0);
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  uint64_t v12 = malloc_type_zone_malloc(malloc_zone, 0x68uLL, 0x8BB15036uLL);
  uint64_t v13 = v12;
  if (v12)
  {
    uint64_t v14 = *(void *)(v6[1] + 24);
    v12[1] = 0;
    v12[2] = 0;
    void *v12 = v14;
    v12[6] = malloc_type_malloc(0x40000uLL, 0xA44586FDuLL);
    v13[7] = 0;
    *((_DWORD *)v13 + 24) = 1;
    *((_WORD *)v13 + 50) = 0;
  }
  *(void *)(v6[1] + 32) = v13;
  CA::OGL::Context::set_colorspace(*(CA::OGL::Context **)(v6[1] + 24), *(CGColorSpace **)(v6[1] + 72));
  *(_WORD *)(*(void *)(v6[1] + 24) + 832) |= 2u;
  *(_WORD *)(*(void *)(v6[1] + 24) + 832) |= 4u;
  return v6;
}

- (id)_initWithOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CARenderer;
  CGColorSpaceRef v4 = [(CARenderer *)&v14 init];
  if (v4)
  {
    double v5 = malloc_type_malloc(0x1000uLL, 0xF7042BBEuLL);
    v4->_priv = v5;
    if (v5)
    {
      v5[6] = 0u;
      v5[7] = 0u;
      v5[4] = 0u;
      v5[5] = 0u;
      v5[2] = 0u;
      v5[3] = 0u;
      _OWORD *v5 = 0u;
      v5[1] = 0u;
      *((void *)v4->_priv + 1) = 0;
      CFTypeRef v6 = CFRetain(+[CAContext localContext]);
      priv = (char *)v4->_priv;
      *(void *)priv = v6;
      long long v8 = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(priv + 56) = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(priv + 40) = v8;
      uint64_t v9 = v4->_priv;
      v9[15] = 3968;
      *((_DWORD *)v9 + 27) = 1;
      if (a3)
      {
        *((void *)v4->_priv + 9) = [a3 objectForKey:@"kCARendererColorSpace"];
        uint64_t v9 = v4->_priv;
      }
      uint64_t v10 = (void *)*v9;
      if (v9[9]) {
        objc_msgSend(v10, "setColorSpace:");
      }
      else {
        *((void *)v4->_priv + 9) = [v10 colorSpace];
      }
      CGColorSpaceRetain(*((CGColorSpaceRef *)v4->_priv + 9));
      double v11 = (void *)[a3 objectForKey:@"kCARendererFlags"];
      if (v11) {
        *((_DWORD *)v4->_priv + 22) = [v11 unsignedIntValue];
      }
      if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"kCARendererClearsDestination"), "BOOLValue"))__int16 v12 = 256; {
      else
      }
        __int16 v12 = 0;
      *((_WORD *)v4->_priv + 56) = *((_WORD *)v4->_priv + 56) & 0xFEFF | v12;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

+ (CARenderer)rendererWithMTLTexture:(id)tex options:(NSDictionary *)dict
{
  CGColorSpaceRef v4 = (void *)[objc_alloc((Class)a1) _initWithMTLTexture:tex options:dict];

  return (CARenderer *)v4;
}

- (void)setDelegate:(id)a3
{
  if (*((id *)self->_priv + 1) != a3)
  {
    remove_observer(self);
    *((void *)self->_priv + 1) = a3;
    add_observer(self);
  }
}

- (CARendererDelegate)delegate
{
  return (CARendererDelegate *)*((void *)self->_priv + 1);
}

- (void)setContext:(id)a3
{
  priv = (id *)self->_priv;
  if (*priv != a3)
  {
    if (*priv)
    {
      remove_observer(self);
      CFRelease(*(CFTypeRef *)self->_priv);
      priv = (id *)self->_priv;
    }
    id *priv = a3;
    if (a3)
    {
      CFRetain(a3);
      add_observer(self);
      CFTypeRef v6 = (void **)self->_priv;
      if (v6[9])
      {
        CGColorSpaceRef v7 = *v6;
        objc_msgSend(v7, "setColorSpace:");
      }
    }
  }
}

- (CAContext)context
{
  return *(CAContext **)self->_priv;
}

+ (CARenderer)rendererWithEAGLContext:(id)a3 options:(id)a4
{
  CGColorSpaceRef v4 = (void *)[objc_alloc((Class)a1) _initWithEAGLContext:a3 options:a4];

  return (CARenderer *)v4;
}

@end