@interface WFWeatherDataContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (id)date;
- (id)dewpoint;
- (id)feelsLikeTemperature;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
- (id)highTemperature;
- (id)humidity;
- (id)localizedAirQualityCategory;
- (id)localizedAirQualityIndex;
- (id)localizedConditionString;
- (id)location;
- (id)lowTemperature;
- (id)pollutants;
- (id)precipitationAmount;
- (id)precipitationChance;
- (id)pressure;
- (id)sunriseTime;
- (id)sunsetTime;
- (id)temperature;
- (id)uvIndex;
- (id)visibility;
- (id)weatherData;
- (id)windDirection;
- (id)windSpeed;
@end

@implementation WFWeatherDataContentItem

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    v10 = [(WFWeatherDataContentItem *)self date];
    if (v10)
    {
LABEL_4:
      v11 = [MEMORY[0x263F33908] object:v10];

      goto LABEL_7;
    }
  }
  else
  {
    v7 = NSStringFromClass(a3);
    int v8 = [@"CLLocation" isEqualToString:v7];

    if (v8)
    {
      v9 = [(WFWeatherDataContentItem *)self weatherData];
      v10 = [v9 location];

      if (v10) {
        goto LABEL_4;
      }
    }
  }
  v11 = 0;
LABEL_7:
  return v11;
}

- (id)pollutants
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 pollutants];

  return v3;
}

- (id)localizedAirQualityCategory
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 localizedAirQualityCategory];

  return v3;
}

- (id)localizedAirQualityIndex
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 localizedAirQualityIndex];

  return v3;
}

- (id)sunsetTime
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 sunsetTime];

  return v3;
}

- (id)sunriseTime
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 sunriseTime];

  return v3;
}

- (id)uvIndex
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 uvIndex];

  return v3;
}

- (id)windDirection
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 windDirection];

  return v3;
}

- (id)windSpeed
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 windSpeed];

  return v3;
}

- (id)precipitationChance
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 precipitationChance];

  return v3;
}

- (id)precipitationAmount
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 precipitationAmount];

  return v3;
}

- (id)pressure
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 pressure];

  return v3;
}

- (id)humidity
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 humidity];

  return v3;
}

- (id)dewpoint
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 dewpoint];

  return v3;
}

- (id)visibility
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 visibility];

  return v3;
}

- (id)localizedConditionString
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 localizedConditionString];

  return v3;
}

- (id)feelsLikeTemperature
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 feelsLikeTemperature];

  return v3;
}

- (id)lowTemperature
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 lowTemperature];

  return v3;
}

- (id)highTemperature
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 highTemperature];

  return v3;
}

- (id)temperature
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 temperature];

  return v3;
}

- (id)location
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 location];

  return v3;
}

- (id)date
{
  v2 = [(WFWeatherDataContentItem *)self weatherData];
  v3 = [v2 date];

  return v3;
}

- (id)weatherData
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFWeatherDataContentItem *)self objectForClass:v3];
}

+ (id)propertyBuilders
{
  v91[21] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v3 = (void *)MEMORY[0x263F33808];
    v85 = WFLocalizedContentPropertyNameMarker(@"Date");
    v84 = [v3 keyPath:@"date" name:v85 class:objc_opt_class()];
    v91[0] = v84;
    v4 = (void *)MEMORY[0x263F33808];
    v83 = WFLocalizedContentPropertyNameMarker(@"Location");
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x2050000000;
    v5 = (void *)getCLLocationClass_softClass_53599;
    uint64_t v90 = getCLLocationClass_softClass_53599;
    if (!getCLLocationClass_softClass_53599)
    {
      v86[0] = MEMORY[0x263EF8330];
      v86[1] = 3221225472;
      v86[2] = __getCLLocationClass_block_invoke_53600;
      v86[3] = &unk_264E5EC88;
      v86[4] = &v87;
      __getCLLocationClass_block_invoke_53600((uint64_t)v86);
      v5 = (void *)v88[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v87, 8);
    v82 = [v4 keyPath:@"location" name:v83 class:v6];
    v91[1] = v82;
    v7 = (void *)MEMORY[0x263F33808];
    v80 = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(@"temperature");
    v81 = WFLocalizedContentPropertyNameMarker(@"Temperature");
    v79 = [v7 block:v80 name:v81 class:objc_opt_class()];
    uint64_t v8 = *MEMORY[0x263F857F0];
    v78 = [v79 measurementUnitType:*MEMORY[0x263F857F0]];
    v91[2] = v78;
    v9 = (void *)MEMORY[0x263F33808];
    v76 = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(@"lowTemperature");
    v77 = WFLocalizedContentPropertyNameMarker(@"Low");
    v75 = [v9 block:v76 name:v77 class:objc_opt_class()];
    v74 = [v75 measurementUnitType:v8];
    v91[3] = v74;
    v10 = (void *)MEMORY[0x263F33808];
    v72 = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(@"highTemperature");
    v73 = WFLocalizedContentPropertyNameMarker(@"High");
    v71 = [v10 block:v72 name:v73 class:objc_opt_class()];
    v70 = [v71 measurementUnitType:v8];
    v91[4] = v70;
    v11 = (void *)MEMORY[0x263F33808];
    v68 = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(@"feelsLikeTemperature");
    v69 = WFLocalizedContentPropertyNameMarker(@"Feels Like");
    v67 = [v11 block:v68 name:v69 class:objc_opt_class()];
    v66 = [v67 measurementUnitType:v8];
    v91[5] = v66;
    v12 = (void *)MEMORY[0x263F33808];
    v65 = WFLocalizedContentPropertyNameMarker(@"Condition");
    v64 = [v12 keyPath:@"localizedConditionString" name:v65 class:objc_opt_class()];
    v91[6] = v64;
    v13 = (void *)MEMORY[0x263F33808];
    v63 = WFLocalizedContentPropertyNameMarker(@"Visibility");
    v62 = [v13 keyPath:@"visibility" name:v63 class:objc_opt_class()];
    uint64_t v14 = *MEMORY[0x263F857C8];
    v61 = [v62 measurementUnitType:*MEMORY[0x263F857C8]];
    v91[7] = v61;
    v15 = (void *)MEMORY[0x263F33808];
    v59 = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(@"dewpoint");
    v60 = WFLocalizedContentPropertyNameMarker(@"Dewpoint");
    v58 = [v15 block:v59 name:v60 class:objc_opt_class()];
    v57 = [v58 measurementUnitType:v8];
    v91[8] = v57;
    v16 = (void *)MEMORY[0x263F33808];
    v56 = WFLocalizedContentPropertyNameMarker(@"Humidity");
    v55 = [v16 keyPath:@"humidity" name:v56 class:objc_opt_class()];
    v91[9] = v55;
    v17 = (void *)MEMORY[0x263F33808];
    v54 = WFLocalizedContentPropertyNameMarker(@"Pressure");
    v53 = [v17 keyPath:@"pressure" name:v54 class:objc_opt_class()];
    v52 = [v53 measurementUnitType:*MEMORY[0x263F857E0]];
    v91[10] = v52;
    v18 = (void *)MEMORY[0x263F33808];
    v51 = WFLocalizedContentPropertyNameMarker(@"Precipitation Amount");
    v50 = [v18 keyPath:@"precipitationAmount" name:v51 class:objc_opt_class()];
    v49 = [v50 measurementUnitType:v14];
    v91[11] = v49;
    v19 = (void *)MEMORY[0x263F33808];
    v48 = WFLocalizedContentPropertyNameMarker(@"Precipitation Chance");
    v47 = [v19 keyPath:@"precipitationChance" name:v48 class:objc_opt_class()];
    v91[12] = v47;
    v20 = (void *)MEMORY[0x263F33808];
    v46 = WFLocalizedContentPropertyNameMarker(@"Wind Speed");
    v45 = [v20 keyPath:@"windSpeed" name:v46 class:objc_opt_class()];
    v44 = [v45 measurementUnitType:*MEMORY[0x263F857E8]];
    v91[13] = v44;
    v21 = (void *)MEMORY[0x263F33808];
    v43 = WFLocalizedContentPropertyNameMarker(@"Wind Direction");
    v42 = [v21 keyPath:@"windDirection" name:v43 class:objc_opt_class()];
    v91[14] = v42;
    v22 = (void *)MEMORY[0x263F33808];
    v41 = WFLocalizedContentPropertyNameMarker(@"UV Index");
    v40 = [v22 keyPath:@"uvIndex" name:v41 class:objc_opt_class()];
    v91[15] = v40;
    v23 = (void *)MEMORY[0x263F33808];
    v39 = WFLocalizedContentPropertyNameMarker(@"Sunrise Time");
    v38 = [v23 keyPath:@"sunriseTime" name:v39 class:objc_opt_class()];
    v91[16] = v38;
    v24 = (void *)MEMORY[0x263F33808];
    v25 = WFLocalizedContentPropertyNameMarker(@"Sunset Time");
    v26 = [v24 keyPath:@"sunsetTime" name:v25 class:objc_opt_class()];
    v91[17] = v26;
    v27 = (void *)MEMORY[0x263F33808];
    v28 = WFLocalizedContentPropertyNameMarker(@"Air Quality Index");
    v29 = [v27 keyPath:@"localizedAirQualityIndex" name:v28 class:objc_opt_class()];
    v91[18] = v29;
    v30 = (void *)MEMORY[0x263F33808];
    v31 = WFLocalizedContentPropertyNameMarker(@"Air Quality Category");
    v32 = [v30 keyPath:@"localizedAirQualityCategory" name:v31 class:objc_opt_class()];
    v91[19] = v32;
    v33 = (void *)MEMORY[0x263F33808];
    v34 = WFLocalizedContentPropertyNameMarker(@"Air Pollutants");
    v35 = [v33 keyPath:@"pollutants" name:v34 class:objc_opt_class()];
    v36 = [v35 multipleValues:1];
    v91[20] = v36;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:21];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id __44__WFWeatherDataContentItem_propertyBuilders__block_invoke(void *a1)
{
  id v1 = a1;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__WFWeatherDataContentItem_propertyBuilders__block_invoke_2;
  aBlock[3] = &unk_264E5E428;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = _Block_copy(aBlock);

  return v3;
}

void __44__WFWeatherDataContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a4;
  id v9 = [a2 valueForKeyPath:v5];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v9;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  objc_msgSend(v8, "setWf_preferredValueRounding:", &unk_26F076548);
  v6[2](v6, v8);
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Weather Conditions");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Weather Conditions (Plural)", @"Weather Conditions");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Weather Conditions (Single)", @"Weather Conditions");
  uint64_t v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = *MEMORY[0x263F33A28];
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)outputTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [MEMORY[0x263F33910] typeWithClassName:@"CLLocation" frameworkName:@"CoreLocation" location:0];
  uint64_t v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  id v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

@end