@interface INCreateTimerIntent
+ (BOOL)supportsSecureCoding;
- (INCreateTimerIntent)initWithLabel:(id)a3 duration:(double)a4 type:(int64_t)a5;
- (INSpeakableString)label;
- (double)duration;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)type;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDuration:(double)a3;
- (void)setLabel:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation INCreateTimerIntent

- (id)verb
{
  return @"CreateTimer";
}

- (id)domain
{
  return @"Timers";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INCreateTimerIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v13[0] = @"label";
  v3 = [(INCreateTimerIntent *)self label];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v4;
  v13[1] = @"duration";
  v5 = NSNumber;
  [(INCreateTimerIntent *)self duration];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = v6;
  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v7;
  v13[2] = @"type";
  int64_t v8 = [(INCreateTimerIntent *)self type];
  v9 = @"unknown";
  if (v8 == 2) {
    v9 = @"sleepTimer";
  }
  if (v8 == 1) {
    v9 = @"defaultType";
  }
  v10 = v9;
  v14[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  if (!v6) {
  if (!v3)
  }

  return v11;
}

- (void)setType:(int64_t)a3
{
  v4 = [(INCreateTimerIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 2) {
    [v4 setHasType:0];
  }
  else {
    [v4 setType:a3];
  }
}

- (int64_t)type
{
  v3 = [(INCreateTimerIntent *)self _typedBackingStore];
  int v4 = [v3 hasType];
  id v5 = [(INCreateTimerIntent *)self _typedBackingStore];
  int v6 = [v5 type];
  uint64_t v7 = v6 == 1;
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  if (v4) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }

  return v8;
}

- (void)setDuration:(double)a3
{
  int v4 = [(INCreateTimerIntent *)self _typedBackingStore];
  id v5 = v4;
  if (a3 == 0.0) {
    [v4 setHasDuration:0];
  }
  else {
    [v4 setDuration:a3];
  }
}

- (double)duration
{
  v3 = [(INCreateTimerIntent *)self _typedBackingStore];
  double v4 = 0.0;
  if ([v3 hasDuration])
  {
    id v5 = [(INCreateTimerIntent *)self _typedBackingStore];
    [v5 duration];
    double v4 = v6;
  }
  return v4;
}

- (void)setLabel:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateTimerIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setLabel:v5];
}

- (INSpeakableString)label
{
  v2 = [(INCreateTimerIntent *)self _typedBackingStore];
  v3 = [v2 label];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INCreateTimerIntent)initWithLabel:(id)a3 duration:(double)a4 type:(int64_t)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INCreateTimerIntent;
  v9 = [(INIntent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(INCreateTimerIntent *)v9 setLabel:v8];
    [(INCreateTimerIntent *)v10 setDuration:a4];
    [(INCreateTimerIntent *)v10 setType:a5];
  }

  return v10;
}

- (id)_categoryVerb
{
  return @"Create";
}

- (int64_t)_intentCategory
{
  return 8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INCreateTimerIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INCreateTimerIntent *)self _typedBackingStore];
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