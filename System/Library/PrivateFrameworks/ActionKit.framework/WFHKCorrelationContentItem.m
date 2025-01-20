@interface WFHKCorrelationContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (id)correlation;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFHKCorrelationContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Blood pressures");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Blood pressures", @"Blood pressures");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Blood pressure", @"Blood pressure");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  return (id)MEMORY[0x263EFFA68];
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

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void *, void))a3;
  v8 = objc_opt_new();
  v9 = [(WFHKCorrelationContentItem *)self correlation];
  v10 = [v9 objects];
  if ((Class)objc_opt_class() == a5)
  {
    v12 = [v10 allObjects];
    v13 = [v12 valueForKey:@"startDate"];
    v14 = [v13 sortedArrayUsingSelector:sel_compare_];
    v11 = [v14 firstObject];

    v15 = [v10 allObjects];
    v16 = [v15 valueForKey:@"endDate"];
    v17 = [v16 sortedArrayUsingSelector:sel_compare_];
    v18 = [v17 lastObject];

    if ([v11 isEqualToDate:v18])
    {
      v19 = (void *)MEMORY[0x263F33908];
      v20 = WFLocalizedString(@"Blood Pressure Date");
      v21 = v19;
      v22 = v11;
    }
    else
    {
      if (v11)
      {
        v42 = (void *)MEMORY[0x263F33908];
        v43 = WFLocalizedString(@"Blood Pressure Start Date");
        v44 = [v42 object:v11 named:v43];
        [v8 addObject:v44];
      }
      if (!v18) {
        goto LABEL_21;
      }
      v45 = (void *)MEMORY[0x263F33908];
      v20 = WFLocalizedString(@"Blood Pressure End Date");
      v21 = v45;
      v22 = v18;
    }
    v46 = [v21 object:v22 named:v20];
    [v8 addObject:v46];

LABEL_21:
    v7[2](v7, v8, 0);

    goto LABEL_22;
  }
  if ((Class)objc_opt_class() != a5)
  {
    v11 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v11);
LABEL_22:

    goto LABEL_23;
  }
  v23 = [v9 correlationType];
  v24 = [v23 identifier];
  int v25 = [v24 isEqualToString:*MEMORY[0x263F094C0]];

  if (v25)
  {
    v48 = v7;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v47 = v10;
    v26 = [v10 allObjects];
    v27 = [v26 objectsMatchingClass:objc_opt_class()];

    id obj = v27;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          v32 = v8;
          if (*(void *)v51 != v30) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v34 = [v33 quantityType];
          v35 = [v34 identifier];
          v36 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v35];

          v37 = NSNumber;
          v38 = [v33 quantity];
          v39 = [MEMORY[0x263F0A830] millimeterOfMercuryUnit];
          [v38 doubleValueForUnit:v39];
          v40 = objc_msgSend(v37, "numberWithDouble:");

          v41 = [MEMORY[0x263F33908] object:v40 named:v36];
          v8 = v32;
          [v32 addObject:v41];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v29);
    }

    v7 = v48;
    v10 = v47;
  }
  v7[2](v7, v8, 0);
LABEL_23:
}

- (id)correlation
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHKCorrelationContentItem *)self objectForClass:v3];
}

@end