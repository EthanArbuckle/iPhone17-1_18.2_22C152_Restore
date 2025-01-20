@interface AAUIiCloudStorageGraphTableCell
- (id)_catagoriesForSpecifer:(id)a3;
- (id)_loadingStringForSpecifier:(id)a3;
- (id)_psCapacityBarDataForSpecifier:(id)a3;
- (void)_setConditionalSpecifier:(id)a3 property:(id)a4 forKey:(id)a5;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation AAUIiCloudStorageGraphTableCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v5, OS_LOG_TYPE_DEFAULT, "Refreshing AAUIiCloudStorageGraphTableCell", buf, 2u);
  }

  v6 = [(AAUIiCloudStorageGraphTableCell *)self _loadingStringForSpecifier:v4];
  [v4 setProperty:v6 forKey:*MEMORY[0x263F5FF98]];

  v7 = [(AAUIiCloudStorageGraphTableCell *)self _psCapacityBarDataForSpecifier:v4];
  [v4 setProperty:v7 forKey:*MEMORY[0x263F5FF80]];

  [v4 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FFC8]];
  v8 = [v4 name];
  [v4 setProperty:v8 forKey:*MEMORY[0x263F602D0]];

  v9 = [v4 propertyForKey:@"AAUIiCloudGraphBarBackgroundColor"];
  if (v9)
  {
    [(AAUIiCloudStorageGraphTableCell *)self _setConditionalSpecifier:v4 property:v9 forKey:*MEMORY[0x263F5FF78]];
    v10 = [MEMORY[0x263F825C8] systemMidGrayColor];
    [(AAUIiCloudStorageGraphTableCell *)self _setConditionalSpecifier:v4 property:v10 forKey:*MEMORY[0x263F5FF90]];

    v11 = [MEMORY[0x263F825C8] whiteColor];
    [(AAUIiCloudStorageGraphTableCell *)self _setConditionalSpecifier:v4 property:v11 forKey:*MEMORY[0x263F5FFD0]];

    [(AAUIiCloudStorageGraphTableCell *)self _setConditionalSpecifier:v4 property:v9 forKey:*MEMORY[0x263F5FFB0]];
  }
  v12.receiver = self;
  v12.super_class = (Class)AAUIiCloudStorageGraphTableCell;
  [(PSCapacityBarCell *)&v12 refreshCellContentsWithSpecifier:v4];
}

- (id)_loadingStringForSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 propertyForKey:@"AAUIiCloudLoadingRequest"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"LOADING";
LABEL_5:
    v11 = [v6 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];

    goto LABEL_7;
  }
  v9 = [v3 propertyForKey:@"AAUIiCloudQuotaFailedToLoad"];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v7 = v6;
    v8 = @"UNABLE_TO_LOAD_CLOUD_STORAGE";
    goto LABEL_5;
  }
  v11 = @" ";
LABEL_7:

  return v11;
}

- (void)_setConditionalSpecifier:(id)a3 property:(id)a4 forKey:(id)a5
{
  id v10 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v10 propertyForKey:v8];

  if (!v9) {
    [v10 setProperty:v7 forKey:v8];
  }
}

- (id)_psCapacityBarDataForSpecifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F5FB20]);
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 propertyForKey:@"AAUIiCloudUsedBytes"];
    id v8 = [v4 propertyForKey:@"AAUIiCloudGraphQuotaTotal"];
    int v13 = 138412546;
    v14 = v7;
    __int16 v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "iCloud Storage - bytes used: %@ of total: %@", (uint8_t *)&v13, 0x16u);
  }
  v9 = [v4 propertyForKey:@"AAUIiCloudGraphQuotaTotal"];
  objc_msgSend(v5, "setCapacity:", objc_msgSend(v9, "longLongValue"));

  id v10 = [v4 propertyForKey:@"AAUIiCloudUsedBytes"];
  objc_msgSend(v5, "setBytesUsed:", objc_msgSend(v10, "longLongValue"));

  v11 = [(AAUIiCloudStorageGraphTableCell *)self _catagoriesForSpecifer:v4];
  [v5 setCategories:v11];

  return v5;
}

- (id)_catagoriesForSpecifer:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = [v3 propertyForKey:@"AAUIiCloudGraphUsage"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) capacityBarCatagory];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  v11 = (void *)[v4 copy];

  return v11;
}

@end