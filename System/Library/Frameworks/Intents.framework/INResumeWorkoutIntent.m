@interface INResumeWorkoutIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)_intents_isExemptFromMulitWindowRequirementForInAppHandling;
- (INResumeWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName;
- (INSpeakableString)workoutName;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setWorkoutName:(id)a3;
@end

@implementation INResumeWorkoutIntent

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 facadePropertyName];
  int v9 = [v8 isEqualToString:@"workoutName"];

  if (v9)
  {
    v10 = [(INResumeWorkoutIntent *)self workoutName];
    v11 = [v10 spokenPhrase];

    if ([v11 hasPrefix:@"com.apple.intents.WorkoutNameIdentifier."])
    {
      v12 = [v11 substringFromIndex:objc_msgSend(@"com.apple.intents.WorkoutNameIdentifier.", "length")];
      v13 = INLocalizedStringWithLocalizer(v11, v12, v7);

      goto LABEL_6;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)INResumeWorkoutIntent;
  v13 = [(INIntent *)&v15 localizeValueOfSlotDescription:v6 withLocalizer:v7];
LABEL_6:

  return v13;
}

- (id)verb
{
  return @"ResumeWorkout";
}

- (id)domain
{
  return @"Workouts";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INResumeWorkoutIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"workoutName";
  v2 = [(INResumeWorkoutIntent *)self workoutName];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setWorkoutName:(id)a3
{
  id v4 = a3;
  id v6 = [(INResumeWorkoutIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setWorkoutName:v5];
}

- (INSpeakableString)workoutName
{
  v2 = [(INResumeWorkoutIntent *)self _typedBackingStore];
  v3 = [v2 workoutName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INResumeWorkoutIntent)initWithWorkoutName:(INSpeakableString *)workoutName
{
  id v4 = workoutName;
  v8.receiver = self;
  v8.super_class = (Class)INResumeWorkoutIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INResumeWorkoutIntent *)v5 setWorkoutName:v4];
  }

  return v6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INResumeWorkoutIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INResumeWorkoutIntent *)self _typedBackingStore];
  v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
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