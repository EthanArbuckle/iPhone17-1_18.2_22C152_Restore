@interface INSearchForNotebookItemsIntent
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAllNoteContents;
- (CLPlacemark)location;
- (INDateComponentsRange)dateTime;
- (INDateSearchType)dateSearchType;
- (INLocationSearchType)locationSearchType;
- (INNotebookItemType)itemType;
- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType;
- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType notebookItemIdentifier:(NSString *)notebookItemIdentifier;
- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType temporalEventTriggerTypes:(INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes taskPriority:(INTaskPriority)taskPriority notebookItemIdentifier:(NSString *)notebookItemIdentifier;
- (INSpeakableString)groupName;
- (INSpeakableString)title;
- (INTaskPriority)taskPriority;
- (INTaskStatus)status;
- (INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes;
- (NSString)content;
- (NSString)notebookItemIdentifier;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContent:(id)a3;
- (void)setDateSearchType:(int64_t)a3;
- (void)setDateTime:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setIncludeAllNoteContents:(BOOL)a3;
- (void)setItemType:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setLocationSearchType:(int64_t)a3;
- (void)setNotebookItemIdentifier:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTaskPriority:(int64_t)a3;
- (void)setTemporalEventTriggerTypes:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation INSearchForNotebookItemsIntent

- (id)verb
{
  return @"SearchForNotebookItems";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 location];
  v10 = INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  [v8 setLocation:v10];

  v11 = [v7 dateTime];
  v12 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v11, a3);

  [v8 setDateTime:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v38[11] = *MEMORY[0x1E4F143B8];
  v37[0] = @"title";
  uint64_t v3 = [(INSearchForNotebookItemsIntent *)self title];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v3;
  v38[0] = v3;
  v37[1] = @"content";
  uint64_t v5 = [(INSearchForNotebookItemsIntent *)self content];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v30 = (void *)v5;
  v38[1] = v5;
  v37[2] = @"itemType";
  INNotebookItemType v7 = [(INSearchForNotebookItemsIntent *)self itemType];
  if ((unint64_t)(v7 - 1) > 2) {
    v8 = @"unknown";
  }
  else {
    v8 = off_1E5516478[v7 - 1];
  }
  v35 = v6;
  v34 = v8;
  v38[2] = v34;
  v37[3] = @"status";
  INTaskStatus v9 = [(INSearchForNotebookItemsIntent *)self status];
  v10 = @"unknown";
  if (v9 == INTaskStatusCompleted) {
    v10 = @"completed";
  }
  if (v9 == INTaskStatusNotCompleted) {
    v10 = @"notCompleted";
  }
  v33 = v10;
  v38[3] = v33;
  v37[4] = @"location";
  uint64_t v11 = [(INSearchForNotebookItemsIntent *)self location];
  v12 = (void *)v11;
  if (!v11)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[4] = v11;
  v37[5] = @"locationSearchType";
  INLocationSearchType v13 = [(INSearchForNotebookItemsIntent *)self locationSearchType];
  v14 = @"unknown";
  if (v13 == INLocationSearchTypeByLocationTrigger) {
    v14 = @"byLocationTrigger";
  }
  v32 = v14;
  v38[5] = v32;
  v37[6] = @"dateTime";
  v15 = [(INSearchForNotebookItemsIntent *)self dateTime];
  v16 = v15;
  if (!v15)
  {
    v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[6] = v16;
  v37[7] = @"dateSearchType";
  INDateSearchType v17 = [(INSearchForNotebookItemsIntent *)self dateSearchType];
  if ((unint64_t)(v17 - 1) > 2) {
    v18 = @"unknown";
  }
  else {
    v18 = off_1E5518D48[v17 - 1];
  }
  v36 = v4;
  v19 = v18;
  v38[7] = v19;
  v37[8] = @"temporalEventTriggerTypes";
  v20 = INTemporalEventTriggerTypeOptionsGetNames([(INSearchForNotebookItemsIntent *)self temporalEventTriggerTypes]);
  v21 = v20;
  if (!v20)
  {
    v21 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[8] = v21;
  v37[9] = @"taskPriority";
  INTaskPriority v22 = [(INSearchForNotebookItemsIntent *)self taskPriority];
  v23 = @"unknown";
  if (v22 == INTaskPriorityFlagged) {
    v23 = @"flagged";
  }
  if (v22 == INTaskPriorityNotFlagged) {
    v23 = @"notFlagged";
  }
  v24 = v23;
  v38[9] = v24;
  v37[10] = @"notebookItemIdentifier";
  v25 = [(INSearchForNotebookItemsIntent *)self notebookItemIdentifier];
  v26 = v25;
  if (!v25)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v38[10] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:11];
  if (!v25) {

  }
  if (!v20) {
  if (!v15)
  }

  if (!v12) {
  if (!v35)
  }

  if (!v36) {

  }
  return v27;
}

- (void)setNotebookItemIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  [v5 setNotebookItemIdentifier:v4];
}

- (NSString)notebookItemIdentifier
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 notebookItemIdentifier];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setIncludeAllNoteContents:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = v4;
  if (v3) {
    [v4 setIncludeAllNoteContents:1];
  }
  else {
    [v4 setHasIncludeAllNoteContents:0];
  }
}

- (BOOL)includeAllNoteContents
{
  BOOL v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  if ([v3 hasIncludeAllNoteContents])
  {
    id v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
    char v5 = [v4 includeAllNoteContents];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  char v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setGroupName:v5];
}

- (INSpeakableString)groupName
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  BOOL v3 = [v2 groupName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setTaskPriority:(int64_t)a3
{
  id v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 > 2) {
    [v4 setHasTaskPriority:0];
  }
  else {
    [v4 setTaskPriority:a3];
  }
}

- (INTaskPriority)taskPriority
{
  BOOL v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v4 = [v3 hasTaskPriority];
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v6 = [v5 taskPriority];
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

- (void)setTemporalEventTriggerTypes:(unint64_t)a3
{
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  [v5 clearTemporalEventTriggerTypes];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__INSearchForNotebookItemsIntent_setTemporalEventTriggerTypes___block_invoke;
  v6[3] = &unk_1E5520C28;
  v6[4] = self;
  INTemporalEventTriggerTypeOptionsEnumerateBackingTypes(a3, v6);
}

void __63__INSearchForNotebookItemsIntent_setTemporalEventTriggerTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _typedBackingStore];
  [v3 addTemporalEventTriggerType:a2];
}

- (INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes
{
  id v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  uint64_t v4 = [v3 temporalEventTriggerTypesCount];

  INTemporalEventTriggerTypeOptions v5 = 0;
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v7 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
      int v8 = [v7 temporalEventTriggerTypeAtIndex:i];
      uint64_t v9 = v5 | 2;
      uint64_t v10 = v5 | 1;
      if (v8 != 1) {
        uint64_t v10 = v5;
      }
      if (v8 != 2) {
        uint64_t v9 = v10;
      }
      if (v8 == 3) {
        v5 |= 4uLL;
      }
      else {
        INTemporalEventTriggerTypeOptions v5 = v9;
      }
    }
  }
  return v5;
}

- (void)setDateSearchType:(int64_t)a3
{
  uint64_t v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 <= 3) {
    [v4 setDateSearchType:(10 * a3)];
  }
  else {
    [v4 setHasDateSearchType:0];
  }
}

- (INDateSearchType)dateSearchType
{
  id v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v4 = [v3 hasDateSearchType];
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v6 = [v5 dateSearchType];
  uint64_t v7 = 3;
  uint64_t v8 = 2;
  if (v6 != 20) {
    uint64_t v8 = v6 == 10;
  }
  if (v6 != 30) {
    uint64_t v7 = v8;
  }
  if (v4) {
    INDateSearchType v9 = v7;
  }
  else {
    INDateSearchType v9 = INDateSearchTypeUnknown;
  }

  return v9;
}

- (void)setDateTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setDateTime:v5];
}

- (INDateComponentsRange)dateTime
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v3 = [v2 dateTime];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setLocationSearchType:(int64_t)a3
{
  if (a3 == 1) {
    unsigned int v3 = 10;
  }
  else {
    unsigned int v3 = 0x7FFFFFFF;
  }
  if (a3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v6 = v5;
  if (v4 == 0x7FFFFFFF) {
    [v5 setHasLocationSearchType:0];
  }
  else {
    [v5 setLocationSearchType:v4];
  }
}

- (INLocationSearchType)locationSearchType
{
  unsigned int v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  LODWORD(v4) = [v3 hasLocationSearchType];
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  if ([v5 locationSearchType] == 10) {
    INLocationSearchType v4 = (unint64_t)v4;
  }
  else {
    INLocationSearchType v4 = INLocationSearchTypeUnknown;
  }

  return v4;
}

- (void)setLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setLocation:v5];
}

- (CLPlacemark)location
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 location];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setStatus:(int64_t)a3
{
  id v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
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
  unsigned int v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v4 = [v3 hasStatus];
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
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

- (void)setItemType:(int64_t)a3
{
  int v4 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = v4;
  if ((unint64_t)a3 <= 3) {
    [v4 setItemType:(10 * a3)];
  }
  else {
    [v4 setHasItemType:0];
  }
}

- (INNotebookItemType)itemType
{
  unsigned int v3 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v4 = [v3 hasItemType];
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  int v6 = [v5 itemType];
  uint64_t v7 = 3;
  uint64_t v8 = 2;
  if (v6 != 20) {
    uint64_t v8 = v6 == 10;
  }
  if (v6 != 30) {
    uint64_t v7 = v8;
  }
  if (v4) {
    INNotebookItemType v9 = v7;
  }
  else {
    INNotebookItemType v9 = INNotebookItemTypeUnknown;
  }

  return v9;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  [v5 setContent:v4];
}

- (NSString)content
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 content];
  id v4 = (void *)[v3 copy];

  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  id v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setTitle:v5];
}

- (INSpeakableString)title
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 title];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType temporalEventTriggerTypes:(INTemporalEventTriggerTypeOptions)temporalEventTriggerTypes taskPriority:(INTaskPriority)taskPriority notebookItemIdentifier:(NSString *)notebookItemIdentifier
{
  v26 = title;
  v19 = content;
  v20 = location;
  v21 = dateTime;
  INTaskPriority v22 = notebookItemIdentifier;
  v27.receiver = self;
  v27.super_class = (Class)INSearchForNotebookItemsIntent;
  v23 = [(INIntent *)&v27 init];
  v24 = v23;
  if (v23)
  {
    [(INSearchForNotebookItemsIntent *)v23 setTitle:v26];
    [(INSearchForNotebookItemsIntent *)v24 setContent:v19];
    [(INSearchForNotebookItemsIntent *)v24 setItemType:itemType];
    [(INSearchForNotebookItemsIntent *)v24 setStatus:status];
    [(INSearchForNotebookItemsIntent *)v24 setLocation:v20];
    [(INSearchForNotebookItemsIntent *)v24 setLocationSearchType:locationSearchType];
    [(INSearchForNotebookItemsIntent *)v24 setDateTime:v21];
    [(INSearchForNotebookItemsIntent *)v24 setDateSearchType:dateSearchType];
    [(INSearchForNotebookItemsIntent *)v24 setTemporalEventTriggerTypes:temporalEventTriggerTypes];
    [(INSearchForNotebookItemsIntent *)v24 setTaskPriority:taskPriority];
    [(INSearchForNotebookItemsIntent *)v24 setNotebookItemIdentifier:v22];
  }

  return v24;
}

- (id)_categoryVerb
{
  return @"Search";
}

- (int64_t)_intentCategory
{
  return 9;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSearchForNotebookItemsIntent *)self _typedBackingStore];
  unsigned int v3 = [v2 intentMetadata];

  return v3;
}

- (id)_typedBackingStore
{
  v2 = [(INIntent *)self backingStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned int v3 = v2;
  }
  else {
    unsigned int v3 = 0;
  }
  id v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType notebookItemIdentifier:(NSString *)notebookItemIdentifier
{
  return [(INSearchForNotebookItemsIntent *)self initWithTitle:title content:content itemType:itemType status:status location:location locationSearchType:locationSearchType dateTime:dateTime dateSearchType:dateSearchType temporalEventTriggerTypes:0 taskPriority:0 notebookItemIdentifier:notebookItemIdentifier];
}

- (INSearchForNotebookItemsIntent)initWithTitle:(INSpeakableString *)title content:(NSString *)content itemType:(INNotebookItemType)itemType status:(INTaskStatus)status location:(CLPlacemark *)location locationSearchType:(INLocationSearchType)locationSearchType dateTime:(INDateComponentsRange *)dateTime dateSearchType:(INDateSearchType)dateSearchType
{
  return [(INSearchForNotebookItemsIntent *)self initWithTitle:title content:content itemType:itemType status:status location:location locationSearchType:locationSearchType dateTime:dateTime dateSearchType:dateSearchType temporalEventTriggerTypes:0 taskPriority:0 notebookItemIdentifier:0];
}

@end