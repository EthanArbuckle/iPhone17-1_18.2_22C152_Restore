@interface CAMatchPropertyAnimation
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)isAdditive;
- (CALayer)sourceLayer;
- (NSString)keyPath;
- (unint64_t)sourceLayerRenderId;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (unsigned)sourceContextId;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5;
- (void)setAdditive:(BOOL)a3;
- (void)setKeyPath:(id)a3;
- (void)setSourceContextId:(unsigned int)a3;
- (void)setSourceLayer:(id)a3;
- (void)setSourceLayerRenderId:(unint64_t)a3;
@end

@implementation CAMatchPropertyAnimation

- (void)setAdditive:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)3, 7, (unsigned __int8 *)&v3);
}

- (BOOL)isAdditive
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 3, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (void)setKeyPath:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x153, 3, (unsigned __int8 *)v3);
}

- (NSString)keyPath
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 339, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
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

- (void)setSourceLayer:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x209, 4, (unsigned __int8 *)v3);
}

- (CALayer)sourceLayer
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 521, (const CGAffineTransform *)4, (CA::Mat4Impl *)v3);
  return (CALayer *)v3[0];
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  uint64_t v4 = [(CAMatchPropertyAnimation *)self keyPath];

  return animation_property_flags(v4, (CALayer *)a3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x88uLL, 0x743898A5uLL);
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
    *((void *)v6 + 15) = 0;
    *((void *)v6 + 16) = 0;
    *((_DWORD *)v6 + 3) = 32;
    ++dword_1EB2ADE48;
    *(void *)v6 = &unk_1ED02EFB8;
    if (![(CAMatchPropertyAnimation *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CAMatchPropertyAnimation *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)CAMatchPropertyAnimation;
  BOOL v7 = -[CAAnimation _setCARenderAnimation:layer:](&v22, sel__setCARenderAnimation_layer_);
  if (!v7) {
    return v7;
  }
  CFStringRef v8 = [(CAMatchPropertyAnimation *)self keyPath];
  if (!v8)
  {
    unsigned int v13 = 0;
    goto LABEL_15;
  }
  unint64_t v21 = 0;
  CA::Render::key_path_set((CA::Render *)&v21, v8, v9);
  unint64_t v11 = v21;
  if (!v21)
  {
LABEL_8:
    unint64_t v12 = 0;
    goto LABEL_10;
  }
  if ((v21 & 1) == 0)
  {
    if (*(_DWORD *)v21)
    {
      unint64_t v12 = *(unsigned int *)(v21 + 4);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  unint64_t v12 = v21 >> 1;
LABEL_10:
  CA::Render::key_path_free(*((CA::Render **)a3 + 15), v10);
  *((void *)a3 + 15) = v11;
  if (a4) {
    unsigned int v13 = [a4 _renderLayerPropertyAnimationFlags:v12] << 8;
  }
  else {
    unsigned int v13 = 0;
  }
  if (key_path_affects_container(v11)) {
    v13 |= 0x40000u;
  }
LABEL_15:
  BOOL v14 = [(CAMatchPropertyAnimation *)self isAdditive];
  *((void *)a3 + 12) = CA::Render::Object::render_id(*((CA::Render::Object **)a4 + 2));
  v15 = [(CAMatchPropertyAnimation *)self sourceLayer];
  if (v15)
  {
    v16 = v15;
    *((void *)a3 + 13) = CA::Render::Object::render_id((CA::Render::Object *)v15->_attr.layer);
    unsigned int v17 = objc_msgSend(-[CALayer context](v16, "context"), "contextId");
LABEL_19:
    *((_DWORD *)a3 + 28) = v17;
    goto LABEL_20;
  }
  unint64_t v18 = [(CAMatchPropertyAnimation *)self sourceLayerRenderId];
  if (v18)
  {
    *((void *)a3 + 13) = v18;
    unsigned int v17 = [(CAMatchPropertyAnimation *)self sourceContextId];
    goto LABEL_19;
  }
LABEL_20:
  int v19 = v13 | 0x200;
  if (!v14) {
    int v19 = v13;
  }
  *((_DWORD *)a3 + 3) |= v19;
  return v7;
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  if ([(CAAnimation *)self isEnabled])
  {
    CFStringRef v8 = [(CAMatchPropertyAnimation *)self sourceLayer];
    CFStringRef v9 = v8;
    if (v8)
    {
      while (v8 != a5)
      {
        CFStringRef v8 = [(CALayer *)v8 superlayer];
        if (!v8) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      v10 = (CALayer *)a4;
      if (v9 != a5) {
        v10 = [(CALayer *)v9 presentationLayer];
      }
      if (v10)
      {
        unint64_t v11 = [(CAMatchPropertyAnimation *)self keyPath];
        uint64_t v12 = [(CALayer *)v10 valueForKeyPath:v11];
        if ([(CAMatchPropertyAnimation *)self isAdditive]) {
          uint64_t v12 = objc_msgSend((id)objc_msgSend(a4, "valueForKeyPath:", v11), "CA_addValue:multipliedBy:", v12, 1);
        }
        [a4 setValue:v12 forKeyPath:v11];
      }
    }
  }
}

@end