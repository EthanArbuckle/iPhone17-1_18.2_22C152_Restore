@interface WFDCMapsLinkContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)includesFileRepresentationInSerializedItem;
- (NSDictionary)additionalRepresentationsForSerialization;
- (id)mapsLink;
- (unint64_t)preferredDisplayStyle;
- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5;
@end

@implementation WFDCMapsLinkContentItem

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

- (void)generateObjectRepresentation:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v8 = (void (**)(id, void *, void *, void))a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v17 = [(WFDCMapsLinkContentItem *)self mapsLink];
    v18 = [v17 mapsAppURL];
    v19 = WFLocalizedString(@"Apple Maps URL");
    v8[2](v8, v18, v19, 0);

LABEL_9:
    goto LABEL_26;
  }
  v10 = NSStringFromClass(a5);
  int v11 = [@"MKMapItem" isEqualToString:v10];

  if (!v11)
  {
    v17 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
    ((void (**)(id, void *, void *, void *))v8)[2](v8, 0, 0, v17);
    goto LABEL_9;
  }
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  v12 = (void *)getMKLocalSearchRequestClass_softClass;
  uint64_t v46 = getMKLocalSearchRequestClass_softClass;
  if (!getMKLocalSearchRequestClass_softClass)
  {
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __getMKLocalSearchRequestClass_block_invoke;
    v41 = &unk_26428AC60;
    v42 = &v43;
    __getMKLocalSearchRequestClass_block_invoke((uint64_t)&v38);
    v12 = (void *)v44[3];
  }
  v13 = v12;
  _Block_object_dispose(&v43, 8);
  id v14 = objc_alloc_init(v13);
  v15 = [(WFDCMapsLinkContentItem *)self mapsLink];
  v16 = [v15 centerLocation];
  if (v16)
  {
    [v14 setNaturalLanguageQuery:v16];
  }
  else
  {
    v20 = [(WFDCMapsLinkContentItem *)self mapsLink];
    v21 = [v20 searchLocation];
    if (v21)
    {
      [v14 setNaturalLanguageQuery:v21];
    }
    else
    {
      v34 = [(WFDCMapsLinkContentItem *)self mapsLink];
      v22 = [v34 destinationAddress];
      if (v22)
      {
        [v14 setNaturalLanguageQuery:v22];
        v23 = v34;
      }
      else
      {
        v33 = [(WFDCMapsLinkContentItem *)self mapsLink];
        v24 = [v33 startAddress];
        if (v24)
        {
          [v14 setNaturalLanguageQuery:v24];
          v23 = v34;
        }
        else
        {
          v32 = [(WFDCMapsLinkContentItem *)self mapsLink];
          v25 = [v32 searchNearQuery];
          if (v25)
          {
            [v14 setNaturalLanguageQuery:v25];
          }
          else
          {
            v31 = [(WFDCMapsLinkContentItem *)self mapsLink];
            v26 = [v31 searchQuery];
            [v14 setNaturalLanguageQuery:v26];
          }
          v23 = v34;

          v24 = 0;
        }

        v22 = 0;
      }
    }
  }

  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x2050000000;
  v27 = (void *)getMKLocalSearchClass_softClass;
  uint64_t v46 = getMKLocalSearchClass_softClass;
  if (!getMKLocalSearchClass_softClass)
  {
    uint64_t v38 = MEMORY[0x263EF8330];
    uint64_t v39 = 3221225472;
    v40 = __getMKLocalSearchClass_block_invoke;
    v41 = &unk_26428AC60;
    v42 = &v43;
    __getMKLocalSearchClass_block_invoke((uint64_t)&v38);
    v27 = (void *)v44[3];
  }
  v28 = v27;
  _Block_object_dispose(&v43, 8);
  v29 = (void *)[[v28 alloc] initWithRequest:v14];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __73__WFDCMapsLinkContentItem_generateObjectRepresentation_options_forClass___block_invoke;
  v35[3] = &unk_2642886C8;
  id v36 = v14;
  v37 = v8;
  id v30 = v14;
  [v29 startWithCompletionHandler:v35];

LABEL_26:
}

void __73__WFDCMapsLinkContentItem_generateObjectRepresentation_options_forClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v26[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = [v5 mapItems];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    v10 = [v5 mapItems];
    int v11 = [v10 firstObject];
    (*(void (**)(uint64_t, void *, void, void))(v9 + 16))(v9, v11, 0, 0);
  }
  else
  {
    v12 = [v6 domain];
    v13 = getMKErrorDomain();
    if ([v12 isEqualToString:v13])
    {
      uint64_t v14 = [v6 code];

      if (v14 == 4)
      {
        v15 = (void *)MEMORY[0x263F087E8];
        v16 = getMKErrorDomain();
        uint64_t v24 = *MEMORY[0x263F08338];
        v17 = WFLocalizedString(@"Location Not Found");
        v26[0] = v17;
        uint64_t v25 = *MEMORY[0x263F08320];
        v18 = NSString;
        v19 = WFLocalizedString(@"The location (“%@”) could not be found using Maps local search.");
        v20 = [*(id *)(a1 + 32) naturalLanguageQuery];
        v21 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v20, v24, v25, v17);
        v26[1] = v21;
        v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v24 count:2];
        uint64_t v23 = [v15 errorWithDomain:v16 code:4 userInfo:v22];

        id v6 = (id)v23;
      }
    }
    else
    {
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)mapsLink
{
  uint64_t v3 = objc_opt_class();
  return [(WFContentItem *)self objectForClass:v3];
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 0;
}

- (NSDictionary)additionalRepresentationsForSerialization
{
  uint64_t v3 = objc_opt_new();
  v4 = [(WFDCMapsLinkContentItem *)self mapsLink];
  id v5 = [v4 mapsAppURL];
  id v6 = [(id)*MEMORY[0x263F1DD08] identifier];
  [v3 setObject:v5 forKey:v6];

  v9.receiver = self;
  v9.super_class = (Class)WFDCMapsLinkContentItem;
  v7 = [(WFContentItem *)&v9 additionalRepresentationsForSerialization];
  [v3 addEntriesFromDictionary:v7];

  return (NSDictionary *)v3;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Maps links");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Maps links", @"Maps links");
  id v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Maps link", @"Maps link");
  id v5 = [v3 localize:v4];

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
  v4 = +[WFObjectType typeWithClassName:@"MKMapItem" frameworkName:@"MapKit" location:2];
  id v5 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, 0);

  return v5;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

@end