@interface ADWorldToImageProjection
- (uint64_t)initWithPose:(void *)a3 calibration:;
- (void)dealloc;
- (void)projectPoints:(ADWorldToImageProjection *)self count:(SEL)a2;
@end

@implementation ADWorldToImageProjection

- (void)dealloc
{
  projection = self->_projection;
  if (projection) {
    (*((void (**)(WorldToImageProjection *, SEL))projection->var0 + 1))(projection, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)ADWorldToImageProjection;
  [(ADWorldToImageProjection *)&v4 dealloc];
}

- (void)projectPoints:(ADWorldToImageProjection *)self count:(SEL)a2
{
  unsigned int v4 = v3;
  v5 = v2;
  uint64_t v6 = v3;
  (*((void (**)(void **__return_ptr))self->_projection->var0 + 2))(__p);
  v7 = __p[0];
  if (v4)
  {
    v8 = (long long *)__p[0];
    do
    {
      long long v9 = *v8++;
      *v5++ = v9;
      --v6;
    }
    while (v6);
  }
  else if (!__p[0])
  {
    return;
  }
  __p[1] = v7;
  operator delete(v7);
}

- (uint64_t)initWithPose:(void *)a3 calibration:
{
  v8[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  a1[1] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)ADWorldToImageProjection;
  if ([(ADWorldToImageProjection *)&v7 init])
  {
    id v5 = v4;
    v8[0] = &unk_26C6876F8;
    v8[1] = v5;
    v8[3] = v8;
    DisparityToDepth::VioProjectionFactory::create();
  }

  return 0;
}

@end