@interface INAppendToNoteIntent
+ (BOOL)supportsSecureCoding;
- (INAppendToNoteIntent)initWithTargetNote:(INNote *)targetNote content:(INNoteContent *)content;
- (INNote)targetNote;
- (INNoteContent)content;
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
- (void)setTargetNote:(id)a3;
@end

@implementation INAppendToNoteIntent

- (id)verb
{
  return @"AppendToNote";
}

- (id)domain
{
  return @"Notebook";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INAppendToNoteIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"targetNote";
  v3 = [(INAppendToNoteIntent *)self targetNote];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"content";
  v10[0] = v4;
  v5 = [(INAppendToNoteIntent *)self content];
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

- (void)setContent:(id)a3
{
  id v4 = a3;
  id v6 = [(INAppendToNoteIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToNoteContent(v4);

  [v6 setContent:v5];
}

- (INNoteContent)content
{
  v2 = [(INAppendToNoteIntent *)self _typedBackingStore];
  v3 = [v2 content];
  id v4 = INIntentSlotValueTransformFromNoteContent(v3);

  return (INNoteContent *)v4;
}

- (void)setTargetNote:(id)a3
{
  id v4 = a3;
  id v6 = [(INAppendToNoteIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToNote(v4);

  [v6 setTargetNote:v5];
}

- (INNote)targetNote
{
  v2 = [(INAppendToNoteIntent *)self _typedBackingStore];
  v3 = [v2 targetNote];
  id v4 = INIntentSlotValueTransformFromNote(v3);

  return (INNote *)v4;
}

- (INAppendToNoteIntent)initWithTargetNote:(INNote *)targetNote content:(INNoteContent *)content
{
  id v6 = targetNote;
  v7 = content;
  v11.receiver = self;
  v11.super_class = (Class)INAppendToNoteIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INAppendToNoteIntent *)v8 setTargetNote:v6];
    [(INAppendToNoteIntent *)v9 setContent:v7];
  }

  return v9;
}

- (id)_categoryVerb
{
  return @"Add";
}

- (int64_t)_intentCategory
{
  return 8;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INAppendToNoteIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INAppendToNoteIntent *)self _typedBackingStore];
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