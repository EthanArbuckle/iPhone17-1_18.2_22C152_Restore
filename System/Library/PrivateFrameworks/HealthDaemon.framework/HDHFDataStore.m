@interface HDHFDataStore
+ (uint64_t)_errorIndicatesCorruption:(uint64_t)a1;
- (BOOL)_createNewStore:(id *)a3;
- (BOOL)_requiresRebuildForState:(BOOL)result;
- (BOOL)accessStoreWithError:(id *)a3 block:(id)a4;
- (BOOL)deleteHFDAt:(id)a3 error:(id *)a4;
- (BOOL)discardStoreWithError:(id *)a3;
- (BOOL)isOpen;
- (BOOL)moveHFDAsideWithoutOverwritingFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (HDHFDataStore)initWithPath:(id)a3;
- (HDHFDataStore)initWithPath:(id)a3 fileSystem:(shared_ptr<health::VirtualFilesystem>)a4;
- (HDHFDataStoreDelegate)delegate;
- (NSString)fileSystemPath;
- (id).cxx_construct;
- (id)_walPathForHFDAtPath:(uint64_t)a1;
- (id)_writeaheadLogURLForHFDAtURL:(uint64_t)a1;
- (id)description;
- (id)diagnosticDescription;
- (id)directoryURL;
- (id)fileManager;
- (int64_t)deleteSQLiteMigrationArchive:(id *)a3;
- (int64_t)rebuildState;
- (int64_t)rebuildWithTransaction:(id)a3 error:(id *)a4;
- (uint64_t)_convertExceptionsToError:(void *)a3 inBlock:;
- (uint64_t)_deleteFileAtURL:(void *)a3 error:;
- (uint64_t)_lock_archiveHFDTo:(uint64_t)a3 nextState:(void *)a4 error:;
- (uint64_t)_lock_deleteCompressedArchive:(os_unfair_lock *)a1;
- (uint64_t)_lock_rebuildOneStep:(uint64_t)a1;
- (uint64_t)_moveFileOnlyIfDestinationEmptyFromURL:(void *)a3 toURL:(void *)a4 error:;
- (unique_ptr<health::DataStore,)dataStoreAtURL:(id)a3 filesystem:(const void *)a4 allowCheckpoint:(BOOL)a5 error:(id *)a6;
- (void)_requestHFDRebuild;
- (void)dealloc;
- (void)flushForInvalidation:(BOOL)a3;
- (void)requestHFDToSQLiteMigration;
- (void)setDelegate:(id)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setRebuildState:(uint64_t)a1;
- (void)unitTest_requestMigrationToSQLite;
- (void)unitTest_requestRebuild;
- (void)unitTest_resetRebuildState;
@end

@implementation HDHFDataStore

- (id)_writeaheadLogURLForHFDAtURL:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = [v3 URLByDeletingPathExtension];
    v6 = [v5 URLByAppendingPathExtension:@"hfd-wal"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_moveFileOnlyIfDestinationEmptyFromURL:(void *)a3 toURL:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v9 = [a1 fileManager];
    v10 = NSString;
    id v11 = v8;
    v12 = objc_msgSend(v10, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
    char v13 = [v9 fileExistsAtPath:v12];

    if (v13)
    {
      uint64_t v14 = 1;
    }
    else
    {
      id v21 = 0;
      char v15 = [v9 moveItemAtURL:v7 toURL:v11 error:&v21];
      id v16 = v21;
      v17 = v16;
      if (v15 & 1) != 0 || (objc_msgSend(v16, "hk_isCocoaNoSuchFileError"))
      {
        uint64_t v14 = 1;
      }
      else
      {
        id v18 = v17;
        v19 = v18;
        if (v18)
        {
          if (a4) {
            *a4 = v18;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v14 = 0;
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)_deleteFileAtURL:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    v6 = [a1 fileManager];
    id v13 = 0;
    char v7 = [v6 removeItemAtURL:v5 error:&v13];
    id v8 = v13;

    if (v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError"))
    {
      uint64_t v9 = 1;
    }
    else
    {
      id v10 = v8;
      id v11 = v10;
      if (v10)
      {
        if (a3) {
          *a3 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (unique_ptr<health::DataStore,)dataStoreAtURL:(id)a3 filesystem:(const void *)a4 allowCheckpoint:(BOOL)a5 error:(id *)a6
{
  id v10 = v6;
  id v11 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3812000000;
  v24 = __Block_byref_object_copy__103;
  v25 = __Block_byref_object_dispose__103;
  uint64_t v26 = 0;
  v27 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HDHFDataStore_HFDMigrationSupport__dataStoreAtURL_filesystem_allowCheckpoint_error___block_invoke;
  v16[3] = &unk_1E6301A40;
  BOOL v20 = a5;
  id v18 = &v21;
  id v12 = v11;
  id v17 = v12;
  v19 = a4;
  hfd_catchExceptionsAsErrors(v16, (uint64_t)a6, 0);
  uint64_t v13 = v22[6];
  v22[6] = 0;
  void *v10 = v13;

  _Block_object_dispose(&v21, 8);
  uint64_t v14 = v27;
  v27 = 0;
  if (v14)
  {
    health::TransactionalFile::~TransactionalFile(v14);
    MEMORY[0x1C187B8A0]();
  }

  return v15;
}

void __86__HDHFDataStore_HFDMigrationSupport__dataStoreAtURL_filesystem_allowCheckpoint_error___block_invoke(uint64_t a1)
{
}

- (BOOL)moveHFDAsideWithoutOverwritingFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (-[HDHFDataStore _moveFileOnlyIfDestinationEmptyFromURL:toURL:error:](self, v8, v9, a5))
  {
    id v10 = -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v9);
    id v11 = -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v8);
    char v12 = -[HDHFDataStore _moveFileOnlyIfDestinationEmptyFromURL:toURL:error:](self, v11, v10, a5);
    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v13 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v17 = *a5;
        int v18 = 138543362;
        id v19 = v17;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Failed to move production HFD WAL aside (%{public}@)", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      id v16 = *a5;
      int v18 = 138543362;
      id v19 = v16;
      _os_log_error_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_ERROR, "Failed to move production HFD aside (%{public}@)", (uint8_t *)&v18, 0xCu);
    }
    char v12 = 0;
  }

  return v12;
}

- (BOOL)deleteHFDAt:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (-[HDHFDataStore _deleteFileAtURL:error:](self, v6, a4))
  {
    char v7 = -[HDHFDataStore _writeaheadLogURLForHFDAtURL:]((uint64_t)self, v6);
    char v8 = -[HDHFDataStore _deleteFileAtURL:error:](self, v7, a4);
    if ((v8 & 1) == 0)
    {
      _HKInitializeLogging();
      id v9 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        id v13 = *a4;
        int v14 = 138543618;
        id v15 = v7;
        __int16 v16 = 2114;
        id v17 = v13;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Failed to delete HFD WAL at '%{public}@' (%{public}@)", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      id v12 = *a4;
      int v14 = 138543618;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v12;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "Failed to delete HFD at '%{public}@' (%{public}@)", (uint8_t *)&v14, 0x16u);
    }
    char v8 = 0;
  }

  return v8;
}

- (HDHFDataStore)initWithPath:(id)a3
{
  uint64_t v5 = 0;
  id v6 = 0;
  id v3 = [(HDHFDataStore *)self initWithPath:a3 fileSystem:&v5];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return v3;
}

- (HDHFDataStore)initWithPath:(id)a3 fileSystem:(shared_ptr<health::VirtualFilesystem>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HDHFDataStore;
  char v8 = [(HDHFDataStore *)&v17 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_fileSystemPath, a3);
    id v11 = *(VirtualFilesystem **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_fileSystem.__cntrl_;
    v9->_fileSystem.__ptr_ = v11;
    v9->_fileSystem.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v9->_lock._os_unfair_lock_opaque = 0;
    id v13 = (std::__shared_weak_count *)v9->_highFrequencyDataStore.__cntrl_;
    v9->_highFrequencyDataStore.__ptr_ = 0;
    v9->_highFrequencyDataStore.__cntrl_ = 0;
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    uint64_t v14 = HKCreateSerialDispatchQueue();
    openQueue = v9->_openQueue;
    v9->_openQueue = (OS_dispatch_queue *)v14;
  }
  return v9;
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v3 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"HDHFDataStore.mm", 285, @"Invalid parameter not satisfying: %@", @"atomic_load(&_invalidated)" object file lineNumber description];
  }
  v6.receiver = self;
  v6.super_class = (Class)HDHFDataStore;
  [(HDHFDataStore *)&v6 dealloc];
}

- (BOOL)isOpen
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_hasOpenStore);
  return v2 & 1;
}

- (id)_walPathForHFDAtPath:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v5 = [v3 stringByDeletingPathExtension];
    objc_super v6 = [v5 stringByAppendingPathExtension:@"hfd-wal"];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (id)description
{
  if (self->_highFrequencyDataStore.__ptr_)
  {
    id v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    objc_super v6 = (void *)v5;
    unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_invalidated);
    if (v7) {
      char v8 = "INVALIDATED";
    }
    else {
      char v8 = "";
    }
    uint64_t v9 = [v3 stringWithFormat:@"<%@:%p %@ %s OPEN>", v5, self, self->_fileSystemPath, v8];
  }
  else
  {
    unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_hasOpenStore);
    id v11 = NSString;
    id v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    objc_super v6 = (void *)v13;
    unsigned __int8 v14 = atomic_load((unsigned __int8 *)&self->_invalidated);
    if (v14) {
      id v15 = "INVALIDATED";
    }
    else {
      id v15 = "";
    }
    if (v10) {
      [v11 stringWithFormat:@"<%@:%p %@ %s PENDING DISCARD>", v13, self, self->_fileSystemPath, v15];
    }
    else {
    uint64_t v9 = [v11 stringWithFormat:@"<%@:%p %@ %s closed>", v13, self, self->_fileSystemPath, v15];
    }
  }
  __int16 v16 = (void *)v9;

  return v16;
}

- (id)diagnosticDescription
{
  id v37 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v37 setDateStyle:2];
  [v37 setTimeStyle:0];
  id v3 = [(HDHFDataStore *)self fileSystemPath];
  v35 = [v3 stringByDeletingLastPathComponent];
  v4 = [(HDHFDataStore *)self fileManager];
  id v43 = 0;
  v36 = v4;
  uint64_t v5 = [v4 attributesOfItemAtPath:v3 error:&v43];
  id v6 = v43;
  unsigned __int8 v7 = v6;
  if (v5)
  {
    v39 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
    char v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
  }
  else if (objc_msgSend(v6, "hk_isCocoaNoSuchFileError"))
  {
    v39 = [NSNumber numberWithDouble:0.0];
    char v8 = 0;
  }
  else
  {
    char v8 = 0;
    v39 = 0;
  }
  uint64_t v9 = -[HDHFDataStore _walPathForHFDAtPath:]((uint64_t)self, v3);
  id v42 = v7;
  unsigned __int8 v10 = [v4 attributesOfItemAtPath:v9 error:&v42];
  id v11 = v42;

  if (v10)
  {
    v38 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
  }
  else if (objc_msgSend(v11, "hk_isCocoaNoSuchFileError"))
  {
    v38 = [NSNumber numberWithDouble:0.0];
  }
  else
  {
    v38 = 0;
  }
  id v12 = NSString;
  uint64_t v13 = sizeStringForNumber(v39);
  if (v8)
  {
    unsigned __int8 v14 = [v37 stringFromDate:v8];
  }
  else
  {
    unsigned __int8 v14 = @"<unknown>";
  }
  id v15 = sizeStringForNumber(v38);
  objc_msgSend(v12, "stringWithFormat:", @"\nHFD size: %@ (created %@; WAL size %@; rebuild state %ld)",
    v13,
    v14,
    v15,
  __int16 v16 = [(HDHFDataStore *)self rebuildState]);

  if (v8) {
  if ([(HDHFDataStore *)self rebuildState] >= 2
  }
    && [(HDHFDataStore *)self rebuildState] < 6)
  {
    v33 = [v35 stringByAppendingPathComponent:@"healthdb_archive.hfd"];
    uint64_t v18 = -[HDHFDataStore _walPathForHFDAtPath:]((uint64_t)self, v33);
    id v41 = v11;
    id v19 = [v36 attributesOfItemAtPath:v18 error:&v41];
    id v20 = v41;

    if (v19)
    {
      uint64_t v21 = v33;
      v32 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
    }
    else
    {
      uint64_t v21 = v33;
      if (objc_msgSend(v20, "hk_isCocoaNoSuchFileError"))
      {
        v32 = [NSNumber numberWithDouble:0.0];
      }
      else
      {
        v32 = 0;
      }
    }
    if (([v36 fileExistsAtPath:v21] & 1) == 0)
    {
      uint64_t v22 = [v35 stringByAppendingPathComponent:@"healthdb_archive.hfd.tgz"];

      uint64_t v21 = (void *)v22;
    }
    id v40 = v20;
    unsigned __int8 v10 = [v36 attributesOfItemAtPath:v21 error:&v40];
    v34 = v21;
    id v11 = v40;

    if (v10)
    {
      uint64_t v23 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28390]];
      v24 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F282C0]];
    }
    else if (objc_msgSend(v11, "hk_isCocoaNoSuchFileError"))
    {
      uint64_t v23 = [NSNumber numberWithDouble:0.0];
      v24 = 0;
    }
    else
    {
      v24 = 0;
      uint64_t v23 = 0;
    }
    v25 = NSString;
    v31 = v23;
    uint64_t v26 = sizeStringForNumber(v23);
    if (v24)
    {
      v27 = [v37 stringFromDate:v24];
    }
    else
    {
      v27 = @"<unknown>";
    }
    v28 = sizeStringForNumber(v32);
    v29 = [v25 stringWithFormat:@"\nHFD archive size: %@ (created %@; WAL size %@)", v26, v27, v28];

    if (v24) {
    id v17 = [v16 stringByAppendingString:v29];
    }
  }
  else
  {
    id v17 = v16;
  }

  return v17;
}

- (void)flushForInvalidation:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x4012000000;
  char v8 = __Block_byref_object_copy__155;
  uint64_t v9 = __Block_byref_object_dispose__155;
  unsigned __int8 v10 = &unk_1BD44B655;
  uint64_t v11 = 0;
  id v12 = 0;
  HKWithUnfairLock();
  if (v6[6])
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v14 = self;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Closing store", buf, 0xCu);
    }
    atomic_store(0, (unsigned __int8 *)&self->_hasOpenStore);
    _HDHFDataStoreWillCloseStore(self);
    health::TransactionalFile::invalidate((health::TransactionalFile *)v6[6]);
  }
  _Block_object_dispose(&v5, 8);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
}

void __38__HDHFDataStore_flushForInvalidation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 48)) {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 48));
  }
  _HKInitializeLogging();
  unsigned __int8 v2 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Discarding store and preparing for flush.", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v4 + 32);
  uint64_t v6 = *(void *)(v4 + 40);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  char v8 = *(std::__shared_weak_count **)(v5 + 56);
  *(void *)(v5 + 48) = v7;
  *(void *)(v5 + 56) = v6;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  unsigned __int8 v10 = *(std::__shared_weak_count **)(v9 + 40);
  *(void *)(v9 + 32) = 0;
  *(void *)(v9 + 40) = 0;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

- (BOOL)discardStoreWithError:(id *)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__355;
  __int16 v16 = __Block_byref_object_dispose__356;
  id v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  HKWithUnfairLock();
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = (id)v13[5];
    uint64_t v6 = v5;
    if (v5)
    {
      if (a3) {
        *a3 = v5;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v4 = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v4;
}

void __39__HDHFDataStore_discardStoreWithError___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = (HDHFDataStore *)a1[4];
  if (v2->_highFrequencyDataStore.__ptr_)
  {
    _HDHFDataStoreWillCloseStore(v2);
    uint64_t v3 = a1[4];
    BOOL v4 = *(std::__shared_weak_count **)(v3 + 40);
    *(void *)(v3 + 32) = 0;
    *(void *)(v3 + 40) = 0;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    atomic_store(0, (unsigned __int8 *)(a1[4] + 49));
    unsigned __int8 v2 = (HDHFDataStore *)a1[4];
  }
  id v5 = [(HDHFDataStore *)v2 fileManager];
  uint64_t v6 = *(void *)(a1[4] + 88);
  uint64_t v7 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v5 removeItemAtPath:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8 & 1) != 0 || (objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "hk_isCocoaNoSuchFileError"))
  {
    uint64_t v9 = [*(id *)(a1[4] + 88) stringByDeletingPathExtension];
    uint64_t v10 = [v9 stringByAppendingPathExtension:@"hfd-wal"];

    uint64_t v11 = *(void *)(a1[5] + 8);
    id v17 = *(id *)(v11 + 40);
    char v12 = [v5 removeItemAtPath:v10 error:&v17];
    objc_storeStrong((id *)(v11 + 40), v17);
    if ((v12 & 1) != 0
      || (objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "hk_isCocoaNoSuchFileError") & 1) != 0)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v15 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(*(void *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = v16;
        _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "Unable to delete HFD writeahead log (%{public}@)", buf, 0xCu);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v13 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543362;
      uint64_t v20 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "Unable to delete HFD (%{public}@)", buf, 0xCu);
    }
  }
}

- (BOOL)_createNewStore:(id *)a3
{
  [(HDHFDataStore *)self flushForInvalidation:0];
  id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:self->_fileSystemPath];
  id v12 = 0;
  BOOL v6 = [(HDHFDataStore *)self deleteHFDAt:v5 error:&v12];
  id v7 = v12;

  if (v6 || objc_msgSend(v7, "hk_isCocoaNoSuchFileError"))
  {
    -[HDHFDataStore setRebuildState:]((uint64_t)self, 100);
    BOOL v8 = 1;
  }
  else
  {
    id v9 = v7;
    uint64_t v10 = v9;
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v8 = 0;
  }

  return v8;
}

- (void)setRebuildState:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    _HKInitializeLogging();
    BOOL v4 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543618;
      uint64_t v7 = a1;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updated rebuild state: %ld", (uint8_t *)&v6, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    [WeakRetained HFDataStore:a1 setInteger:a2 forKey:@"HKHFDRebuildStage"];
  }
}

void __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = *(id **)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke_2;
  v16[3] = &unk_1E62FC9E8;
  v16[5] = *(void *)(a1 + 48);
  id v17 = 0;
  void v16[4] = v3;
  int v4 = -[HDHFDataStore _convertExceptionsToError:inBlock:](v3, &v17, v16);
  id v5 = v17;
  if (v4)
  {
    _HKInitializeLogging();
    int v6 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 64);
      CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v7;
      __int16 v20 = 2048;
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      double v23 = v9 - Current;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished constructing data store (%ld) in %0.3lfs", buf, 0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v10 = (id)*MEMORY[0x1E4F29F18];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 64);
      CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      double v23 = v15 - Current;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to construct data store (%ld) in %0.3lfs", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = v5;
    int v6 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 88) UTF8String];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = operator new(0x388uLL);
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_1F1720E80;
  std::string::basic_string[abi:ne180100]<0>(__p, v2);
  uint64_t v5 = *(void *)(v3 + 8);
  int v6 = *(std::__shared_weak_count **)(v3 + 16);
  v10[0] = v5;
  v10[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  health::DataStore::DataStore((uint64_t)(v4 + 3), (long long *)__p, v10, 0);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(std::__shared_weak_count **)(v7 + 56);
  *(void *)(v7 + 48) = v4 + 3;
  *(void *)(v7 + 56) = v4;
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  return 1;
}

- (uint64_t)_convertExceptionsToError:(void *)a3 inBlock:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = v5;
  if (!a1)
  {
    uint64_t v7 = 0;
    goto LABEL_20;
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__HDHFDataStore__convertExceptionsToError_inBlock___block_invoke;
  v31[3] = &unk_1E6307AB0;
  id v32 = v5;
  id v30 = 0;
  uint64_t v7 = hfd_catchExceptionsAsErrors(v31, (uint64_t)&v30, 0);
  id v8 = v30;
  CFAbsoluteTime v9 = v8;
  if ((v7 & 1) == 0)
  {
    id v10 = v8;
    uint64_t v11 = v10;
    if (v10)
    {
      if (a2) {
        *a2 = v10;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v29 = [v11 userInfo];
    if (!+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v11)) {
      goto LABEL_16;
    }
    v27 = [v29 objectForKeyedSubscript:@"HKDatabaseFailureTypeKey"];
    int v12 = [v27 intValue];
    uint64_t v13 = [v29 objectForKey:@"HKDatabaseSuberrorKey"];
    uint64_t v14 = v13;
    if (v13) {
      unsigned int v28 = [v13 intValue];
    }
    else {
      unsigned int v28 = 0;
    }
    CFAbsoluteTime v15 = [v29 objectForKey:@"HKDatabaseRecommendsPromptingUserKey"];
    unsigned int v26 = [v15 BOOLValue];

    uint64_t v16 = [a1 rebuildState];
    self;
    if ((unint64_t)v12 <= 0xB)
    {
      if (((1 << v12) & 0xBC4) != 0)
      {
LABEL_15:
        uint64_t v17 = [a1 rebuildState];
        id WeakRetained = objc_loadWeakRetained(a1 + 10);
        [WeakRetained HFDataStore:a1 detectedCorruptionOfType:v12 code:v28 error:v11 shouldPromptUser:v26 initialRebuildState:v16 updatedRebuildState:v17];

LABEL_16:
        id v19 = v11;
        self;
        __int16 v20 = [v19 userInfo];
        uint64_t v21 = [v20 objectForKeyedSubscript:@"HKDatabaseErrorIsOutOfSpaceKey"];
        int v22 = [v21 BOOLValue];

        if (v22)
        {
          id v23 = objc_loadWeakRetained(a1 + 10);
          [v23 HFDataStoreDetectedOutOfSpace:a1];
        }
        goto LABEL_19;
      }
      if (((1 << v12) & 0x3A) != 0)
      {
LABEL_14:
        -[HDHFDataStore _requestHFDRebuild](a1);
        goto LABEL_15;
      }
      if (v12 == 10)
      {
        if (v28 != 27 && v28 != 22) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    if (v12 != 100)
    {
      _HKInitializeLogging();
      v25 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v34 = v12;
        __int16 v35 = 1024;
        unsigned int v36 = v28;
        _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "Unexpected failure type when considering rebuild request: %ld (%d)", buf, 0x12u);
      }
    }
    goto LABEL_15;
  }
LABEL_19:

LABEL_20:
  return v7;
}

void __50__HDHFDataStore__highFrequencyDataStoreWithError___block_invoke(void *a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v35 = 0;
  if (!v2) {
    goto LABEL_9;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(v2 + 48));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v35, 100, @"HFD invalidated");
    goto LABEL_9;
  }
  uint64_t v4 = *(void *)(v2 + 32);
  if (v4) {
    goto LABEL_6;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
  if (!*(void *)(v2 + 32))
  {
    id v10 = (id)v2;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    v50 = ___ZL27_HDHFDataStoreWillOpenStoreP13HDHFDataStore_block_invoke;
    v51 = &unk_1E6307B00;
    v52 = (void (*)(uint64_t))v10;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ___ZL27_HDHFDataStoreWillOpenStoreP13HDHFDataStore_block_invoke_473;
    v58 = (__n128 (*)(__n128 *, __n128 *))&unk_1E6307AD8;
    v59 = v52;
    uint64_t v11 = v52;
    char active = _WithActiveHFDataStores(&block, buf);

    if ((active & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v35, 103, @"%@: Reached timeout waiting for existing data store to close the HFD.", v11);
      _HKInitializeLogging();
      int v22 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
      {
        LODWORD(block) = 138412290;
        *(void *)((char *)&block + 4) = v11;
        _os_log_fault_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_FAULT, "%@: Reached timeout waiting for existing data store to close the HFD.", (uint8_t *)&block, 0xCu);
      }
      goto LABEL_9;
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
    int64_t openAttempt = v11->_openAttempt;
    v11->_int64_t openAttempt = openAttempt + 1;
    _HKInitializeLogging();
    uint64_t v14 = (os_log_t *)MEMORY[0x1E4F29F18];
    CFAbsoluteTime v15 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = openAttempt;
      _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Opening store (%ld)", buf, 0x16u);
    }
    id v42 = 0;
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 24));
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_delegate);
    int v17 = [WeakRetained allowHFDMigration:v11];

    if (v17)
    {
      do
        uint64_t v18 = -[HDHFDataStore _lock_rebuildOneStep:]((uint64_t)v11, &v42);
      while (v18 == 3);
      id v19 = v42;
      if (v18)
      {
        _HKInitializeLogging();
        __int16 v20 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to migrate HFD during open: %{public}@", buf, 0x16u);
        }
        id v21 = v19;
        id v19 = v21;
        if (v21) {
          id v35 = v21;
        }

        goto LABEL_31;
      }
    }
    else
    {
      id v19 = v42;
    }
    if ([(HDHFDataStore *)v11 rebuildState] == 100)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", &v35, 1104, @"Attempt to access the HFD after migration to SQLite and deletion of the HFD");
LABEL_31:

      id v5 = 0;
LABEL_32:
      _HDHFDataStoreWillCloseStore(v11);
      if (!v5)
      {
        uint64_t v4 = 0;
        goto LABEL_10;
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
LABEL_9:
      uint64_t v4 = 0;
      id v5 = 0;
      goto LABEL_10;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x4012000000;
    v58 = __Block_byref_object_copy__155;
    v59 = __Block_byref_object_dispose__155;
    v60 = &unk_1BD44B655;
    uint64_t v61 = 0;
    v62 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__355;
    id v40 = __Block_byref_object_dispose__356;
    id v41 = 0;
    dispatch_semaphore_t v23 = dispatch_semaphore_create(0);
    openQueue = v11->_openQueue;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 3221225472;
    v50 = __68__HDHFDataStore__lock_primitiveOpenHighFrequencyDataStoreWithError___block_invoke;
    v51 = &unk_1E6307A60;
    v52 = (void (*)(uint64_t))v11;
    v54 = buf;
    v55 = &v36;
    int64_t v56 = openAttempt;
    v25 = v23;
    v53 = v25;
    dispatch_async(openQueue, &block);
    dispatch_time_t v26 = dispatch_time(0, 20000000000);
    if (dispatch_semaphore_wait(v25, v26))
    {
      _HKInitializeLogging();
      v27 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)id v43 = 138543362;
        v44 = v11;
        _os_log_fault_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_FAULT, "%{public}@: Timed out attempting to open the HFD, despite tracking saying we should be successful.", v43, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v35, 1103, @"Timed out attempting to open the HFD.");
    }
    else
    {
      if (*(void *)(*(void *)&buf[8] + 48))
      {
        _HKInitializeLogging();
        id v30 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id v43 = 138543618;
          v44 = v11;
          __int16 v45 = 2048;
          int64_t v46 = openAttempt;
          _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished opening store (%ld)", v43, 0x16u);
        }
        uint64_t v28 = *(void *)(*(void *)&buf[8] + 48);
        id v5 = *(std::__shared_weak_count **)(*(void *)&buf[8] + 56);
        if (v5) {
          atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        }
LABEL_39:

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(buf, 8);
        if (v62) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v62);
        }

        if (v28)
        {
          if (v5) {
            atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
          }
          *(void *)(v2 + 32) = v28;
          cntrl = (std::__shared_weak_count *)v11->_highFrequencyDataStore.__cntrl_;
          v11->_highFrequencyDataStore.__cntrl_ = (__shared_weak_count *)v5;
          if (cntrl) {
            std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
          }
          atomic_store(1u, (unsigned __int8 *)&v11->_hasOpenStore);
          if (v5) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v5);
          }
          goto LABEL_5;
        }
        goto LABEL_32;
      }
      _HKInitializeLogging();
      v31 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v34 = v37[5];
        *(_DWORD *)id v43 = 138543874;
        v44 = v11;
        __int16 v45 = 2048;
        int64_t v46 = openAttempt;
        __int16 v47 = 2114;
        uint64_t v48 = v34;
        _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed opening store (%ld): %{public}@", v43, 0x20u);
      }
      id v32 = (id)v37[5];
      v33 = v32;
      if (v32) {
        id v35 = v32;
      }
    }
    uint64_t v28 = 0;
    id v5 = 0;
    goto LABEL_39;
  }
LABEL_5:
  uint64_t v4 = *(void *)(v2 + 32);
LABEL_6:
  id v5 = *(std::__shared_weak_count **)(v2 + 40);
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
LABEL_10:
  id v6 = v35;
  id v7 = v35;
  uint64_t v8 = *(void *)(a1[5] + 8);
  CFAbsoluteTime v9 = *(std::__shared_weak_count **)(v8 + 56);
  *(void *)(v8 + 48) = v4;
  *(void *)(v8 + 56) = v5;
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 48)) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v6);
  }
}

+ (uint64_t)_errorIndicatesCorruption:(uint64_t)a1
{
  id v2 = a2;
  self;
  unsigned __int8 v3 = [v2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"HKDatabaseErrorIndicatesCorruptionKey"];
  uint64_t v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)accessStoreWithError:(id *)a3 block:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDHFDataStore.mm", 548, @"Invalid parameter not satisfying: %@", @"block != nil" object file lineNumber description];
  }
  if ([(HDHFDataStore *)self rebuildState] != 100)
  {
    if (self)
    {
      uint64_t v32 = 0;
      v33 = &v32;
      uint64_t v34 = 0x4012000000;
      id v35 = __Block_byref_object_copy__155;
      uint64_t v36 = __Block_byref_object_dispose__155;
      uint64_t v37 = &unk_1BD44B655;
      uint64_t v38 = 0;
      v39 = 0;
      uint64_t v26 = 0;
      v27 = &v26;
      uint64_t v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__355;
      id v30 = __Block_byref_object_dispose__356;
      id v31 = 0;
      v25[1] = (id)MEMORY[0x1E4F143A8];
      v25[2] = (id)3221225472;
      v25[3] = __50__HDHFDataStore__highFrequencyDataStoreWithError___block_invoke;
      v25[4] = &unk_1E6307A88;
      v25[5] = self;
      v25[6] = &v32;
      v25[7] = &v26;
      HKWithUnfairLock();
      CFAbsoluteTime v9 = v33;
      uint64_t v10 = v33[6];
      if (v10)
      {
        uint64_t v11 = 0;
      }
      else
      {
        id v12 = (id)v27[5];
        uint64_t v11 = v12;
        if (v12) {
          id v13 = v12;
        }

        CFAbsoluteTime v9 = v33;
        uint64_t v10 = v33[6];
      }
      uint64_t v14 = (std::__shared_weak_count *)v9[7];
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      _Block_object_dispose(&v26, 8);

      _Block_object_dispose(&v32, 8);
      if (v39) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v39);
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v14 = 0;
      uint64_t v11 = 0;
    }
    id v15 = v11;
    if ([(HDHFDataStore *)self rebuildState] == 100)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 1104, @"Attempt to access the HFD after migration to SQLite and deletion of the HFD");
    }
    else
    {
      if (v10)
      {
        v25[0] = v15;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3321888768;
        v21[2] = __44__HDHFDataStore_accessStoreWithError_block___block_invoke;
        v21[3] = &unk_1F1720CC0;
        id v22 = v7;
        uint64_t v23 = v10;
        uint64_t v24 = v14;
        if (v14) {
          atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        char v16 = -[HDHFDataStore _convertExceptionsToError:inBlock:]((id *)&self->super.isa, v25, v21);
        id v17 = v25[0];

        if (v24) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v24);
        }

        if (v16)
        {
          BOOL v8 = 1;
          id v15 = v17;
          if (!v14) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        id v15 = v17;
      }
      if (-[HDHFDataStore _requiresRebuildForState:]((BOOL)self, [(HDHFDataStore *)self rebuildState])) {
        [(HDHFDataStore *)self flushForInvalidation:0];
      }
      id v18 = v15;
      id v15 = v18;
      if (v18)
      {
        if (a3) {
          *a3 = v18;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    BOOL v8 = 0;
    if (!v14)
    {
LABEL_35:

      goto LABEL_36;
    }
LABEL_34:
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a3, 1104, @"Attempt to access the HFD after migration to SQLite and deletion of the HFD");
  BOOL v8 = 0;
LABEL_36:

  return v8;
}

uint64_t __44__HDHFDataStore_accessStoreWithError_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

- (BOOL)_requiresRebuildForState:(BOOL)result
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    if (a2 <= 0x14 && ((1 << a2) & 0x1FFC7F) != 0) {
      return 1;
    }
    if (a2 == 100) {
      return 0;
    }
    _HKInitializeLogging();
    unsigned __int8 v3 = *MEMORY[0x1E4F29F18];
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT);
    if (result)
    {
      int v4 = 134217984;
      unint64_t v5 = a2;
      _os_log_fault_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_FAULT, "Unexpected HFD rebuild state: %ld", (uint8_t *)&v4, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t __51__HDHFDataStore__convertExceptionsToError_inBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_requestHFDRebuild
{
  if (a1 && ![a1 rebuildState])
  {
    _HKInitializeLogging();
    id v2 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v4 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "Requesting rebuild of the HFD", v4, 2u);
    }
    -[HDHFDataStore setRebuildState:]((uint64_t)a1, 1);
    id WeakRetained = objc_loadWeakRetained(a1 + 10);
    [WeakRetained didMigrateHFDataStore:a1 fromState:0 toState:1 success:1 error:0];
  }
}

- (id)directoryURL
{
  if (a1)
  {
    v1 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 88)];
    id v2 = [v1 URLByDeletingLastPathComponent];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (int64_t)rebuildWithTransaction:(id)a3 error:(id *)a4
{
  [(HDHFDataStore *)self flushForInvalidation:0];
  uint64_t v15 = 0;
  char v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__355;
  id v13 = __Block_byref_object_dispose__356;
  id v14 = 0;
  HKWithUnfairLock();
  id v5 = (id)v10[5];
  uint64_t v6 = v5;
  if (v5)
  {
    if (a4) {
      *a4 = v5;
    }
    else {
      _HKLogDroppedError();
    }
  }

  int64_t v7 = v16[3];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __46__HDHFDataStore_rebuildWithTransaction_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = -[HDHFDataStore _lock_rebuildOneStep:](v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (uint64_t)_lock_rebuildOneStep:(uint64_t)a1
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v4 = (const os_unfair_lock *)(a1 + 24);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
  os_unfair_lock_assert_owner(v4);
  if (![(id)a1 rebuildState])
  {
    id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 88)];
    uint64_t v6 = *MEMORY[0x1E4F1C5F8];
    uint64_t v7 = *MEMORY[0x1E4F1C558];
    *(void *)&long long v145 = *MEMORY[0x1E4F1C5F8];
    *((void *)&v145 + 1) = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:2];
    *(void *)v144 = 0;
    uint64_t v9 = [v5 resourceValuesForKeys:v8 error:v144];
    id v10 = *(id *)v144;

    if (v9)
    {
      uint64_t v11 = [v9 objectForKeyedSubscript:v6];
      uint64_t v12 = [v11 longLongValue];

      if (v12 >= 0x140000000)
      {
        id v13 = [v9 objectForKeyedSubscript:v7];
        [v13 doubleValue];
        double v15 = v14;

        double v16 = v15 / (double)v12;
        if (v16 <= 0.5)
        {
          _HKInitializeLogging();
          uint64_t v17 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v12;
            *(_WORD *)&buf[22] = 2048;
            double v153 = (1.0 - v16) * 100.0;
            _os_log_error_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_ERROR, "%{public}@: HFD is large (%lld bytes) and %02.2lf%% sparse; requesting rebuild.",
              buf,
              0x20u);
          }
          -[HDHFDataStore setRebuildState:](a1, 1);
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
          [WeakRetained didMigrateHFDataStore:a1 fromState:0 toState:1 success:1 error:0];
        }
      }
    }
    else if ((objc_msgSend(v10, "hk_isCocoaNoSuchFileError") & 1) == 0)
    {
      _HKInitializeLogging();
      id v19 = *MEMORY[0x1E4F29F18];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v10;
        _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get HFD sizes when checking for sparseness during open: %{public}@", buf, 0x16u);
      }
    }
  }
  unint64_t v20 = [(id)a1 rebuildState];
  if (!-[HDHFDataStore _requiresRebuildForState:](a1, v20)) {
    return 0;
  }
  _HKInitializeLogging();
  id v21 = (os_log_t *)MEMORY[0x1E4F29F18];
  id v22 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Rebuild required with current state %ld.", buf, 0x16u);
  }
  uint64_t v23 = +[HKDaemonTransaction transactionWithOwner:a1 activityName:@"HFD Rebuild"];
  id v132 = 0;
  os_unfair_lock_assert_owner(v4);
  uint64_t v24 = 100;
  uint64_t v25 = 20;
  uint64_t v26 = 10;
  v27 = @"healthdb_archive_sqlite_migration.hfd";
  switch(v20)
  {
    case 0uLL:
    case 6uLL:
      goto LABEL_43;
    case 1uLL:
      v27 = @"healthdb_archive.hfd";
      uint64_t v24 = 2;
      goto LABEL_40;
    case 2uLL:
      uint64_t v25 = 3;
      goto LABEL_42;
    case 3uLL:
      os_unfair_lock_assert_owner(v4);
      if ((-[HDHFDataStore _lock_deleteCompressedArchive:]((os_unfair_lock *)a1, &v132) & 1) == 0) {
        goto LABEL_47;
      }
      uint64_t v26 = 4;
      goto LABEL_43;
    case 4uLL:
      v143 = (id *)a1;
      double Current = CFAbsoluteTimeGetCurrent();
      os_unfair_lock_assert_owner(v4);
      id v42 = objc_loadWeakRetained((id *)(a1 + 80));
      v130 = [v42 activeTransactionForCurrentThreadForHFDataStore:a1 forWriting:0];

      if (!v130)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v132, 121, @"No active transaction when attempting HFD restore.");
        char v34 = 0;
        goto LABEL_155;
      }
      id v43 = -[HDHFDataStore directoryURL](a1);
      v127 = [v43 URLByAppendingPathComponent:@"healthdb_archive.hfd"];

      v44 = -[HDHFDataStore directoryURL]((uint64_t)v143);
      id v124 = [v44 URLByAppendingPathComponent:@"healthdb_archive.hfd.tgz"];

      v129 = [v143 fileManager];
      __int16 v45 = NSString;
      id v128 = v124;
      int64_t v46 = objc_msgSend(v45, "stringWithUTF8String:", objc_msgSend(v128, "fileSystemRepresentation"));
      int v47 = [v129 fileExistsAtPath:v46];

      if (!v47)
      {
        BOOL v123 = 0;
        goto LABEL_88;
      }
      id v142 = 0;
      char v48 = [v129 removeItemAtURL:v127 error:&v142];
      id v49 = v142;
      v50 = v49;
      if (v48 & 1) != 0 || (objc_msgSend(v49, "hk_isCocoaNoSuchFileError"))
      {
        v125 = v50;
        v121 = objc_alloc_init(HDFileArchiver);
        v51 = -[HDHFDataStore directoryURL]((uint64_t)v143);
        id v141 = 0;
        BOOL v123 = [(HDFileArchiver *)v121 decompressArchiveAt:v128 to:v51 error:&v141];
        id v52 = v141;

        if (!v123)
        {
          v53 = v143;
          id v54 = v52;
          v55 = v54;
          if (v53
            && ([v54 domain],
                int64_t v56 = objc_claimAutoreleasedReturnValue(),
                char v57 = [v56 isEqual:*MEMORY[0x1E4F28798]],
                v56,
                (v57 & 1) != 0))
          {
            if ([v55 code] == 1
              || [v55 code] == 28
              || [v55 code] == 11
              || [v55 code] == 23)
            {

LABEL_60:
              _HKInitializeLogging();
              v58 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v55;
                _os_log_error_impl(&dword_1BCB7D000, v58, OS_LOG_TYPE_ERROR, "Failed to decompress archived HFD: %{public}@", buf, 0xCu);
              }
              id v59 = v55;
              v60 = v59;
              if (v59) {
                id v132 = v59;
              }

              char v34 = 0;
              uint64_t v61 = v125;
              goto LABEL_154;
            }
            BOOL v105 = [v55 code] == 13;

            if (v105) {
              goto LABEL_60;
            }
          }
          else
          {
          }
          _HKInitializeLogging();
          v71 = *v21;
          if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v55;
            _os_log_error_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_ERROR, "Suppressing decompression error %{public}@", buf, 0xCu);
          }
          id v72 = objc_loadWeakRetained(v143 + 10);
          [v72 didMigrateHFDataStore:v143 fromState:4 toState:4 success:0 error:v55];
        }
LABEL_88:
        id v139 = 0;
        [v143 dataStoreAtURL:v127 filesystem:v143 + 1 allowCheckpoint:0 error:&v139];
        id v73 = v139;
        id v126 = v73;
        if (!v140)
        {
          v86 = v73;
          if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v73))
          {
            _HKInitializeLogging();
            v87 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v143;
              _os_log_impl(&dword_1BCB7D000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@: Archived HFD is too corrupt to open; marking rebuild as complete and continuing with existin"
                "g production HFD.",
                buf,
                0xCu);
            }
            id v88 = objc_loadWeakRetained(v143 + 10);
            [v88 HFDataStoreDidPerformRebuild:v143 didDecompressArchivedHFD:0 didOpenArchivedHFD:0 didOpenMovedAsideHFD:0 recoveryAnalytics:MEMORY[0x1E4F1CC08] duration:CFAbsoluteTimeGetCurrent() - Current];

            uint64_t v61 = v126;
            -[HDHFDataStore setRebuildState:]((uint64_t)v143, 6);
            char v34 = 1;
            goto LABEL_152;
          }
          id v91 = v86;
          if (v91)
          {
            id v74 = v91;
            char v34 = 0;
            id v132 = v74;
          }
          else
          {
            id v74 = 0;
            char v34 = 0;
          }
LABEL_151:

          uint64_t v61 = v126;
LABEL_152:
          v108 = v140;
          v140 = 0;
          if (v108)
          {
            health::TransactionalFile::~TransactionalFile(v108);
            MEMORY[0x1C187B8A0]();
          }
          goto LABEL_154;
        }
        id v74 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v143[11]];
        v75 = -[HDHFDataStore directoryURL]((uint64_t)v143);
        uint64_t v122 = [v75 URLByAppendingPathComponent:@"healthdb_archive_temporary.hfd"];

        v76 = (void *)v122;
        if ([v143 moveHFDAsideWithoutOverwritingFrom:v74 to:v122 error:&v132])
        {
          if ([v143 deleteHFDAt:v74 error:&v132])
          {
            id v137 = 0;
            [v143 dataStoreAtURL:v122 filesystem:v143 + 1 allowCheckpoint:0 error:&v137];
            id v77 = v137;
            if (!v138)
            {
              if ((+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v77) & 1) == 0)
              {
                _HKInitializeLogging();
                v94 = *v21;
                if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v143;
                  _os_log_error_impl(&dword_1BCB7D000, v94, OS_LOG_TYPE_ERROR, "%{public}@: Unable to open moved-aside HFD.", buf, 0xCu);
                }
                id v95 = v77;
                v96 = v95;
                if (v95) {
                  id v132 = v95;
                }

                char v34 = 0;
                goto LABEL_147;
              }
              _HKInitializeLogging();
              v92 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v143;
                _os_log_impl(&dword_1BCB7D000, v92, OS_LOG_TYPE_DEFAULT, "%{public}@: Moved-aside HFD is too corrupt to open; marking rebuild as complete and continuing with ex"
                  "isitng production HFD.",
                  buf,
                  0xCu);
              }
            }
            [v143 dataStoreAtURL:v74 filesystem:v143 + 1 allowCheckpoint:1 error:&v132];
            if (!v136)
            {
              _HKInitializeLogging();
              v93 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v143;
                _os_log_error_impl(&dword_1BCB7D000, v93, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open new production HFD.", buf, 0xCu);
              }
              char v34 = 0;
              goto LABEL_145;
            }
            id v120 = v77;
            id v78 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            id v134 = 0;
            id v135 = v78;
            *(void *)buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3321888768;
            *(void *)&buf[16] = __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke;
            double v153 = COERCE_DOUBLE(&__block_descriptor_64_ea8_32c58_ZTSKZ45__HDHFDataStore__lock_restoreHFDFromArchive__E3__0_e9_B16__0__8l);
            v154 = &v143;
            v155 = &v136;
            v156 = &v140;
            v157 = &v135;
            char v79 = hfd_catchExceptionsAsErrors(buf, (uint64_t)&v134, 0);
            id v80 = v134;
            if ((v79 & 1) == 0)
            {
              if (!+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v80))
              {
                _HKInitializeLogging();
                v99 = *v21;
                if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(v145) = 138543362;
                  *(void *)((char *)&v145 + 4) = v80;
                  _os_log_error_impl(&dword_1BCB7D000, v99, OS_LOG_TYPE_ERROR, "Failed to migrate contents of archived HFD to new copy (%{public}@)", (uint8_t *)&v145, 0xCu);
                }
                id v100 = v80;
                id v101 = v80;
                if (v101)
                {
                  id v102 = v101;
                  id v132 = v102;
                }
                else
                {
                  id v102 = 0;
                }
                goto LABEL_143;
              }
              _HKInitializeLogging();
              v81 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                LOWORD(v145) = 0;
                _os_log_error_impl(&dword_1BCB7D000, v81, OS_LOG_TYPE_ERROR, "Archival HFD corrupted beyond recovery; silently continuing",
                  (uint8_t *)&v145,
                  2u);
              }
            }
            if (!v138)
            {
              id v118 = v80;
              v119 = 0;
              goto LABEL_128;
            }
            _HKInitializeLogging();
            v82 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(v145) = 138543362;
              *(void *)((char *)&v145 + 4) = v143;
              _os_log_impl(&dword_1BCB7D000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning migration from moved-aside HFD.", (uint8_t *)&v145, 0xCu);
            }
            *(void *)&long long v145 = MEMORY[0x1E4F143A8];
            *((void *)&v145 + 1) = 3321888768;
            v146 = __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke_388;
            v147 = &__block_descriptor_64_ea8_32c58_ZTSKZ45__HDHFDataStore__lock_restoreHFDFromArchive__E3__1_e9_B16__0__8l;
            v148 = &v136;
            v149 = &v143;
            v150 = &v138;
            v151 = &v135;
            id v133 = 0;
            char v83 = hfd_catchExceptionsAsErrors(&v145, (uint64_t)&v133, 0);
            id v84 = v133;
            if (v83)
            {
LABEL_104:
              id v118 = v80;

              v119 = v138;
LABEL_128:
              id v97 = objc_loadWeakRetained(v143 + 10);
              [v97 HFDataStoreDidPerformRebuild:v143 didDecompressArchivedHFD:v123 didOpenArchivedHFD:1 didOpenMovedAsideHFD:v119 != 0 recoveryAnalytics:v135 duration:CFAbsoluteTimeGetCurrent() - Current];

              v98 = v118;
              -[HDHFDataStore setRebuildState:]((uint64_t)v143, 5);
              char v34 = 1;
LABEL_144:

              id v77 = v120;
LABEL_145:
              v106 = v136;
              v136 = 0;
              if (v106)
              {
                health::TransactionalFile::~TransactionalFile(v106);
                MEMORY[0x1C187B8A0]();
              }
LABEL_147:
              v107 = v138;
              v138 = 0;
              if (v107)
              {
                health::TransactionalFile::~TransactionalFile(v107);
                MEMORY[0x1C187B8A0]();
              }

              v76 = (void *)v122;
              goto LABEL_150;
            }
            if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v84))
            {
              _HKInitializeLogging();
              v85 = *v21;
              if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v144 = 0;
                _os_log_error_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_ERROR, "Recovered production DB corrupted; silently continuing",
                  v144,
                  2u);
              }
              goto LABEL_104;
            }
            _HKInitializeLogging();
            id v100 = v80;
            v103 = *v21;
            if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v144 = 138543362;
              *(void *)&v144[4] = v84;
              _os_log_error_impl(&dword_1BCB7D000, v103, OS_LOG_TYPE_ERROR, "Failed to migrate contents of moved-aside production HFD to new copy (%{public}@)", v144, 0xCu);
            }
            id v104 = v84;
            id v102 = v104;
            if (v104) {
              id v132 = v104;
            }

LABEL_143:
            char v34 = 0;
            v98 = v100;
            goto LABEL_144;
          }
          _HKInitializeLogging();
          v89 = *v21;
          if (!os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
          {
LABEL_114:
            char v34 = 0;
LABEL_150:

            goto LABEL_151;
          }
          *(_WORD *)buf = 0;
          v90 = "Failed to delete stale HFD at production location.";
        }
        else
        {
          _HKInitializeLogging();
          v89 = *v21;
          if (!os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR)) {
            goto LABEL_114;
          }
          *(_WORD *)buf = 0;
          v90 = "Failed to move aside production HFD in preparation for rebuild.";
        }
        _os_log_error_impl(&dword_1BCB7D000, v89, OS_LOG_TYPE_ERROR, v90, buf, 2u);
        goto LABEL_114;
      }
      _HKInitializeLogging();
      v68 = *v21;
      if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v50;
        _os_log_error_impl(&dword_1BCB7D000, v68, OS_LOG_TYPE_ERROR, "Failed to clear target location before decompressing archived HFD: %{public}@", buf, 0xCu);
      }
      id v69 = v50;
      if (v69)
      {
        id v70 = v69;
        id v132 = v69;
        id v69 = v70;
      }
      uint64_t v61 = v69;

      char v34 = 0;
LABEL_154:

LABEL_155:
      goto LABEL_156;
    case 5uLL:
      os_unfair_lock_assert_owner(v4);
      v62 = -[HDHFDataStore directoryURL](a1);
      id v29 = [v62 URLByAppendingPathComponent:@"healthdb_archive_temporary.hfd"];

      if ([(id)a1 deleteHFDAt:v29 error:&v132])
      {
        uint64_t v63 = -[HDHFDataStore directoryURL](a1);
        v131 = [v63 URLByAppendingPathComponent:@"healthdb_archive.hfd"];

        if ([(id)a1 deleteHFDAt:v131 error:&v132])
        {
          *(void *)buf = 0;
          char v34 = -[HDHFDataStore _lock_deleteCompressedArchive:]((os_unfair_lock *)a1, buf);
          id v64 = *(id *)buf;
          v65 = v64;
          if (v34)
          {
            -[HDHFDataStore setRebuildState:](a1, 6);
          }
          else
          {
            id v66 = v64;
            v67 = v66;
            if (v66) {
              id v132 = v66;
            }
          }
        }
        else
        {
          char v34 = 0;
        }
      }
      else
      {
        char v34 = 0;
      }
      goto LABEL_33;
    case 7uLL:
    case 8uLL:
    case 9uLL:
      goto LABEL_37;
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      os_unfair_lock_assert_owner(v4);
      uint64_t v28 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 88)];
      *(void *)v144 = 0;
      [(id)a1 dataStoreAtURL:v28 filesystem:a1 + 8 allowCheckpoint:0 error:v144];
      id v29 = *(id *)v144;

      if ((void)v145)
      {
        id v30 = objc_loadWeakRetained((id *)(a1 + 80));
        int v31 = [v30 migrateDataForHFDataStore:a1 toSQLiteFrom:(void)v145 error:&v132];

        if (v31)
        {
          -[HDHFDataStore setRebuildState:](a1, 19);
LABEL_25:
          char v34 = 1;
          goto LABEL_31;
        }
      }
      else
      {
        if (+[HDHFDataStore _errorIndicatesCorruption:]((uint64_t)HDHFDataStore, v29))
        {
          _HKInitializeLogging();
          v33 = *v21;
          if (os_log_type_enabled(*v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v29;
            _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_INFO, "%{public}@: Corrupted HFD detected (%{public}@; silently progressing migration to SQLite",
              buf,
              0x16u);
          }
          -[HDHFDataStore setRebuildState:](a1, 19);
          goto LABEL_25;
        }
        id v35 = v29;
        uint64_t v36 = v35;
        if (v35) {
          id v132 = v35;
        }

        _HKInitializeLogging();
        uint64_t v37 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v36;
          _os_log_error_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open production HFD - %{public}@.", buf, 0x16u);
        }
      }
      char v34 = 0;
LABEL_31:
      uint64_t v38 = (health::TransactionalFile *)v145;
      *(void *)&long long v145 = 0;
      if (v38)
      {
        health::TransactionalFile::~TransactionalFile(v38);
        MEMORY[0x1C187B8A0]();
      }
LABEL_33:

LABEL_156:
      double v109 = COERCE_DOUBLE(v132);
      [v23 invalidate];
      unint64_t v110 = [(id)a1 rebuildState];
      if ((v34 & 1) == 0)
      {
        _HKInitializeLogging();
        v113 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v20;
          *(_WORD *)&buf[22] = 2114;
          double v153 = v109;
          _os_log_error_impl(&dword_1BCB7D000, v113, OS_LOG_TYPE_ERROR, "%{public}@: HFD rebuild at state %ld failed: %{public}@", buf, 0x20u);
        }
        id v114 = objc_loadWeakRetained((id *)(a1 + 80));
        [v114 didMigrateHFDataStore:a1 fromState:v20 toState:v110 success:0 error:*(void *)&v109];

        id v115 = *(id *)&v109;
        v116 = v115;
        if (v115)
        {
          if (a2) {
            *a2 = v115;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_171;
      }
      id v111 = objc_loadWeakRetained((id *)(a1 + 80));
      [v111 didMigrateHFDataStore:a1 fromState:v20 toState:v110 success:1 error:0];

      if (v110 == v20)
      {
        _HKInitializeLogging();
        v112 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = a1;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v20;
          _os_log_fault_impl(&dword_1BCB7D000, v112, OS_LOG_TYPE_FAULT, "%{public}@: HFD rebuild at state %ld reported success but failed to update result state.", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a2, 100, @"HFD rebuild at state %ld reported success but failed to update result state.", v20);
LABEL_171:
        uint64_t v32 = 1;
        goto LABEL_172;
      }
      if (-[HDHFDataStore _requiresRebuildForState:](a1, v110)) {
        uint64_t v32 = 3;
      }
      else {
        uint64_t v32 = 0;
      }
LABEL_172:

      break;
    case 0x13uLL:
LABEL_42:
      os_unfair_lock_assert_owner(v4);
      uint64_t v26 = v25;
LABEL_43:
      -[HDHFDataStore setRebuildState:](a1, v26);
      goto LABEL_44;
    case 0x14uLL:
LABEL_40:
      char v34 = -[HDHFDataStore _lock_archiveHFDTo:nextState:error:](a1, v27, v24, &v132);
      goto LABEL_156;
    default:
      if (v20 == 100)
      {
        _HKInitializeLogging();
        v39 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_FAULT, "Rebuild requested while HFD is at terminal state HDHFDataStoreRebuildStateHFDArchivedPostSQLiteMigration", buf, 2u);
        }
LABEL_44:
        char v34 = 1;
      }
      else
      {
LABEL_37:
        _HKInitializeLogging();
        id v40 = *v21;
        if (os_log_type_enabled(*v21, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v20;
          _os_log_fault_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_FAULT, "Unexpected HFD rebuild state: %ld", buf, 0xCu);
        }
LABEL_47:
        char v34 = 0;
      }
      goto LABEL_156;
  }
  return v32;
}

- (int64_t)rebuildState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [WeakRetained HFDataStore:self integerForKey:@"HKHFDRebuildStage"];

  return v4;
}

- (void)requestHFDToSQLiteMigration
{
  [(HDHFDataStore *)self flushForInvalidation:0];

  -[HDHFDataStore setRebuildState:]((uint64_t)self, 10);
}

- (uint64_t)_lock_archiveHFDTo:(uint64_t)a3 nextState:(void *)a4 error:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 24));
  _HKInitializeLogging();
  BOOL v8 = (os_log_t *)MEMORY[0x1E4F29F18];
  uint64_t v9 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "Moving aside HFD", buf, 2u);
  }
  id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 88)];
  uint64_t v11 = -[HDHFDataStore directoryURL](a1);
  uint64_t v12 = [v11 URLByAppendingPathComponent:v7];

  id v20 = 0;
  uint64_t v13 = [(id)a1 moveHFDAsideWithoutOverwritingFrom:v10 to:v12 error:&v20];
  id v14 = v20;
  if (v13)
  {
    _HKInitializeLogging();
    double v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "HFD archive successful", buf, 2u);
    }
    -[HDHFDataStore setRebuildState:](a1, a3);
  }
  else
  {
    _HKInitializeLogging();
    double v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = v14;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Failed to archive the current HFD - %{public}@", buf, 0xCu);
    }
    id v17 = v14;
    uint64_t v18 = v17;
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  return v13;
}

- (uint64_t)_lock_deleteCompressedArchive:(os_unfair_lock *)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(a1 + 6);
  int64_t v4 = -[HDHFDataStore directoryURL]((uint64_t)a1);
  id v5 = [v4 URLByAppendingPathComponent:@"healthdb_archive.hfd.tgz"];

  uint64_t v6 = [(os_unfair_lock *)a1 fileManager];
  id v14 = 0;
  char v7 = [v6 removeItemAtURL:v5 error:&v14];
  id v8 = v14;

  if (v7 & 1) != 0 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError"))
  {
    uint64_t v9 = 1;
  }
  else
  {
    _HKInitializeLogging();
    id v10 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      double v16 = a1;
      __int16 v17 = 2114;
      id v18 = v8;
      _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete compressed archive - %{public}@", buf, 0x16u);
    }
    id v11 = v8;
    uint64_t v12 = v11;
    if (v11)
    {
      if (a2) {
        *a2 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = a2;
  _HKInitializeLogging();
  uint64_t v3 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = **(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v10;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Beginning migration from archived HFD.", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 56);
  int8x16_t v11 = *(int8x16_t *)(a1 + 40);
  uint64_t v6 = *(void *)v11.i64[0];
  char v7 = (int8x16_t *)operator new(0x30uLL);
  v7->i64[0] = (uint64_t)&unk_1F1720D80;
  v7->i64[1] = v4;
  v7[1] = vextq_s8(v11, v11, 8uLL);
  v7[2].i64[0] = v5;
  v7[2].i64[1] = (uint64_t)&v12;
  double v15 = v7;
  uint64_t v8 = health::DataStore::performWriteTransactionWithLambda(v6, (uint64_t)buf);
  std::__function::__value_func<BOOL ()(health::DataStore::WriteTransaction &)>::~__value_func[abi:ne180100](buf);
  return v8;
}

uint64_t __45__HDHFDataStore__lock_restoreHFDFromArchive___block_invoke_388(uint64_t a1, uint64_t a2)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = a2;
  uint64_t v3 = *(uint64_t **)(a1 + 32);
  uint64_t v4 = *v3;
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = (char *)operator new(0x30uLL);
  *(void *)uint64_t v6 = &unk_1F1720E00;
  *(_OWORD *)(v6 + 8) = *(_OWORD *)(a1 + 40);
  *((void *)v6 + 3) = v3;
  *((void *)v6 + 4) = v5;
  *((void *)v6 + 5) = &v9;
  v10[3] = v6;
  uint64_t v7 = health::DataStore::performWriteTransactionWithLambda(v4, (uint64_t)v10);
  std::__function::__value_func<BOOL ()(health::DataStore::WriteTransaction &)>::~__value_func[abi:ne180100](v10);
  return v7;
}

- (int64_t)deleteSQLiteMigrationArchive:(id *)a3
{
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  int8x16_t v11 = __Block_byref_object_copy__355;
  uint64_t v12 = __Block_byref_object_dispose__356;
  id v13 = 0;
  HKWithUnfairLock();
  id v4 = (id)v9[5];
  uint64_t v5 = v4;
  if (v4)
  {
    if (a3) {
      *a3 = v4;
    }
    else {
      _HKLogDroppedError();
    }
  }

  int64_t v6 = *((unsigned char *)v15 + 24) == 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v6;
}

void __46__HDHFDataStore_deleteSQLiteMigrationArchive___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = -[HDHFDataStore directoryURL]((uint64_t)v2);
  id v4 = [v3 URLByAppendingPathComponent:@"healthdb_archive_sqlite_migration.hfd"];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  LOBYTE(v2) = [v2 deleteHFDAt:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v2;
}

- (id)fileManager
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);

  return v2;
}

- (void)unitTest_resetRebuildState
{
}

- (void)unitTest_requestRebuild
{
  -[HDHFDataStore setRebuildState:]((uint64_t)self, 0);

  -[HDHFDataStore _requestHFDRebuild]((id *)&self->super.isa);
}

- (void)unitTest_requestMigrationToSQLite
{
}

- (HDHFDataStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDHFDataStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)fileSystemPath
{
  return self->_fileSystemPath;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileSystemPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_openQueue, 0);
  cntrl = self->_highFrequencyDataStore.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_fileSystem.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end