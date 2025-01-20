@interface GEOComposedRouteEVStepInfo
+ (BOOL)supportsSecureCoding;
- (GEOComposedRouteEVStepInfo)init;
- (GEOComposedRouteEVStepInfo)initWithCoder:(id)a3;
- (GEOComposedRouteEVStepInfo)initWithEVStateInfo:(id)a3;
- (id)description;
- (unsigned)remainingBatteryCharge;
- (unsigned)remainingBatteryPercentage;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOComposedRouteEVStepInfo

- (GEOComposedRouteEVStepInfo)init
{
  result = (GEOComposedRouteEVStepInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOComposedRouteEVStepInfo)initWithEVStateInfo:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedRouteEVStepInfo;
  v5 = [(GEOComposedRouteEVStepInfo *)&v8 init];
  if (v5)
  {
    v5->_remainingBatteryCharge = [v4 remainingBatteryCharge];
    v5->_remainingBatteryPercentage = [v4 remainingBatteryPercentage];
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteEVStepInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOComposedRouteEVStepInfo;
  v5 = [(GEOComposedRouteEVStepInfo *)&v8 init];
  if (v5)
  {
    v5->_remainingBatteryCharge = [v4 decodeIntegerForKey:@"_remainingBatteryCharge"];
    v5->_remainingBatteryPercentage = [v4 decodeIntegerForKey:@"_remainingBatteryPercentage"];
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t remainingBatteryCharge = self->_remainingBatteryCharge;
  id v5 = a3;
  [v5 encodeInteger:remainingBatteryCharge forKey:@"_remainingBatteryCharge"];
  [v5 encodeInteger:self->_remainingBatteryPercentage forKey:@"_remainingBatteryPercentage"];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u Wh (%u%%)", self->_remainingBatteryCharge, self->_remainingBatteryPercentage);
}

- (unsigned)remainingBatteryCharge
{
  return self->_remainingBatteryCharge;
}

- (unsigned)remainingBatteryPercentage
{
  return self->_remainingBatteryPercentage;
}

@end