@interface NSURL(INJSONSerialization)
+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:;
- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:;
@end

@implementation NSURL(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v4 = a3;
  if ([a1 isFileURL] && (uint64_t v5 = MEMORY[0x192F97DF0](a1)) != 0)
  {
    v6 = (void *)v5;
    v7 = [a1 absoluteString];
    v8 = [v4 encodeObject:v6];
    v9 = [v7 stringByAppendingFormat:@"?%@=%@", @"scope", v8];
  }
  else
  {
    v9 = [a1 absoluteString];
  }

  return v9;
}

+ (id)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v9];
    v11 = [v10 URL];
    char v12 = [v11 isFileURL];

    v13 = (void *)MEMORY[0x1E4F1CB10];
    if (v12)
    {
      id v28 = v8;
      v14 = [v9 componentsSeparatedByString:@"?"];
      v15 = [v14 objectAtIndexedSubscript:0];
      id v29 = [v13 URLWithString:v15];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v27 = v10;
      v16 = [v10 queryItems];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v31 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            v22 = [v21 name];
            int v23 = [v22 isEqualToString:@"scope"];

            if (v23)
            {
              v24 = [v21 value];
              v25 = [v7 decodeObjectOfClass:objc_opt_class() from:v24];
              if (v25) {
                MEMORY[0x192F97DE0](v29, v25);
              }
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v18);
      }

      id v8 = v28;
      v10 = v27;
    }
    else
    {
      id v29 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    }
  }
  else
  {

    id v29 = 0;
  }

  return v29;
}

@end