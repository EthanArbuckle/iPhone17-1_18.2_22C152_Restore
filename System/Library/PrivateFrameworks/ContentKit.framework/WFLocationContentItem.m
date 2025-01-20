@interface WFLocationContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
+ (id)stringConversionBehavior;
+ (int64_t)tableTemplateSubjectType;
- (BOOL)getListAltText:(id)a3;
- (BOOL)getListSubtitle:(id)a3;
- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4;
- (BOOL)includesFileRepresentationInSerializedItem;
- (BOOL)loadsListSubtitleAsynchronously;
- (BOOL)loadsListThumbnailAsynchronously;
- (CLPlacemark)placemark;
- (WFFileType)preferredFileType;
- (unint64_t)preferredDisplayStyle;
- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5;
- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5;
- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 completionHandler:(id)a5;
- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 named:(id)a5 withCompletionHandler:(id)a6;
@end

@implementation WFLocationContentItem

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)loadsListSubtitleAsynchronously
{
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__WFLocationContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_264288760;
    id v11 = v7;
    -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:completionHandler:](self, "getMKMapSnapshotImageForSize:scale:completionHandler:", v10, width, height, 1.0);
  }
  return 1;
}

uint64_t __66__WFLocationContentItem_ChooseFromList__getListThumbnail_forSize___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)getListAltText:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = [(WFContentItem *)self objectForClass:objc_opt_class()];
  v6 = [v5 localizedLabel];
  uint64_t v7 = [v6 length];
  uint64_t v8 = v7;
  if (v4 && v7) {
    v4[2](v4, v6);
  }

  return v8 != 0;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__WFLocationContentItem_ChooseFromList__getListSubtitle___block_invoke;
    v7[3] = &unk_26428A790;
    id v8 = v4;
    [(WFContentItem *)self getObjectRepresentation:v7 forClass:objc_opt_class()];
  }
  return 1;
}

void __57__WFLocationContentItem_ChooseFromList__getListSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 addressString];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (int64_t)tableTemplateSubjectType
{
  return 2;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Locations");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Locations", @"Locations");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Location (singular)", @"Location");
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
  id v4 = +[WFObjectType typeWithClassName:@"MKMapItem" frameworkName:@"MapKit" location:2];
  v5 = +[WFObjectType typeWithClass:objc_opt_class()];
  v6 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
  uint64_t v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v8 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, 0);

  return v8;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = +[WFObjectType typeWithClassName:@"CLPlacemark" frameworkName:@"CoreLocation" location:0];
  v5 = +[WFObjectType typeWithClassName:@"CLLocation" frameworkName:@"CoreLocation" location:0];
  v6 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, 0);

  return v6;
}

+ (id)stringConversionBehavior
{
  v2 = WFLocalizedString(@"Full Street Address");
  id v3 = +[WFContentItemStringConversionBehavior coercingToStringWithDescription:v2];

  return v3;
}

+ (id)propertyBuilders
{
  v35[11] = *MEMORY[0x263EF8340];
  v34 = WFLocalizedContentPropertyNameMarker(@"Latitude");
  v33 = +[WFContentPropertyBuilder block:&__block_literal_global_174 name:v34 class:objc_opt_class()];
  v35[0] = v33;
  v32 = WFLocalizedContentPropertyNameMarker(@"Longitude");
  v31 = +[WFContentPropertyBuilder block:&__block_literal_global_183_23694 name:v32 class:objc_opt_class()];
  v35[1] = v31;
  v30 = WFLocalizedContentPropertyNameMarker(@"Altitude");
  v29 = +[WFContentPropertyBuilder block:&__block_literal_global_188 name:v30 class:objc_opt_class()];
  v35[2] = v29;
  v28 = WFLocalizedContentPropertyNameMarker(@"Street");
  v27 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:v28 class:objc_opt_class()];
  v26 = [v27 userInfo:@"street"];
  v35[3] = v26;
  v25 = WFLocalizedContentPropertyNameMarker(@"City");
  v24 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:v25 class:objc_opt_class()];
  v23 = [v24 userInfo:@"city"];
  v35[4] = v23;
  v22 = WFLocalizedContentPropertyNameMarker(@"State");
  v21 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:v22 class:objc_opt_class()];
  v20 = [v21 userInfo:@"state"];
  v35[5] = v20;
  v19 = WFLocalizedContentPropertyNameMarker(@"ZIP Code");
  v18 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:v19 class:objc_opt_class()];
  v17 = [v18 userInfo:@"postalCode"];
  v35[6] = v17;
  v16 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:@"Country" class:objc_opt_class()];
  v15 = [v16 userInfo:@"country"];
  v14 = WFLocalizedContentPropertyNameMarker(@"Region");
  v2 = [v15 displayName:v14];
  v35[7] = v2;
  id v3 = WFLocalizedContentPropertyNameMarker(@"Phone Number");
  id v4 = +[WFContentPropertyBuilder block:&__block_literal_global_227 name:v3 class:objc_opt_class()];
  v35[8] = v4;
  v5 = WFLocalizedContentPropertyNameMarker(@"Label");
  v6 = +[WFContentPropertyBuilder block:&__block_literal_global_23690 name:v5 class:objc_opt_class()];
  uint64_t v7 = [v6 userInfo:@"localizedLabel"];
  id v8 = +[WFContentProperty possibleLabelsForClass:objc_opt_class() localized:1];
  v9 = [v7 possibleValues:v8];
  v35[9] = v9;
  v10 = WFLocalizedContentPropertyNameMarker(@"URL");
  id v11 = +[WFContentPropertyBuilder block:&__block_literal_global_241 name:v10 class:objc_opt_class()];
  v35[10] = v11;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:11];

  return v13;
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_11(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_12;
  v8[3] = &unk_26428A740;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:getMKMapItemClass_23716()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 url];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_10;
  v8[3] = &unk_26428A740;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:getMKMapItemClass_23716()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = [a2 phoneNumber];
  id v3 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_8;
  v8[3] = &unk_26428A718;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:getCLLocationClass_23762()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = NSNumber;
  [a2 altitude];
  objc_msgSend(v3, "numberWithDouble:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_6;
  v8[3] = &unk_26428A718;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:getCLLocationClass_23762()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = NSString;
  [a2 coordinate];
  objc_msgSend(v3, "stringWithFormat:", @"%0.16g", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_4;
  v8[3] = &unk_26428A718;
  id v9 = v5;
  id v6 = v5;
  id v7 = a2;
  [v7 getObjectRepresentation:v8 forClass:getCLLocationClass_23762()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = NSString;
  [a2 coordinate];
  objc_msgSend(v3, "stringWithFormat:", @"%0.16g", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__WFLocationContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_26428A6F0;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v7;
  id v10 = a2;
  [v10 getObjectRepresentation:v11 forClass:objc_opt_class()];
}

void __41__WFLocationContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [a2 valueForKey:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (unint64_t)preferredDisplayStyle
{
  return 1;
}

- (BOOL)includesFileRepresentationInSerializedItem
{
  return 1;
}

- (WFFileType)preferredFileType
{
  return (WFFileType *)[MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
}

- (void)generateFileRepresentation:(id)a3 options:(id)a4 forType:(id)a5
{
  id v21 = a5;
  uint64_t v7 = *MEMORY[0x263F1DC08];
  id v8 = a3;
  if ([v21 conformsToUTType:v7])
  {
    id v9 = [MEMORY[0x263F85258] currentDevice];
    [v9 screenScale];
    double v11 = v10;

    id v12 = [MEMORY[0x263F85258] currentDevice];
    [v12 screenBounds];
    double v14 = v13;

    if (v14 > 500.0) {
      double v14 = 500.0;
    }
    v15 = +[WFApplicationContext sharedContext];
    v16 = [v15 currentUserInterfaceType];

    if ([v16 isEqualToString:@"Watch"])
    {
      double v14 = 250.0;
      double v11 = 2.0;
    }
    v17 = NSString;
    v18 = WFLocalizedString(@"Map of %@");
    v19 = [(WFContentItem *)self name];
    uint64_t v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);

    -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:named:withCompletionHandler:](self, "getMKMapSnapshotImageForSize:scale:named:withCompletionHandler:", v20, v8, v14, v14, v11);
    id v8 = (id)v20;
  }
  else
  {
    v16 = [(id)objc_opt_class() badCoercionErrorForType:v21];
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v16);
  }
}

- (void)generateObjectRepresentations:(id)a3 options:(id)a4 forClass:(Class)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((Class)objc_opt_class() == a5)
  {
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke;
    v43[3] = &unk_26428A718;
    id v44 = v8;
    [(WFContentItem *)self getObjectRepresentation:v43 forClass:getCLLocationClass_23762()];
    id v12 = v44;
  }
  else
  {
    double v10 = NSStringFromClass(a5);
    int v11 = [@"CLLocation" isEqualToString:v10];

    if (!v11)
    {
      double v13 = NSStringFromClass(a5);
      int v14 = [@"CLPlacemark" isEqualToString:v13];

      if (v14)
      {
        v15 = [(WFContentItem *)self internalRepresentationType];
        if ([v15 conformsToClass:objc_opt_class()])
        {
          id v16 = [(WFContentItem *)self objectForClass:objc_opt_class()];
          getCLGeocoderClass();
          v17 = objc_opt_new();
          v18 = [v16 addressString];
          v39[0] = MEMORY[0x263EF8330];
          v39[1] = 3221225472;
          v39[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_4;
          v39[3] = &unk_26428AF18;
          v19 = &v40;
          id v40 = v8;
          [v17 geocodeAddressString:v18 completionHandler:v39];
        }
        else
        {
          v22 = [(WFContentItem *)self objectForClass:getCLLocationClass_23762()];
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_5;
          v36[3] = &unk_26428A6F0;
          v19 = &v38;
          v37 = v22;
          id v38 = v8;
          id v16 = v22;
          [(WFContentItem *)self getObjectRepresentation:v36 forClass:objc_opt_class()];
          v17 = v37;
        }
      }
      else
      {
        if ((Class)objc_opt_class() == a5)
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_6;
          v34[3] = &unk_26428A790;
          id v35 = v8;
          [(WFContentItem *)self getObjectRepresentation:v34 forClass:objc_opt_class()];
          id v12 = v35;
          goto LABEL_5;
        }
        uint64_t v20 = NSStringFromClass(a5);
        int v21 = [@"MKMapItem" isEqualToString:v20];

        if (v21)
        {
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_7;
          v32[3] = &unk_26428A790;
          id v33 = v8;
          [(WFContentItem *)self getObjectRepresentation:v32 forClass:objc_opt_class()];
          id v12 = v33;
          goto LABEL_5;
        }
        if ((Class)objc_opt_class() != a5)
        {
          if ((Class)objc_opt_class() != a5)
          {
            v23 = [(id)objc_opt_class() badCoercionErrorForObjectClass:a5];
            (*((void (**)(id, void, void *))v8 + 2))(v8, 0, v23);

            goto LABEL_6;
          }
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_10;
          v26[3] = &unk_26428A6F0;
          id v28 = v8;
          id v27 = v9;
          [(WFContentItem *)self getObjectRepresentation:v26 forClass:objc_opt_class()];

          id v12 = v28;
          goto LABEL_5;
        }
        v15 = [(WFContentItem *)self objectForClass:getCLPlacemarkClass()];
        id v16 = [(WFContentItem *)self objectForClass:getCLLocationClass_23762()];
        v24 = [(WFContentItem *)self objectForClass:objc_opt_class()];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_9;
        v29[3] = &unk_26428A7E0;
        id v30 = v24;
        id v31 = v8;
        id v25 = v24;
        +[DCMapsLink createMapsLinkWithPlacemark:v15 location:v16 streetAddress:v25 shiftingLocationIfNecessary:1 completionHandler:v29];
      }
      goto LABEL_6;
    }
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_3;
    v41[3] = &unk_26428A768;
    id v42 = v8;
    [(WFContentItem *)self getObjectRepresentation:v41 forClass:getCLPlacemarkClass()];
    id v12 = v42;
  }
LABEL_5:

LABEL_6:
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    getCLGeocoderClass();
    uint64_t v4 = objc_opt_new();
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_2;
    v5[3] = &unk_26428AF18;
    id v6 = *(id *)(a1 + 32);
    [v4 reverseGeocodeLocation:v3 completionHandler:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v6)
  {
    id v9 = [v6 location];
    double v10 = [v7 name];
    int v11 = +[WFObjectRepresentation object:v9 named:v10];
    v13[0] = v11;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v12, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 16))(v8, 0, a4);
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstObject];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    id v9 = [v5 firstObject];
    double v10 = +[WFObjectRepresentation object:v9];
    v12[0] = v10;
    int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v11, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v8 + 16))(v8, 0, v6);
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_5(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 placemark];
    if (!v5)
    {
      id v6 = objc_alloc((Class)getMKPlacemarkClass_23837());
      [*(id *)(a1 + 32) coordinate];
      double v8 = v7;
      double v10 = v9;
      int v11 = [v4 postalAddress];
      id v5 = objc_msgSend(v6, "initWithCoordinate:postalAddress:", v11, v8, v10);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    double v13 = +[WFObjectRepresentation object:v5];
    v15[0] = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
    (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v14, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_6(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  if (a2)
  {
    double v9 = [a2 addressString];
    double v10 = +[WFObjectRepresentation object:v9 named:v7];
    v12[0] = v10;
    int v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v11, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 16))(v8, 0, a4);
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    double v10 = (void *)getMKLocalSearchRequestClass_softClass_23829;
    uint64_t v27 = getMKLocalSearchRequestClass_softClass_23829;
    if (!getMKLocalSearchRequestClass_softClass_23829)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      int v21 = __getMKLocalSearchRequestClass_block_invoke_23830;
      v22 = &unk_26428AC60;
      v23 = &v24;
      __getMKLocalSearchRequestClass_block_invoke_23830((uint64_t)&v19);
      double v10 = (void *)v25[3];
    }
    int v11 = v10;
    _Block_object_dispose(&v24, 8);
    id v12 = objc_alloc_init(v11);
    double v13 = [v7 addressString];
    [v12 setNaturalLanguageQuery:v13];

    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x2050000000;
    int v14 = (void *)getMKLocalSearchClass_softClass_23831;
    uint64_t v27 = getMKLocalSearchClass_softClass_23831;
    if (!getMKLocalSearchClass_softClass_23831)
    {
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      int v21 = __getMKLocalSearchClass_block_invoke_23832;
      v22 = &unk_26428AC60;
      v23 = &v24;
      __getMKLocalSearchClass_block_invoke_23832((uint64_t)&v19);
      int v14 = (void *)v25[3];
    }
    v15 = v14;
    _Block_object_dispose(&v24, 8);
    id v16 = (void *)[[v15 alloc] initWithRequest:v12];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_8;
    v17[3] = &unk_26428A7B8;
    id v18 = *(id *)(a1 + 32);
    [v16 startWithCompletionHandler:v17];
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_9(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 addressString];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    WFLocalizedStringWithKey(@"Location (default location name)", @"Location");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  uint64_t v9 = *(void *)(a1 + 40);
  double v10 = NSString;
  int v11 = WFLocalizedString(@"Open %@ in Maps");
  id v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v8);
  double v13 = +[WFObjectRepresentation object:v4 named:v12];

  v15[0] = v13;
  int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v14, 0);
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) permissionRequestor];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_11;
    v5[3] = &unk_26428A830;
    id v7 = *(id *)(a1 + 40);
    id v6 = v3;
    [v4 allowContactsAccessWithCompletionHandler:v5];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_12;
    v8[3] = &unk_26428A808;
    id v9 = *(id *)(a1 + 32);
    id v4 = [a2 allContactsWithSortOrder:0 passingTest:v8];
    id v5 = +[WFObjectRepresentation objects:v4];
    (*(void (**)(uint64_t, void *, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v6 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v7 = *(void *)(a1 + 40);
    v6(v7);
  }
}

uint64_t __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_12(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [a2 streetAddresses];
  if ([v3 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(a1 + 32);
          double v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v8), "value", (void)v13);
          LOBYTE(v9) = [v9 isEqual:v10];

          if (v9)
          {
            uint64_t v11 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v11 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 mapItems];
  uint64_t v8 = [v7 count];

  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    double v10 = [v5 mapItems];
    uint64_t v11 = [v10 firstObject];
    id v12 = +[WFObjectRepresentation object:v11];
    v14[0] = v12;
    long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v13, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

void __72__WFLocationContentItem_generateObjectRepresentations_options_forClass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = [v5 firstObject];
    uint64_t v8 = +[WFStreetAddress streetAddressWithPlacemark:v7 label:0];

    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = +[WFObjectRepresentation object:v8];
    v12[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v11, 0);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 completionHandler:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke;
  v11[3] = &unk_26428A6A8;
  CGFloat v13 = width;
  CGFloat v14 = height;
  double v15 = a4;
  id v12 = v9;
  id v10 = v9;
  [(WFContentItem *)self getObjectRepresentation:v11 forClass:getCLLocationClass_23762()];
}

void __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v44[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  id v10 = (void *)getMKMapSnapshotOptionsClass_softClass;
  v43 = (void *)getMKMapSnapshotOptionsClass_softClass;
  if (!getMKMapSnapshotOptionsClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getMKMapSnapshotOptionsClass_block_invoke;
    id v38 = &unk_26428AC60;
    v39 = &v40;
    __getMKMapSnapshotOptionsClass_block_invoke((uint64_t)&v35);
    id v10 = (void *)v41[3];
  }
  uint64_t v11 = v10;
  _Block_object_dispose(&v40, 8);
  id v12 = objc_alloc_init(v11);
  [v7 coordinate];
  double v14 = v13;
  double v16 = v15;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  v17 = (void (*)(double, double, double, double))getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  v43 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
  if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getMKCoordinateRegionMakeWithDistanceSymbolLoc_block_invoke;
    id v38 = &unk_26428AC60;
    v39 = &v40;
    uint64_t v18 = MapKitLibrary_23719();
    uint64_t v19 = dlsym(v18, "MKCoordinateRegionMakeWithDistance");
    *(void *)(v39[1] + 24) = v19;
    getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = *(_UNKNOWN **)(v39[1] + 24);
    v17 = (void (*)(double, double, double, double))v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (!v17)
  {
    id v31 = [MEMORY[0x263F08690] currentHandler];
    v32 = objc_msgSend(NSString, "stringWithUTF8String:", "MKCoordinateRegion WFMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"WFLocationContentItem.m", 42, @"%s", dlerror());

    __break(1u);
  }
  v17(v14, v16, 1500.0, 1500.0);
  objc_msgSend(v12, "setRegion:");
  objc_msgSend(v12, "setSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  [v12 setScale:*(double *)(a1 + 56)];
  id v20 = objc_alloc((Class)getMKMapItemClass_23716());
  id v21 = objc_alloc((Class)getMKPlacemarkClass_23837());
  [v7 coordinate];
  v22 = objc_msgSend(v21, "initWithCoordinate:");
  v23 = (void *)[v20 initWithPlacemark:v22];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  uint64_t v24 = (void *)getMKMapSnapshotCustomFeatureAnnotationClass_softClass;
  v43 = (void *)getMKMapSnapshotCustomFeatureAnnotationClass_softClass;
  if (!getMKMapSnapshotCustomFeatureAnnotationClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getMKMapSnapshotCustomFeatureAnnotationClass_block_invoke;
    id v38 = &unk_26428AC60;
    v39 = &v40;
    __getMKMapSnapshotCustomFeatureAnnotationClass_block_invoke((uint64_t)&v35);
    uint64_t v24 = (void *)v41[3];
  }
  id v25 = v24;
  _Block_object_dispose(&v40, 8);
  uint64_t v26 = [v25 customFeatureAnnotationForMapItem:v23];
  v44[0] = v26;
  uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:1];
  [v12 _setCustomFeatureAnnotations:v27];

  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2050000000;
  id v28 = (void *)getMKMapSnapshotterClass_softClass;
  v43 = (void *)getMKMapSnapshotterClass_softClass;
  if (!getMKMapSnapshotterClass_softClass)
  {
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    v37 = __getMKMapSnapshotterClass_block_invoke;
    id v38 = &unk_26428AC60;
    v39 = &v40;
    __getMKMapSnapshotterClass_block_invoke((uint64_t)&v35);
    id v28 = (void *)v41[3];
  }
  v29 = v28;
  _Block_object_dispose(&v40, 8);
  id v30 = (void *)[[v29 alloc] initWithOptions:v12];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke_2;
  v33[3] = &unk_26428A680;
  id v34 = *(id *)(a1 + 32);
  [v30 startWithCompletionHandler:v33];
}

void __78__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  if (v12)
  {
    id v5 = (objc_class *)MEMORY[0x263F85308];
    id v6 = a3;
    id v7 = [v5 alloc];
    id v8 = [v12 image];
    id v9 = (id)[v7 initWithPlatformImage:v8];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void (**)(uint64_t, void, id))(v10 + 16);
    id v9 = a3;
    v11(v10, 0, v9);
  }
}

- (void)getMKMapSnapshotImageForSize:(CGSize)a3 scale:(double)a4 named:(id)a5 withCompletionHandler:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  id v11 = a5;
  id v12 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __88__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_named_withCompletionHandler___block_invoke;
  v15[3] = &unk_26428A658;
  id v16 = v11;
  id v17 = v12;
  id v13 = v11;
  id v14 = v12;
  -[WFLocationContentItem getMKMapSnapshotImageForSize:scale:completionHandler:](self, "getMKMapSnapshotImageForSize:scale:completionHandler:", v15, width, height, a4);
}

void __88__WFLocationContentItem_getMKMapSnapshotImageForSize_scale_named_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2)
  {
    id v6 = a3;
    id v10 = [a2 PNGRepresentation];
    id v7 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC08]];
    id v8 = +[WFFileRepresentation fileWithData:v10 ofType:v7 proposedFilename:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *, id))(v3 + 16))(v3, v8, v6);
  }
  else
  {
    id v9 = *(void (**)(uint64_t, void))(v3 + 16);
    id v10 = a3;
    v9(v3, 0);
  }
}

- (CLPlacemark)placemark
{
  id CLPlacemarkClass = getCLPlacemarkClass();
  return (CLPlacemark *)[(WFContentItem *)self objectForClass:CLPlacemarkClass];
}

@end