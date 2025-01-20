@interface BRCSharingPCSChainFolderOperation
- (BRCItemID)rootItemID;
- (BRCSharingPCSChainFolderOperation)initWithItem:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5;
- (id)createActivity;
- (void)_performPCSChainBatch;
- (void)main;
@end

@implementation BRCSharingPCSChainFolderOperation

- (BRCItemID)rootItemID
{
  return [(BRCServerItem *)self->_serverItem itemID];
}

- (BRCSharingPCSChainFolderOperation)initWithItem:(id)a3 sessionContext:(id)a4 syncUpCallback:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 itemID];
  v12 = [v11 debugItemIDString];
  v13 = [@"sharing/prepare-folder-pcs" stringByAppendingPathComponent:v12];

  v14 = [v8 serverZone];
  v15 = [v14 metadataSyncContext];
  v25.receiver = self;
  v25.super_class = (Class)BRCSharingPCSChainFolderOperation;
  v16 = [(_BRCOperation *)&v25 initWithName:v13 syncContext:v15 sessionContext:v10];

  if (v16)
  {
    [(_BRCOperation *)v16 setNonDiscretionary:1];
    uint64_t v17 = [v8 appLibrary];
    appLibrary = v16->_appLibrary;
    v16->_appLibrary = (BRCAppLibrary *)v17;

    v19 = [v8 clientZone];
    v20 = [v8 itemID];
    uint64_t v21 = [v19 serverItemByItemID:v20];
    serverItem = v16->_serverItem;
    v16->_serverItem = (BRCServerItem *)v21;

    v23 = objc_msgSend(MEMORY[0x1E4F1A218], "br_sharingMisc");
    [(_BRCOperation *)v16 setGroup:v23];

    v16->_chainedRecordsCount = 0;
    objc_storeStrong((id *)&v16->_syncUpCallback, a5);
    [(BRCServerItem *)v16->_serverItem overrideCKInfoIfNecessaryForOutOfBandSyncOpWithLocalItem:v8];
  }

  return v16;
}

- (id)createActivity
{
  os_activity_t v2 = _os_activity_create(&dword_1D353B000, "sharing/prepareFolderPCS", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)_performPCSChainBatch
{
  v3 = [[BRCPCSChainingOperation alloc] initWithRootItem:self->_serverItem appLibrary:self->_appLibrary sessionContext:self->super.super._sessionContext syncUpCallback:self->_syncUpCallback];
  [(BRCPCSChainingOperation *)v3 setCanSyncDownBeforeRetry:1];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke;
  v4[3] = &unk_1E699A120;
  v4[4] = self;
  [(BRCPCSChainingOperation *)v3 setPcsChainCompletionBlock:v4];
  [(_BRCOperation *)self addSubOperation:v3];
}

void __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  *(void *)(*(void *)(a1 + 32) + 536) += a4;
  if (v10 || a2)
  {
    v13 = *(void **)(a1 + 32);
    v14 = [NSNumber numberWithUnsignedLong:v13[67]];
    [v13 completedWithResult:v14 error:v10];
  }
  else if (v9)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke_2;
    v18 = &unk_1E69944C0;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 32);
    id v19 = v11;
    uint64_t v20 = v12;
    [v11 addPreFlushDirectoryListCompletionBlock:&v15];
    objc_msgSend(v11, "beginObservingChangesWithDelegate:", 0, v15, v16, v17, v18);
  }
  else
  {
    [*(id *)(a1 + 32) _performPCSChainBatch];
  }
}

uint64_t __58__BRCSharingPCSChainFolderOperation__performPCSChainBatch__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    v3 = [*(id *)(a1 + 32) folderToList];
    v4 = [*(id *)(*(void *)(a1 + 40) + 520) itemID];
    if ([v3 isEqualToItemID:v4])
    {
      int v5 = [*(id *)(*(void *)(a1 + 40) + 520) isDirectoryFault];

      if (!v5) {
        goto LABEL_7;
      }
      v3 = [*(id *)(*(void *)(a1 + 40) + 520) st];
      [v3 setType:0];
    }
    else
    {
    }
  }
LABEL_7:
  v6 = *(void **)(a1 + 40);
  return [v6 _performPCSChainBatch];
}

- (void)main
{
  if (self->_serverItem)
  {
    [(BRCSharingPCSChainFolderOperation *)self _performPCSChainBatch];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorInvalidParameter:value:", @"serverItem", 0);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(_BRCOperation *)self completedWithResult:0 error:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncUpCallback, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_serverItem, 0);
}

@end