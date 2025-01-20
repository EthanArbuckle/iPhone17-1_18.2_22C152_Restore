@interface INAddTasksIntent
+ (BOOL)supportsSecureCoding;
- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger;
- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger priority:(INTaskPriority)priority;
- (INContactEventTrigger)contactEventTrigger;
- (INIntent)intent;
- (INSpatialEventTrigger)spatialEventTrigger;
- (INTaskList)targetTaskList;
- (INTaskPriority)priority;
- (INTemporalEventTrigger)temporalEventTrigger;
- (NSArray)contactEventTriggers;
- (NSArray)targetTaskListMembers;
- (NSArray)taskTitles;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_redactedDictionaryRepresentation;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (int64_t)taskReference;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContactEventTrigger:(id)a3;
- (void)setContactEventTriggers:(id)a3;
- (void)setIntent:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSpatialEventTrigger:(id)a3;
- (void)setTargetTaskList:(id)a3;
- (void)setTargetTaskListMembers:(id)a3;
- (void)setTaskReference:(int64_t)a3;
- (void)setTaskTitles:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
@end

@implementation INAddTasksIntent

- (void)setContactEventTriggers:(id)a3
{
  id v4 = [a3 firstObject];
  [(INAddTasksIntent *)self setContactEventTrigger:v4];
}

- (NSArray)contactEventTriggers
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(INAddTasksIntent *)self contactEventTrigger];

  if (v3)
  {
    id v4 = [(INAddTasksIntent *)self contactEventTrigger];
    v7[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (id)verb
{
  return @"AddTasks";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v16[0] = @"targetTaskList";
  v3 = [(INAddTasksIntent *)self targetTaskList];
  id v4 = v3;
  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v4;
  v16[1] = @"taskTitles";
  v5 = [(INAddTasksIntent *)self taskTitles];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v6;
  v16[2] = @"spatialEventTrigger";
  v7 = [(INAddTasksIntent *)self spatialEventTrigger];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v8;
  v16[3] = @"temporalEventTrigger";
  v9 = [(INAddTasksIntent *)self temporalEventTrigger];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v10;
  v16[4] = @"priority";
  INTaskPriority v11 = [(INAddTasksIntent *)self priority];
  v12 = @"unknown";
  if (v11 == INTaskPriorityFlagged) {
    v12 = @"flagged";
  }
  if (v11 == INTaskPriorityNotFlagged) {
    v12 = @"notFlagged";
  }
  v13 = v12;
  v17[4] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];

  if (!v9) {
  if (!v7)
  }

  if (!v5) {
  if (!v3)
  }

  return v14;
}

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INAddTasksIntent *)self _dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"taskTitles"];

  return v3;
}

- (void)setIntent:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToIntent(v4);

  [v6 setIntent:v5];
}

- (INIntent)intent
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 intent];
  id v4 = INIntentSlotValueTransformFromIntent(v3);

  return (INIntent *)v4;
}

- (void)setContactEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToContactEventTrigger(v4);

  [v6 setContactEventTrigger:v5];
}

- (INContactEventTrigger)contactEventTrigger
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 contactEventTrigger];
  id v4 = INIntentSlotValueTransformFromContactEventTrigger(v3);

  return (INContactEventTrigger *)v4;
}

- (void)setPriority:(int64_t)a3
{
  id v4 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 2) {
    [v4 setHasPriority:0];
  }
  else {
    [v4 setPriority:a3];
  }
}

- (INTaskPriority)priority
{
  v3 = [(INAddTasksIntent *)self _typedBackingStore];
  int v4 = [v3 hasPriority];
  id v5 = [(INAddTasksIntent *)self _typedBackingStore];
  int v6 = [v5 priority];
  uint64_t v7 = v6 == 1;
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  if (v4) {
    INTaskPriority v8 = v7;
  }
  else {
    INTaskPriority v8 = INTaskPriorityUnknown;
  }

  return v8;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setSpatialEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToSpatialEventTrigger(v4);

  [v6 setSpatialEventTrigger:v5];
}

- (INSpatialEventTrigger)spatialEventTrigger
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 spatialEventTrigger];
  id v4 = INIntentSlotValueTransformFromSpatialEventTrigger(v3);

  return (INSpatialEventTrigger *)v4;
}

- (void)setTaskTitles:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataStrings(v4);

  [v6 setTaskTitles:v5];
}

- (NSArray)taskTitles
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 taskTitles];
  id v4 = INIntentSlotValueTransformFromDataStrings(v3);

  return (NSArray *)v4;
}

- (void)setTargetTaskList:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTaskList(v4);

  [v6 setTargetTaskList:v5];
}

- (INTaskList)targetTaskList
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 targetTaskList];
  id v4 = INIntentSlotValueTransformFromTaskList(v3);

  return (INTaskList *)v4;
}

- (void)setTargetTaskListMembers:(id)a3
{
  id v4 = a3;
  id v6 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToContacts(v4);

  [v6 setTargetTaskListMembers:v5];
}

- (NSArray)targetTaskListMembers
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
  v3 = [v2 targetTaskListMembers];
  id v4 = INIntentSlotValueTransformFromContacts(v3);

  return (NSArray *)v4;
}

- (void)setTaskReference:(int64_t)a3
{
  id v4 = [(INAddTasksIntent *)self _typedBackingStore];
  id v5 = v4;
  if (a3 == 1) {
    [v4 setTaskReference:0];
  }
  else {
    [v4 setHasTaskReference:0];
  }
}

- (int64_t)taskReference
{
  v3 = [(INAddTasksIntent *)self _typedBackingStore];
  LODWORD(v4) = [v3 hasTaskReference];
  id v5 = [(INAddTasksIntent *)self _typedBackingStore];
  if ([v5 taskReference]) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = v4;
  }

  return v4;
}

- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger priority:(INTaskPriority)priority
{
  v12 = targetTaskList;
  v13 = taskTitles;
  v14 = spatialEventTrigger;
  v15 = temporalEventTrigger;
  v19.receiver = self;
  v19.super_class = (Class)INAddTasksIntent;
  v16 = [(INIntent *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(INAddTasksIntent *)v16 setTargetTaskList:v12];
    [(INAddTasksIntent *)v17 setTaskTitles:v13];
    [(INAddTasksIntent *)v17 setSpatialEventTrigger:v14];
    [(INAddTasksIntent *)v17 setTemporalEventTrigger:v15];
    [(INAddTasksIntent *)v17 setPriority:priority];
  }

  return v17;
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
  id v5 = [(INAddTasksIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INAddTasksIntent *)self _typedBackingStore];
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

- (INAddTasksIntent)initWithTargetTaskList:(INTaskList *)targetTaskList taskTitles:(NSArray *)taskTitles spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  return [(INAddTasksIntent *)self initWithTargetTaskList:targetTaskList taskTitles:taskTitles spatialEventTrigger:spatialEventTrigger temporalEventTrigger:temporalEventTrigger priority:0];
}

@end