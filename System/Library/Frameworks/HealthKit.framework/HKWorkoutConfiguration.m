@interface HKWorkoutConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)_workoutConfigurationFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldDisambiguateLocation;
- (BOOL)shouldUseExtendedMode;
- (BOOL)shouldUseLowPowerMode;
- (BOOL)validateIgnoringDeviceSupport:(BOOL)a3 error:(id *)a4;
- (HKQuantity)lapLength;
- (HKWorkoutActivityType)activityType;
- (HKWorkoutConfiguration)init;
- (HKWorkoutConfiguration)initWithCoder:(id)a3;
- (HKWorkoutSessionLocationType)locationType;
- (HKWorkoutSwimmingLocationType)swimmingLocationType;
- (NSString)fitnessPlusCatalogWorkoutId;
- (NSUUID)fitnessMachineSessionUUID;
- (NSUUID)predictionSessionUUID;
- (NSUUID)suggestedActivityUUID;
- (id)_dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)fitnessPlusMediaType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityType:(HKWorkoutActivityType)activityType;
- (void)setFitnessMachineSessionUUID:(id)a3;
- (void)setFitnessPlusCatalogWorkoutId:(id)a3;
- (void)setFitnessPlusMediaType:(int64_t)a3;
- (void)setLapLength:(HKQuantity *)lapLength;
- (void)setLocationType:(HKWorkoutSessionLocationType)locationType;
- (void)setPredictionSessionUUID:(id)a3;
- (void)setShouldDisambiguateLocation:(BOOL)a3;
- (void)setShouldUseExtendedMode:(BOOL)a3;
- (void)setShouldUseLowPowerMode:(BOOL)a3;
- (void)setSuggestedActivityUUID:(id)a3;
- (void)setSwimmingLocationType:(HKWorkoutSwimmingLocationType)swimmingLocationType;
@end

@implementation HKWorkoutConfiguration

- (HKWorkoutConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKWorkoutConfiguration;
  result = [(HKWorkoutConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_activityType = xmmword_19C3D3860;
    result->_swimmingLocationType = 0;
    result->_shouldUseExtendedMode = 0;
    *(_WORD *)&result->_shouldUseLowPowerMode = 0;
    result->_fitnessPlusMediaType = 0;
  }
  return result;
}

- (void)setActivityType:(HKWorkoutActivityType)activityType
{
  self->_activityType = activityType;
}

- (void)setLocationType:(HKWorkoutSessionLocationType)locationType
{
  self->_locationType = locationType;
}

- (HKWorkoutActivityType)activityType
{
  return self->_activityType;
}

- (HKWorkoutSessionLocationType)locationType
{
  return self->_locationType;
}

- (HKWorkoutSwimmingLocationType)swimmingLocationType
{
  return self->_swimmingLocationType;
}

- (HKQuantity)lapLength
{
  return (HKQuantity *)objc_getProperty(self, a2, 40, 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[HKWorkoutConfiguration allocWithZone:](HKWorkoutConfiguration, "allocWithZone:") init];
  [(HKWorkoutConfiguration *)v5 setActivityType:self->_activityType];
  [(HKWorkoutConfiguration *)v5 setLocationType:self->_locationType];
  [(HKWorkoutConfiguration *)v5 setSwimmingLocationType:self->_swimmingLocationType];
  id v6 = [(HKQuantity *)self->_lapLength copyWithZone:a3];
  [(HKWorkoutConfiguration *)v5 setLapLength:v6];

  v7 = (void *)[(NSUUID *)self->_predictionSessionUUID copyWithZone:a3];
  [(HKWorkoutConfiguration *)v5 setPredictionSessionUUID:v7];

  v8 = (void *)[(NSUUID *)self->_fitnessMachineSessionUUID copyWithZone:a3];
  [(HKWorkoutConfiguration *)v5 setFitnessMachineSessionUUID:v8];

  [(HKWorkoutConfiguration *)v5 setShouldDisambiguateLocation:self->_shouldDisambiguateLocation];
  [(HKWorkoutConfiguration *)v5 setShouldUseExtendedMode:self->_shouldUseExtendedMode];
  [(HKWorkoutConfiguration *)v5 setShouldUseLowPowerMode:self->_shouldUseLowPowerMode];
  v9 = (void *)[(NSString *)self->_fitnessPlusCatalogWorkoutId copyWithZone:a3];
  [(HKWorkoutConfiguration *)v5 setFitnessPlusCatalogWorkoutId:v9];

  [(HKWorkoutConfiguration *)v5 setFitnessPlusMediaType:self->_fitnessPlusMediaType];
  v10 = (void *)[(NSUUID *)self->_suggestedActivityUUID copyWithZone:a3];
  [(HKWorkoutConfiguration *)v5 setSuggestedActivityUUID:v10];

  return v5;
}

- (void)setSwimmingLocationType:(HKWorkoutSwimmingLocationType)swimmingLocationType
{
  self->_swimmingLocationType = swimmingLocationType;
}

- (void)setLapLength:(HKQuantity *)lapLength
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedActivityUUID, 0);
  objc_storeStrong((id *)&self->_fitnessPlusCatalogWorkoutId, 0);
  objc_storeStrong((id *)&self->_predictionSessionUUID, 0);
  objc_storeStrong((id *)&self->_fitnessMachineSessionUUID, 0);

  objc_storeStrong((id *)&self->_lapLength, 0);
}

- (BOOL)validateIgnoringDeviceSupport:(BOOL)a3 error:(id *)a4
{
  if ((_HKWorkoutActivityTypeIsValid(self->_activityType) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid workout activity type %ld", self->_activityType);
    return 0;
  }
  int64_t locationType = self->_locationType;
  if ((unint64_t)(locationType - 1) >= 3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid workout session location type %ld", self->_locationType);
    return 0;
  }
  if (locationType != 2 && self->_fitnessMachineSessionUUID != 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = @"GymKit workout session location type should be indoor";
LABEL_17:
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, v14, v21);
    return 0;
  }
  if (self->_activityType == 46)
  {
    if (!a3)
    {
      v9 = +[_HKBehavior sharedBehavior];
      char v10 = [v9 supportsSwimmingWorkoutSessions];

      if ((v10 & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        v14 = @"Swimming sessions are not supported on this device";
        goto LABEL_17;
      }
    }
    if (!_HKWorkoutSwimmingLocationTypeIsValid(self->_swimmingLocationType))
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Invalid swimming location type %ld", self->_swimmingLocationType);
      return 0;
    }
    int v11 = HKProgramSDKAtLeast();
    int64_t swimmingLocationType = self->_swimmingLocationType;
    if (v11 && !swimmingLocationType)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      v14 = @"Swimming workouts should be either pool or open water workouts.";
      goto LABEL_17;
    }
    lapLength = self->_lapLength;
    if (swimmingLocationType == 2)
    {
      if (lapLength)
      {
        v13 = (void *)MEMORY[0x1E4F28C58];
        v14 = @"Open water swimming should not have lap length";
        goto LABEL_17;
      }
    }
    else
    {
      if (lapLength)
      {
        if (!_HKWorkoutLapLengthIsValid(lapLength))
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Lap length is not a valid quantity type %@", self->_lapLength);
          return 0;
        }
        int64_t swimmingLocationType = self->_swimmingLocationType;
      }
      if (swimmingLocationType == 1)
      {
        v17 = self->_lapLength;
        if (!v17
          || (+[HKUnit meterUnit],
              v18 = objc_claimAutoreleasedReturnValue(),
              [(HKQuantity *)v17 doubleValueForUnit:v18],
              double v20 = v19,
              v18,
              v20 < 2.22044605e-16))
        {
          v13 = (void *)MEMORY[0x1E4F28C58];
          v14 = @"Invalid lap length for pool swimming";
          goto LABEL_17;
        }
      }
    }
  }
  else if (HKProgramSDKAtLeast() && self->_swimmingLocationType)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = @"Swimming location should not be set for non swimming activities";
    goto LABEL_17;
  }
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKWorkoutConfiguration *)a3;
  if (v4 == self)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = v5;
      if (self->_activityType != v5->_activityType) {
        goto LABEL_21;
      }
      if (self->_locationType != v5->_locationType) {
        goto LABEL_21;
      }
      if (self->_swimmingLocationType != v5->_swimmingLocationType) {
        goto LABEL_21;
      }
      fitnessMachineSessionUUID = self->_fitnessMachineSessionUUID;
      v8 = v6->_fitnessMachineSessionUUID;
      if (fitnessMachineSessionUUID != v8
        && (!v8 || !-[NSUUID isEqual:](fitnessMachineSessionUUID, "isEqual:")))
      {
        goto LABEL_21;
      }
      lapLength = self->_lapLength;
      char v10 = v6->_lapLength;
      if (lapLength != v10 && (!v10 || !-[HKQuantity isEqual:](lapLength, "isEqual:"))) {
        goto LABEL_21;
      }
      suggestedActivityUUID = self->_suggestedActivityUUID;
      v12 = v6->_suggestedActivityUUID;
      if (suggestedActivityUUID != v12
        && (!v12 || !-[NSUUID isEqual:](suggestedActivityUUID, "isEqual:")))
      {
        goto LABEL_21;
      }
      if (self->_fitnessPlusMediaType != v6->_fitnessPlusMediaType) {
        goto LABEL_21;
      }
      fitnessPlusCatalogWorkoutId = self->_fitnessPlusCatalogWorkoutId;
      v14 = v6->_fitnessPlusCatalogWorkoutId;
      if (fitnessPlusCatalogWorkoutId == v14)
      {
        char v15 = 1;
        goto LABEL_22;
      }
      if (v14) {
        char v15 = -[NSString isEqual:](fitnessPlusCatalogWorkoutId, "isEqual:");
      }
      else {
LABEL_21:
      }
        char v15 = 0;
LABEL_22:

      goto LABEL_23;
    }
    char v15 = 0;
  }
LABEL_23:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_activityType ^ (self->_locationType << 8) ^ (self->_swimmingLocationType << 16);
  unint64_t v4 = [(HKQuantity *)self->_lapLength hash];
  uint64_t v5 = v4 ^ [(NSUUID *)self->_fitnessMachineSessionUUID hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_fitnessPlusCatalogWorkoutId hash];
  return v3 ^ v6 ^ [(NSUUID *)self->_suggestedActivityUUID hash];
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = _HKWorkoutActivityNameForActivityType(self->_activityType);
  NSUInteger v6 = (void *)v5;
  unint64_t v7 = self->_locationType - 1;
  if (v7 > 2) {
    v8 = @"invalid location";
  }
  else {
    v8 = off_1E58C2F20[v7];
  }
  v9 = [v3 stringWithFormat:@"<%@:%p activity:%@ location:%@", v4, self, v5, v8];

  char v10 = _HKWorkoutSwimmingLocationTypeName(self->_swimmingLocationType);
  [v9 appendFormat:@" swimming location:%@ lap length:%@", v10, self->_lapLength];

  if (self->_shouldDisambiguateLocation) {
    objc_msgSend(v9, "appendFormat:", @" disambiguation requested:%d", 1);
  }
  if (self->_shouldUseExtendedMode) {
    objc_msgSend(v9, "appendFormat:", @" extended mode:%d", 1);
  }
  if (self->_shouldUseLowPowerMode) {
    objc_msgSend(v9, "appendFormat:", @" low power mode:%d", 1);
  }
  if (self->_fitnessMachineSessionUUID) {
    [v9 appendFormat:@" fitness machine session UUID:%@", self->_fitnessMachineSessionUUID];
  }
  fitnessPlusCatalogWorkoutId = self->_fitnessPlusCatalogWorkoutId;
  if (fitnessPlusCatalogWorkoutId)
  {
    unint64_t fitnessPlusMediaType = self->_fitnessPlusMediaType;
    if (fitnessPlusMediaType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown(%ld)", self->_fitnessPlusMediaType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E58C2F00[fitnessPlusMediaType];
    }
    [v9 appendFormat:@" catalog id: %@, media: %@", fitnessPlusCatalogWorkoutId, v13];
  }
  if (self->_suggestedActivityUUID) {
    [v9 appendFormat:@" Suggested activity UUID:%@", self->_suggestedActivityUUID];
  }
  [v9 appendString:@">"];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t activityType = self->_activityType;
  id v5 = a3;
  [v5 encodeInteger:activityType forKey:@"activityType"];
  [v5 encodeInteger:self->_locationType forKey:@"locationType"];
  [v5 encodeInteger:self->_swimmingLocationType forKey:@"swimmingLocationType"];
  [v5 encodeObject:self->_lapLength forKey:@"lapLength"];
  [v5 encodeObject:self->_fitnessMachineSessionUUID forKey:@"ftmSessionUUIDKey"];
  [v5 encodeObject:self->_predictionSessionUUID forKey:@"predictionSessionUUIDKey"];
  [v5 encodeBool:self->_shouldDisambiguateLocation forKey:@"disambiguateLocationTypeKey"];
  [v5 encodeBool:self->_shouldUseExtendedMode forKey:@"useExtendedModeKey"];
  [v5 encodeBool:self->_shouldUseLowPowerMode forKey:@"enableLowPowerModeKey"];
  [v5 encodeObject:self->_fitnessPlusCatalogWorkoutId forKey:@"fpCatalogWorkoutIdString"];
  [v5 encodeInteger:self->_fitnessPlusMediaType forKey:@"fpMediaType"];
  [v5 encodeObject:self->_suggestedActivityUUID forKey:@"suggestedActivityUUIDKey"];
}

- (HKWorkoutConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HKWorkoutConfiguration;
  id v5 = [(HKWorkoutConfiguration *)&v17 init];
  if (v5)
  {
    v5->_unint64_t activityType = [v4 decodeIntegerForKey:@"activityType"];
    v5->_int64_t locationType = [v4 decodeIntegerForKey:@"locationType"];
    v5->_int64_t swimmingLocationType = [v4 decodeIntegerForKey:@"swimmingLocationType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lapLength"];
    lapLength = v5->_lapLength;
    v5->_lapLength = (HKQuantity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ftmSessionUUIDKey"];
    fitnessMachineSessionUUID = v5->_fitnessMachineSessionUUID;
    v5->_fitnessMachineSessionUUID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"predictionSessionUUIDKey"];
    predictionSessionUUID = v5->_predictionSessionUUID;
    v5->_predictionSessionUUID = (NSUUID *)v10;

    v5->_shouldDisambiguateLocation = [v4 decodeBoolForKey:@"disambiguateLocationTypeKey"];
    v5->_shouldUseExtendedMode = [v4 decodeBoolForKey:@"useExtendedModeKey"];
    v5->_shouldUseLowPowerMode = [v4 decodeBoolForKey:@"enableLowPowerModeKey"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fpCatalogWorkoutIdString"];
    fitnessPlusCatalogWorkoutId = v5->_fitnessPlusCatalogWorkoutId;
    v5->_fitnessPlusCatalogWorkoutId = (NSString *)v12;

    v5->_unint64_t fitnessPlusMediaType = [v4 decodeIntegerForKey:@"fpMediaType"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"suggestedActivityUUIDKey"];
    suggestedActivityUUID = v5->_suggestedActivityUUID;
    v5->_suggestedActivityUUID = (NSUUID *)v14;
  }
  return v5;
}

- (id)_dictionaryRepresentation
{
  v9[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v3 encodeObject:self forKey:@"HKWorkoutConfigurationKey"];
  id v4 = [v3 encodedData];
  uint64_t v8 = @"HKWorkoutConfigurationNSDataKey";
  id v5 = v4;
  if (!v4)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] data];
  }
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  if (!v4) {

  }
  return v6;
}

+ (id)_workoutConfigurationFromDictionary:(id)a3
{
  unint64_t v3 = [a3 objectForKey:@"HKWorkoutConfigurationNSDataKey"];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:0];
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HKWorkoutConfigurationKey"];
    [v4 finishDecoding];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseLowPowerMode
{
  return self->_shouldUseLowPowerMode;
}

- (void)setShouldUseLowPowerMode:(BOOL)a3
{
  self->_shouldUseLowPowerMode = a3;
}

- (NSUUID)fitnessMachineSessionUUID
{
  return self->_fitnessMachineSessionUUID;
}

- (void)setFitnessMachineSessionUUID:(id)a3
{
}

- (NSUUID)predictionSessionUUID
{
  return self->_predictionSessionUUID;
}

- (void)setPredictionSessionUUID:(id)a3
{
}

- (BOOL)shouldDisambiguateLocation
{
  return self->_shouldDisambiguateLocation;
}

- (void)setShouldDisambiguateLocation:(BOOL)a3
{
  self->_shouldDisambiguateLocation = a3;
}

- (BOOL)shouldUseExtendedMode
{
  return self->_shouldUseExtendedMode;
}

- (void)setShouldUseExtendedMode:(BOOL)a3
{
  self->_shouldUseExtendedMode = a3;
}

- (NSString)fitnessPlusCatalogWorkoutId
{
  return self->_fitnessPlusCatalogWorkoutId;
}

- (void)setFitnessPlusCatalogWorkoutId:(id)a3
{
}

- (int64_t)fitnessPlusMediaType
{
  return self->_fitnessPlusMediaType;
}

- (void)setFitnessPlusMediaType:(int64_t)a3
{
  self->_unint64_t fitnessPlusMediaType = a3;
}

- (NSUUID)suggestedActivityUUID
{
  return self->_suggestedActivityUUID;
}

- (void)setSuggestedActivityUUID:(id)a3
{
}

@end