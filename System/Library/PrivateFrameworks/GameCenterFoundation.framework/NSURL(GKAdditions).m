@interface NSURL(GKAdditions)
- (id)_gkURLByAddingQueryParameters:()GKAdditions;
- (id)_gkURLByReplacingSchemeWithScheme:()GKAdditions;
- (uint64_t)_gkIsSecure;
- (uint64_t)_gkIsValidServerURL;
- (uint64_t)gkFileSystemRepresentation;
@end

@implementation NSURL(GKAdditions)

- (uint64_t)gkFileSystemRepresentation
{
  v1 = NSString;
  uint64_t v2 = [a1 fileSystemRepresentation];

  return [v1 stringWithUTF8String:v2];
}

- (uint64_t)_gkIsValidServerURL
{
  if (_gkIsValidServerURL_onceToken != -1) {
    dispatch_once(&_gkIsValidServerURL_onceToken, &__block_literal_global_130);
  }
  uint64_t v2 = (void *)_gkIsValidServerURL_sValidSchemes;
  v3 = [a1 scheme];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (uint64_t)_gkIsSecure
{
  v1 = [a1 scheme];
  uint64_t v2 = [v1 isEqualToString:@"https"];

  return v2;
}

- (id)_gkURLByAddingQueryParameters:()GKAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 absoluteString];
    if (v5)
    {
      v20 = v5;
      v6 = (void *)[v5 mutableCopy];
      v7 = [a1 query];

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v21 = v4;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        if (v7) {
          v11 = @"&";
        }
        else {
          v11 = @"?";
        }
        uint64_t v12 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v12) {
              objc_enumerationMutation(v8);
            }
            uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            uint64_t v15 = [v8 objectForKey:v14];
            v16 = (void *)v15;
            if (v15)
            {
              [v6 appendFormat:@"%@%@=%@", v11, v14, v15];
              v11 = @"&";
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v10);
      }

      if (v6)
      {
        uint64_t v17 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
        if (v17)
        {
          id v18 = (id)v17;

          id v4 = v21;
          goto LABEL_21;
        }
      }

      v5 = v20;
      id v4 = v21;
    }
  }
  id v18 = a1;
LABEL_21:

  return v18;
}

- (id)_gkURLByReplacingSchemeWithScheme:()GKAdditions
{
  id v4 = a3;
  v5 = [a1 scheme];
  v6 = [a1 absoluteString];
  v7 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v5, "length"));
  id v8 = [v4 stringByAppendingString:v7];

  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  return v9;
}

@end