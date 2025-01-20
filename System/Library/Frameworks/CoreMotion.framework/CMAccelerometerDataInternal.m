@interface CMAccelerometerDataInternal
- (CMAccelerometerDataInternal)initWithAcceleration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAcceleration:(id)a3;
@end

@implementation CMAccelerometerDataInternal

- (void)setAcceleration:(id)a3
{
  self->fAcceleration = ($393C16A032292777F0C3725FFB2C0008)a3;
}

- (CMAccelerometerDataInternal)initWithAcceleration:(id)a3
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  v14.receiver = self;
  v14.super_class = (Class)CMAccelerometerDataInternal;
  v6 = [(CMAccelerometerDataInternal *)&v14 init];
  v12 = v6;
  if (v6)
  {
    *(float *)&double v9 = var0;
    *(float *)&double v10 = var1;
    *(float *)&double v11 = var2;
    objc_msgSend_setAcceleration_(v6, v7, v8, v9, v10, v11);
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (result)
  {
    uint64_t v11 = *(void *)&self->fAcceleration.x;
    *((_DWORD *)result + 4) = LODWORD(self->fAcceleration.z);
    *((void *)result + 1) = v11;
  }
  return result;
}

@end