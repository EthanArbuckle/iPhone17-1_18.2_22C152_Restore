@interface FPTransformOperation
+ (id)daemonConnection;
- (FPTransformOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4;
- (NSArray)items;
- (id)finalItemsForStitcherForResult:(id)a3;
- (id)fp_prettyDescription;
- (id)transformCompletionBlock;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)setTransformCompletionBlock:(id)a3;
- (void)signalReindexItemsIfNeededForErrorsByItem:(id)a3;
@end

@implementation FPTransformOperation

- (FPTransformOperation)initWithItemsOfDifferentProviders:(id)a3 action:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FPTransformOperation;
  v7 = [(FPActionOperation *)&v11 initWithItemsOfDifferentProviders:v6 action:a4];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    items = v7->_items;
    v7->_items = (NSArray *)v8;
  }
  return v7;
}

+ (id)daemonConnection
{
  return +[FPDaemonConnection sharedConnectionProxy];
}

- (void)signalReindexItemsIfNeededForErrorsByItem:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke;
  v33[3] = &unk_1E5AF5678;
  id v6 = v5;
  id v34 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v33];
  if ([v6 count])
  {
    id v26 = v4;
    v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[FPTransformOperation signalReindexItemsIfNeededForErrorsByItem:]();
    }

    uint64_t v8 = objc_opt_new();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v9 = [(FPTransformOperation *)self items];
    v10 = (void *)[v9 copy];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v16 = [v15 itemIdentifier];
          if ([v6 containsObject:v16])
          {
          }
          else
          {
            v17 = [v15 formerIdentifier];
            int v18 = [v6 containsObject:v17];

            if (!v18) {
              continue;
            }
          }
          v19 = [v15 providerDomainID];
          v20 = [v8 objectForKeyedSubscript:v19];

          if (!v20)
          {
            v21 = objc_opt_new();
            [v8 setObject:v21 forKeyedSubscript:v19];
          }
          v22 = [v8 objectForKeyedSubscript:v19];
          v23 = [v15 coreSpotlightIdentifier];
          [v22 addObject:v23];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v12);
    }

    v24 = [(id)objc_opt_class() daemonConnection];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_371;
    v27[3] = &unk_1E5AF1240;
    id v28 = v8;
    id v25 = v8;
    [v24 signalReindexCSIdentifiersByProviderDomainID:v25 indexReason:5 completionHandler:v27];

    id v4 = v26;
  }
}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (objc_msgSend(a3, "fp_isFileProviderError:", -1005)) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_371(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_371_cold_1(a1, v3, v4);
  }
}

- (void)actionMain
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  items = self->_items;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__FPTransformOperation_actionMain__block_invoke;
  v10[3] = &unk_1E5AF56A0;
  v10[4] = self;
  v10[5] = &v11;
  id v5 = [(NSArray *)items fp_mapWithIndex:v10];
  if (!v12[3])
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"FPActionOperation.m" lineNumber:1091 description:@"Transform didn't modify any field"];
  }
  id v6 = [(FPActionOperation *)self remoteServiceProxy];
  uint64_t v7 = v12[3];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__FPTransformOperation_actionMain__block_invoke_2;
  v9[3] = &unk_1E5AF3990;
  v9[4] = self;
  [v6 bulkItemChanges:v5 changedFields:v7 completionHandler:v9];

  _Block_object_dispose(&v11, 8);
}

id __34__FPTransformOperation_actionMain__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 strippedCopy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [*(id *)(a1 + 32) transformItem:v5 atIndex:a3];

  return v5;
}

void __34__FPTransformOperation_actionMain__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __34__FPTransformOperation_actionMain__block_invoke_2_cold_1();
    }
  }
  else if ([v8 count])
  {
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __34__FPTransformOperation_actionMain__block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 32) signalReindexItemsIfNeededForErrorsByItem:v8];
  }
  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = [v7 allValues];
  if (v9)
  {
    [v12 completedWithResult:v13 error:v9];
  }
  else
  {
    uint64_t v14 = [v8 allValues];
    v15 = [v14 firstObject];
    [v12 completedWithResult:v13 error:v15];
  }
}

- (void)presendNotifications
{
  id v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  id v4 = [(FPActionOperation *)self stitcher];
  items = self->_items;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__FPTransformOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E5AF56C8;
  v7[4] = self;
  v7[5] = v8;
  [v4 transformItems:items handler:v7];

  id v6 = [(FPActionOperation *)self stitcher];
  [v6 flush];

  _Block_object_dispose(v8, 8);
}

uint64_t __44__FPTransformOperation_presendNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transformItem:a2 atIndex:(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++];
}

- (id)finalItemsForStitcherForResult:(id)a3
{
  id v3 = a3;

  return v3;
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPTransformOperation *)self finalItemsForStitcherForResult:v6];
  id v9 = [(FPActionOperation *)self stitcher];
  [v9 finishWithItems:v8 error:v7];

  [(FPTransformOperation *)self postStitchingFinishWithResult:v6 error:v7];
  uint64_t v10 = [(FPTransformOperation *)self transformCompletionBlock];
  uint64_t v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v6, v7);
    [(FPTransformOperation *)self setTransformCompletionBlock:0];
  }

  v12.receiver = self;
  v12.super_class = (Class)FPTransformOperation;
  [(FPActionOperation *)&v12 finishWithResult:v6 error:v7];
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2 object:self file:@"FPActionOperation.m" lineNumber:1145 description:@"UNREACHABLE: this should be overriden by the concrete operation"];

  return 0;
}

- (id)fp_prettyDescription
{
  v2 = NSString;
  id v3 = [(FPTransformOperation *)self items];
  id v4 = objc_msgSend(v3, "fp_itemIdentifiers");
  id v5 = FPAbbreviatedArrayDescription(v4);
  id v6 = [v2 stringWithFormat:@"modify items %@", v5];

  return v6;
}

- (NSArray)items
{
  return self->_items;
}

- (id)transformCompletionBlock
{
  return self->_transformCompletionBlock;
}

- (void)setTransformCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transformCompletionBlock, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (void)signalReindexItemsIfNeededForErrorsByItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1A33AE000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Index out of sync. Forcing reindex of %@", v1, 0xCu);
}

void __66__FPTransformOperation_signalReindexItemsIfNeededForErrorsByItem___block_invoke_371_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_17(&dword_1A33AE000, a3, v6, "[DEBUG] Did signal reindex items %@ with error: %@", (uint8_t *)&v7);
}

void __34__FPTransformOperation_actionMain__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  v1 = objc_msgSend(*(id *)(v0 + 32), "fp_prettyDescription");
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v2, v3, "[ERROR] couldn't %@: %@", v4, v5, v6, v7, v8);
}

@end