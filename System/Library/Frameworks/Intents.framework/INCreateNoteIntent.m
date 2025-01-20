@interface INCreateNoteIntent
+ (BOOL)supportsSecureCoding;
- (INCreateNoteIntent)initWithTitle:(INSpeakableString *)title content:(INNoteContent *)content groupName:(INSpeakableString *)groupName;
- (INNoteContent)content;
- (INSpeakableString)groupName;
- (INSpeakableString)title;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_redactedDictionaryRepresentation;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContent:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation INCreateNoteIntent

- (id)verb
{
  return @"CreateNote";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INCreateNoteIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"title";
  v3 = [(INCreateNoteIntent *)self title];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v4;
  v11[1] = @"content";
  v5 = [(INCreateNoteIntent *)self content];
  id v6 = v5;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v6;
  v11[2] = @"groupName";
  v7 = [(INCreateNoteIntent *)self groupName];
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

- (id)_redactedDictionaryRepresentation
{
  v2 = [(INCreateNoteIntent *)self _dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  [v3 setObject:@"<redacted>" forKey:@"title"];

  return v3;
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateNoteIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setGroupName:v5];
}

- (INSpeakableString)groupName
{
  v2 = [(INCreateNoteIntent *)self _typedBackingStore];
  v3 = [v2 groupName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setContent:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateNoteIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToNoteContent(v4);

  [v6 setContent:v5];
}

- (INNoteContent)content
{
  v2 = [(INCreateNoteIntent *)self _typedBackingStore];
  v3 = [v2 content];
  id v4 = INIntentSlotValueTransformFromNoteContent(v3);

  return (INNoteContent *)v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v6 = [(INCreateNoteIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setTitle:v5];
}

- (INSpeakableString)title
{
  v2 = [(INCreateNoteIntent *)self _typedBackingStore];
  v3 = [v2 title];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (INCreateNoteIntent)initWithTitle:(INSpeakableString *)title content:(INNoteContent *)content groupName:(INSpeakableString *)groupName
{
  v8 = title;
  v9 = content;
  v10 = groupName;
  v14.receiver = self;
  v14.super_class = (Class)INCreateNoteIntent;
  v11 = [(INIntent *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(INCreateNoteIntent *)v11 setTitle:v8];
    [(INCreateNoteIntent *)v12 setContent:v9];
    [(INCreateNoteIntent *)v12 setGroupName:v10];
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
  id v5 = [(INCreateNoteIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INCreateNoteIntent *)self _typedBackingStore];
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