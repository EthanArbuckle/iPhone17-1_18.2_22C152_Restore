@interface INStartWorkoutIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (INSpeakableString)workoutName;
- (INStartWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName goalValue:(NSNumber *)goalValue workoutGoalUnitType:(INWorkoutGoalUnitType)workoutGoalUnitType workoutLocationType:(INWorkoutLocationType)workoutLocationType isOpenEnded:(NSNumber *)isOpenEnded;
- (INWorkoutCustomization)customization;
- (INWorkoutGoalUnitType)workoutGoalUnitType;
- (INWorkoutLocationType)workoutLocationType;
- (NSArray)associatedItems;
- (NSNumber)goalValue;
- (NSNumber)isBuiltInWorkoutType;
- (NSNumber)isOpenEnded;
- (NSNumber)isVoiceOnly;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_goalValueIntentSlotDescription;
- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5;
- (id)_metadata;
- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4;
- (id)_typedBackingStore;
- (id)domain;
- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)sequenceLabel;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAssociatedItems:(id)a3;
- (void)setCustomization:(id)a3;
- (void)setGoalValue:(id)a3;
- (void)setIsBuiltInWorkoutType:(id)a3;
- (void)setIsOpenEnded:(id)a3;
- (void)setIsVoiceOnly:(id)a3;
- (void)setSequenceLabel:(int64_t)a3;
- (void)setWorkoutGoalUnitType:(int64_t)a3;
- (void)setWorkoutLocationType:(int64_t)a3;
- (void)setWorkoutName:(id)a3;
@end

@implementation INStartWorkoutIntent

- (id)_intents_backgroundHandlingAssertionForBundleIdentifier:(id)a3 context:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (!a4)
  {
    v8 = [getAVSystemControllerClass() sharedAVSystemController];
    v9 = getAVSystemController_AllowAppToInitiatePlaybackTemporarilyAttribute();
    id v14 = 0;
    char v10 = [v8 setAttribute:v7 forKey:v9 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0) {
      *a5 = v11;
    }
  }
  v12 = (void *)[MEMORY[0x1E4F1E5E8] newAssertionForBundleIdentifier:v7 withReason:@"SiriKit Background Workout" level:1];

  return v12;
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 facadePropertyName];
  int v9 = [v8 isEqualToString:@"goalValue"];

  if (v9)
  {
    char v10 = [(INStartWorkoutIntent *)self goalValue];
    [v10 doubleValue];
    double v12 = v11;

    switch([(INStartWorkoutIntent *)self workoutGoalUnitType])
    {
      case INWorkoutGoalUnitTypeInch:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291E0] inches];
        break;
      case INWorkoutGoalUnitTypeMeter:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291E0] meters];
        break;
      case INWorkoutGoalUnitTypeFoot:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291E0] feet];
        break;
      case INWorkoutGoalUnitTypeMile:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291E0] miles];
        break;
      case INWorkoutGoalUnitTypeYard:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291E0] yards];
        break;
      case INWorkoutGoalUnitTypeSecond:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F29180] seconds];
        break;
      case INWorkoutGoalUnitTypeMinute:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F29180] minutes];
        break;
      case INWorkoutGoalUnitTypeHour:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F29180] hours];
        break;
      case INWorkoutGoalUnitTypeJoule:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291B0] joules];
        break;
      case INWorkoutGoalUnitTypeKiloCalorie:
        id v13 = objc_alloc(MEMORY[0x1E4F28E28]);
        uint64_t v14 = [MEMORY[0x1E4F291B0] kilocalories];
        break;
      default:
        goto LABEL_23;
    }
    v25 = (void *)v14;
    v26 = (void *)[v13 initWithDoubleValue:v14 unit:v12];

    if (v26)
    {
      id v27 = objc_alloc_init(MEMORY[0x1E4F28E30]);
      [v27 setUnitOptions:3];
      v28 = [v7 locale];
      [v27 setLocale:v28];

      [v27 setUnitStyle:3];
      v20 = [v27 stringFromMeasurement:v26];

      goto LABEL_25;
    }
    goto LABEL_23;
  }
  v15 = [v6 facadePropertyName];
  int v16 = [v15 isEqualToString:@"workoutName"];

  if (v16)
  {
    v17 = [(INStartWorkoutIntent *)self workoutName];
    v18 = [v17 spokenPhrase];

    if ([v18 hasPrefix:@"com.apple.intents.WorkoutNameIdentifier."])
    {
      v19 = [v18 substringFromIndex:objc_msgSend(@"com.apple.intents.WorkoutNameIdentifier.", "length")];
      INLocalizedStringWithLocalizer(v18, v19, v7);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    goto LABEL_11;
  }
  v18 = [v6 facadePropertyName];
  if (![v18 isEqualToString:@"isOpenEnded"])
  {
LABEL_11:

    goto LABEL_23;
  }
  v21 = [(INStartWorkoutIntent *)self isOpenEnded];

  if (!v21)
  {
LABEL_23:
    v30.receiver = self;
    v30.super_class = (Class)INStartWorkoutIntent;
    uint64_t v24 = [(INIntent *)&v30 localizeValueOfSlotDescription:v6 withLocalizer:v7];
    goto LABEL_24;
  }
  v22 = [(INStartWorkoutIntent *)self isOpenEnded];
  int v23 = [v22 BOOLValue];

  if (v23)
  {
    uint64_t v24 = INLocalizedStringWithLocalizer(@"com.apple.intents.WorkoutIsOpenEnded", @"com.apple.intents.WorkoutIsOpenEnded", v7);
LABEL_24:
    v20 = (__CFString *)v24;
    goto LABEL_25;
  }
  v20 = &stru_1EDA6DB28;
LABEL_25:

  return v20;
}

- (id)_goalValueIntentSlotDescription
{
  v2 = [(INIntent *)self intentSlotDescriptions];
  v3 = objc_msgSend(v2, "if_firstObjectPassingTest:", &__block_literal_global_29060);

  return v3;
}

uint64_t __64__INStartWorkoutIntent_Summary___goalValueIntentSlotDescription__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 facadePropertyName];
  uint64_t v3 = [v2 isEqualToString:@"goalValue"];

  return v3;
}

- (id)_titleWithLocalizer:(id)a3 fromBundleURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(INStartWorkoutIntent *)self isOpenEnded];
  int v9 = [v8 isEqual:&unk_1EDBA7498];

  if (v9)
  {
    v26.receiver = self;
    v26.super_class = (Class)INStartWorkoutIntent;
    char v10 = [(INIntent *)&v26 _titleWithLocalizer:v6 fromBundleURL:v7];
  }
  else
  {
    double v11 = [(INStartWorkoutIntent *)self workoutName];
    double v12 = [v11 spokenPhrase];

    char v13 = __tolower((char)[v12 characterAtIndex:0]);
    uint64_t v14 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"aeiou"];
    if ([v14 characterIsMember:(unsigned __int16)v13]
      && [(INStartWorkoutIntent *)self workoutLocationType] == INWorkoutLocationTypeUnknown)
    {
      int v15 = [v12 isEqualToString:@"Other"];
      int v16 = @"Start an %1$@ workout for %2$@";
      if (v15) {
        int v16 = @"Start %1$@ workout for %2$@";
      }
      v17 = v16;
      v18 = [(INStartWorkoutIntent *)self workoutName];
      v19 = objc_msgSend(v18, "_intents_readableTitleWithLocalizer:", v6);

      v20 = [(INStartWorkoutIntent *)self _goalValueIntentSlotDescription];
      v21 = [(INStartWorkoutIntent *)self localizeValueOfSlotDescription:v20 withLocalizer:v6];

      v22 = NSString;
      int v23 = INLocalizedStringWithLocalizer(v17, v17, v6);

      char v10 = objc_msgSend(v22, "localizedStringWithFormat:", v23, v19, v21);
    }
    else
    {
      v25.receiver = self;
      v25.super_class = (Class)INStartWorkoutIntent;
      char v10 = [(INIntent *)&v25 _titleWithLocalizer:v6 fromBundleURL:v7];
    }
  }

  return v10;
}

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"associatedItems", @"isBuiltInWorkoutType", @"isVoiceOnly", @"sequenceLabel", @"customization", 0);
}

- (id)verb
{
  return @"StartWorkout";
}

- (id)domain
{
  return @"Workouts";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  id v7 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  int v9 = [v7 goalValue];
  char v10 = INIntentSlotValueRedactedDoubleFromDouble(v9, a3);

  [v8 setGoalValue:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"workoutName";
  uint64_t v3 = [(INStartWorkoutIntent *)self workoutName];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v4;
  v17[1] = @"goalValue";
  v5 = [(INStartWorkoutIntent *)self goalValue];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v6;
  v17[2] = @"workoutGoalUnitType";
  INWorkoutGoalUnitType v7 = [(INStartWorkoutIntent *)self workoutGoalUnitType];
  if ((unint64_t)(v7 - 1) > 9) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E5518978[v7 - 1];
  }
  int v9 = v8;
  v18[2] = v9;
  v17[3] = @"workoutLocationType";
  INWorkoutLocationType v10 = [(INStartWorkoutIntent *)self workoutLocationType];
  id v11 = @"unknown";
  if (v10 == INWorkoutLocationTypeIndoor) {
    id v11 = @"indoor";
  }
  if (v10 == INWorkoutLocationTypeOutdoor) {
    id v11 = @"outdoor";
  }
  double v12 = v11;
  v18[3] = v12;
  v17[4] = @"isOpenEnded";
  char v13 = [(INStartWorkoutIntent *)self isOpenEnded];
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[4] = v14;
  int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  if (!v13) {

  }
  if (!v5) {
  if (!v3)
  }

  return v15;
}

- (void)setCustomization:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartWorkoutIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToWorkoutCustomization(v4);

  [v6 setCustomization:v5];
}

- (INWorkoutCustomization)customization
{
  v2 = [(INStartWorkoutIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 customization];
  id v4 = INIntentSlotValueTransformFromWorkoutCustomization(v3);

  return (INWorkoutCustomization *)v4;
}

- (void)setSequenceLabel:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasSequenceLabel:0];
  }
  else {
    [v5 setSequenceLabel:v4];
  }
}

- (int64_t)sequenceLabel
{
  unsigned int v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  int v4 = [v3 hasSequenceLabel];
  v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  int v6 = [v5 sequenceLabel];
  uint64_t v7 = 2 * (v6 == 1);
  if (!v6) {
    uint64_t v7 = 1;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setIsVoiceOnly:(id)a3
{
  id v5 = a3;
  int v4 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsVoiceOnly:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsVoiceOnly:0];
  }
}

- (NSNumber)isVoiceOnly
{
  unsigned int v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if ([v3 hasIsVoiceOnly])
  {
    int v4 = NSNumber;
    id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isVoiceOnly"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setIsBuiltInWorkoutType:(id)a3
{
  id v5 = a3;
  int v4 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsBuiltInWorkoutType:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsBuiltInWorkoutType:0];
  }
}

- (NSNumber)isBuiltInWorkoutType
{
  unsigned int v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if ([v3 hasIsBuiltInWorkoutType])
  {
    int v4 = NSNumber;
    id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
    int v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isBuiltInWorkoutType"));
  }
  else
  {
    int v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setAssociatedItems:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToWorkoutAssociatedItems(v4);

  [v6 setAssociatedItems:v5];
}

- (NSArray)associatedItems
{
  v2 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 associatedItems];
  id v4 = INIntentSlotValueTransformFromWorkoutAssociatedItems(v3);

  return (NSArray *)v4;
}

- (void)setIsOpenEnded:(id)a3
{
  id v5 = a3;
  id v4 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setIsOpenEnded:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasIsOpenEnded:0];
  }
}

- (NSNumber)isOpenEnded
{
  unsigned int v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  if ([v3 hasIsOpenEnded])
  {
    id v4 = NSNumber;
    id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "isOpenEnded"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setWorkoutLocationType:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3 == 2) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasWorkoutLocationType:0];
  }
  else {
    [v5 setWorkoutLocationType:v4];
  }
}

- (INWorkoutLocationType)workoutLocationType
{
  unsigned int v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  int v4 = [v3 hasWorkoutLocationType];
  id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  int v6 = [v5 workoutLocationType];
  uint64_t v7 = 2 * (v6 == 1);
  if (!v6) {
    uint64_t v7 = 1;
  }
  if (v4) {
    INWorkoutLocationType v8 = v7;
  }
  else {
    INWorkoutLocationType v8 = INWorkoutLocationTypeUnknown;
  }

  return v8;
}

- (void)setWorkoutGoalUnitType:(int64_t)a3
{
  unint64_t v3 = a3 - 1;
  int v4 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3 > 9) {
    [v4 setHasWorkoutGoalUnitType:0];
  }
  else {
    [v4 setWorkoutGoalUnitType:v3];
  }
}

- (INWorkoutGoalUnitType)workoutGoalUnitType
{
  unint64_t v3 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unsigned __int8 v4 = [v3 hasWorkoutGoalUnitType];
  id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unsigned int v6 = [v5 workoutGoalUnitType];
  if (((v6 < 0xA) & v4) != 0) {
    INWorkoutGoalUnitType v7 = v6 + 1;
  }
  else {
    INWorkoutGoalUnitType v7 = INWorkoutGoalUnitTypeUnknown;
  }

  return v7;
}

- (void)setGoalValue:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDouble(v4);

  [v6 setGoalValue:v5];
}

- (NSNumber)goalValue
{
  v2 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 goalValue];
  id v4 = INIntentSlotValueTransformFromDouble(v3);

  return (NSNumber *)v4;
}

- (void)setWorkoutName:(id)a3
{
  id v4 = a3;
  id v6 = [(INStartWorkoutIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setWorkoutName:v5];
}

- (INSpeakableString)workoutName
{
  v2 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 workoutName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INStartWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName goalValue:(NSNumber *)goalValue workoutGoalUnitType:(INWorkoutGoalUnitType)workoutGoalUnitType workoutLocationType:(INWorkoutLocationType)workoutLocationType isOpenEnded:(NSNumber *)isOpenEnded
{
  double v12 = workoutName;
  char v13 = goalValue;
  uint64_t v14 = isOpenEnded;
  v18.receiver = self;
  v18.super_class = (Class)INStartWorkoutIntent;
  int v15 = [(INIntent *)&v18 init];
  int v16 = v15;
  if (v15)
  {
    [(INStartWorkoutIntent *)v15 setWorkoutName:v12];
    [(INStartWorkoutIntent *)v16 setGoalValue:v13];
    [(INStartWorkoutIntent *)v16 setWorkoutGoalUnitType:workoutGoalUnitType];
    [(INStartWorkoutIntent *)v16 setWorkoutLocationType:workoutLocationType];
    [(INStartWorkoutIntent *)v16 setIsOpenEnded:v14];
  }

  return v16;
}

- (id)_categoryVerb
{
  return @"Start";
}

- (int64_t)_intentCategory
{
  return 6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INStartWorkoutIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INStartWorkoutIntent *)self _typedBackingStore];
  unint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v3 = v2;
  }
  else {
    unint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling
{
  return 1;
}

@end