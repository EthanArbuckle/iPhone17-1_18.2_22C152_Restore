@interface NSDictionary(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSDictionary(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    char v19 = a3;
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, void *, uint64_t))v6 + 2))(v6, &AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v25, "{NSDictionary=#}");
      (*v8)(v7, v25, 17);
      (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    v9 = [a1 allKeys];
    v10 = [v9 sortedArrayUsingSelector:sel_compare_];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
          v17 = (void *)MEMORY[0x19F3A4E70]();
          if (objc_opt_respondsToSelector())
          {
            v18 = [a1 objectForKey:v16];
            if (objc_opt_respondsToSelector())
            {
              objc_msgSend(v16, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7);
              objc_msgSend(v18, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7);
            }
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    if ((v19 & 1) == 0) {
      (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end