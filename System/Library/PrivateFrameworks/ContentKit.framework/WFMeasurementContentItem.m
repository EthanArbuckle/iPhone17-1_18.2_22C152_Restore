@interface WFMeasurementContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)alwaysEncodeUsingWFSerializableContent;
- (NSMeasurement)measurement;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFMeasurementContentItem

+ (int64_t)tableTemplateSubjectType
{
  return 5;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Measurements");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Measurements", @"Measurements");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Measurement", @"Measurement");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Scripting";
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

- (BOOL)alwaysEncodeUsingWFSerializableContent
{
  return 1;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    id v8 = objc_alloc_init(MEMORY[0x263F08988]);
    [v8 setUnitOptions:1];
    v9 = [(WFMeasurementContentItem *)self measurement];
    v10 = objc_msgSend(v9, "wf_preferredValueRounding");

    if (v10)
    {
      v11 = [(WFMeasurementContentItem *)self measurement];
      v12 = objc_msgSend(v11, "wf_preferredValueRounding");
      uint64_t v13 = [v12 integerValue];
      v14 = [v8 numberFormatter];
      [v14 setMaximumFractionDigits:v13];
    }
    v15 = [(WFMeasurementContentItem *)self measurement];
    v16 = [v8 stringFromMeasurement:v15];
    v7 = +[WFObjectRepresentation object:v16];
  }
  else
  {
    if ((Class)objc_opt_class() == a3)
    {
      v17 = NSNumber;
      v18 = [(WFMeasurementContentItem *)self measurement];
      [v18 doubleValue];
      v19 = objc_msgSend(v17, "numberWithDouble:");
      v7 = +[WFObjectRepresentation object:v19];

      goto LABEL_14;
    }
    if ((Class)objc_opt_class() != a3)
    {
      v7 = 0;
      goto LABEL_14;
    }
    v20 = (void *)MEMORY[0x263F087B0];
    v21 = NSNumber;
    v22 = [(WFMeasurementContentItem *)self measurement];
    [v22 doubleValue];
    v23 = objc_msgSend(v21, "numberWithDouble:");
    v24 = v23;
    if (v23)
    {
      [v23 decimalValue];
    }
    else
    {
      v31[0] = 0;
      v31[1] = 0;
      int v32 = 0;
    }
    id v8 = [v20 decimalNumberWithDecimal:v31];

    v25 = [WFQuantityValue alloc];
    v26 = [(WFMeasurementContentItem *)self measurement];
    v27 = [v26 unit];
    v28 = [v27 symbol];
    v29 = [(WFQuantityValue *)v25 initWithMagnitude:v8 unitString:v28];

    v7 = +[WFObjectRepresentation object:v29];
  }
LABEL_14:
  return v7;
}

- (NSMeasurement)measurement
{
  uint64_t v3 = objc_opt_class();
  return (NSMeasurement *)[(WFContentItem *)self objectForClass:v3];
}

@end