@interface WFPhotoItemProviderContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)itemWithItemProviderItem:(id)a3 photoMediaFileRepresentation:(id)a4 assetIdentifier:(id)a5;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)outputTypes;
- (id)defaultSourceForRepresentation:(id)a3;
- (id)outputTypes;
@end

@implementation WFPhotoItemProviderContentItem

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Photos");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Photos app media (plural)", @"Photos app media");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Photos app media (singular)", @"Photos app media");
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
  id v3 = +[WFObjectType typeWithClassName:@"PHAsset" frameworkName:@"Photos" location:0];
  v4 = [v2 orderedSetWithObject:v3];

  return v4;
}

+ (id)itemWithItemProviderItem:(id)a3 photoMediaFileRepresentation:(id)a4 assetIdentifier:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[WFPhotoMediaContentItem itemWithAssetIdentifier:v10 assetFile:v9];
  if (v11)
  {
    v12 = [v8 itemProvider];
    v13 = [a1 itemWithObject:v12 named:0];

    v14 = [v8 contentName];
    [v13 setContentName:v14];

    v15 = [v11 asset];
    v16 = +[WFObjectRepresentation object:v15];
    v27 = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v18 = (void *)getPHAssetClass_softClass_17203;
    uint64_t v25 = getPHAssetClass_softClass_17203;
    if (!getPHAssetClass_softClass_17203)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getPHAssetClass_block_invoke_17204;
      v29 = &unk_26428AC60;
      v30 = &v22;
      __getPHAssetClass_block_invoke_17204((uint64_t)buf);
      v18 = (void *)v23[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v13, "setObjectRepresentations:forClass:", v17, v19, v22);

    v26 = v11;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
    [v13 setSubItems:v20 forClass:objc_opt_class()];
  }
  else
  {
    v20 = getWFContentGraphLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFPhotoItemProviderContentItem itemWithItemProviderItem:photoMediaFileRepresentation:assetIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_216505000, v20, OS_LOG_TYPE_FAULT, "%s Failed to create photo asset with share sheet asset identifier %@", buf, 0x16u);
    }
    v13 = 0;
  }

  return v13;
}

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F85558]];
  v6 = [MEMORY[0x263F0F9B0] sharedResolver];
  v7 = [v6 resolvedAppMatchingDescriptor:v5];

  id v8 = [(WFContentItem *)self cachingIdentifier];
  id v9 = +[WFContentAttributionSet attributionSetWithAppDescriptor:v7 disclosureLevel:1 originalItemIdentifier:v8];

  return v9;
}

- (id)outputTypes
{
  v2 = [(id)objc_opt_class() outputTypes];
  id v3 = (void *)[v2 mutableCopy];

  id v4 = +[WFObjectType typeWithClass:objc_opt_class()];
  [v3 addObject:v4];

  return v3;
}

@end