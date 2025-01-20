@interface CAMeshInterpolator
- (id)meshTransformForLayer:(id)a3;
- (void)dealloc;
@end

@implementation CAMeshInterpolator

- (id)meshTransformForLayer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a3 bounds];
  v13.f64[0] = v5;
  v13.f64[1] = v6;
  double v14 = v7;
  double v15 = v8;
  if (v7 < 0.0)
  {
    v13.f64[0] = v7 + v5;
    double v14 = -v7;
  }
  if (v8 < 0.0)
  {
    v13.f64[1] = v8 + v6;
    double v15 = -v8;
  }
  v9 = CA::Render::MeshTransform::eval_interpolator((CA::Render::MeshTransform *)self->_interp, &v13, v4);
  if (!v9) {
    return 0;
  }
  v10 = v9;
  v11 = [[CAMeshTransform alloc] _init];
  v11[1] = v10;
  v11[2] = *((unsigned int *)v10 + 24);
  v11[3] = *((int *)v10 + 25);
  *((unsigned char *)v11 + 32) = *((unsigned char *)v10 + 108);

  return v11;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  interp = (atomic_uint *)self->_interp;
  if (interp && atomic_fetch_add(interp + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)interp + 16))(interp, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMeshInterpolator;
  [(CAMeshTransform *)&v4 dealloc];
}

@end