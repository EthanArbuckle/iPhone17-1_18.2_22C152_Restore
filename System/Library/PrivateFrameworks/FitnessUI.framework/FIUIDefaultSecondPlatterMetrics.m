@interface FIUIDefaultSecondPlatterMetrics
+ (id)boltDefaultNonDistance;
+ (id)boltMetricsForActivityType:(id)a3;
+ (id)metricsForActivityType:(id)a3 metricsVersion:(int64_t)a4;
+ (id)moonstoneMetricsForActivityType:(id)a3;
+ (id)velocityMetricsForActivityType:(id)a3;
@end

@implementation FIUIDefaultSecondPlatterMetrics

+ (id)metricsForActivityType:(id)a3 metricsVersion:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case 6:
      uint64_t v6 = +[FIUIDefaultSecondPlatterMetrics moonstoneMetricsForActivityType:v5];
      goto LABEL_7;
    case 5:
      uint64_t v6 = +[FIUIDefaultSecondPlatterMetrics velocityMetricsForActivityType:v5];
      goto LABEL_7;
    case 4:
      uint64_t v6 = +[FIUIDefaultSecondPlatterMetrics boltMetricsForActivityType:v5];
LABEL_7:
      v7 = (void *)v6;
      goto LABEL_9;
  }
  v7 = (void *)MEMORY[0x263EFFA68];
LABEL_9:

  return v7;
}

+ (id)boltMetricsForActivityType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 effectiveTypeIdentifier];
  if (v4 <= 36)
  {
    if (v4 == 13)
    {
      if (![v3 isIndoor])
      {
        v8 = &unk_26CF74788;
        goto LABEL_21;
      }
      goto LABEL_18;
    }
    if (v4 != 24) {
      goto LABEL_18;
    }
LABEL_8:
    v8 = &unk_26CF747D0;
    goto LABEL_21;
  }
  if (v4 != 52)
  {
    if (v4 != 46)
    {
      if (v4 == 37)
      {
        int v5 = [v3 isIndoor];
        uint64_t v6 = &unk_26CF74758;
        v7 = &unk_26CF74770;
        goto LABEL_10;
      }
LABEL_18:
      v8 = +[FIUIDefaultSecondPlatterMetrics boltDefaultNonDistance];
      goto LABEL_21;
    }
    uint64_t v9 = [v3 swimmingLocationType];
    switch(v9)
    {
      case 0:
        goto LABEL_18;
      case 1:
        v8 = &unk_26CF747A0;
        goto LABEL_21;
      case 2:
        v8 = &unk_26CF747B8;
        goto LABEL_21;
    }
    goto LABEL_8;
  }
  int v5 = [v3 isIndoor];
  uint64_t v6 = &unk_26CF747E8;
  v7 = &unk_26CF74800;
LABEL_10:
  if (v5) {
    v8 = v7;
  }
  else {
    v8 = v6;
  }
LABEL_21:

  return v8;
}

+ (id)velocityMetricsForActivityType:(id)a3
{
  id v3 = a3;
  if ([v3 effectiveTypeIdentifier] != 13)
  {
    uint64_t v12 = +[FIUIDefaultSecondPlatterMetrics boltMetricsForActivityType:v3];
LABEL_22:
    v11 = (void *)v12;
    goto LABEL_23;
  }
  BOOL v4 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingPowerSensors];
  BOOL v5 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingCadenceSensors];
  BOOL v6 = +[FIUIBluetoothSensorLookup hasHadPairedCyclingSpeedSensors];
  int v7 = [v3 isIndoor];
  int v8 = v4 && v5;
  BOOL v9 = v4 || v5;
  if (v7 && !v6)
  {
    if (v8) {
      v10 = &unk_26CF74878;
    }
    else {
      v10 = &unk_26CF74890;
    }
    if (v4) {
      v11 = v10;
    }
    else {
      v11 = &unk_26CF748A8;
    }
    if (v9) {
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (v8) {
    v13 = &unk_26CF74818;
  }
  else {
    v13 = &unk_26CF74830;
  }
  if (v4) {
    v11 = v13;
  }
  else {
    v11 = &unk_26CF74848;
  }
  if (v9) {
    goto LABEL_23;
  }
  if ([v3 isIndoor])
  {
LABEL_21:
    uint64_t v12 = [(id)objc_opt_class() boltDefaultNonDistance];
    goto LABEL_22;
  }
  v11 = &unk_26CF74860;
LABEL_23:

  return v11;
}

+ (id)boltDefaultNonDistance
{
  return &unk_26CF748C0;
}

+ (id)moonstoneMetricsForActivityType:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v4 = [v3 effectiveTypeIdentifier];
  if (v4 <= 59)
  {
    if (v4 == 31)
    {
      BOOL v5 = &unk_26CF74920;
      goto LABEL_11;
    }
    if (v4 == 35 && ![v3 isIndoor])
    {
      BOOL v5 = &unk_26CF74908;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v5 = +[FIUIDefaultSecondPlatterMetrics velocityMetricsForActivityType:v3];
    goto LABEL_11;
  }
  if (v4 != 60)
  {
    if (v4 == 67 || v4 == 61)
    {
      BOOL v5 = &unk_26CF748F0;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v5 = &unk_26CF748D8;
LABEL_11:

  return v5;
}

@end