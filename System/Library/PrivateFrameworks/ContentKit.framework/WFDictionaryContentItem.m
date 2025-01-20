@interface WFDictionaryContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemsWithJSONFileRepresentation:(id)a3 attributionSet:(id)a4;
+ (id)itemsWithPlistFileRepresentation:(id)a3 attributionSet:(id)a4;
+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 attributionSet:(id)a5;
+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 topLevelName:(id)a5 attributionSet:(id)a6;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (NSDictionary)dictionary;
- (WFFileType)preferredFileType;
- (id)allowedClassesForDecodingInternalRepresentations;
- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5;
- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5;
@end

@implementation WFDictionaryContentItem

- (id)allowedClassesForDecodingInternalRepresentations
{
  v4[8] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  return v2;
}

- (id)generateFileRepresentationForType:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/x-www-form-urlencoded"];
  int v9 = [v7 conformsToType:v8];

  if (v9)
  {
    v10 = [(WFDictionaryContentItem *)self dictionary];
    v11 = [v10 allKeys];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __75__WFDictionaryContentItem_generateFileRepresentationForType_options_error___block_invoke;
    v26[3] = &unk_264285F78;
    id v27 = v10;
    id v12 = v10;
    v13 = objc_msgSend(v11, "if_map:", v26);

    v14 = WFHTTPBodyFromQueryItems(v13);
    v15 = [(WFContentItem *)self name];
    v16 = +[WFFileRepresentation fileWithData:v14 ofType:v7 proposedFilename:v15];

LABEL_11:
    goto LABEL_12;
  }
  v17 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/json"];
  int v18 = [v7 conformsToType:v17];

  if (v18)
  {
    v19 = (void *)MEMORY[0x263F08900];
    v20 = [(WFDictionaryContentItem *)self dictionary];
    v21 = WFJavaScriptRepresentationFromPropertyList(v20, 0);
    v22 = WFJSONSerializable(v21);
    id v12 = [v19 dataWithJSONObject:v22 options:0 error:a5];

    goto LABEL_8;
  }
  if (([v7 conformsToString:@"com.apple.property-list"] & 1) != 0
    || [v7 conformsToString:@"com.apple.plist"])
  {
    v23 = (void *)MEMORY[0x263F08AC0];
    v20 = [(WFDictionaryContentItem *)self dictionary];
    v21 = WFPlistSerializable(v20);
    id v12 = [v23 dataWithPropertyList:v21 format:100 options:0 error:a5];
LABEL_8:

    if (v12)
    {
      v24 = [(WFContentItem *)self name];
      v16 = +[WFFileRepresentation fileWithData:v12 ofType:v7 proposedFilename:v24];
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

id __75__WFDictionaryContentItem_generateFileRepresentationForType_options_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08BD0];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 objectForKey:v4];
  v6 = [v2 queryItemWithName:v4 value:v5];

  return v6;
}

- (id)generateObjectRepresentationForClass:(Class)a3 options:(id)a4 error:(id *)a5
{
  if ((Class)objc_opt_class() == a3)
  {
    int v9 = [(WFContentItem *)self internalRepresentationType];
    v10 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/x-www-form-urlencoded"];
    int v11 = [v9 conformsToType:v10];

    if (v11)
    {
      id v12 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/x-www-form-urlencoded"];
      id v13 = [(WFContentItem *)self fileRepresentationForType:v12];

      id v14 = [NSString alloc];
      v15 = [v13 data];
      v16 = (void *)[v14 initWithData:v15 encoding:4];

      v17 = objc_msgSend(NSURL, "dc_queryItemsFromQueryString:", v16);
      int v18 = [[WFOrderedDictionary alloc] initWithQueryItems:v17];
      v8 = +[WFObjectRepresentation object:v18];

LABEL_26:
      goto LABEL_27;
    }
    v23 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/json"];
    int v24 = [v9 conformsToType:v23];

    if (v24)
    {
      v25 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/json"];
      id v13 = [(WFContentItem *)self fileRepresentationForType:v25];

      v26 = (void *)MEMORY[0x263F08900];
      id v27 = [v13 data];
      v28 = [v26 JSONObjectWithData:v27 options:0 error:a5];
      v16 = WFPropertyListRepresentationFromJSON(v28);

      if (v16)
      {
LABEL_13:
        v8 = +[WFObjectRepresentation object:v16];
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      if (([v9 conformsToString:@"com.apple.property-list"] & 1) == 0
        && ![v9 conformsToString:@"com.apple.plist"])
      {
        v8 = 0;
        goto LABEL_29;
      }
      v29 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.property-list"];
      v30 = [(WFContentItem *)self fileRepresentationForType:v29];
      v31 = v30;
      if (v30)
      {
        id v13 = v30;
      }
      else
      {
        v38 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.plist"];
        id v13 = [(WFContentItem *)self fileRepresentationForType:v38];
      }
      v39 = (void *)MEMORY[0x263F08AC0];
      v40 = [v13 data];
      v16 = [v39 propertyListWithData:v40 options:0 format:0 error:a5];

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_13;
      }
    }
    v8 = 0;
    goto LABEL_27;
  }
  if ((Class)objc_opt_class() != a3)
  {
    v8 = 0;
    goto LABEL_30;
  }
  int v9 = [(WFDictionaryContentItem *)self preferredFileType];
  if (([v9 conformsToString:@"com.apple.property-list"] & 1) != 0
    || [v9 conformsToString:@"com.apple.plist"])
  {
    v19 = [(WFDictionaryContentItem *)self dictionary];
    WFPlistSerializable(v19);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v20 = (void *)MEMORY[0x263F08AC0];
      v21 = [(WFDictionaryContentItem *)self dictionary];
      v22 = WFPlistSerializable(v21);
      v16 = [v20 dataWithPropertyList:v22 format:100 options:0 error:a5];

      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v32 = [(WFDictionaryContentItem *)self dictionary];
    v33 = WFJavaScriptRepresentationFromPropertyList(v32, 0);
    WFJSONSerializable(v33);
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      uint64_t v34 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:0 error:a5];
      if (!v34)
      {
LABEL_24:
        v17 = [v13 description];
        v8 = +[WFObjectRepresentation object:v17];
        v16 = 0;
        goto LABEL_26;
      }
      v16 = (void *)v34;
LABEL_21:
      uint64_t v35 = [[NSString alloc] initWithData:v16 encoding:4];
      if (v35)
      {
        v17 = (void *)v35;
        v8 = +[WFObjectRepresentation object:v35];
      }
      else
      {
        v36 = [v13 description];
        v8 = +[WFObjectRepresentation object:v36];

        v17 = 0;
      }
      goto LABEL_26;
    }
  }
  v8 = 0;
LABEL_28:

LABEL_29:
LABEL_30:
  return v8;
}

- (WFFileType)preferredFileType
{
  v3 = [(WFDictionaryContentItem *)self dictionary];
  id v4 = objc_msgSend(v3, "wf_preferredFileType");
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFDictionaryContentItem;
    id v6 = [(WFContentItem *)&v9 preferredFileType];
  }
  id v7 = v6;

  return (WFFileType *)v7;
}

- (NSDictionary)dictionary
{
  v3 = +[WFObjectType typeWithClass:objc_opt_class()];
  id v4 = [(WFContentItem *)self getRepresentationsForType:v3 error:0];
  v5 = [v4 firstObject];
  id v6 = [v5 object];

  return (NSDictionary *)v6;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Dictionaries");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Dictionaries", @"Dictionaries");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Dictionary", @"Dictionary");
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
  id v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/json"];
  id v4 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/x-www-form-urlencoded"];
  v5 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.plist"];
  id v6 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.property-list"];
  id v7 = +[WFObjectType typeWithClass:objc_opt_class()];
  v8 = objc_msgSend(v2, "orderedSetWithObjects:", v3, v4, v5, v6, v7, 0);

  return v8;
}

+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 topLevelName:(id)a5 attributionSet:(id)a6
{
  if (a3)
  {
    id v9 = a6;
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = objc_opt_new();
    WFAddDictionaryObjectToItemArray(v12, v13, v11, v10, v9);
  }
  else
  {
    id v13 = (void *)MEMORY[0x263EFFA68];
  }
  return v13;
}

+ (id)itemsWithPropertyListObject:(id)a3 preferredDictionaryType:(id)a4 attributionSet:(id)a5
{
  return (id)[a1 itemsWithPropertyListObject:a3 preferredDictionaryType:a4 topLevelName:0 attributionSet:a5];
}

+ (id)itemsWithPlistFileRepresentation:(id)a3 attributionSet:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 inputStream];
  [v8 open];
  id v9 = [MEMORY[0x263F08AC0] propertyListWithStream:v8 options:0 format:0 error:0];
  [v8 close];
  id v10 = [MEMORY[0x263F852B8] typeWithString:@"com.apple.property-list"];
  id v11 = [v7 wfName];

  id v12 = [a1 itemsWithPropertyListObject:v9 preferredDictionaryType:v10 topLevelName:v11 attributionSet:v6];

  return v12;
}

+ (id)itemsWithJSONFileRepresentation:(id)a3 attributionSet:(id)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 inputStream];
  [v8 open];
  id v9 = [MEMORY[0x263F08900] JSONObjectWithStream:v8 options:4 error:0];
  [v8 close];
  if (v9)
  {
    id v10 = [MEMORY[0x263F852B8] typeFromMIMEType:@"application/json"];
    id v11 = [v7 wfName];

    id v12 = [a1 itemsWithPropertyListObject:v9 preferredDictionaryType:v10 topLevelName:v11 attributionSet:v6];
  }
  else
  {
    id v13 = [v7 fileURL];
    id v14 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DC20]];
    v15 = [v7 wfName];

    v16 = +[WFFileRepresentation fileWithURL:v13 options:5 ofType:v14 proposedFilename:v15];

    v17 = +[WFContentItem itemWithFile:v16 attributionSet:v6];

    v19[0] = v17;
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  }
  return v12;
}

+ (id)propertyBuilders
{
  v10[2] = *MEMORY[0x263EF8340];
  v2 = WFLocalizedContentPropertyNameMarker(@"Keys");
  id v3 = +[WFContentPropertyBuilder block:&__block_literal_global_1606 name:v2 class:objc_opt_class()];
  id v4 = [v3 multipleValues:1];
  v10[0] = v4;
  v5 = WFLocalizedContentPropertyNameMarker(@"Values");
  id v6 = +[WFContentPropertyBuilder block:&__block_literal_global_16_1608 name:v5 class:objc_opt_class()];
  id v7 = [v6 multipleValues:1];
  v10[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

void __43__WFDictionaryContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  v17 = a4;
  id v6 = [v5 preferredFileType];
  id v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [v5 dictionary];
  id v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v15 = [v5 attributionSet];
        v16 = +[WFDictionaryContentItem itemsWithPropertyListObject:v14 preferredDictionaryType:v6 attributionSet:v15];
        [v7 addObjectsFromArray:v16];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v17[2](v17, v7);
}

void __43__WFDictionaryContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void (**a4)(void, void))
{
  id v6 = a4;
  id v8 = [a2 dictionary];
  id v7 = [v8 allKeys];
  ((void (**)(void, void *))a4)[2](v6, v7);
}

@end