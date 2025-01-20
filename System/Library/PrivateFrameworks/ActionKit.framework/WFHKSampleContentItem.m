@interface WFHKSampleContentItem
+ (BOOL)hasLibrary;
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithQuantitySample:(id)a3;
+ (id)itemWithQuantitySample:(id)a3 unit:(id)a4;
+ (id)itemWithQuantitySamples:(id)a3;
+ (id)itemWithQuantitySamples:(id)a3 unit:(id)a4;
+ (id)localizedFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralFilterDescriptionWithContext:(id)a3;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (id)categorySample;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)duration;
- (id)endDate;
- (id)localizedCategorySampleValue;
- (id)quantitySample;
- (id)quantitySampleContainer;
- (id)readableTypeIdentifier;
- (id)sampleValue;
- (id)sourceName;
- (id)startDate;
- (id)unit;
- (unint64_t)preferredDisplayStyle;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFHKSampleContentItem

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F85500]];
  v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  v7 = [v6 resolvedAppMatchingDescriptor:v5];

  v8 = (void *)MEMORY[0x263F337A0];
  v9 = [(WFHKSampleContentItem *)self cachingIdentifier];
  v10 = [v8 attributionSetWithAppDescriptor:v7 disclosureLevel:1 originalItemIdentifier:v9];

  return v10;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFHKSampleContentItem *)self quantitySampleContainer];
    if (v5)
    {
      v6 = [(WFHKSampleContentItem *)self unit];
      unsigned __int8 v7 = v6 != 0;
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
    goto LABEL_9;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v8 = [(WFHKSampleContentItem *)self quantitySampleContainer];

    if (v8)
    {
      v5 = [(WFHKSampleContentItem *)self quantitySampleContainer];
      unsigned __int8 v7 = [v5 hasSubsamples];
LABEL_9:

      goto LABEL_10;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)WFHKSampleContentItem;
  unsigned __int8 v7 = [(WFHKSampleContentItem *)&v10 canGenerateRepresentationForType:v4];
LABEL_10:

  return v7;
}

- (unint64_t)preferredDisplayStyle
{
  return 2;
}

- (BOOL)getListAltText:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F08790];
    v5 = (void (**)(id, void *))a3;
    id v6 = objc_alloc_init(v4);
    [v6 setDoesRelativeDateFormatting:1];
    [v6 setDateStyle:1];
    [v6 setTimeStyle:1];
    unsigned __int8 v7 = [(WFHKSampleContentItem *)self quantitySample];
    v8 = [v7 startDate];
    v9 = [v6 stringFromDate:v8];
    v5[2](v5, v9);
  }
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  v5 = (void (**)(id, void *, void))a3;
  id v6 = [(WFHKSampleContentItem *)self quantitySample];
  unsigned __int8 v7 = [v6 quantityType];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    objc_super v10 = [(WFHKSampleContentItem *)self categorySample];
    id v9 = [v10 categoryType];
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v11 = (void *)getHKDisplayTypeControllerClass_softClass_12071;
  uint64_t v29 = getHKDisplayTypeControllerClass_softClass_12071;
  if (!getHKDisplayTypeControllerClass_softClass_12071)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __getHKDisplayTypeControllerClass_block_invoke_12072;
    v25[3] = &unk_264E5EC88;
    v25[4] = &v26;
    __getHKDisplayTypeControllerClass_block_invoke_12072((uint64_t)v25);
    v11 = (void *)v27[3];
  }
  id v12 = v11;
  _Block_object_dispose(&v26, 8);
  v13 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
  v14 = [v12 sharedInstanceForHealthStore:v13];
  v15 = [v14 displayTypeForObjectTypeUnifyingBloodPressureTypes:v9];

  id v16 = objc_alloc(MEMORY[0x263F851A8]);
  v17 = [v15 displayCategory];
  v18 = [v17 color];
  v19 = (void *)[v16 initWithPlatformColor:v18];

  id v20 = objc_alloc(MEMORY[0x263F85308]);
  v21 = [v15 listIcon];
  v22 = (void *)[v20 initWithPlatformImage:v21];
  v23 = [v22 imageWithTintColor:v19];

  if (v23) {
    v5[2](v5, v23, 0);
  }

  return v23 != 0;
}

- (id)sourceName
{
  v2 = [(WFHKSampleContentItem *)self quantitySample];
  v3 = [v2 sourceRevision];
  id v4 = [v3 source];

  v5 = [v4 name];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@" " withString:@" "];

  return v6;
}

- (id)duration
{
  v3 = [(WFHKSampleContentItem *)self endDate];
  id v4 = [(WFHKSampleContentItem *)self startDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  unsigned __int8 v7 = (void *)[objc_alloc(MEMORY[0x263F339A8]) initWithTimeInterval:224 allowedUnits:0 unitsStyle:1 zeroFormattingBehavior:v6];
  return v7;
}

- (id)endDate
{
  v3 = [(WFHKSampleContentItem *)self quantitySample];
  if (v3) {
    [(WFHKSampleContentItem *)self quantitySample];
  }
  else {
  id v4 = [(WFHKSampleContentItem *)self categorySample];
  }
  double v5 = [v4 endDate];

  return v5;
}

- (id)startDate
{
  v3 = [(WFHKSampleContentItem *)self quantitySample];
  if (v3) {
    [(WFHKSampleContentItem *)self quantitySample];
  }
  else {
  id v4 = [(WFHKSampleContentItem *)self categorySample];
  }
  double v5 = [v4 startDate];

  return v5;
}

- (id)categorySample
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHKSampleContentItem *)self objectForClass:v3];
}

- (id)unit
{
  v2 = [(WFHKSampleContentItem *)self quantitySampleContainer];
  uint64_t v3 = [v2 unit];

  return v3;
}

- (id)localizedCategorySampleValue
{
  v2 = [(WFHKSampleContentItem *)self categorySample];
  uint64_t v3 = [v2 categoryType];
  id v4 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09240]];

  if (v3 == v4)
  {
    double v5 = +[WFHealthKitHelper readableAppleStandingHourFromEnum:](WFHealthKitHelper, "readableAppleStandingHourFromEnum:", [v2 value]);
  }
  else
  {
    double v5 = 0;
  }
  double v6 = [v2 categoryType];
  unsigned __int8 v7 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09278]];

  if (v6 == v7)
  {
    uint64_t v8 = +[WFHealthKitHelper readableCervicalMucusQualityFromEnum:](WFHealthKitHelper, "readableCervicalMucusQualityFromEnum:", [v2 value]);

    double v5 = (void *)v8;
  }
  id v9 = [v2 categoryType];
  objc_super v10 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09380]];

  if (v9 == v10)
  {
    uint64_t v11 = +[WFHealthKitHelper readableMenstrualFlowFromEnum:](WFHealthKitHelper, "readableMenstrualFlowFromEnum:", [v2 value]);

    double v5 = (void *)v11;
  }
  id v12 = [v2 categoryType];
  v13 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093A8]];

  if (v12 == v13)
  {
    uint64_t v14 = +[WFHealthKitHelper readableOvulationTestResultFromEnum:](WFHealthKitHelper, "readableOvulationTestResultFromEnum:", [v2 value]);

    double v5 = (void *)v14;
  }
  v15 = [v2 categoryType];
  id v16 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09410]];

  if (v15 == v16)
  {
    uint64_t v21 = +[WFHealthKitHelper readableSleepAnalysisFromEnum:](WFHealthKitHelper, "readableSleepAnalysisFromEnum:", [v2 value]);
LABEL_25:
    v34 = (__CFString *)v21;

    goto LABEL_26;
  }
  v17 = [v2 categoryType];
  v18 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F093F0]];

  if (v17 == v18)
  {
    v19 = [v2 metadata];
    id v20 = [v19 objectForKeyedSubscript:*MEMORY[0x263F09AD8]];

    if (v20) {
      +[WFHealthKitHelper readableSexualActivityFromBool:](WFHealthKitHelper, "readableSexualActivityFromBool:", [v20 BOOLValue]);
    }
    else {
    uint64_t v22 = WFLocalizedString(@"Unspecified");
    }

    double v5 = (void *)v22;
  }
  v23 = [v2 categoryType];
  v24 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09238]];

  if (v23 == v24)
  {
    uint64_t v21 = +[WFHealthKitHelper readableAppetiteChangesValueFromEnum:](WFHealthKitHelper, "readableAppetiteChangesValueFromEnum:", [v2 value]);
    goto LABEL_25;
  }
  v25 = [v2 categoryType];
  uint64_t v26 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09390]];
  if (v25 == (void *)v26)
  {

    goto LABEL_24;
  }
  v27 = (void *)v26;
  uint64_t v28 = [v2 categoryType];
  uint64_t v29 = [MEMORY[0x263F0A158] categoryTypeForIdentifier:*MEMORY[0x263F09420]];

  if (v28 == v29)
  {
LABEL_24:
    uint64_t v21 = +[WFHealthKitHelper readablePresenceValueFromEnum:](WFHealthKitHelper, "readablePresenceValueFromEnum:", [v2 value]);
    goto LABEL_25;
  }
  v30 = WFHealthKitSymptomsTypeIdentifiers();
  v31 = [v2 categoryType];
  v32 = [v31 identifier];
  int v33 = [v30 containsObject:v32];

  if (v33)
  {
    uint64_t v21 = +[WFHealthKitHelper readableSeverityValueFromEnum:](WFHealthKitHelper, "readableSeverityValueFromEnum:", [v2 value]);
    goto LABEL_25;
  }
  if (v5)
  {
    uint64_t v21 = WFLocalizedParameterValue(v5);
    goto LABEL_25;
  }
  v34 = &stru_26F008428;
LABEL_26:

  return v34;
}

- (id)sampleValue
{
  uint64_t v3 = [(WFHKSampleContentItem *)self quantitySampleContainer];

  if (v3)
  {
    id v4 = [(WFHKSampleContentItem *)self unit];

    if (v4)
    {
      double v5 = [(WFHKSampleContentItem *)self quantitySample];
      double v6 = [(WFHKSampleContentItem *)self quantitySample];

      if (v6)
      {
        unsigned __int8 v7 = NSNumber;
        uint64_t v8 = [v5 quantity];
        id v9 = [(WFHKSampleContentItem *)self unit];
        objc_msgSend(v8, "wf_normalizedDoubleValueForUnit:", v9);
        objc_super v10 = objc_msgSend(v7, "numberWithDouble:");
        uint64_t v11 = [v10 stringValue];

        goto LABEL_8;
      }
    }
    uint64_t v11 = &stru_26F008428;
  }
  else
  {
    uint64_t v11 = [(WFHKSampleContentItem *)self localizedCategorySampleValue];
  }
LABEL_8:
  return v11;
}

- (id)readableTypeIdentifier
{
  uint64_t v3 = [(WFHKSampleContentItem *)self quantitySample];
  if (v3)
  {
    id v4 = [(WFHKSampleContentItem *)self quantitySample];
    [v4 quantityType];
  }
  else
  {
    id v4 = [(WFHKSampleContentItem *)self categorySample];
    [v4 categoryType];
  double v5 = };
  double v6 = [v5 identifier];

  unsigned __int8 v7 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v6];

  return v7;
}

- (id)quantitySample
{
  v2 = [(WFHKSampleContentItem *)self quantitySampleContainer];
  uint64_t v3 = [v2 quantitySample];

  return v3;
}

- (id)quantitySampleContainer
{
  uint64_t v3 = objc_opt_class();
  return (id)[(WFHKSampleContentItem *)self objectForClass:v3];
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v36[1] = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = (void (**)(id, void *, void))a3;
  if ((Class)objc_opt_class() == a5)
  {
    uint64_t v8 = objc_opt_new();
    id v9 = [(WFHKSampleContentItem *)self quantitySample];
    objc_super v10 = [v9 startDate];

    uint64_t v11 = [(WFHKSampleContentItem *)self quantitySample];
    id v12 = [v11 endDate];

    if ([v10 isEqualToDate:v12])
    {
      v13 = (void *)MEMORY[0x263F33908];
      uint64_t v14 = @"Sample Date";
      v15 = v10;
    }
    else
    {
      if (v10)
      {
        id v20 = [MEMORY[0x263F33908] object:v10 named:@"Sample Start Date"];
        [v8 addObject:v20];
      }
      if (!v12) {
        goto LABEL_14;
      }
      v13 = (void *)MEMORY[0x263F33908];
      uint64_t v14 = @"Sample End Date";
      v15 = v12;
    }
    uint64_t v21 = [v13 object:v15 named:v14];
    [v8 addObject:v21];

LABEL_14:
    uint64_t v22 = (void *)[v8 copy];
    v7[2](v7, v22, 0);

    goto LABEL_16;
  }
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() != a5)
    {
      if ((Class)objc_opt_class() == a5)
      {
        uint64_t v28 = (void *)MEMORY[0x263F33908];
        uint64_t v29 = [WFConcreteStatisticsSampleProvider alloc];
        uint64_t v8 = [(WFHKSampleContentItem *)self quantitySampleContainer];
        v30 = [(WFConcreteStatisticsSampleProvider *)v29 initWithSampleProvider:v8];
        v31 = [(WFHKSampleContentItem *)self name];
        v32 = [v28 object:v30 named:v31];
        v34 = v32;
        int v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
        v7[2](v7, v33, 0);
      }
      else
      {
        uint64_t v8 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
        ((void (**)(id, void *, void *))v7)[2](v7, 0, v8);
      }
      goto LABEL_17;
    }
    v23 = (void *)MEMORY[0x263F33908];
    v24 = NSNumber;
    uint64_t v8 = [(WFHKSampleContentItem *)self quantitySample];
    objc_super v10 = [v8 quantity];
    id v12 = [(WFHKSampleContentItem *)self unit];
    objc_msgSend(v10, "wf_normalizedDoubleValueForUnit:", v12);
    v25 = objc_msgSend(v24, "numberWithDouble:");
    uint64_t v26 = [v23 object:v25];
    v35 = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
    v7[2](v7, v27, 0);

LABEL_16:
LABEL_17:

    goto LABEL_18;
  }
  id v16 = (void *)MEMORY[0x263F33908];
  v17 = [(WFHKSampleContentItem *)self sampleValue];
  v18 = [v16 object:v17];
  v36[0] = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  v7[2](v7, v19, 0);

LABEL_18:
}

+ (BOOL)hasLibrary
{
  return 1;
}

+ (id)localizedPluralFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Health Samples", @"Health Samples");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedFilterDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Health Sample", @"Health Sample");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Health samples");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Health samples", @"Health samples");
  double v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Health sample", @"Health sample");
  double v5 = [v3 localize:v4];

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
  id v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  double v5 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  double v6 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  unsigned __int8 v7 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  id v4 = [MEMORY[0x263F33910] typeWithClass:objc_opt_class()];
  double v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToClass:objc_opt_class()] & 1) != 0
    || ([v4 isEqualToClass:objc_opt_class()] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (void)runQuery:(id)a3 withItems:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v11 count])
  {
    uint64_t v14 = +[WFHealthKitHelper extractHKDataFromContentQuery:v10];
    uint64_t v15 = [v14 startDate];
    if (v15)
    {
      id v16 = (void *)v15;
      uint64_t v17 = [v14 endDate];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [v14 sampleType];

        if (v19)
        {
          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke;
          aBlock[3] = &unk_264E575A0;
          id v20 = v14;
          id v37 = v20;
          id v40 = v13;
          id v38 = v10;
          id v39 = v12;
          id v41 = a1;
          uint64_t v21 = _Block_copy(aBlock);
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x3032000000;
          v34[3] = __Block_byref_object_copy__12107;
          v34[4] = __Block_byref_object_dispose__12108;
          id v35 = 0;
          uint64_t v22 = dispatch_group_create();
          v23 = [v20 sourceName];

          if (v23)
          {
            dispatch_group_enter(v22);
            v24 = [v20 sourceName];
            v25 = [v20 sampleType];
            v31[0] = MEMORY[0x263EF8330];
            v31[1] = 3221225472;
            v31[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_501;
            v31[3] = &unk_264E575C8;
            int v33 = v34;
            v32 = v22;
            +[WFHealthKitHelper sourcesWithName:v24 ofSampleType:v25 completion:v31];
          }
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2_503;
          block[3] = &unk_264E5EDC8;
          id v29 = v21;
          v30 = v34;
          id v26 = v21;
          dispatch_group_notify(v22, MEMORY[0x263EF83A0], block);

          _Block_object_dispose(v34, 8);
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
      }
    }
    if (v13) {
      (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    }
    goto LABEL_12;
  }
  v27.receiver = a1;
  v27.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
  objc_msgSendSuper2(&v27, sel_runQuery_withItems_permissionRequestor_completionHandler_, v10, v11, v12, v13);
LABEL_13:
}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263EFF980];
  unsigned __int8 v5 = (void *)MEMORY[0x263F0A668];
  double v6 = [*(id *)(a1 + 32) startDate];
  objc_super v7 = [*(id *)(a1 + 32) endDate];
  uint64_t v8 = [v5 predicateForSamplesWithStartDate:v6 endDate:v7 options:0];
  id v9 = [v4 arrayWithObject:v8];

  unint64_t v10 = 0x263F08000;
  if (v3)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v12 = v3;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v35;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [MEMORY[0x263F0A668] predicateForObjectsFromSource:*(void *)(*((void *)&v34 + 1) + 8 * v16)];
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v14);
    }

    unint64_t v10 = 0x263F08000uLL;
    v18 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v11];
    [v9 addObject:v18];
  }
  v19 = *(void **)(v10 + 1840);
  id v20 = (void *)[v9 copy];
  uint64_t v21 = [v19 andPredicateWithSubpredicates:v20];

  id v22 = objc_alloc(MEMORY[0x263F0A6E0]);
  v23 = [*(id *)(a1 + 32) sampleType];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2;
  v28[3] = &unk_264E57578;
  id v32 = *(id *)(a1 + 56);
  id v29 = *(id *)(a1 + 32);
  id v30 = *(id *)(a1 + 40);
  id v24 = *(id *)(a1 + 48);
  uint64_t v25 = *(void *)(a1 + 64);
  id v31 = v24;
  uint64_t v33 = v25;
  id v26 = (void *)[v22 initWithSampleType:v23 predicate:v21 limit:0 sortDescriptors:0 resultsHandler:v28];

  objc_super v27 = objc_msgSend(MEMORY[0x263F0A410], "wf_shortcutsAppHealthStore");
  [v27 executeQuery:v26];
}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_501(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2_503(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v8 = [*(id *)(a1 + 32) quantityType];

    if (v8)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_3;
      v15[3] = &unk_264E57530;
      id v16 = *(id *)(a1 + 40);
      id v9 = objc_msgSend(v6, "if_map:", v15);
    }
    else
    {
      id v9 = objc_msgSend(v6, "if_map:", &__block_literal_global_12115);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    v14.receiver = *(id *)(a1 + 64);
    v14.super_class = (Class)&OBJC_METACLASS___WFHKSampleContentItem;
    objc_msgSendSuper2(&v14, sel_runQuery_withItems_permissionRequestor_completionHandler_, v11, v9, v12, v13);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v7);
    }
  }
}

id __82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 userInfo];
  unsigned __int8 v5 = [v4 objectForKey:@"WFHKSampleContentItemQueryUnit"];
  id v6 = +[WFHKSampleContentItem itemWithQuantitySample:v3 unit:v5];

  return v6;
}

WFHKSampleContentItem *__82__WFHKSampleContentItem_runQuery_withItems_permissionRequestor_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[WFContentItem itemWithObject:a2];
}

+ (id)stringConversionBehavior
{
  v2 = (void *)MEMORY[0x263F337E0];
  id v3 = [a1 propertyForName:@"Value"];
  id v4 = [v2 accessingProperty:v3];

  return v4;
}

+ (id)propertyBuilders
{
  v37[7] = *MEMORY[0x263EF8340];
  long long v35 = +[WFHealthKitHelper localizedSampleTypes];
  v2 = (void *)MEMORY[0x263F33808];
  long long v36 = WFLocalizedContentPropertyNameMarker(@"Type");
  long long v34 = [v2 keyPath:@"readableTypeIdentifier" name:v36 class:objc_opt_class()];
  uint64_t v33 = [v34 primary:1];
  id v32 = [v33 possibleValues:v35];
  id v31 = [v32 sortable:0];
  id v30 = [v31 filterable:0];
  v37[0] = v30;
  id v3 = (void *)MEMORY[0x263F33808];
  id v29 = WFLocalizedContentPropertyNameMarker(@"Value");
  uint64_t v28 = [v3 keyPath:@"sampleValue" name:v29 class:objc_opt_class()];
  v37[1] = v28;
  id v4 = (void *)MEMORY[0x263F33808];
  objc_super v27 = WFLocalizedContentPropertyNameMarker(@"Unit");
  id v26 = [v4 keyPath:@"unit.unitString" name:v27 class:objc_opt_class()];
  uint64_t v25 = [v26 sortable:0];
  id v24 = [v25 filterable:0];
  v37[2] = v24;
  unsigned __int8 v5 = (void *)MEMORY[0x263F33808];
  v23 = WFLocalizedContentPropertyNameMarker(@"Start Date");
  id v22 = [v5 keyPath:@"startDate" name:v23 class:objc_opt_class()];
  uint64_t v21 = [v22 tense:1];
  id v6 = [v21 comparableUnits:8220];
  v37[3] = v6;
  id v7 = (void *)MEMORY[0x263F33808];
  uint64_t v8 = WFLocalizedContentPropertyNameMarker(@"End Date");
  id v9 = [v7 keyPath:@"endDate" name:v8 class:objc_opt_class()];
  uint64_t v10 = [v9 comparableUnits:8220];
  v37[4] = v10;
  uint64_t v11 = (void *)MEMORY[0x263F33808];
  uint64_t v12 = WFLocalizedContentPropertyNameMarker(@"Duration");
  uint64_t v13 = [v11 keyPath:@"duration" name:v12 class:objc_opt_class()];
  objc_super v14 = [v13 timeUnits:224];
  v37[5] = v14;
  uint64_t v15 = (void *)MEMORY[0x263F33808];
  id v16 = WFLocalizedContentPropertyNameMarker(@"Source");
  uint64_t v17 = [v15 keyPath:@"sourceName" name:v16 class:objc_opt_class()];
  v18 = [v17 possibleValues:MEMORY[0x263EFFA68]];
  v37[6] = v18;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:7];

  return v20;
}

+ (id)itemWithQuantitySamples:(id)a3 unit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[WFHKQuantitySampleContainer alloc] initWithSubsamples:v6 unit:v5];

  uint64_t v8 = +[WFContentItem itemWithObject:v7];

  return v8;
}

+ (id)itemWithQuantitySamples:(id)a3
{
  return (id)[a1 itemWithQuantitySamples:a3 unit:0];
}

+ (id)itemWithQuantitySample:(id)a3 unit:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[WFHKQuantitySampleContainer alloc] initWithSample:v6 unit:v5];

  uint64_t v8 = +[WFContentItem itemWithObject:v7];

  return v8;
}

+ (id)itemWithQuantitySample:(id)a3
{
  return (id)[a1 itemWithQuantitySample:a3 unit:0];
}

@end