@interface FPUntrashOperation
- (FPUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4;
- (id)fp_prettyDescription;
- (id)replicateForItems:(id)a3;
- (id)untrashCompletionBlock;
- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4;
- (void)postStitchingFinishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)setUntrashCompletionBlock:(id)a3;
- (void)subclassPreflightWithCompletion:(id)a3;
@end

@implementation FPUntrashOperation

- (id)replicateForItems:(id)a3
{
  id v4 = a3;
  v5 = [[FPUntrashOperation alloc] initWithItems:v4 restoreDirectory:self->_restoreDirectory];

  return v5;
}

- (FPUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FPUntrashOperation;
  v8 = [(FPTransformOperation *)&v11 initWithItemsOfDifferentProviders:a3 action:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_restoreDirectory, a4);
    [(FPActionOperation *)v9 setSetupRemoteOperationService:1];
  }

  return v9;
}

- (void)subclassPreflightWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  p_restoreDirectory = &self->_restoreDirectory;
  restoreDirectory = self->_restoreDirectory;
  if (restoreDirectory)
  {
    id v16 = 0;
    v8 = +[FPProviderDomain providerDomainForItem:restoreDirectory cachePolicy:0 error:&v16];
    id v9 = v16;
    if (v9)
    {
      v10 = fp_current_or_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[FPUntrashOperation subclassPreflightWithCompletion:]((uint64_t)p_restoreDirectory, v9);
      }

      ((void (**)(void, void, id))v5)[2](v5, 0, v9);
    }
    else
    {
      objc_super v11 = [(FPItem *)*p_restoreDirectory itemID];
      v12 = [(FPActionOperation *)self itemManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke;
      v13[3] = &unk_1E5AF56F0;
      v15 = v5;
      v13[4] = self;
      id v14 = v8;
      [v12 fetchParentsForItemID:v11 recursively:1 completionHandler:v13];
    }
  }
  else
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (a3)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v20 + 1) + 8 * i) isTrashed])
          {

            v13 = [*(id *)(a1 + 32) itemManager];
            id v14 = *(void **)(a1 + 40);
            v16[0] = MEMORY[0x1E4F143A8];
            v16[1] = 3221225472;
            v16[2] = __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2;
            v16[3] = &unk_1E5AF2CC0;
            id v17 = v14;
            id v15 = *(id *)(a1 + 48);
            uint64_t v18 = *(void *)(a1 + 32);
            id v19 = v15;
            [v13 fetchRootItemForProviderDomain:v17 completionHandler:v16];

            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
LABEL_14:
}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6 || v7)
  {
    uint64_t v10 = fp_current_or_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2_cold_1(a1, v10);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 472), a2);
    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v9();
}

- (unint64_t)transformItem:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(FPItem *)self->_restoreDirectory itemIdentifier];
  [v5 setTrashed:0];
  rootDirectory = self->_rootDirectory;
  if (rootDirectory)
  {
    uint64_t v8 = [(FPItem *)rootDirectory itemIdentifier];

    uint64_t v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[FPUntrashOperation transformItem:atIndex:]();
    }

    id v6 = (void *)v8;
  }
  if (v6)
  {
    [v5 setParentItemIdentifier:v6];
    unint64_t v10 = 1073741828;
  }
  else
  {
    unint64_t v10 = 0x40000000;
  }

  return v10;
}

- (void)postStitchingFinishWithResult:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(FPUntrashOperation *)self untrashCompletionBlock];
  uint64_t v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    [(FPUntrashOperation *)self setUntrashCompletionBlock:0];
  }
}

- (void)presendNotifications
{
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  id v4 = [(FPActionOperation *)self stitcher];
  id v5 = [(FPTransformOperation *)self items];
  [v4 deleteItems:v5];

  id v6 = [(FPActionOperation *)self stitcher];
  [v6 flush];
}

- (id)fp_prettyDescription
{
  v2 = NSString;
  v3 = [(FPTransformOperation *)self items];
  id v4 = objc_msgSend(v3, "fp_itemIdentifiers");
  id v5 = FPAbbreviatedArrayDescription(v4);
  id v6 = [v2 stringWithFormat:@"untrash %@", v5];

  return v6;
}

- (id)untrashCompletionBlock
{
  return self->_untrashCompletionBlock;
}

- (void)setUntrashCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_untrashCompletionBlock, 0);
  objc_storeStrong((id *)&self->_rootDirectory, 0);

  objc_storeStrong((id *)&self->_restoreDirectory, 0);
}

- (void)subclassPreflightWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  v2 = objc_msgSend(a2, "fp_prettyDescription");
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Failed retrieving provider domain for restore directory %@ error: %@", v5, v6, v7, v8, 2u);
}

void __54__FPUntrashOperation_subclassPreflightWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_ERROR, "[ERROR] untrash operation preflight failed because of failed fetch root item for domain %@", (uint8_t *)&v3, 0xCu);
}

- (void)transformItem:atIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1A33AE000, v0, v1, "[DEBUG] Untrash moving item %@ to root because restore directory is trashed", v2, v3, v4, v5, v6);
}

@end