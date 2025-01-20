@interface NSArray(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation NSArray(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if ((a3 & 1) == 0)
    {
      v8 = (void (**)(char *, char *, uint64_t))(v6 + 16);
      (*((void (**)(char *, const char *, uint64_t))v6 + 2))(v6, AFSecurityDigestibleChunksProviderType, 4);
      strcpy(v21, "{NSArray=#}");
      (*v8)(v7, v21, 12);
      v6 = (char *)((uint64_t (*)(char *, char *, uint64_t))*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
    }
    v9 = (void *)MEMORY[0x19F3A4E70](v6);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = a1;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v15, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7, (void)v16);
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    if ((a3 & 1) == 0) {
      (*((void (**)(char *, char *, uint64_t))v7 + 2))(v7, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end