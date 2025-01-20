@interface INDeleteTasksIntent
+ (BOOL)supportsSecureCoding;
- (INDeleteTasksIntent)initWithTaskList:(INTaskList *)taskList tasks:(NSArray *)tasks all:(NSNumber *)all;
- (INTaskList)taskList;
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
- (void)setTaskList:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation INDeleteTasksIntent

- (id)verb
{
  return @"DeleteTasks";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INDeleteTasksIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"taskList";
  v3 = [(INDeleteTasksIntent *)self taskList];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"tasks";
  v5 = [(INDeleteTasksIntent *)self tasks];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"all";
  v7 = [(INDeleteTasksIntent *)self all];
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
  v4 = [(INDeleteTasksIntent *)self _typedBackingStore];
  if (v5) {
    objc_msgSend(v4, "setAll:", objc_msgSend(v5, "BOOLValue"));
  }
  else {
    [v4 setHasAll:0];
  }
}

- (NSNumber)all
{
  v3 = [(INDeleteTasksIntent *)self _typedBackingStore];
  if ([v3 hasAll])
  {
    v4 = NSNumber;
    id v5 = [(INDeleteTasksIntent *)self _typedBackingStore];
    id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "all"));
  }
  else
  {
    id v6 = 0;
  }

  return (NSNumber *)v6;
}

- (void)setTasks:(id)a3
{
  id v4 = a3;
  id v6 = [(INDeleteTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTasks(v4);

  [v6 setTasks:v5];
}

- (NSArray)tasks
{
  v2 = [(INDeleteTasksIntent *)self _typedBackingStore];
  v3 = [v2 tasks];
  id v4 = INIntentSlotValueTransformFromTasks(v3);

  return (NSArray *)v4;
}

- (void)setTaskList:(id)a3
{
  id v4 = a3;
  id v6 = [(INDeleteTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTaskList(v4);

  [v6 setTaskList:v5];
}

- (INTaskList)taskList
{
  v2 = [(INDeleteTasksIntent *)self _typedBackingStore];
  v3 = [v2 taskList];
  id v4 = INIntentSlotValueTransformFromTaskList(v3);

  return (INTaskList *)v4;
}

- (INDeleteTasksIntent)initWithTaskList:(INTaskList *)taskList tasks:(NSArray *)tasks all:(NSNumber *)all
{
  v8 = taskList;
  v9 = tasks;
  v10 = all;
  v14.receiver = self;
  v14.super_class = (Class)INDeleteTasksIntent;
  v11 = [(INIntent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(INDeleteTasksIntent *)v11 setTaskList:v8];
    [(INDeleteTasksIntent *)v12 setTasks:v9];
    [(INDeleteTasksIntent *)v12 setAll:v10];
  }

  return v12;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteTasksIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteTasksIntent *)self _typedBackingStore];
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