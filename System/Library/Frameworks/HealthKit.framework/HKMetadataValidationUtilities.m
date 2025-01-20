@interface HKMetadataValidationUtilities
+ (BOOL)hk_validateActivityMoveModeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateAppleECGAlgorithmValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateBodyTemperatureSensorLocationMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateCoreMotionSourceIdentifierMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateCyclingFTPTestTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateDevicePlacementSideValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateDigitalSignatureMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateHeartRateRecoveryActivityTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateHeartRateRecoveryTestTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateHeartRateSensorLocationMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateInsulinDeliveryReasonMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateMealTimeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateMetadataValueClass:(id)a3 forKey:(id)a4 expectedClassLookupTable:(id)a5 error:(id *)a6;
+ (BOOL)hk_validatePhysicalEffortEstimationTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateQuantityMetadataValue:(id)a3 value:(id)a4 compatibleUnit:(id)a5 error:(id *)a6;
+ (BOOL)hk_validateSwimmingLocationTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateSwimmingStrokeStyleMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateSyncIdentifierMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateSyncVersionMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateTimeZoneMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateUserMotionContextMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateVO2MaxTestTypeMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateWaterSalinityMetadataValue:(id)a3 error:(id *)a4;
+ (BOOL)hk_validateWeatherConditionMetadataValue:(id)a3 error:(id *)a4;
@end

@implementation HKMetadataValidationUtilities

+ (BOOL)hk_validateMetadataValueClass:(id)a3 forKey:(id)a4 expectedClassLookupTable:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [a5 objectForKeyedSubscript:v10];
  if (v11 && (v12 = (objc_class *)v11, (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromClass(v12);
    objc_msgSend(v14, "hk_assignError:code:format:", a6, 3, @"Invalid class %@ for metadata key: %@. Expected %@.", v16, v10, v17);

    BOOL v13 = 0;
  }
  else
  {
    BOOL v13 = 1;
  }

  return v13;
}

+ (BOOL)hk_validateDigitalSignatureMetadataValue:(id)a3 error:(id *)a4
{
  char v5 = objc_msgSend(a3, "hk_isBase64");
  if ((v5 & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: value is not a Base64 string", @"HKDigitalSignature");
  }
  return v5;
}

+ (BOOL)hk_validateTimeZoneMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v5];
  if (!v6) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: \"%@\" is not a valid time zone name string", @"HKTimeZone", v5);
  }

  return v6 != 0;
}

+ (BOOL)hk_validateHeartRateSensorLocationMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 7) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKHeartRateSensorLocation", v5);
  }

  return v6 < 7;
}

+ (BOOL)hk_validateInsulinDeliveryReasonMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKInsulinDeliveryReason", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateMealTimeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKBloodGlucoseMealTime", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateBodyTemperatureSensorLocationMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 0xC) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKBodyTemperatureSensorLocation", v5);
  }

  return v6 < 0xC;
}

+ (BOOL)hk_validateWeatherConditionMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 0x1C) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKWeatherCondition", v5);
  }

  return v6 < 0x1C;
}

+ (BOOL)hk_validateQuantityMetadataValue:(id)a3 value:(id)a4 compatibleUnit:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v13 = @"Invalid metadata value for %@: '%@' is not a quantity";
LABEL_6:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 3, v13, v9, v10);
    BOOL v12 = 0;
    goto LABEL_7;
  }
  if (([v10 isCompatibleWithUnit:v11] & 1) == 0)
  {
    BOOL v13 = @"Invalid metadata value for %@: %@ has an incompatible unit";
    goto LABEL_6;
  }
  BOOL v12 = 1;
LABEL_7:

  return v12;
}

+ (BOOL)hk_validateSwimmingLocationTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKSwimmingLocationType", v5);
  }

  return v6 < 3;
}

+ (BOOL)hk_validateSwimmingStrokeStyleMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 7) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKSwimmingStrokeStyle", v5);
  }

  return v6 < 7;
}

+ (BOOL)hk_validateSyncIdentifierMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 objectForKeyedSubscript:@"HKMetadataKeySyncIdentifier"];
  uint64_t v7 = [v6 length];

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"%@ must contain at least one character", @"HKMetadataKeySyncIdentifier", v11);
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  v8 = [v5 objectForKeyedSubscript:@"HKMetadataKeySyncVersion"];

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"%@ must be provided if %@ is provided in the metadata", @"HKMetadataKeySyncVersion", @"HKMetadataKeySyncIdentifier");
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

+ (BOOL)hk_validateSyncVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 objectForKeyedSubscript:@"HKMetadataKeySyncIdentifier"];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"HKMetadataKeySyncVersion"];
    uint64_t v8 = [v7 integerValue];
    BOOL v9 = v8 >= 0;
    if (v8 < 0) {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"%@ must greater than or equal to 0", @"HKMetadataKeySyncVersion");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"%@ may not be provided if %@ is not provided in the metadata", @"HKMetadataKeySyncVersion", @"HKMetadataKeySyncIdentifier");
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)hk_validateVO2MaxTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKVO2MaxTestType", v5);
  }

  return v6 < 3;
}

+ (BOOL)hk_validateActivityMoveModeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"_HKPrivateWorkoutActivityMoveMode", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateAppleECGAlgorithmValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyAppleECGAlgorithmVersion", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateDevicePlacementSideValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 4) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyDevicePlacementSide", v5);
  }

  return v6 < 4;
}

+ (BOOL)hk_validateAppleHeartbeatSeriesAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"_HKPrivateMetadataKeyAppleHeartbeatSeriesAlgorithmVersion", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateAppleIrregularRhythmNotificationsAlgorithmVersionMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyAppleIrregularRhythmNotificationsAlgorithmVersion", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateCoreMotionSourceIdentifierMetadataValue:(id)a3 error:(id *)a4
{
  uint64_t v5 = [a3 length];
  if (!v5) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"%@ must contain at least one character", @"_HKPrivateCoreMotionSourceIdentifier");
  }
  return v5 != 0;
}

+ (BOOL)hk_validateHeartRateRecoveryTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyHeartRateRecoveryTestType", v5);
  }

  return v6 < 3;
}

+ (BOOL)hk_validateHeartRateRecoveryActivityTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char IsValid = _HKWorkoutActivityTypeIsValid((int)[v5 intValue]);
  if ((IsValid & 1) == 0) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyHeartRateRecoveryActivityType", v5);
  }

  return IsValid;
}

+ (BOOL)hk_validateUserMotionContextMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned int v6 = [v5 intValue];
  if (v6 >= 3) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyUserMotionContext", v5);
  }

  return v6 < 3;
}

+ (BOOL)hk_validateWaterSalinityMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKMetadataKeyWaterSalinity", v5);
  }

  return v6 < 2;
}

+ (BOOL)hk_validateCyclingFTPTestTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 4) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKCyclingCyclingFunctionalThresholdPowerTestType", v5);
  }

  return v6 < 4;
}

+ (BOOL)hk_validatePhysicalEffortEstimationTypeMetadataValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = (int)[v5 intValue] - 1;
  if (v6 >= 2) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid metadata value for %@: %@", @"HKPhysicalEffortEstimationType", v5);
  }

  return v6 < 2;
}

@end