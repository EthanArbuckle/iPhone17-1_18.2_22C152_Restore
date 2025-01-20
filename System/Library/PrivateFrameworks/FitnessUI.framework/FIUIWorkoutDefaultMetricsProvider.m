@interface FIUIWorkoutDefaultMetricsProvider
+ (BOOL)operatingSystemVersion:(id *)a3 atLeastVersion:(id *)a4;
+ (int64_t)metricsVersionForWorkout:(id)a3;
+ (void)initialize;
- (BOOL)isMetricTypeSupported:(unint64_t)a3 isMachineWorkout:(BOOL)a4 activityType:(id)a5;
- (FIUIWorkoutDefaultMetricsProvider)initWithMetricsVersion:(int64_t)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 deviceSupportsElevationMetrics:(BOOL)a6 deviceSupportsGroundElevationMetrics:(BOOL)a7;
- (NSArray)defaultEnabledMetrics;
- (NSArray)defaultSecondPlatterMetrics;
- (NSArray)supportedMetrics;
- (id)_defaultEnabledMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4;
- (id)_defaultEnabledMetricsForSwimmingWithLocationType:(int64_t)a3 metricsVersion:(int64_t)a4;
- (id)_defaultEnabledSecondPlatterMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4;
- (id)_defaultGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3;
- (id)_defaultGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4;
- (id)_defaultMoonstoneIndoorEnabledMetricsForActivityType:(unint64_t)a3;
- (id)_defaultMoonstoneOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4;
- (id)_defaultOutdoorEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4 supportsElevationMetrics:(BOOL)a5;
- (id)_defaultPreGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3;
- (id)_defaultPreGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3;
- (id)_indoorDefaultEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4;
- (id)_machineProvidedMetricsForActivityType:(id)a3;
- (id)_standardSupportedMetricsWithMetricsVersion:(int64_t)a3;
- (id)_supportedMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4;
- (id)appendMachineMetricsToMetrics:(id)a3 maxNumMetrics:(int64_t)a4 activityType:(id)a5;
- (id)removeUnsupportedFitnessJuniorMetricsFrom:(id)a3;
- (id)supportedMetricsWithIsMachineWorkout:(BOOL)a3 activityType:(id)a4;
- (int64_t)metricsVersion;
- (void)_updateSupportedMetrics;
@end

@implementation FIUIWorkoutDefaultMetricsProvider

- (FIUIWorkoutDefaultMetricsProvider)initWithMetricsVersion:(int64_t)a3 activityType:(id)a4 activityMoveMode:(int64_t)a5 deviceSupportsElevationMetrics:(BOOL)a6 deviceSupportsGroundElevationMetrics:(BOOL)a7
{
  id v13 = a4;
  v23.receiver = self;
  v23.super_class = (Class)FIUIWorkoutDefaultMetricsProvider;
  v14 = [(FIUIWorkoutDefaultMetricsProvider *)&v23 init];
  v15 = v14;
  if (v14)
  {
    v14->_metricsVersion = a3;
    objc_storeStrong((id *)&v14->_activityType, a4);
    v15->_activityMoveMode = a5;
    v15->_supportsElevationMetrics = a6;
    v15->_supportsGroundElevationMetrics = a7;
    uint64_t v16 = [(FIUIWorkoutDefaultMetricsProvider *)v15 _defaultEnabledMetricsForActivityType:v15->_activityType metricsVersion:v15->_metricsVersion];
    defaultEnabledMetrics = v15->_defaultEnabledMetrics;
    v15->_defaultEnabledMetrics = (NSArray *)v16;

    uint64_t v18 = [(FIUIWorkoutDefaultMetricsProvider *)v15 _defaultEnabledSecondPlatterMetricsForActivityType:v15->_activityType metricsVersion:v15->_metricsVersion];
    defaultSecondPlatterMetrics = v15->_defaultSecondPlatterMetrics;
    v15->_defaultSecondPlatterMetrics = (NSArray *)v18;

    [(FIUIWorkoutDefaultMetricsProvider *)v15 _updateSupportedMetrics];
    v20 = [MEMORY[0x263F08A00] defaultCenter];
    v21 = +[FIUIBluetoothSensorLookup didUpdateBTSensorSeenStatus];
    [v20 addObserver:v15 selector:sel__didUpdateBTSensorSeenStatus_ name:v21 object:0];
  }
  return v15;
}

- (id)_defaultEnabledMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  id v6 = a3;
  if ([v6 effectiveTypeIdentifier] == 46)
  {
    uint64_t v7 = -[FIUIWorkoutDefaultMetricsProvider _defaultEnabledMetricsForSwimmingWithLocationType:metricsVersion:](self, "_defaultEnabledMetricsForSwimmingWithLocationType:metricsVersion:", [v6 swimmingLocationType], a4);
LABEL_6:
    v8 = (void *)v7;
    goto LABEL_7;
  }
  if (![v6 isIndoor]
    || (-[FIUIWorkoutDefaultMetricsProvider _indoorDefaultEnabledMetricsForActivityType:metricsVersion:](self, "_indoorDefaultEnabledMetricsForActivityType:metricsVersion:", [v6 effectiveTypeIdentifier], a4), (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v7 = -[FIUIWorkoutDefaultMetricsProvider _defaultOutdoorEnabledMetricsForActivityType:metricsVersion:supportsElevationMetrics:](self, "_defaultOutdoorEnabledMetricsForActivityType:metricsVersion:supportsElevationMetrics:", [v6 effectiveTypeIdentifier], a4, self->_supportsElevationMetrics);
    goto LABEL_6;
  }
LABEL_7:
  v9 = [(FIUIWorkoutDefaultMetricsProvider *)self removeUnsupportedFitnessJuniorMetricsFrom:v8];

  return v9;
}

- (id)_defaultEnabledSecondPlatterMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  v5 = +[FIUIDefaultSecondPlatterMetrics metricsForActivityType:a3 metricsVersion:a4];
  id v6 = [(FIUIWorkoutDefaultMetricsProvider *)self removeUnsupportedFitnessJuniorMetricsFrom:v5];

  return v6;
}

- (id)removeUnsupportedFitnessJuniorMetricsFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_activityMoveMode == 2)
  {
    id v6 = (void *)[v4 mutableCopy];
    [v6 removeObjectsInArray:&unk_26CF749F8];

    v5 = v6;
  }
  return v5;
}

- (id)_defaultEnabledMetricsForSwimmingWithLocationType:(int64_t)a3 metricsVersion:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a4 - 2) >= 5)
  {
    if (!a4 && (unint64_t)a3 < 3)
    {
      v5 = &unk_2644A8B68;
      return (id)v5[a3];
    }
  }
  else if ((unint64_t)a3 < 3)
  {
    v5 = &unk_2644A8B50;
    return (id)v5[a3];
  }
  _HKInitializeLogging();
  uint64_t v7 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    v8 = NSNumber;
    v9 = v7;
    v10 = [v8 numberWithInteger:a3];
    int v11 = 138412290;
    v12 = v10;
    _os_log_impl(&dword_21E433000, v9, OS_LOG_TYPE_DEFAULT, "Can't find default Glory metrics for swimming workout with location type %@", (uint8_t *)&v11, 0xCu);
  }
  return 0;
}

- (id)_indoorDefaultEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4
{
  if ((unint64_t)(a4 - 2) >= 4)
  {
    if (a4)
    {
      if (a4 == 6)
      {
        id v4 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultMoonstoneIndoorEnabledMetricsForActivityType:a3];
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      id v4 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultPreGloryIndoorEnabledMetricsForActivityType:a3];
    }
  }
  else
  {
    id v4 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultGloryIndoorEnabledMetricsForActivityType:a3];
  }
  return v4;
}

- (id)_defaultMoonstoneIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if (a3 <= 0x29 && ((1 << a3) & 0x28800000000) != 0)
    {
      v5 = &unk_26CF74A70;
    }
    else
    {
      v5 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultGloryIndoorEnabledMetricsForActivityType:a3];
      if (!v5)
      {
        _HKInitializeLogging();
        v8 = (void *)*MEMORY[0x263F09970];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
        {
          v9 = NSNumber;
          v10 = v8;
          int v11 = [v9 numberWithUnsignedInteger:a3];
          int v12 = 138412290;
          uint64_t v13 = v11;
          _os_log_impl(&dword_21E433000, v10, OS_LOG_TYPE_DEFAULT, "Can't find default Moonstone metrics for indoor workout of type %@", (uint8_t *)&v12, 0xCu);
        }
        v5 = 0;
      }
    }
  }
  else
  {
    v5 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultGloryIndoorEnabledMetricsForActivityType:a3];
  }
  id v6 = v5;

  return v6;
}

- (id)_defaultGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id result = &unk_26CF74A88;
  if (a3 != 52 && a3 != 37)
  {
    if (a3 == 13)
    {
      return &unk_26CF74AA0;
    }
    else
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = NSNumber;
        uint64_t v7 = v5;
        v8 = [v6 numberWithUnsignedInteger:a3];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_21E433000, v7, OS_LOG_TYPE_DEFAULT, "Can't find default Glory metrics for indoor workout of type %@", (uint8_t *)&v9, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

- (id)_defaultPreGloryIndoorEnabledMetricsForActivityType:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id result = &unk_26CF74AB8;
  if (a3 != 52 && a3 != 37)
  {
    if (a3 == 13)
    {
      return &unk_26CF74AD0;
    }
    else
    {
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x263F09970];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
      {
        id v6 = NSNumber;
        uint64_t v7 = v5;
        v8 = [v6 numberWithUnsignedInteger:a3];
        int v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_21E433000, v7, OS_LOG_TYPE_DEFAULT, "Can't find default Pre-Glory metrics for indoor workout of type %@", (uint8_t *)&v9, 0xCu);
      }
      return 0;
    }
  }
  return result;
}

- (id)_defaultOutdoorEnabledMetricsForActivityType:(unint64_t)a3 metricsVersion:(int64_t)a4 supportsElevationMetrics:(BOOL)a5
{
  if ((unint64_t)(a4 - 2) >= 4)
  {
    if (a4)
    {
      if (a4 == 6)
      {
        v5 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultMoonstoneOutdoorEnabledMetricsForActivityType:a3 supportsElevationMetrics:a5];
      }
      else
      {
        v5 = 0;
      }
    }
    else
    {
      v5 = -[FIUIWorkoutDefaultMetricsProvider _defaultPreGloryOutdoorEnabledMetricsForActivityType:](self, "_defaultPreGloryOutdoorEnabledMetricsForActivityType:", a3, 0, a5);
    }
  }
  else
  {
    v5 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultGloryOutdoorEnabledMetricsForActivityType:a3 supportsElevationMetrics:a5];
  }
  return v5;
}

- (id)_defaultGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4
{
  if ((uint64_t)a3 > 51)
  {
    if (a3 - 70 >= 2)
    {
      if (a3 == 52) {
        return &unk_26CF74B60;
      }
      return &unk_26CF74BA8;
    }
    v5 = &unk_26CF74B48;
    id v6 = &unk_26CF74B30;
  }
  else
  {
    switch(a3)
    {
      case 0xDuLL:
        v5 = &unk_26CF74B00;
        id v6 = &unk_26CF74AE8;
        break;
      case 0x18uLL:
        v5 = &unk_26CF74B90;
        id v6 = &unk_26CF74B78;
        break;
      case 0x25uLL:
        return &unk_26CF74B18;
      default:
        return &unk_26CF74BA8;
    }
  }
  if (a4) {
    return v6;
  }
  else {
    return v5;
  }
}

- (id)_defaultMoonstoneOutdoorEnabledMetricsForActivityType:(unint64_t)a3 supportsElevationMetrics:(BOOL)a4
{
  BOOL v4 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    goto LABEL_17;
  }
  if ((uint64_t)a3 > 59)
  {
    if ((uint64_t)a3 > 66)
    {
      if (a3 == 75) {
        goto LABEL_5;
      }
      if (a3 != 67)
      {
LABEL_17:
        uint64_t v7 = [(FIUIWorkoutDefaultMetricsProvider *)self _defaultGloryOutdoorEnabledMetricsForActivityType:a3 supportsElevationMetrics:v4];
        goto LABEL_18;
      }
    }
    else
    {
      if (a3 == 60)
      {
        uint64_t v7 = &unk_26CF74BC0;
        goto LABEL_18;
      }
      if (a3 != 61) {
        goto LABEL_17;
      }
    }
    uint64_t v7 = &unk_26CF74BD8;
    goto LABEL_18;
  }
  if ((uint64_t)a3 <= 24)
  {
    if (a3 != 1 && a3 != 3)
    {
      if (a3 == 21)
      {
        uint64_t v7 = &unk_26CF74C20;
        goto LABEL_18;
      }
      goto LABEL_17;
    }
LABEL_5:
    uint64_t v7 = &unk_26CF74C50;
    goto LABEL_18;
  }
  switch(a3)
  {
    case 0x19uLL:
    case 0x1BuLL:
    case 0x24uLL:
    case 0x29uLL:
      goto LABEL_5;
    case 0x1FuLL:
      uint64_t v7 = &unk_26CF74BF0;
      break;
    case 0x23uLL:
      uint64_t v7 = &unk_26CF74C08;
      break;
    case 0x27uLL:
      uint64_t v7 = &unk_26CF74C38;
      break;
    default:
      goto LABEL_17;
  }
LABEL_18:
  id v8 = v7;

  return v8;
}

- (id)_defaultPreGloryOutdoorEnabledMetricsForActivityType:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ((uint64_t)a3 > 36)
  {
    char v4 = a3 - 44;
    if (a3 - 44 <= 0x1B)
    {
      if (((1 << v4) & 0x82001) != 0) {
        return &unk_26CF74CC8;
      }
      if (((1 << v4) & 0xC000000) != 0) {
        return &unk_26CF74C98;
      }
      if (a3 == 52) {
        return &unk_26CF74CB0;
      }
    }
    if (a3 != 3000)
    {
      if (a3 == 37) {
        return &unk_26CF74C80;
      }
      goto LABEL_18;
    }
    return &unk_26CF74CC8;
  }
  if (a3 == 13) {
    return &unk_26CF74C68;
  }
  if (a3 == 16 || a3 == 35) {
    return &unk_26CF74CC8;
  }
LABEL_18:
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSNumber;
    id v8 = v6;
    int v9 = [v7 numberWithUnsignedInteger:a3];
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_21E433000, v8, OS_LOG_TYPE_DEFAULT, "Can't find metrics for outdoor/unspecified workout of type %@", (uint8_t *)&v10, 0xCu);
  }
  return 0;
}

- (void)_updateSupportedMetrics
{
  _HKInitializeLogging();
  v3 = *MEMORY[0x263F09970];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_21E433000, v3, OS_LOG_TYPE_DEFAULT, "Updating supported metrics", v6, 2u);
  }
  char v4 = [(FIUIWorkoutDefaultMetricsProvider *)self _supportedMetricsForActivityType:self->_activityType metricsVersion:self->_metricsVersion];
  supportedMetrics = self->_supportedMetrics;
  self->_supportedMetrics = v4;
}

- (id)_supportedMetricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [v6 effectiveTypeIdentifier];
  if (v7 > 51)
  {
    switch(v7)
    {
      case '<':
        id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
        if (a4 < 6 || !_os_feature_enabled_impl()) {
          goto LABEL_101;
        }
        int v10 = &unk_26CF74EA8;
        goto LABEL_23;
      case '=':
      case 'C':
        id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
        if (a4 < 6 || !_os_feature_enabled_impl()) {
          goto LABEL_101;
        }
        int v10 = &unk_26CF74F50;
        goto LABEL_23;
      case '>':
      case '?':
      case '@':
      case 'A':
      case 'B':
      case 'D':
      case 'E':
        goto LABEL_65;
      case 'F':
      case 'G':
        if ([v6 isIndoor])
        {
          id v8 = &unk_26CF74DB8;
        }
        else
        {
          id v8 = [&unk_26CF74DB8 arrayByAddingObject:&unk_26CF757F0];
        }
        if (([v6 isIndoor] & 1) == 0 && self->_supportsGroundElevationMetrics)
        {
          uint64_t v14 = [v8 arrayByAddingObject:&unk_26CF75970];

          id v8 = (void *)v14;
        }
        if (a4 < 4) {
          goto LABEL_101;
        }
        uint64_t v13 = &unk_26CF74DD0;
        goto LABEL_45;
      default:
        if (v7 == 52)
        {
LABEL_27:
          if (([v6 isIndoor] & 1) != 0 || !self->_supportsElevationMetrics)
          {
            id v8 = &unk_26CF74D88;
          }
          else
          {
            id v8 = [&unk_26CF74D88 arrayByAddingObject:&unk_26CF757F0];
          }
          if (([v6 isIndoor] & 1) == 0 && self->_supportsGroundElevationMetrics)
          {
            uint64_t v12 = [v8 arrayByAddingObject:&unk_26CF75970];

            id v8 = (void *)v12;
          }
          if (a4 >= 4)
          {
            uint64_t v13 = &unk_26CF74DA0;
LABEL_45:
            v15 = [v8 arrayByAddingObjectsFromArray:v13];

            if (a4 == 4)
            {
LABEL_85:
              id v8 = v15;
            }
            else
            {
LABEL_79:
              id v8 = [v15 arrayByAddingObject:&unk_26CF75958];
            }
          }
          goto LABEL_101;
        }
        if (v7 != 75) {
          goto LABEL_65;
        }
        break;
    }
  }
  else
  {
    if (v7 > 20)
    {
      switch(v7)
      {
        case 21:
          id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
          if (a4 < 6 || !_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74EF0;
          goto LABEL_23;
        case 24:
          goto LABEL_27;
        case 25:
        case 41:
          id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
          char v9 = [v6 isIndoor];
          if (a4 < 6 || (v9 & 1) != 0 || !_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74F20;
          goto LABEL_23;
        case 27:
        case 36:
          goto LABEL_20;
        case 31:
          id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
          if (a4 < 6 || !_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74ED8;
          goto LABEL_23;
        case 35:
          id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
          char v16 = [v6 isIndoor];
          if (a4 < 6 || (v16 & 1) != 0 || !_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74EC0;
          goto LABEL_23;
        case 37:
          if (a4 < 2)
          {
            id v8 = &unk_26CF74DE8;
          }
          else
          {
            id v8 = [&unk_26CF74DE8 arrayByAddingObjectsFromArray:&unk_26CF74E00];
          }
          if (([v6 isIndoor] & 1) == 0 && self->_supportsElevationMetrics)
          {
            uint64_t v18 = [v8 arrayByAddingObject:&unk_26CF757F0];

            id v8 = (void *)v18;
          }
          if (([v6 isIndoor] & 1) == 0 && self->_supportsGroundElevationMetrics)
          {
            uint64_t v19 = [v8 arrayByAddingObject:&unk_26CF75970];

            id v8 = (void *)v19;
          }
          if (a4 < 4) {
            goto LABEL_101;
          }
          v15 = [v8 arrayByAddingObjectsFromArray:&unk_26CF74E18];

          if (([v6 isIndoor] & 1) == 0
            && [MEMORY[0x263F017A8] isRunningFormAvailable]
            && self->_activityMoveMode == 1)
          {
            uint64_t v20 = [v15 arrayByAddingObjectsFromArray:&unk_26CF74E30];

            v15 = (void *)v20;
          }
          if ((unint64_t)a4 >= 5) {
            goto LABEL_79;
          }
          goto LABEL_85;
        case 39:
          id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
          char v17 = [v6 isIndoor];
          if (a4 < 6 || (v17 & 1) != 0 || !_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74F38;
          goto LABEL_23;
        case 46:
          if ([v6 swimmingLocationType] == 1)
          {
            id v8 = [&unk_26CF74E48 arrayByAddingObject:&unk_26CF75790];
          }
          else
          {
            id v8 = &unk_26CF74E48;
          }
          if (a4 < 4) {
            goto LABEL_101;
          }
          v15 = [v8 arrayByAddingObjectsFromArray:&unk_26CF74E60];

          if ((unint64_t)a4 < 6) {
            goto LABEL_85;
          }
          id v8 = [v15 arrayByAddingObjectsFromArray:&unk_26CF74E78];

          if (!_os_feature_enabled_impl()) {
            goto LABEL_101;
          }
          int v10 = &unk_26CF74E90;
          break;
        default:
          goto LABEL_65;
      }
      goto LABEL_23;
    }
    if (v7 != 1 && v7 != 3)
    {
      if (v7 == 13)
      {
        if ([v6 isIndoor])
        {
          if (a4 < 4)
          {
            id v8 = &unk_26CF74CE0;
            goto LABEL_105;
          }
          id v8 = [&unk_26CF74CE0 arrayByAddingObjectsFromArray:&unk_26CF74CF8];
        }
        else
        {
          if (a4 < 4)
          {
            id v8 = &unk_26CF74D10;
          }
          else
          {
            v21 = [&unk_26CF74D10 arrayByAddingObjectsFromArray:&unk_26CF74D28];
            id v8 = v21;
            if (a4 != 4)
            {
              uint64_t v22 = [v21 arrayByAddingObject:&unk_26CF75958];

              id v8 = (void *)v22;
            }
          }
          if (self->_supportsElevationMetrics)
          {
            uint64_t v23 = [v8 arrayByAddingObject:&unk_26CF757F0];

            id v8 = (void *)v23;
          }
          if (self->_supportsGroundElevationMetrics)
          {
            uint64_t v24 = [v8 arrayByAddingObject:&unk_26CF75970];

            id v8 = (void *)v24;
          }
        }
        if (a4 >= 5)
        {
          uint64_t v11 = [v8 arrayByAddingObjectsFromArray:&unk_26CF74D40];

          if (_os_feature_enabled_impl())
          {
            uint64_t v25 = [v11 arrayByAddingObjectsFromArray:&unk_26CF74D58];

            uint64_t v11 = (void *)v25;
          }
          if (![v6 isIndoor]
            || !+[FIUIBluetoothSensorLookup hasHadPairedCyclingSpeedSensors])
          {
            goto LABEL_24;
          }
          id v8 = [v11 arrayByAddingObjectsFromArray:&unk_26CF74D70];
        }
      }
      else
      {
LABEL_65:
        id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
      }
      goto LABEL_101;
    }
  }
LABEL_20:
  id v8 = [(FIUIWorkoutDefaultMetricsProvider *)self _standardSupportedMetricsWithMetricsVersion:a4];
  if (a4 >= 6 && _os_feature_enabled_impl())
  {
    int v10 = &unk_26CF74F08;
LABEL_23:
    uint64_t v11 = [v8 arrayByAddingObjectsFromArray:v10];

LABEL_24:
    id v8 = v11;
  }
LABEL_101:
  if (!v8)
  {
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_DEFAULT))
    {
      v27 = NSNumber;
      v28 = v26;
      v29 = objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v6, "effectiveTypeIdentifier"));
      int v32 = 138412290;
      v33 = v29;
      _os_log_impl(&dword_21E433000, v28, OS_LOG_TYPE_DEFAULT, "Can't find supported metrics for workout of type %@", (uint8_t *)&v32, 0xCu);
    }
    id v8 = 0;
  }
LABEL_105:
  if (self->_activityMoveMode == 2)
  {
    v30 = (void *)[v8 mutableCopy];
    [v30 removeObjectsInArray:&unk_26CF74F68];

    id v8 = v30;
  }

  return v8;
}

- (id)_standardSupportedMetricsWithMetricsVersion:(int64_t)a3
{
  if (a3 < 4)
  {
    v5 = &unk_26CF74F80;
  }
  else
  {
    v5 = objc_msgSend(&unk_26CF74F80, "arrayByAddingObjectsFromArray:", &unk_26CF74F98, v3);
  }
  return v5;
}

- (id)_machineProvidedMetricsForActivityType:(id)a3
{
  uint64_t v3 = [a3 effectiveTypeIdentifier];
  if (v3 <= 36)
  {
    v5 = &unk_26CF74FF8;
    if (v3 != 16) {
      v5 = 0;
    }
    if (v3 == 13) {
      return &unk_26CF74FE0;
    }
    else {
      return v5;
    }
  }
  else
  {
    switch(v3)
    {
      case '4':
        return &unk_26CF74FB0;
      case ',':
        return &unk_26CF74FC8;
      case '%':
        return &unk_26CF74FB0;
      default:
        return 0;
    }
  }
}

- (id)appendMachineMetricsToMetrics:(id)a3 maxNumMetrics:(int64_t)a4 activityType:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [(FIUIWorkoutDefaultMetricsProvider *)self _machineProvidedMetricsForActivityType:v9];
  if ([v8 count] < (unint64_t)a4)
  {
    while (1)
    {
      uint64_t v11 = [v10 count];
      if (!v8 || !v11) {
        break;
      }
      uint64_t v12 = [v10 firstObject];
      if (([v8 containsObject:v12] & 1) == 0)
      {
        uint64_t v13 = [v8 arrayByAddingObject:v12];

        id v8 = (id)v13;
      }
      uint64_t v14 = objc_msgSend(v10, "subarrayWithRange:", 1, objc_msgSend(v10, "count") - 1);

      int v10 = v14;
      if ([v8 count] >= (unint64_t)a4) {
        goto LABEL_9;
      }
    }
  }
  uint64_t v14 = v10;
LABEL_9:
  id v15 = v8;

  return v15;
}

- (BOOL)isMetricTypeSupported:(unint64_t)a3 isMachineWorkout:(BOOL)a4 activityType:(id)a5
{
  id v6 = [(FIUIWorkoutDefaultMetricsProvider *)self supportedMetricsWithIsMachineWorkout:a4 activityType:a5];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  char v8 = [v6 containsObject:v7];

  return v8;
}

- (id)supportedMetricsWithIsMachineWorkout:(BOOL)a3 activityType:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = [(FIUIWorkoutDefaultMetricsProvider *)self supportedMetrics];
  if (v4)
  {
    uint64_t v8 = [(FIUIWorkoutDefaultMetricsProvider *)self appendMachineMetricsToMetrics:v7 maxNumMetrics:0x7FFFFFFFLL activityType:v6];

    uint64_t v7 = (void *)v8;
  }

  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    HKNSOperatingSystemVersionFromString();
    moonstoneVersion = v2;
    qword_267D30358 = v3;
    HKNSOperatingSystemVersionFromString();
    velocityVersion = v2;
    qword_267D30370 = v3;
    HKNSOperatingSystemVersionFromString();
    boltVersion = v2;
    qword_267D30388 = v3;
    HKNSOperatingSystemVersionFromString();
    gloryCVersion = v2;
    qword_267D303A0 = v3;
    HKNSOperatingSystemVersionFromString();
    gloryVersion = v2;
    qword_267D303B8 = v3;
  }
}

+ (int64_t)metricsVersionForWorkout:(id)a3
{
  long long v21 = 0uLL;
  uint64_t v22 = 0;
  BOOL v4 = [a3 sourceRevision];
  v5 = v4;
  if (v4)
  {
    [v4 operatingSystemVersion];
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  FIEffectiveOperatingSystemVersion();

  long long v16 = v21;
  uint64_t v17 = v22;
  long long v14 = moonstoneVersion;
  uint64_t v15 = qword_267D30358;
  int v6 = [a1 operatingSystemVersion:&v16 atLeastVersion:&v14];
  long long v16 = v21;
  uint64_t v17 = v22;
  long long v14 = velocityVersion;
  uint64_t v15 = qword_267D30370;
  int v7 = [a1 operatingSystemVersion:&v16 atLeastVersion:&v14];
  long long v16 = v21;
  uint64_t v17 = v22;
  long long v14 = boltVersion;
  uint64_t v15 = qword_267D30388;
  int v8 = [a1 operatingSystemVersion:&v16 atLeastVersion:&v14];
  long long v16 = v21;
  uint64_t v17 = v22;
  long long v14 = gloryCVersion;
  uint64_t v15 = qword_267D303A0;
  int v9 = [a1 operatingSystemVersion:&v16 atLeastVersion:&v14];
  long long v16 = v21;
  uint64_t v17 = v22;
  long long v14 = gloryVersion;
  uint64_t v15 = qword_267D303B8;
  int v10 = [a1 operatingSystemVersion:&v16 atLeastVersion:&v14];
  int64_t v11 = 4;
  if (v7) {
    int64_t v11 = 5;
  }
  if (v6) {
    int64_t v11 = 6;
  }
  int64_t v12 = 2;
  if (!v10) {
    int64_t v12 = 0;
  }
  if (v9) {
    int64_t v12 = 3;
  }
  if (v6 | v7 | v8) {
    return v11;
  }
  else {
    return v12;
  }
}

+ (BOOL)operatingSystemVersion:(id *)a3 atLeastVersion:(id *)a4
{
  return (unint64_t)(HKNSOperatingSystemVersionCompare() + 1) < 2;
}

- (int64_t)metricsVersion
{
  return self->_metricsVersion;
}

- (NSArray)defaultEnabledMetrics
{
  return self->_defaultEnabledMetrics;
}

- (NSArray)defaultSecondPlatterMetrics
{
  return self->_defaultSecondPlatterMetrics;
}

- (NSArray)supportedMetrics
{
  return self->_supportedMetrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMetrics, 0);
  objc_storeStrong((id *)&self->_defaultSecondPlatterMetrics, 0);
  objc_storeStrong((id *)&self->_defaultEnabledMetrics, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end