@interface INSetTimerAttributeIntent
+ (BOOL)supportsSecureCoding;
- (INSetTimerAttributeIntent)initWithTargetTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5;
- (INSpeakableString)toLabel;
- (INTimer)targetTimer;
- (double)toDuration;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setTargetTimer:(id)a3;
- (void)setToDuration:(double)a3;
- (void)setToLabel:(id)a3;
@end

@implementation INSetTimerAttributeIntent

- (id)verb
{
  return @"SetTimerAttribute";
}

- (id)domain
{
  return @"Timers";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"targetTimer";
  v3 = [(INSetTimerAttributeIntent *)self targetTimer];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v4;
  v12[1] = @"toDuration";
  v5 = NSNumber;
  [(INSetTimerAttributeIntent *)self toDuration];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v7;
  v12[2] = @"toLabel";
  v8 = [(INSetTimerAttributeIntent *)self toLabel];
  v9 = v8;
  if (!v8)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (!v8) {

  }
  if (!v6) {
  if (!v3)
  }

  return v10;
}

- (void)setToLabel:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setToLabel:v5];
}

- (INSpeakableString)toLabel
{
  v2 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  v3 = [v2 toLabel];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setToDuration:(double)a3
{
  id v4 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  id v5 = v4;
  if (a3 == 0.0) {
    [v4 setHasToDuration:0];
  }
  else {
    [v4 setToDuration:a3];
  }
}

- (double)toDuration
{
  v3 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  double v4 = 0.0;
  if ([v3 hasToDuration])
  {
    id v5 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
    [v5 toDuration];
    double v4 = v6;
  }
  return v4;
}

- (void)setTargetTimer:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTimer(v4);

  [v6 setTargetTimer:v5];
}

- (INTimer)targetTimer
{
  v2 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  v3 = [v2 targetTimer];
  id v4 = INIntentSlotValueTransformFromTimer(v3);

  return (INTimer *)v4;
}

- (INSetTimerAttributeIntent)initWithTargetTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)INSetTimerAttributeIntent;
  v10 = [(INIntent *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(INSetTimerAttributeIntent *)v10 setTargetTimer:v8];
    [(INSetTimerAttributeIntent *)v11 setToDuration:a4];
    [(INSetTimerAttributeIntent *)v11 setToLabel:v9];
  }

  return v11;
}

- (id)_categoryVerb
{
  return @"Set";
}

- (int64_t)_intentCategory
{
  return 16;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetTimerAttributeIntent *)self _typedBackingStore];
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

@end