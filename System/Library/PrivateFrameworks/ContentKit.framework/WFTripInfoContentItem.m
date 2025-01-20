@interface WFTripInfoContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
- (WFTripInfo)tripInfo;
- (id)arrivalTime;
- (id)distance;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)routeName;
- (id)travelTime;
@end

@implementation WFTripInfoContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Trip infos");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trip info (plural)", @"Trip info");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Trip info (singular)", @"Trip info");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Location";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)stringConversionBehavior
{
  v2 = [a1 propertyForName:@"Travel Time"];
  id v3 = +[WFContentItemStringConversionBehavior accessingProperty:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v14[4] = *MEMORY[0x263EF8340];
  v13 = WFLocalizedContentPropertyNameMarker(@"Travel Time");
  v2 = +[WFContentPropertyBuilder keyPath:@"travelTime" name:v13 class:objc_opt_class()];
  id v3 = [v2 timeUnits:124];
  v14[0] = v3;
  v4 = WFLocalizedContentPropertyNameMarker(@"Arrival Time");
  v5 = +[WFContentPropertyBuilder keyPath:@"arrivalTime" name:v4 class:objc_opt_class()];
  v14[1] = v5;
  v6 = WFLocalizedContentPropertyNameMarker(@"Route Name");
  v7 = +[WFContentPropertyBuilder keyPath:@"routeName" name:v6 class:objc_opt_class()];
  v14[2] = v7;
  v8 = WFLocalizedContentPropertyNameMarker(@"Distance");
  v9 = +[WFContentPropertyBuilder keyPath:@"distance" name:v8 class:objc_opt_class()];
  v10 = [v9 measurementUnitType:*MEMORY[0x263F857C8]];
  v14[3] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];

  return v11;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = [(WFTripInfoContentItem *)self travelTime];
    v9 = [v8 absoluteTimeString];
    v7 = +[WFObjectRepresentation object:v9];
  }
  else
  {
    if ((Class)objc_opt_class() == a3)
    {
      uint64_t v10 = [(WFTripInfoContentItem *)self travelTime];
    }
    else
    {
      if ((Class)objc_opt_class() != a3)
      {
        v7 = 0;
        goto LABEL_10;
      }
      uint64_t v10 = [(WFTripInfoContentItem *)self distance];
    }
    v8 = (void *)v10;
    v7 = +[WFObjectRepresentation object:v10];
  }

LABEL_10:
  return v7;
}

- (id)distance
{
  v2 = [(WFTripInfoContentItem *)self tripInfo];
  id v3 = [v2 distance];

  return v3;
}

- (id)routeName
{
  v2 = [(WFTripInfoContentItem *)self tripInfo];
  id v3 = [v2 routeName];

  return v3;
}

- (id)arrivalTime
{
  v2 = (void *)MEMORY[0x263EFF910];
  id v3 = [(WFTripInfoContentItem *)self travelTime];
  [v3 timeInterval];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceNow:");

  return v4;
}

- (id)travelTime
{
  v2 = [(WFTripInfoContentItem *)self tripInfo];
  id v3 = [v2 expectedTravelTime];

  return v3;
}

- (WFTripInfo)tripInfo
{
  uint64_t v3 = objc_opt_class();
  return (WFTripInfo *)[(WFContentItem *)self objectForClass:v3];
}

@end