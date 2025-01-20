@interface CAShapeLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)_hasRenderLayerSubclass;
+ (id)defaultValueForKey:(id)a3;
- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3;
- (CAShapeLayerFillRule)fillRule;
- (CAShapeLayerLineCap)lineCap;
- (CAShapeLayerLineJoin)lineJoin;
- (CGColorRef)fillColor;
- (CGColorRef)strokeColor;
- (CGFloat)lineDashPhase;
- (CGFloat)lineWidth;
- (CGFloat)miterLimit;
- (CGFloat)strokeEnd;
- (CGFloat)strokeStart;
- (CGPathRef)path;
- (NSArray)lineDashPattern;
- (id)implicitAnimationForKeyPath:(id)a3;
- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3;
- (void)_colorSpaceDidChange;
- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5;
- (void)_renderForegroundInContext:(CGContext *)a3;
- (void)didChangeValueForKey:(id)a3;
- (void)setFillColor:(CGColorRef)fillColor;
- (void)setFillRule:(CAShapeLayerFillRule)fillRule;
- (void)setLineCap:(CAShapeLayerLineCap)lineCap;
- (void)setLineDashPattern:(NSArray *)lineDashPattern;
- (void)setLineDashPhase:(CGFloat)lineDashPhase;
- (void)setLineJoin:(CAShapeLayerLineJoin)lineJoin;
- (void)setLineWidth:(CGFloat)lineWidth;
- (void)setMiterLimit:(CGFloat)miterLimit;
- (void)setPath:(CGPathRef)path;
- (void)setStrokeColor:(CGColorRef)strokeColor;
- (void)setStrokeEnd:(CGFloat)strokeEnd;
- (void)setStrokeStart:(CGFloat)strokeStart;
@end

@implementation CAShapeLayer

- (void)didChangeValueForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(12, (uint64_t)&-[CAShapeLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAShapeLayer;
  [(CAShapeLayer *)&v8 didChangeValueForKey:a3];
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 356)
  {
    if (v5 <= 391)
    {
      if (v5 == 357) {
        return @"miter";
      }
      if (v5 != 358) {
        goto LABEL_20;
      }
      goto LABEL_12;
    }
    if (v5 == 392)
    {
      v7 = NSNumber;
      uint64_t v8 = 10;
      goto LABEL_17;
    }
    if (v5 == 543)
    {
LABEL_12:
      v7 = NSNumber;
      uint64_t v8 = 1;
LABEL_17:
      return (id)[v7 numberWithInt:v8];
    }
LABEL_20:
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CAShapeLayer;
    return objc_msgSendSuper2(&v10, sel_defaultValueForKey_, a3);
  }
  if (v5 != 222)
  {
    if (v5 == 224) {
      return @"non-zero";
    }
    if (v5 == 354) {
      return @"butt";
    }
    goto LABEL_20;
  }
  id result = (id)+[CAShapeLayer defaultValueForKey:]::black;
  if (!+[CAShapeLayer defaultValueForKey:]::black)
  {
    uint64_t v9 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    id result = CGColorCreate(v9, +[CAShapeLayer defaultValueForKey:]::values);
    +[CAShapeLayer defaultValueForKey:]::black = (uint64_t)result;
  }
  return result;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAShapeLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CAShapeLayer;
  id result = -[CALayer implicitAnimationForKeyPath:](&v8, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    [a3 rangeOfString:@"."];
    if (!v6
      && ((unsigned int v7 = CAInternAtom((const __CFString *)a3, 0), v7 - 356 <= 0x24)
       && ((1 << (v7 - 100)) & 0x1000000005) != 0
       || v7 - 542 < 3
       || v7 == 222))
    {
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v7);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setFillColor:(CGColorRef)fillColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = fillColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xDE, (const CGAffineTransform *)2, v3);
}

- (void)setPath:(CGPathRef)path
{
  v6[1] = *(double *)MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    int v5 = (const CGPath *)MEMORY[0x1853223C0](path);
    *(void *)&v6[0] = v5;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1A7, (const CGAffineTransform *)2, v6);
    CGPathRelease(v5);
  }
  else
  {
    *(void *)&v6[0] = path;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1A7, (const CGAffineTransform *)2, v6);
  }
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)CAShapeLayer;
  id v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v57, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(void *)&a4);
  if (v8)
  {
    if (*((unsigned char *)a5 + 2))
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      objc_super v10 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
      if (v10)
      {
        uint64_t v11 = v10;
        *((_DWORD *)v10 + 2) = 1;
        *((_DWORD *)v10 + 3) = 46;
        ++dword_1EB2ADE80;
        *(void *)objc_super v10 = &unk_1ED02CCD8;
        *((_OWORD *)v10 + 1) = 0u;
        *((_OWORD *)v10 + 2) = 0u;
        *((_OWORD *)v10 + 3) = 0u;
        *((_OWORD *)v10 + 4) = 0u;
        __asm { FMOV            V0.2D, #1.0 }
        *((_OWORD *)v10 + 5) = _Q0;
        *((void *)v10 + 13) = 0;
        *((void *)v10 + 14) = 0;
        *((void *)v10 + 12) = 0x4024000000000000;
        *((_DWORD *)v10 + 30) = v10[123] << 24;
        *((void *)v10 + 16) = 0;
        *((void *)v10 + 17) = 0;
        *((void *)v10 + 18) = 0x3FF0000000000000;
        v17 = [(CAShapeLayer *)self path];
        if (v17)
        {
          v19 = (CA::Render::Path *)CA::Render::Path::new_path(v17, v18);
          if (v19)
          {
            v20 = (atomic_uint *)v19;
            CA::Render::ShapeLayer::set_path((CA::Render::ShapeLayer *)v11, v19);
            if (atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
            }
          }
        }
        v21 = (CGColor *)CA::Context::current_colorspace((CA::Context *)a3, v18);
        v22 = [(CAShapeLayer *)self fillColor];
        if (v22)
        {
          v56 = 0;
          float32x4_t v58 = 0uLL;
          CA::Render::convert_cgcolor_to_float(v22, v21, (CGColorSpace *)&v58, (float *)&v56, v23);
          if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(v58))))))*(float32x4_t *)(v11 + 24) = v58; {
          v24 = v56;
          }
          if (v56)
          {
            v25 = (atomic_uint *)*((void *)v11 + 5);
            if (v25 != v56)
            {
              if (v25 && atomic_fetch_add(v25 + 2, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v25 + 16))(v25);
              }
              v26 = v24 + 2;
              if (!atomic_fetch_add(v24 + 2, 1u))
              {
                v24 = 0;
                atomic_fetch_add(v26, 0xFFFFFFFF);
              }
              *((void *)v11 + 5) = v24;
              v24 = v56;
            }
            if (atomic_fetch_add(v24 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v24 + 16))(v24);
            }
          }
        }
        v27 = [(CAShapeLayer *)self fillRule];
        if (v27 && v27 != @"non-zero") {
          v11[120] = [(__CFString *)v27 isEqualToString:@"even-odd"];
        }
        v28 = [(CAShapeLayer *)self strokeColor];
        if (v28)
        {
          v56 = 0;
          float32x4_t v58 = 0uLL;
          CA::Render::convert_cgcolor_to_float(v28, v21, (CGColorSpace *)&v58, (float *)&v56, v29);
          if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(v58))))))*((float32x4_t *)v11 + 3) = v58; {
          v30 = v56;
          }
          if (v56)
          {
            v31 = (atomic_uint *)*((void *)v11 + 8);
            if (v31 != v56)
            {
              if (v31 && atomic_fetch_add(v31 + 2, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v31 + 16))(v31);
              }
              v32 = v30 + 2;
              if (!atomic_fetch_add(v30 + 2, 1u))
              {
                v30 = 0;
                atomic_fetch_add(v32, 0xFFFFFFFF);
              }
              *((void *)v11 + 8) = v30;
              v30 = v56;
            }
            if (atomic_fetch_add(v30 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v30 + 16))(v30);
            }
          }
        }
        [(CAShapeLayer *)self strokeStart];
        *((void *)v11 + 9) = v33;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        [(CAShapeLayer *)self strokeEnd];
        *((void *)v11 + 10) = v34;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        [(CAShapeLayer *)self lineWidth];
        *((void *)v11 + 11) = v35;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        [(CAShapeLayer *)self miterLimit];
        *((void *)v11 + 12) = v36;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        v37 = [(CAShapeLayer *)self lineJoin];
        if (v37)
        {
          v38 = v37;
          if (v37 != @"miter")
          {
            if ([(__CFString *)v37 isEqualToString:@"round"])
            {
              int v39 = 256;
            }
            else if ([(__CFString *)v38 isEqualToString:@"bevel"])
            {
              int v39 = 512;
            }
            else
            {
              int v39 = 0;
            }
            *((_DWORD *)v11 + 30) = *((_DWORD *)v11 + 30) & 0xFFFF00FF | v39;
            CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
          }
        }
        v40 = [(CAShapeLayer *)self lineCap];
        if (v40)
        {
          v41 = v40;
          if (v40 != @"butt")
          {
            if ([(__CFString *)v40 isEqualToString:@"round"])
            {
              int v42 = 0x10000;
            }
            else if ([(__CFString *)v41 isEqualToString:@"square"])
            {
              int v42 = 0x20000;
            }
            else
            {
              int v42 = 0;
            }
            *((_DWORD *)v11 + 30) = *((_DWORD *)v11 + 30) & 0xFF00FFFF | v42;
            CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
          }
        }
        [(CAShapeLayer *)self lineDashPhase];
        *((void *)v11 + 13) = v43;
        CA::Render::ShapeLayer::invalidate_stroke_path((CA::Render::ShapeLayer *)v11);
        v44 = [(CAShapeLayer *)self lineDashPattern];
        if (v44)
        {
          v45 = v44;
          uint64_t v46 = [(NSArray *)v44 count];
          if (v46)
          {
            v47 = (CA::Render::Vector *)v46;
            size_t v48 = 8 * v46;
            if ((unint64_t)(8 * v46) > 0x1000)
            {
              v49 = (char *)malloc_type_malloc(8 * v46, 0x9AB4338EuLL);
            }
            else
            {
              MEMORY[0x1F4188790](v46);
              v49 = (char *)&v55 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
              bzero(v49, v48);
            }
            for (i = 0; i != v47; i = (CA::Render::Vector *)((char *)i + 1))
            {
              objc_msgSend(-[NSArray objectAtIndex:](v45, "objectAtIndex:", i), "doubleValue");
              *(void *)&v49[8 * (void)i] = v52;
            }
            v53 = CA::Render::Vector::new_vector(v47, v49, v51);
            CA::Render::ShapeLayer::set_dash_pattern((CA::Render::ShapeLayer *)v11, (CA::Render::Vector *)v53);
            if (v53 && atomic_fetch_add(v53 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v53 + 16))(v53);
            }
            if (v48 > 0x1000) {
              free(v49);
            }
          }
        }
        CA::Render::Layer::set_subclass((uint64_t)v8, (CA::Render::LayerSubclass *)v11);
        if (atomic_fetch_add((atomic_uint *volatile)v11 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(char *))(*(void *)v11 + 16))(v11);
        }
      }
    }
  }
  return v8;
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)CAShapeLayer;
  int v5 = (CA::Transaction *)-[CALayer _renderForegroundInContext:](&v40, sel__renderForegroundInContext_);
  uint64_t v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    uint64_t v6 = (CA::Transaction *)CA::Transaction::create(v5);
  }
  int v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  id v8 = [(CAShapeLayer *)self path];
  if (v8)
  {
    uint64_t v9 = [(CAShapeLayer *)self fillColor];
    objc_super v10 = v9;
    if (v9 && CGColorGetAlpha(v9) > 0.0)
    {
      CGPathDrawingMode v11 = [(NSString *)[(CAShapeLayer *)self fillRule] isEqualToString:@"even-odd"];
      CGContextSetFillColorWithColor(a3, v10);
      CGContextAddPath(a3, v8);
      CGContextDrawPath(a3, v11);
    }
    v12 = [(CAShapeLayer *)self strokeColor];
    v13 = v12;
    if (v12)
    {
      if (CGColorGetAlpha(v12) > 0.0)
      {
        if ([(NSString *)[(CAShapeLayer *)self lineCap] isEqualToString:@"round"])
        {
          CGLineCap v14 = kCGLineCapRound;
        }
        else if ([(NSString *)[(CAShapeLayer *)self lineCap] isEqualToString:@"square"])
        {
          CGLineCap v14 = kCGLineCapSquare;
        }
        else
        {
          CGLineCap v14 = kCGLineCapButt;
        }
        if ([(NSString *)[(CAShapeLayer *)self lineJoin] isEqualToString:@"round"])
        {
          CGLineJoin v15 = kCGLineJoinRound;
        }
        else if ([(NSString *)[(CAShapeLayer *)self lineJoin] isEqualToString:@"bevel"])
        {
          CGLineJoin v15 = kCGLineJoinBevel;
        }
        else
        {
          CGLineJoin v15 = kCGLineJoinMiter;
        }
        [(CAShapeLayer *)self lineWidth];
        if (v16 < 0.0) {
          double v16 = *MEMORY[0x1E4F1DD98];
        }
        CGContextSetLineWidth(a3, v16);
        CGContextSetLineCap(a3, v14);
        CGContextSetLineJoin(a3, v15);
        [(CAShapeLayer *)self miterLimit];
        CGContextSetMiterLimit(a3, v17);
        v18 = [(CAShapeLayer *)self lineDashPattern];
        v19 = v18;
        if (v18)
        {
          size_t v20 = [(NSArray *)v18 count];
          MEMORY[0x1F4188790](v20);
          v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v22, v21);
          if (v20)
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              objc_msgSend(-[NSArray objectAtIndex:](v19, "objectAtIndex:", i), "doubleValue");
              *(void *)&v22[8 * i] = v24;
            }
          }
          [(CAShapeLayer *)self lineDashPhase];
          CGContextSetLineDash(a3, v25, (const CGFloat *)v22, v20);
        }
        CGContextSetStrokeColorWithColor(a3, v13);
        [(CAShapeLayer *)self strokeStart];
        double v27 = v26;
        [(CAShapeLayer *)self strokeEnd];
        double v29 = fmax(v27, 0.0);
        double v31 = fmin(v30, 1.0);
        if (v29 == 0.0 && v31 == 1.0)
        {
          v32 = (const CGPath *)MEMORY[0x1853223C0](v8);
        }
        else
        {
          if (v29 >= v31) {
            goto LABEL_39;
          }
          uint64_t v34 = (CA::Render::Path *)CA::Render::Path::new_path(v8, v28);
          if (!v34) {
            goto LABEL_39;
          }
          uint64_t v35 = (atomic_uint *)v34;
          uint64_t v36 = CA::Render::Path::copy_subpath(v34, v29, v31);
          if (v36)
          {
            v37 = (atomic_uint *)v36;
            v38 = (const CGPath *)CA::Render::Path::cg_path((CA::Render::Path *)v36);
            v32 = CGPathRetain(v38);
            if (atomic_fetch_add(v37 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v37 + 16))(v37);
            }
          }
          else
          {
            v32 = 0;
          }
          if (atomic_fetch_add(v35 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v35 + 16))(v35);
          }
        }
        if (v32)
        {
          CA::Transaction::unlock(v6);
          CGContextAddPath(a3, v32);
          CGContextDrawPath(a3, kCGPathStroke);
          CGPathRelease(v32);
          int v33 = *((_DWORD *)v6 + 25);
          *((_DWORD *)v6 + 25) = v33 + 1;
          if (!v33) {
            os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
          }
        }
      }
    }
  }
LABEL_39:
  CA::Transaction::unlock(v6);
}

- (CGColorRef)fillColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDEu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CGPathRef)path
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1A7u, (const CGAffineTransform *)2, v3);
  return (CGPathRef)v3[0];
}

- (CGColorRef)strokeColor
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x21Eu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CAShapeLayerFillRule)fillRule
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE0u, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerFillRule)v3[0];
}

- (CGFloat)lineWidth
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x166u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)miterLimit
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x188u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)lineDashPhase
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x164u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)strokeEnd
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x21Fu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)strokeStart
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x220u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CAShapeLayerLineJoin)lineJoin
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x165u, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerLineJoin)v3[0];
}

- (NSArray)lineDashPattern
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x163u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CAShapeLayerLineCap)lineCap
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x162u, (const CGAffineTransform *)3, v3);
  return (CAShapeLayerLineCap)v3[0];
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(12, (uint64_t)&defines_property::atoms, a3) != -1) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAShapeLayer;
  return [(CALayer *)&v6 _renderLayerDefinesProperty:v3];
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CAAtomIndexInArray(12, (uint64_t)&defines_property::atoms, a3) != -1) {
    return 32;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAShapeLayer;
  return [(CALayer *)&v6 _renderLayerPropertyAnimationFlags:v3];
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (void)setStrokeColor:(CGColorRef)strokeColor
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = strokeColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x21E, (const CGAffineTransform *)2, v3);
}

- (void)setFillRule:(CAShapeLayerFillRule)fillRule
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = fillRule;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE0, (const CGAffineTransform *)3, v3);
}

- (void)setLineWidth:(CGFloat)lineWidth
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = lineWidth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x166, (const CGAffineTransform *)0x12, v3);
}

- (void)setStrokeEnd:(CGFloat)strokeEnd
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = strokeEnd;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x21F, (const CGAffineTransform *)0x12, v3);
}

- (void)setStrokeStart:(CGFloat)strokeStart
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = strokeStart;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x220, (const CGAffineTransform *)0x12, v3);
}

- (void)setLineDashPattern:(NSArray *)lineDashPattern
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = lineDashPattern;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x163, (const CGAffineTransform *)3, v3);
}

- (void)setLineCap:(CAShapeLayerLineCap)lineCap
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = lineCap;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x162, (const CGAffineTransform *)3, v3);
}

- (void)setLineJoin:(CAShapeLayerLineJoin)lineJoin
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = lineJoin;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x165, (const CGAffineTransform *)3, v3);
}

- (void)setLineDashPhase:(CGFloat)lineDashPhase
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = lineDashPhase;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x164, (const CGAffineTransform *)0x12, v3);
}

- (void)setMiterLimit:(CGFloat)miterLimit
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  v3[0] = miterLimit;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x188, (const CGAffineTransform *)0x12, v3);
}

- (void)_colorSpaceDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)CAShapeLayer;
  uint64_t v3 = (CA::Transaction *)[(CALayer *)&v5 _colorSpaceDidChange];
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4) {
    v4 = (CA::Transaction *)CA::Transaction::create(v3);
  }
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

@end