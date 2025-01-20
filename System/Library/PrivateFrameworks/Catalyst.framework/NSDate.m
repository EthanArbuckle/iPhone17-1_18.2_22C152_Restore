@interface NSDate
@end

@implementation NSDate

void __55__NSDate_CATInternetDateAndTime__cat_RFC3339Formatters__block_invoke()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v1 = [&unk_26C4B5E68 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = *(void *)v11;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v11 != v3) {
          objc_enumerationMutation(&unk_26C4B5E68);
        }
        uint64_t v5 = *(void *)(*((void *)&v10 + 1) + 8 * v4);
        id v6 = objc_alloc_init(MEMORY[0x263F08790]);
        v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
        [v6 setLocale:v7];

        [v6 setDateFormat:v5];
        [v0 addObject:v6];

        ++v4;
      }
      while (v2 != v4);
      uint64_t v2 = [&unk_26C4B5E68 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v2);
  }
  uint64_t v8 = [v0 copy];
  v9 = (void *)cat_RFC3339Formatters_RFC3339DateFormatters;
  cat_RFC3339Formatters_RFC3339DateFormatters = v8;
}

@end