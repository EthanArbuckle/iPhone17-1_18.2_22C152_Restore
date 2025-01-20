@interface WFWeatherAirQualityPollutantContentItem
+ (id)contentCategories;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (id)concentration;
- (id)formattedConcentration;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)localizedDescription;
- (id)localizedName;
- (id)pollutant;
@end

@implementation WFWeatherAirQualityPollutantContentItem

- (id)formattedConcentration
{
  id v3 = objc_alloc_init(MEMORY[0x263F08988]);
  [v3 setUnitOptions:1];
  v4 = [(WFWeatherAirQualityPollutantContentItem *)self concentration];
  v5 = [v3 stringFromMeasurement:v4];

  return v5;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v8 = (void *)MEMORY[0x263F33908];
    v9 = [(WFWeatherAirQualityPollutantContentItem *)self concentration];
    v10 = v8;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_13;
    }
    v11 = [(WFWeatherAirQualityPollutantContentItem *)self localizedName];

    if (v11)
    {
      v12 = [(WFWeatherAirQualityPollutantContentItem *)self localizedDescription];

      v13 = NSString;
      if (v12)
      {
        v14 = WFLocalizedString(@"%@ - %@: %@");
        v15 = [(WFWeatherAirQualityPollutantContentItem *)self localizedName];
        v16 = [(WFWeatherAirQualityPollutantContentItem *)self localizedDescription];
        v17 = [(WFWeatherAirQualityPollutantContentItem *)self formattedConcentration];
        objc_msgSend(v13, "stringWithFormat:", v14, v15, v16, v17);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = WFLocalizedString(@"%@: %@");
        v15 = [(WFWeatherAirQualityPollutantContentItem *)self localizedName];
        v16 = [(WFWeatherAirQualityPollutantContentItem *)self formattedConcentration];
        objc_msgSend(v13, "stringWithFormat:", v14, v15, v16);
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v9 = &stru_26F008428;
    }
    v10 = (void *)MEMORY[0x263F33908];
  }
  v7 = [v10 object:v9];

LABEL_13:
  return v7;
}

- (id)concentration
{
  v2 = [(WFWeatherAirQualityPollutantContentItem *)self pollutant];
  id v3 = [v2 concentration];

  return v3;
}

- (id)localizedDescription
{
  v2 = [(WFWeatherAirQualityPollutantContentItem *)self pollutant];
  id v3 = [v2 localizedDescription];

  return v3;
}

- (id)localizedName
{
  v2 = [(WFWeatherAirQualityPollutantContentItem *)self pollutant];
  id v3 = [v2 localizedName];

  return v3;
}

- (id)pollutant
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFWeatherAirQualityPollutantContentItem *)self objectForClass:v3];
}

+ (id)propertyBuilders
{
  v13[3] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = (void *)MEMORY[0x263F33808];
    v4 = WFLocalizedContentPropertyNameMarker(@"Name");
    v5 = [v3 keyPath:@"localizedName" name:v4 class:objc_opt_class()];
    v6 = (void *)MEMORY[0x263F33808];
    v7 = WFLocalizedContentPropertyNameMarker(@"Description");
    v8 = objc_msgSend(v6, "keyPath:name:class:", @"localizedDescription", v7, objc_opt_class(), v5);
    v13[1] = v8;
    v9 = (void *)MEMORY[0x263F33808];
    v10 = WFLocalizedParameterValue(@"Concentration");
    v11 = [v9 keyPath:@"concentration" name:v10 class:objc_opt_class()];
    v13[2] = v11;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Air Pollutant (Plural)", @"Air Pollutants");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Air Pollutant (Single)", @"Air Pollutant");
  v5 = [v3 localize:v4];

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
  v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

@end