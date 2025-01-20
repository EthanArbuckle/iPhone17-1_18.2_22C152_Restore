@interface AAUIQuotaResponse
- (NSArray)iCloudMediaUsage;
@end

@implementation AAUIQuotaResponse

- (NSArray)iCloudMediaUsage
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  [(AAQuotaInfoResponse *)self usage];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v9 = [v8 objectForKey:@"media_key"];
        v10 = [v8 objectForKey:@"usage_in_bytes"];
        [v10 floatValue];
        int v12 = v11;

        v13 = (void *)MEMORY[0x263F825C8];
        v14 = [v8 objectForKey:@"display_color"];
        v15 = objc_msgSend(v13, "aaui_colorWithHexString:", v14);

        v16 = [v8 objectForKey:@"display_label"];
        v17 = [AAUIiCloudMediaUsageInfo alloc];
        LODWORD(v18) = v12;
        v19 = [(AAUIiCloudMediaUsageInfo *)v17 initWithMediaType:v9 representativeColor:v15 bytesUsed:v18];
        [(AAUIiCloudMediaUsageInfo *)v19 setDisplayLabel:v16];
        [v3 addObject:v19];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  v20 = (void *)[v3 copy];

  return (NSArray *)v20;
}

@end