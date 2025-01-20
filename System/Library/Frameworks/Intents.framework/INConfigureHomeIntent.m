@interface INConfigureHomeIntent
+ (BOOL)supportsSecureCoding;
- (INConfigureHomeIntent)initWithEntities:(id)a3;
- (NSArray)entities;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setEntities:(id)a3;
@end

@implementation INConfigureHomeIntent

- (id)verb
{
  return @"ConfigureHome";
}

- (id)domain
{
  return @"HomeKit";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INConfigureHomeIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"entities";
  v2 = [(INConfigureHomeIntent *)self entities];
  v3 = v2;
  if (!v2)
  {
    v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  if (!v2) {

  }
  return v4;
}

- (void)setEntities:(id)a3
{
  id v4 = a3;
  id v6 = [(INConfigureHomeIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToHomeEntities(v4);

  [v6 setEntities:v5];
}

- (NSArray)entities
{
  v2 = [(INConfigureHomeIntent *)self _typedBackingStore];
  v3 = [v2 entities];
  id v4 = INIntentSlotValueTransformFromHomeEntities(v3);

  return (NSArray *)v4;
}

- (INConfigureHomeIntent)initWithEntities:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INConfigureHomeIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INConfigureHomeIntent *)v5 setEntities:v4];
  }

  return v6;
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
  id v5 = [(INConfigureHomeIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INConfigureHomeIntent *)self _typedBackingStore];
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