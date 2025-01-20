@interface INRequestRideIntent
+ (BOOL)supportsSecureCoding;
+ (id)_ignoredParameters;
- (BOOL)_isUserConfirmationRequired;
- (CLPlacemark)dropOffLocation;
- (CLPlacemark)pickupLocation;
- (INDateComponentsRange)scheduledPickupTime;
- (INPaymentMethod)paymentMethod;
- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod;
- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod scheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime;
- (INSpeakableString)rideOptionName;
- (NSNumber)partySize;
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
- (void)setPartySize:(id)a3;
- (void)setPaymentMethod:(id)a3;
- (void)setPickupLocation:(id)a3;
- (void)setRideOptionName:(id)a3;
- (void)setScheduledPickupTime:(id)a3;
@end

@implementation INRequestRideIntent

- (id)verb
{
  return @"RequestRide";
}

- (id)domain
{
  return @"Ridesharing";
}

- (BOOL)_isUserConfirmationRequired
{
  return 1;
}

- (void)_redactForMissingPrivacyEntitlementOptions:(unint64_t)a3 containingAppBundleId:(id)a4
{
  id v6 = a4;
  v7 = [(INRequestRideIntent *)self _typedBackingStore];
  id v19 = v6;
  v8 = (void *)[v7 copy];
  v9 = [v7 pickupLocation];
  v10 = INIntentSlotValueRedactedLocationFromLocation(v9, a3, v19);
  [v8 setPickupLocation:v10];

  v11 = [v7 dropOffLocation];
  v12 = INIntentSlotValueRedactedLocationFromLocation(v11, a3, v19);
  [v8 setDropOffLocation:v12];

  v13 = [v7 partySize];
  v14 = INIntentSlotValueRedactedIntegerFromInteger(v13, a3);
  [v8 setPartySize:v14];

  v15 = [v7 paymentMethod];
  v16 = INIntentSlotValueRedactedPaymentMethodFromPaymentMethod(v15, a3, v19);
  [v8 setPaymentMethod:v16];

  v17 = [v7 scheduledPickupTime];
  v18 = INIntentSlotValueRedactedDateTimeRangeFromDateTimeRange(v17, a3);

  [v8 setScheduledPickupTime:v18];
  [(INIntent *)self setBackingStore:v8];
}

- (id)_dictionaryRepresentation
{
  v21[6] = *MEMORY[0x1E4F143B8];
  v20[0] = @"pickupLocation";
  uint64_t v3 = [(INRequestRideIntent *)self pickupLocation];
  v4 = (void *)v3;
  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v19 = (void *)v3;
  v21[0] = v3;
  v20[1] = @"dropOffLocation";
  uint64_t v5 = [(INRequestRideIntent *)self dropOffLocation];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v18 = (void *)v5;
  v21[1] = v5;
  v20[2] = @"rideOptionName";
  uint64_t v7 = [(INRequestRideIntent *)self rideOptionName];
  v8 = (void *)v7;
  if (!v7)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v7;
  v20[3] = @"partySize";
  v9 = [(INRequestRideIntent *)self partySize];
  v10 = v9;
  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v10;
  v20[4] = @"paymentMethod";
  v11 = [(INRequestRideIntent *)self paymentMethod];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v12;
  v20[5] = @"scheduledPickupTime";
  v13 = [(INRequestRideIntent *)self scheduledPickupTime];
  v14 = v13;
  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[5] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:6];
  if (!v13) {

  }
  if (!v11) {
  if (!v9)
  }

  if (!v8) {
  if (!v6)
  }

  if (!v4) {

  }
  return v15;
}

- (void)setScheduledPickupTime:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDateTimeRange(v4);

  [v6 setScheduledPickupTime:v5];
}

- (INDateComponentsRange)scheduledPickupTime
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 scheduledPickupTime];
  id v4 = INIntentSlotValueTransformFromDateTimeRange(v3);

  return (INDateComponentsRange *)v4;
}

- (void)setPaymentMethod:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToPaymentMethod(v4);

  [v6 setPaymentMethod:v5];
}

- (INPaymentMethod)paymentMethod
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 paymentMethod];
  id v4 = INIntentSlotValueTransformFromPaymentMethod(v3);

  return (INPaymentMethod *)v4;
}

- (void)setPartySize:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToInteger(v4);

  [v6 setPartySize:v5];
}

- (NSNumber)partySize
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 partySize];
  id v4 = INIntentSlotValueTransformFromInteger(v3);

  return (NSNumber *)v4;
}

- (void)setRideOptionName:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToDataString(v4);

  [v6 setRideOptionName:v5];
}

- (INSpeakableString)rideOptionName
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 rideOptionName];
  id v4 = INIntentSlotValueTransformFromDataString(v3);

  return (INSpeakableString *)v4;
}

- (void)setDropOffLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setDropOffLocation:v5];
}

- (CLPlacemark)dropOffLocation
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 dropOffLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (void)setPickupLocation:(id)a3
{
  id v4 = a3;
  id v6 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v5 = INIntentSlotValueTransformToLocation(v4);

  [v6 setPickupLocation:v5];
}

- (CLPlacemark)pickupLocation
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
  uint64_t v3 = [v2 pickupLocation];
  id v4 = INIntentSlotValueTransformFromLocation(v3);

  return (CLPlacemark *)v4;
}

- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod scheduledPickupTime:(INDateComponentsRange *)scheduledPickupTime
{
  v14 = pickupLocation;
  v15 = dropOffLocation;
  v16 = rideOptionName;
  v17 = partySize;
  v18 = paymentMethod;
  id v19 = scheduledPickupTime;
  v23.receiver = self;
  v23.super_class = (Class)INRequestRideIntent;
  v20 = [(INIntent *)&v23 init];
  v21 = v20;
  if (v20)
  {
    [(INRequestRideIntent *)v20 setPickupLocation:v14];
    [(INRequestRideIntent *)v21 setDropOffLocation:v15];
    [(INRequestRideIntent *)v21 setRideOptionName:v16];
    [(INRequestRideIntent *)v21 setPartySize:v17];
    [(INRequestRideIntent *)v21 setPaymentMethod:v18];
    [(INRequestRideIntent *)v21 setScheduledPickupTime:v19];
  }

  return v21;
}

- (id)_categoryVerb
{
  return @"Request";
}

- (int64_t)_intentCategory
{
  return 15;
}

- (void)_setMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(INRequestRideIntent *)self _typedBackingStore];
  [v5 setIntentMetadata:v4];
}

- (id)_metadata
{
  v2 = [(INRequestRideIntent *)self _typedBackingStore];
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

+ (id)_ignoredParameters
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"partySize", @"paymentMethod", @"scheduledPickupTime", 0);
}

- (INRequestRideIntent)initWithPickupLocation:(CLPlacemark *)pickupLocation dropOffLocation:(CLPlacemark *)dropOffLocation rideOptionName:(INSpeakableString *)rideOptionName partySize:(NSNumber *)partySize paymentMethod:(INPaymentMethod *)paymentMethod
{
  return [(INRequestRideIntent *)self initWithPickupLocation:pickupLocation dropOffLocation:dropOffLocation rideOptionName:rideOptionName partySize:partySize paymentMethod:paymentMethod scheduledPickupTime:0];
}

@end