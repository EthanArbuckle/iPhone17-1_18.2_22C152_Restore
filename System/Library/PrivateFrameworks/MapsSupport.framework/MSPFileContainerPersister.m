@interface MSPFileContainerPersister
- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 forNewContents:(id)a5 edits:(id)a6 appliedToOldContents:(id)a7 error:(id *)a8;
- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 mergingCurrentState:(id)a5 withState:(id)a6 mergeOptions:(id)a7 error:(id *)a8;
- (MSPFileContainerPersister)init;
- (MSPFileContainerPersister)initWithPersistenceFileAtURL:(id)a3;
- (NSURL)persistenceFileURL;
- (OS_dispatch_queue)ioQueue;
- (id)commitByCreatingStateSnapshotAndDataWithCreationHandler:(id)a3 error:(id *)a4;
- (id)newStateSnapshot;
- (id)stateSnapshotFromData:(id)a3;
- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5;
- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6;
- (void)eraseWithCompletion:(id)a3;
- (void)fetchStateSnapshotWithCompletion:(id)a3;
- (void)setIoQueue:(id)a3;
@end

@implementation MSPFileContainerPersister

- (MSPFileContainerPersister)init
{
  result = (MSPFileContainerPersister *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (MSPFileContainerPersister)initWithPersistenceFileAtURL:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSPFileContainerPersister;
  v5 = [(MSPFileContainerPersister *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    persistenceFileURL = v5->_persistenceFileURL;
    v5->_persistenceFileURL = (NSURL *)v6;

    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.Maps.MSPContainerPersister.io", v8);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v9;
  }
  return v5;
}

- (id)newStateSnapshot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    persistenceFileURL = self->_persistenceFileURL;
    int v10 = 138412290;
    v11 = persistenceFileURL;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEBUG, "Reading persisted data from %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:self->_persistenceFileURL options:1 error:0];
  uint64_t v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self->_persistenceFileURL;
    int v10 = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_DEBUG, "Read persisted data from %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = [(MSPFileContainerPersister *)self stateSnapshotFromData:v5];

  return v8;
}

- (void)fetchStateSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(MSPFileContainerPersister *)self ioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = (void *)[WeakRetained newStateSnapshot];
    v5 = dispatch_get_global_queue(-32768, 0);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke_31;
    v8[3] = &unk_1E617D7A0;
    id v6 = *(id *)(a1 + 32);
    id v9 = v4;
    id v10 = v6;
    v7 = v4;
    dispatch_async(v5, v8);
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[MSPFileContainerPersister fetchStateSnapshotWithCompletion:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = 93;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __62__MSPFileContainerPersister_fetchStateSnapshotWithCompletion___block_invoke_31(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)commitEditWithNewContents:(id)a3 edits:(id)a4 appliedToOldContents:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_initWeak(&location, self);
  int v14 = [(MSPFileContainerPersister *)self ioQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke;
  v19[3] = &unk_1E617EF30;
  objc_copyWeak(&v24, &location);
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke(id *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_33;
    v15[3] = &unk_1E617EF08;
    objc_copyWeak(&v19, v2);
    id v16 = a1[4];
    id v17 = a1[5];
    id v18 = a1[6];
    id v14 = 0;
    id v4 = [WeakRetained commitByCreatingStateSnapshotAndDataWithCreationHandler:v15 error:&v14];
    id v5 = v14;
    id v6 = dispatch_get_global_queue(-32768, 0);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_35;
    v10[3] = &unk_1E617EBE8;
    id v7 = a1[7];
    id v12 = v5;
    id v13 = v7;
    id v11 = v4;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, v10);

    objc_destroyWeak(&v19);
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[MSPFileContainerPersister commitEditWithNewContents:edits:appliedToOldContents:completion:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 105;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = [WeakRetained getSnapshot:a2 data:a3 forNewContents:*(void *)(a1 + 32) edits:*(void *)(a1 + 40) appliedToOldContents:*(void *)(a1 + 48) error:a4];
  }
  else
  {
    id v11 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315394;
      id v14 = "-[MSPFileContainerPersister commitEditWithNewContents:edits:appliedToOldContents:completion:]_block_invoke";
      __int16 v15 = 1024;
      int v16 = 109;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v13, 0x12u);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

uint64_t __93__MSPFileContainerPersister_commitEditWithNewContents_edits_appliedToOldContents_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)commitByMergingWithStateSnapshot:(id)a3 mergeOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(MSPFileContainerPersister *)self ioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke;
  block[3] = &unk_1E617D958;
  objc_copyWeak(&v19, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke(id *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_36;
    v15[3] = &unk_1E617EF58;
    objc_copyWeak(&v18, v2);
    id v16 = a1[4];
    id v17 = a1[5];
    id v14 = 0;
    id v4 = [WeakRetained commitByCreatingStateSnapshotAndDataWithCreationHandler:v15 error:&v14];
    id v5 = v14;
    id v6 = dispatch_get_global_queue(-32768, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_37;
    block[3] = &unk_1E617EBE8;
    id v7 = a1[6];
    id v12 = v5;
    id v13 = v7;
    id v11 = v4;
    id v8 = v4;
    id v9 = v5;
    dispatch_async(v6, block);

    objc_destroyWeak(&v18);
  }
  else
  {
    id v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[MSPFileContainerPersister commitByMergingWithStateSnapshot:mergeOptions:completion:]_block_invoke";
      __int16 v21 = 1024;
      int v22 = 123;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
    }
  }
}

uint64_t __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    id v10 = (void *)[WeakRetained newStateSnapshot];
    uint64_t v11 = [v9 getSnapshot:a2 data:a3 mergingCurrentState:v10 withState:*(void *)(a1 + 32) mergeOptions:*(void *)(a1 + 40) error:a4];
  }
  else
  {
    id v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      __int16 v15 = "-[MSPFileContainerPersister commitByMergingWithStateSnapshot:mergeOptions:completion:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = 127;
      _os_log_impl(&dword_1B87E5000, v12, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", (uint8_t *)&v14, 0x12u);
    }

    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __86__MSPFileContainerPersister_commitByMergingWithStateSnapshot_mergeOptions_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)commitByCreatingStateSnapshotAndDataWithCreationHandler:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (uint64_t (**)(id, id *, id *, id *))a3;
  id v7 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    persistenceFileURL = self->_persistenceFileURL;
    *(_DWORD *)buf = 138412290;
    v25 = persistenceFileURL;
    _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_DEBUG, "Writing persisted data to %@", buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [(NSURL *)self->_persistenceFileURL URLByDeletingLastPathComponent];
  int v11 = [v9 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:a4];

  id v12 = 0;
  if (v11)
  {
    id v22 = 0;
    id v23 = 0;
    int v13 = v6[2](v6, &v23, &v22, a4);
    id v14 = v23;
    id v15 = v22;
    __int16 v16 = v15;
    if (v13) {
      int v17 = [v15 writeToURL:self->_persistenceFileURL options:536870913 error:a4];
    }
    else {
      int v17 = 0;
    }
    uint64_t v18 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      id v19 = self->_persistenceFileURL;
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_DEBUG, "Wrote persisted data to %@", buf, 0xCu);
    }

    if (v17) {
      id v20 = v14;
    }
    else {
      id v20 = 0;
    }
    id v12 = v20;
  }

  return v12;
}

- (void)eraseWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(MSPFileContainerPersister *)self ioQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke;
  block[3] = &unk_1E617EBC0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v4 = [WeakRetained persistenceFileURL];
    id v19 = 0;
    int v5 = [v3 removeItemAtURL:v4 error:&v19];
    id v6 = v19;

    if (v5)
    {
      id v7 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_39;
      block[3] = &unk_1E617D980;
      id v8 = &v18;
      id v18 = *(id *)(a1 + 32);
      dispatch_async(v7, block);
LABEL_15:

      goto LABEL_16;
    }
    id v9 = [v6 domain];
    if ([v9 isEqual:*MEMORY[0x1E4F28798]] && [v6 code] == 2)
    {
      id v10 = v9;
      id v9 = v6;
      id v6 = 0;
    }
    else
    {
      id v10 = [v6 domain];
      if ([v10 isEqual:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v11 = [v6 code];

        if (v11 != 4)
        {
LABEL_14:
          int v13 = dispatch_get_global_queue(-32768, 0);
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_2;
          v14[3] = &unk_1E617D7A0;
          id v8 = &v16;
          id v16 = *(id *)(a1 + 32);
          id v6 = v6;
          id v15 = v6;
          dispatch_async(v13, v14);

          id v7 = v15;
          goto LABEL_15;
        }
        id v12 = 0;
LABEL_13:

        id v6 = v12;
        goto LABEL_14;
      }
    }
    id v12 = v6;

    id v6 = v9;
    goto LABEL_13;
  }
  id v6 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v21 = "-[MSPFileContainerPersister eraseWithCompletion:]_block_invoke";
    __int16 v22 = 1024;
    int v23 = 167;
    _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", buf, 0x12u);
  }
LABEL_16:
}

uint64_t __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__MSPFileContainerPersister_eraseWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 forNewContents:(id)a5 edits:(id)a6 appliedToOldContents:(id)a7 error:(id *)a8
{
  if (a8)
  {
    *a8 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  }
  return 0;
}

- (BOOL)getSnapshot:(id *)a3 data:(id *)a4 mergingCurrentState:(id)a5 withState:(id)a6 mergeOptions:(id)a7 error:(id *)a8
{
  if (a8)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.MapsSupport.MSPContainer", 6, 0, a6, a7);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)stateSnapshotFromData:(id)a3
{
  return 0;
}

- (NSURL)persistenceFileURL
{
  return self->_persistenceFileURL;
}

- (OS_dispatch_queue)ioQueue
{
  return self->_ioQueue;
}

- (void)setIoQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioQueue, 0);

  objc_storeStrong((id *)&self->_persistenceFileURL, 0);
}

@end