@interface INDeleteParkingLocationIntent
+ (BOOL)supportsSecureCoding;
- (INDeleteParkingLocationIntent)init;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
@end

@implementation INDeleteParkingLocationIntent

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

- (id)verb
{
  return @"DeleteParkingLocation";
}

- (id)domain
{
  return @"Geo";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = [(INDeleteParkingLocationIntent *)self _typedBackingStore];
  v5 = (void *)[v6 copy];
  [(INIntent *)self setBackingStore:v5];
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (INDeleteParkingLocationIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)INDeleteParkingLocationIntent;
  return [(INIntent *)&v3 init];
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INDeleteParkingLocationIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INDeleteParkingLocationIntent *)self _typedBackingStore];
  objc_super v3 = [v2 intentMetadata];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end