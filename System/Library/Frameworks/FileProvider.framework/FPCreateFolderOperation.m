@interface FPCreateFolderOperation
- (BOOL)shouldBounceOnCollision;
- (FPCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4;
- (id)createFolderCompletionBlock;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)setCreateFolderCompletionBlock:(id)a3;
- (void)setShouldBounceOnCollision:(BOOL)a3;
@end

@implementation FPCreateFolderOperation

- (FPCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 providerDomainID];
  v21.receiver = self;
  v21.super_class = (Class)FPCreateFolderOperation;
  v10 = [(FPActionOperation *)&v21 initWithProvider:v9 action:@"Create"];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_parentItem, a3);
    uint64_t v11 = objc_msgSend(v8, "fp_filenameFromDisplayNameWithExtension:", 0);
    folderFilename = v10->_folderFilename;
    v10->_folderFilename = (NSString *)v11;

    [(FPActionOperation *)v10 setDestinationItemToPreflight:v7];
    uint64_t v13 = *MEMORY[0x1E4F44378];
    v14 = [FPItem alloc];
    v15 = [v7 providerDomainID];
    v16 = [v7 itemIdentifier];
    v17 = [(FPItem *)v14 initWithProviderDomainID:v15 itemIdentifier:@"fakeIdentifier" parentItemIdentifier:v16 filename:v10->_folderFilename contentType:v13];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EF6C3AA0];
    [(FPActionOperation *)v10 setSourceItemKeysAllowList:v18];

    v22[0] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [(FPActionOperation *)v10 setSourceItemsToPreflight:v19];

    [(FPActionOperation *)v10 setSetupRemoteOperationService:1];
  }

  return v10;
}

- (void)actionMain
{
  v3 = [FPItem alloc];
  v4 = [(FPItem *)self->_parentItem providerDomainID];
  v5 = [(FPItem *)self->_parentItem itemIdentifier];
  v6 = [(FPItem *)v3 initWithProviderDomainID:v4 itemIdentifier:@"__" parentItemIdentifier:v5 filename:self->_folderFilename isDirectory:1];

  id v7 = [(FPActionOperation *)self stitcher];
  id v8 = [v7 itemWithPlaceholderID:self->_placeholderID];

  v9 = [v8 contentModificationDate];
  if (v9) {
    [(FPItem *)v6 setContentModificationDate:v9];
  }
  v10 = [v8 creationDate];
  if (v10) {
    [(FPItem *)v6 setCreationDate:v10];
  }
  uint64_t v11 = +[FPDaemonConnection sharedConnection];
  BOOL shouldBounceOnCollision = self->_shouldBounceOnCollision;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __37__FPCreateFolderOperation_actionMain__block_invoke;
  v13[3] = &unk_1E5AF2828;
  v13[4] = self;
  [v11 createItemBasedOnTemplate:v6 fields:6 urlWrapper:0 options:0x10000 bounceOnCollision:shouldBounceOnCollision completionHandler:v13];
}

void __37__FPCreateFolderOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __37__FPCreateFolderOperation_actionMain__block_invoke_cold_1(v6);
    }
  }
  id v8 = [*(id *)(a1 + 32) stitcher];
  [v8 associateItem:v5 withPlaceholderID:*(void *)(*(void *)(a1 + 32) + 464)];

  [*(id *)(a1 + 32) completedWithResult:v5 error:v6];
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FPActionOperation *)self stitcher];
  [v8 finishWithItem:v6 error:v7];

  uint64_t v9 = [(FPCreateFolderOperation *)self createFolderCompletionBlock];
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
    [(FPCreateFolderOperation *)self setCreateFolderCompletionBlock:0];
  }

  v11.receiver = self;
  v11.super_class = (Class)FPCreateFolderOperation;
  [(FPActionOperation *)&v11 finishWithResult:v6 error:v7];
}

- (void)presendNotifications
{
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  v4 = [(FPActionOperation *)self stitcher];
  folderFilename = self->_folderFilename;
  id v6 = [(FPItem *)self->_parentItem itemIdentifier];
  id v7 = [(FPItem *)self->_parentItem providerDomainID];
  id v8 = [v4 createPlaceholderWithName:folderFilename isFolder:1 contentAccessDate:0 underParent:v6 inProviderDomainID:v7];
  placeholderID = self->_placeholderID;
  self->_placeholderID = v8;

  id v10 = [(FPActionOperation *)self stitcher];
  [v10 flush];
}

- (BOOL)shouldBounceOnCollision
{
  return self->_shouldBounceOnCollision;
}

- (void)setShouldBounceOnCollision:(BOOL)a3
{
  self->_BOOL shouldBounceOnCollision = a3;
}

- (id)createFolderCompletionBlock
{
  return self->_createFolderCompletionBlock;
}

- (void)setCreateFolderCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_createFolderCompletionBlock, 0);
  objc_storeStrong((id *)&self->_placeholderID, 0);
  objc_storeStrong((id *)&self->_folderFilename, 0);

  objc_storeStrong((id *)&self->_parentItem, 0);
}

void __37__FPCreateFolderOperation_actionMain__block_invoke_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] 🆕❌ FPCreateFolderOperation failed with error: %@", v4, v5, v6, v7, v8);
}

@end