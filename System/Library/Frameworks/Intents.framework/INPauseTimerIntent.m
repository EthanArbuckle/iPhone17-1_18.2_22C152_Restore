@interface INPauseTimerIntent
+ (BOOL)supportsSecureCoding;
- (INPauseTimerIntent)initWithTargetTimer:(id)a3 pauseMultiple:(id)a4;
- (INTimer)targetTimer;
- (NSNumber)pauseMultiple;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setPauseMultiple:(id)a3;
- (void)setTargetTimer:(id)a3;
@end

@implementation INPauseTimerIntent

- (id)verb
{
  return @"PauseTimer";
}

- (id)domain
{
  return @"Timers";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INPauseTimerIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetTimer";
  v3 = [(INPauseTimerIntent *)self targetTimer];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"pauseMultiple";
  v10[0] = v4;
  v5 = [(INPauseTimerIntent *)self pauseMultiple];
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

- (void)setPauseMultiple:(id)a3
{
  id v5 = a3;
  v4 = [(INPauseTimerIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setPauseMultiple:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasPauseMultiple:0];
  }
}

- (NSNumber)pauseMultiple
{
  v3 = [(INPauseTimerIntent *)self _typedBackingStore];
  if ([v3 hasPauseMultiple])
  {
    v4 = NSNumber;
    id v5 = [(INPauseTimerIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "pauseMultiple"));
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
  id v6 = [(INPauseTimerIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTimer(v4);

  [v6 setTargetTimer:v5];
}

- (INTimer)targetTimer
{
  v2 = [(INPauseTimerIntent *)self _typedBackingStore];
  v3 = [v2 targetTimer];
  id v4 = INIntentSlotValueTransformFromTimer(v3);

  return (INTimer *)v4;
}

- (INPauseTimerIntent)initWithTargetTimer:(id)a3 pauseMultiple:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INPauseTimerIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INPauseTimerIntent *)v8 setTargetTimer:v6];
    [(INPauseTimerIntent *)v9 setPauseMultiple:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INPauseTimerIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INPauseTimerIntent *)self _typedBackingStore];
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