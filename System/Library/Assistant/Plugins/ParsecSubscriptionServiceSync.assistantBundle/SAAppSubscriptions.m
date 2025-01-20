@interface SAAppSubscriptions
- (id)_pssSiriSync_anchorValue;
@end

@implementation SAAppSubscriptions

- (id)_pssSiriSync_anchorValue
{
  memset(&c, 0, sizeof(c));
  CC_SHA1_Init(&c);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v3 = [(SAAppSubscriptions *)self activeSubscriptions];
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = [v8 bundleId];
        v10 = v9;
        if (v9)
        {
          v11 = (const char *)[v9 UTF8String];
          if (v11)
          {
            v12 = v11;
            CC_LONG v13 = strlen(v11);
            CC_SHA1_Update(&c, v12, v13);
          }
        }

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v14 = objc_msgSend(v8, "subscriptionTiers", 0);
        id v15 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v26;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
              if (v19)
              {
                v20 = (const char *)[v19 UTF8String];
                if (v20)
                {
                  v21 = v20;
                  CC_LONG v22 = strlen(v20);
                  CC_SHA1_Update(&c, v21, v22);
                }
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
          }
          while (v16);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v5);
  }

  *(void *)md = 0;
  uint64_t v35 = 0;
  int v36 = 0;
  CC_SHA1_Final(md, &c);
  v23 = +[NSString hexStringFromBytes:md length:20];

  return v23;
}

@end