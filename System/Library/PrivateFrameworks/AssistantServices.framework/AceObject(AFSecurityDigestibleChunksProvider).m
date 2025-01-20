@interface AceObject(AFSecurityDigestibleChunksProvider)
- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:;
@end

@implementation AceObject(AFSecurityDigestibleChunksProvider)

- (void)af_enumerateDigestibleChunksWithOptions:()AFSecurityDigestibleChunksProvider usingBlock:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v28 = (void *)MEMORY[0x19F3A4E70]();
      v29 = [a1 dictionary];
      objc_msgSend(v29, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v7);
    }
    else
    {
      v8 = v6 + 2;
      v6[2](v6, AFSecurityDigestibleChunksProviderType, 4);
      v9 = [a1 groupIdentifier];
      objc_msgSend(v9, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      v10 = [a1 encodedClassName];
      objc_msgSend(v10, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      (*v8)(v7, AFSecurityDigestibleChunksProviderAceId, 4);
      v11 = [a1 aceId];
      objc_msgSend(v11, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      (*v8)(v7, "!FER", 4);
      v12 = [a1 refId];
      objc_msgSend(v12, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 1, v7);

      v31 = v7;
      uint64_t v13 = (*v8)(v7, AFSecurityDigestibleChunksProviderData, 4);
      context = (void *)MEMORY[0x19F3A4E70](v13);
      v32 = [a1 dictionary];
      v14 = [v32 allKeys];
      v15 = [v14 sortedArrayUsingSelector:sel_compare_];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v16 = v15;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        uint64_t v20 = *MEMORY[0x1E4F964F8];
        uint64_t v21 = *MEMORY[0x1E4F964F0];
        uint64_t v22 = *MEMORY[0x1E4F96500];
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v24 = *(void **)(*((void *)&v33 + 1) + 8 * v23);
            v25 = (void *)MEMORY[0x19F3A4E70]();
            if (([v24 isEqualToString:v20] & 1) == 0
              && ([v24 isEqualToString:v21] & 1) == 0
              && ([v24 isEqualToString:@"aceId"] & 1) == 0
              && ([v24 isEqualToString:v22] & 1) == 0)
            {
              uint64_t v26 = v22;
              v27 = [v32 objectForKey:v24];
              if (objc_opt_respondsToSelector())
              {
                objc_msgSend(v24, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v31);
                objc_msgSend(v27, "af_enumerateDigestibleChunksWithOptions:usingBlock:", 0, v31);
              }

              uint64_t v22 = v26;
            }
            ++v23;
          }
          while (v18 != v23);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v18);
      }

      v7 = v31;
      v31[2](v31, AFSecurityDigestibleChunksProviderEnd, 4);
    }
  }
}

@end