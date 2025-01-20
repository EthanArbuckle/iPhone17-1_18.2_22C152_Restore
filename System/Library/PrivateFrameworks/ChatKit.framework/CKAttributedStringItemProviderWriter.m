@interface CKAttributedStringItemProviderWriter
+ (NSArray)writableTypeIdentifiersForItemProvider;
- (CKAttributedStringItemProviderWriter)initWithAttributedString:(id)a3;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSAttributedString)attributedString;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
@end

@implementation CKAttributedStringItemProviderWriter

- (CKAttributedStringItemProviderWriter)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttributedStringItemProviderWriter;
  v5 = [(CKAttributedStringItemProviderWriter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;
  }
  return v5;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  if (writableTypeIdentifiersForItemProvider_onceToken_0 != -1) {
    dispatch_once(&writableTypeIdentifiersForItemProvider_onceToken_0, &__block_literal_global_117);
  }
  v2 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0;

  return (NSArray *)v2;
}

void __78__CKAttributedStringItemProviderWriter_writableTypeIdentifiersForItemProvider__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
  id v4 = (id)[v0 mutableCopy];

  v1 = [(id)*MEMORY[0x1E4F444A8] identifier];
  [v4 removeObject:v1];

  uint64_t v2 = [v4 copy];
  v3 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0;
  writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0 = v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  uint64_t v2 = objc_opt_class();

  return (NSArray *)[v2 writableTypeIdentifiersForItemProvider];
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CKAttributedStringItemProviderWriter *)self attributedString];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v13[3] = &unk_1E56264B8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 loadDataWithTypeIdentifier:v10 forItemProviderCompletionHandler:v13];

  return v11;
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(a1, (uint64_t)v6, v7);
    }
  }
  else
  {
    if (v5) {
      goto LABEL_6;
    }
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(a1, v7);
    }
  }

LABEL_6:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Writing nil data to pasteboard for attributed string serialized using type \"%@\"", (uint8_t *)&v3, 0xCu);
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Failed to load data of type, \"%@\", error: %@", (uint8_t *)&v4, 0x16u);
}

@end