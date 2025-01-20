@interface LiveFSFPEnumeratorDataContainer
- (BOOL)addParent;
- (BOOL)addedToExtension;
- (BOOL)hasPersistentIDs;
- (BOOL)isDir;
- (BOOL)isVolumeWide;
- (LiveFSFPEnumeratorDataContainer)initWithEnumeratedItem:(id)a3 fileHandle:(id)a4 extension:(id)a5;
- (LiveFSFPItemHelper)enumeratedItem;
- (LiveFSRBTree)contentsSortedByDate;
- (LiveFSRBTree)contentsSortedByName;
- (NSString)containerID;
- (NSString)enumeratedItemID;
- (id)ensureConnectedForUpdates;
- (id)initForExtension:(id)a3 item:(id)a4;
- (id)loadContents;
- (id)readDirBuffersForBufferBlock:(id)a3 andEntryBlock:(id)a4;
- (int)state;
- (void)addEnumerator:(id)a3;
- (void)applyAddAcrossEnumerators:(id)a3 newName:(id)a4 forSelf:(BOOL)a5;
- (void)applyDeleteAcrossEnumerators:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5;
- (void)applyParentUpdateAcrossEnumerators;
- (void)dealloc;
- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6;
- (void)dispatchOntoUpdateQueue:(id)a3;
- (void)doProcessItemDeleted:(id)a3;
- (void)doProcessItemUpdated:(id)a3;
- (void)doShutdown;
- (void)doShutdownOnEnumeratorHelperQueue;
- (void)dropEnumerator:(id)a3;
- (void)dropInterestForEnumeratedItem:(id)a3;
- (void)ensureConnectedForUpdates;
- (void)handleEnumeratedItemChanged;
- (void)historyResetItem:(id)a3 interestedItem:(id)a4;
- (void)historyResetName:(id)a3 interestedItem:(id)a4;
- (void)invalidate;
- (void)makeAllEnumeratorsDead;
- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8;
- (void)resetAllEnumerators;
- (void)setAddParent:(BOOL)a3;
- (void)setAddedToExtension:(BOOL)a3;
- (void)setEnumeratedItemID:(id)a3;
- (void)setState:(int)a3;
- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5;
- (void)updatedName:(id)a3 interestedItem:(id)a4;
- (void)updatesDoneFor:(id)a3;
- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4;
- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4;
@end

@implementation LiveFSFPEnumeratorDataContainer

- (id)initForExtension:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)LiveFSFPEnumeratorDataContainer;
  v9 = [(LiveFSFPEnumeratorDataContainer *)&v25 init];
  v10 = v9;
  if (!v9)
  {
LABEL_15:
    v10 = v10;
    v12 = v10;
    goto LABEL_16;
  }
  objc_storeStrong((id *)&v9->ext, a3);
  objc_storeStrong((id *)&v10->_enumeratedItem, a4);
  v11 = [(LiveFSFPItemHelper *)v10->_enumeratedItem container];

  if (!v11)
  {
    [(LiveFSFPItemHelper *)v10->_enumeratedItem setContainer:v10];
    v10->_state = 0;
    uint64_t v13 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    ourEnumerators = v10->ourEnumerators;
    v10->ourEnumerators = (NSPointerArray *)v13;

    v10->_hasPersistentIDs = [v7 idsPersist];
    v10->_isDir = 0;
    v10->_isVolumeWide = 0;
    *(_WORD *)&v10->historyReset = 0;
    v10->_addParent = [(LiveFSFPExtensionHelper *)v10->ext fetchRoot];
    label = 0;
    v15 = [v7 domain];
    id v16 = [v15 identifier];
    v17 = (const char *)[v16 UTF8String];

    if (!v17) {
      v17 = "Mystery domain to be named never";
    }
    id v18 = [v8 fh];
    uint64_t v19 = [v18 UTF8String];

    v20 = "<root>";
    if (v19) {
      v20 = (const char *)v19;
    }
    asprintf(&label, "LiveFSFPEnumeratorDataContainer/%s/%s", v17, v20);
    if (label)
    {
      dispatch_queue_t v21 = dispatch_queue_create(label, 0);
      updateQueue = v10->updateQueue;
      v10->updateQueue = (OS_dispatch_queue *)v21;

      free(label);
    }
    if (!v10->updateQueue || !v10->ourEnumerators)
    {

      v10 = 0;
    }
    goto LABEL_15;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[LiveFSFPEnumeratorDataContainer initForExtension:item:]();
  }
  v12 = 0;
LABEL_16:

  return v12;
}

- (LiveFSFPEnumeratorDataContainer)initWithEnumeratedItem:(id)a3 fileHandle:(id)a4 extension:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(LiveFSFPEnumeratorDataContainer *)self initForExtension:a5 item:v8];
  if (v10)
  {
    v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[LiveFSFPEnumeratorDataContainer initWithEnumeratedItem:fileHandle:extension:]((uint64_t)v10, v8, v11);
    }

    objc_storeStrong((id *)&v10->_containerID, a4);
    int v12 = [v8 liType];
    v10->_isDir = v12 == +[LiveFSFPItemHelper dt_dir];
  }

  return v10;
}

- (void)dropInterestForEnumeratedItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 fh];
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[LiveFSFPEnumeratorDataContainer dropInterestForEnumeratedItem:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v19 = v6;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_INFO, "%s started item %@ fh %@", buf, 0x20u);
  }
  ext = self->ext;
  if (ext)
  {
    id v8 = [(LiveFSFPExtensionHelper *)ext serviceClient];
    if (v8)
    {
      id v9 = [v4 fh];
      [v8 LISCDropUpdateHandlerForInterestedItem:v9];
    }
  }
  else
  {
    id v8 = 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v10 = [(LiveFSFPExtensionHelper *)self->ext conn];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke;
  v16[3] = &unk_264934180;
  v16[4] = buf;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v16];

  int v12 = [v4 fh];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke_2;
  v15[3] = &unk_264934180;
  v15[4] = buf;
  [v11 setUpdateInterest:v12 interest:0 requestID:-1 reply:v15];

  if (*(void *)(*(void *)&buf[8] + 40))
  {
    uint64_t v13 = livefs_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = [v4 fh];
      [(LiveFSFPEnumeratorDataContainer *)v14 dropInterestForEnumeratedItem:v13];
    }
  }
  _Block_object_dispose(buf, 8);
}

void __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke(uint64_t a1, void *a2)
{
}

void __65__LiveFSFPEnumeratorDataContainer_dropInterestForEnumeratedItem___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)doShutdown
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL isActive = self->isActive;
    BOOL addedToExtension = self->_addedToExtension;
    enumeratedItem = self->_enumeratedItem;
    enumeratedItemID = self->_enumeratedItemID;
    v8[0] = 67109890;
    v8[1] = isActive;
    __int16 v9 = 1024;
    BOOL v10 = addedToExtension;
    __int16 v11 = 2112;
    int v12 = enumeratedItemID;
    __int16 v13 = 2112;
    v14 = enumeratedItem;
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_INFO, "dc doShutdown, isActive %d isAdded %d addedID %@ item %@", (uint8_t *)v8, 0x22u);
  }

  if (self->isActive)
  {
    [(LiveFSFPEnumeratorDataContainer *)self dropInterestForEnumeratedItem:self->_enumeratedItem];
    self->BOOL isActive = 0;
  }
  if (self->_addedToExtension)
  {
    [(LiveFSFPExtensionHelper *)self->ext removeEnumeratorForContainer:self->_enumeratedItemID];
    self->_BOOL addedToExtension = 0;
  }
}

- (void)doShutdownOnEnumeratorHelperQueue
{
  if (self->isActive)
  {
    [(LiveFSFPEnumeratorDataContainer *)self dropInterestForEnumeratedItem:self->_enumeratedItem];
    self->BOOL isActive = 0;
  }
  if (self->_addedToExtension)
  {
    ext = self->ext;
    id v4 = [(LiveFSFPItemHelper *)self->_enumeratedItem itemIdentifier];
    [(LiveFSFPExtensionHelper *)ext removeEnumeratorForContainerLocked:v4];
  }
}

- (void)dealloc
{
  [(LiveFSFPEnumeratorDataContainer *)self doShutdown];
  enumeratedItem = self->_enumeratedItem;
  if (enumeratedItem) {
    [(LiveFSFPItemHelper *)enumeratedItem setContainer:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)LiveFSFPEnumeratorDataContainer;
  [(LiveFSFPEnumeratorDataContainer *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  contentsSortedByDate = self->_contentsSortedByDate;
  self->_contentsSortedByDate = 0;

  contentsSortedByName = self->_contentsSortedByName;
  self->_contentsSortedByName = 0;

  [(LiveFSFPEnumeratorDataContainer *)self doShutdown];
  v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[LiveFSFPEnumeratorDataContainer invalidate]";
    __int16 v8 = 2048;
    __int16 v9 = self;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "%s: marking state as DEAD on %p", (uint8_t *)&v6, 0x16u);
  }

  self->_state = 3;
}

- (void)addEnumerator:(id)a3
{
  id v5 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(NSPointerArray *)v4->ourEnumerators addPointer:v5];
  objc_sync_exit(v4);
}

- (void)dropEnumerator:(id)a3
{
  id v6 = a3;
  objc_super v4 = self;
  objc_sync_enter(v4);
  [(NSPointerArray *)v4->ourEnumerators compact];
  for (unint64_t i = 0; i < [(NSPointerArray *)v4->ourEnumerators count]; ++i)
  {
    if ([(NSPointerArray *)v4->ourEnumerators pointerAtIndex:i] == v6)
    {
      [(NSPointerArray *)v4->ourEnumerators removePointerAtIndex:i];
      break;
    }
  }
  objc_sync_exit(v4);
}

- (void)dispatchOntoUpdateQueue:(id)a3
{
}

- (id)readDirBuffersForBufferBlock:(id)a3 andEntryBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2020000000;
  uint64_t v63 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x2020000000;
  uint64_t v59 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__3;
  v54 = __Block_byref_object_dispose__3;
  id v55 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  __int16 v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LiveFSFPEnumeratorDataContainer readDirBuffersForBufferBlock:andEntryBlock:](v8, v9, v10, v11, v12, v13, v14, v15);
  }

  id v16 = 0;
  int v17 = 1;
LABEL_4:
  int v32 = v17;
  v61[3] = 0;
  v57[3] = 0;
  id v18 = [(LiveFSFPExtensionHelper *)self->ext conn];
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke;
  v45[3] = &unk_264934180;
  v45[4] = &v50;
  uint64_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v45];

  while (!*((_DWORD *)v47 + 6) && !v51[5])
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    int v44 = 0;
    v20 = [(LiveFSFPItemHelper *)self->_enumeratedItem fh];
    uint64_t v21 = v57[3];
    uint64_t v22 = v61[3];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2;
    v34[3] = &unk_264934868;
    v37 = &v41;
    v38 = &v46;
    id v35 = v6;
    id v36 = v7;
    v39 = &v56;
    v40 = &v60;
    [v19 readDirectory:v20 amount:0x10000 requestedAttributes:0 cookie:v21 verifier:v22 requestID:-1 reply:v34];

    int v23 = *((_DWORD *)v42 + 6);
    if (v23)
    {
      if (v23 == -1002)
      {
        *((_DWORD *)v42 + 6) = 70;
LABEL_18:
        uint64_t v29 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:](LiveFSFPExtensionHelper, "getNSErrorFromLiveFSErrno:");
        v30 = (void *)v51[5];
        v51[5] = v29;

        id v28 = (id)v51[5];
        _Block_object_dispose(&v41, 8);
        goto LABEL_20;
      }
      if (v23 != -1000) {
        goto LABEL_18;
      }
      v24 = livefs_std_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22CE49000, v24, OS_LOG_TYPE_INFO, "Restarting lookup", buf, 2u);
      }

      _Block_object_dispose(&v41, 8);
      int v17 = v32 + 1;
      id v16 = v19;
      if (v32 == 6)
      {
        uint64_t v25 = +[LiveFSFPExtensionHelper getNSErrorFromLiveFSErrno:11];
        v26 = (void *)v51[5];
        v51[5] = v25;

        v27 = (void *)v51[5];
LABEL_16:
        id v28 = v27;
        goto LABEL_20;
      }
      goto LABEL_4;
    }

    _Block_object_dispose(&v41, 8);
  }
  v27 = (void *)v51[5];
  if (v27) {
    goto LABEL_16;
  }
  id v28 = 0;
LABEL_20:
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);

  return v28;
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke(uint64_t a1, void *a2)
{
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2(void *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = v9;
  if (a2 != -1001 && a2)
  {
    id v16 = livefs_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2_cold_1(a2, a3, v16);
    }

    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = a2;
  }
  else if (a2 == -1001 || !a3)
  {
    *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 1;
  }
  else
  {
    uint64_t v11 = [v9 bytes];
    if (a3 >= 1)
    {
      uint64_t v12 = v11;
      LODWORD(v13) = 0;
      char v14 = 0;
      while (1)
      {
        if (*(unsigned char *)(v12 + *(unsigned __int16 *)(v12 + 10)) != 46)
        {
          if ((v14 & 1) == 0) {
            (*(void (**)(void))(a1[4] + 16))();
          }
          (*(void (**)(void))(a1[5] + 16))();
          char v14 = 1;
        }
        if (*(void *)v12 == -1) {
          break;
        }
        uint64_t v15 = *(unsigned __int16 *)(v12 + 8);
        if (*(_WORD *)(v12 + 8))
        {
          uint64_t v13 = (v13 + v15);
          *(void *)(*(void *)(a1[8] + 8) + 24) = *(void *)v12;
          v12 += v15;
          if (v13 < a3) {
            continue;
          }
        }
        goto LABEL_20;
      }
      *(_DWORD *)(*(void *)(a1[7] + 8) + 24) = 1;
    }
LABEL_20:
    *(void *)(*(void *)(a1[9] + 8) + 24) = a4;
  }
}

- (id)loadContents
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = (void *)[MEMORY[0x263F522A8] newWithComparitor:&__block_literal_global_1];
  objc_super v4 = (void *)[MEMORY[0x263F522A8] newWithComparitor:&__block_literal_global_12];
  id v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(LiveFSFPItemHelper *)self->_enumeratedItem fh];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v6;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "Reading dir with fh %@", buf, 0xCu);
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_13;
  v17[3] = &unk_2649348B0;
  id v18 = v3;
  id v19 = v4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2_15;
  v14[3] = &unk_2649348D8;
  id v7 = v18;
  id v15 = v7;
  id v8 = v19;
  id v16 = v8;
  id v9 = [(LiveFSFPEnumeratorDataContainer *)self readDirBuffersForBufferBlock:v17 andEntryBlock:v14];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = self;
    objc_sync_enter(v12);
    objc_storeStrong((id *)&v12->_contentsSortedByName, v3);
    objc_storeStrong((id *)&v12->_contentsSortedByDate, v4);
    objc_sync_exit(v12);
  }
  return v10;
}

uint64_t __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcmp((const char *)(a2 + *(unsigned __int16 *)(a2 + 10)), (const char *)(a3 + *(unsigned __int16 *)(a3 + 10)));
}

uint64_t __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 112);
  uint64_t v4 = *(void *)(a3 + 112);
  BOOL v5 = v3 <= v4;
  if (v3 == v4)
  {
    uint64_t v6 = *(void *)(a2 + 120);
    uint64_t v7 = *(void *)(a3 + 120);
    BOOL v5 = v6 <= v7;
    if (v6 == v7) {
      return strcmp((const char *)(a2 + *(unsigned __int16 *)(a2 + 10)), (const char *)(a3 + *(unsigned __int16 *)(a3 + 10)));
    }
  }
  if (v5) {
    return 1;
  }
  return -1;
}

void __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 addDataBuffer:v4];
  [*(id *)(a1 + 40) addDataBuffer:v4];
}

void __47__LiveFSFPEnumeratorDataContainer_loadContents__block_invoke_2_15(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addEntry:a2];
  [*(id *)(a1 + 40) addEntry:a2];
  id v4 = livefs_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = a2;
    _os_log_impl(&dword_22CE49000, v4, OS_LOG_TYPE_DEFAULT, "Done adding %p", (uint8_t *)&v5, 0xCu);
  }
}

- (id)ensureConnectedForUpdates
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    containerID = v2->_containerID;
    int v5 = [(LiveFSFPItemHelper *)v2->_enumeratedItem fh];
    BOOL isActive = v2->isActive;
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = containerID;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v31) = isActive;
    WORD2(v31) = 2112;
    *(void *)((char *)&v31 + 6) = v2;
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_INFO, "Setting up for updates on %@ fh %@ active %d dc %@", buf, 0x26u);
  }
  if (v2->isActive)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = v2->ext;
    objc_sync_enter(v8);
    id v9 = [(LiveFSFPExtensionHelper *)v2->ext serviceClient];
    uint64_t v10 = [(LiveFSFPItemHelper *)v2->_enumeratedItem fh];
    int v11 = [v9 LISCAddUpdateHandler:v2 forInterestedItem:v10];

    objc_sync_exit(v8);
    if (v11 == 17)
    {
      uint64_t v12 = livefs_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = [(LiveFSFPItemHelper *)v2->_enumeratedItem fh];
        [(LiveFSFPEnumeratorDataContainer *)v13 ensureConnectedForUpdates];
      }
      id v7 = 0;
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      *(void *)&long long v31 = __Block_byref_object_copy__3;
      *((void *)&v31 + 1) = __Block_byref_object_dispose__3;
      id v32 = 0;
      char v14 = [(LiveFSFPExtensionHelper *)v2->ext conn];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke;
      v29[3] = &unk_264934180;
      v29[4] = buf;
      uint64_t v12 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v29];

      id v15 = [(LiveFSFPItemHelper *)v2->_enumeratedItem fh];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke_2;
      v28[3] = &unk_264934180;
      v28[4] = buf;
      [v12 setUpdateInterest:v15 interest:1 requestID:-1 reply:v28];

      uint64_t v16 = *(void *)&buf[8];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        int v17 = livefs_std_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          [(LiveFSFPEnumeratorDataContainer *)(uint64_t)v2 ensureConnectedForUpdates];
        }

        v24 = v2->ext;
        objc_sync_enter(v24);
        uint64_t v25 = [(LiveFSFPExtensionHelper *)v2->ext serviceClient];
        v26 = [(LiveFSFPItemHelper *)v2->_enumeratedItem fh];
        [v25 LISCDropUpdateHandlerForInterestedItem:v26];

        objc_sync_exit(v24);
        uint64_t v16 = *(void *)&buf[8];
      }
      else
      {
        v2->BOOL isActive = 1;
      }
      id v7 = *(id *)(v16 + 40);
      _Block_object_dispose(buf, 8);
    }
  }
  objc_sync_exit(v2);

  return v7;
}

void __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke(uint64_t a1, void *a2)
{
}

void __60__LiveFSFPEnumeratorDataContainer_ensureConnectedForUpdates__block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)doProcessItemDeleted:(id)a3
{
  id v7 = a3;
  id v4 = self->ext;
  objc_sync_enter(v4);
  int v5 = [(LiveFSFPExtensionHelper *)self->ext getItemForFileHandle:v7];
  uint64_t v6 = v5;
  if (v5) {
    [v5 setItemDeleted];
  }
  objc_sync_exit(v4);
}

- (void)doProcessItemUpdated:(id)a3
{
  uint64_t v3 = [(LiveFSFPExtensionHelper *)self->ext itemForIdentifier:a3 error:0];
  if (v3)
  {
    id v4 = v3;
    [v3 setAttributesStale];
    uint64_t v3 = v4;
  }
}

- (void)applyAddAcrossEnumerators:(id)a3 newName:(id)a4 forSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  int v11 = (void *)[(NSPointerArray *)v10->ourEnumerators copy];
  objc_sync_exit(v10);

  [v11 compact];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = 0;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      int v17 = v14;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v16);

        objc_msgSend(v14, "addInterestedItem:newName:forSelf:", v8, v9, v5, (void)v18);
        ++v16;
        int v17 = v14;
      }
      while (v13 != v16);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)applyDeleteAcrossEnumerators:(id)a3 newTombstone:(id)a4 toSelf:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  int v11 = (void *)[(NSPointerArray *)v10->ourEnumerators copy];
  objc_sync_exit(v10);

  [v11 compact];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = 0;
    uint64_t v15 = *(void *)v19;
    do
    {
      uint64_t v16 = 0;
      int v17 = v14;
      do
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v16);

        objc_msgSend(v14, "applyDelete:newTombstone:toSelf:", v8, v9, v5, (void)v18);
        ++v16;
        int v17 = v14;
      }
      while (v13 != v16);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }
}

- (void)applyParentUpdateAcrossEnumerators
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSPointerArray *)v2->ourEnumerators copy];
  objc_sync_exit(v2);

  [v3 compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v6 = *(id *)(*((void *)&v10 + 1) + 8 * v8);

        objc_msgSend(v6, "setAddParent:", 1, (void)v10);
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  if (![v4 count]) {
    v2->_addParent = 1;
  }
}

- (void)resetAllEnumerators
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSPointerArray *)v2->ourEnumerators copy];
  objc_sync_exit(v2);

  [v3 compact];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      id v9 = v6;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v6 = *(id *)(*((void *)&v10 + 1) + 8 * v8);

        objc_msgSend(v6, "resetHistory", (void)v10);
        ++v8;
        id v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)makeAllEnumeratorsDead
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = livefs_std_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    enumeratedItem = self->_enumeratedItem;
    if (enumeratedItem)
    {
      uint64_t v5 = [(LiveFSFPItemHelper *)self->_enumeratedItem filename];
    }
    else
    {
      uint64_t v5 = @"<no_enumerated_item>";
    }
    *(_DWORD *)buf = 138412290;
    long long v20 = v5;
    _os_log_impl(&dword_22CE49000, v3, OS_LOG_TYPE_INFO, "About to bulk-deaden enumerators for name '%@'", buf, 0xCu);
    if (enumeratedItem) {
  }
    }
  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = (void *)[(NSPointerArray *)v6->ourEnumerators copy];
  objc_sync_exit(v6);

  [v7 compact];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = 0;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v14 + 1) + 8 * i);

        id v10 = v13;
        objc_sync_enter(v10);
        objc_msgSend(v10, "setState:", 3, (void)v14);
        objc_sync_exit(v10);
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)handleEnumeratedItemChanged
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  contentsSortedByDate = v2->_contentsSortedByDate;
  v2->_contentsSortedByDate = 0;

  contentsSortedByName = v2->_contentsSortedByName;
  v2->_contentsSortedByName = 0;

  objc_sync_exit(v2);
  uint64_t v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    containerID = v2->_containerID;
    *(_DWORD *)buf = 136315394;
    id v13 = "-[LiveFSFPEnumeratorDataContainer handleEnumeratedItemChanged]";
    __int16 v14 = 2112;
    long long v15 = containerID;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "%s: blasted dir contents for %@", buf, 0x16u);
  }

  [(LiveFSFPItemHelper *)v2->_enumeratedItem setAttributesStale];
  uint64_t v7 = (void *)MEMORY[0x263F055B8];
  id v8 = [(NSFileProviderExtension *)v2->ext domain];
  uint64_t v9 = [v7 managerForDomain:v8];

  id v10 = v2->_containerID;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke;
  v11[3] = &unk_264934628;
  v11[4] = v2;
  [v9 signalEnumeratorForContainerItemIdentifier:v10 completionHandler:v11];
}

void __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = livefs_std_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke_cold_1();
    }
  }
  uint64_t v5 = livefs_std_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v7 = 136315394;
    id v8 = "-[LiveFSFPEnumeratorDataContainer handleEnumeratedItemChanged]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "%s: posted for container %@", (uint8_t *)&v7, 0x16u);
  }
}

- (void)deletedItem:(id)a3 name:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__LiveFSFPEnumeratorDataContainer_deletedItem_name_how_interestedItem___block_invoke;
  block[3] = &unk_2649340E0;
  id v18 = v11;
  id v19 = v10;
  int v22 = a5;
  id v20 = v12;
  uint64_t v21 = self;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(updateQueue, block);
}

uint64_t __71__LiveFSFPEnumeratorDataContainer_deletedItem_name_how_interestedItem___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 64);
    int v7 = 136315906;
    id v8 = "-[LiveFSFPEnumeratorDataContainer deletedItem:name:how:interestedItem:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_22CE49000, v2, OS_LOG_TYPE_INFO, "%s: starting for name %@ item %@ how %d", (uint8_t *)&v7, 0x26u);
  }

  objc_msgSend(*(id *)(a1 + 56), "applyDeleteAcrossEnumerators:newTombstone:toSelf:", *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 64), objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *(void *)(a1 + 48)));
  [*(id *)(a1 + 56) doProcessItemDeleted:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 56) handleEnumeratedItemChanged];
}

- (void)deletedName:(id)a3 item:(id)a4 how:(int)a5 interestedItem:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  updateQueue = self->updateQueue;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__LiveFSFPEnumeratorDataContainer_deletedName_item_how_interestedItem___block_invoke;
  v14[3] = &unk_264934900;
  id v15 = v9;
  id v16 = v10;
  int v18 = a5;
  long long v17 = self;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(updateQueue, v14);
}

uint64_t __71__LiveFSFPEnumeratorDataContainer_deletedName_item_how_interestedItem___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 56);
    int v7 = 136315906;
    id v8 = "-[LiveFSFPEnumeratorDataContainer deletedName:item:how:interestedItem:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    __int16 v13 = 1024;
    int v14 = v5;
    _os_log_impl(&dword_22CE49000, v2, OS_LOG_TYPE_INFO, "%s: starting for name %@ item %@ how %d", (uint8_t *)&v7, 0x26u);
  }

  [*(id *)(a1 + 48) applyDeleteAcrossEnumerators:*(void *)(a1 + 32) newTombstone:*(void *)(a1 + 32) toSelf:0];
  [*(id *)(a1 + 48) doProcessItemDeleted:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 48) handleEnumeratedItemChanged];
}

- (void)updatesDoneFor:(id)a3
{
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__LiveFSFPEnumeratorDataContainer_updatesDoneFor___block_invoke;
  block[3] = &unk_2649342C0;
  void block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __50__LiveFSFPEnumeratorDataContainer_updatesDoneFor___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[LiveFSFPEnumeratorDataContainer updatesDoneFor:]_block_invoke";
    _os_log_impl(&dword_22CE49000, v2, OS_LOG_TYPE_DEFAULT, "%s: about to deaden", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) makeAllEnumeratorsDead];
}

- (void)historyResetItem:(id)a3 interestedItem:(id)a4
{
  int v4 = self;
  objc_sync_enter(v4);
  if (!v4->_isVolumeWide) {
    v4->historyReset = 1;
  }
  objc_sync_exit(v4);

  updateQueue = v4->updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__LiveFSFPEnumeratorDataContainer_historyResetItem_interestedItem___block_invoke;
  block[3] = &unk_2649342C0;
  void block[4] = v4;
  dispatch_async(updateQueue, block);
}

uint64_t __67__LiveFSFPEnumeratorDataContainer_historyResetItem_interestedItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetAllEnumerators];
  v2 = *(void **)(a1 + 32);
  return [v2 handleEnumeratedItemChanged];
}

- (void)historyResetName:(id)a3 interestedItem:(id)a4
{
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__LiveFSFPEnumeratorDataContainer_historyResetName_interestedItem___block_invoke;
  block[3] = &unk_2649342C0;
  void block[4] = self;
  dispatch_async(updateQueue, block);
}

uint64_t __67__LiveFSFPEnumeratorDataContainer_historyResetName_interestedItem___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_sync_exit(v2);

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 handleEnumeratedItemChanged];
}

- (void)renamedItem:(id)a3 named:(id)a4 fromDirectory:(id)a5 intoDirectory:(id)a6 newName:(id)a7 atopItem:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  updateQueue = self->updateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke;
  block[3] = &unk_264934928;
  void block[4] = self;
  id v28 = v14;
  id v29 = v16;
  id v30 = v17;
  id v31 = v19;
  id v32 = v18;
  id v33 = v15;
  id v21 = v15;
  id v22 = v18;
  id v23 = v19;
  id v24 = v17;
  id v25 = v16;
  id v26 = v14;
  dispatch_async(updateQueue, block);
}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) extension];
  uint64_t v3 = [v2 enumeratorHelperQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2;
  block[3] = &unk_264934928;
  int v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  dispatch_sync(v3, block);
}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2(void *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1[4] + 56) extension];
  objc_sync_enter(v2);
  uint64_t v3 = [v2 getItemForFileHandle:a1[5]];
  int v4 = [v2 getItemForFileHandle:a1[6]];
  id v36 = [v2 getItemForFileHandle:a1[7]];
  if (a1[8])
  {
    int v5 = objc_msgSend(v2, "getItemForFileHandle:");
  }
  else
  {
    int v5 = 0;
  }
  id v6 = [v3 container];
  id v7 = [v4 container];
  id v35 = [v36 container];
  if (v5)
  {
    id v8 = [v5 container];
  }
  else
  {
    id v8 = 0;
  }
  objc_sync_exit(v2);

  id v9 = (id *)a1[4];
  BOOL v13 = v9 == v6 || v9 == v7 || v9 == v35 || v9 == v8;
  id v14 = livefs_std_log();
  id v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v38 = v6;
      __int16 v39 = 2112;
      v40 = v7;
      __int16 v41 = 2112;
      v42 = v35;
      __int16 v43 = 2112;
      int v44 = v8;
      _os_log_impl(&dword_22CE49000, v15, OS_LOG_TYPE_DEFAULT, "Containers 1 %@, 2 %@, 3 %@, 4 %@", buf, 0x2Au);
    }

    if (!v4 || v6 || v7)
    {
      if (v7)
      {
        if (v8)
        {
          id obj = v2;
          objc_sync_enter(obj);
          id v23 = v8[7];
          id v33 = v23;
          objc_storeStrong(v8 + 7, v7[7]);
          objc_storeStrong(v7 + 7, v23);
          id v24 = [obj serviceClient];
          [v24 LISCDropUpdateHandlerForInterestedItem:a1[6]];

          id v25 = [obj serviceClient];
          [v25 LISCDropUpdateHandlerForInterestedItem:a1[8]];

          id v26 = [obj serviceClient];
          [v26 LISCAddUpdateHandler:v8 forInterestedItem:a1[6]];

          [v7[7] setContainer:v7];
          [v8[7] setContainer:v8];
          objc_sync_exit(obj);
        }
        v27 = v7;
        objc_sync_enter(v27);
        [v27 doShutdownOnEnumeratorHelperQueue];
        objc_sync_exit(v27);

        [v27 applyDeleteAcrossEnumerators:@"not needed as this is a self delete" newTombstone:v27[8] toSelf:1];
        [v27 makeAllEnumeratorsDead];
        goto LABEL_38;
      }
    }
    else
    {
      [v4 setAttributesStale];
    }
    if (v8)
    {
      if (v4)
      {
        id v28 = v2;
        objc_sync_enter(v28);
        if (v5)
        {
          [v5 setItemDeleted];
        }
        [v4 setNewParent:v36 andName:a1[9]];
        objc_sync_exit(v28);

        int v5 = 0;
      }
      else
      {
        int v4 = [v2 itemAtPath:a1[9] parent:v36];
      }
      id v30 = v8;
      objc_sync_enter(v30);
      [v30 doShutdownOnEnumeratorHelperQueue];
      objc_sync_exit(v30);

      objc_storeStrong(v30 + 7, v4);
      [v4 setContainer:v30];
      id v31 = (id)[v30 ensureConnectedForUpdates];
      char v29 = 1;
      if (!v6) {
        goto LABEL_43;
      }
LABEL_42:
      [v6 applyDeleteAcrossEnumerators:a1[10] newTombstone:a1[10] toSelf:0];
LABEL_43:
      if (v35) {
        [v35 applyAddAcrossEnumerators:a1[9] newName:a1[9] forSelf:0];
      }
      if (v3) {
        [v3 setAttributesStale];
      }
      if (v36 && v3 != v36) {
        [v36 setAttributesStale];
      }
      id v32 = v2;
      objc_sync_enter(v32);
      if (v5)
      {
        [v5 recursivelySetChildrenDeleted];
        [v5 setItemDeleted];
      }
      if (v36 && v4)
      {
        if ((v29 & 1) == 0) {
          [v4 setNewParent:v36 andName:a1[9]];
        }
      }
      else if (v4)
      {
        [v4 recursivelySetChildrenDeleted];
        [v4 setItemDeleted];
      }
      objc_sync_exit(v32);

      if (v3) {
        [v3 performBlocksForRename:a1[10] onEHQueue:1];
      }
      if (v6) {
        [v6 handleEnumeratedItemChanged];
      }
      if (v7) {
        [v7 handleEnumeratedItemChanged];
      }
      if (v35) {
        [v35 handleEnumeratedItemChanged];
      }
      if (v8) {
        [v8 handleEnumeratedItemChanged];
      }
      goto LABEL_68;
    }
LABEL_38:
    char v29 = 0;
    if (!v6) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
  }

LABEL_68:
}

- (void)updatedItem:(id)a3 name:(id)a4 interestedItem:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  updateQueue = self->updateQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke;
  v15[3] = &unk_264934950;
  id v16 = v8;
  id v17 = v10;
  uint64_t v18 = self;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(updateQueue, v15);
}

void __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke(uint64_t a1)
{
  id v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = [*(id *)(a1 + 32) isEqualToString:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) applyAddAcrossEnumerators:*(void *)(a1 + 32) newName:*(void *)(a1 + 56) forSelf:v10];
  uint64_t v11 = *(void *)(a1 + 48);
  if (v10)
  {
    id v12 = *(id *)(v11 + 56);
  }
  else
  {
    id v12 = [*(id *)(v11 + 8) itemAtPath:*(void *)(a1 + 56) parent:*(void *)(v11 + 56)];
  }
  id v13 = v12;
  if (v12) {
    [v12 setAttributesStale];
  }
  [*(id *)(a1 + 48) handleEnumeratedItemChanged];
}

- (void)updatedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __62__LiveFSFPEnumeratorDataContainer_updatedName_interestedItem___block_invoke;
  v8[3] = &unk_264934338;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(updateQueue, v8);
}

void __62__LiveFSFPEnumeratorDataContainer_updatedName_interestedItem___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = livefs_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 136315394;
    id v7 = "-[LiveFSFPEnumeratorDataContainer updatedName:interestedItem:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl(&dword_22CE49000, v2, OS_LOG_TYPE_DEFAULT, "%s: starting for name %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v4 = [*(id *)(*(void *)(a1 + 40) + 8) itemAtPath:*(void *)(a1 + 32) parent:*(void *)(*(void *)(a1 + 40) + 56)];
  id v5 = v4;
  if (v4) {
    [v4 setAttributesStale];
  }
  [*(id *)(a1 + 40) applyAddAcrossEnumerators:*(void *)(a1 + 32) newName:*(void *)(a1 + 32) forSelf:0];
  [*(id *)(a1 + 40) handleEnumeratedItemChanged];
}

- (void)volumeWideDeletedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __72__LiveFSFPEnumeratorDataContainer_volumeWideDeletedName_interestedItem___block_invoke;
  v8[3] = &unk_264934338;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(updateQueue, v8);
}

uint64_t __72__LiveFSFPEnumeratorDataContainer_volumeWideDeletedName_interestedItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) applyDeleteAcrossEnumerators:*(void *)(a1 + 40) newTombstone:*(void *)(a1 + 40) toSelf:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 handleEnumeratedItemChanged];
}

- (void)volumeWideUpdatedName:(id)a3 interestedItem:(id)a4
{
  id v5 = a3;
  updateQueue = self->updateQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  _DWORD v8[2] = __72__LiveFSFPEnumeratorDataContainer_volumeWideUpdatedName_interestedItem___block_invoke;
  v8[3] = &unk_264934338;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(updateQueue, v8);
}

uint64_t __72__LiveFSFPEnumeratorDataContainer_volumeWideUpdatedName_interestedItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) applyAddAcrossEnumerators:*(void *)(a1 + 40) newName:*(void *)(a1 + 40) forSelf:0];
  id v2 = *(void **)(a1 + 32);
  return [v2 handleEnumeratedItemChanged];
}

- (BOOL)hasPersistentIDs
{
  return self->_hasPersistentIDs;
}

- (BOOL)isDir
{
  return self->_isDir;
}

- (BOOL)addedToExtension
{
  return self->_addedToExtension;
}

- (void)setAddedToExtension:(BOOL)a3
{
  self->_BOOL addedToExtension = a3;
}

- (BOOL)addParent
{
  return self->_addParent;
}

- (void)setAddParent:(BOOL)a3
{
  self->_addParent = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (BOOL)isVolumeWide
{
  return self->_isVolumeWide;
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (LiveFSFPItemHelper)enumeratedItem
{
  return (LiveFSFPItemHelper *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)enumeratedItemID
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEnumeratedItemID:(id)a3
{
}

- (LiveFSRBTree)contentsSortedByDate
{
  return (LiveFSRBTree *)objc_getProperty(self, a2, 72, 1);
}

- (LiveFSRBTree)contentsSortedByName
{
  return (LiveFSRBTree *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsSortedByName, 0);
  objc_storeStrong((id *)&self->_contentsSortedByDate, 0);
  objc_storeStrong((id *)&self->_enumeratedItemID, 0);
  objc_storeStrong((id *)&self->_enumeratedItem, 0);
  objc_storeStrong((id *)&self->updateQueue, 0);
  objc_storeStrong((id *)&self->ourEnumerators, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->ext, 0);
}

- (void)initForExtension:item:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_22CE49000, &_os_log_internal, OS_LOG_TYPE_ERROR, "initForExtension: _enumeratedItem.container != nil", v0, 2u);
}

- (void)initWithEnumeratedItem:(uint64_t)a1 fileHandle:(void *)a2 extension:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v6 = [a2 path];
  id v7 = [a2 itemIdentifier];
  int v10 = 134218754;
  uint64_t v11 = a1;
  OUTLINED_FUNCTION_3_1();
  id v12 = v6;
  __int16 v13 = 2048;
  id v14 = a2;
  __int16 v15 = v8;
  uint64_t v16 = v9;
  _os_log_debug_impl(&dword_22CE49000, a3, OS_LOG_TYPE_DEBUG, "enumerator helper[%p]: Creating enumerator for %@[%p] id %@", (uint8_t *)&v10, 0x2Au);
}

- (void)dropInterestForEnumeratedItem:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_22CE49000, log, OS_LOG_TYPE_ERROR, "Error clearing interest in updates on enumerator for %@", buf, 0xCu);
}

- (void)readDirBuffersForBufferBlock:(uint64_t)a3 andEntryBlock:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __78__LiveFSFPEnumeratorDataContainer_readDirBuffersForBufferBlock_andEntryBlock___block_invoke_2_cold_1(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "-[LiveFSFPEnumeratorDataContainer readDirBuffersForBufferBlock:andEntryBlock:]_block_invoke_2";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_22CE49000, log, OS_LOG_TYPE_DEBUG, "%s: ReadDir got result %d, bytes %zd", (uint8_t *)&v3, 0x1Cu);
}

- (void)ensureConnectedForUpdates
{
}

void __62__LiveFSFPEnumeratorDataContainer_handleEnumeratedItemChanged__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_22CE49000, v0, v1, "Error posting update: %@", v2, v3, v4, v5, v6);
}

void __98__LiveFSFPEnumeratorDataContainer_renamedItem_named_fromDirectory_intoDirectory_newName_atopItem___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__LiveFSFPEnumeratorDataContainer_updatedItem_name_interestedItem___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end