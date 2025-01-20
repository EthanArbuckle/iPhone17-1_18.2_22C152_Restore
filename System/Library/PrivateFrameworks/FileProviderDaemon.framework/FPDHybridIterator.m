@interface FPDHybridIterator
- (BOOL)done;
- (FPDHybridIterator)initWithItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5;
- (id)error;
- (id)nextWithError:(id *)a3;
- (unint64_t)numFoldersPopped;
- (void)dealloc;
@end

@implementation FPDHybridIterator

- (FPDHybridIterator)initWithItem:(id)a3 domain:(id)a4 enforceFPItem:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)FPDHybridIterator;
  v11 = [(FPDHybridIterator *)&v26 init];
  v12 = v11;
  if (v11)
  {
    p_domain = (id *)&v11->_domain;
    objc_storeStrong((id *)&v11->_domain, a4);
    p_rootItem = (id *)&v12->_rootItem;
    objc_storeStrong((id *)&v12->_rootItem, a3);
    uint64_t v15 = [(FPItem *)v12->_rootItem fileURL];
    rootURL = v12->_rootURL;
    v12->_rootURL = (NSURL *)v15;

    v12->_insideADatalessFolder = 0;
    v12->_enforceFPItem = a5;
    if (([(FPItem *)v12->_rootItem isPackage] & 1) != 0
      || [*p_rootItem isFolder]
      && (![*p_rootItem isDownloaded]
       || ([*p_domain supportsPickingFolders] & 1) == 0))
    {
      v21 = [MEMORY[0x1E4F25CB8] locatorForItem:*p_rootItem];
      v22 = [*p_domain provider];
      uint64_t v23 = +[FPDIterator iteratorForLocator:v21 provider:v22];
      datalessFolderIterator = v12->_datalessFolderIterator;
      v12->_datalessFolderIterator = (FPDIterator *)v23;

      [(FPDIterator *)v12->_datalessFolderIterator setShouldDecorateItems:1];
      v12->_insideADatalessFolder = 1;
    }
    else
    {
      v17 = [FPDDiskIterator alloc];
      v18 = [*p_rootItem fileURL];
      uint64_t v19 = [(FPDDiskIterator *)v17 initWithURL:v18 isDirectory:1];
      diskIterator = v12->_diskIterator;
      v12->_diskIterator = (FPDDiskIterator *)v19;
    }
  }

  return v12;
}

- (id)nextWithError:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  id v56 = 0;
  if (self->_insideADatalessFolder)
  {
    v5 = [(FPDIterator *)self->_datalessFolderIterator error];

    if (v5)
    {
      if (a3)
      {
        id v6 = [(FPDIterator *)self->_datalessFolderIterator error];
LABEL_9:
        id v9 = 0;
LABEL_10:
        id v10 = 0;
        *a3 = v6;
        goto LABEL_56;
      }
LABEL_16:
      id v9 = 0;
LABEL_17:
      id v10 = 0;
      goto LABEL_56;
    }
    datalessFolderIterator = self->_datalessFolderIterator;
    id v50 = 0;
    uint64_t v12 = [(FPDIterator *)datalessFolderIterator nextWithError:&v50];
    id v9 = v50;
    v13 = (void *)v52[5];
    v52[5] = v12;

    if (v52[5])
    {
      v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[FPDHybridIterator nextWithError:].cold.6();
      }

LABEL_15:
      id v10 = (id)v52[5];
      goto LABEL_56;
    }
    if (v9 || ![(FPDIterator *)self->_datalessFolderIterator done])
    {
      v25 = fp_current_or_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_super v26 = objc_msgSend(v9, "fp_prettyDescription");
        [(FPDHybridIterator *)v26 nextWithError:v25];
      }

      if (!a3) {
        goto LABEL_17;
      }
      id v6 = v9;
      goto LABEL_35;
    }
    self->_insideADatalessFolder = 0;
    unint64_t v23 = self->_totalDatalessFoldersPopped
        + [(FPDIterator *)self->_datalessFolderIterator numFoldersPopped];
    self->_totalDatalessFoldersPopped = v23;
    if (self->_diskIterator) {
      self->_totalDatalessFoldersPopped = v23 - 1;
    }
    v24 = self->_datalessFolderIterator;
    self->_datalessFolderIterator = 0;
  }
  diskIterator = self->_diskIterator;
  if (!diskIterator)
  {
    id v9 = 0;
    goto LABEL_19;
  }
  v8 = [(FPDDiskIterator *)diskIterator error];

  if (v8)
  {
    if (a3)
    {
      id v6 = [(FPDDiskIterator *)self->_diskIterator error];
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  uint64_t v15 = self->_diskIterator;
  id v49 = 0;
  uint64_t v16 = [(FPDDiskIterator *)v15 nextWithError:&v49];
  id v9 = v49;
  v17 = (void *)v52[5];
  v52[5] = v16;

  v18 = (void *)v52[5];
  if (!v18)
  {
    if (![(FPDDiskIterator *)self->_diskIterator done])
    {
      if (!a3) {
        goto LABEL_17;
      }
      id v6 = v9;
LABEL_35:
      id v9 = v6;
      goto LABEL_10;
    }
LABEL_19:
    id v10 = 0;
    self->_done = 1;
    goto LABEL_56;
  }
  char v48 = 0;
  uint64_t v19 = [v18 asURL];
  id v20 = [v19 path];
  [v20 fileSystemRepresentation];
  int is_dataless_fault_at = fpfs_is_dataless_fault_at();

  if (is_dataless_fault_at < 0)
  {
    v27 = fp_current_or_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v39 = [(id)v52[5] asURL];
      v40 = objc_msgSend(MEMORY[0x1E4F28C58], "fp_errorWithPOSIXCode:", *__error());
      *(_DWORD *)buf = 138412546;
      v58 = v39;
      __int16 v59 = 2112;
      v60 = v40;
      _os_log_error_impl(&dword_1D744C000, v27, OS_LOG_TYPE_ERROR, "[ERROR] FPDHybridIterator: encountered error during fpfs_is_dataless_fault_at for url: %@, %@", buf, 0x16u);
    }
    char v48 = 1;
  }
  else if (!self->_enforceFPItem)
  {
    v22 = fp_current_or_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[FPDHybridIterator nextWithError:].cold.4();
    }

    goto LABEL_15;
  }
  v28 = fp_current_or_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    -[FPDHybridIterator nextWithError:]();
  }

  v29 = dispatch_group_create();
  dispatch_group_enter(v29);
  v30 = [(FPDDomain *)self->_domain defaultBackend];
  v31 = [(id)v52[5] asURL];
  v32 = +[FPDRequest requestForSelf];
  uint64_t v41 = MEMORY[0x1E4F143A8];
  uint64_t v42 = 3221225472;
  v43 = __35__FPDHybridIterator_nextWithError___block_invoke;
  v44 = &unk_1E6A73620;
  v47 = &v51;
  v45 = self;
  v33 = v29;
  v46 = v33;
  [v30 itemForURL:v31 request:v32 completionHandler:&v41];

  dispatch_group_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_insideADatalessFolder)
  {
    v34 = fp_current_or_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[FPDHybridIterator nextWithError:](v34);
    }

    [(FPDDiskIterator *)self->_diskIterator skipDescendants];
    v35 = [(FPDIterator *)self->_datalessFolderIterator error];

    if (v35)
    {
      if (a3)
      {
        [(FPDIterator *)self->_datalessFolderIterator error];
        id v10 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = 0;
      }
      goto LABEL_55;
    }
    id v37 = [(FPDIterator *)self->_datalessFolderIterator nextWithError:a3];
  }
  else
  {
    v36 = fp_current_or_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[FPDHybridIterator nextWithError:]();
    }

    id v37 = (id)v52[5];
  }
  id v10 = v37;
LABEL_55:

LABEL_56:
  _Block_object_dispose(&v51, 8);

  return v10;
}

void __35__FPDHybridIterator_nextWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F25CB8] locatorForItem:v5];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (([v5 isDownloaded] & 1) == 0
      && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) isFolder])
    {
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v11 = [*(id *)(*(void *)(a1 + 32) + 40) provider];
      uint64_t v12 = +[FPDIterator iteratorForLocator:v10 provider:v11];
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 72);
      *(void *)(v13 + 72) = v12;

      [*(id *)(*(void *)(a1 + 32) + 72) setShouldDecorateItems:1];
      *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
    }
  }
  else
  {
    uint64_t v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __35__FPDHybridIterator_nextWithError___block_invoke_cold_1(a1, v6, v15);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (id)error
{
  if (self->_diskIterator)
  {
    if (!self->_insideADatalessFolder)
    {
      diskIterator = self->_diskIterator;
LABEL_6:
      v3 = [(FPDDiskIterator *)diskIterator error];
      goto LABEL_7;
    }
LABEL_5:
    diskIterator = (FPDDiskIterator *)self->_datalessFolderIterator;
    goto LABEL_6;
  }
  if (self->_insideADatalessFolder) {
    goto LABEL_5;
  }
  v3 = 0;
LABEL_7:
  return v3;
}

- (BOOL)done
{
  return self->_done;
}

- (unint64_t)numFoldersPopped
{
  diskIterator = self->_diskIterator;
  if (diskIterator) {
    uint64_t v4 = [(FPDDiskIterator *)diskIterator numFoldersPopped];
  }
  else {
    uint64_t v4 = 0;
  }
  datalessFolderIterator = self->_datalessFolderIterator;
  if (datalessFolderIterator) {
    v4 += [(FPDIterator *)datalessFolderIterator numFoldersPopped];
  }
  return self->_totalDatalessFoldersPopped + v4;
}

- (void)dealloc
{
  diskIterator = self->_diskIterator;
  self->_diskIterator = 0;

  datalessFolderIterator = self->_datalessFolderIterator;
  self->_datalessFolderIterator = 0;

  v5.receiver = self;
  v5.super_class = (Class)FPDHybridIterator;
  [(FPDHybridIterator *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskIterator, 0);
  objc_storeStrong((id *)&self->_datalessFolderIterator, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_rootItem, 0);
}

- (void)nextWithError:.cold.1()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] FPDHybridIterator: fetched FPItem %@", v2, v3, v4, v5, v6);
}

- (void)nextWithError:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: stepping in dataless folder iterator", v1, 2u);
}

- (void)nextWithError:.cold.3()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] FPDHybridIterator: fetching item enumerator for %@", v2, v3, v4, v5, v6);
}

- (void)nextWithError:.cold.4()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] FPDHybridIterator: enumerated item from disk: %@", v2, v3, v4, v5, v6);
}

- (void)nextWithError:(os_log_t)log .cold.5(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1D744C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: error while enuemrating the provider %@", buf, 0xCu);
}

- (void)nextWithError:.cold.6()
{
  OUTLINED_FUNCTION_0_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_1D744C000, v0, v1, "[DEBUG] FPDHybridIterator: enumerating provider item %@", v2, v3, v4, v5, v6);
}

void __35__FPDHybridIterator_nextWithError___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) asURL];
  uint8_t v6 = objc_msgSend(a2, "fp_prettyDescription");
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] FPDHybridIterator: failed to fetchItemForURL:%@ - %@", (uint8_t *)&v7, 0x16u);
}

@end