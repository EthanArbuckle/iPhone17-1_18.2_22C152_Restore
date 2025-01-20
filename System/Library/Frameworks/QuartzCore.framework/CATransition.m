@interface CATransition
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (CATransitionSubtype)subtype;
- (CATransitionType)type;
- (NSDictionary)options;
- (float)endProgress;
- (float)startProgress;
- (id)filter;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (unsigned)transitionFlags;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)setEndProgress:(float)endProgress;
- (void)setFilter:(id)filter;
- (void)setOptions:(id)a3;
- (void)setStartProgress:(float)startProgress;
- (void)setSubtype:(CATransitionSubtype)subtype;
- (void)setTransitionFlags:(unsigned int)a3;
- (void)setType:(CATransitionType)type;
@end

@implementation CATransition

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return 1;
}

- (void)setTransitionFlags:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x23B, 12, (unsigned __int8 *)&v3);
}

- (void)setType:(CATransitionType)type
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = type;
  CAAnimation_setter((uint64_t)self, (const void *)0x241, 3, (unsigned __int8 *)v3);
}

- (void)setSubtype:(CATransitionSubtype)subtype
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = subtype;
  CAAnimation_setter((uint64_t)self, (const void *)0x228, 3, (unsigned __int8 *)v3);
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
    *((_DWORD *)v6 + 3) = 55;
    ++dword_1EB2ADEA4;
    *(void *)v6 = &unk_1ED02EBE0;
    *((_DWORD *)v6 + 23) = 0;
    *((_DWORD *)v6 + 24) = 0;
    *(void *)(v6 + 100) = 0x3F80000000000000;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    if (![(CATransition *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CATransition *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CATransition;
  BOOL v6 = [(CAAnimation *)&v21 _setCARenderAnimation:a3 layer:a4];
  if (v6)
  {
    id v7 = [(CATransition *)self filter];
    if (v7)
    {
      *((_DWORD *)a3 + 23) = 225;
      v8 = (atomic_uint *)objc_msgSend(v7, "CA_copyRenderValue");
      v9 = (atomic_uint *)*((void *)a3 + 14);
      if (v9 != v8)
      {
        if (v9 && atomic_fetch_add(v9 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v9 + 16))(v9);
        }
        if (v8)
        {
          v10 = v8;
          if (!atomic_fetch_add(v8 + 2, 1u))
          {
            v10 = 0;
            atomic_fetch_add(v8 + 2, 0xFFFFFFFF);
          }
        }
        else
        {
          v10 = 0;
        }
        *((void *)a3 + 14) = v10;
      }
      if (v8 && atomic_fetch_add(v8 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
      }
    }
    else
    {
      CFStringRef v11 = [(CATransition *)self type];
      if (v11) {
        *((_DWORD *)a3 + 23) = CAInternAtom(v11, 1);
      }
    }
    CFStringRef v12 = [(CATransition *)self subtype];
    if (v12) {
      *((_DWORD *)a3 + 24) = CAInternAtom(v12, 1);
    }
    [(CATransition *)self startProgress];
    if (v13 != 0.0) {
      *((float *)a3 + 25) = v13;
    }
    [(CATransition *)self endProgress];
    if (v14 != 1.0) {
      *((float *)a3 + 26) = v14;
    }
    v15 = [(CATransition *)self options];
    if (v15)
    {
      uint64_t v16 = [(NSDictionary *)v15 CA_copyRenderKeyValueArray];
      v17 = (atomic_uint *)*((void *)a3 + 15);
      if (v17 != (atomic_uint *)v16)
      {
        if (v17 && atomic_fetch_add(v17 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v17 + 16))(v17);
        }
        if (v16)
        {
          v18 = (atomic_uint *)(v16 + 8);
          if (!atomic_fetch_add((atomic_uint *volatile)(v16 + 8), 1u))
          {
            uint64_t v16 = 0;
            atomic_fetch_add(v18, 0xFFFFFFFF);
          }
        }
        *((void *)a3 + 15) = v16;
      }
    }
    char v19 = [(CATransition *)self transitionFlags];
    if (v19) {
      *((_DWORD *)a3 + 3) |= 0x1000000u;
    }
    if ((v19 & 2) != 0) {
      *((_DWORD *)a3 + 3) |= 0x2000000u;
    }
  }
  return v6;
}

- (unsigned)transitionFlags
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 571, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (NSDictionary)options
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 412, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSDictionary *)v3[0];
}

- (CATransitionType)type
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 577, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CATransitionType)v3[0];
}

- (CATransitionSubtype)subtype
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 552, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CATransitionSubtype)v3[0];
}

- (float)startProgress
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 537, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (id)filter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 225, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (float)endProgress
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 216, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setFilter:(id)filter
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = filter;
  CAAnimation_setter((uint64_t)self, (const void *)0xE1, 2, (unsigned __int8 *)v3);
}

- (void)setEndProgress:(float)endProgress
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = endProgress;
  CAAnimation_setter((uint64_t)self, (const void *)0xD8, 17, (unsigned __int8 *)&v3);
}

- (void)setStartProgress:(float)startProgress
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = startProgress;
  CAAnimation_setter((uint64_t)self, (const void *)0x219, 17, (unsigned __int8 *)&v3);
}

- (void)setOptions:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x19C, 3, (unsigned __int8 *)v3);
}

@end