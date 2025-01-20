@interface FPRenameOperation
- (FPRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4;
- (FPRenameOperation)initWithItem:(id)a3 newFileName:(id)a4;
- (FPRenameOperation)initWithItem:(id)a3 newNameInternal:(id)a4;
- (id)fp_prettyDescription;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
@end

@implementation FPRenameOperation

- (FPRenameOperation)initWithItem:(id)a3 newFileName:(id)a4
{
  id v6 = a3;
  v7 = objc_msgSend(a4, "fp_filenameFromDisplayNameWithExtension:", 0);
  v8 = [(FPRenameOperation *)self initWithItem:v6 newNameInternal:v7];

  return v8;
}

- (FPRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFolder])
  {
    v8 = 0;
  }
  else
  {
    v9 = [v6 filename];
    v8 = [v9 pathExtension];
  }
  v10 = objc_msgSend(v7, "fp_filenameFromDisplayNameWithExtension:", v8);
  v11 = [(FPRenameOperation *)self initWithItem:v6 newNameInternal:v10];

  return v11;
}

- (FPRenameOperation)initWithItem:(id)a3 newNameInternal:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 providerDomainID];
  v19.receiver = self;
  v19.super_class = (Class)FPRenameOperation;
  v10 = [(FPActionOperation *)&v19 initWithProvider:v9 action:@"Rename"];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_item, a3);
    objc_storeStrong((id *)&v10->_newName, a4);
    v20[0] = v7;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(FPActionOperation *)v10 setSourceItemsToPreflight:v11];

    [(FPActionOperation *)v10 setSetupRemoteOperationService:1];
    uint64_t v12 = *MEMORY[0x1E4F44378];
    v13 = [FPItem alloc];
    v14 = [v7 providerDomainID];
    v15 = [v7 parentItemIdentifier];
    v16 = [(FPItem *)v13 initWithProviderDomainID:v14 itemIdentifier:@"fakeIdentifier" parentItemIdentifier:v15 filename:v8 contentType:v12];

    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EF6C3A88];
    [(FPActionOperation *)v10 setDestinationItemKeysAllowList:v17];

    [(FPActionOperation *)v10 setDestinationItemToPreflight:v16];
  }

  return v10;
}

- (void)actionMain
{
  v3 = [(FPItem *)self->_item strippedCopy];
  [v3 setFilename:self->_newName];
  v4 = [(FPActionOperation *)self remoteServiceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__FPRenameOperation_actionMain__block_invoke;
  v5[3] = &unk_1E5AF2828;
  v5[4] = self;
  [v4 singleItemChange:v3 changedFields:2 bounce:0 completionHandler:v5];
}

void __31__FPRenameOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __31__FPRenameOperation_actionMain__block_invoke_cold_2(a1, v6, v7);
    }

    id v8 = v5;
    v5 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v9 = +[FPStitchingManager sharedInstance];
  v10 = [v5 itemID];
  v11 = [*(id *)(a1 + 32) stitcher];
  int v12 = [v9 cleanStitchedForItemID:v10 ignoreSession:v11];

  if (v12)
  {
    id v8 = fp_current_or_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __31__FPRenameOperation_actionMain__block_invoke_cold_1(v5);
    }
    goto LABEL_8;
  }
LABEL_9:
  [*(id *)(a1 + 32) completedWithResult:v5 error:v6];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FPActionOperation *)self stitcher];
  [v8 finishWithItem:v7 error:v6];

  v9 = objc_msgSend(v6, "fp_annotatedErrorWithItem:variant:", self->_item, @"Rename");

  v10.receiver = self;
  v10.super_class = (Class)FPRenameOperation;
  [(FPActionOperation *)&v10 finishWithResult:v7 error:v9];
}

- (void)presendNotifications
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  v4 = [(FPActionOperation *)self stitcher];
  v8[0] = self->_item;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__FPRenameOperation_presendNotifications__block_invoke;
  v7[3] = &unk_1E5AF3FE0;
  v7[4] = self;
  [v4 transformItems:v5 handler:v7];

  id v6 = [(FPActionOperation *)self stitcher];
  [v6 flush];
}

void __41__FPRenameOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 456);
  v4 = *(void **)(v2 + 448);
  id v5 = a2;
  objc_msgSend(v3, "fp_displayNameFromFilenameWithHiddenPathExtension:isFolder:", ((unint64_t)objc_msgSend(v4, "fileSystemFlags") >> 4) & 1, objc_msgSend(v5, "isFolder"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setDisplayName:v6];
}

- (id)fp_prettyDescription
{
  v3 = NSString;
  v4 = [(FPItem *)self->_item itemIdentifier];
  id v5 = [v3 stringWithFormat:@"rename %@ to %@", v4, self->_newName];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newName, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

void __31__FPRenameOperation_actionMain__block_invoke_cold_1(void *a1)
{
  v1 = [a1 itemID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] Deleted item with same ID (%@) has been unstitched to allow renaming", v4, v5, v6, v7, v8);
}

void __31__FPRenameOperation_actionMain__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 448);
  uint64_t v6 = *(void *)(v4 + 456);
  uint64_t v7 = objc_msgSend(a2, "fp_prettyDescription");
  int v8 = 138412802;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_1A33AE000, a3, OS_LOG_TYPE_ERROR, "[ERROR] couldn't rename item %@ to \"%@\": %@", (uint8_t *)&v8, 0x20u);
}

@end