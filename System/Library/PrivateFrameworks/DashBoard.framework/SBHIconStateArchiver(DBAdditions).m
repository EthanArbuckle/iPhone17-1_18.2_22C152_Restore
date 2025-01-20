@interface SBHIconStateArchiver(DBAdditions)
+ (id)carKitRepresentationFromRootArchive:()DBAdditions iconModel:;
+ (id)rootArchiveFromCarKitRepresentation:()DBAdditions iconModel:;
@end

@implementation SBHIconStateArchiver(DBAdditions)

+ (id)carKitRepresentationFromRootArchive:()DBAdditions iconModel:
{
  v23[1] = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = objc_opt_new();
  v6 = [v4 rootFolder];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __83__SBHIconStateArchiver_DBAdditions__carKitRepresentationFromRootArchive_iconModel___block_invoke;
  v19[3] = &unk_2649B61D8;
  id v20 = v5;
  id v7 = v5;
  [v6 enumerateAllIconsUsingBlock:v19];

  v23[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  uint64_t v9 = *MEMORY[0x263F31310];
  v22[0] = v8;
  uint64_t v10 = *MEMORY[0x263F31308];
  v21[0] = v9;
  v21[1] = v10;
  uint64_t v11 = [v4 hiddenBundleIdentifiers];
  v12 = (void *)v11;
  uint64_t v13 = MEMORY[0x263EFFA68];
  if (v11) {
    uint64_t v13 = v11;
  }
  v22[1] = v13;
  v21[2] = *MEMORY[0x263F31300];
  v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "showsOEMIcon"));
  v22[2] = v14;
  v21[3] = *MEMORY[0x263F31318];
  v15 = [v4 OEMIconLabel];

  v16 = &stru_26E13A820;
  if (v15) {
    v16 = v15;
  }
  v22[3] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v17;
}

+ (id)rootArchiveFromCarKitRepresentation:()DBAdditions iconModel:
{
  v12[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [a4 iconModelMetadata];
  v11[0] = @"iconLists";
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F31310]];

  v8 = (void *)MEMORY[0x263EFFA68];
  if (v7) {
    v8 = v7;
  }
  v11[1] = @"metadata";
  v12[0] = v8;
  v12[1] = v6;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

@end