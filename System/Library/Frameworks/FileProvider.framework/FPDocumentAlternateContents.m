@interface FPDocumentAlternateContents
- (FPDocumentAlternateContents)initWithAlternateContentsDictionary:(id)a3;
- (id)getAlternateContentsURLWrapperForItemID:(id)a3;
- (void)dumpToDumper:(id)a3;
- (void)removeAlternateContentsURLForDocumentWithItemID:(id)a3;
- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithItemID:(id)a4;
- (void)updateWithManagerAlternateContentsDictionary:(id)a3;
@end

@implementation FPDocumentAlternateContents

- (FPDocumentAlternateContents)initWithAlternateContentsDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDocumentAlternateContents;
  v5 = [(FPDocumentAlternateContents *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    alternateContentsURLDictionary = v5->_alternateContentsURLDictionary;
    v5->_alternateContentsURLDictionary = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)getAlternateContentsURLWrapperForItemID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_alternateContentsURLDictionary objectForKeyedSubscript:v4];
  objc_sync_exit(v5);

  return v6;
}

- (void)updateWithManagerAlternateContentsDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412546;
    long long v15 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v4, "objectForKeyedSubscript:", v10, v15);
        id v18 = 0;
        v12 = +[FPSandboxingURLWrapper wrapperWithURL:v11 extensionClass:"com.apple.fileprovider.read-write" error:&v18];
        id v13 = v18;
        if (v12)
        {
          [(FPDocumentAlternateContents *)self setAlternateContentsURLWrapper:v12 forDocumentWithItemID:v10];
        }
        else
        {
          v14 = fp_current_or_default_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v17 = objc_msgSend(v11, "fp_shortDescription");
            v16 = objc_msgSend(v13, "fp_prettyDescription");
            *(_DWORD *)buf = v15;
            v24 = v17;
            __int16 v25 = 2112;
            v26 = v16;
            _os_log_error_impl(&dword_1A33AE000, v14, OS_LOG_TYPE_ERROR, "[ERROR] couldn't create a URL wrapper for URL %@: %@ - this means iWork forgot to remove the alternate URL", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }
}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithItemID:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_alternateContentsURLDictionary setObject:v8 forKeyedSubscript:v6];
  objc_sync_exit(v7);
}

- (void)removeAlternateContentsURLForDocumentWithItemID:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableDictionary *)v4->_alternateContentsURLDictionary setObject:0 forKeyedSubscript:v5];
  objc_sync_exit(v4);
}

- (void)dumpToDumper:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableDictionary *)v5->_alternateContentsURLDictionary copy];
  if ([v6 count])
  {
    [v4 put:@" + alternate contents\n"];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__FPDocumentAlternateContents_dumpToDumper___block_invoke;
    v7[3] = &unk_1E5AF5E20;
    id v8 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
  objc_sync_exit(v5);
}

void __44__FPDocumentAlternateContents_dumpToDumper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 put:@"     "];
  uint64_t v7 = [v15 domainIdentifier];
  char v8 = [v7 isEqualToString:@"NSFileProviderDomainDefaultIdentifier"];

  if ((v8 & 1) == 0)
  {
    objc_super v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v15 domainIdentifier];
    [v9 write:@"%@", v10];
  }
  v11 = *(void **)(a1 + 32);
  v12 = [v15 identifier];
  id v13 = [v6 url];

  v14 = objc_msgSend(v13, "fp_shortDescription");
  [v11 write:@"%@ - %@\n", v12, v14];
}

- (void).cxx_destruct
{
}

@end