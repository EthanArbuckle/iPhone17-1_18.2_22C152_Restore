@interface INSetRelationshipIntent
+ (BOOL)supportsSecureCoding;
- (INModifyRelationship)targetRelationship;
- (INSetRelationshipIntent)initWithContactIdentifiers:(id)a3 targetRelationship:(id)a4;
- (NSArray)contactIdentifiers;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setContactIdentifiers:(id)a3;
- (void)setTargetRelationship:(id)a3;
@end

@implementation INSetRelationshipIntent

- (id)verb
{
  return @"SetRelationship";
}

- (id)domain
{
  return @"Contact";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INSetRelationshipIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 contactIdentifiers];
  v10 = INIntentSlotValueRedactedStringsFromStrings(v9, a3, v11);

  [v8 setContactIdentifiers:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"contactIdentifiers";
  v3 = [(INSetRelationshipIntent *)self contactIdentifiers];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"targetRelationship";
  v10[0] = v4;
  v5 = [(INSetRelationshipIntent *)self targetRelationship];
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

- (void)setTargetRelationship:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRelationshipIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToModifyRelationship(v4);

  [v6 setTargetRelationship:v5];
}

- (INModifyRelationship)targetRelationship
{
  v2 = [(INSetRelationshipIntent *)self _typedBackingStore];
  v3 = [v2 targetRelationship];
  id v4 = INIntentSlotValueTransformFromModifyRelationship(v3);

  return (INModifyRelationship *)v4;
}

- (void)setContactIdentifiers:(id)a3
{
  id v4 = a3;
  id v6 = [(INSetRelationshipIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToStrings(v4);

  [v6 setContactIdentifiers:v5];
}

- (NSArray)contactIdentifiers
{
  v2 = [(INSetRelationshipIntent *)self _typedBackingStore];
  v3 = [v2 contactIdentifiers];
  id v4 = INIntentSlotValueTransformFromStrings(v3);

  return (NSArray *)v4;
}

- (INSetRelationshipIntent)initWithContactIdentifiers:(id)a3 targetRelationship:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INSetRelationshipIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INSetRelationshipIntent *)v8 setContactIdentifiers:v6];
    [(INSetRelationshipIntent *)v9 setTargetRelationship:v7];
  }

  return v9;
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
  id v5 = [(INSetRelationshipIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INSetRelationshipIntent *)self _typedBackingStore];
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