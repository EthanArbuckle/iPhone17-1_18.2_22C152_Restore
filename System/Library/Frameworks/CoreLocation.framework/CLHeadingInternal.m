@interface CLHeadingInternal
- (CLHeadingInternal)initWithClientHeading:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CLHeadingInternal

- (CLHeadingInternal)initWithClientHeading:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLHeadingInternal;
  result = [(CLHeadingInternal *)&v9 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->fHeading.z = *(_OWORD *)&a3->var2;
    *(_OWORD *)&result->fHeading.x = v5;
    long long v6 = *(_OWORD *)&a3->var4;
    long long v7 = *(_OWORD *)&a3->var6;
    long long v8 = *(_OWORD *)&a3->var8;
    *(void *)&result->fHeading.calibration = *(void *)&a3->var10;
    *(_OWORD *)&result->fHeading.magnitude = v8;
    *(_OWORD *)&result->fHeading.timestamp = v7;
    *(_OWORD *)&result->fHeading.trueHeading = v6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  long long v5 = *(_OWORD *)&self->fHeading.timestamp;
  v8[2] = *(_OWORD *)&self->fHeading.trueHeading;
  v8[3] = v5;
  v8[4] = *(_OWORD *)&self->fHeading.magnitude;
  uint64_t v9 = *(void *)&self->fHeading.calibration;
  long long v6 = *(_OWORD *)&self->fHeading.z;
  v8[0] = *(_OWORD *)&self->fHeading.x;
  v8[1] = v6;
  return (id)[v4 initWithClientHeading:v8];
}

@end