@interface INResetTimerIntent
+ (BOOL)supportsSecureCoding;
- (INResetTimerIntent)initWithTargetTimer:(id)a3 resetMultiple:(id)a4;
- (INTimer)targetTimer;
- (NSNumber)resetMultiple;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setResetMultiple:(id)a3;
- (void)setTargetTimer:(id)a3;
@end

@implementation INResetTimerIntent

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INResetTimerIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)verb
{
  return @"ResetTimer";
}

- (id)domain
{
  return @"Timers";
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetTimer";
  v3 = [(INResetTimerIntent *)self targetTimer];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"resetMultiple";
  v10[0] = v4;
  v5 = [(INResetTimerIntent *)self resetMultiple];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (!v5) {

  }
  if (!v3) {

  }
  return v7;
}

- (void)setResetMultiple:(id)a3
{
  id v5 = a3;
  v4 = [(INResetTimerIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setResetMultiple:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasResetMultiple:0];
  }
}

- (NSNumber)resetMultiple
{
  v3 = [(INResetTimerIntent *)self _typedBackingStore];
  if ([v3 hasResetMultiple])
  {
    v4 = NSNumber;
    id v5 = [(INResetTimerIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "resetMultiple"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setTargetTimer:(id)a3
{
  id v4 = a3;
  id v6 = [(INResetTimerIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTimer(v4);

  [v6 setTargetTimer:v5];
}

- (INTimer)targetTimer
{
  v2 = [(INResetTimerIntent *)self _typedBackingStore];
  v3 = [v2 targetTimer];
  id v4 = INIntentSlotValueTransformFromTimer(v3);

  return (INTimer *)v4;
}

- (INResetTimerIntent)initWithTargetTimer:(id)a3 resetMultiple:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResetTimerIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INResetTimerIntent *)v8 setTargetTimer:v6];
    [(INResetTimerIntent *)v9 setResetMultiple:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INResetTimerIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INResetTimerIntent *)self _typedBackingStore];
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