@interface WFFolderContentItem
+ (id)contentCategories;
+ (id)countDescription;
+ (id)localizedPluralTypeDescriptionWithContext:(id)a3;
+ (id)localizedTypeDescriptionWithContext:(id)a3;
+ (id)ownedTypes;
+ (id)propertyBuilders;
- (id)defaultSourceForRepresentation:(id)a3;
@end

@implementation WFFolderContentItem

- (id)defaultSourceForRepresentation:(id)a3
{
  id v4 = objc_alloc(MEMORY[0x263F0F988]);
  v5 = (void *)[v4 initWithBundleIdentifier:*MEMORY[0x263F854E8]];
  v6 = [(WFContentItem *)self cachingIdentifier];
  v7 = +[WFContentAttributionSet attributionSetWithAppDescriptor:v5 disclosureLevel:1 originalItemIdentifier:v6];

  return v7;
}

+ (id)countDescription
{
  return WFLocalizedPluralString(@"%d Folders");
}

+ (id)localizedPluralTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Folders", @"Folders");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)localizedTypeDescriptionWithContext:(id)a3
{
  id v3 = a3;
  id v4 = WFLocalizedStringResourceWithKey(@"Folder", @"Folder");
  v5 = [v3 localize:v4];

  return v5;
}

+ (id)contentCategories
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"Documents";
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)ownedTypes
{
  v2 = (void *)MEMORY[0x263EFF9D8];
  id v3 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DAB0]];
  id v4 = objc_msgSend(v2, "orderedSetWithObjects:", v3, 0);

  return v4;
}

+ (id)propertyBuilders
{
  v10[2] = *MEMORY[0x263EF8340];
  if ((id)objc_opt_class() == a1)
  {
    id v3 = WFLocalizedContentPropertyNameMarker(@"Contents");
    id v4 = +[WFContentPropertyBuilder block:&__block_literal_global_10809 name:v3 class:objc_opt_class()];
    v5 = [v4 multipleValues:1];
    v10[0] = v5;
    v6 = WFLocalizedContentPropertyNameMarker(@"Number of Items");
    v7 = +[WFContentPropertyBuilder block:&__block_literal_global_167 name:v6 class:objc_opt_class()];
    v8 = [v7 multipleValues:0];
    v10[1] = v8;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_165(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__WFFolderContentItem_propertyBuilders__block_invoke_2_168;
  v7[3] = &unk_26428AA60;
  id v8 = v5;
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_2_168(uint64_t a1, void *a2)
{
  id v3 = NSNumber;
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a2;
  id v6 = [v4 defaultManager];
  v7 = [v5 fileURL];

  id v8 = [v7 path];
  v9 = [v6 contentsOfDirectoryAtPath:v8 error:0];
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__WFFolderContentItem_propertyBuilders__block_invoke_2;
  v7[3] = &unk_26428AA60;
  id v8 = v5;
  id v6 = v5;
  [a2 getFileRepresentation:v7 forType:0];
}

void __39__WFFolderContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [WFiCloudFileDownloadOperation alloc];
  id v5 = [v3 fileURL];
  id v6 = [(WFiCloudFileDownloadOperation *)v4 initWithFileURL:v5 retrieveFolderContents:1 progress:0];

  [(WFiCloudFileDownloadOperation *)v6 start];
  [(WFiCloudFileDownloadOperation *)v6 waitUntilFinished];
  v7 = [(WFiCloudFileDownloadOperation *)v6 downloadError];

  if (v7)
  {
    id v8 = getWFFilesLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v3 fileURL];
      id v10 = [(WFiCloudFileDownloadOperation *)v6 downloadError];
      int v13 = 136315650;
      v14 = "+[WFFolderContentItem propertyBuilders]_block_invoke_2";
      __int16 v15 = 2112;
      v16 = v9;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, "%s Could not download contents of directory: %@ with error: %@", (uint8_t *)&v13, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = [(WFiCloudFileDownloadOperation *)v6 downloadedFiles];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
  }
}

@end