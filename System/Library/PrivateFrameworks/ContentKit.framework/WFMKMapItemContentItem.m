@interface WFMKMapItemContentItem
+ (BOOL)supportedTypeMustBeDeterminedByInstance:(id)a3;
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithMapItem:(id)a3 fromQueryLocation:(id)a4 origin:(id)a5 disclosureLevel:(unint64_t)a6;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
- (BOOL)canGenerateRepresentationForType:(id)a3;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)loadsListSubtitleAsynchronously;
- (CLLocation)queryLocation;
- (MKMapItem)mapItem;
- (unint64_t)preferredDisplayStyle;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)setQueryLocation:(id)a3;
@end

@implementation WFMKMapItemContentItem

- (void).cxx_destruct
{
}

- (void)setQueryLocation:(id)a3
{
}

- (CLLocation)queryLocation
{
  return self->_queryLocation;
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

- (BOOL)canGenerateRepresentationForType:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFMKMapItemContentItem *)self mapItem];
    v6 = [v5 url];
    unsigned __int8 v7 = v6 != 0;

LABEL_9:
    goto LABEL_10;
  }
  if ([v4 isEqualToClass:objc_opt_class()])
  {
    v5 = [(WFMKMapItemContentItem *)self mapItem];
    v8 = [v5 phoneNumber];
    if (v8)
    {
      v9 = [(WFMKMapItemContentItem *)self mapItem];
      v10 = [v9 phoneNumber];
      unsigned __int8 v7 = +[WFPhoneNumber stringContainsPhoneNumbers:v10];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }

    goto LABEL_9;
  }
  v12.receiver = self;
  v12.super_class = (Class)WFMKMapItemContentItem;
  unsigned __int8 v7 = [(WFContentItem *)&v12 canGenerateRepresentationForType:v4];
LABEL_10:

  return v7;
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  v44[1] = *MEMORY[0x263EF8340];
  unsigned __int8 v7 = (void (**)(id, void *, id))a3;
  if ((Class)objc_opt_class() != a5)
  {
    if ((Class)objc_opt_class() == a5)
    {
      v10 = [(WFMKMapItemContentItem *)self mapItem];
      v11 = [v10 url];
      objc_super v12 = +[WFObjectRepresentation object:v11];
      v44[0] = v12;
      v13 = (void *)MEMORY[0x263EFF8C0];
      v14 = (void **)v44;
      goto LABEL_8;
    }
    if ((Class)objc_opt_class() == a5)
    {
      v18 = [(WFMKMapItemContentItem *)self mapItem];
      v19 = [v18 phoneNumber];
      id v38 = 0;
      v20 = +[WFPhoneNumber phoneNumbersInString:v19 error:&v38];
      id v21 = v38;

      v22 = +[WFObjectRepresentation objects:v20];
      v7[2](v7, v22, v21);
    }
    else
    {
      v8 = NSStringFromClass(a5);
      int v9 = [@"CLPlacemark" isEqualToString:v8];

      if (v9)
      {
        v10 = [(WFMKMapItemContentItem *)self mapItem];
        v11 = [v10 placemark];
        objc_super v12 = +[WFObjectRepresentation object:v11];
        v43 = v12;
        v13 = (void *)MEMORY[0x263EFF8C0];
        v14 = &v43;
LABEL_8:
        v17 = [v13 arrayWithObjects:v14 count:1];
        v7[2](v7, v17, 0);

LABEL_9:
        goto LABEL_17;
      }
      if ((Class)objc_opt_class() != a5)
      {
        if ((Class)objc_opt_class() != a5)
        {
          v10 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
          v7[2](v7, 0, v10);
          goto LABEL_9;
        }
        v27 = [(WFMKMapItemContentItem *)self mapItem];
        v28 = [v27 placemark];
        v20 = +[WFStreetAddress streetAddressWithPlacemark:v28 label:0];

        v29 = [v20 addressString];
        v30 = [(WFMKMapItemContentItem *)self mapItem];
        v31 = [v30 name];

        if (v31
          && ([v20 street],
              v32 = objc_claimAutoreleasedReturnValue(),
              char v33 = [v32 isEqualToString:v31],
              v32,
              (v33 & 1) == 0))
        {
          id v34 = [NSString stringWithFormat:@"%@\n%@", v31, v29];
        }
        else
        {
          id v34 = v29;
        }
        v35 = v34;
        v36 = +[WFObjectRepresentation object:v34 named:v31];
        v41 = v36;
        v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1];
        v7[2](v7, v37, 0);

LABEL_16:
        goto LABEL_17;
      }
      v23 = [(WFMKMapItemContentItem *)self mapItem];
      v24 = [v23 placemark];
      v20 = +[WFStreetAddress streetAddressWithPlacemark:v24 label:0];

      v22 = [(WFContentItem *)self name];
      v25 = +[WFObjectRepresentation object:v20 named:v22];
      v42 = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:1];
      v7[2](v7, v26, 0);
    }
    goto LABEL_16;
  }
  v15 = [(WFMKMapItemContentItem *)self mapItem];
  v16 = [v15 placemark];

  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __73__WFMKMapItemContentItem_generateObjectRepresentations_options_forClass___block_invoke;
  v39[3] = &unk_26428A7E0;
  v39[4] = self;
  v40 = v7;
  +[DCMapsLink createMapsLinkWithPlacemark:v16 location:0 streetAddress:0 shiftingLocationIfNecessary:0 completionHandler:v39];

LABEL_17:
}

void __73__WFMKMapItemContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 name];
  uint64_t v6 = *(void *)(a1 + 40);
  unsigned __int8 v7 = NSString;
  v8 = WFLocalizedString(@"Open %@ in Maps");
  int v9 = objc_msgSend(v7, "stringWithFormat:", v8, v5);
  v10 = +[WFObjectRepresentation object:v4 named:v9];

  v12[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v11, 0);
}

- (MKMapItem)mapItem
{
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v3 = (void *)getMKMapItemClass_softClass;
  uint64_t v11 = getMKMapItemClass_softClass;
  if (!getMKMapItemClass_softClass)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __getMKMapItemClass_block_invoke;
    v7[3] = &unk_26428AC60;
    v7[4] = &v8;
    __getMKMapItemClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [(WFContentItem *)self objectForClass:v4];
  return (MKMapItem *)v5;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Places");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Places", @"Places");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Place", @"Place");
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
  id v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  v5 = +[WFObjectType typeWithClassName:@"CLPlacemark" frameworkName:@"CoreLocation" location:0];
  uint64_t v6 = +[WFObjectType typeWithClass:objc_opt_class()];
  unsigned __int8 v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  uint64_t v8 = +[WFObjectType typeWithClass:objc_opt_class()];
  int v9 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClassName:@"MKMapItem" frameworkName:@"MapKit" location:2];
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
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
    v7.super_class = (Class)&OBJC_METACLASS___WFMKMapItemContentItem;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_supportedTypeMustBeDeterminedByInstance_, v4);
  }

  return v5;
}

+ (id)itemWithMapItem:(id)a3 fromQueryLocation:(id)a4 origin:(id)a5 disclosureLevel:(unint64_t)a6
{
  id v10 = a4;
  uint64_t v11 = [a1 itemWithObject:a3 origin:a5 disclosureLevel:a6];
  [v11 setQueryLocation:v10];

  return v11;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  unsigned __int8 v5 = [(WFMKMapItemContentItem *)self queryLocation];

  if (v5)
  {
    uint64_t v6 = [(WFMKMapItemContentItem *)self mapItem];
    objc_super v7 = [v6 placemark];
    uint64_t v8 = [v7 location];

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    int v9 = (void *)getMKDistanceFormatterClass_softClass;
    uint64_t v19 = getMKDistanceFormatterClass_softClass;
    if (!getMKDistanceFormatterClass_softClass)
    {
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __getMKDistanceFormatterClass_block_invoke;
      v15[3] = &unk_26428AC60;
      v15[4] = &v16;
      __getMKDistanceFormatterClass_block_invoke((uint64_t)v15);
      int v9 = (void *)v17[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v16, 8);
    id v11 = objc_alloc_init(v10);
    [v11 setUnitStyle:1];
    if (v4)
    {
      objc_super v12 = [(WFMKMapItemContentItem *)self queryLocation];
      [v12 distanceFromLocation:v8];
      v13 = objc_msgSend(v11, "stringFromDistance:");
      v4[2](v4, v13);
    }
  }

  return v5 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __58__WFMKMapItemContentItem_ChooseFromList__getListSubtitle___block_invoke;
    v7[3] = &unk_26428A790;
    id v8 = v4;
    [(WFContentItem *)self getObjectRepresentation:v7 forClass:objc_opt_class()];
  }
  return 1;
}

void __58__WFMKMapItemContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 shortAddressString];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end