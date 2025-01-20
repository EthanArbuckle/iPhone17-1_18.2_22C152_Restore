@interface CMAttitudeInternal
- (BOOL)isEqual:(id)a3;
- (CMAttitudeInternal)initWithQuaternion:(id)a3;
- (void)setQuaternion:(id)a3;
@end

@implementation CMAttitudeInternal

- (CMAttitudeInternal)initWithQuaternion:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v12.receiver = self;
  v12.super_class = (Class)CMAttitudeInternal;
  v7 = [(CMAttitudeInternal *)&v12 init];
  v10 = v7;
  if (v7) {
    objc_msgSend_setQuaternion_(v7, v8, v9, var0, var1, var2, var3);
  }
  return v10;
}

- (void)setQuaternion:(id)a3
{
  self->fQuaternion = ($2FED4CF3216092304D4513EB121F1E87)a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->fQuaternion.w == *((double *)a3 + 1)
      && self->fQuaternion.x == *((double *)a3 + 2)
      && self->fQuaternion.y == *((double *)a3 + 3)
      && self->fQuaternion.z == *((double *)a3 + 4);
}

@end