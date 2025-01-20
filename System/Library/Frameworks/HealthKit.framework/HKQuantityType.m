@interface HKQuantityType
+ (id)_quantityTypeWithCode:(int64_t)a3;
- (BOOL)isCompatibleWithUnit:(HKUnit *)unit;
- (BOOL)supportsStatisticOptions:(unint64_t)a3;
- (HKQuantityAggregationStyle)aggregationStyle;
- (HKQuantityType)initWithIdentifier:(id)a3;
- (HKUnit)canonicalUnit;
- (_HKDimension)dimension;
- (id)_initWithCode:(int64_t)a3;
- (id)defaultUnitForLocale:(id)a3 version:(int64_t)a4;
- (void)validateUnit:(id)a3;
- (void)validateUnitForStatistic:(id)a3;
- (void)validateUnitFromString:(id)a3;
@end

@implementation HKQuantityType

- (void).cxx_destruct
{
}

- (HKUnit)canonicalUnit
{
  p_canonicalUnitLock = &self->_canonicalUnitLock;
  os_unfair_lock_lock(&self->_canonicalUnitLock);
  if (!self->_canonicalUnit)
  {
    v4 = +[HKUnit unitFromString:(void)[(HKObjectType *)self _definition][24]];
    canonicalUnit = self->_canonicalUnit;
    self->_canonicalUnit = v4;
  }
  os_unfair_lock_unlock(p_canonicalUnitLock);
  v6 = self->_canonicalUnit;

  return v6;
}

- (BOOL)isCompatibleWithUnit:(HKUnit *)unit
{
  v4 = unit;
  v5 = [(HKQuantityType *)self canonicalUnit];
  char v6 = [v5 _isCompatibleWithUnit:v4];

  return v6;
}

- (HKQuantityAggregationStyle)aggregationStyle
{
  return (uint64_t)(char)[(HKObjectType *)self _definition][42];
}

- (id)defaultUnitForLocale:(id)a3 version:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(HKObjectType *)self code];
  if (v7 <= 255)
  {
    switch(v7)
    {
      case 2:
        v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
        int v18 = [v10 BOOLValue];
        if (v18
          && ([v6 localeIdentifier],
              v4 = objc_claimAutoreleasedReturnValue(),
              ([v4 isEqual:@"en_GB"] & 1) == 0))
        {
          v15 = +[HKUnit meterUnitWithMetricPrefix:5];
        }
        else
        {
          v15 = +[HKUnit footUnit];
          if (!v18) {
            goto LABEL_39;
          }
        }

        break;
      case 3:
      case 4:
        v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
        int v11 = [v10 BOOLValue];
        v12 = @"lb";
        v13 = @"kg";
        goto LABEL_35;
      case 5:
      case 61:
        v8 = @"count/min";
        goto LABEL_10;
      case 6:
      case 7:
      case 11:
      case 12:
      case 13:
      case 14:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 26:
      case 27:
      case 28:
      case 30:
      case 57:
      case 59:
      case 60:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 79:
      case 80:
      case 81:
      case 82:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 111:
      case 112:
        goto LABEL_29;
      case 8:
      case 83:
      case 113:
        goto LABEL_8;
      case 9:
      case 10:
      case 29:
        uint64_t v14 = _HKEnergyUnitForLocale(v6);
        goto LABEL_11;
      case 15:
        uint64_t v14 = _HKBloodGlucoseUnitForLocale(v6);
        goto LABEL_11;
      case 24:
      case 25:
      case 32:
      case 34:
      case 36:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 45:
      case 46:
      case 48:
      case 49:
      case 51:
      case 52:
      case 55:
      case 56:
      case 78:
        v8 = @"mg";
        goto LABEL_10;
      case 31:
      case 33:
      case 35:
      case 37:
      case 43:
      case 44:
      case 47:
      case 50:
      case 53:
      case 54:
        v8 = @"mcg";
        goto LABEL_10;
      case 58:
        v8 = @"mcS";
        goto LABEL_10;
      case 62:
      case 90:
        goto LABEL_27;
      case 89:
        v8 = @"count";
        goto LABEL_10;
      case 110:
        v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
        int v11 = [v10 BOOLValue];
        v12 = @"yd";
        goto LABEL_34;
      case 114:
LABEL_21:
        v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
        int v11 = [v10 BOOLValue];
        v12 = @"in";
        v13 = @"cm";
        goto LABEL_35;
      default:
        switch(v7)
        {
          case 187:
            goto LABEL_18;
          case 188:
            goto LABEL_21;
          case 189:
          case 190:
          case 191:
          case 192:
          case 193:
          case 194:
            goto LABEL_29;
          case 195:
          case 196:
            v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
            int v11 = [v10 BOOLValue];
            v12 = @"ft/s";
            v13 = @"m/s";
            goto LABEL_35;
          case 197:
            v8 = @"hr";
            goto LABEL_10;
          default:
            if (v7 != 138) {
              goto LABEL_29;
            }
            goto LABEL_8;
        }
    }
    goto LABEL_39;
  }
  if (v7 <= 276)
  {
    if (v7 == 256)
    {
LABEL_27:
      v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
      int v11 = [v10 BOOLValue];
      v12 = @"degF";
      v13 = @"degC";
      goto LABEL_35;
    }
    if (v7 == 269)
    {
      v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
      int v11 = [v10 BOOLValue];
      v12 = @"ft";
LABEL_34:
      v13 = @"m";
      goto LABEL_35;
    }
    if (v7 != 274)
    {
LABEL_29:
      uint64_t v14 = [(HKQuantityType *)self canonicalUnit];
LABEL_11:
      v15 = (void *)v14;
      goto LABEL_40;
    }
    goto LABEL_18;
  }
  char v9 = v7 - 25;
  if ((unint64_t)(v7 - 281) > 0x16) {
    goto LABEL_26;
  }
  if (((1 << v9) & 0x700001) != 0)
  {
LABEL_18:
    v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
    int v11 = [v10 BOOLValue];
    v12 = @"mi/hr";
    v13 = @"km/hr";
    goto LABEL_35;
  }
  if (((1 << v9) & 0x1A000) == 0)
  {
    if (v7 == 295)
    {
      v8 = @"km";
LABEL_10:
      uint64_t v14 = +[HKUnit unitFromString:v8];
      goto LABEL_11;
    }
LABEL_26:
    if (v7 == 277) {
      goto LABEL_27;
    }
    goto LABEL_29;
  }
LABEL_8:
  v10 = [v6 objectForKey:*MEMORY[0x1E4F1C490]];
  int v11 = [v10 BOOLValue];
  v12 = @"mi";
  v13 = @"km";
LABEL_35:
  if (v11) {
    v16 = v13;
  }
  else {
    v16 = v12;
  }
  v15 = +[HKUnit unitFromString:v16];
LABEL_39:

LABEL_40:

  return v15;
}

- (BOOL)supportsStatisticOptions:(unint64_t)a3
{
  HKQuantityAggregationStyle v5 = [(HKQuantityType *)self aggregationStyle];
  if ((unint64_t)(v5 - 1) >= 3)
  {
    if (v5 == HKQuantityAggregationStyleCumulative)
    {
      if ((a3 & 2) != 0)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        char v9 = @"HKStatisticsOptionDiscreteAverage";
      }
      else if ((a3 & 4) != 0)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        char v9 = @"HKStatisticsOptionDiscreteMin";
      }
      else if ((a3 & 8) != 0)
      {
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        char v9 = @"HKStatisticsOptionDiscreteMax";
      }
      else
      {
        unint64_t v6 = _HKStatisticsOptionPercentile() & a3;
        if (v6 != _HKStatisticsOptionPercentile()) {
          return 1;
        }
        uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        char v9 = @"_HKStatisticsOptionPercentile()";
      }
      [v7 raise:v8, @"Statistics option %@ is not compatible with cumulative data type %@", v9, self format];
      return 0;
    }
    return 1;
  }
  if ((a3 & 0x10) == 0) {
    return 1;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Statistics option %@ is not compatible with discrete data type %@", @"HKStatisticsOptionCumulativeSum", self format];
  return 0;
}

- (void)validateUnitForStatistic:(id)a3
{
  id v6 = a3;
  v4 = [(HKSampleType *)self _unitForChangeInCanonicalUnit];
  char v5 = [v4 _isCompatibleWithUnit:v6];

  if ((v5 & 1) == 0) {
    [(HKQuantityType *)self validateUnit:v6];
  }
}

- (id)_initWithCode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKQuantityType;
  id result = [(HKObjectType *)&v4 _initWithCode:a3];
  if (result) {
    *((_DWORD *)result + 8) = 0;
  }
  return result;
}

- (HKQuantityType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = +[HKObjectType quantityTypeForIdentifier:v4];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid %@ identifier \"%@\"", objc_opt_class(), v4 format];
  }

  return v5;
}

- (_HKDimension)dimension
{
  v2 = [(HKQuantityType *)self canonicalUnit];
  v3 = [v2 dimension];

  return (_HKDimension *)v3;
}

- (void)validateUnit:(id)a3
{
  id v10 = a3;
  id v4 = [(HKQuantityType *)self canonicalUnit];
  char v5 = [v10 _isCompatibleWithUnit:v4];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = objc_opt_class();
    char v9 = [(HKQuantityType *)self dimension];
    [v6 raise:v7, @"%@ %@ requires unit of type %@. Incompatible unit: %@", v8, self, v9, v10 format];
  }
}

- (void)validateUnitFromString:(id)a3
{
  id v4 = +[HKUnit unitFromString:a3];
  [(HKQuantityType *)self validateUnit:v4];
}

+ (id)_quantityTypeWithCode:(int64_t)a3
{
  uint64_t v5 = objc_opt_class();

  return (id)[a1 _dataTypeWithCode:a3 expectedClass:v5];
}

@end