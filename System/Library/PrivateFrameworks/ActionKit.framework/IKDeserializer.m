@interface IKDeserializer
+ (BOOL)token:(id *)a3 andTokenSecret:(id *)a4 fromQlineString:(id)a5;
+ (id)_URLForKey:(id)a3 inDictionary:(id)a4;
+ (id)_dateForKey:(id)a3 inDictionary:(id)a4;
+ (id)_normalizedObjectForKey:(id)a3 inDictionary:(id)a4;
+ (id)objectFromJSONString:(id)a3;
@end

@implementation IKDeserializer

+ (id)_dateForKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4 = [a1 _normalizedObjectForKey:a3 inDictionary:a4];
  if (!v4) {
    return 0;
  }
  v5 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  double v6 = (double)(unint64_t)[v5 unsignedIntegerValue];
  v7 = (void *)MEMORY[0x263EFF910];
  return (id)[v7 dateWithTimeIntervalSince1970:v6];
}

+ (id)_URLForKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4 = [a1 _normalizedObjectForKey:a3 inDictionary:a4];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  double v6 = NSURL;
  return (id)[v6 URLWithString:v5];
}

+ (id)_normalizedObjectForKey:(id)a3 inDictionary:(id)a4
{
  uint64_t v4 = (void *)[a4 objectForKey:a3];
  if (v4 == (void *)[MEMORY[0x263EFF9D0] null]) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (id)objectFromJSONString:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 dataUsingEncoding:4];
  uint64_t v5 = (void *)[MEMORY[0x263F08900] JSONObjectWithData:v4 options:0 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NSClassFromString(&cfstr_Jkarray.isa);
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  double v6 = (void *)[MEMORY[0x263EFF980] array];
  if (![v5 count]) {
    return v6;
  }
  uint64_t v7 = 0;
  while (1)
  {
    v8 = (void *)[v5 objectAtIndex:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(&cfstr_Jkdictionary.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_16;
      }
    }
    v9 = (void *)[v8 objectForKey:@"type"];
    if ([v9 isEqualToString:@"error"]) {
      break;
    }
    if ([v9 isEqualToString:@"user"])
    {
      v10 = objc_alloc_init(IKUser);
      -[IKUser setUserID:](v10, "setUserID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"user_id", v8), "unsignedIntegerValue"));
      -[IKUser setUsername:](v10, "setUsername:", [a1 _normalizedObjectForKey:@"username" inDictionary:v8]);
      -[IKUser setSubscribed:](v10, "setSubscribed:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"subscription_is_active", v8), "BOOLValue"));
LABEL_15:
      [v6 addObject:v10];

      goto LABEL_16;
    }
    if ([v9 isEqualToString:@"bookmark"])
    {
      v10 = objc_alloc_init(IKBookmark);
      -[IKUser setBookmarkID:](v10, "setBookmarkID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"bookmark_id", v8), "integerValue"));
      -[IKUser setURL:](v10, "setURL:", [a1 _URLForKey:@"url" inDictionary:v8]);
      -[IKUser setTitle:](v10, "setTitle:", [a1 _normalizedObjectForKey:@"title" inDictionary:v8]);
      -[IKUser setDescr:](v10, "setDescr:", [a1 _normalizedObjectForKey:@"description" inDictionary:v8]);
      -[IKUser setDate:](v10, "setDate:", [a1 _dateForKey:@"time" inDictionary:v8]);
      -[IKUser setStarred:](v10, "setStarred:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"starred", v8), "BOOLValue"));
      -[IKUser setPrivateSource:](v10, "setPrivateSource:", [a1 _normalizedObjectForKey:@"private_source" inDictionary:v8]);
      -[IKUser setHashString:](v10, "setHashString:", [a1 _normalizedObjectForKey:@"hash" inDictionary:v8]);
      objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"progress", v8), "floatValue");
      [(IKUser *)v10 setProgress:v11];
      -[IKUser setProgressDate:](v10, "setProgressDate:", [a1 _dateForKey:@"progress_timestamp" inDictionary:v8]);
      goto LABEL_15;
    }
    if ([v9 isEqualToString:@"folder"])
    {
      v10 = objc_alloc_init(IKFolder);
      -[IKUser setFolderID:](v10, "setFolderID:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"folder_id", v8), "integerValue"));
      -[IKUser setTitle:](v10, "setTitle:", [a1 _normalizedObjectForKey:@"title" inDictionary:v8]);
      -[IKUser setSyncToMobile:](v10, "setSyncToMobile:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"sync_to_mobile", v8), "BOOLValue"));
      -[IKUser setPosition:](v10, "setPosition:", objc_msgSend((id)objc_msgSend(a1, "_normalizedObjectForKey:inDictionary:", @"position", v8), "unsignedIntegerValue"));
      goto LABEL_15;
    }
LABEL_16:
    if (++v7 >= (unint64_t)[v5 count]) {
      return v6;
    }
  }
  uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "objectForKey:", @"error_code"), "integerValue");
  uint64_t v14 = [v8 objectForKey:@"message"];
  uint64_t v15 = [NSDictionary dictionaryWithObject:v14 forKey:@"message"];
  v16 = (void *)MEMORY[0x263F087E8];
  return (id)[v16 errorWithDomain:@"com.matthiasplappert.InstapaperKit" code:v13 userInfo:v15];
}

+ (BOOL)token:(id *)a3 andTokenSecret:(id *)a4 fromQlineString:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)[a5 componentsSeparatedByString:@"&"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[*(id *)(*((void *)&v19 + 1) + 8 * v11) componentsSeparatedByString:@"="];
        if ([v12 count] == 2)
        {
          uint64_t v13 = (void *)[v12 objectAtIndex:0];
          uint64_t v14 = [v12 objectAtIndex:1];
          char v15 = [v13 isEqualToString:@"oauth_token"];
          v16 = a3;
          if ((v15 & 1) != 0
            || (int v17 = [v13 isEqualToString:@"oauth_token_secret"], v16 = a4, v17))
          {
            id *v16 = (id)v14;
          }
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  if (*a3 && *a4) {
    return 1;
  }
  BOOL result = 0;
  *a3 = 0;
  *a4 = 0;
  return result;
}

@end