@interface INSnoozeTasksIntent
+ (BOOL)supportsSecureCoding;
- (INDateComponentsRange)nextTriggerTime;
- (INSnoozeTasksIntent)initWithTasks:(NSArray *)tasks nextTriggerTime:(INDateComponentsRange *)nextTriggerTime all:(NSNumber *)all;
- (NSArray)tasks;
- (NSNumber)all;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setAll:(id)a3;
- (void)setNextTriggerTime:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation INSnoozeTasksIntent

- (id)verb
{
  return @"SnoozeTasks";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 nextTriggerTime];
  v10 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v9, a3);

  [v8 setNextTriggerTime:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"tasks";
  v3 = [(INSnoozeTasksIntent *)self tasks];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"nextTriggerTime";
  v5 = [(INSnoozeTasksIntent *)self nextTriggerTime];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"all";
  v7 = [(INSnoozeTasksIntent *)self all];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  if (!v5) {
  if (!v3)
  }

  return v9;
}

- (void)setAll:(id)a3
{
  id v5 = a3;
  v4 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setAll:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasAll:0];
  }
}

- (NSNumber)all
{
  v3 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  if ([v3 hasAll])
  {
    v4 = NSNumber;
    id v5 = [(INSnoozeTasksIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "all"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setNextTriggerTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setNextTriggerTime:v5];
}

- (INDateComponentsRange)nextTriggerTime
{
  v2 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  v3 = [v2 nextTriggerTime];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setTasks:(id)a3
{
  id v4 = a3;
  id v6 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTasks(v4);

  [v6 setTasks:v5];
}

- (NSArray)tasks
{
  v2 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  v3 = [v2 tasks];
  id v4 = INIntentSlotValueTransformFromTasks(v3);

  return (NSArray *)v4;
}

- (INSnoozeTasksIntent)initWithTasks:(NSArray *)tasks nextTriggerTime:(INDateComponentsRange *)nextTriggerTime all:(NSNumber *)all
{
  v8 = tasks;
  v9 = nextTriggerTime;
  v10 = all;
  v14.receiver = self;
  v14.super_class = (Class)INSnoozeTasksIntent;
  id v11 = [(INIntent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(INSnoozeTasksIntent *)v11 setTasks:v8];
    [(INSnoozeTasksIntent *)v12 setNextTriggerTime:v9];
    [(INSnoozeTasksIntent *)v12 setAll:v10];
  }

  return v12;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSnoozeTasksIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSnoozeTasksIntent *)self _typedBackingStore];
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