@interface CLVehicleSpeedInternal
- (CLVehicleSpeedInternal)initWithClientVehicleSpeed:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CLVehicleSpeedInternal

- (CLVehicleSpeedInternal)initWithClientVehicleSpeed:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v8.receiver = self;
  v8.super_class = (Class)CLVehicleSpeedInternal;
  result = [(CLVehicleSpeedInternal *)&v8 init];
  if (result)
  {
    result->fSpeed.speed = var0;
    result->fSpeed.timestamp = var1;
    result->fSpeed.machContinuousTime = var2;
    result->fSpeed.machAbsoluteTime = var3;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double speed = self->fSpeed.speed;
  double timestamp = self->fSpeed.timestamp;
  double machContinuousTime = self->fSpeed.machContinuousTime;
  double machAbsoluteTime = self->fSpeed.machAbsoluteTime;

  return (id)objc_msgSend(v4, "initWithClientVehicleSpeed:", speed, timestamp, machContinuousTime, machAbsoluteTime);
}

@end