@interface CMPoseInternal
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPoseInternal:(id)a3;
- (CMPoseInternal)initWithPose:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
@end

@implementation CMPoseInternal

- (CMPoseInternal)initWithPose:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CMPoseInternal;
  v4 = [(CMPoseInternal *)&v9 init];
  if (v4)
  {
    v5 = [CMAttitude alloc];
    v4->fAttitude = (CMAttitude *)objc_msgSend_initWithQuaternion_(v5, v6, v7, a3->var0.var0, a3->var0.var1, a3->var0.var2, a3->var0.var3);
    *(_OWORD *)&v4->fTranslation.x = *(_OWORD *)&a3->var1.var0;
    *(_OWORD *)&v4->fTranslation.z = *(_OWORD *)&a3->var1.var2;
    v4->fReceivedAuxTimestamp = a3->var3;
    v4->fMachAbsTimestamp = a3->var4;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMPoseInternal;
  [(CMPoseInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v11 = objc_msgSend_init(v7, v8, v9);
  if (v11)
  {
    *(void *)(v11 + 8) = objc_msgSend_copyWithZone_(self->fAttitude, v10, (uint64_t)a3);
    double z = self->fTranslation.z;
    *(_OWORD *)(v11 + 16) = *(_OWORD *)&self->fTranslation.x;
    *(double *)(v11 + 32) = z;
    *(double *)(v11 + 40) = self->fConsumedAuxTimestamp;
    *(double *)(v11 + 48) = self->fReceivedAuxTimestamp;
    *(double *)(v11 + 56) = self->fMachAbsTimestamp;
  }
  return (id)v11;
}

- (BOOL)isEqualToPoseInternal:(id)a3
{
  if (a3)
  {
    int isEqual = objc_msgSend_isEqual_(self->fAttitude, a2, *((void *)a3 + 1));
    if (isEqual) {
      LOBYTE(isEqual) = self->fTranslation.x == *((double *)a3 + 2)
    }
                     && self->fTranslation.y == *((double *)a3 + 3)
                     && self->fTranslation.z == *((double *)a3 + 4)
                     && self->fConsumedAuxTimestamp == *((double *)a3 + 5)
                     && self->fReceivedAuxTimestamp == *((double *)a3 + 6)
                     && self->fMachAbsTimestamp == *((double *)a3 + 7);
  }
  else
  {
    LOBYTE(isEqual) = 0;
  }
  return isEqual;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_isEqualToPoseInternal_, a3);
}

@end