@interface INCreateTaskListIntent
+ (BOOL)supportsSecureCoding;
- (INCreateTaskListIntent)initWithTitle:(INSpeakableString *)title taskTitles:(NSArray *)taskTitles groupName:(INSpeakableString *)groupName;
- (INSpeakableString)groupName;
- (INSpeakableString)title;
- (NSArray)taskTitles;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setTaskTitles:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation INCreateTaskListIntent

- (id)verb
{
  return @"CreateTaskList";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"title";
  v3 = [(INCreateTaskListIntent *)self title];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"taskTitles";
  v5 = [(INCreateTaskListIntent *)self taskTitles];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"groupName";
  v7 = [(INCreateTaskListIntent *)self groupName];
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

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setGroupName:v5];
}

- (INSpeakableString)groupName
{
  v2 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v3 = [v2 groupName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setTaskTitles:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataStrings(v4);

  [v6 setTaskTitles:v5];
}

- (NSArray)taskTitles
{
  v2 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v3 = [v2 taskTitles];
  id v4 = INIntentSlotValueTransformFromDataStrings(v3);

  return (NSArray *)v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setTitle:v5];
}

- (INSpeakableString)title
{
  v2 = [(INCreateTaskListIntent *)self _typedBackingStore];
  v3 = [v2 title];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INCreateTaskListIntent)initWithTitle:(INSpeakableString *)title taskTitles:(NSArray *)taskTitles groupName:(INSpeakableString *)groupName
{
  v8 = title;
  v9 = taskTitles;
  v10 = groupName;
  v14.receiver = self;
  v14.super_class = (Class)INCreateTaskListIntent;
  v11 = [(INIntent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(INCreateTaskListIntent *)v11 setTitle:v8];
    [(INCreateTaskListIntent *)v12 setTaskTitles:v9];
    [(INCreateTaskListIntent *)v12 setGroupName:v10];
  }

  return v12;
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
  id v5 = [(INCreateTaskListIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INCreateTaskListIntent *)self _typedBackingStore];
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