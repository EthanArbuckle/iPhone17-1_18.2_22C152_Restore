@interface NSDictionary(AuthKit)
- (__CFString)_ak_truncateTokenString:()AuthKit;
- (id)_ak_shortenServiceIdentifier:()AuthKit;
- (id)_ak_truncateTokenDict:()AuthKit;
- (id)ak_dictionaryWithKeysFromArray:()AuthKit;
- (id)ak_redactedCopy;
@end

@implementation NSDictionary(AuthKit)

- (id)ak_dictionaryWithKeysFromArray:()AuthKit
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(a1, "objectForKeyedSubscript:", v11, (void)v15);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v13 = (void *)[v5 copy];

  return v13;
}

- (id)_ak_shortenServiceIdentifier:()AuthKit
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 stringByReplacingOccurrencesOfString:@"com.apple.gs." withString:@"(cag)."];
  }
  else
  {
    id v4 = v3;
  }
  v5 = v4;

  return v5;
}

- (__CFString)_ak_truncateTokenString:()AuthKit
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v3 length] >= 0x11)
  {
    id v4 = [v3 substringToIndex:4];
    v5 = objc_msgSend(v3, "substringFromIndex:", objc_msgSend(v3, "length") - 4);
    id v6 = [NSString stringWithFormat:@"%@...%@", v4, v5];
  }
  else
  {
    uint64_t v7 = @"(******)";
    if (!v3) {
      uint64_t v7 = @"(null)";
    }
    id v6 = v7;
  }

  return v6;
}

- (id)_ak_truncateTokenDict:()AuthKit
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __47__NSDictionary_AuthKit___ak_truncateTokenDict___block_invoke;
  v13 = &unk_1E575F840;
  uint64_t v14 = a1;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

- (id)ak_redactedCopy
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__NSDictionary_AuthKit__ak_redactedCopy__block_invoke;
  v3[3] = &unk_1E575F868;
  v3[4] = a1;
  v1 = objc_msgSend(a1, "aaf_map:", v3);

  return v1;
}

@end