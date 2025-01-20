@interface CAPropertyAnimation
+ (CAPropertyAnimation)animationWithKeyPath:(NSString *)path;
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)isAdditive;
- (BOOL)isCumulative;
- (CAValueFunction)valueFunction;
- (NSString)keyPath;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (void)setAdditive:(BOOL)additive;
- (void)setCumulative:(BOOL)cumulative;
- (void)setKeyPath:(NSString *)keyPath;
- (void)setValueFunction:(CAValueFunction *)valueFunction;
@end

@implementation CAPropertyAnimation

+ (CAPropertyAnimation)animationWithKeyPath:(NSString *)path
{
  id v4 = objc_alloc_init((Class)a1);
  [v4 setKeyPath:path];

  return (CAPropertyAnimation *)v4;
}

- (void)setKeyPath:(NSString *)keyPath
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = keyPath;
  CAAnimation_setter((uint64_t)self, (const void *)0x153, 3, (unsigned __int8 *)v3);
}

- (NSString)keyPath
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 339, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setAdditive:(BOOL)additive
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = additive;
  CAAnimation_setter((uint64_t)self, (const void *)3, 7, (unsigned __int8 *)&v3);
}

- (void)setCumulative:(BOOL)cumulative
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = cumulative;
  CAAnimation_setter((uint64_t)self, (const void *)0x9F, 7, (unsigned __int8 *)&v3);
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v21[0] = 0;
  CFStringRef v7 = [(CAPropertyAnimation *)self keyPath];
  CA::Render::key_path_set((CA::Render *)v21, v7, v8);
  unint64_t v10 = v21[0];
  if (!v21[0])
  {
LABEL_5:
    uint64_t v11 = 0;
    goto LABEL_7;
  }
  if ((v21[0] & 1) == 0)
  {
    if (*(_DWORD *)v21[0])
    {
      uint64_t v11 = *(unsigned int *)(v21[0] + 4);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  uint64_t v11 = v21[0] >> 1;
LABEL_7:
  CA::Render::key_path_free(*((CA::Render **)a3 + 12), v9);
  *((void *)a3 + 12) = v10;
  if (a4)
  {
    unsigned int v12 = [a4 _renderLayerDefinesProperty:v11];
    if (!v12) {
      return v12;
    }
    int v13 = [a4 _renderLayerPropertyAnimationFlags:v11];
  }
  else
  {
    int v13 = 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)CAPropertyAnimation;
  unsigned int v12 = [(CAAnimation *)&v20 _setCARenderAnimation:a3 layer:a4];
  if (v12)
  {
    if (key_path_affects_container(v10)) {
      int v14 = v13 | 0x400;
    }
    else {
      int v14 = v13;
    }
    if ([(CAPropertyAnimation *)self isAdditive]) {
      v14 |= 2u;
    }
    if ([(CAPropertyAnimation *)self isCumulative]) {
      v14 |= 4u;
    }
    v15 = [(CAPropertyAnimation *)self valueFunction];
    if (v15)
    {
      v16 = [(CAValueFunction *)v15 CA_copyRenderValue];
      v17 = (atomic_uint *)*((void *)a3 + 13);
      if (v17 != v16)
      {
        if (v17 && atomic_fetch_add(v17 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v17 + 16))(v17);
        }
        if (v16)
        {
          v18 = v16;
          if (!atomic_fetch_add(v16 + 2, 1u))
          {
            v18 = 0;
            atomic_fetch_add(v16 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v18 = 0;
        }
        *((void *)a3 + 13) = v18;
      }
      if (v16 && atomic_fetch_add(v16 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v16 + 16))(v16);
      }
    }
    if (v14) {
      *((_DWORD *)a3 + 3) |= v14 << 8;
    }
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)isAdditive
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 3, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CAValueFunction)valueFunction
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 584, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CAValueFunction *)v3[0];
}

- (BOOL)isCumulative
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 159, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  uint64_t v4 = [(CAPropertyAnimation *)self keyPath];

  return animation_property_flags(v4, (CALayer *)a3);
}

- (void)setValueFunction:(CAValueFunction *)valueFunction
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = valueFunction;
  CAAnimation_setter((uint64_t)self, (const void *)0x248, 2, (unsigned __int8 *)v3);
}

@end