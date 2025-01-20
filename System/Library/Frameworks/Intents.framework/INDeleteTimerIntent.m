@interface INDeleteTimerIntent
+ (BOOL)supportsSecureCoding;
- (INDeleteTimerIntent)initWithTargetTimer:(id)a3 deleteMultiple:(id)a4;
- (INTimer)targetTimer;
- (NSNumber)deleteMultiple;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDeleteMultiple:(id)a3;
- (void)setTargetTimer:(id)a3;
@end

@implementation INDeleteTimerIntent

- (id)verb
{
  return @"DeleteTimer";
}

- (id)domain
{
  return @"Timers";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INDeleteTimerIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetTimer";
  v3 = [(INDeleteTimerIntent *)self targetTimer];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"deleteMultiple";
  v10[0] = v4;
  v5 = [(INDeleteTimerIntent *)self deleteMultiple];
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

- (void)setDeleteMultiple:(id)a3
{
  id v5 = a3;
  v4 = [(INDeleteTimerIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setDeleteMultiple:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasDeleteMultiple:0];
  }
}

- (NSNumber)deleteMultiple
{
  v3 = [(INDeleteTimerIntent *)self _typedBackingStore];
  if ([v3 hasDeleteMultiple])
  {
    v4 = NSNumber;
    id v5 = [(INDeleteTimerIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "deleteMultiple"));
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
  id v6 = [(INDeleteTimerIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTimer(v4);

  [v6 setTargetTimer:v5];
}

- (INTimer)targetTimer
{
  v2 = [(INDeleteTimerIntent *)self _typedBackingStore];
  v3 = [v2 targetTimer];
  id v4 = INIntentSlotValueTransformFromTimer(v3);

  return (INTimer *)v4;
}

- (INDeleteTimerIntent)initWithTargetTimer:(id)a3 deleteMultiple:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INDeleteTimerIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INDeleteTimerIntent *)v8 setTargetTimer:v6];
    [(INDeleteTimerIntent *)v9 setDeleteMultiple:v7];
  }

  return v9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteTimerIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteTimerIntent *)self _typedBackingStore];
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