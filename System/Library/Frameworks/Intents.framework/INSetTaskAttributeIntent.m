@interface INSetTaskAttributeIntent
+ (BOOL)supportsSecureCoding;
- (INContactEventTrigger)contactEventTrigger;
- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask status:(INTaskStatus)status spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger;
- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask taskTitle:(INSpeakableString *)taskTitle status:(INTaskStatus)status priority:(INTaskPriority)priority spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger;
- (INSpatialEventTrigger)spatialEventTrigger;
- (INSpeakableString)taskTitle;
- (INTask)targetTask;
- (INTaskPriority)priority;
- (INTaskStatus)status;
- (INTemporalEventTrigger)temporalEventTrigger;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContactEventTrigger:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSpatialEventTrigger:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTargetTask:(id)a3;
- (void)setTaskTitle:(id)a3;
- (void)setTemporalEventTrigger:(id)a3;
@end

@implementation INSetTaskAttributeIntent

- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask status:(INTaskStatus)status spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  return [(INSetTaskAttributeIntent *)self initWithTargetTask:targetTask taskTitle:0 status:status priority:0 spatialEventTrigger:spatialEventTrigger temporalEventTrigger:temporalEventTrigger];
}

- (id)verb
{
  return @"SetTaskAttribute";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"targetTask";
  uint64_t v3 = [(INSetTaskAttributeIntent *)self targetTask];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[0] = v3;
  v20[1] = @"taskTitle";
  v5 = [(INSetTaskAttributeIntent *)self taskTitle];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v6;
  v20[2] = @"status";
  INTaskStatus v7 = [(INSetTaskAttributeIntent *)self status];
  v8 = @"unknown";
  if (v7 == INTaskStatusCompleted) {
    v8 = @"completed";
  }
  if (v7 == INTaskStatusNotCompleted) {
    v8 = @"notCompleted";
  }
  v9 = v8;
  v21[2] = v9;
  v20[3] = @"priority";
  INTaskPriority v10 = [(INSetTaskAttributeIntent *)self priority];
  v11 = @"unknown";
  if (v10 == INTaskPriorityFlagged) {
    v11 = @"flagged";
  }
  if (v10 == INTaskPriorityNotFlagged) {
    v11 = @"notFlagged";
  }
  v12 = v11;
  v21[3] = v12;
  v20[4] = @"spatialEventTrigger";
  v13 = [(INSetTaskAttributeIntent *)self spatialEventTrigger];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v14;
  v20[5] = @"temporalEventTrigger";
  v15 = [(INSetTaskAttributeIntent *)self temporalEventTrigger];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[5] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  if (!v15) {

  }
  if (!v13) {
  if (!v5)
  }

  if (!v4) {

  }
  return v17;
}

- (void)setContactEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToContactEventTrigger(v4);

  [v6 setContactEventTrigger:v5];
}

- (INContactEventTrigger)contactEventTrigger
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 contactEventTrigger];
  id v4 = INIntentSlotValueTransformFromContactEventTrigger(v3);

  return (INContactEventTrigger *)v4;
}

- (void)setTemporalEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToTemporalEventTrigger(v4);

  [v6 setTemporalEventTrigger:v5];
}

- (INTemporalEventTrigger)temporalEventTrigger
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 temporalEventTrigger];
  id v4 = INIntentSlotValueTransformFromTemporalEventTrigger(v3);

  return (INTemporalEventTrigger *)v4;
}

- (void)setSpatialEventTrigger:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToSpatialEventTrigger(v4);

  [v6 setSpatialEventTrigger:v5];
}

- (INSpatialEventTrigger)spatialEventTrigger
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 spatialEventTrigger];
  id v4 = INIntentSlotValueTransformFromSpatialEventTrigger(v3);

  return (INSpatialEventTrigger *)v4;
}

- (void)setPriority:(int64_t)a3
{
  id v4 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
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
  uint64_t v3 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  int v4 = [v3 hasPriority];
  id v5 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
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

- (void)setStatus:(int64_t)a3
{
  int v4 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 <= 2) {
    [v4 setStatus:(10 * a3)];
  }
  else {
    [v4 setHasStatus:0];
  }
}

- (INTaskStatus)status
{
  uint64_t v3 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  int v4 = [v3 hasStatus];
  id v5 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  int v6 = [v5 status];
  uint64_t v7 = v6 == 10;
  if (v6 == 20) {
    uint64_t v7 = 2;
  }
  if (v4) {
    INTaskStatus v8 = v7;
  }
  else {
    INTaskStatus v8 = INTaskStatusUnknown;
  }

  return v8;
}

- (void)setTaskTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setTaskTitle:v5];
}

- (INSpeakableString)taskTitle
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 taskTitle];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setTargetTask:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToTask(v4);

  [v6 setTargetTask:v5];
}

- (INTask)targetTask
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 targetTask];
  id v4 = INIntentSlotValueTransformFromTask(v3);

  return (INTask *)v4;
}

- (INSetTaskAttributeIntent)initWithTargetTask:(INTask *)targetTask taskTitle:(INSpeakableString *)taskTitle status:(INTaskStatus)status priority:(INTaskPriority)priority spatialEventTrigger:(INSpatialEventTrigger *)spatialEventTrigger temporalEventTrigger:(INTemporalEventTrigger *)temporalEventTrigger
{
  v14 = targetTask;
  v15 = taskTitle;
  v16 = spatialEventTrigger;
  v17 = temporalEventTrigger;
  v21.receiver = self;
  v21.super_class = (Class)INSetTaskAttributeIntent;
  v18 = [(INIntent *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(INSetTaskAttributeIntent *)v18 setTargetTask:v14];
    [(INSetTaskAttributeIntent *)v19 setTaskTitle:v15];
    [(INSetTaskAttributeIntent *)v19 setStatus:status];
    [(INSetTaskAttributeIntent *)v19 setPriority:priority];
    [(INSetTaskAttributeIntent *)v19 setSpatialEventTrigger:v16];
    [(INSetTaskAttributeIntent *)v19 setTemporalEventTrigger:v17];
  }

  return v19;
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
  id v5 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetTaskAttributeIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end