@interface FIUIFormattingManager
+ (id)localizedShortCadenceUnitStringForActivityType:(unint64_t)a3;
+ (id)localizedShortPowerUnitString;
+ (id)percentStringWithNumber:(id)a3;
+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4;
+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5;
+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5 decimalTrimmingMode:(unint64_t)a6;
+ (unint64_t)defaultPrecisionForDistanceUnit:(unint64_t)a3;
+ (unint64_t)sectionTypeForMetricType:(unint64_t)a3;
- (BOOL)_workoutSupportsDistanceMetricForGoalDisplay:(id)a3;
- (FIUIFormattingManager)initWithUnitManager:(id)a3;
- (FIUIUnitManager)unitManager;
- (double)caloriesForEnergyBurnedInUserUnit:(double)a3;
- (double)energyBurnedInUserUnitForCalories:(double)a3;
- (double)roundedDailyMoveGoal:(double)a3 activityMoveMode:(int64_t)a4;
- (double)roundedDailyMoveGoalForCalories:(double)a3;
- (double)roundedDailyMoveGoalForMoveMinutes:(double)a3;
- (double)speedPerHourWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6;
- (id)_energyBurnedUnitStringForUnit:(id)a3 useShortString:(BOOL)a4;
- (id)_localizedEnergyDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6;
- (id)_localizedKeyMetricCyclingStringWithWorkout:(id)a3 withUnitStyle:(unint64_t)a4;
- (id)_localizedKeyMetricDistanceStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4;
- (id)_localizedKeyMetricDurationStringWithWorkout:(id)a3;
- (id)_localizedKeyMetricEnergyBurnedStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4;
- (id)_localizedOpenGoalKeyMetricStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4;
- (id)_localizedStringWithDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(int64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8;
- (id)_localizedTimeDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6;
- (id)_localizedTimeValueForWorkout:(id)a3;
- (id)_stringByReplacingThirdsIfNeeded:(id)a3 distanceInMeters:(double)a4 distanceUnit:(unint64_t)a5 roundingMode:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7;
- (id)applyTextCase:(unint64_t)a3 toString:(id)a4;
- (id)beyondLimitStringForDepthUnit:(unint64_t)a3 includeUnits:(BOOL)a4;
- (id)decimalSeparator;
- (id)finalLocalizedKeyForKey:(id)a3 multiline:(BOOL)a4;
- (id)localizationKeyForDistanceBaseKey:(id)a3 distanceType:(unint64_t)a4;
- (id)localizationKeyForEnergyBaseKey:(id)a3;
- (id)localizationKeyForMoveBaseKey:(id)a3 activityMoveMode:(int64_t)a4;
- (id)localizationKeyForMoveMinutesBaseKey:(id)a3;
- (id)localizedCompactGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5;
- (id)localizedCompactNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6;
- (id)localizedDepthUnit:(unint64_t)a3;
- (id)localizedDepthValue:(double)a3 depthUnit:(unint64_t)a4;
- (id)localizedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4;
- (id)localizedDistinguishingCadenceUnitStringWithMetricType:(unint64_t)a3;
- (id)localizedDistinguishingPaceUnitStringWithMetricType:(unint64_t)a3 distanceType:(unint64_t)a4 distanceUnit:(unint64_t)a5 paceFormat:(int64_t)a6 abbreviated:(BOOL)a7 multiline:(BOOL)a8;
- (id)localizedDistinguishingPowerStringWithMetricType:(unint64_t)a3;
- (id)localizedDistinguishingPowerUnitStringWithMetricType:(unint64_t)a3;
- (id)localizedGoalDescriptionForDive:(id)a3 healthStore:(id)a4 outValue:(id *)a5;
- (id)localizedGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5;
- (id)localizedGoalDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5;
- (id)localizedGoalUnitForWorkout:(id)a3;
- (id)localizedGoalValueForWorkout:(id)a3;
- (id)localizedHeartRateUnitString;
- (id)localizedInSessionDescriptionForElevation:(unint64_t)a3;
- (id)localizedInSessionDescriptionForGroundElevation:(unint64_t)a3;
- (id)localizedKeyMetricStringForWorkout:(id)a3 unitStyle:(unint64_t)a4;
- (id)localizedLongActiveEnergyUnitString;
- (id)localizedLongActiveEnergyUnitStringWithTextCase:(unint64_t)a3;
- (id)localizedLongActiveHoursUnitString;
- (id)localizedLongActiveHoursUnitStringForValue:(unint64_t)a3;
- (id)localizedLongBriskMinutesUnitString;
- (id)localizedLongBriskMinutesUnitStringForValue:(unint64_t)a3;
- (id)localizedLongMoveMinutesUnitString;
- (id)localizedLongMoveMinutesUnitStringForValue:(unint64_t)a3;
- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3;
- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4;
- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3;
- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3 value:(unint64_t)a4;
- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4;
- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 textCase:(unint64_t)a5;
- (id)localizedMediumMoveMinutesUnitString;
- (id)localizedMediumMoveMinutesUnitStringForValue:(unint64_t)a3;
- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3;
- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4;
- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6;
- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6 decimalTrimmingMode:(unint64_t)a7;
- (id)localizedPaceAndUnitStringForSpeed:(double)a3 activityType:(id)a4;
- (id)localizedPaceAndUnitWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6 unitStyle:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8;
- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6;
- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6 zeroShowsDashes:(BOOL)a7;
- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 unitStyle:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7 distanceType:(unint64_t)a8;
- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 unitStyle:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7 distanceType:(unint64_t)a8 zeroShowsDashes:(BOOL)a9;
- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4;
- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4 unitStyle:(int64_t)a5;
- (id)localizedPaceValueForSplit:(id)a3 activityType:(id)a4;
- (id)localizedPowerUnitStringForPower:(double)a3;
- (id)localizedShareTextWithWorkout:(id)a3 shareValue:(id)a4;
- (id)localizedShortActiveEnergyUnitString;
- (id)localizedShortActiveHoursUnitString;
- (id)localizedShortBriskMinutesUnitString;
- (id)localizedShortTypeDistinguishingUnitStringForEnergyType:(unint64_t)a3 workoutSectionType:(unint64_t)a4 multiline:(BOOL)a5;
- (id)localizedShortTypeDistinguishingUnitStringForPowerType:(unint64_t)a3 unitString:(id)a4;
- (id)localizedShortUnitStringForDistanceType:(unint64_t)a3;
- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3;
- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3 textCase:(unint64_t)a4;
- (id)localizedSpeedUnitString;
- (id)localizedSpeedUnitStringForActivityType:(id)a3;
- (id)localizedSpeedUnitStringForDistanceType:(unint64_t)a3 unitStyle:(unint64_t)a4;
- (id)localizedSpeedUnitStringForDistanceUnit:(unint64_t)a3 unitStyle:(unint64_t)a4;
- (id)localizedStringForMetricType:(unint64_t)a3 paceFormat:(int64_t)a4;
- (id)localizedStringWithActiveEnergy:(id)a3;
- (id)localizedStringWithActiveEnergy:(id)a3 unitStyle:(unint64_t)a4;
- (id)localizedStringWithActiveHours:(id)a3;
- (id)localizedStringWithBeatsPerMinute:(double)a3;
- (id)localizedStringWithBeatsPerMinute:(double)a3 requirePositiveValue:(BOOL)a4;
- (id)localizedStringWithBriskMinutes:(id)a3;
- (id)localizedStringWithDepthInMeters:(double)a3 depthUnit:(unint64_t)a4;
- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 distanceUnit:(unint64_t)a5 unitStyle:(unint64_t)a6 roundingMode:(unint64_t)a7;
- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5;
- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 roundingMode:(unint64_t)a6;
- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6;
- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8;
- (id)localizedStringWithEnergy:(id)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5;
- (id)localizedStringWithEnergyInCalories:(double)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5;
- (id)localizedStringWithHeartRate:(id)a3;
- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4;
- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4 requirePositiveValue:(BOOL)a5;
- (id)localizedStringWithMoveMinutes:(id)a3;
- (id)localizedStringWithMoveMinutes:(id)a3 unitStyle:(unint64_t)a4;
- (id)localizedStringWithMoveQuantity:(id)a3 activityMoveMode:(int64_t)a4;
- (id)localizedStringWithMoveQuantity:(id)a3 unitStyle:(unint64_t)a4 activityMoveMode:(int64_t)a5;
- (id)localizedStringWithPersonHeight:(id)a3 unitStyle:(int64_t)a4;
- (id)localizedStrokeCountStringWithCount:(int64_t)a3 overDistance:(id)a4 paceFormat:(int64_t)a5;
- (id)localizedSwimmingPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5;
- (id)localizedTitleForSplit:(id)a3 unit:(id)a4 lapIndex:(int64_t)a5 useShortFormat:(BOOL)a6;
- (id)localizedUnderwaterTime:(double)a3;
- (id)localizedUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(unint64_t)a5;
- (id)localizedWaterTemperatureRangeWithColdest:(double)a3 hottest:(double)a4;
- (id)localizedWaterTemperatureValue:(double)a3;
- (id)stringWithDuration:(double)a3 durationFormat:(unint64_t)a4;
- (unint64_t)_effectiveGoalTypeForWorkout:(id)a3;
- (unint64_t)decimalPrecisionForPaceFormat:(int64_t)a3;
- (unint64_t)naturalScaleUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4;
- (unint64_t)userDistanceUnitForSwimmingLapLength;
@end

@implementation FIUIFormattingManager

- (FIUIFormattingManager)initWithUnitManager:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FIUIFormattingManager;
  v6 = [(FIUIFormattingManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unitManager, a3);
    v8 = [[FIUIDepthFormatter alloc] initWithUnitManager:v5];
    depthFormatter = v7->_depthFormatter;
    v7->_depthFormatter = v8;
  }
  return v7;
}

- (id)localizedGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5
{
  id v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 0uLL:
      v10 = FIUIBundle();
      objc_super v11 = [v10 localizedStringForKey:@"WORKOUT_OPEN_GOAL" value:&stru_26CF5F1B8 table:@"Localizable"];

      break;
    case 1uLL:
      unint64_t v12 = [(FIUIUnitManager *)self->_unitManager userDistanceUnitForDistanceType:FIUIDistanceTypeForActivityType(v8)];
      uint64_t v13 = -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v12, 2, [(id)objc_opt_class() defaultPrecisionForDistanceUnit:v12], 6, 2, a4);
      goto LABEL_6;
    case 2uLL:
      uint64_t v13 = [(FIUIFormattingManager *)self stringWithDuration:7 durationFormat:a4];
LABEL_6:
      objc_super v11 = (void *)v13;
      break;
    case 3uLL:
      v14 = (void *)MEMORY[0x263F0A630];
      v15 = [MEMORY[0x263F0A830] kilocalorieUnit];
      v16 = [v14 quantityWithUnit:v15 doubleValue:a4];
      objc_super v11 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:v16 unitStyle:2];

      break;
    default:
      objc_super v11 = 0;
      break;
  }

  return v11;
}

- (FIUIUnitManager)unitManager
{
  return self->_unitManager;
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4
{
  return (id)[a1 stringWithNumber:a3 decimalPrecision:a4 roundingMode:2 decimalTrimmingMode:1];
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5
{
  return (id)[a1 stringWithNumber:a3 decimalPrecision:a4 roundingMode:a5 decimalTrimmingMode:1];
}

- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4
{
  return [(FIUIFormattingManager *)self localizedPaceUnitStringWithDistanceType:a3 distanceUnit:a4 unitStyle:2];
}

- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3
{
  return [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:a3 textCase:0];
}

- (id)localizedShortUnitStringForDistanceUnit:(unint64_t)a3 textCase:(unint64_t)a4
{
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  v7 = _LengthFormatter((void *)1, 2, 2, 1);
  id v8 = v7;
  if (a3 - 1 > 4) {
    uint64_t v9 = 14;
  }
  else {
    uint64_t v9 = qword_21E4D90E8[a3 - 1];
  }
  v10 = [v7 unitStringFromValue:v9 unit:100.0];
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  objc_super v11 = [(FIUIFormattingManager *)self applyTextCase:a4 toString:v10];

  return v11;
}

- (id)applyTextCase:(unint64_t)a3 toString:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0uLL:
      id v7 = v5;
      goto LABEL_6;
    case 1uLL:
      id v7 = [v5 localizedUppercaseString];
      goto LABEL_6;
    case 2uLL:
      id v7 = [v5 localizedLowercaseString];
      goto LABEL_6;
    case 3uLL:
      id v7 = [v5 localizedCapitalizedString];
LABEL_6:
      a3 = (unint64_t)v7;
      break;
    default:
      break;
  }

  return (id)a3;
}

- (id)decimalSeparator
{
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  v2 = _DoubleFractionNumberFormatter(2);
  v3 = [v2 decimalSeparator];

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v3;
}

- (id)stringWithDuration:(double)a3 durationFormat:(unint64_t)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000) {
    double v5 = 0.0;
  }
  else {
    double v5 = a3;
  }
  id v6 = objc_alloc_init(MEMORY[0x263F08780]);
  id v7 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v8 = [MEMORY[0x263EFF960] currentLocale];
  [v7 setLocale:v8];

  [v6 setCalendar:v7];
  [v6 setUnitsStyle:0];
  switch(a4)
  {
    case 1uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      uint64_t v9 = _IntegerNumberFormatter(2);
      v10 = _ZeroPaddedIntegerNumberFormatter();
      objc_super v11 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v5 / 60.0)];
      unint64_t v12 = [v9 stringFromNumber:v11];

      uint64_t v13 = [NSNumber numberWithUnsignedInteger:(unint64_t)(v5 - (double)(60 * (unint64_t)(v5 / 60.0)))];
      v14 = [v10 stringFromNumber:v13];

      os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
      v15 = NSString;
      v16 = FIUIBundle();
      v17 = [v16 localizedStringForKey:@"PACE_FORMATTING" value:&stru_26CF5F1B8 table:@"Localizable"];
      v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v12, v14);

      goto LABEL_10;
    case 2uLL:
      [v6 setZeroFormattingBehavior:0];
      v19 = v6;
      uint64_t v20 = 224;
      goto LABEL_12;
    case 3uLL:
      [v6 setZeroFormattingBehavior:0x10000];
      v19 = v6;
      uint64_t v20 = 192;
      goto LABEL_12;
    case 4uLL:
      [v6 setZeroFormattingBehavior:0];
      v19 = v6;
      uint64_t v20 = 96;
LABEL_12:
      [v19 setAllowedUnits:v20];
      goto LABEL_16;
    case 5uLL:
      [v6 setZeroFormattingBehavior:1];
      [v6 setAllowedUnits:96];
      [v6 setUnitsStyle:1];
      v21 = [NSNumber numberWithDouble:v5];
      unint64_t v22 = [v21 unsignedIntegerValue];

      v18 = [v6 stringFromTimeInterval:(double)(60 * (v22 / 0x3C))];
      goto LABEL_10;
    case 6uLL:
      [v6 setZeroFormattingBehavior:1];
      [v6 setAllowedUnits:224];
      v23 = v6;
      uint64_t v24 = 4;
      goto LABEL_15;
    case 7uLL:
      [v6 setZeroFormattingBehavior:1];
      [v6 setAllowedUnits:224];
      v23 = v6;
      uint64_t v24 = 5;
LABEL_15:
      [v23 setUnitsStyle:v24];
LABEL_16:
      v18 = [v6 stringFromTimeInterval:v5];
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      if (a4 != 3) {
        goto LABEL_36;
      }
      if (_DurationSeparator___durationSeparator) {
        goto LABEL_31;
      }
      id v25 = objc_alloc_init(MEMORY[0x263F08780]);
      [v25 setUnitsStyle:0];
      v26 = [v25 stringFromTimeInterval:100.0];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v27 = [&unk_26CF749E0 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (!v27) {
        goto LABEL_28;
      }
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v38;
      break;
    default:
      v18 = 0;
LABEL_10:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      goto LABEL_36;
  }
  while (2)
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v38 != v29) {
        objc_enumerationMutation(&unk_26CF749E0);
      }
      v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if ([v26 containsString:v31])
      {
        objc_storeStrong((id *)&_DurationSeparator___durationSeparator, v31);
        goto LABEL_28;
      }
    }
    uint64_t v28 = [&unk_26CF749E0 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_28:
  if (!_DurationSeparator___durationSeparator) {
    _DurationSeparator___durationSeparator = @":";
  }

LABEL_31:
  if (objc_msgSend(v18, "rangeOfString:") == 1)
  {
    v32 = _ZeroPaddedIntegerNumberFormatter();
    v33 = [v32 paddingCharacter];
    uint64_t v34 = [v33 stringByAppendingString:v18];

    v18 = (void *)v34;
  }
  if (v5 <= -1.0 && v5 > -60.0)
  {
    uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"-00:%02d", (int)-v5);

    v18 = (void *)v35;
  }
LABEL_36:
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v18;
}

- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6
{
  return [(FIUIFormattingManager *)self localizedNaturalScaleStringWithDistanceInMeters:a4 distanceType:a5 unitStyle:a6 usedUnit:1 decimalTrimmingMode:a3];
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6
{
  return [(FIUIFormattingManager *)self localizedStringWithDistanceInMeters:a4 distanceUnit:a5 unitStyle:a6 decimalPrecision:2 roundingMode:1 decimalTrimmingMode:a3];
}

- (id)localizationKeyForEnergyBaseKey:(id)a3
{
  unitManager = self->_unitManager;
  id v4 = a3;
  double v5 = [(FIUIUnitManager *)unitManager userActiveEnergyBurnedUnit];
  id v6 = _FIUILocalizationKeyForUnit(v4, v5);

  return v6;
}

- (id)localizedStringWithActiveEnergy:(id)a3 unitStyle:(unint64_t)a4
{
  return [(FIUIFormattingManager *)self localizedStringWithEnergy:a3 energyType:1 unitStyle:a4];
}

- (id)localizedStringWithEnergy:(id)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  id v8 = a3;
  switch(a4)
  {
    case 3uLL:
      goto LABEL_4;
    case 2uLL:
      uint64_t v9 = [(FIUIUnitManager *)self->_unitManager userBasalEnergyBurnedUnit];
      goto LABEL_6;
    case 1uLL:
LABEL_4:
      uint64_t v9 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
LABEL_6:
      v10 = (void *)v9;
      goto LABEL_8;
  }
  v10 = 0;
LABEL_8:
  int v11 = _HKWorkoutFlooredValueForQuantity();
  uint64_t v12 = [MEMORY[0x263F0A830] energyFormatterUnitFromUnit:v10];
  switch(a5)
  {
    case 0uLL:
      uint64_t v13 = objc_opt_class();
      v14 = [NSNumber numberWithDouble:(double)v11];
      v15 = [v13 stringWithNumber:v14 decimalPrecision:1];
      goto LABEL_16;
    case 1uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      v14 = _EnergyFormatter(v10);
      [v14 setUnitStyle:1];
      v16 = [v14 stringFromValue:v12 unit:(double)v11];
      v15 = [v16 localizedLowercaseString];

      goto LABEL_15;
    case 2uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      v17 = _EnergyFormatter(v10);
      v14 = v17;
      uint64_t v18 = 2;
      goto LABEL_14;
    case 3uLL:
      os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
      v17 = _EnergyFormatter(v10);
      v14 = v17;
      uint64_t v18 = 3;
LABEL_14:
      [v17 setUnitStyle:v18];
      v15 = [v14 stringFromValue:v12 unit:(double)v11];
LABEL_15:
      os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
LABEL_16:

      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

- (id)localizedShortActiveEnergyUnitString
{
  v3 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
  id v4 = [(FIUIFormattingManager *)self _energyBurnedUnitStringForUnit:v3 useShortString:1];

  return v4;
}

- (id)_energyBurnedUnitStringForUnit:(id)a3 useShortString:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  id v6 = _EnergyFormatter(v5);
  id v7 = v6;
  if (v4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 3;
  }
  [v6 setUnitStyle:v8];
  uint64_t v9 = [MEMORY[0x263F0A830] energyFormatterUnitFromUnit:v5];

  v10 = [v7 unitStringFromValue:v9 unit:100.0];
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v10;
}

+ (id)percentStringWithNumber:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  if (_PercentNumberFormatter_onceToken != -1) {
    dispatch_once(&_PercentNumberFormatter_onceToken, &__block_literal_global_22);
  }
  BOOL v4 = [(id)_PercentNumberFormatter___formatter stringFromNumber:v3];

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v4;
}

+ (id)stringWithNumber:(id)a3 decimalPrecision:(unint64_t)a4 roundingMode:(unint64_t)a5 decimalTrimmingMode:(unint64_t)a6
{
  id v9 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  v10 = _NumberFormatterForDecimalPrecision((id)a4, a5, a6);
  int v11 = [v10 stringFromNumber:v9];

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v11;
}

- (id)localizationKeyForMoveBaseKey:(id)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2) {
    [(FIUIFormattingManager *)self localizationKeyForMoveMinutesBaseKey:a3];
  }
  else {
  BOOL v4 = [(FIUIFormattingManager *)self localizationKeyForEnergyBaseKey:a3];
  }
  return v4;
}

- (id)localizationKeyForMoveMinutesBaseKey:(id)a3
{
  id v3 = (void *)MEMORY[0x263F0A830];
  id v4 = a3;
  id v5 = [v3 minuteUnit];
  id v6 = _FIUILocalizationKeyForUnit(v4, v5);

  return v6;
}

- (id)localizationKeyForDistanceBaseKey:(id)a3 distanceType:(unint64_t)a4
{
  unitManager = self->_unitManager;
  id v6 = a3;
  id v7 = [(FIUIUnitManager *)unitManager userDistanceHKUnitForDistanceType:a4];
  uint64_t v8 = _FIUILocalizationKeyForUnit(v6, v7);

  return v8;
}

+ (unint64_t)defaultPrecisionForDistanceUnit:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 3;
  }
  else {
    return qword_21E4D90C0[a3 - 1];
  }
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceUnit:(unint64_t)a4 unitStyle:(unint64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  -[FIUIUnitManager distanceInDistanceUnit:forDistanceInMeters:](self->_unitManager, "distanceInDistanceUnit:forDistanceInMeters:", a3);
  double v15 = v14;
  switch(a5)
  {
    case 0uLL:
      v16 = objc_opt_class();
      v17 = [NSNumber numberWithDouble:v15];
      uint64_t v18 = [v16 stringWithNumber:v17 decimalPrecision:a6 roundingMode:a7 decimalTrimmingMode:a8];

      break;
    case 1uLL:
      v19 = self;
      unint64_t v20 = a4;
      uint64_t v21 = 1;
      goto LABEL_7;
    case 2uLL:
      v19 = self;
      unint64_t v20 = a4;
      uint64_t v21 = 2;
      goto LABEL_7;
    case 3uLL:
      v19 = self;
      unint64_t v20 = a4;
      uint64_t v21 = 3;
LABEL_7:
      uint64_t v18 = -[FIUIFormattingManager _localizedStringWithDistanceUnit:distanceInUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](v19, "_localizedStringWithDistanceUnit:distanceInUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", v20, v21, a6, a7, a8);
      break;
    default:
      uint64_t v18 = 0;
      break;
  }
  return v18;
}

- (id)_stringByReplacingThirdsIfNeeded:(id)a3 distanceInMeters:(double)a4 distanceUnit:(unint64_t)a5 roundingMode:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7
{
  id v13 = a3;
  double v14 = v13;
  if (a5 == 4) {
    double v15 = a4 / 0.9144;
  }
  else {
    double v15 = a4;
  }
  double v16 = v15 - floor(v15);
  LODWORD(v7) = vcvtmd_s64_f64(v15);
  if (fabs(v16 + -0.333333333) >= 0.01)
  {
    uint64_t v21 = v13;
    if (fabs(v16 + -0.666666667) >= 0.01) {
      goto LABEL_9;
    }
    v17 = NSString;
    uint64_t v18 = FIUIBundle();
    v19 = v18;
    unint64_t v20 = @"%d⅔";
  }
  else
  {
    v17 = NSString;
    uint64_t v18 = FIUIBundle();
    v19 = v18;
    unint64_t v20 = @"%d⅓";
  }
  unint64_t v22 = [v18 localizedStringForKey:v20 value:&stru_26CF5F1B8 table:@"Localizable"];
  v23 = objc_msgSend(v17, "stringWithFormat:", v22, v7);

  uint64_t v24 = -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", a5, 0, [(id)objc_opt_class() defaultPrecisionForDistanceUnit:a5], a6, a7, a4);
  uint64_t v21 = [v14 stringByReplacingOccurrencesOfString:v24 withString:v23];

LABEL_9:
  return v21;
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  return [(FIUIFormattingManager *)self localizedStringWithDistanceInMeters:a4 distanceType:a5 unitStyle:2 roundingMode:a3];
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 roundingMode:(unint64_t)a6
{
  unint64_t v11 = -[FIUIUnitManager userDistanceUnitForDistanceType:](self->_unitManager, "userDistanceUnitForDistanceType:");
  return [(FIUIFormattingManager *)self localizedStringWithDistanceInMeters:a4 distanceType:v11 distanceUnit:a5 unitStyle:a6 roundingMode:a3];
}

- (id)localizedStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 distanceUnit:(unint64_t)a5 unitStyle:(unint64_t)a6 roundingMode:(unint64_t)a7
{
  uint64_t v12 = -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:](self, "localizedStringWithDistanceInMeters:distanceUnit:unitStyle:decimalPrecision:roundingMode:decimalTrimmingMode:", a5, a6, [(id)objc_opt_class() defaultPrecisionForDistanceUnit:a5], a7, 1, a3);
  if (a4 == 3)
  {
    uint64_t v13 = [(FIUIFormattingManager *)self _stringByReplacingThirdsIfNeeded:v12 distanceInMeters:a5 distanceUnit:a7 roundingMode:1 decimalTrimmingMode:a3];

    uint64_t v12 = (void *)v13;
  }
  return v12;
}

- (id)localizedCompactNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6
{
  id v6 = [(FIUIFormattingManager *)self localizedNaturalScaleStringWithDistanceInMeters:a4 distanceType:a5 unitStyle:a6 usedUnit:a3];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@" " withString:&stru_26CF5F1B8];

  return v7;
}

- (id)localizedNaturalScaleStringWithDistanceInMeters:(double)a3 distanceType:(unint64_t)a4 unitStyle:(unint64_t)a5 usedUnit:(unint64_t *)a6 decimalTrimmingMode:(unint64_t)a7
{
  unint64_t v13 = -[FIUIFormattingManager naturalScaleUnitForDistanceInMeters:distanceType:](self, "naturalScaleUnitForDistanceInMeters:distanceType:");
  uint64_t v14 = [(id)objc_opt_class() defaultPrecisionForDistanceUnit:v13];
  if (a6) {
    *a6 = v13;
  }
  double v15 = [(FIUIFormattingManager *)self localizedStringWithDistanceInMeters:v13 distanceUnit:a5 unitStyle:v14 decimalPrecision:2 roundingMode:a7 decimalTrimmingMode:a3];
  if (a4 == 3)
  {
    uint64_t v16 = [(FIUIFormattingManager *)self _stringByReplacingThirdsIfNeeded:v15 distanceInMeters:v13 distanceUnit:2 roundingMode:a7 decimalTrimmingMode:a3];

    double v15 = (void *)v16;
  }
  return v15;
}

- (unint64_t)naturalScaleUnitForDistanceInMeters:(double)a3 distanceType:(unint64_t)a4
{
  uint64_t v7 = naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit;
  if (naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit
    && v7 == [(FIUIUnitManager *)self->_unitManager userDistanceUnitForDistanceType:a4])
  {
    uint64_t v8 = naturalScaleUnitForDistanceInMeters_distanceType____cutoffDistanceInMeters;
  }
  else
  {
    naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit = [(FIUIUnitManager *)self->_unitManager userDistanceUnitForDistanceType:a4];
    int IsMetric = FIUIDistanceUnitIsMetric();
    double v10 = 0.1;
    if (IsMetric) {
      double v10 = 1.0;
    }
    [(FIUIUnitManager *)self->_unitManager distanceInMetersForDistanceInUserUnit:a4 distanceType:v10];
    naturalScaleUnitForDistanceInMeters_distanceType____cutoffDistanceInMeters = v8;
  }
  unint64_t result = naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit;
  if (*(double *)&v8 > a3)
  {
    switch(naturalScaleUnitForDistanceInMeters_distanceType____userDistanceUnit)
    {
      case 5:
        goto LABEL_11;
      case 4:
        return result;
      case 3:
LABEL_11:
        if (a4 == 4) {
          return 4;
        }
        else {
          return 5;
        }
      default:
        return 1;
    }
  }
  return result;
}

- (id)_localizedStringWithDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(int64_t)a5 decimalPrecision:(unint64_t)a6 roundingMode:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  uint64_t v14 = _LengthFormatter((void *)a6, a5, a7, a8);
  double v15 = v14;
  if (a3 - 1 > 4) {
    uint64_t v16 = 14;
  }
  else {
    uint64_t v16 = qword_21E4D90E8[a3 - 1];
  }
  v17 = [v14 stringFromValue:v16 unit:a4];
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);

  return v17;
}

- (id)localizedShortUnitStringForDistanceType:(unint64_t)a3
{
  unint64_t v4 = [(FIUIUnitManager *)self->_unitManager userDistanceUnitForDistanceType:a3];
  return [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:v4];
}

- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4
{
  return [(FIUIFormattingManager *)self localizedLongUnitStringForDistanceUnit:a3 distanceInUnit:0 textCase:a4];
}

- (id)localizedLongUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 textCase:(unint64_t)a5
{
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  id v9 = _LengthFormatter((void *)1, 3, 2, 1);
  double v10 = v9;
  if (a3 - 1 > 4) {
    uint64_t v11 = 14;
  }
  else {
    uint64_t v11 = qword_21E4D90E8[a3 - 1];
  }
  uint64_t v12 = [v9 unitStringFromValue:v11 unit:a4];
  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  unint64_t v13 = [(FIUIFormattingManager *)self applyTextCase:a5 toString:v12];

  return v13;
}

- (id)localizedUnitStringForDistanceUnit:(unint64_t)a3 distanceInUnit:(double)a4 unitStyle:(unint64_t)a5
{
  if (a5 - 1 >= 2)
  {
    if (a5 == 3)
    {
      id v5 = [(FIUIFormattingManager *)self localizedLongUnitStringForDistanceUnit:a3 distanceInUnit:a4];
    }
    else
    {
      id v5 = &stru_26CF5F1B8;
    }
  }
  else
  {
    -[FIUIFormattingManager localizedShortUnitStringForDistanceUnit:](self, "localizedShortUnitStringForDistanceUnit:", a3, a4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  return [(FIUIFormattingManager *)self localizedPaceStringWithDistance:a3 overDuration:a5 paceFormat:2 unitStyle:1 decimalTrimmingMode:a6 distanceType:a4];
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6 zeroShowsDashes:(BOOL)a7
{
  return [(FIUIFormattingManager *)self localizedPaceStringWithDistance:a3 overDuration:a5 paceFormat:2 unitStyle:1 decimalTrimmingMode:a6 distanceType:a7 zeroShowsDashes:a4];
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 unitStyle:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7 distanceType:(unint64_t)a8
{
  return [(FIUIFormattingManager *)self localizedPaceStringWithDistance:a3 overDuration:a5 paceFormat:a6 unitStyle:a7 decimalTrimmingMode:a8 distanceType:1 zeroShowsDashes:a4];
}

- (id)localizedPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 unitStyle:(unint64_t)a6 decimalTrimmingMode:(unint64_t)a7 distanceType:(unint64_t)a8 zeroShowsDashes:(BOOL)a9
{
  BOOL v9 = a9;
  id v16 = a3;
  unint64_t v17 = [(FIUIFormattingManager *)self decimalPrecisionForPaceFormat:a5];
  if (a5 == 4)
  {
    unint64_t v18 = v17;
    [(FIUIFormattingManager *)self speedPerHourWithDistance:v16 overDuration:4 paceFormat:a8 distanceType:a4];
    double v20 = v19;

    uint64_t v21 = objc_opt_class();
    unint64_t v22 = [NSNumber numberWithDouble:v20];
    v23 = [v21 stringWithNumber:v22 decimalPrecision:v18 roundingMode:2 decimalTrimmingMode:a7];
  }
  else
  {
    [(FIUIUnitManager *)self->_unitManager paceWithDistance:v16 overDuration:a5 paceFormat:a8 distanceType:a4];
    double v25 = v24;

    if (v25 != 0.0 || !v9)
    {
      if (a6 == 3) {
        uint64_t v27 = 6;
      }
      else {
        uint64_t v27 = 1;
      }
      v23 = [(FIUIFormattingManager *)self stringWithDuration:v27 durationFormat:v25];
    }
    else
    {
      uint64_t v28 = FIUIBundle();
      v23 = [v28 localizedStringForKey:@"PACE_NOVALUE" value:&stru_26CF5F1B8 table:@"Localizable"];
    }
  }
  return v23;
}

- (id)localizedPaceAndUnitWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6 unitStyle:(unint64_t)a7 decimalTrimmingMode:(unint64_t)a8
{
  id v15 = a3;
  id v16 = [(FIUIFormattingManager *)self localizedPaceStringWithDistance:v15 overDuration:a5 paceFormat:a7 unitStyle:a8 decimalTrimmingMode:a6 distanceType:a4];
  unint64_t v17 = [(FIUIUnitManager *)self->_unitManager paceDistanceUnitForDistanceType:a6];
  if ((unint64_t)(a5 - 1) < 3)
  {
    switch(a7)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
        unint64_t v18 = self;
        unint64_t v19 = a6;
        unint64_t v20 = v17;
        uint64_t v21 = 1;
        goto LABEL_12;
      case 2uLL:
        unint64_t v18 = self;
        unint64_t v19 = a6;
        unint64_t v20 = v17;
        uint64_t v21 = 2;
LABEL_12:
        uint64_t v24 = [(FIUIFormattingManager *)v18 localizedPaceUnitStringWithDistanceType:v19 distanceUnit:v20 unitStyle:v21];
        goto LABEL_15;
      case 3uLL:
        double v25 = [(FIUIFormattingManager *)self localizedPaceUnitStringWithDistanceType:a6 distanceUnit:v17 unitStyle:3];
        v26 = NSString;
        uint64_t v27 = FIUIBundle();
        uint64_t v28 = [v27 localizedStringForKey:@"PACE_PER_UNIT" value:&stru_26CF5F1B8 table:@"Localizable"];
        objc_msgSend(v26, "stringWithFormat:", v28, v16, v25);
        id v8 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      default:
        goto LABEL_17;
    }
  }
  if (a5 == 4)
  {
    [(FIUIFormattingManager *)self speedPerHourWithDistance:v15 overDuration:4 paceFormat:a6 distanceType:a4];
    double v23 = v22;
    if (a8 == 2) {
      double v23 = trunc(v22 * 10.0) / 10.0;
    }
    if (a7 - 1 < 2)
    {
      uint64_t v24 = [(FIUIFormattingManager *)self localizedSpeedUnitStringForDistanceUnit:v17 unitStyle:a7];
LABEL_15:
      double v25 = (void *)v24;
      id v8 = [NSString stringWithFormat:@"%@ %@", v16, v24];
LABEL_16:
    }
    else if (a7 == 3)
    {
      int IsMetric = FIUIDistanceUnitIsMetric();
      v31 = @"SPOKEN_SPEED_IMPERIAL";
      if (IsMetric) {
        v31 = @"SPOKEN_SPEED_METRIC";
      }
      v32 = NSString;
      v33 = v31;
      uint64_t v34 = FIUIBundle();
      uint64_t v35 = [v34 localizedStringForKey:v33 value:&stru_26CF5F1B8 table:@"Localizable"];

      objc_msgSend(v32, "stringWithFormat:", v35, *(void *)&v23);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (!a7)
    {
LABEL_10:
      id v8 = v16;
    }
  }
LABEL_17:

  return v8;
}

- (unint64_t)decimalPrecisionForPaceFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3) {
    return 1;
  }
  else {
    return 2;
  }
}

- (id)localizedPaceAndUnitStringForSpeed:(double)a3 activityType:(id)a4
{
  uint64_t v6 = FIUIDistanceTypeForActivityType(a4);
  uint64_t v7 = FIUIPaceFormatForDistanceType();
  id v8 = (void *)MEMORY[0x263F0A630];
  BOOL v9 = [MEMORY[0x263F0A830] meterUnit];
  double v10 = [v8 quantityWithUnit:v9 doubleValue:a3];
  uint64_t v11 = [(FIUIFormattingManager *)self localizedPaceStringWithDistance:v10 overDuration:v7 paceFormat:v6 distanceType:1.0];

  uint64_t v12 = [(FIUIFormattingManager *)self unitManager];
  uint64_t v13 = [v12 paceDistanceUnitForDistanceType:v6];

  uint64_t v14 = [(FIUIFormattingManager *)self localizedPaceUnitStringWithDistanceType:v6 distanceUnit:v13];
  id v15 = [v14 localizedUppercaseString];

  id v16 = NSString;
  unint64_t v17 = FIUIBundle();
  unint64_t v18 = [v17 localizedStringForKey:@"PACE_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
  unint64_t v19 = objc_msgSend(v16, "stringWithFormat:", v18, v11, v15);

  return v19;
}

- (double)speedPerHourWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5 distanceType:(unint64_t)a6
{
  unitManager = self->_unitManager;
  id v9 = a3;
  [(FIUIUnitManager *)unitManager paceDistanceUnitForDistanceType:a6];
  double v10 = FIUIHKUnitForDistanceUnit();
  [v9 doubleValueForUnit:v10];
  double v12 = v11;

  return v12 / (a4 / 3600.0);
}

- (id)localizedSwimmingPaceStringWithDistance:(id)a3 overDuration:(double)a4 paceFormat:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(FIUIFormattingManager *)self unitManager];
  double v10 = [v9 userDistanceHKUnitForDistanceType:3];

  [v8 doubleValueForUnit:v10];
  double v12 = v11;

  if (v12 > 2.22044605e-16 && a4 / v12 * (double)a5 <= 3600.0)
  {
    uint64_t v14 = -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 1);
  }
  else
  {
    uint64_t v13 = FIUIBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"PACE_NOVALUE" value:&stru_26CF5F1B8 table:@"Localizable"];
  }
  return v14;
}

- (id)localizedStrokeCountStringWithCount:(int64_t)a3 overDistance:(id)a4 paceFormat:(int64_t)a5
{
  id v8 = a4;
  id v9 = [(FIUIFormattingManager *)self unitManager];
  double v10 = [v9 userDistanceHKUnitForDistanceType:3];

  [v8 doubleValueForUnit:v10];
  double v12 = v11;

  if (v12 > 2.22044605e-16) {
    a3 = llround((double)a3 / v12 * (double)a5);
  }
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [NSNumber numberWithInteger:a3];
  id v15 = [v13 stringWithNumber:v14 decimalPrecision:1];

  return v15;
}

+ (id)localizedShortCadenceUnitStringForActivityType:(unint64_t)a3
{
  int v3 = FIUIIsWorkoutTypePedestrianActivity(a3);
  unint64_t v4 = FIUIBundle();
  id v5 = v4;
  if (v3) {
    uint64_t v6 = @"SPM_SHORT_UNIT";
  }
  else {
    uint64_t v6 = @"RPM_SHORT_UNIT";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_26CF5F1B8 table:@"Localizable"];

  return v7;
}

+ (id)localizedShortPowerUnitString
{
  v2 = FIUIBundle();
  int v3 = [v2 localizedStringForKey:@"WATTS_SHORT_UNIT" value:&stru_26CF5F1B8 table:@"Localizable"];

  return v3;
}

- (id)localizedPowerUnitStringForPower:(double)a3
{
  unint64_t v4 = NSString;
  id v5 = FIUIBundle();
  uint64_t v6 = [v5 localizedStringForKey:@"POWER_SHORT_DESCRIPTION" value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, *(void *)&a3);

  return v7;
}

- (id)localizedShortTypeDistinguishingUnitStringForPowerType:(unint64_t)a3 unitString:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 12)
  {
    uint64_t v7 = NSString;
    id v8 = FIUIBundle();
    id v9 = [v8 localizedStringForKey:@"AVERAGE_POWER_DISTINGUISHING_SHORT" value:&stru_26CF5F1B8 table:@"Localizable"];
    uint64_t v6 = objc_msgSend(v7, "stringWithFormat:", v9, v5);
  }
  return v6;
}

- (id)localizedSpeedUnitString
{
  int v3 = [[FIUIWorkoutActivityType alloc] initWithActivityTypeIdentifier:13 isIndoor:0];
  unint64_t v4 = [(FIUIFormattingManager *)self localizedSpeedUnitStringForActivityType:v3];

  return v4;
}

- (id)localizedSpeedUnitStringForDistanceType:(unint64_t)a3 unitStyle:(unint64_t)a4
{
  uint64_t v7 = [(FIUIFormattingManager *)self unitManager];
  uint64_t v8 = [v7 paceDistanceUnitForDistanceType:a3];

  return [(FIUIFormattingManager *)self localizedSpeedUnitStringForDistanceUnit:v8 unitStyle:a4];
}

- (id)localizedSpeedUnitStringForActivityType:(id)a3
{
  uint64_t v4 = FIUIDistanceTypeForActivityType(a3);
  id v5 = [(FIUIFormattingManager *)self unitManager];
  uint64_t v6 = [v5 userDistanceUnitForDistanceType:v4];

  return [(FIUIFormattingManager *)self localizedSpeedUnitStringForDistanceUnit:v6 unitStyle:1];
}

- (id)localizedSpeedUnitStringForDistanceUnit:(unint64_t)a3 unitStyle:(unint64_t)a4
{
  int IsMetric = FIUIDistanceUnitIsMetric();
  id v5 = FIUIBundle();
  uint64_t v6 = v5;
  if (IsMetric) {
    uint64_t v7 = @"KPH_SHORT";
  }
  else {
    uint64_t v7 = @"MPH_SHORT";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_26CF5F1B8 table:@"Localizable"];

  return v8;
}

- (id)localizedPaceUnitStringWithDistanceType:(unint64_t)a3 distanceUnit:(unint64_t)a4 unitStyle:(int64_t)a5
{
  uint64_t v8 = FIUIPaceFormatForDistanceType();
  unint64_t v9 = ((uint64_t (*)(void))FIUINumberOfUnitsInPaceForPaceFormat)();
  unint64_t v10 = v9;
  if ((unint64_t)(a5 - 1) >= 2)
  {
    if (a5 == 3)
    {
      double v11 = [(FIUIFormattingManager *)self localizedLongUnitStringForDistanceUnit:a4 distanceInUnit:(double)v9];
      double v12 = @"PACE_MANY_UNIT_FORMAT_LONG";
    }
    else
    {
      double v12 = 0;
      double v11 = &stru_26CF5F1B8;
    }
  }
  else
  {
    double v11 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:a4];
    double v12 = @"PACE_MANY_UNIT_FORMAT";
  }
  if (v10 >= 2)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:FIUINumberOfUnitsInPaceForPaceFormat(v8)];
    id v15 = [v13 stringWithNumber:v14 decimalPrecision:1];

    id v16 = NSString;
    unint64_t v17 = FIUIBundle();
    unint64_t v18 = [v17 localizedStringForKey:v12 value:&stru_26CF5F1B8 table:@"Localizable"];
    uint64_t v19 = objc_msgSend(v16, "localizedStringWithFormat:", v18, v15, v11);

    double v11 = (__CFString *)v19;
  }
  return v11;
}

- (id)finalLocalizedKeyForKey:(id)a3 multiline:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v4)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [NSString stringWithFormat:@"%@%@", v5, @"_ONE_LINE"];
  }
  uint64_t v8 = v7;

  return v8;
}

- (id)localizedDistinguishingPaceUnitStringWithMetricType:(unint64_t)a3 distanceType:(unint64_t)a4 distanceUnit:(unint64_t)a5 paceFormat:(int64_t)a6 abbreviated:(BOOL)a7 multiline:(BOOL)a8
{
  BOOL v8 = a8;
  if (a3 == 41)
  {
    double v11 = FIUIBundle();
    double v12 = v11;
    if (a6 == 4)
    {
      uint64_t v13 = [v11 localizedStringForKey:@"SPEED_LABEL" value:&stru_26CF5F1B8 table:@"Localizable"];

      uint64_t v14 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:@"INTERVAL_SPEED_DISTINGUISHING" multiline:v8];
      id v15 = NSString;
      id v16 = FIUIBundle();
      unint64_t v17 = [v16 localizedStringForKey:v14 value:&stru_26CF5F1B8 table:@"Localizable"];
      unint64_t v18 = objc_msgSend(v15, "stringWithFormat:", v17, v13);
      uint64_t v19 = [v18 localizedUppercaseString];

      double v12 = (void *)v13;
    }
    else
    {
      uint64_t v35 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:@"INTERVAL_PACE_DISTINGUISHING" multiline:v8];
      uint64_t v19 = [v12 localizedStringForKey:v35 value:&stru_26CF5F1B8 table:@"Localizable"];
    }
    goto LABEL_118;
  }
  BOOL v20 = a7;
  if (a6 != 4)
  {
    uint64_t v37 = 2;
    if (FIUIDistanceUnitIsMetric()) {
      uint64_t v38 = 2;
    }
    else {
      uint64_t v38 = 3;
    }
    if ((unint64_t)FIUINumberOfUnitsInPaceForPaceFormat(a6) < 2) {
      uint64_t v37 = v38;
    }
    if (a3 <= 0x24 && ((1 << a3) & 0x1000800110) != 0 && FIUINumberOfUnitsInPaceForPaceFormat(a6) == 1)
    {
      long long v39 = FIUIBundle();
      uint64_t v40 = [v39 localizedStringForKey:@"PACE_LABEL" value:&stru_26CF5F1B8 table:@"Localizable"];
    }
    else
    {
      long long v39 = [(FIUIFormattingManager *)self localizedPaceUnitStringWithDistanceType:a4 distanceUnit:a5 unitStyle:v37];
      uint64_t v40 = [v39 localizedUppercaseString];
    }
    uint64_t v19 = (void *)v40;

    if ((uint64_t)a3 <= 17)
    {
      switch(a3)
      {
        case 4uLL:
          int IsMetric = FIUIDistanceUnitIsMetric();
          uint64_t v42 = NSString;
          double v12 = FIUIBundle();
          if (v20)
          {
            if (IsMetric) {
              v43 = @"CURRENT_PACE_DISTINGUISHING_SHORT_METRIC";
            }
            else {
              v43 = @"CURRENT_PACE_DISTINGUISHING_SHORT_IMPERIAL";
            }
          }
          else if (IsMetric)
          {
            v43 = @"CURRENT_PACE_DISTINGUISHING_LONG_METRIC";
          }
          else
          {
            v43 = @"CURRENT_PACE_DISTINGUISHING_LONG_IMPERIAL";
          }
          break;
        case 8uLL:
          if (v20)
          {
            v66 = NSString;
            double v12 = FIUIBundle();
            v67 = @"AVERAGE_PACE_DISTINGUISHING_SHORT";
          }
          else
          {
            int v74 = FIUIDistanceUnitIsMetric();
            v66 = NSString;
            double v12 = FIUIBundle();
            if (v74) {
              v67 = @"AVERAGE_PACE_DISTINGUISHING_LONG_METRIC";
            }
            else {
              v67 = @"AVERAGE_PACE_DISTINGUISHING_LONG_IMPERIAL";
            }
          }
          v58 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v67 multiline:v8];
          v62 = [v12 localizedStringForKey:v58 value:&stru_26CF5F1B8 table:@"Localizable"];
          objc_msgSend(v66, "stringWithFormat:", v62, v19);
          goto LABEL_116;
        case 0xEuLL:
          int v46 = FIUIDistanceUnitIsMetric();
          uint64_t v42 = NSString;
          double v12 = FIUIBundle();
          if (v20)
          {
            if (v46) {
              v43 = @"ROLLING_PACE_DISTINGUISHING_SHORT_METRIC";
            }
            else {
              v43 = @"ROLLING_PACE_DISTINGUISHING_SHORT_IMPERIAL";
            }
          }
          else if (v46)
          {
            v43 = @"ROLLING_PACE_DISTINGUISHING_LONG_METRIC";
          }
          else
          {
            v43 = @"ROLLING_PACE_DISTINGUISHING_LONG_IMPERIAL";
          }
          break;
        default:
          goto LABEL_119;
      }
    }
    else if ((uint64_t)a3 > 35)
    {
      if (a3 == 36)
      {
        int v65 = FIUIDistanceUnitIsMetric();
        uint64_t v42 = NSString;
        double v12 = FIUIBundle();
        if (v20)
        {
          if (v65) {
            v43 = @"SPLIT_PACE_DISTINGUISHING_SHORT_METRIC";
          }
          else {
            v43 = @"SPLIT_PACE_DISTINGUISHING_SHORT_IMPERIAL";
          }
        }
        else if (v65)
        {
          v43 = @"SPLIT_PACE_DISTINGUISHING_LONG_METRIC";
        }
        else
        {
          v43 = @"SPLIT_PACE_DISTINGUISHING_LONG_IMPERIAL";
        }
      }
      else
      {
        if (a3 != 48) {
          goto LABEL_119;
        }
        int v47 = FIUIDistanceUnitIsMetric();
        uint64_t v42 = NSString;
        double v12 = FIUIBundle();
        if (v20)
        {
          if (v47) {
            v43 = @"FASTEST_PACE_DISTINGUISHING_SHORT_METRIC";
          }
          else {
            v43 = @"FASTEST_PACE_DISTINGUISHING_SHORT_IMPERIAL";
          }
        }
        else if (v47)
        {
          v43 = @"FASTEST_PACE_DISTINGUISHING_LONG_METRIC";
        }
        else
        {
          v43 = @"FASTEST_PACE_DISTINGUISHING_LONG_IMPERIAL";
        }
      }
    }
    else
    {
      if (a3 == 18)
      {
        v54 = FIUIBundle();
        v55 = [v54 localizedStringForKey:@"PACE_LABEL" value:&stru_26CF5F1B8 table:@"Localizable"];

        int v56 = FIUIDistanceUnitIsMetric();
        v57 = NSString;
        v58 = FIUIBundle();
        v59 = @"REQUIRED_PACE_DISTINGUISHING_SHORT_IMPERIAL";
        if (v56) {
          v59 = @"REQUIRED_PACE_DISTINGUISHING_SHORT_METRIC";
        }
        v60 = @"REQUIRED_PACE_DISTINGUISHING_LONG_METRIC";
        if (!v56) {
          v60 = @"REQUIRED_PACE_DISTINGUISHING_LONG_IMPERIAL";
        }
        if (v20) {
          v61 = v59;
        }
        else {
          v61 = v60;
        }
        v62 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v61 multiline:v8];
        v63 = [v58 localizedStringForKey:v62 value:&stru_26CF5F1B8 table:@"Localizable"];
        double v12 = objc_msgSend(v57, "stringWithFormat:", v63, v55);

        goto LABEL_117;
      }
      if (a3 != 23) {
        goto LABEL_119;
      }
      int v41 = FIUIDistanceUnitIsMetric();
      uint64_t v42 = NSString;
      double v12 = FIUIBundle();
      if (v20)
      {
        if (v41) {
          v43 = @"SEGMENT_PACE_DISTINGUISHING_SHORT_METRIC";
        }
        else {
          v43 = @"SEGMENT_PACE_DISTINGUISHING_SHORT_IMPERIAL";
        }
      }
      else if (v41)
      {
        v43 = @"SEGMENT_PACE_DISTINGUISHING_LONG_METRIC";
      }
      else
      {
        v43 = @"SEGMENT_PACE_DISTINGUISHING_LONG_IMPERIAL";
      }
    }
    v58 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v43 multiline:v8];
    v62 = [v12 localizedStringForKey:v58 value:&stru_26CF5F1B8 table:@"Localizable"];
    objc_msgSend(v42, "stringWithFormat:", v62, v19);
LABEL_116:
    uint64_t v19 = v63 = v19;
LABEL_117:

    goto LABEL_118;
  }
  double v23 = FIUIBundle();
  double v12 = [v23 localizedStringForKey:@"SPEED_LABEL" value:&stru_26CF5F1B8 table:@"Localizable"];

  if ((uint64_t)a3 > 22)
  {
    switch(a3)
    {
      case 0x17uLL:
        if (v20)
        {
          v44 = NSString;
          uint64_t v34 = FIUIBundle();
          v45 = @"SEGMENT_SPEED_DISTINGUISHING_SHORT";
          goto LABEL_59;
        }
        int v72 = FIUIDistanceUnitIsMetric();
        v69 = NSString;
        uint64_t v34 = FIUIBundle();
        if (v72) {
          v70 = @"SEGMENT_SPEED_DISTINGUISHING_LONG_METRIC";
        }
        else {
          v70 = @"SEGMENT_SPEED_DISTINGUISHING_LONG_IMPERIAL";
        }
        break;
      case 0x24uLL:
        if (v20)
        {
          v44 = NSString;
          uint64_t v34 = FIUIBundle();
          v45 = @"SPLIT_SPEED_DISTINGUISHING_SHORT";
          goto LABEL_59;
        }
        int v73 = FIUIDistanceUnitIsMetric();
        v69 = NSString;
        uint64_t v34 = FIUIBundle();
        if (v73) {
          v70 = @"SPLIT_SPEED_DISTINGUISHING_LONG_METRIC";
        }
        else {
          v70 = @"SPLIT_SPEED_DISTINGUISHING_LONG_IMPERIAL";
        }
        break;
      case 0x30uLL:
        if (v20)
        {
          v44 = NSString;
          uint64_t v34 = FIUIBundle();
          v45 = @"MAX_SPEED_DISTINGUISHING_SHORT";
LABEL_59:
          uint64_t v28 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v45 multiline:v8];
          v51 = [v34 localizedStringForKey:v28 value:&stru_26CF5F1B8 table:@"Localizable"];
          v52 = objc_msgSend(v44, "stringWithFormat:", v51, v12);
          uint64_t v53 = [v52 localizedUppercaseString];

          double v12 = (void *)v53;
LABEL_103:

          goto LABEL_104;
        }
        int v68 = FIUIDistanceUnitIsMetric();
        v69 = NSString;
        uint64_t v34 = FIUIBundle();
        if (v68) {
          v70 = @"MAX_SPEED_DISTINGUISHING_LONG_METRIC";
        }
        else {
          v70 = @"MAX_SPEED_DISTINGUISHING_LONG_IMPERIAL";
        }
        break;
      default:
        goto LABEL_104;
    }
LABEL_102:
    uint64_t v28 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v70 multiline:v8];
    v75 = [v34 localizedStringForKey:v28 value:&stru_26CF5F1B8 table:@"Localizable"];
    uint64_t v76 = objc_msgSend(v69, "stringWithFormat:", v75, v12);

    double v12 = (void *)v76;
    goto LABEL_103;
  }
  switch(a3)
  {
    case 4uLL:
      int v48 = FIUIDistanceUnitIsMetric();
      v49 = FIUIBundle();
      uint64_t v34 = v49;
      if (v48) {
        v50 = @"KPH_SHORT";
      }
      else {
        v50 = @"MPH_SHORT";
      }
      [v49 localizedStringForKey:v50 value:&stru_26CF5F1B8 table:@"Localizable"];
      double v12 = v28 = v12;
      goto LABEL_103;
    case 8uLL:
      if (v20)
      {
        v44 = NSString;
        uint64_t v34 = FIUIBundle();
        v45 = @"AVERAGE_SPEED_DISTINGUISHING_SHORT";
        goto LABEL_59;
      }
      int v71 = FIUIDistanceUnitIsMetric();
      v69 = NSString;
      uint64_t v34 = FIUIBundle();
      if (v71) {
        v70 = @"AVERAGE_SPEED_DISTINGUISHING_LONG_METRIC";
      }
      else {
        v70 = @"AVERAGE_SPEED_DISTINGUISHING_LONG_IMPERIAL";
      }
      goto LABEL_102;
    case 0x12uLL:
      uint64_t v24 = FIUIBundle();
      double v25 = [v24 localizedStringForKey:@"SPEED_LABEL" value:&stru_26CF5F1B8 table:@"Localizable"];

      int v26 = FIUIDistanceUnitIsMetric();
      uint64_t v27 = NSString;
      uint64_t v28 = FIUIBundle();
      uint64_t v29 = @"REQUIRED_PACE_DISTINGUISHING_SHORT_IMPERIAL";
      if (v26) {
        uint64_t v29 = @"REQUIRED_PACE_DISTINGUISHING_SHORT_METRIC";
      }
      v30 = @"REQUIRED_PACE_DISTINGUISHING_LONG_METRIC";
      if (!v26) {
        v30 = @"REQUIRED_PACE_DISTINGUISHING_LONG_IMPERIAL";
      }
      if (v20) {
        v31 = v29;
      }
      else {
        v31 = v30;
      }
      v32 = [(FIUIFormattingManager *)self finalLocalizedKeyForKey:v31 multiline:v8];
      v33 = [v28 localizedStringForKey:v32 value:&stru_26CF5F1B8 table:@"Localizable"];
      uint64_t v34 = objc_msgSend(v27, "stringWithFormat:", v33, v25);

      goto LABEL_103;
  }
LABEL_104:
  uint64_t v19 = [v12 localizedUppercaseString];
LABEL_118:

LABEL_119:
  return v19;
}

- (id)localizedDistinguishingCadenceUnitStringWithMetricType:(unint64_t)a3
{
  BOOL v4 = [(id)objc_opt_class() localizedShortCadenceUnitStringForActivityType:37];
  id v5 = NSString;
  uint64_t v6 = FIUIBundle();
  id v7 = v6;
  if (a3 == 16) {
    BOOL v8 = @"AVERAGE_CADENCE_DISTINGUISHING_LONG";
  }
  else {
    BOOL v8 = @"CURRENT_CADENCE_DISTINGUISHING_LONG";
  }
  unint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26CF5F1B8 table:@"Localizable"];
  unint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v9, v4);

  double v11 = [v10 localizedUppercaseString];

  return v11;
}

- (id)localizedDistinguishingPowerUnitStringWithMetricType:(unint64_t)a3
{
  BOOL v4 = [(id)objc_opt_class() localizedShortPowerUnitString];
  id v5 = NSString;
  uint64_t v6 = FIUIBundle();
  id v7 = v6;
  if (a3 == 12) {
    BOOL v8 = @"AVERAGE_POWER_DISTINGUISHING_LONG";
  }
  else {
    BOOL v8 = @"CURRENT_POWER_DISTINGUISHING_LONG";
  }
  unint64_t v9 = [v6 localizedStringForKey:v8 value:&stru_26CF5F1B8 table:@"Localizable"];
  unint64_t v10 = objc_msgSend(v5, "stringWithFormat:", v9, v4);

  double v11 = [v10 localizedUppercaseString];

  return v11;
}

- (id)localizedDistinguishingPowerStringWithMetricType:(unint64_t)a3
{
  BOOL v4 = NSString;
  id v5 = FIUIBundle();
  uint64_t v6 = v5;
  if (a3 == 12) {
    id v7 = @"AVERAGE_POWER_DISTINGUISHING_LONG";
  }
  else {
    id v7 = @"CURRENT_POWER_DISTINGUISHING_LONG";
  }
  BOOL v8 = [v5 localizedStringForKey:v7 value:&stru_26CF5F1B8 table:@"Localizable"];
  unint64_t v9 = objc_msgSend(v4, "stringWithFormat:", v8, @"Power");

  unint64_t v10 = [v9 localizedUppercaseString];

  return v10;
}

- (unint64_t)userDistanceUnitForSwimmingLapLength
{
  if (FIUICurrentLocaleUsesMetricSystem()) {
    return 1;
  }
  else {
    return 4;
  }
}

- (id)localizedStringWithPersonHeight:(id)a3 unitStyle:(int64_t)a4
{
  id v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  uint64_t v6 = (void *)_LengthFormatterForPersonHeight___formatter;
  if (!_LengthFormatterForPersonHeight___formatter)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F08940]);
    BOOL v8 = (void *)_LengthFormatterForPersonHeight___formatter;
    _LengthFormatterForPersonHeight___formatter = (uint64_t)v7;

    [(id)_LengthFormatterForPersonHeight___formatter setForPersonHeightUse:1];
    uint64_t v6 = (void *)_LengthFormatterForPersonHeight___formatter;
  }
  unint64_t v9 = _IntegerNumberFormatter(5);
  [v6 setNumberFormatter:v9];

  [(id)_LengthFormatterForPersonHeight___formatter setUnitStyle:a4];
  unint64_t v10 = (void *)MEMORY[0x263F0A830];
  id v11 = (id)_LengthFormatterForPersonHeight___formatter;
  double v12 = [v10 meterUnit];
  [v5 doubleValueForUnit:v12];
  double v14 = v13;

  id v15 = [v11 stringFromMeters:v14];

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  return v15;
}

- (double)roundedDailyMoveGoal:(double)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2) {
    [(FIUIFormattingManager *)self roundedDailyMoveGoalForMoveMinutes:a3];
  }
  else {
    [(FIUIFormattingManager *)self roundedDailyMoveGoalForCalories:a3];
  }
  return result;
}

- (double)roundedDailyMoveGoalForMoveMinutes:(double)a3
{
  return round(a3 / 10.0) * 10.0;
}

- (double)roundedDailyMoveGoalForCalories:(double)a3
{
  BOOL v4 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
  char IsCalorieUnit = FIUIHKUnitIsCalorieUnit();

  if (IsCalorieUnit) {
    return round(a3 / 10.0) * 10.0;
  }
  id v7 = [MEMORY[0x263F0A830] jouleUnitWithMetricPrefix:9];
  BOOL v8 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v8 _valueByConvertingValue:v7 toUnit:a3];
  double v10 = v9;

  id v11 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v7 _valueByConvertingValue:v11 toUnit:round(v10 / 20.0) * 20.0];
  double v13 = v12;

  return v13;
}

- (double)energyBurnedInUserUnitForCalories:(double)a3
{
  BOOL v4 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
  id v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v5 _valueByConvertingValue:v4 toUnit:a3];
  double v7 = v6;

  return v7;
}

- (double)caloriesForEnergyBurnedInUserUnit:(double)a3
{
  BOOL v4 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
  id v5 = [MEMORY[0x263F0A830] kilocalorieUnit];
  [v4 _valueByConvertingValue:v5 toUnit:a3];
  double v7 = v6;

  return v7;
}

- (id)localizedStringWithMoveQuantity:(id)a3 activityMoveMode:(int64_t)a4
{
  if (a4 == 2) {
    [(FIUIFormattingManager *)self localizedStringWithMoveMinutes:a3];
  }
  else {
  BOOL v4 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:a3];
  }
  return v4;
}

- (id)localizedStringWithMoveMinutes:(id)a3
{
  int v3 = (void *)MEMORY[0x263F0A830];
  id v4 = a3;
  id v5 = [v3 minuteUnit];
  int v6 = _HKWorkoutFlooredValueForQuantity();

  double v7 = objc_opt_class();
  BOOL v8 = [NSNumber numberWithInteger:v6];
  double v9 = [v7 stringWithNumber:v8 decimalPrecision:1];

  return v9;
}

- (id)localizedStringWithMoveMinutes:(id)a3 unitStyle:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x263F0A830];
  id v6 = a3;
  double v7 = [v5 minuteUnit];
  int v8 = _HKWorkoutFlooredValueForQuantity();

  if (a4 > 3) {
    double v9 = 0;
  }
  else {
    double v9 = off_2644A8B30[a4];
  }
  uint64_t v10 = v8;
  id v11 = NSString;
  double v12 = FIUIBundle();
  double v13 = [v12 localizedStringForKey:v9 value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  double v14 = objc_msgSend(v11, "localizedStringWithFormat:", v13, v10);

  id v15 = [NSString stringWithFormat:@"%ld %@", v10, v14];

  return v15;
}

- (id)localizedStringWithBriskMinutes:(id)a3
{
  int v3 = (void *)MEMORY[0x263F0A830];
  id v4 = a3;
  id v5 = [v3 minuteUnit];
  int v6 = _HKWorkoutFlooredValueForQuantity();

  double v7 = objc_opt_class();
  int v8 = [NSNumber numberWithInteger:v6];
  double v9 = [v7 stringWithNumber:v8 decimalPrecision:1];

  return v9;
}

- (id)localizedStringWithActiveHours:(id)a3
{
  int v3 = (void *)MEMORY[0x263F0A830];
  id v4 = a3;
  id v5 = [v3 countUnit];
  int v6 = _HKWorkoutFlooredValueForQuantity();

  double v7 = objc_opt_class();
  int v8 = [NSNumber numberWithInteger:v6];
  double v9 = [v7 stringWithNumber:v8 decimalPrecision:1];

  return v9;
}

- (id)localizedStringWithMoveQuantity:(id)a3 unitStyle:(unint64_t)a4 activityMoveMode:(int64_t)a5
{
  if (a5 == 2) {
    [(FIUIFormattingManager *)self localizedStringWithMoveMinutes:a3 unitStyle:a4];
  }
  else {
  id v5 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:a3 unitStyle:a4];
  }
  return v5;
}

- (id)localizedStringWithActiveEnergy:(id)a3
{
  return [(FIUIFormattingManager *)self localizedStringWithEnergy:a3 energyType:1 unitStyle:0];
}

- (id)localizedStringWithEnergyInCalories:(double)a3 energyType:(unint64_t)a4 unitStyle:(unint64_t)a5
{
  double v9 = (void *)MEMORY[0x263F0A630];
  uint64_t v10 = [MEMORY[0x263F0A830] kilocalorieUnit];
  id v11 = [v9 quantityWithUnit:v10 doubleValue:a3];

  double v12 = [(FIUIFormattingManager *)self localizedStringWithEnergy:v11 energyType:a4 unitStyle:a5];

  return v12;
}

- (id)localizedShortTypeDistinguishingUnitStringForEnergyType:(unint64_t)a3 workoutSectionType:(unint64_t)a4 multiline:(BOOL)a5
{
  int v6 = @"SEGMENT_";
  if (a4 != 3) {
    int v6 = &stru_26CF5F1B8;
  }
  double v7 = @"ACTIVE";
  if (a3 == 3) {
    double v7 = @"TOTAL";
  }
  if (a5) {
    int v8 = @"%@%@_DISTINGUISHING_SHORT";
  }
  else {
    int v8 = @"%@%@_DISTINGUISHING_SHORT_ONE_LINE";
  }
  double v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v6, v7);
  uint64_t v10 = FIUIBundle();
  id v11 = [(FIUIFormattingManager *)self localizationKeyForEnergyBaseKey:v9];
  double v12 = [v10 localizedStringForKey:v11 value:&stru_26CF5F1B8 table:@"Localizable"];

  return v12;
}

+ (unint64_t)sectionTypeForMetricType:(unint64_t)a3
{
  if (a3 - 21 >= 5) {
    return 1;
  }
  else {
    return 3;
  }
}

- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3
{
  if (a3 == 2) {
    [(FIUIFormattingManager *)self localizedLongMoveMinutesUnitString];
  }
  else {
  int v3 = [(FIUIFormattingManager *)self localizedLongActiveEnergyUnitString];
  }
  return v3;
}

- (id)localizedLongMoveUnitStringWithActivityMoveMode:(int64_t)a3 value:(unint64_t)a4
{
  if (a3 == 2) {
    [(FIUIFormattingManager *)self localizedLongMoveMinutesUnitStringForValue:a4];
  }
  else {
  id v4 = [(FIUIFormattingManager *)self localizedLongActiveEnergyUnitString];
  }
  return v4;
}

- (id)localizedLongMoveMinutesUnitString
{
  return [(FIUIFormattingManager *)self localizedLongMoveMinutesUnitStringWithTextCase:3];
}

- (id)localizedLongMoveMinutesUnitStringForValue:(unint64_t)a3
{
  return [(FIUIFormattingManager *)self localizedLongMoveMinutesUnitStringWithTextCase:3 value:a3];
}

- (id)localizedMediumMoveMinutesUnitString
{
  return [(FIUIFormattingManager *)self localizedMediumMoveMinutesUnitStringWithTextCase:3];
}

- (id)localizedMediumMoveMinutesUnitStringForValue:(unint64_t)a3
{
  return [(FIUIFormattingManager *)self localizedMediumMoveMinutesUnitStringWithTextCase:3 value:a3];
}

- (id)localizedLongBriskMinutesUnitString
{
  v2 = NSString;
  int v3 = FIUIBundle();
  id v4 = [v3 localizedStringForKey:@"BRISK_MINUTES_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  id v5 = [v2 localizedStringWithFormat:v4];
  int v6 = [v5 localizedUppercaseString];

  return v6;
}

- (id)localizedLongBriskMinutesUnitStringForValue:(unint64_t)a3
{
  id v4 = NSString;
  id v5 = FIUIBundle();
  int v6 = [v5 localizedStringForKey:@"BRISK_MINUTES_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  double v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  int v8 = [v7 localizedUppercaseString];

  return v8;
}

- (id)localizedLongActiveHoursUnitString
{
  v2 = NSString;
  int v3 = FIUIBundle();
  id v4 = [v3 localizedStringForKey:@"ACTIVE_HOURS_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  id v5 = [v2 localizedStringWithFormat:v4];
  int v6 = [v5 localizedUppercaseString];

  return v6;
}

- (id)localizedLongActiveHoursUnitStringForValue:(unint64_t)a3
{
  id v4 = NSString;
  id v5 = FIUIBundle();
  int v6 = [v5 localizedStringForKey:@"ACTIVE_HOURS_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  double v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, a3);
  int v8 = [v7 localizedUppercaseString];

  return v8;
}

- (id)localizedShortBriskMinutesUnitString
{
  v2 = NSString;
  int v3 = FIUIBundle();
  id v4 = [v3 localizedStringForKey:@"BRISK_MINUTES_UNIT_SHORT" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  id v5 = [v2 localizedStringWithFormat:v4];
  int v6 = [v5 localizedUppercaseString];

  return v6;
}

- (id)localizedShortActiveHoursUnitString
{
  v2 = NSString;
  int v3 = FIUIBundle();
  id v4 = [v3 localizedStringForKey:@"ACTIVE_HOURS_UNIT_SHORT" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  id v5 = [v2 localizedStringWithFormat:v4];
  int v6 = [v5 localizedUppercaseString];

  return v6;
}

- (id)localizedLongActiveEnergyUnitString
{
  return [(FIUIFormattingManager *)self localizedLongActiveEnergyUnitStringWithTextCase:3];
}

- (id)localizedLongActiveEnergyUnitStringWithTextCase:(unint64_t)a3
{
  id v5 = [(FIUIUnitManager *)self->_unitManager userActiveEnergyBurnedUnit];
  int v6 = [(FIUIFormattingManager *)self _energyBurnedUnitStringForUnit:v5 useShortString:0];

  double v7 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CF749C8];
  int v8 = [MEMORY[0x263EFF960] currentLocale];
  double v9 = [v8 objectForKey:*MEMORY[0x263EFF508]];
  char v10 = [v7 containsObject:v9];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(FIUIFormattingManager *)self applyTextCase:a3 toString:v6];

    int v6 = (void *)v11;
  }

  return v6;
}

- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3
{
  id v5 = NSString;
  int v6 = FIUIBundle();
  double v7 = [v6 localizedStringForKey:@"APPLE_MOVE_TIME_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  int v8 = [v5 localizedStringWithFormat:v7];

  double v9 = [(FIUIFormattingManager *)self applyTextCase:a3 toString:v8];

  return v9;
}

- (id)localizedLongMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4
{
  double v7 = NSString;
  int v8 = FIUIBundle();
  double v9 = [v8 localizedStringForKey:@"APPLE_MOVE_TIME_UNIT_LONG" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  char v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);

  uint64_t v11 = [(FIUIFormattingManager *)self applyTextCase:a3 toString:v10];

  return v11;
}

- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3
{
  id v5 = NSString;
  int v6 = FIUIBundle();
  double v7 = [v6 localizedStringForKey:@"APPLE_MOVE_TIME_UNIT_MEDIUM" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  int v8 = [v5 localizedStringWithFormat:v7];

  double v9 = [(FIUIFormattingManager *)self applyTextCase:a3 toString:v8];

  return v9;
}

- (id)localizedMediumMoveMinutesUnitStringWithTextCase:(unint64_t)a3 value:(unint64_t)a4
{
  double v7 = NSString;
  int v8 = FIUIBundle();
  double v9 = [v8 localizedStringForKey:@"APPLE_MOVE_TIME_UNIT_MEDIUM" value:&stru_26CF5F1B8 table:@"Localizable-tinker"];
  char v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);

  uint64_t v11 = [(FIUIFormattingManager *)self applyTextCase:a3 toString:v10];

  return v11;
}

- (id)localizedGoalDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [v8 metadata];
  char v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  [v10 BOOLValue];

  [v8 workoutActivityType];
  objc_msgSend(v8, "fiui_swimmingLocationType");
  uint64_t v11 = FIUILocalizedNameForActivityType();
  double v12 = objc_msgSend(v8, "fiui_activityType");
  if ([v8 workoutActivityType] == 84)
  {
    double v13 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09F18]];
    double v14 = [v8 statisticsForType:v13];

    id v15 = [v14 maximumQuantity];
    id v16 = [MEMORY[0x263F0A830] meterUnit];
    [v15 doubleValueForUnit:v16];
    double v18 = fabs(v17);

    *a4 = [(FIUIFormattingManager *)self localizedDepthValue:1 depthUnit:v18];
    uint64_t v19 = [(FIUIFormattingManager *)self localizedStringWithDepthInMeters:1 depthUnit:v18];

    BOOL v20 = &stru_26CF5F1B8;
  }
  else
  {
    switch([(FIUIFormattingManager *)self _effectiveGoalTypeForWorkout:v8])
    {
      case 0uLL:
      case 3uLL:
        uint64_t v21 = [(FIUIFormattingManager *)self _localizedEnergyDescriptionForWorkout:v8 withValue:a4 appendActivityType:v5 activityTypeString:v11];
        goto LABEL_9;
      case 1uLL:
        double v23 = [v8 totalDistance];
        uint64_t v24 = FIUIDistanceTypeForActivityType(v12);
        double v25 = [MEMORY[0x263F0A830] meterUnit];
        [v23 doubleValueForUnit:v25];
        -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", v24, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        int v26 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceType:v24];
        uint64_t v27 = [v26 localizedUppercaseString];

        uint64_t v28 = NSString;
        uint64_t v29 = FIUIBundle();
        v30 = v29;
        if (v5)
        {
          v31 = [v29 localizedStringForKey:@"DISTANCE_GOAL_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
          objc_msgSend(v28, "stringWithFormat:", v31, *a4, v27, v11);
        }
        else
        {
          v31 = [v29 localizedStringForKey:@"WORKOUT_STATISTICS_UNIT_FORMAT_NO_SPACE" value:&stru_26CF5F1B8 table:@"Localizable"];
          objc_msgSend(v28, "stringWithFormat:", v31, *a4, v27, v33);
        }
        double v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      case 2uLL:
        uint64_t v21 = [(FIUIFormattingManager *)self _localizedTimeDescriptionForWorkout:v8 withValue:a4 appendActivityType:v5 activityTypeString:v11];
LABEL_9:
        double v22 = (__CFString *)v21;
        break;
      default:
        double v22 = &stru_26CF5F1B8;
        break;
    }
    BOOL v20 = v22;
    uint64_t v19 = v20;
  }

  return v19;
}

- (id)localizedGoalValueForWorkout:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "fiui_activityType");
  if ([v4 workoutActivityType] == 84)
  {
    int v6 = [MEMORY[0x263F0A598] quantityTypeForIdentifier:*MEMORY[0x263F09F18]];
    double v7 = [v4 statisticsForType:v6];

    if (v7)
    {
      id v8 = [v7 maximumQuantity];
      double v9 = [MEMORY[0x263F0A830] meterUnit];
      [v8 doubleValueForUnit:v9];
      double v11 = fabs(v10);
    }
    else
    {
      double v11 = 0.0;
    }
    double v13 = [(FIUIUnitManager *)self->_unitManager userDepthHKUnit];
    double v14 = [MEMORY[0x263F0A830] meterUnit];
    if (v13 == v14) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }

    double v12 = [(FIUIFormattingManager *)self localizedDepthValue:v15 depthUnit:v11];
LABEL_11:
    self = v12;
LABEL_12:
  }
  else
  {
    switch([(FIUIFormattingManager *)self _effectiveGoalTypeForWorkout:v4])
    {
      case 0uLL:
      case 3uLL:
        double v7 = [v4 totalEnergyBurned];
        double v12 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:v7 unitStyle:0];
        goto LABEL_11;
      case 1uLL:
        double v7 = [v4 totalDistance];
        uint64_t v17 = FIUIDistanceTypeForActivityType(v5);
        double v18 = [MEMORY[0x263F0A830] meterUnit];
        [v7 doubleValueForUnit:v18];
        -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", v17, 0);
        self = (FIUIFormattingManager *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      case 2uLL:
        self = [(FIUIFormattingManager *)self _localizedTimeValueForWorkout:v4];
        break;
      default:
        break;
    }
  }

  return self;
}

- (id)localizedGoalUnitForWorkout:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(v4, "fiui_activityType");
  if ([v4 workoutActivityType] == 84)
  {
    int v6 = [(FIUIUnitManager *)self->_unitManager userDepthHKUnit];
    double v7 = [MEMORY[0x263F0A830] meterUnit];
    if (v6 == v7) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }

    uint64_t v9 = [(FIUIFormattingManager *)self localizedDepthUnit:v8];
    goto LABEL_11;
  }
  unint64_t v10 = [(FIUIFormattingManager *)self _effectiveGoalTypeForWorkout:v4];
  if (!v10 || v10 == 3)
  {
    uint64_t v9 = [(FIUIFormattingManager *)self localizedShortActiveEnergyUnitString];
LABEL_11:
    double v12 = (__CFString *)v9;
    goto LABEL_12;
  }
  if (v10 == 1)
  {
    double v11 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceType:FIUIDistanceTypeForActivityType(v5)];
    double v12 = [v11 localizedUppercaseString];
  }
  else
  {
    double v12 = &stru_26CF5F1B8;
  }
LABEL_12:

  return v12;
}

- (id)_localizedTimeDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  [a3 duration];
  double v12 = v11;
  double v13 = fmod(v11, 60.0);
  if (v13 < 30.0) {
    double v13 = -v13;
  }
  id v14 = [(FIUIFormattingManager *)self stringWithDuration:4 durationFormat:v12 + v13];
  *a4 = v14;
  if (v6)
  {
    uint64_t v15 = NSString;
    id v16 = FIUIBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"TIME_GOAL_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
    objc_msgSend(v15, "stringWithFormat:", v17, *a4, v10);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v14;
  }

  return v18;
}

- (id)_localizedTimeValueForWorkout:(id)a3
{
  [a3 duration];
  double v5 = v4;
  double v6 = fmod(v4, 60.0);
  if (v6 < 30.0) {
    double v6 = -v6;
  }
  double v7 = v5 + v6;
  return [(FIUIFormattingManager *)self stringWithDuration:4 durationFormat:v7];
}

- (id)_localizedEnergyDescriptionForWorkout:(id)a3 withValue:(id *)a4 appendActivityType:(BOOL)a5 activityTypeString:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  long double v11 = [a3 totalEnergyBurned];
  *a4 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:v11 unitStyle:0];
  double v12 = [(FIUIFormattingManager *)self localizedShortActiveEnergyUnitString];
  double v13 = NSString;
  id v14 = FIUIBundle();
  uint64_t v15 = v14;
  if (v6)
  {
    id v16 = [v14 localizedStringForKey:@"ENERGY_GOAL_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
    objc_msgSend(v13, "stringWithFormat:", v16, *a4, v12, v10);
  }
  else
  {
    id v16 = [v14 localizedStringForKey:@"WORKOUT_STATISTICS_UNIT_FORMAT_NO_SPACE" value:&stru_26CF5F1B8 table:@"Localizable"];
    objc_msgSend(v13, "stringWithFormat:", v16, *a4, v12, v19);
  uint64_t v17 = };

  return v17;
}

- (unint64_t)_effectiveGoalTypeForWorkout:(id)a3
{
  id v4 = a3;
  double v5 = [v4 sourceRevision];
  BOOL v6 = [v5 source];
  if ([v6 _isAppleWatch])
  {
    int v7 = 1;
  }
  else
  {
    uint64_t v8 = [v4 sourceRevision];
    uint64_t v9 = [v8 source];
    int v7 = [v9 _hasFirstPartyBundleID];
  }
  unint64_t v10 = [v4 _goalType];
  [v4 workoutActivityType];
  long double v11 = _HKWorkoutDistanceTypeForActivityType();
  double v12 = [v4 statisticsForType:v11];

  double v13 = [v12 sumQuantity];
  id v14 = [MEMORY[0x263F0A830] meterUnit];
  [v13 doubleValueForUnit:v14];
  double v16 = v15;

  if (v7)
  {
    if (!v10)
    {
      if (![(FIUIFormattingManager *)self _workoutSupportsDistanceMetricForGoalDisplay:v4]|| v16 <= 2.22044605e-16)
      {
        uint64_t v17 = [v4 totalEnergyBurned];
        BOOL v18 = v17 == 0;

        unint64_t v10 = 2 * v18;
        goto LABEL_14;
      }
LABEL_10:
      unint64_t v10 = 1;
    }
  }
  else
  {
    if (v16 > 2.22044605e-16) {
      goto LABEL_10;
    }
    [v4 duration];
    if (v19 <= 2.22044605e-16) {
      unint64_t v10 = 3;
    }
    else {
      unint64_t v10 = 2;
    }
  }
LABEL_14:

  return v10;
}

- (BOOL)_workoutSupportsDistanceMetricForGoalDisplay:(id)a3
{
  id v3 = a3;
  if ([v3 workoutActivityType] == 82 || objc_msgSend(v3, "workoutActivityType") == 21) {
    char v4 = 0;
  }
  else {
    char v4 = [v3 supportsMetric:1];
  }

  return v4;
}

- (id)localizedCompactGoalDescriptionForGoalType:(unint64_t)a3 goalValue:(double)a4 activityType:(id)a5
{
  double v5 = [(FIUIFormattingManager *)self localizedGoalDescriptionForGoalType:a3 goalValue:a5 activityType:a4];
  BOOL v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:&stru_26CF5F1B8];

  return v6;
}

- (id)localizedKeyMetricStringForWorkout:(id)a3 unitStyle:(unint64_t)a4
{
  id v6 = a3;
  switch([v6 _goalType])
  {
    case 0:
      uint64_t v7 = [(FIUIFormattingManager *)self _localizedOpenGoalKeyMetricStringForWorkout:v6 withUnitStyle:a4];
      goto LABEL_7;
    case 1:
      uint64_t v7 = [(FIUIFormattingManager *)self _localizedKeyMetricDistanceStringForWorkout:v6 withUnitStyle:a4];
      goto LABEL_7;
    case 2:
      uint64_t v7 = [(FIUIFormattingManager *)self _localizedKeyMetricDurationStringWithWorkout:v6];
      goto LABEL_7;
    case 3:
      uint64_t v7 = [(FIUIFormattingManager *)self _localizedKeyMetricEnergyBurnedStringForWorkout:v6 withUnitStyle:a4];
LABEL_7:
      uint64_t v8 = (void *)v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

- (id)_localizedKeyMetricEnergyBurnedStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6 = [a3 totalEnergyBurned];
  uint64_t v7 = [(FIUIFormattingManager *)self localizedStringWithActiveEnergy:v6 unitStyle:a4];

  return v7;
}

- (id)_localizedKeyMetricDistanceStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 totalDistance];
  uint64_t v8 = [MEMORY[0x263F0A830] meterUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;
  long double v11 = objc_msgSend(v6, "fiui_activityType");

  double v12 = [(FIUIFormattingManager *)self localizedNaturalScaleStringWithDistanceInMeters:FIUIDistanceTypeForActivityType(v11) distanceType:a4 unitStyle:0 usedUnit:v10];

  return v12;
}

- (id)_localizedKeyMetricDurationStringWithWorkout:(id)a3
{
  [a3 duration];
  return -[FIUIFormattingManager stringWithDuration:durationFormat:](self, "stringWithDuration:durationFormat:", 4);
}

- (id)_localizedKeyMetricCyclingStringWithWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 totalDistance];
  uint64_t v8 = [MEMORY[0x263F0A830] meterUnit];
  [v7 doubleValueForUnit:v8];
  double v10 = v9;

  long double v11 = [v6 metadata];
  double v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  char v13 = [v12 BOOLValue];

  if ((v13 & 1) != 0 || v10 <= 2.22044605e-16)
  {
    uint64_t v14 = [(FIUIFormattingManager *)self _localizedKeyMetricEnergyBurnedStringForWorkout:v6 withUnitStyle:a4];
  }
  else
  {
    uint64_t v14 = [(FIUIFormattingManager *)self _localizedKeyMetricDistanceStringForWorkout:v6 withUnitStyle:a4];
  }
  double v15 = (void *)v14;

  return v15;
}

- (id)_localizedOpenGoalKeyMetricStringForWorkout:(id)a3 withUnitStyle:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [v6 workoutActivityType];
  if (v7 > 0x34) {
    goto LABEL_6;
  }
  if (((1 << v7) & 0x10402001000000) != 0)
  {
    uint64_t v8 = [(FIUIFormattingManager *)self _localizedKeyMetricDistanceStringForWorkout:v6 withUnitStyle:a4];
    goto LABEL_10;
  }
  if (v7 != 13)
  {
LABEL_6:
    if (v7 == 3000) {
      [(FIUIFormattingManager *)self _localizedKeyMetricDurationStringWithWorkout:v6];
    }
    else {
    uint64_t v8 = [(FIUIFormattingManager *)self _localizedKeyMetricEnergyBurnedStringForWorkout:v6 withUnitStyle:a4];
    }
    goto LABEL_10;
  }
  uint64_t v8 = [(FIUIFormattingManager *)self _localizedKeyMetricCyclingStringWithWorkout:v6 withUnitStyle:a4];
LABEL_10:
  double v9 = (void *)v8;

  return v9;
}

- (id)localizedShareTextWithWorkout:(id)a3 shareValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 metadata];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  int v9 = [v8 BOOLValue];

  uint64_t v10 = [v5 workoutActivityType];
  if (v10 > 43)
  {
    switch(v10)
    {
      case '9':
        long double v11 = @"WORKOUT_SHARING_YOGA_%@";
        goto LABEL_34;
      case ':':
      case '<':
      case '=':
      case '>':
      case '@':
      case 'C':
      case 'D':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'L':
      case 'N':
      case 'O':
        goto LABEL_23;
      case ';':
        long double v11 = @"WORKOUT_SHARING_CORE_TRAINING_%@";
        goto LABEL_34;
      case '?':
        long double v11 = @"WORKOUT_SHARING_HIGH_INTENSITY_INTERVAL_TRAINING_%@";
        goto LABEL_34;
      case 'A':
        long double v11 = @"WORKOUT_SHARING_KICKBOXING_%@";
        goto LABEL_34;
      case 'B':
        long double v11 = @"WORKOUT_SHARING_PILATES_%@";
        goto LABEL_34;
      case 'F':
        long double v11 = @"WORKOUT_SHARING_WHEELCHAIR_WALK_PACE_%@";
        goto LABEL_34;
      case 'G':
        long double v11 = @"WORKOUT_SHARING_WHEELCHAIR_RUN_PACE_%@";
        goto LABEL_34;
      case 'H':
        long double v11 = @"WORKOUT_SHARING_TAI_CHI_%@";
        goto LABEL_34;
      case 'M':
        long double v11 = @"WORKOUT_SHARING_CARDIO_DANCE_%@";
        goto LABEL_34;
      case 'P':
        long double v11 = @"WORKOUT_SHARING_COOLDOWN_%@";
        goto LABEL_34;
      default:
        if (v10 == 44)
        {
          long double v11 = @"WORKOUT_SHARING_STEPPER_%@";
          goto LABEL_34;
        }
        if (v10 != 52) {
          goto LABEL_23;
        }
        double v12 = @"WORKOUT_SHARING_OUTDOOR_WALKING_%@";
        char v13 = @"WORKOUT_SHARING_INDOOR_WALKING_%@";
        break;
    }
    goto LABEL_17;
  }
  if (v10 > 23)
  {
    if (v10 == 24)
    {
      long double v11 = @"WORKOUT_SHARING_HIKING_%@";
      goto LABEL_34;
    }
    if (v10 == 35)
    {
      long double v11 = @"WORKOUT_SHARING_ROWING_%@";
      goto LABEL_34;
    }
    if (v10 != 37) {
      goto LABEL_23;
    }
    double v12 = @"WORKOUT_SHARING_OUTDOOR_RUNNING_%@";
    char v13 = @"WORKOUT_SHARING_INDOOR_RUNNING_%@";
  }
  else
  {
    if (v10 != 13)
    {
      if (v10 == 16)
      {
        long double v11 = @"WORKOUT_SHARING_ELLIPTICAL_%@";
        goto LABEL_34;
      }
      if (v10 == 20)
      {
        long double v11 = @"WORKOUT_SHARING_FUNCTIONAL_STRENGTH_TRAINING_%@";
        goto LABEL_34;
      }
LABEL_23:
      long double v11 = @"WORKOUT_SHARING_OTHER_%@";
      goto LABEL_34;
    }
    double v12 = @"WORKOUT_SHARING_OUTDOOR_CYCLING_%@";
    char v13 = @"WORKOUT_SHARING_INDOOR_CYCLING_%@";
  }
LABEL_17:
  if (v9) {
    long double v11 = v13;
  }
  else {
    long double v11 = v12;
  }
LABEL_34:
  uint64_t v14 = NSString;
  double v15 = FIUIBundle();
  double v16 = [v15 localizedStringForKey:v11 value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v16, v6);

  if ([v5 workoutActivityType] != 46) {
    goto LABEL_44;
  }
  uint64_t v18 = objc_msgSend(v5, "fiui_swimmingLocationType");
  if (v18 == 2)
  {
    double v19 = FIUIBundle();
    BOOL v20 = v19;
    uint64_t v21 = @"WORKOUT_SHARING_OPEN_WATER_SWIMMING_%@";
  }
  else if (v18 == 1)
  {
    double v19 = FIUIBundle();
    BOOL v20 = v19;
    uint64_t v21 = @"WORKOUT_SHARING_POOL_SWIMMING_%@";
  }
  else
  {
    if (v18)
    {
      double v22 = 0;
      goto LABEL_43;
    }
    double v19 = FIUIBundle();
    BOOL v20 = v19;
    uint64_t v21 = @"WORKOUT_SHARING_SWIMMING_UNKNOWN_LOCATION_%@";
  }
  double v22 = [v19 localizedStringForKey:v21 value:&stru_26CF5F1B8 table:@"Localizable-Ariel"];

LABEL_43:
  uint64_t v23 = [NSString stringWithValidatedFormat:v22, @"%@", 0, v6 validFormatSpecifiers error];

  uint64_t v17 = (void *)v23;
LABEL_44:

  return v17;
}

- (id)localizedPaceValueForSplit:(id)a3 activityType:(id)a4
{
  id v6 = (void *)MEMORY[0x263F0A630];
  unint64_t v7 = (void *)MEMORY[0x263F0A830];
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v7 meterUnit];
  [v9 distanceInMeters];
  long double v11 = objc_msgSend(v6, "quantityWithUnit:doubleValue:", v10);

  uint64_t v12 = FIUIPaceFormatForWorkoutActivityType(v8);
  uint64_t v13 = FIUIDistanceTypeForActivityType(v8);

  [v9 duration];
  double v15 = v14;

  double v16 = [(FIUIFormattingManager *)self localizedPaceStringWithDistance:v11 overDuration:v12 paceFormat:v13 distanceType:v15];

  return v16;
}

- (id)localizedTitleForSplit:(id)a3 unit:(id)a4 lapIndex:(int64_t)a5 useShortFormat:(BOOL)a6
{
  if (a6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 3;
  }
  id v8 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&__formatterLock);
  id v9 = _LengthFormatter((void *)1, v7, 2, 1);
  uint64_t v10 = [MEMORY[0x263F0A830] lengthFormatterUnitFromUnit:v8];

  long double v11 = [v9 unitStringFromValue:v10 unit:1.0];
  uint64_t v12 = [v11 localizedCapitalizedString];

  os_unfair_lock_unlock((os_unfair_lock_t)&__formatterLock);
  uint64_t v13 = [NSNumber numberWithInteger:a5 + 1];
  double v14 = +[FIUIFormattingManager stringWithNumber:v13 decimalPrecision:1];

  double v15 = NSString;
  double v16 = FIUIBundle();
  uint64_t v17 = [v16 localizedStringForKey:@"PACE_SECTION_ORDER" value:&stru_26CF5F1B8 table:@"Localizable"];
  uint64_t v18 = objc_msgSend(v15, "stringWithFormat:", v17, v12, v14);

  return v18;
}

- (id)localizedStringWithHeartRate:(id)a3
{
  return [(FIUIFormattingManager *)self localizedStringWithHeartRate:a3 unitStyle:0 requirePositiveValue:1];
}

- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4
{
  return [(FIUIFormattingManager *)self localizedStringWithHeartRate:a3 unitStyle:a4 requirePositiveValue:1];
}

- (id)localizedStringWithHeartRate:(id)a3 unitStyle:(unint64_t)a4 requirePositiveValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = (void *)MEMORY[0x263F0A830];
  id v9 = a3;
  uint64_t v10 = [v8 _countPerMinuteUnit];
  [v9 doubleValueForUnit:v10];
  double v12 = v11;

  uint64_t v13 = [(FIUIFormattingManager *)self localizedStringWithBeatsPerMinute:v5 requirePositiveValue:v12];
  double v14 = v13;
  if (a4)
  {
    double v15 = NSString;
    double v16 = FIUIBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"HEART_RATE_FORMAT" value:&stru_26CF5F1B8 table:@"Localizable"];
    uint64_t v18 = [(FIUIFormattingManager *)self localizedHeartRateUnitString];
    objc_msgSend(v15, "stringWithFormat:", v17, v14, v18);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v19 = v13;
  }

  return v19;
}

- (id)localizedStringWithBeatsPerMinute:(double)a3
{
  return [(FIUIFormattingManager *)self localizedStringWithBeatsPerMinute:1 requirePositiveValue:a3];
}

- (id)localizedStringWithBeatsPerMinute:(double)a3 requirePositiveValue:(BOOL)a4
{
  if (a3 <= 2.22044605e-16 && a4)
  {
    BOOL v5 = FIUIBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"HEART_RATE_NOVALUE" value:&stru_26CF5F1B8 table:@"Localizable"];
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    BOOL v5 = [NSNumber numberWithDouble:a3];
    uint64_t v6 = [v7 stringWithNumber:v5 decimalPrecision:1 roundingMode:6];
  }
  id v8 = (void *)v6;

  return v8;
}

- (id)localizedHeartRateUnitString
{
  v2 = FIUIBundle();
  id v3 = [v2 localizedStringForKey:@"BPM" value:&stru_26CF5F1B8 table:@"Localizable"];

  return v3;
}

- (id)localizedDistanceByStrokeStyle:(id)a3 isPoolSwim:(BOOL)a4
{
  BOOL v24 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [v4 allKeys];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __67__FIUIFormattingManager_localizedDistanceByStrokeStyle_isPoolSwim___block_invoke;
  v32[3] = &unk_2644A8B10;
  id v25 = v4;
  id v33 = v25;
  uint64_t v6 = [v5 sortedArrayUsingComparator:v32];

  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v26 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v26)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        double v11 = [v25 objectForKeyedSubscript:v10];
        [v10 integerValue];
        double v12 = FIUILocalizedStrokeStyleName();
        if (v24)
        {
          uint64_t v13 = [MEMORY[0x263F0A830] meterUnit];
          [v11 doubleValueForUnit:v13];
          -[FIUIFormattingManager localizedStringWithDistanceInMeters:distanceType:unitStyle:](self, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", 3, 1);
        }
        else
        {
          uint64_t v27 = 0;
          uint64_t v13 = [MEMORY[0x263F0A830] meterUnit];
          [v11 doubleValueForUnit:v13];
          -[FIUIFormattingManager localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:](self, "localizedNaturalScaleStringWithDistanceInMeters:distanceType:unitStyle:usedUnit:", 4, 1, &v27);
        double v14 = };

        double v15 = NSString;
        double v16 = FIUIBundle();
        uint64_t v17 = [v16 localizedStringForKey:@"SUMMARY_SWIM_DISTANCE_FORMAT_%@_%@" value:&stru_26CF5F1B8 table:@"Localizable"];
        uint64_t v18 = objc_msgSend(v15, "localizedStringWithFormat:", v17, v12, v14);

        id v19 = [v8 firstObject];
        LOBYTE(v17) = [v10 isEqualToNumber:v19];

        if ((v17 & 1) == 0) {
          [v7 appendString:@"\n"];
        }
        [v7 appendString:v18];
      }
      uint64_t v26 = [v8 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v26);
  }

  BOOL v20 = (void *)[[NSString alloc] initWithString:v7];
  return v20;
}

uint64_t __67__FIUIFormattingManager_localizedDistanceByStrokeStyle_isPoolSwim___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = [v5 objectForKeyedSubscript:a2];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (id)localizedInSessionDescriptionForElevation:(unint64_t)a3
{
  id v3 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:a3 textCase:0];
  id v4 = NSString;
  BOOL v5 = FIUIBundle();
  id v6 = [v5 localizedStringForKey:@"IN_SESSION_ELEVATION_DESCRIPTION" value:&stru_26CF5F1B8 table:@"Localizable"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

  return v7;
}

- (id)localizedInSessionDescriptionForGroundElevation:(unint64_t)a3
{
  id v3 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:a3 textCase:0];
  id v4 = NSString;
  BOOL v5 = FIUIBundle();
  id v6 = [v5 localizedStringForKey:@"IN_SESSION_GROUND_ELEVATION_DESCRIPTION" value:&stru_26CF5F1B8 table:@"Localizable"];
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v3);

  return v7;
}

- (id)localizedStringForMetricType:(unint64_t)a3 paceFormat:(int64_t)a4
{
  id v4 = &stru_26CF5F1B8;
  unint64_t v5 = a3 - 1;
  id v6 = @"METRIC_ROLLING_PACE";
  id v7 = @"METRIC_ACTIVE_ENERGY";
  switch(v5)
  {
    case 0uLL:
      id v6 = @"METRIC_DISTANCE";
      goto LABEL_20;
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      id v6 = @"METRIC_DURATION";
      goto LABEL_20;
    case 3uLL:
      id v8 = @"METRIC_CURRENT_PACE";
      uint64_t v9 = @"METRIC_CURRENT_SPEED";
      goto LABEL_12;
    case 4uLL:
      id v6 = @"METRIC_HEART_RATE";
      goto LABEL_20;
    case 5uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      goto LABEL_21;
    case 6uLL:
      id v7 = @"METRIC_TOTAL_ENERGY";
LABEL_9:
      -[FIUIFormattingManager localizationKeyForEnergyBaseKey:](self, "localizationKeyForEnergyBaseKey:", v7, a4);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v6) {
        goto LABEL_21;
      }
      goto LABEL_20;
    case 7uLL:
      id v8 = @"METRIC_AVERAGE_PACE";
      uint64_t v9 = @"METRIC_AVERAGE_SPEED";
      goto LABEL_12;
    case 8uLL:
      id v6 = @"METRIC_LAPS";
      goto LABEL_20;
    case 9uLL:
      id v6 = @"METRIC_ELEVATION";
      goto LABEL_20;
    case 0xDuLL:
      goto LABEL_20;
    case 0xEuLL:
      id v6 = @"METRIC_CURRENT_CADENCE";
      goto LABEL_20;
    case 0xFuLL:
      id v6 = @"METRIC_AVERAGE_CADENCE";
      goto LABEL_20;
    case 0x10uLL:
      id v6 = @"METRIC_GROUND_ELEVATION";
      goto LABEL_20;
    default:
      if (@"METRIC_ACTIVE_ENERGY" != (__CFString *)48) {
        goto LABEL_21;
      }
      id v8 = @"METRIC_FASTEST_PACE";
      uint64_t v9 = @"METRIC_MAX_SPEED";
LABEL_12:
      if (a4 == 4) {
        id v6 = v9;
      }
      else {
        id v6 = v8;
      }
LABEL_20:
      uint64_t v10 = FIUIBundle();
      id v4 = [v10 localizedStringForKey:v6 value:&stru_26CF5F1B8 table:@"Localizable"];

LABEL_21:
      return v4;
  }
}

- (id)localizedGoalDescriptionForDive:(id)a3 healthStore:(id)a4 outValue:(id *)a5
{
  id v6 = [(FIUIDepthFormatter *)self->_depthFormatter formatGoalValueForDive:a3 healthStore:a4];
  *a5 = [v6 goalValue];
  id v7 = [v6 goalString];

  return v7;
}

- (id)beyondLimitStringForDepthUnit:(unint64_t)a3 includeUnits:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = FIUIBundle();
  id v7 = v6;
  id v8 = @"WORKOUT_DEPTH_BEYOND_40M_NO_UNIT";
  if (a3 == 2) {
    id v8 = @"WORKOUT_DEPTH_BEYOND_130FT_NO_UNIT";
  }
  uint64_t v9 = @"WORKOUT_DEPTH_BEYOND_130FT";
  if (a3 != 2) {
    uint64_t v9 = @"WORKOUT_DEPTH_BEYOND_40M";
  }
  if (v4) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = v8;
  }
  double v11 = [v6 localizedStringForKey:v10 value:&stru_26CF5F1B8 table:@"Localizable"];

  return v11;
}

- (id)localizedStringWithDepthInMeters:(double)a3 depthUnit:(unint64_t)a4
{
  return [(FIUIDepthFormatter *)self->_depthFormatter formatMaxDepth:a4 unit:a3];
}

- (id)localizedDepthValue:(double)a3 depthUnit:(unint64_t)a4
{
  return [(FIUIDepthFormatter *)self->_depthFormatter formatDepthValue:a4 unit:a3];
}

- (id)localizedDepthUnit:(unint64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 5;
  }
  BOOL v4 = [(FIUIFormattingManager *)self localizedShortUnitStringForDistanceUnit:v3];
  unint64_t v5 = [v4 localizedUppercaseString];

  return v5;
}

- (id)localizedWaterTemperatureRangeWithColdest:(double)a3 hottest:(double)a4
{
  return [(FIUIDepthFormatter *)self->_depthFormatter formatWaterTemperatureRangeWithLower:a3 upper:a4];
}

- (id)localizedWaterTemperatureValue:(double)a3
{
  return [(FIUIDepthFormatter *)self->_depthFormatter formatWaterTemperatureValue:a3];
}

- (id)localizedUnderwaterTime:(double)a3
{
  return [(FIUIDepthFormatter *)self->_depthFormatter formatUnderwaterTime:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthFormatter, 0);
  objc_storeStrong((id *)&self->_unitManager, 0);
}

@end