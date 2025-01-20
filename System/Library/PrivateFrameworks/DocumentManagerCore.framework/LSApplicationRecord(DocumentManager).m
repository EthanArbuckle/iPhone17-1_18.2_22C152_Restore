@interface LSApplicationRecord(DocumentManager)
- (uint64_t)doc_canHaveAppContainer;
- (uint64_t)doc_hasFileProviderExtension;
@end

@implementation LSApplicationRecord(DocumentManager)

- (uint64_t)doc_canHaveAppContainer
{
  if [a1 supportsOpenInPlace] && (objc_msgSend(a1, "isFileSharingEnabled")) {
    return 1;
  }
  v3 = [a1 infoDictionary];
  v4 = [v3 objectForKey:@"UISupportsDocumentBrowser" ofClass:objc_opt_class()];

  uint64_t v5 = [v4 BOOLValue];
  return v5;
}

- (uint64_t)doc_hasFileProviderExtension
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = [a1 applicationExtensionRecords];
  if ([v1 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          v7 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v6), "extensionPointRecord", (void)v12);
          v8 = [v7 identifier];
          char v9 = [v8 isEqualToString:@"com.apple.fileprovider-nonui"];

          if (v9)
          {
            uint64_t v10 = 1;
            goto LABEL_12;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 0;
LABEL_12:
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end