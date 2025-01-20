@interface CMAltitudeDataInternal
- (CMAltitudeDataInternal)initWithAltitude:(float)a3 andPressure:(float)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAltitude:(float)a3 andPressure:(float)a4;
@end

@implementation CMAltitudeDataInternal

- (void)setAltitude:(float)a3 andPressure:(float)a4
{
  self->fAltitude = a3;
  self->fPressure = a4;
}

- (CMAltitudeDataInternal)initWithAltitude:(float)a3 andPressure:(float)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CMAltitudeDataInternal;
  v6 = [(CMAltitudeDataInternal *)&v13 init];
  v11 = v6;
  if (v6)
  {
    *(float *)&double v9 = a3;
    *(float *)&double v10 = a4;
    objc_msgSend_setAltitude_andPressure_(v6, v7, v8, v9, v10);
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  if (result)
  {
    *((_DWORD *)result + 2) = LODWORD(self->fAltitude);
    *((_DWORD *)result + 3) = LODWORD(self->fPressure);
  }
  return result;
}

@end