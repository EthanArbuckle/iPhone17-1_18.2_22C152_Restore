@interface NSDictionary(PocketAdditions)
+ (id)pkt_dictionaryByParsingURLEncodedFormString:()PocketAdditions;
- (uint64_t)pkt_URLEncodedFormString;
@end

@implementation NSDictionary(PocketAdditions)

- (uint64_t)pkt_URLEncodedFormString
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(a1, "allKeys"), "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = (id)[a1 allKeys];
  uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v8 = (void *)[a1 objectForKey:v7];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = [v8 stringValue];
          }
          else {
            uint64_t v9 = [v8 description];
          }
          v8 = (void *)v9;
        }
        [v2 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@=%@", +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", v7), +[PocketAPIOperation encodeForURL:](PocketAPIOperation, "encodeForURL:", v8))];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  return [v2 componentsJoinedByString:@"&"];
}

+ (id)pkt_dictionaryByParsingURLEncodedFormString:()PocketAdditions
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = (void *)[a3 componentsSeparatedByString:@"&"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)[*(id *)(*((void *)&v12 + 1) + 8 * v9) componentsSeparatedByString:@"="];
        if ([v10 count] == 2) {
          objc_msgSend(v4, "setObject:forKey:", +[PocketAPIOperation decodeForURL:](PocketAPIOperation, "decodeForURL:", objc_msgSend(v10, "objectAtIndex:", 1)), +[PocketAPIOperation decodeForURL:](PocketAPIOperation, "decodeForURL:", objc_msgSend(v10, "objectAtIndex:", 0)));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return (id)[v4 copy];
}

@end