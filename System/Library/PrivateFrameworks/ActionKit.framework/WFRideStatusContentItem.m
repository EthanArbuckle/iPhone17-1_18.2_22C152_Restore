@interface WFRideStatusContentItem
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (INRideStatus)rideStatus;
- (id)disclaimerMessage;
- (id)driver;
- (id)dropOffLocation;
- (id)estimatedDropOffDate;
- (id)estimatedPickupDate;
- (id)maximumPrice;
- (id)minimumPrice;
- (id)pickupLocation;
- (id)rideOptionName;
- (id)vehicleDescription;
@end

@implementation WFRideStatusContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Rides");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Ride Statuses", @"Ride Statuses");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Ride Status", @"Ride Status");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v31[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F33808];
  v30 = WFLocalizedContentPropertyNameMarker(@"Vehicle Information");
  v29 = [v2 keyPath:@"vehicleDescription" name:v30 class:objc_opt_class()];
  v31[0] = v29;
  id v3 = (void *)MEMORY[0x263F33808];
  v28 = WFLocalizedContentPropertyNameMarker(@"Drop Off Time");
  v27 = [v3 keyPath:@"estimatedDropOffDate" name:v28 class:objc_opt_class()];
  v31[1] = v27;
  v4 = (void *)MEMORY[0x263F33808];
  v26 = WFLocalizedContentPropertyNameMarker(@"Pickup Time");
  v25 = [v4 keyPath:@"estimatedPickupDate" name:v26 class:objc_opt_class()];
  v31[2] = v25;
  v5 = (void *)MEMORY[0x263F33808];
  v24 = WFLocalizedContentPropertyNameMarker(@"Pickup Location");
  v23 = [v5 keyPath:@"pickupLocation" name:v24 class:getCLPlacemarkClass_51240()];
  v31[3] = v23;
  v6 = (void *)MEMORY[0x263F33808];
  v22 = WFLocalizedContentPropertyNameMarker(@"Drop Off Location");
  v7 = [v6 keyPath:@"dropOffLocation" name:v22 class:getCLPlacemarkClass_51240()];
  v31[4] = v7;
  v8 = (void *)MEMORY[0x263F33808];
  v9 = WFLocalizedContentPropertyNameMarker(@"Minimum Price");
  v10 = [v8 keyPath:@"minimumPrice" name:v9 class:objc_opt_class()];
  v31[5] = v10;
  v11 = (void *)MEMORY[0x263F33808];
  v12 = WFLocalizedContentPropertyNameMarker(@"Maximum Price");
  v13 = [v11 keyPath:@"maximumPrice" name:v12 class:objc_opt_class()];
  v31[6] = v13;
  v14 = (void *)MEMORY[0x263F33808];
  v15 = WFLocalizedContentPropertyNameMarker(@"Ride Option Name");
  v16 = [v14 keyPath:@"rideOptionName" name:v15 class:objc_opt_class()];
  v31[7] = v16;
  v17 = (void *)MEMORY[0x263F33808];
  v18 = WFLocalizedContentPropertyNameMarker(@"Driver");
  v19 = [v17 keyPath:@"driver" name:v18 class:objc_opt_class()];
  v31[8] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:9];

  return v20;
}

- (id)driver
{
  v2 = (void *)MEMORY[0x263F33780];
  id v3 = [(WFRideStatusContentItem *)self rideStatus];
  v4 = [v3 driver];
  v5 = [v2 cnContactWithINPerson:v4];

  return v5;
}

- (id)disclaimerMessage
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 rideOption];
  v4 = [v3 disclaimerMessage];

  return v4;
}

- (id)rideOptionName
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 rideOption];
  v4 = [v3 name];

  return v4;
}

- (id)maximumPrice
{
  id v3 = objc_alloc(MEMORY[0x263F0FA48]);
  v4 = [(WFRideStatusContentItem *)self rideStatus];
  v5 = [v4 rideOption];
  v6 = [v5 priceRange];
  v7 = [v6 maximumPrice];
  v8 = [(WFRideStatusContentItem *)self rideStatus];
  v9 = [v8 rideOption];
  v10 = [v9 priceRange];
  v11 = [v10 currencyCode];
  v12 = (void *)[v3 initWithAmount:v7 currencyCode:v11];

  return v12;
}

- (id)minimumPrice
{
  id v3 = objc_alloc(MEMORY[0x263F0FA48]);
  v4 = [(WFRideStatusContentItem *)self rideStatus];
  v5 = [v4 rideOption];
  v6 = [v5 priceRange];
  v7 = [v6 minimumPrice];
  v8 = [(WFRideStatusContentItem *)self rideStatus];
  v9 = [v8 rideOption];
  v10 = [v9 priceRange];
  v11 = [v10 currencyCode];
  v12 = (void *)[v3 initWithAmount:v7 currencyCode:v11];

  return v12;
}

- (id)dropOffLocation
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 dropOffLocation];

  return v3;
}

- (id)pickupLocation
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 pickupLocation];

  return v3;
}

- (id)estimatedPickupDate
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 estimatedPickupDate];

  return v3;
}

- (id)estimatedDropOffDate
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 estimatedDropOffDate];

  return v3;
}

- (id)vehicleDescription
{
  v2 = [(WFRideStatusContentItem *)self rideStatus];
  id v3 = [v2 vehicle];
  v4 = [v3 wfName];

  return v4;
}

- (INRideStatus)rideStatus
{
  uint64_t v3 = objc_opt_class();
  return (INRideStatus *)[(WFRideStatusContentItem *)self objectForClass:v3];
}

@end