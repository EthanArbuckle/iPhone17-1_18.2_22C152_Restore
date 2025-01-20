@interface WFParkedCarContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (BOOL)userSetLocation;
- (id)date;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)location;
- (id)notes;
- (id)photo;
- (id)vehicleEvent;
- (unint64_t)preferredDisplayStyle;
@end

@implementation WFParkedCarContentItem

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  v3 = (void *)MEMORY[0x263F337A0];
  v4 = [MEMORY[0x263F33708] locationWithSystemAppBundleIdentifier:@"com.apple.Maps"];
  v5 = [v3 attributionSetWithOrigin:v4 disclosureLevel:1];

  return v5;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v9 = [(WFParkedCarContentItem *)self date];
  }
  else
  {
    v7 = NSStringFromClass(a3);
    int v8 = [@"CLLocation" isEqualToString:v7];

    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [(WFParkedCarContentItem *)self location];
  }
  v10 = (void *)v9;
  if (v9)
  {
    v11 = [MEMORY[0x263F33908] object:v9];

    goto LABEL_8;
  }
LABEL_7:
  v11 = 0;
LABEL_8:
  return v11;
}

- (id)photo
{
  v3 = [(WFParkedCarContentItem *)self vehicleEvent];
  v4 = [v3 photo];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263F85308];
    v6 = [(WFParkedCarContentItem *)self vehicleEvent];
    v7 = [v6 photo];
    int v8 = [v5 imageWithData:v7];
  }
  else
  {
    int v8 = 0;
  }
  return v8;
}

- (BOOL)userSetLocation
{
  v2 = [(WFParkedCarContentItem *)self vehicleEvent];
  char v3 = [v2 userSetLocation];

  return v3;
}

- (id)notes
{
  v2 = [(WFParkedCarContentItem *)self vehicleEvent];
  char v3 = [v2 notes];

  return v3;
}

- (id)location
{
  v2 = [(WFParkedCarContentItem *)self vehicleEvent];
  char v3 = [v2 location];

  if (v3)
  {
    id v4 = objc_alloc((Class)getCLLocationClass_27714());
    [v3 latitude];
    double v6 = v5;
    [v3 longitude];
    int v8 = (void *)[v4 initWithLatitude:v6 longitude:v7];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)date
{
  v2 = [(WFParkedCarContentItem *)self vehicleEvent];
  char v3 = [v2 date];

  return v3;
}

- (id)vehicleEvent
{
  id RTVehicleEventClass = getRTVehicleEventClass();
  return (id)[(WFParkedCarContentItem *)self objectForClass:RTVehicleEventClass];
}

+ (id)propertyBuilders
{
  v20[5] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    char v3 = (void *)MEMORY[0x263F33808];
    v19 = WFLocalizedContentPropertyNameMarker(@"Date");
    v18 = [v3 keyPath:@"date" name:v19 class:objc_opt_class()];
    v20[0] = v18;
    id v4 = (void *)MEMORY[0x263F33808];
    double v5 = WFLocalizedContentPropertyNameMarker(@"Location");
    double v6 = [v4 keyPath:@"location" name:v5 class:getCLLocationClass_27714()];
    v20[1] = v6;
    double v7 = (void *)MEMORY[0x263F33808];
    int v8 = WFLocalizedContentPropertyNameMarker(@"Notes");
    uint64_t v9 = [v7 keyPath:@"notes" name:v8 class:objc_opt_class()];
    v20[2] = v9;
    v10 = (void *)MEMORY[0x263F33808];
    v11 = WFLocalizedContentPropertyNameMarker(@"Photo");
    v12 = [v10 keyPath:@"photo" name:v11 class:objc_opt_class()];
    v20[3] = v12;
    v13 = (void *)MEMORY[0x263F33808];
    v14 = WFLocalizedContentPropertyNameMarker(@"Was Location Set by User");
    v15 = [NSNumber numberWithBool:1];
    v16 = [v13 keyPath:@"userSetLocation" name:v14 class:objc_opt_class()];
    v20[4] = v16;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d parked cars");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Parked Cars", @"Parked Cars");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Parked Car", @"Parked Car");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A28];
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F33910] typeWithClassName:@"CLLocation" frameworkName:@"CoreLocation" location:0];
  double v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:getRTVehicleEventClass()];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x263F337E0];
  id v3 = [a1 propertyForName:@"Location"];
  id v4 = [v2 accessingProperty:v3];

  return v4;
}

@end