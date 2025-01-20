@interface CLVehicleHeadingInternal
- (CLVehicleHeadingInternal)initWithClientVehicleHeading:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CLVehicleHeadingInternal

- (CLVehicleHeadingInternal)initWithClientVehicleHeading:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)CLVehicleHeadingInternal;
  result = [(CLVehicleHeadingInternal *)&v6 init];
  if (result)
  {
    result->fHeading.trueHeading = var0;
    result->fHeading.timestamp = var1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double trueHeading = self->fHeading.trueHeading;
  double timestamp = self->fHeading.timestamp;

  return (id)objc_msgSend(v4, "initWithClientVehicleHeading:", trueHeading, timestamp);
}

@end