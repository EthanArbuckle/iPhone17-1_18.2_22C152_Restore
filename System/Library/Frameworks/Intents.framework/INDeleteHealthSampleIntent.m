@interface INDeleteHealthSampleIntent
+ (BOOL)supportsSecureCoding;
- (INDeleteHealthSampleIntent)initWithSampleUuids:(id)a3;
- (NSArray)sampleUuids;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setSampleUuids:(id)a3;
@end

@implementation INDeleteHealthSampleIntent

- (id)verb
{
  return @"DeleteHealthSample";
}

- (id)domain
{
  return @"Wellness";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INDeleteHealthSampleIntent *)self _typedBackingStore];
  id v11 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 sampleUuids];
  v10 = INIntentSlotValueRedactedStringsFromStrings(v9, a3, v11);

  [v8 setSampleUuids:v10];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v6 = @"sampleUuids";
  v2 = [(INDeleteHealthSampleIntent *)self sampleUuids];
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

- (void)setSampleUuids:(id)a3
{
  id v4 = a3;
  id v6 = [(INDeleteHealthSampleIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToStrings(v4);

  [v6 setSampleUuids:v5];
}

- (NSArray)sampleUuids
{
  v2 = [(INDeleteHealthSampleIntent *)self _typedBackingStore];
  v3 = [v2 sampleUuids];
  id v4 = INIntentSlotValueTransformFromStrings(v3);

  return (NSArray *)v4;
}

- (INDeleteHealthSampleIntent)initWithSampleUuids:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)INDeleteHealthSampleIntent;
  v5 = [(INIntent *)&v8 init];
  id v6 = v5;
  if (v5) {
    [(INDeleteHealthSampleIntent *)v5 setSampleUuids:v4];
  }

  return v6;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteHealthSampleIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteHealthSampleIntent *)self _typedBackingStore];
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