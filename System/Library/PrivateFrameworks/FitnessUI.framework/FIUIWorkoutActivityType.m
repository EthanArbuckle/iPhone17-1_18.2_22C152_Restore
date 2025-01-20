@interface FIUIWorkoutActivityType
+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4;
+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5;
+ (FIUIWorkoutActivityType)activityTypeWithWorkout:(id)a3;
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
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6;
- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7;
- (FIUIWorkoutActivityType)initWithCoder:(id)a3;
- (FIUIWorkoutActivityType)initWithWorkoutActivityType:(id)a3;
- (FIWorkoutActivityType)workoutActivityType;
- (HKQuantity)lapLength;
- (NSDictionary)metadata;
- (NSString)uniqueIdentifier;
- (NSUUID)openGoalUUID;
- (id)activityTypeByAddingLapLength:(double)a3;
- (id)activityTypePlistKey;
- (id)description;
- (id)localizedName;
- (id)localizedNameComponents;
- (int64_t)location;
- (int64_t)swimmingLocationType;
- (unint64_t)auxiliaryTypeIdentifier;
- (unint64_t)effectiveTypeIdentifier;
- (unint64_t)hash;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FIUIWorkoutActivityType

- (FIUIWorkoutActivityType)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutActivityType;
  v5 = [(FIUIWorkoutActivityType *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F3D180]) initWithCoder:v4];
    workoutActivityType = v5->_workoutActivityType;
    v5->_workoutActivityType = (FIWorkoutActivityType *)v6;
  }
  return v5;
}

+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [FIUIWorkoutActivityType alloc];
  v7 = [(FIUIWorkoutActivityType *)v6 initWithActivityTypeIdentifier:a3 isIndoor:v4 metadata:MEMORY[0x263EFFA78]];
  return v7;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  BOOL v5 = a4;
  v8 = (objc_class *)MEMORY[0x263F3D180];
  id v9 = a5;
  v10 = (void *)[[v8 alloc] initWithActivityTypeIdentifier:a3 isIndoor:v5 metadata:v9];

  v11 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v10];
  return v11;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5 auxiliaryTypeIdentifier:(unint64_t)a6
{
  BOOL v7 = a4;
  v10 = (objc_class *)MEMORY[0x263F3D180];
  id v11 = a5;
  v12 = (void *)[[v10 alloc] initWithActivityTypeIdentifier:a3 isIndoor:v7 metadata:v11 auxiliaryTypeIdentifier:a6];

  v13 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v12];
  return v13;
}

+ (FIUIWorkoutActivityType)activityTypeWithHKWorkoutActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 metadata:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  v8 = [[FIUIWorkoutActivityType alloc] initWithActivityTypeIdentifier:a3 isIndoor:v5 metadata:v7];

  return v8;
}

- (unint64_t)hash
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType hash];
}

- (BOOL)isEqual:(id)a3
{
  workoutActivityType = self->_workoutActivityType;
  BOOL v4 = [a3 workoutActivityType];
  LOBYTE(workoutActivityType) = [(FIWorkoutActivityType *)workoutActivityType isEqual:v4];

  return (char)workoutActivityType;
}

- (unint64_t)identifier
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType identifier];
}

- (unint64_t)auxiliaryTypeIdentifier
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType auxiliaryTypeIdentifier];
}

- (BOOL)isIndoor
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType isIndoor];
}

- (int64_t)swimmingLocationType
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType swimmingLocationType];
}

- (NSDictionary)metadata
{
  return (NSDictionary *)[(FIWorkoutActivityType *)self->_workoutActivityType metadata];
}

+ (id)wheelchairActivityTypes
{
  v2 = [MEMORY[0x263F3D180] wheelchairActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_301);

  return v3;
}

- (id)localizedName
{
  return (id)[(FIWorkoutActivityType *)self->_workoutActivityType localizedName];
}

- (unint64_t)effectiveTypeIdentifier
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType effectiveTypeIdentifier];
}

- (BOOL)hasLocationTypePool
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType hasLocationTypePool];
}

- (void).cxx_destruct
{
}

- (id)description
{
  v2 = NSString;
  v3 = [(FIWorkoutActivityType *)self->_workoutActivityType description];
  BOOL v4 = [v2 stringWithFormat:@"FIUIWorkoutActivityType(workoutActivityType=%@)", v3];

  return v4;
}

- (HKQuantity)lapLength
{
  return (HKQuantity *)[(FIWorkoutActivityType *)self->_workoutActivityType lapLength];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (FIUIWorkoutActivityType)activityTypeWithWorkout:(id)a3
{
  v3 = [MEMORY[0x263F3D180] activityTypeWithWorkout:a3];
  BOOL v4 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v3];

  return v4;
}

+ (id)effectiveActivityTypeWithWorkout:(id)a3
{
  v3 = [MEMORY[0x263F3D180] effectiveActivityTypeWithWorkout:a3];
  BOOL v4 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v3];

  return v4;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4
{
  BOOL v5 = (void *)[objc_alloc(MEMORY[0x263F3D180]) initWithActivityTypeIdentifier:a3 isIndoor:a4];
  uint64_t v6 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v5];

  return v6;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  v10 = (objc_class *)MEMORY[0x263F3D180];
  id v11 = a6;
  v12 = (void *)[[v10 alloc] initWithActivityTypeIdentifier:a3 isIndoor:v7 isPartOfMultiSport:v6 metadata:v11];

  v13 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v12];
  return v13;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 isIndoor:(BOOL)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  v12 = (objc_class *)MEMORY[0x263F3D180];
  id v13 = a6;
  v14 = (void *)[[v12 alloc] initWithActivityTypeIdentifier:a3 isIndoor:v9 isPartOfMultiSport:v8 metadata:v13 auxiliaryTypeIdentifier:a7];

  v15 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v14];
  return v15;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6
{
  BOOL v6 = a5;
  v10 = (objc_class *)MEMORY[0x263F3D180];
  id v11 = a6;
  v12 = (void *)[[v10 alloc] initWithActivityTypeIdentifier:a3 location:a4 isPartOfMultiSport:v6 metadata:v11];

  id v13 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v12];
  return v13;
}

- (FIUIWorkoutActivityType)initWithActivityTypeIdentifier:(unint64_t)a3 location:(int64_t)a4 isPartOfMultiSport:(BOOL)a5 metadata:(id)a6 auxiliaryTypeIdentifier:(unint64_t)a7
{
  BOOL v8 = a5;
  v12 = (objc_class *)MEMORY[0x263F3D180];
  id v13 = a6;
  v14 = (void *)[[v12 alloc] initWithActivityTypeIdentifier:a3 location:a4 isPartOfMultiSport:v8 metadata:v13 auxiliaryTypeIdentifier:a7];

  v15 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v14];
  return v15;
}

- (FIUIWorkoutActivityType)initWithWorkoutActivityType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FIUIWorkoutActivityType;
  BOOL v6 = [(FIUIWorkoutActivityType *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_workoutActivityType, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)location
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType location];
}

- (BOOL)isCategorizedOtherWorkout
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType isCategorizedOtherWorkout];
}

- (id)localizedNameComponents
{
  return (id)[(FIWorkoutActivityType *)self->_workoutActivityType localizedNameComponents];
}

- (id)activityTypeByAddingLapLength:(double)a3
{
  BOOL v4 = [(FIWorkoutActivityType *)self->_workoutActivityType activityTypeByAddingLapLength:a3];
  id v5 = [(FIUIWorkoutActivityType *)self initWithWorkoutActivityType:v4];

  return v5;
}

- (BOOL)isWaterLockActivity
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType isWaterLockActivity];
}

- (BOOL)isPartOfMultiSport
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType isPartOfMultiSport];
}

+ (id)defaultActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4 activityMoveMode:(int64_t)a5
{
  id v5 = [MEMORY[0x263F3D180] defaultActivityTypesWithIsWheelchairUser:a3 isSwimmingSupported:a4 activityMoveMode:a5];
  BOOL v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_2);

  return v6;
}

FIUIWorkoutActivityType *__105__FIUIWorkoutActivityType_defaultActivityTypesWithIsWheelchairUser_isSwimmingSupported_activityMoveMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)gymKitCapableActivityTypes
{
  id v2 = [MEMORY[0x263F3D180] gymKitCapableActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_293);

  return v3;
}

FIUIWorkoutActivityType *__53__FIUIWorkoutActivityType_gymKitCapableActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)optimizedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  BOOL v4 = [MEMORY[0x263F3D180] optimizedActivityTypesWithIsWheelchairUser:a3 isSwimmingSupported:a4];
  id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_295);

  return v5;
}

FIUIWorkoutActivityType *__90__FIUIWorkoutActivityType_optimizedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)otherWorkoutActivityTypes
{
  return (id)[MEMORY[0x263F3D180] otherWorkoutActivityTypes];
}

+ (id)nonOptimizedActivityTypes
{
  id v2 = [MEMORY[0x263F3D180] nonOptimizedActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_297);

  return v3;
}

FIUIWorkoutActivityType *__52__FIUIWorkoutActivityType_nonOptimizedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)unsupportedActivityTypesWithIsWheelchairUser:(BOOL)a3 isSwimmingSupported:(BOOL)a4
{
  BOOL v4 = [MEMORY[0x263F3D180] unsupportedActivityTypesWithIsWheelchairUser:a3 isSwimmingSupported:a4];
  id v5 = objc_msgSend(v4, "hk_map:", &__block_literal_global_299);

  return v5;
}

FIUIWorkoutActivityType *__92__FIUIWorkoutActivityType_unsupportedActivityTypesWithIsWheelchairUser_isSwimmingSupported___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

FIUIWorkoutActivityType *__50__FIUIWorkoutActivityType_wheelchairActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)swimmingOptimizedActivityTypes
{
  id v2 = [MEMORY[0x263F3D180] swimmingOptimizedActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_303);

  return v3;
}

FIUIWorkoutActivityType *__57__FIUIWorkoutActivityType_swimmingOptimizedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)swimmingOtherActivityTypes
{
  id v2 = [MEMORY[0x263F3D180] swimmingOtherActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_305);

  return v3;
}

FIUIWorkoutActivityType *__53__FIUIWorkoutActivityType_swimmingOtherActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (id)deprecatedActivityTypes
{
  id v2 = [MEMORY[0x263F3D180] deprecatedActivityTypes];
  v3 = objc_msgSend(v2, "hk_map:", &__block_literal_global_307);

  return v3;
}

FIUIWorkoutActivityType *__50__FIUIWorkoutActivityType_deprecatedActivityTypes__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)[(FIWorkoutActivityType *)self->_workoutActivityType uniqueIdentifier];
}

+ (BOOL)shouldDisambiguateOnLocationType:(unint64_t)a3
{
  return [MEMORY[0x263F3D180] shouldDisambiguateOnLocationType:a3];
}

- (BOOL)requiresDisambiguation
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType requiresDisambiguation];
}

- (BOOL)requiresLocationDisambiguation
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType requiresLocationDisambiguation];
}

- (BOOL)requiresSwimmingLocationDisambiguation
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType requiresSwimmingLocationDisambiguation];
}

+ (id)possibleActivityTypesForIdentifier:(unint64_t)a3 locationType:(int64_t)a4 swimmingLocationType:(int64_t)a5 wheelchairUser:(BOOL)a6
{
  BOOL v6 = [MEMORY[0x263F3D180] possibleActivityTypesForIdentifier:a3 locationType:a4 swimmingLocationType:a5 wheelchairUser:a6];
  BOOL v7 = objc_msgSend(v6, "hk_map:", &__block_literal_global_313);

  return v7;
}

FIUIWorkoutActivityType *__111__FIUIWorkoutActivityType_possibleActivityTypesForIdentifier_locationType_swimmingLocationType_wheelchairUser___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[FIUIWorkoutActivityType alloc] initWithWorkoutActivityType:v2];

  return v3;
}

+ (unint64_t)mapWheelchairUserActivityType:(unint64_t)a3 isWheelchairUser:(BOOL)a4
{
  return [MEMORY[0x263F3D180] mapWheelchairUserActivityType:a3 isWheelchairUser:a4];
}

- (BOOL)isPoolSwimming
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType isPoolSwimming];
}

- (FIWorkoutActivityType)workoutActivityType
{
  return self->_workoutActivityType;
}

- (id)activityTypePlistKey
{
  return (id)[(FIWorkoutActivityType *)self->_workoutActivityType activityTypePlistKey];
}

- (NSUUID)openGoalUUID
{
  return (NSUUID *)[(FIWorkoutActivityType *)self->_workoutActivityType openGoalUUID];
}

- (BOOL)supportsSafetyCheckInPrompt
{
  return [(FIWorkoutActivityType *)self->_workoutActivityType supportsSafetyCheckInPrompt];
}

@end