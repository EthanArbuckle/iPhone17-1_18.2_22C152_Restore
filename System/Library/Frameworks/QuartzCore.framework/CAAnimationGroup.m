@interface CAAnimationGroup
- (NSArray)animations;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (void)CA_prepareRenderValue;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5;
- (void)setAnimations:(NSArray *)animations;
- (void)setDefaultDuration:(double)a3;
@end

@implementation CAAnimationGroup

- (void)_copyRenderAnimationForLayer:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = [(CAAnimationGroup *)self animations];
  uint64_t v6 = [(NSArray *)v5 count];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  size_t v8 = 8 * v6;
  if ((unint64_t)(8 * v6) > 0x1000)
  {
    v9 = (char *)malloc_type_malloc(8 * v6, 0x4D294E88uLL);
    if (v9) {
      goto LABEL_5;
    }
    return 0;
  }
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
LABEL_5:
  int v10 = 0;
  v11 = 0;
  for (uint64_t i = 0; i != v7; ++i)
  {
    uint64_t v13 = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", i), "_copyRenderAnimationForLayer:", a3);
    if (v13)
    {
      v10 |= *(_DWORD *)(v13 + 12) >> 8;
      *(void *)&v9[8 * (void)v11] = v13;
      v11 = (CA::Render::Array *)((char *)v11 + 1);
    }
  }
  if (!v11) {
    goto LABEL_24;
  }
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v15 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x68uLL, 0x743898A5uLL);
  v16 = v15;
  if (v15)
  {
    *((_DWORD *)v15 + 2) = 1;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *((void *)v15 + 9) = 0;
    *((void *)v15 + 2) = 0;
    *((void *)v15 + 3) = 0;
    *((_DWORD *)v15 + 8) = 0;
    *((_DWORD *)v15 + 3) = 21;
    ++dword_1EB2ADE1C;
    *(void *)v15 = &unk_1ED02DDF0;
    *((void *)v15 + 12) = 0;
  }
  v22.receiver = self;
  v22.super_class = (Class)CAAnimationGroup;
  if ([(CAAnimation *)&v22 _setCARenderAnimation:v15 layer:a3])
  {
    v17 = CA::Render::Array::new_array(v11, v9, 0, 0);
    v18 = (atomic_uint *)*((void *)v16 + 12);
    if (v18 != v17)
    {
      if (v18 && atomic_fetch_add(v18 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v18 + 16))(v18);
      }
      if (v17)
      {
        v19 = v17;
        if (!atomic_fetch_add(v17 + 2, 1u))
        {
          v19 = 0;
          atomic_fetch_add(v17 + 2, 0xFFFFFFFF);
        }
      }
      else
      {
        v19 = 0;
      }
      *((void *)v16 + 12) = v19;
    }
    if (v17 && atomic_fetch_add(v17 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v17 + 16))(v17);
    }
    *((_DWORD *)v16 + 3) |= (v10 << 8) & 0x1D3000;
    goto LABEL_31;
  }
  if (v16)
  {
    if (atomic_fetch_add((atomic_uint *volatile)v16 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(char *))(*(void *)v16 + 16))(v16);
    }
LABEL_24:
    v16 = 0;
  }
LABEL_31:
  if (v8 > 0x1000) {
    free(v9);
  }
  return v16;
}

- (void)setDefaultDuration:(double)a3
{
  [(CAAnimation *)self duration];
  double v6 = v5;
  if (v5 <= 0.0)
  {
    [(CAAnimation *)self setDuration:a3];
    double v6 = a3;
  }
  uint64_t v7 = [(CAAnimationGroup *)self animations];
  uint64_t v8 = [(NSArray *)v7 count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", i), "setDefaultDuration:", v6);
  }
}

- (void)CA_prepareRenderValue
{
  v2 = [(CAAnimationGroup *)self animations];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = [(NSArray *)v2 count];
    if (v4)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "CA_prepareRenderValue");
    }
  }
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  uint64_t v4 = [(CAAnimationGroup *)self animations];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = [(NSArray *)v4 count];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  unsigned int v9 = 0;
  do
    v9 |= objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v8++), "_propertyFlagsForLayer:", a3);
  while (v7 != v8);
  return v9;
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  v15[1] = *(double *)MEMORY[0x1E4F143B8];
  v15[0] = a3;
  if ([(CAAnimation *)self isEnabled])
  {
    uint64_t v8 = [(CAAnimationGroup *)self animations];
    uint64_t v9 = [(NSArray *)v8 count];
    if (v9)
    {
      uint64_t v10 = v9;
      if (mapAnimationTime(&self->super, v15, 0))
      {
        double v11 = v15[0];
        [(CAAnimation *)self duration];
        uint64_t v12 = 0;
        double v14 = v13 * v11;
        do
          objc_msgSend(-[NSArray objectAtIndex:](v8, "objectAtIndex:", v12++), "applyForTime:presentationObject:modelObject:", a4, a5, v14);
        while (v10 != v12);
      }
    }
  }
}

- (NSArray)animations
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 33, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setAnimations:(NSArray *)animations
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = animations;
  CAAnimation_setter((uint64_t)self, (const void *)0x21, 3, (unsigned __int8 *)v3);
}

@end