@interface CAMatchMoveAnimation
+ (id)defaultValueForKey:(id)a3;
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)appliesRotation;
- (BOOL)appliesScale;
- (BOOL)appliesX;
- (BOOL)appliesY;
- (BOOL)isAdditive;
- (BOOL)targetsSuperlayer;
- (BOOL)usesNormalizedCoordinates;
- (CALayer)sourceLayer;
- (NSArray)sourcePoints;
- (NSString)keyPath;
- (unint64_t)sourceLayerRenderId;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (unsigned)sourceContextId;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5;
- (void)applyForTime:(void *)a1 presentationObject:(float64x2_t *)this modelObject:(double *)a3;
- (void)setAdditive:(BOOL)a3;
- (void)setAppliesRotation:(BOOL)a3;
- (void)setAppliesScale:(BOOL)a3;
- (void)setAppliesX:(BOOL)a3;
- (void)setAppliesY:(BOOL)a3;
- (void)setKeyPath:(id)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayer:(id)a3;
- (void)setSourceLayerRenderId:(unint64_t)a3;
- (void)setSourcePoints:(id)a3;
- (void)setTargetsSuperlayer:(BOOL)a3;
- (void)setUsesNormalizedCoordinates:(BOOL)a3;
@end

@implementation CAMatchMoveAnimation

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  v4 = [(CAMatchMoveAnimation *)self keyPath];

  return animation_property_flags(v4, (CALayer *)a3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x90uLL, 0x743898A5uLL);
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
    *((void *)v6 + 13) = 0;
    *((void *)v6 + 16) = 0;
    *((void *)v6 + 17) = 0;
    *((void *)v6 + 15) = 0;
    *((_DWORD *)v6 + 3) = 31;
    ++dword_1EB2ADE44;
    *(void *)v6 = &unk_1ED02EB00;
    if (![(CAMatchMoveAnimation *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CAMatchMoveAnimation *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)CAMatchMoveAnimation;
  BOOL v7 = -[CAAnimation _setCARenderAnimation:layer:](&v33, sel__setCARenderAnimation_layer_);
  if (!v7) {
    return v7;
  }
  CFStringRef v8 = [(CAMatchMoveAnimation *)self keyPath];
  if (!v8) {
    goto LABEL_11;
  }
  unint64_t v32 = 0;
  CA::Render::key_path_set((CA::Render *)&v32, v8, v9);
  unint64_t v11 = v32;
  if (!v32)
  {
LABEL_7:
    unint64_t v12 = 0;
    goto LABEL_9;
  }
  if ((v32 & 1) == 0)
  {
    if (*(_DWORD *)v32)
    {
      unint64_t v12 = *(unsigned int *)(v32 + 4);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  unint64_t v12 = v32 >> 1;
LABEL_9:
  CA::Render::key_path_free(*((CA::Render **)a3 + 15), v10);
  *((void *)a3 + 15) = v11;
  if (a4)
  {
    int v13 = [a4 _renderLayerPropertyAnimationFlags:v12];
    goto LABEL_12;
  }
LABEL_11:
  int v13 = 0;
LABEL_12:
  if ([(CAMatchMoveAnimation *)self targetsSuperlayer]) {
    int v14 = 1049600;
  }
  else {
    int v14 = 1024;
  }
  *((void *)a3 + 12) = CA::Render::Object::render_id(*((CA::Render::Object **)a4 + 2));
  v15 = [(CAMatchMoveAnimation *)self sourceLayer];
  if (v15)
  {
    v16 = v15;
    *((void *)a3 + 13) = CA::Render::Object::render_id((CA::Render::Object *)v15->_attr.layer);
    unsigned int v17 = objc_msgSend(-[CALayer context](v16, "context"), "contextId");
LABEL_19:
    *((_DWORD *)a3 + 28) = v17;
    goto LABEL_20;
  }
  unint64_t v18 = [(CAMatchMoveAnimation *)self sourceLayerRenderId];
  if (v18)
  {
    *((void *)a3 + 13) = v18;
    unsigned int v17 = [(CAMatchMoveAnimation *)self sourceContextId];
    goto LABEL_19;
  }
LABEL_20:
  int v19 = v14 | v13;
  v20 = [(CAMatchMoveAnimation *)self sourcePoints];
  if (v20)
  {
    v21 = point_vector_from_array(v20);
    v22 = (atomic_uint *)*((void *)a3 + 17);
    if (v22 != v21)
    {
      if (v22 && atomic_fetch_add(v22 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v22 + 16))(v22);
      }
      if (v21)
      {
        v23 = v21;
        if (!atomic_fetch_add(v21 + 2, 1u))
        {
          v23 = 0;
          atomic_fetch_add(v21 + 2, 0xFFFFFFFF);
        }
      }
      else
      {
        v23 = 0;
      }
      *((void *)a3 + 17) = v23;
    }
    if (v21 && atomic_fetch_add(v21 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v21 + 16))(v21);
    }
  }
  BOOL v24 = [(CAMatchMoveAnimation *)self appliesX];
  BOOL v25 = [(CAMatchMoveAnimation *)self appliesY];
  BOOL v26 = [(CAMatchMoveAnimation *)self appliesScale];
  BOOL v27 = [(CAMatchMoveAnimation *)self appliesRotation];
  BOOL v28 = [(CAMatchMoveAnimation *)self usesNormalizedCoordinates];
  BOOL v29 = [(CAMatchMoveAnimation *)self isAdditive];
  int v30 = v19 << 8;
  if (v24) {
    int v30 = (v19 << 8) | 0x1000000;
  }
  if (v25) {
    v30 |= 0x2000000u;
  }
  if (v26) {
    v30 |= 0x4000000u;
  }
  if (v27) {
    v30 |= 0x8000000u;
  }
  if (v28) {
    v30 |= 0x20000000u;
  }
  if (v29) {
    v30 |= 0x200u;
  }
  *((_DWORD *)a3 + 3) |= v30;
  return v7;
}

- (NSString)keyPath
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 339, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (BOOL)usesNormalizedCoordinates
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 581, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)targetsSuperlayer
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 555, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (NSArray)sourcePoints
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 525, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CALayer)sourceLayer
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 521, (const CGAffineTransform *)4, (CA::Mat4Impl *)v3);
  return (CALayer *)v3[0];
}

- (BOOL)isAdditive
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 3, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesY
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 39, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesX
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 38, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesScale
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 37, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)appliesRotation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 36, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setSourcePoints:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x20D, 3, (unsigned __int8 *)v3);
}

- (void)setSourceLayer:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x209, 4, (unsigned __int8 *)v3);
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if ((v5 - 36) < 4) {
    return (id)*MEMORY[0x1E4F1CFD0];
  }
  if (v5 == 339) {
    return @"position";
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CAMatchMoveAnimation;
  return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
}

- (void)setAdditive:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)3, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesRotation:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x24, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesScale:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x25, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesY:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x27, 7, (unsigned __int8 *)&v3);
}

- (void)setAppliesX:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x26, 7, (unsigned __int8 *)&v3);
}

- (void)setUsesNormalizedCoordinates:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x245, 7, (unsigned __int8 *)&v3);
}

- (void)setTargetsSuperlayer:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x22B, 7, (unsigned __int8 *)&v3);
}

- (void)setKeyPath:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x153, 3, (unsigned __int8 *)v3);
}

- (void)setSourceContextId:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x207, 12, (unsigned __int8 *)&v3);
}

- (unsigned)sourceContextId
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 519, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x20A, 16, (unsigned __int8 *)v3);
}

- (unint64_t)sourceLayerRenderId
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 522, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)v3);
  return v3[0];
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a3 && [a4 isEqualToString:@"sourcePoints"])
  {
    objc_opt_class();
    return CAObject_validateArrayOfClass(a3);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CAMatchMoveAnimation;
    return [&v8 CA_validateValue:a3 forKey:a4];
  }
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (![(CAAnimation *)self isEnabled]) {
    return;
  }
  objc_super v8 = [(CAMatchMoveAnimation *)self sourceLayer];
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_5:
    v10 = (CALayer *)a4;
    if (v9 != a5) {
      v10 = [(CALayer *)v9 presentationLayer];
    }
    if (!v10) {
      return;
    }
    unint64_t v11 = [(CAMatchMoveAnimation *)self keyPath];
    BOOL v12 = [(NSString *)v11 isEqualToString:@"position"];
    if (v12 || (int v13 = (CALayer *)a4, [(CAMatchMoveAnimation *)self targetsSuperlayer]))
    {
      int v13 = (CALayer *)[a4 superlayer];
      if (!v13) {
        return;
      }
    }
    int v14 = [(CAMatchMoveAnimation *)self sourcePoints];
    unint64_t v15 = [(NSArray *)v14 count];
    uint64_t v16 = v15 >= 4 ? 4 : v15;
    if (!v16) {
      return;
    }
    unint64_t v66 = v15;
    BOOL v69 = v12;
    v68 = v11;
    id v70 = a4;
    uint64_t v17 = 0;
    float64x2_t v84 = 0u;
    float64x2_t v85 = 0u;
    float64x2_t v82 = 0u;
    float64x2_t v83 = 0u;
    unint64_t v18 = &v82.f64[1];
    int v19 = (int8x16_t *)MEMORY[0x1E4F28AD0];
    do
    {
      id v20 = -[NSArray objectAtIndex:](v14, "objectAtIndex:", v17, v66);
      v21 = (const char *)[v20 objCType];
      if (v21 && !strcmp(v21, "{CGPoint=dd}"))
      {
        [v20 pointValue];
      }
      else
      {
        uint64_t v22 = v19->i64[0];
        uint64_t v23 = v19->i64[1];
      }
      *((void *)v18 - 1) = v22;
      *(void *)unint64_t v18 = v23;
      ++v17;
      v18 += 2;
    }
    while (v16 != v17);
    if ([(CAMatchMoveAnimation *)self usesNormalizedCoordinates])
    {
      [(CALayer *)v10 bounds];
      v25.f64[1] = v24;
      BOOL v26 = &v82;
      uint64_t v27 = v16;
      do
      {
        *BOOL v26 = vmulq_f64(*v26, v25);
        ++v26;
        --v27;
      }
      while (v27);
    }
    *(void *)&v71[0] = &v82;
    *((void *)&v71[0] + 1) = v16;
    *(void *)&v73.f64[0] = v71;
    *(void *)&v73.f64[1] = -[CAMatchMoveAnimation applyForTime:presentationObject:modelObject:]::MapPoints::map;
    *(void *)&v74.f64[0] = -[CAMatchMoveAnimation applyForTime:presentationObject:modelObject:]::MapPoints::unmap;
    CA::Layer::map_geometry((CA::Transaction *)v10, v13, (void (*)(uint64_t, long long *))map_fun, (void (*)(void, void))map_unfun, (uint64_t)&v73);
    BOOL v28 = [(CAMatchMoveAnimation *)self isAdditive];
    if (v16 == 2)
    {
      double v30 = 0.5;
      if (v69) {
        objc_msgSend(v70, "anchorPoint", 0.5);
      }
      int64x2_t v67 = (int64x2_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v83, v82), v30), (int8x16_t)vceqq_f64(v82, v83)), v82);
      BOOL v31 = [(CAMatchMoveAnimation *)self appliesScale];
      BOOL v32 = [(CAMatchMoveAnimation *)self appliesRotation];
      if (!v69 || !v31 && !v32) {
        goto LABEL_49;
      }
      float64_t v33 = v83.f64[0] - v82.f64[0];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      float64x2_t v75 = 0u;
      float64x2_t v76 = 0u;
      double v34 = v83.f64[1] - v82.f64[1];
      float64x2_t v73 = 0u;
      float64x2_t v74 = 0u;
      if (v32)
      {
        double v35 = atan2(v83.f64[1] - v82.f64[1], v33);
        float64x2_t v76 = 0u;
        long long v77 = 0u;
        long long v78 = xmmword_184997D50;
        long long v80 = xmmword_184997D60;
        __double2 v39 = __sincos_stret(v35);
        *(double *)v37.i64 = v39.__cosval;
        *(double *)v36.i64 = v39.__sinval;
        if (fabs(v39.__sinval) >= 0.0000001)
        {
          v38.i64[0] = 1.0;
          v53.f64[0] = NAN;
          v53.f64[1] = NAN;
          v38.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v53), v38, v36).u64[0];
          if (fabs(v39.__cosval) < 0.0000001)
          {
            *(double *)v36.i64 = 0.0;
          }
          else
          {
            *(double *)v38.i64 = v39.__sinval;
            *(double *)v36.i64 = v39.__cosval;
          }
        }
        else
        {
          v36.i64[0] = 1.0;
          uint64_t v40 = -1;
          v38.i64[1] = -1;
          v36.i64[0] = vbslq_s8((int8x16_t)vnegq_f64((float64x2_t)v38), v36, v37).u64[0];
          v38.i64[0] = 0;
        }
        *(void *)&v73.f64[0] = v36.i64[0];
        *(void *)&v73.f64[1] = v38.i64[0];
        v75.f64[0] = -*(double *)v38.i64;
        *(void *)&v75.f64[1] = v36.i64[0];
      }
      else
      {
        float64x2_t v73 = (float64x2_t)xmmword_184997D50;
        float64x2_t v75 = (float64x2_t)xmmword_184997D60;
        float64x2_t v76 = 0uLL;
        long long v77 = 0uLL;
        long long v78 = xmmword_184997D50;
        long long v80 = xmmword_184997D60;
      }
      if (v31)
      {
        [v70 size];
        double v55 = sqrt(v33 * v33 + v34 * v34) / v54;
        float64x2_t v73 = vmulq_n_f64(v73, v55);
        float64x2_t v74 = vmulq_n_f64((float64x2_t)0, v55);
        float64x2_t v75 = vmulq_n_f64(v75, v55);
        float64x2_t v76 = v74;
        long long v77 = 0u;
        long long v78 = xmmword_184997D50;
      }
      v52 = &v73;
    }
    else
    {
      if (v16 == 1)
      {
        v67.i64[1] = *(void *)&v82.f64[1];
        BOOL v29 = [(CAMatchMoveAnimation *)self appliesX];
LABEL_50:
        BOOL v56 = v29;
        BOOL v57 = [(CAMatchMoveAnimation *)self appliesY];
        BOOL v58 = v57;
        if (!v56 && !v57) {
          return;
        }
        int8x16_t v59 = 0uLL;
        if (!v56 || !v57 || v28)
        {
          if (v69)
          {
            objc_msgSend(v70, "position", 0.0);
          }
          else
          {
            v61 = objc_msgSend(v70, "valueForKeyPath:", v68, 0.0);
            v62 = (const char *)[v61 objCType];
            if (!v62 || strcmp(v62, "{CGPoint=dd}"))
            {
              int8x16_t v59 = *v19;
              goto LABEL_59;
            }
            [v61 pointValue];
          }
          v59.i64[1] = v60;
        }
LABEL_59:
        v63.i64[0] = v56;
        v63.i64[1] = v58;
        int32x2_t v64 = vdup_n_s32(v28);
        float64x2_t v65 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v63, 0x3FuLL)), (int8x16_t)v67, v59);
        v63.i64[0] = v64.u32[0];
        v63.i64[1] = v64.u32[1];
        float64x2_t v73 = vaddq_f64(v65, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v63, 0x3FuLL)), v59, (int8x16_t)vdupq_n_s64(0x8000000000000000)));
        objc_msgSend(v70, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v73, "{CGPoint=dd}"), v68);
        return;
      }
      if (v66 < 4) {
        return;
      }
      double v41 = 0.5;
      double v42 = 0.5;
      if (v69) {
        objc_msgSend(v70, "anchorPoint", 0.5, 0.5);
      }
      v72[0] = v41;
      v72[1] = v42;
      float64x2_t v43 = vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v83, v82), v41), (int8x16_t)vceqq_f64(v82, v83)), v82);
      float64x2_t v44 = vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v84, v85), v41), (int8x16_t)vceqq_f64(v85, v84)), v85);
      int64x2_t v67 = (int64x2_t)vaddq_f64((float64x2_t)vbicq_s8((int8x16_t)vmulq_n_f64(vsubq_f64(v44, v43), v42), (int8x16_t)vceqq_f64(v43, v44)), v43);
      if (!v69)
      {
LABEL_49:
        BOOL v29 = [(CAMatchMoveAnimation *)self appliesX];
        goto LABEL_50;
      }
      unint64_t v45 = 0;
      memset(v81, 0, sizeof(v81));
      float64x2_t v46 = (float64x2_t)vdupq_lane_s64(v67.i64[0], 0);
      float64x2_t v47 = (float64x2_t)vdupq_laneq_s64(v67, 1);
      do
      {
        v48 = &v82.f64[v45 / 8];
        float64x2x2_t v87 = vld2q_f64(v48);
        v88.val[0] = vsubq_f64(v87.val[0], v46);
        v88.val[1] = vsubq_f64(v87.val[1], v47);
        v49 = (double *)&v81[v45 / 0x10];
        vst2q_f64(v49, v88);
        v45 += 32;
      }
      while (v45 != 64);
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      float64x2_t v75 = 0u;
      float64x2_t v76 = 0u;
      float64x2_t v73 = 0u;
      float64x2_t v74 = 0u;
      [v70 size];
      *(void *)&v71[0] = v50;
      *((void *)&v71[0] + 1) = v51;
      CA::Mat4Impl::mat4_set_corner_matrix((uint64_t)&v73, (double *)v81, (double *)v71, v72);
      v71[0] = v73;
      v71[1] = v74;
      v71[2] = v75;
      v71[3] = v76;
      v71[4] = v77;
      v71[5] = v78;
      v71[6] = v79;
      v71[7] = v80;
      v52 = (float64x2_t *)v71;
    }
    set_layer_transform(v70, (uint64_t)v52, v28);
    goto LABEL_49;
  }
  while (v8 != a5)
  {
    objc_super v8 = [(CALayer *)v8 superlayer];
    if (!v8) {
      goto LABEL_5;
    }
  }
}

- (void)applyForTime:(void *)a1 presentationObject:(float64x2_t *)this modelObject:(double *)a3
{
  if (a1[1])
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      CA::Mat4Impl::mat4_apply_to_point2(this, (double *)(*a1 + v5), a3);
      ++v6;
      v5 += 16;
    }
    while (v6 < a1[1]);
  }
}

@end