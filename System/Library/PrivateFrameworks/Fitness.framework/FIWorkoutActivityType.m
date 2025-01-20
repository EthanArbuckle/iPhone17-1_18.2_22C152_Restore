@interface FIWorkoutActivityType
+ (BOOL)isEffectivelyIndoorForWorkout:(id)a3;
+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)activityTypeFromUniqueIdentifier:(id)a3;
+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4;
+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5;
+ (id)activityTypeWithWorkout:(id)a3;
+ (id)defaultActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4 activityMoveMode:(int64_t)a5;
+ (id)deprecatedActivityTypes;
+ (id)effectiveActivityTypeWithWorkout:(id)a3;
+ (id)gymKitCapableActivityTypes;
+ (id)nonOptimizedActivityTypes;
+ (id)optimizedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4;
+ (id)otherWorkoutActivityTypes;
+ (id)possibleActivityTypesForIdentifier:(unint64_t)a3 locationType:(int64_t)a4 swimmingLocationType:(int64_t)a5 wheelchairUser:(BOOL)a6;
+ (id)swimmingOptimizedActivityTypes;
+ (id)swimmingOtherActivityTypes;
+ (id)unsupportedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4;
+ (id)wheelchairActivityTypes;
+ (unint64_t)mapWheelchairUserActivityType:(unint64_t)a3 isWheelchairUser:(BOOL)a4;
- (BOOL)hasLocationTypePool;
- (BOOL)isCategorizedOtherWorkout;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndoor;
- (BOOL)isPartOfMultiSport;
- (BOOL)isPoolSwimming;
- (BOOL)isWaterLockActivity;
- (BOOL)requiresDisambiguation;
- (BOOL)requiresLocationDisambiguation;
- (BOOL)requiresSwimmingLocationDisambiguation;
- (BOOL)supportsSafetyCheckInPrompt;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6;
- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7;
- (FIWorkoutActivityType)initWithCoder:(id)a3;
- (HKQuantity)lapLength;
- (NSDictionary)metadata;
- (NSString)legacyUniqueIdentifier;
- (NSString)uniqueIdentifier;
- (id)activityTypeByAddingLapLength:(double)a3;
- (id)activityTypePlistKey;
- (id)description;
- (id)localizationKey;
- (id)localizedName;
- (id)localizedNameComponents;
- (id)localizedNamePlural;
- (int64_t)location;
- (int64_t)swimmingLocationType;
- (unint64_t)auxiliaryTypeIdentifier;
- (unint64_t)effectiveTypeIdentifier;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIWorkoutActivityType

+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [FIWorkoutActivityType alloc];
  v7 = [(FIWorkoutActivityType *)v6 initWithActivityTypeIdentifier:a3 isIndoor:v4 metadata:MEMORY[0x263EFFA78]];
  return v7;
}

+ (id)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = [[FIWorkoutActivityType alloc] initWithActivityTypeIdentifier:a3 isIndoor:v5 metadata:v7];

  return v8;
}

+ (id)activityTypeWithWorkout:(id)a3
{
  id v3 = a3;
  BOOL v4 = [FIWorkoutActivityType alloc];
  uint64_t v5 = [v3 workoutActivityType];
  v6 = [v3 metadata];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [v3 metadata];

  v10 = [(FIWorkoutActivityType *)v4 initWithActivityTypeIdentifier:v5 isIndoor:v8 metadata:v9];
  return v10;
}

+ (id)effectiveActivityTypeWithWorkout:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[FIWorkoutActivityType isEffectivelyIndoorForWorkout:v3];
  uint64_t v5 = [FIWorkoutActivityType alloc];
  uint64_t v6 = [v3 workoutActivityType];
  id v7 = [v3 metadata];

  uint64_t v8 = [(FIWorkoutActivityType *)v5 initWithActivityTypeIdentifier:v6 isIndoor:v4 metadata:v7];
  return v8;
}

+ (BOOL)isEffectivelyIndoorForWorkout:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 sourceRevision];
  uint64_t v5 = [v4 source];
  char v6 = [v5 _hasFirstPartyBundleID];

  if ((v6 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v7 = [v3 workoutActivityType];
  if (v7 != 35 && v7 != 25) {
    goto LABEL_9;
  }
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  HKNSOperatingSystemVersionFromString();
  __n128 v18 = 0uLL;
  uint64_t v19 = 0;
  uint64_t v8 = [v3 sourceRevision];
  v9 = v8;
  if (v8)
  {
    [v8 operatingSystemVersion];
  }
  else
  {
    __n128 v16 = 0uLL;
    uint64_t v17 = 0;
  }
  FIEffectiveOperatingSystemVersion(&v16, &v18);

  __n128 v14 = v18;
  uint64_t v15 = v19;
  if (HKNSOperatingSystemVersionCompare() == 1)
  {
    char v10 = 1;
  }
  else
  {
LABEL_9:
    v11 = objc_msgSend(v3, "metadata", *(_OWORD *)&v14, v15);
    v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F09AA0]];
    char v10 = [v12 BOOLValue];
  }
  return v10;
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  return [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 isIndoor:a4 metadata:MEMORY[0x263EFFA78]];
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  return [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 isIndoor:a4 isPartOfMultiSport:0 metadata:a5];
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6
{
  return [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 isIndoor:a4 isPartOfMultiSport:0 metadata:a5 auxiliaryTypeIdentifier:a6];
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  if (a4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  return [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 location:v6 isPartOfMultiSport:a5 metadata:a6];
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  if (a4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  return [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 location:v7 isPartOfMultiSport:a5 metadata:a6 auxiliaryTypeIdentifier:a7];
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  BOOL v6 = a5;
  unint64_t v10 = *MEMORY[0x263F0AC20];
  id v11 = a6;
  if ((_os_feature_enabled_impl() & 1) == 0 && !FIActivityTypeIsCalorimetryOptimized(a3))
  {
    unint64_t v10 = a3;
    a3 = 3000;
  }
  v12 = [(FIWorkoutActivityType *)self initWithActivityTypeIdentifier:a3 location:a4 isPartOfMultiSport:v6 metadata:v11 auxiliaryTypeIdentifier:v10];

  return v12;
}

- (FIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)FIWorkoutActivityType;
  v13 = [(FIWorkoutActivityType *)&v29 init];
  __n128 v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    v13->_auxiliaryTypeIdentifier = a7;
    v13->_isPartOfMultiSport = a5;
    v13->_location = a4;
    v13->_isIndoor = a4 == 2;
    if (v12 && [v12 count])
    {
      uint64_t v15 = *MEMORY[0x263F09AE0];
      v34[0] = *MEMORY[0x263F09AB0];
      v34[1] = v15;
      uint64_t v16 = *MEMORY[0x263F09B00];
      v34[2] = *MEMORY[0x263F09AE8];
      v34[3] = v16;
      v34[4] = @"BackdatedStartDate";
      v34[5] = @"PredictionSessionUUID";
      v34[6] = @"_HKPrivateSeymourMediaType";
      id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:7];
      id v18 = v12;
      uint64_t v19 = [MEMORY[0x263EFF9A0] dictionary];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v20 = (NSDictionary *)v17;
      uint64_t v21 = [(NSDictionary *)v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            v26 = [v18 objectForKeyedSubscript:v25];
            if (v26) {
              [(NSDictionary *)v19 setObject:v26 forKeyedSubscript:v25];
            }
          }
          uint64_t v22 = [(NSDictionary *)v20 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v22);
      }

      metadata = v14->_metadata;
      v14->_metadata = v19;
    }
    else
    {
      long long v20 = v14->_metadata;
      v14->_metadata = (NSDictionary *)MEMORY[0x263EFFA78];
    }
  }
  return v14;
}

+ (id)activityTypeFromUniqueIdentifier:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F0AC20];
  uint64_t v5 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@";,"];
  BOOL v6 = [v3 componentsSeparatedByCharactersInSet:v5];

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v27 = v4;
    uint64_t v28 = (uint64_t)v3;
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    char v29 = 0;
    uint64_t v30 = 0;
    uint64_t v10 = *(void *)v34;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * i), "componentsSeparatedByString:", @"=", v27);
        if ([v12 count] != 2)
        {
          _HKInitializeLogging();
          uint64_t v21 = *MEMORY[0x263F09970];
          id v3 = (id)v28;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
            +[FIWorkoutActivityType activityTypeFromUniqueIdentifier:](v28, v21);
          }

          uint64_t v22 = 0;
          long long v20 = v7;
          goto LABEL_38;
        }
        v13 = [v12 objectAtIndexedSubscript:0];
        __n128 v14 = [v12 objectAtIndexedSubscript:1];
        if ([v13 isEqualToString:@"type"]) {
          uint64_t v30 = [v14 integerValue];
        }
        if ([v13 isEqualToString:@"isIndoor"]) {
          LOBYTE(v32) = [v14 BOOLValue];
        }
        if ([v13 isEqualToString:@"isOther"]) {
          char v29 = [v14 BOOLValue];
        }
        if ([v13 isEqualToString:@"swimmingLocationType"]) {
          uint64_t v31 = [v14 integerValue];
        }
        if ([v13 isEqualToString:@"isPartOfMultiSport"]) {
          BYTE4(v32) = [v14 BOOLValue];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v9) {
        continue;
      }
      break;
    }

    int v15 = _os_feature_enabled_impl();
    uint64_t v4 = v27;
    if (v29) {
      uint64_t v16 = v30;
    }
    else {
      uint64_t v16 = v27;
    }
    uint64_t v17 = 3000;
    if ((v29 & 1) == 0) {
      uint64_t v17 = v30;
    }
    if (v15)
    {
      uint64_t v18 = v30;
    }
    else
    {
      uint64_t v4 = v16;
      uint64_t v18 = v17;
    }
    if (v31)
    {
      uint64_t v37 = *MEMORY[0x263F09AE0];
      uint64_t v19 = [NSNumber numberWithInteger:v31];
      v38 = v19;
      long long v20 = [NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    }
    else
    {
      long long v20 = 0;
    }
    id v3 = (id)v28;
    char v23 = v32;
    char v24 = BYTE4(v32);
  }
  else
  {

    _os_feature_enabled_impl();
    uint64_t v18 = 0;
    char v23 = 0;
    char v24 = 0;
    long long v20 = 0;
  }
  if (_HKWorkoutActivityTypeIsValid())
  {
    uint64_t v22 = [[FIWorkoutActivityType alloc] initWithActivityTypeIdentifier:v18 isIndoor:v23 & 1 isPartOfMultiSport:v24 & 1 metadata:v20 auxiliaryTypeIdentifier:v4];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v25 = *MEMORY[0x263F09970];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09970], OS_LOG_TYPE_ERROR)) {
      +[FIWorkoutActivityType activityTypeFromUniqueIdentifier:]((uint64_t)v3, v25);
    }
    uint64_t v22 = 0;
  }
LABEL_38:

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  int v4 = _os_feature_enabled_impl();
  unint64_t v5 = [(FIWorkoutActivityType *)self identifier];
  if (!v4)
  {
    [v12 encodeInteger:v5 forKey:@"FIUIWorkoutActivityTypeIdentifier"];
    unint64_t v9 = [(FIWorkoutActivityType *)self auxiliaryTypeIdentifier];
    goto LABEL_5;
  }
  [v12 encodeInteger:v5 forKey:@"FIUIWorkoutActivityTypeTrueIdentifier"];
  BOOL v6 = +[FIWorkoutActivityType otherWorkoutActivityTypes];
  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIWorkoutActivityType identifier](self, "identifier"));
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    [v12 encodeInteger:3000 forKey:@"FIUIWorkoutActivityTypeIdentifier"];
    unint64_t v9 = [(FIWorkoutActivityType *)self identifier];
LABEL_5:
    unint64_t v10 = v9;
    goto LABEL_7;
  }
  objc_msgSend(v12, "encodeInteger:forKey:", -[FIWorkoutActivityType identifier](self, "identifier"), @"FIUIWorkoutActivityTypeIdentifier");
  unint64_t v10 = *MEMORY[0x263F0AC20];
LABEL_7:
  [v12 encodeInteger:v10 forKey:@"NLSessionAuxiliaryActivityTypeIdentifier"];
  objc_msgSend(v12, "encodeBool:forKey:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"), @"FIUIWorkoutActivityTypeIsIndoor");
  id v11 = [(FIWorkoutActivityType *)self metadata];
  [v12 encodeObject:v11 forKey:@"FIUIWorkoutActivityTypeMetadata"];

  objc_msgSend(v12, "encodeBool:forKey:", -[FIWorkoutActivityType isPartOfMultiSport](self, "isPartOfMultiSport"), @"FIUIWorkoutActivityTypePartOfMultisport");
  objc_msgSend(v12, "encodeInteger:forKey:", -[FIWorkoutActivityType location](self, "location"), @"FIUIWorkoutActivityTypeLocation");
}

- (FIWorkoutActivityType)initWithCoder:(id)a3
{
  v17[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FIWorkoutActivityType;
  unint64_t v5 = [(FIWorkoutActivityType *)&v16 init];
  if (!v5) {
    goto LABEL_12;
  }
  v5->_identifier = [v4 decodeIntegerForKey:@"FIUIWorkoutActivityTypeIdentifier"];
  v5->_isIndoor = [v4 decodeBoolForKey:@"FIUIWorkoutActivityTypeIsIndoor"];
  v5->_unint64_t auxiliaryTypeIdentifier = [v4 decodeIntegerForKey:@"NLSessionAuxiliaryActivityTypeIdentifier"];
  if (_os_feature_enabled_impl())
  {
    if ([v4 containsValueForKey:@"FIUIWorkoutActivityTypeTrueIdentifier"])
    {
      v5->_identifier = [v4 decodeIntegerForKey:@"FIUIWorkoutActivityTypeTrueIdentifier"];
      unint64_t v6 = *MEMORY[0x263F0AC20];
    }
    else
    {
      unint64_t auxiliaryTypeIdentifier = v5->_auxiliaryTypeIdentifier;
      unint64_t v6 = *MEMORY[0x263F0AC20];
      if (auxiliaryTypeIdentifier == *MEMORY[0x263F0AC20]) {
        goto LABEL_8;
      }
      v5->_identifier = auxiliaryTypeIdentifier;
    }
    v5->_unint64_t auxiliaryTypeIdentifier = v6;
  }
LABEL_8:
  int v8 = (void *)MEMORY[0x263EFFA08];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v17[4] = objc_opt_class();
  unint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:5];
  unint64_t v10 = [v8 setWithArray:v9];
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"FIUIWorkoutActivityTypeMetadata"];
  metadata = v5->_metadata;
  v5->_metadata = (NSDictionary *)v11;

  v5->_isPartOfMultiSport = [v4 decodeBoolForKey:@"FIUIWorkoutActivityTypePartOfMultisport"];
  uint64_t v13 = [v4 decodeIntegerForKey:@"FIUIWorkoutActivityTypeLocation"];
  v5->_location = v13;
  if (!v13)
  {
    uint64_t v14 = 2;
    if (!v5->_isIndoor) {
      uint64_t v14 = 3;
    }
    v5->_location = v14;
  }
LABEL_12:

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)swimmingLocationType
{
  v2 = [(FIWorkoutActivityType *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AE0]];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (HKQuantity)lapLength
{
  v2 = [(FIWorkoutActivityType *)self metadata];
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263F09AB0]];

  return (HKQuantity *)v3;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (BOOL)isCategorizedOtherWorkout
{
  unint64_t v3 = [(FIWorkoutActivityType *)self identifier];
  return v3 != [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
}

- (unint64_t)effectiveTypeIdentifier
{
  unint64_t identifier = self->_identifier;
  if (identifier != 3000) {
    return identifier;
  }
  unint64_t result = self->_auxiliaryTypeIdentifier;
  if (result == *MEMORY[0x263F0AC20]) {
    return identifier;
  }
  return result;
}

- (id)localizationKey
{
  uint64_t v3 = [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
  BOOL isIndoor = self->_isIndoor;
  return FILocalizationKeyForHKWorkoutActivityTypeIsLocationAgnosticAndIsIndoor(v3, 0, isIndoor);
}

- (id)localizedName
{
  BOOL v3 = [(FIWorkoutActivityType *)self requiresDisambiguation];
  uint64_t v4 = [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
  if (v3) {
    FILocalizedNameForIndoorAgnosticActivityType();
  }
  else {
  unint64_t v5 = FILocalizedNameForActivityType(v4, [(FIWorkoutActivityType *)self swimmingLocationType], self->_isIndoor);
  }
  return v5;
}

- (id)localizedNamePlural
{
  uint64_t v3 = [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
  unint64_t v4 = [(FIWorkoutActivityType *)self swimmingLocationType];
  BOOL isIndoor = self->_isIndoor;
  return FILocalizedNameForActivityTypePlural(v3, v4, isIndoor);
}

- (id)localizedNameComponents
{
  uint64_t v3 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F09AE0]];
  unint64_t v4 = [v3 integerValue];

  uint64_t v5 = [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
  BOOL isIndoor = self->_isIndoor;
  int v7 = [(FIWorkoutActivityType *)self isCategorizedOtherWorkout];
  return FILocalizedActivityNameComponentsWithFormatting(v5, v4, isIndoor, v7);
}

- (id)activityTypeByAddingLapLength:(double)a3
{
  if (a3 > 2.22044605e-16 && [(FIWorkoutActivityType *)self identifier] == 46)
  {
    uint64_t v5 = [(FIWorkoutActivityType *)self metadata];
    if (v5)
    {
      unint64_t v6 = [(FIWorkoutActivityType *)self metadata];
      int v7 = (void *)[v6 mutableCopy];
    }
    else
    {
      int v7 = objc_opt_new();
    }

    unint64_t v9 = (void *)MEMORY[0x263F0A630];
    unint64_t v10 = [MEMORY[0x263F0A830] meterUnit];
    uint64_t v11 = [v9 quantityWithUnit:v10 doubleValue:a3];
    [v7 setObject:v11 forKey:*MEMORY[0x263F09AB0]];

    int v8 = [[FIWorkoutActivityType alloc] initWithActivityTypeIdentifier:[(FIWorkoutActivityType *)self identifier] isIndoor:[(FIWorkoutActivityType *)self isIndoor] isPartOfMultiSport:[(FIWorkoutActivityType *)self isPartOfMultiSport] metadata:v7];
  }
  else
  {
    int v8 = self;
  }
  return v8;
}

- (BOOL)isWaterLockActivity
{
  return [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 46
      || [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 45
      || [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 84
      || [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 53
      || [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 54
      || [(FIWorkoutActivityType *)self effectiveTypeIdentifier] == 55;
}

+ (id)defaultActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4 activityMoveMode:(int64_t)a5
{
  if (a5 == 2)
  {
    uint64_t v5 = FIFitnessJuniorDefaultActivityTypes();
  }
  else if (a5 == 1)
  {
    uint64_t v5 = FIStandardFitnessDefaultActivityTypes(a3, a4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

+ (id)gymKitCapableActivityTypes
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:1];
  v12[0] = v2;
  uint64_t v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:1];
  v12[1] = v3;
  unint64_t v4 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:1];
  v12[2] = v4;
  uint64_t v5 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:44 isIndoor:1];
  v12[3] = v5;
  unint64_t v6 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:35 isIndoor:1];
  v12[4] = v6;
  int v7 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:16 isIndoor:1];
  v12[5] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
  unint64_t v9 = (void *)gymKitCapableActivityTypes_activityTypes;
  gymKitCapableActivityTypes_activityTypes = v8;

  unint64_t v10 = (void *)gymKitCapableActivityTypes_activityTypes;
  return v10;
}

+ (id)optimizedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  BOOL v4 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__FIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v9 = a4;
  if (optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__onceToken != -1) {
    dispatch_once(&optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__onceToken, block);
  }
  uint64_t v5 = &optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
  if (v4) {
    uint64_t v5 = &optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
  }
  unint64_t v6 = (void *)*v5;
  return v6;
}

void __88__FIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1)
{
  v40[21] = *MEMORY[0x263EF8340];
  v38 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:0];
  v40[0] = v38;
  uint64_t v37 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:0];
  v40[1] = v37;
  long long v36 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:0];
  v40[2] = v36;
  long long v35 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:52 isIndoor:1];
  v40[3] = v35;
  long long v34 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:37 isIndoor:1];
  v40[4] = v34;
  long long v33 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:13 isIndoor:1];
  v40[5] = v33;
  uint64_t v32 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:16 isIndoor:0];
  v40[6] = v32;
  uint64_t v31 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:35 isIndoor:0];
  v40[7] = v31;
  uint64_t v30 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:44 isIndoor:0];
  v40[8] = v30;
  char v29 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:63 isIndoor:0];
  v40[9] = v29;
  uint64_t v28 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:24 isIndoor:0];
  v40[10] = v28;
  uint64_t v27 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:57 isIndoor:0];
  v40[11] = v27;
  v26 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:20 isIndoor:0];
  v40[12] = v26;
  v1 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:77 isIndoor:0];
  v40[13] = v1;
  v2 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:80 isIndoor:0];
  v40[14] = v2;
  uint64_t v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:59 isIndoor:0];
  v40[15] = v3;
  BOOL v4 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:66 isIndoor:0];
  v40[16] = v4;
  uint64_t v5 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:72 isIndoor:0];
  v40[17] = v5;
  unint64_t v6 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:65 isIndoor:0];
  v40[18] = v6;
  int v7 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:82 isIndoor:0];
  v40[19] = v7;
  uint64_t v8 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:3000 isIndoor:0];
  v40[20] = v8;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:21];
  unint64_t v10 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
  optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v9;

  if (_os_feature_enabled_impl())
  {
    uint64_t v11 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    id v12 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:35 isIndoor:1];
    uint64_t v13 = [v11 arrayByAddingObject:v12];
    uint64_t v14 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v13;
  }
  int v15 = +[FIWorkoutActivityType wheelchairActivityTypes];
  uint64_t v16 = [v15 arrayByAddingObjectsFromArray:optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes];
  uint64_t v17 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
  optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes = v16;

  if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v18 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    uint64_t v19 = +[FIWorkoutActivityType swimmingOptimizedActivityTypes];
    uint64_t v20 = [v18 arrayByAddingObjectsFromArray:v19];
    uint64_t v21 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__activityTypes = v20;

    uint64_t v22 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
    char v23 = +[FIWorkoutActivityType swimmingOptimizedActivityTypes];
    uint64_t v24 = [v22 arrayByAddingObjectsFromArray:v23];
    uint64_t v25 = (void *)optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes;
    optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported__wheelchairActivityTypes = v24;
  }
}

+ (id)otherWorkoutActivityTypes
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:&unk_26CD12C00];
  [v2 addObjectsFromArray:&unk_26CD12C18];
  [v2 addObjectsFromArray:&unk_26CD12C30];
  if (MGGetBoolAnswer()) {
    [v2 addObjectsFromArray:&unk_26CD12C48];
  }
  return v2;
}

+ (id)nonOptimizedActivityTypes
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v4 = [a1 otherWorkoutActivityTypes];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue];
        unint64_t v10 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:v9 isIndoor:0];
        [v3 addObject:v10];

        if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:v9])
        {
          uint64_t v11 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:v9 isIndoor:1];
          [v3 addObject:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (id)unsupportedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  uint64_t v6 = +[FIWorkoutActivityType deprecatedActivityTypes];
  if (!a4)
  {
    uint64_t v7 = +[FIWorkoutActivityType swimmingOptimizedActivityTypes];
    uint64_t v8 = +[FIWorkoutActivityType swimmingOtherActivityTypes];
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

    uint64_t v10 = [v6 arrayByAddingObjectsFromArray:v9];

    uint64_t v6 = (void *)v10;
  }
  if (!a3)
  {
    uint64_t v11 = +[FIWorkoutActivityType wheelchairActivityTypes];
    uint64_t v12 = [v6 arrayByAddingObjectsFromArray:v11];

    uint64_t v6 = (void *)v12;
  }
  long long v13 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:84 isIndoor:0 metadata:0];
  long long v14 = [v6 arrayByAddingObject:v13];

  return v14;
}

+ (id)wheelchairActivityTypes
{
  v6[2] = *MEMORY[0x263EF8340];
  v2 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:70 isIndoor:0];
  v6[0] = v2;
  id v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:71 isIndoor:0];
  v6[1] = v3;
  BOOL v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)swimmingOptimizedActivityTypes
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F09AE0];
  uint64_t v2 = v11;
  uint64_t v12 = &unk_26CD123A8;
  id v3 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  BOOL v4 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:46 isIndoor:0 metadata:v3];
  v13[0] = v4;
  uint64_t v9 = v2;
  uint64_t v10 = &unk_26CD123C0;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  uint64_t v6 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:46 isIndoor:0 metadata:v5];
  v13[1] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v7;
}

+ (id)swimmingOtherActivityTypes
{
  v8[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:53 isIndoor:0 metadata:0];
  v8[0] = v2;
  id v3 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:84 isIndoor:0 metadata:0];
  v8[1] = v3;
  BOOL v4 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:54 isIndoor:0 metadata:0];
  v8[2] = v4;
  uint64_t v5 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:55 isIndoor:0 metadata:0];
  v8[3] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)deprecatedActivityTypes
{
  v13[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = [FIWorkoutActivityType alloc];
  id v3 = [(FIWorkoutActivityType *)v2 initWithActivityTypeIdentifier:14 isIndoor:0 metadata:MEMORY[0x263EFFA78] auxiliaryTypeIdentifier:*MEMORY[0x263F0AC20]];
  v13[0] = v3;
  uint64_t v11 = *MEMORY[0x263F09AE0];
  uint64_t v12 = &unk_26CD123D8;
  BOOL v4 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  uint64_t v5 = +[FIWorkoutActivityType activityTypeWithHKWorkoutActivityTypeIdentifier:46 isIndoor:0 metadata:v4];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v7 = [FIWorkoutActivityType alloc];
    uint64_t v8 = [(FIWorkoutActivityType *)v7 initWithActivityTypeIdentifier:3000 isIndoor:0 metadata:MEMORY[0x263EFFA78] auxiliaryTypeIdentifier:14];
    uint64_t v9 = [v6 arrayByAddingObject:v8];

    uint64_t v6 = (void *)v9;
  }
  return v6;
}

- (NSString)legacyUniqueIdentifier
{
  id v3 = (void *)MEMORY[0x263F089D8];
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"));
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FIWorkoutActivityType isCategorizedOtherWorkout](self, "isCategorizedOtherWorkout"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"));
  objc_msgSend(v3, "stringWithFormat:", @"%@=%@;%@=%@;%@=%@,%@=%@",
    @"type",
    v4,
    @"isOther",
    v5,
    @"isIndoor",
    v6,
    @"swimmingLocationType",
  uint64_t v8 = v7);

  if ([(FIWorkoutActivityType *)self isPartOfMultiSport])
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@=YES", @"isPartOfMultiSport"];;
    [v8 appendString:v9];
  }
  return (NSString *)v8;
}

- (NSString)uniqueIdentifier
{
  if (_os_feature_enabled_impl())
  {
    id v3 = (void *)MEMORY[0x263F089D8];
    BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier"));
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FIWorkoutActivityType isIndoor](self, "isIndoor"));
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[FIWorkoutActivityType swimmingLocationType](self, "swimmingLocationType"));
    objc_msgSend(v3, "stringWithFormat:", @"%@=%@;%@=%@;%@=%@",
      @"type",
      v4,
      @"isIndoor",
      v5,
      @"swimmingLocationType",
    uint64_t v7 = v6);

    if ([(FIWorkoutActivityType *)self isPartOfMultiSport])
    {
      uint64_t v8 = [NSString stringWithFormat:@"%@=YES", @"isPartOfMultiSport"];;
      [v7 appendString:v8];
    }
  }
  else
  {
    uint64_t v7 = [(FIWorkoutActivityType *)self legacyUniqueIdentifier];
  }
  return (NSString *)v7;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_identifier + 31;
  if ((_os_feature_enabled_impl() & 1) == 0) {
    unint64_t v3 = self->_auxiliaryTypeIdentifier - v3 + 32 * v3;
  }
  int64_t v4 = 31 * ([(FIWorkoutActivityType *)self swimmingLocationType] - v3 + 32 * v3);
  unint64_t v5 = v4 + [(FIWorkoutActivityType *)self isPartOfMultiSport];
  if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:[(FIWorkoutActivityType *)self effectiveTypeIdentifier]])
  {
    return 31 * v5 + [(FIWorkoutActivityType *)self isIndoor];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    BOOL v5 = 0;
    if (!v4) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v6 = [v4 auxiliaryTypeIdentifier];
    BOOL v5 = v6 != [(FIWorkoutActivityType *)self auxiliaryTypeIdentifier];
    if (!v4)
    {
LABEL_12:
      LOBYTE(v11) = 0;
      goto LABEL_13;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  uint64_t v7 = [v4 identifier];
  if (v7 != [(FIWorkoutActivityType *)self identifier] || v5) {
    goto LABEL_12;
  }
  uint64_t v9 = [v4 swimmingLocationType];
  if (v9 != [(FIWorkoutActivityType *)self swimmingLocationType]) {
    goto LABEL_12;
  }
  int v10 = [v4 isPartOfMultiSport];
  if (v10 != [(FIWorkoutActivityType *)self isPartOfMultiSport]) {
    goto LABEL_12;
  }
  if (+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", [v4 effectiveTypeIdentifier])|| +[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", -[FIWorkoutActivityType effectiveTypeIdentifier](self, "effectiveTypeIdentifier")))
  {
    int v13 = [v4 isIndoor];
    int v11 = v13 ^ [(FIWorkoutActivityType *)self isIndoor] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 1;
  }
LABEL_13:

  return v11;
}

+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3
{
  if (shouldDisambiguateOnLocationType__onceToken != -1) {
    dispatch_once(&shouldDisambiguateOnLocationType__onceToken, &__block_literal_global_6);
  }
  id v4 = (void *)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes;
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

uint64_t __58__FIWorkoutActivityType_shouldDisambiguateOnLocationType___block_invoke()
{
  v0 = (void *)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes;
  shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes = (uint64_t)&unk_26CD12C60;

  uint64_t result = _os_feature_enabled_impl();
  if (result)
  {
    shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes = [(id)shouldDisambiguateOnLocationType__indoorOutdoorActivityTypes arrayByAddingObjectsFromArray:&unk_26CD12C78];
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (BOOL)requiresDisambiguation
{
  if ([(FIWorkoutActivityType *)self requiresLocationDisambiguation]) {
    return 1;
  }
  return [(FIWorkoutActivityType *)self requiresSwimmingLocationDisambiguation];
}

- (BOOL)requiresLocationDisambiguation
{
  BOOL v3 = +[FIWorkoutActivityType shouldDisambiguateOnLocationType:[(FIWorkoutActivityType *)self effectiveTypeIdentifier]];
  if (v3) {
    LOBYTE(v3) = [(FIWorkoutActivityType *)self location] == 1;
  }
  return v3;
}

- (BOOL)requiresSwimmingLocationDisambiguation
{
  return [(FIWorkoutActivityType *)self identifier] == 46
      && [(FIWorkoutActivityType *)self swimmingLocationType] == 0;
}

- (id)description
{
  int v3 = _os_feature_enabled_impl();
  id v4 = NSString;
  BOOL v5 = [(FIWorkoutActivityType *)self localizedName];
  if (v3)
  {
    uint64_t v6 = _HKWorkoutSessionLocationTypeName();
    uint64_t v7 = (void *)v6;
    uint64_t v8 = @"YES";
    if (!self->_isPartOfMultiSport) {
      uint64_t v8 = @"NO";
    }
    [v4 stringWithFormat:@"FIWorkoutActivityType(type=%@, location=%@, partOfMultisport=%@, metadata=%@)", v5, v6, v8, self->_metadata, v15, v16];
  }
  else
  {
    uint64_t v9 = &stru_26CD0B5F8;
    if (self->_identifier == 3000 && self->_auxiliaryTypeIdentifier != *MEMORY[0x263F0AC20]) {
      uint64_t v9 = @" (Other)";
    }
    if (self->_isIndoor) {
      int v10 = @"YES";
    }
    else {
      int v10 = @"NO";
    }
    uint64_t v11 = _HKWorkoutSessionLocationTypeName();
    uint64_t v7 = (void *)v11;
    if (self->_isPartOfMultiSport) {
      uint64_t v12 = @"YES";
    }
    else {
      uint64_t v12 = @"NO";
    }
    [v4 stringWithFormat:@"FIWorkoutActivityType(type=%@%@, isIndoor=%@, location=%@, partOfMultisport=%@, metadata=%@)", v5, v9, v10, v11, v12, self->_metadata];
  int v13 = };

  return v13;
}

+ (id)possibleActivityTypesForIdentifier:(unint64_t)a3 locationType:(int64_t)a4 swimmingLocationType:(int64_t)a5 wheelchairUser:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v28 = [MEMORY[0x263EFF980] array];
  unint64_t v26 = a3;
  int IsValid = _HKWorkoutActivityTypeIsValid();
  uint64_t v11 = [a1 optimizedActivityTypesWithIsWheelchairUser:v6 isSwimmingSupported:FIDeviceSupportsSwimming()];
  uint64_t v12 = (void *)[v11 mutableCopy];

  int v13 = [a1 nonOptimizedActivityTypes];
  [v12 addObjectsFromArray:v13];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    BOOL v19 = a3 != 46 || a5 == 0;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (IsValid) {
          BOOL v22 = [*(id *)(*((void *)&v29 + 1) + 8 * i) effectiveTypeIdentifier] == v26;
        }
        else {
          BOOL v22 = 1;
        }
        if (a4 == 1 || (((a4 != 2) ^ [v21 isIndoor]) & 1) != 0)
        {
          int v23 = 1;
          if (v19) {
            goto LABEL_17;
          }
        }
        else
        {
          int v23 = !+[FIWorkoutActivityType shouldDisambiguateOnLocationType:](FIWorkoutActivityType, "shouldDisambiguateOnLocationType:", [v21 effectiveTypeIdentifier]);
          if (v19)
          {
LABEL_17:
            BOOL v24 = 1;
            goto LABEL_20;
          }
        }
        BOOL v24 = [v21 swimmingLocationType] == a5;
LABEL_20:
        if ((v22 & v23 & v24) == 1) {
          [v28 addObject:v21];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v16);
  }

  return v28;
}

+ (unint64_t)mapWheelchairUserActivityType:(unint64_t)a3 isWheelchairUser:(BOOL)a4
{
  unint64_t result = a3;
  if (a4)
  {
    if (a3 == 37)
    {
      return 71;
    }
    else if (a3 == 52)
    {
      return 70;
    }
  }
  return result;
}

- (BOOL)hasLocationTypePool
{
  return [(FIWorkoutActivityType *)self swimmingLocationType] == 1;
}

- (BOOL)isPoolSwimming
{
  return self->_identifier == 46 && [(FIWorkoutActivityType *)self hasLocationTypePool];
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)auxiliaryTypeIdentifier
{
  return self->_auxiliaryTypeIdentifier;
}

- (int64_t)location
{
  return self->_location;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (BOOL)isPartOfMultiSport
{
  return self->_isPartOfMultiSport;
}

- (void).cxx_destruct
{
}

- (id)activityTypePlistKey
{
  uint64_t v3 = [(FIWorkoutActivityType *)self identifier];
  int v4 = [(FIWorkoutActivityType *)self isIndoor];
  uint64_t v5 = [(FIWorkoutActivityType *)self swimmingLocationType];
  return FIGeneralizedActivityTypeKey(v3, v4, v5);
}

- (BOOL)supportsSafetyCheckInPrompt
{
  unint64_t v3 = [(FIWorkoutActivityType *)self effectiveTypeIdentifier];
  BOOL v4 = v3 - 9 > 0x3E || ((1 << (v3 - 9)) & 0x6418083874429511) == 0;
  if (!v4 || v3 == 82 || v3 == 74) {
    return ![(FIWorkoutActivityType *)self isIndoor];
  }
  else {
    return 0;
  }
}

+ (void)activityTypeFromUniqueIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Unable to parse property and value from uniqueIdentifier=%@. Invalid activity identifier.", (uint8_t *)&v2, 0xCu);
}

+ (void)activityTypeFromUniqueIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C74B000, a2, OS_LOG_TYPE_ERROR, "Unable to parse property and value from uniqueIdentifier=%@", (uint8_t *)&v2, 0xCu);
}

@end