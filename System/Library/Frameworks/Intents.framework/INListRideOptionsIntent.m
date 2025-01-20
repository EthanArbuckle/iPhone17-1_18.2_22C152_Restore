@interface INListRideOptionsIntent
+ (BOOL)supportsSecureCoding;
- (CLPlacemark)dropOffLocation;
- (CLPlacemark)pickupLocation;
- (INListRideOptionsIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation;
- (id)_categoryVerb;
- (id)_dictionaryRepresentation;
- (id)_metadata;
- (id)_typedBackingStore;
- (id)domain;
- (id)verb;
- (int64_t)_intentCategory;
- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4;
- (void)_setMetadata:(id)a3;
- (void)setDropOffLocation:(id)a3;
- (void)setPickupLocation:(id)a3;
@end

@implementation INListRideOptionsIntent

- (id)verb
{
  return @"ListRideOptions";
}

- (id)domain
{
  return @"Ridesharing";
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INListRideOptionsIntent *)self _typedBackingStore];
  id v13 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 pickupLocation];
  v10 = INIntentSlotValueRedactedLocationFromLocation(v9, a3, v13);
  [v8 setPickupLocation:v10];

  v11 = [v7 dropOffLocation];
  v12 = INIntentSlotValueRedactedLocationFromLocation(v11, a3, v13);

  [v8 setDropOffLocation:v12];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"pickupLocation";
  v3 = [(INListRideOptionsIntent *)self pickupLocation];
  v4 = v3;
  if (!v3)
  {
    v4 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"dropOffLocation";
  v10[0] = v4;
  v5 = [(INListRideOptionsIntent *)self dropOffLocation];
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

- (void)setDropOffLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INListRideOptionsIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setDropOffLocation:v5];
}

- (CLPlacemark)dropOffLocation
{
  v2 = [(INListRideOptionsIntent *)self _typedBackingStore];
  v3 = [v2 dropOffLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setPickupLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INListRideOptionsIntent *)self _typedBackingStore];
  v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setPickupLocation:v5];
}

- (CLPlacemark)pickupLocation
{
  v2 = [(INListRideOptionsIntent *)self _typedBackingStore];
  v3 = [v2 pickupLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (INListRideOptionsIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation
{
  id v6 = pickupLocation;
  v7 = dropOffLocation;
  v11.receiver = self;
  v11.super_class = (Class)INListRideOptionsIntent;
  v8 = [(INIntent *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(INListRideOptionsIntent *)v8 setPickupLocation:v6];
    [(INListRideOptionsIntent *)v9 setDropOffLocation:v7];
  }

  return v9;
}

- (id)_categoryVerb
{
  return @"View";
}

- (int64_t)_intentCategory
{
  return 1;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INListRideOptionsIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INListRideOptionsIntent *)self _typedBackingStore];
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