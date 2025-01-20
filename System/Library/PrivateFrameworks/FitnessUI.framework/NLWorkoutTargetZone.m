@interface NLWorkoutTargetZone
+ (id)cadenceTargetZoneForActivityType:(id)a3;
+ (id)defaultTargetZoneForTypeKey:(id)a3;
+ (id)mapTargetZoneTypeEnumToString:(int64_t)a3;
+ (id)metadataForTargetZone:(id)a3;
+ (id)paceTargetZoneForActivityType:(id)a3;
+ (id)powerTargetZoneForActivityType:(id)a3;
+ (id)restoreFromDictionary:(id)a3;
+ (id)restoreFromDictionary:(id)a3 activityType:(id)a4;
+ (id)serializeTargetZone:(id)a3;
+ (id)targetZoneForActivityType:(id)a3 targetZoneActivityTypeKey:(id)a4;
+ (id)targetZonesFromMetadata:(id)a3;
+ (int64_t)mapTargetZoneTypeStringToEnum:(id)a3;
+ (int64_t)targetZoneMasterTypeForTargetZoneType:(int64_t)a3;
+ (void)saveTargetZone:(id)a3 forActivityType:(id)a4;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSingleThreshold;
- (NLWorkoutTargetZone)initWithType:(int64_t)a3 min:(double)a4 max:(double)a5 currentValue:(double)a6;
- (double)currentValue;
- (double)max;
- (double)min;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)stateForDistanceUnit:(id)a3;
- (unint64_t)stateForPaceZoneWithDistanceUnit:(id)a3;
- (unint64_t)stateForStandardZone;
- (void)setEnabled:(BOOL)a3;
@end

@implementation NLWorkoutTargetZone

- (NLWorkoutTargetZone)initWithType:(int64_t)a3 min:(double)a4 max:(double)a5 currentValue:(double)a6
{
  v12.receiver = self;
  v12.super_class = (Class)NLWorkoutTargetZone;
  result = [(NLWorkoutTargetZone *)&v12 init];
  if (result)
  {
    result->_type = a3;
    result->_min = a4;
    result->_max = a5;
    result->_currentValue = a6;
    BOOL v11 = a4 > 0.0 || a5 > 0.0;
    if (!a3) {
      BOOL v11 = 0;
    }
    result->_enabled = v11;
  }
  return result;
}

- (BOOL)isSingleThreshold
{
  return self->_min == self->_max;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(NLWorkoutTargetZone *)self type];
  if (v4 > 7) {
    v5 = 0;
  }
  else {
    v5 = off_2644A89A0[v4];
  }
  if ([(NLWorkoutTargetZone *)self enabled]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [(NLWorkoutTargetZone *)self min];
  uint64_t v8 = v7;
  [(NLWorkoutTargetZone *)self max];
  uint64_t v10 = v9;
  [(NLWorkoutTargetZone *)self currentValue];
  return (id)[v3 stringWithFormat:@"NLWorkoutTargetZone(type:%@ enabled:%@ min:%.06f max:%.06f current:%.06f)", v5, v6, v8, v10, v11];
}

- (unint64_t)stateForDistanceUnit:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(NLWorkoutTargetZone *)self type];
  if ((unint64_t)(v5 - 4) >= 4)
  {
    if ((unint64_t)(v5 - 1) > 2)
    {
      unint64_t v7 = 0;
      goto LABEL_6;
    }
    unint64_t v6 = [(NLWorkoutTargetZone *)self stateForPaceZoneWithDistanceUnit:v4];
  }
  else
  {
    unint64_t v6 = [(NLWorkoutTargetZone *)self stateForStandardZone];
  }
  unint64_t v7 = v6;
LABEL_6:

  return v7;
}

- (unint64_t)stateForPaceZoneWithDistanceUnit:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0A630];
  int64_t v5 = (void *)MEMORY[0x263F0A830];
  id v6 = a3;
  unint64_t v7 = [v5 meterUnit];
  [(NLWorkoutTargetZone *)self currentValue];
  uint64_t v8 = objc_msgSend(v4, "quantityWithUnit:doubleValue:", v7);

  uint64_t v9 = (void *)MEMORY[0x263F0A630];
  uint64_t v10 = [MEMORY[0x263F0A830] meterUnit];
  [(NLWorkoutTargetZone *)self min];
  uint64_t v11 = objc_msgSend(v9, "quantityWithUnit:doubleValue:", v10);

  objc_super v12 = (void *)MEMORY[0x263F0A630];
  v13 = [MEMORY[0x263F0A830] meterUnit];
  [(NLWorkoutTargetZone *)self max];
  v14 = objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);

  FIUIPace();
  double v16 = v15;
  FIUIPace();
  double v18 = v17;
  FIUIPace();
  double v20 = v19;

  [(NLWorkoutTargetZone *)self max];
  double v22 = v21;
  [(NLWorkoutTargetZone *)self min];
  if (v16 <= 2.22044605e-16)
  {
    unint64_t v24 = 0;
  }
  else if (v16 <= v18 || v23 <= 2.22044605e-16)
  {
    if (v22 > 2.22044605e-16 && v16 < v20) {
      unint64_t v24 = 3;
    }
    else {
      unint64_t v24 = 2;
    }
  }
  else
  {
    unint64_t v24 = 1;
  }

  return v24;
}

- (unint64_t)stateForStandardZone
{
  [(NLWorkoutTargetZone *)self currentValue];
  double v4 = v3;
  [(NLWorkoutTargetZone *)self max];
  double v6 = v5;
  [(NLWorkoutTargetZone *)self min];
  if (v4 <= 2.22044605e-16) {
    return 0;
  }
  if (v4 > v6 && v6 > 2.22044605e-16) {
    return 3;
  }
  if (v7 > 2.22044605e-16 && v4 < v7) {
    return 1;
  }
  else {
    return 2;
  }
}

+ (id)defaultTargetZoneForTypeKey:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PaceTargetZonesByActivityType"])
  {
    uint64_t v4 = 2;
LABEL_7:
    double v5 = [[NLWorkoutTargetZone alloc] initWithType:v4 min:0.0 max:0.0 currentValue:0.0];
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"CadenceTargetZonesByActivityType"])
  {
    uint64_t v4 = 5;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"PowerTargetZonesByActivityType"])
  {
    uint64_t v4 = 7;
    goto LABEL_7;
  }
  double v5 = 0;
LABEL_8:

  return v5;
}

+ (id)paceTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:a3 targetZoneActivityTypeKey:@"PaceTargetZonesByActivityType"];
}

+ (id)cadenceTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:a3 targetZoneActivityTypeKey:@"CadenceTargetZonesByActivityType"];
}

+ (id)powerTargetZoneForActivityType:(id)a3
{
  return +[NLWorkoutTargetZone targetZoneForActivityType:a3 targetZoneActivityTypeKey:@"PowerTargetZonesByActivityType"];
}

+ (id)targetZoneForActivityType:(id)a3 targetZoneActivityTypeKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v9 = [v8 objectForKey:v7];

  if (v9
    && ([a1 restoreFromDictionary:v9 activityType:v6],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v11 = v10;
    if ([v10 enabled])
    {
      _HKInitializeLogging();
      objc_super v12 = *MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        double v15 = v11;
        _os_log_impl(&dword_21E433000, v12, OS_LOG_TYPE_DEFAULT, "[targetzones] Pace target zone supported. Target zone: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = +[NLWorkoutTargetZone defaultTargetZoneForTypeKey:v7];
  }

  return v11;
}

+ (id)restoreFromDictionary:(id)a3 activityType:(id)a4
{
  id v5 = a3;
  id v6 = [a4 uniqueIdentifier];
  id v7 = [v5 objectForKey:v6];

  uint64_t v8 = +[NLWorkoutTargetZone restoreFromDictionary:v7];

  return v8;
}

+ (id)restoreFromDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 objectForKey:@"type"];
    uint64_t v6 = [a1 mapTargetZoneTypeStringToEnum:v5];
    id v7 = [v4 objectForKey:@"minimum"];
    [v7 doubleValue];
    double v9 = v8;

    uint64_t v10 = [v4 objectForKey:@"maximum"];
    [v10 doubleValue];
    double v12 = v11;

    v13 = [v4 objectForKey:@"enabled"];

    uint64_t v14 = [v13 isEqualToString:@"true"];
    if (v9 != v12 && v9 == 0.0) {
      double v9 = v12;
    }
    if (v9 != v12 && v12 == 0.0) {
      double v12 = v9;
    }
    double v17 = [[NLWorkoutTargetZone alloc] initWithType:v6 min:v9 max:v12 currentValue:0.0];
    [(NLWorkoutTargetZone *)v17 setEnabled:v14];
  }
  else
  {
    double v17 = 0;
  }
  return v17;
}

+ (id)serializeTargetZone:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = a3;
    id v5 = [v3 dictionary];
    uint64_t v6 = +[NLWorkoutTargetZone mapTargetZoneTypeEnumToString:](NLWorkoutTargetZone, "mapTargetZoneTypeEnumToString:", [v4 type]);
    int v7 = [v4 enabled];
    double v8 = @"false";
    if (v7) {
      double v8 = @"true";
    }
    double v9 = v8;
    [v5 setObject:v6 forKey:@"type"];
    uint64_t v10 = NSNumber;
    [v4 min];
    double v11 = objc_msgSend(v10, "numberWithDouble:");
    [v5 setObject:v11 forKey:@"minimum"];

    double v12 = NSNumber;
    [v4 max];
    double v14 = v13;

    double v15 = [v12 numberWithDouble:v14];
    [v5 setObject:v15 forKey:@"maximum"];

    [v5 setObject:v9 forKey:@"enabled"];
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v16 = (void *)[v5 copy];

  return v16;
}

+ (void)saveTargetZone:(id)a3 forActivityType:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  _HKInitializeLogging();
  int v7 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v5;
    _os_log_impl(&dword_21E433000, v7, OS_LOG_TYPE_DEFAULT, "[targetzones] Saving target zone values to defaults. zone:%@", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v8 = [v5 type];
  if ((unint64_t)(v8 - 1) <= 6)
  {
    double v9 = *off_2644A89E0[v8 - 1];
    uint64_t v10 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v11 = [v10 objectForKey:v9];
    double v12 = (void *)[v11 mutableCopy];

    if (!v12)
    {
      double v12 = [MEMORY[0x263EFF9A0] dictionary];
    }
    double v13 = +[NLWorkoutTargetZone serializeTargetZone:v5];
    double v14 = [v6 uniqueIdentifier];
    [v12 setObject:v13 forKey:v14];

    double v15 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v15 setObject:v12 forKey:v9];

    objc_msgSend(MEMORY[0x263EFFA40], "fu_backupStandardUserDefaultsKey:", v9);
  }
}

+ (int64_t)mapTargetZoneTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"rolling_pace"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"average_pace"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"instantaneous_pace"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"instantaneous_cadence"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"average_cadence"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"instantaneous_power"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"average_power"])
  {
    int64_t v4 = 7;
  }
  else
  {
    [v3 isEqualToString:@"none"];
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)mapTargetZoneTypeEnumToString:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return &stru_26CF5F1B8;
  }
  else {
    return off_2644A8A18[a3];
  }
}

+ (int64_t)targetZoneMasterTypeForTargetZoneType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 0;
  }
  else {
    return qword_21E4D9040[a3 - 1];
  }
}

+ (id)targetZonesFromMetadata:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v23 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [&unk_26CF749B0 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(&unk_26CF749B0);
        }
        unsigned int v8 = [*(id *)(*((void *)&v24 + 1) + 8 * i) intValue];
        if (v8 > 3) {
          double v9 = 0;
        }
        else {
          double v9 = off_2644A8A58[v8];
        }
        uint64_t v10 = [v3 objectForKeyedSubscript:v9];
        double v11 = v10;
        if (v10)
        {
          double v12 = [v10 objectForKeyedSubscript:@"_HKPrivateWorkoutTargetZoneMin"];
          [v12 doubleValue];
          double v14 = v13;

          double v15 = [v11 objectForKeyedSubscript:@"_HKPrivateWorkoutTargetZoneMax"];
          [v15 doubleValue];
          double v17 = v16;

          uint64_t v18 = [v11 objectForKeyedSubscript:@"_HKPrivateWorkoutTargetZoneType"];
          int64_t v19 = +[NLWorkoutTargetZone mapTargetZoneTypeStringToEnum:v18];

          if ((unint64_t)(v19 - 1) <= 6)
          {
            double v20 = [[NLWorkoutTargetZone alloc] initWithType:v19 min:v14 max:v17 currentValue:0.0];
            if (v20)
            {
              double v21 = v20;
              [v23 addObject:v20];
            }
          }
        }
      }
      uint64_t v5 = [&unk_26CF749B0 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }

  return v23;
}

+ (id)metadataForTargetZone:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  unint64_t v4 = +[NLWorkoutTargetZone targetZoneMasterTypeForTargetZoneType:](NLWorkoutTargetZone, "targetZoneMasterTypeForTargetZoneType:", [v3 type]);
  if (v4 > 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = off_2644A8A58[v4];
  }
  double v17 = v5;
  v15[0] = @"_HKPrivateWorkoutTargetZoneMin";
  uint64_t v6 = NSNumber;
  [v3 min];
  int v7 = objc_msgSend(v6, "numberWithDouble:");
  v16[0] = v7;
  v15[1] = @"_HKPrivateWorkoutTargetZoneMax";
  unsigned int v8 = NSNumber;
  [v3 max];
  double v9 = objc_msgSend(v8, "numberWithDouble:");
  v16[1] = v9;
  v15[2] = @"_HKPrivateWorkoutTargetZoneType";
  uint64_t v10 = [v3 type];

  double v11 = +[NLWorkoutTargetZone mapTargetZoneTypeEnumToString:v10];
  v16[2] = v11;
  double v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[0] = v12;
  double v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];

  return v13;
}

- (unint64_t)hash
{
  return self->_type ^ (unint64_t)self->_min ^ (unint64_t)self->_max ^ (unint64_t)self->_currentValue;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (NLWorkoutTargetZone *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      int64_t type = self->_type;
      if (type == [(NLWorkoutTargetZone *)v5 type]
        && (double min = self->_min, [(NLWorkoutTargetZone *)v5 min], min == v8)
        && (double max = self->_max, [(NLWorkoutTargetZone *)v5 max], max == v10))
      {
        double currentValue = self->_currentValue;
        [(NLWorkoutTargetZone *)v5 currentValue];
        BOOL v13 = currentValue == v12;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (double)min
{
  return self->_min;
}

- (double)max
{
  return self->_max;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end