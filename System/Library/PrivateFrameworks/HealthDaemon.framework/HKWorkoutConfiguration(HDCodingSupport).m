@interface HKWorkoutConfiguration(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableWorkoutConfiguration)codableRepresentationForSync;
@end

@implementation HKWorkoutConfiguration(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = objc_alloc_init(MEMORY[0x1E4F2B768]);
    objc_msgSend(v5, "setActivityType:", objc_msgSend(v4, "activityType"));
    objc_msgSend(v5, "setLocationType:", objc_msgSend(v4, "locationType"));
    objc_msgSend(v5, "setSwimmingLocationType:", objc_msgSend(v4, "wLocationType"));
    if ([v4 hasWLengthUnitString])
    {
      v6 = (void *)MEMORY[0x1E4F2B618];
      v7 = [v4 wLengthUnitString];
      v8 = [v6 unitFromString:v7];

      v9 = (void *)MEMORY[0x1E4F2B370];
      [v4 wLengthValue];
      v10 = objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
      [v5 setLapLength:v10];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (HDCodableWorkoutConfiguration)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableWorkoutConfiguration);
  -[HDCodableWorkoutConfiguration setActivityType:](v2, "setActivityType:", [a1 activityType]);
  -[HDCodableWorkoutConfiguration setLocationType:](v2, "setLocationType:", [a1 locationType]);
  -[HDCodableWorkoutConfiguration setWLocationType:](v2, "setWLocationType:", [a1 swimmingLocationType]);
  id v3 = [a1 lapLength];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 _unit];
    [v4 doubleValueForUnit:v5];
    -[HDCodableWorkoutConfiguration setWLengthValue:](v2, "setWLengthValue:");
    v6 = [v5 unitString];
    [(HDCodableWorkoutConfiguration *)v2 setWLengthUnitString:v6];
  }

  return v2;
}

@end