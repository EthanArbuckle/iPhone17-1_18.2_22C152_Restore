@interface BMSegmentManager
+ (double)timestampFromSegmentName:(id)a3;
+ (id)segmentNameFromTimestamp:(double)a3;
+ (unint64_t)indexOfSegmentContainingEventTime:(double)a3 fromSegments:(id)a4;
+ (unint64_t)sizeOfNewFrameStoreInBytesFromNonPagedSize:(unint64_t)a3 storeLocationOptions:(int64_t)a4;
- (BMFrameStore)currentFrameStore;
- (BMSegmentManager)initWithDirectory:(id)a3 fileManager:(id)a4 permission:(unint64_t)a5 config:(id)a6;
- (BMSegmentManagerDelegate)delegate;
- (BOOL)isDataAccessible;
- (BOOL)removeSegmentNamed:(id)a3;
- (BOOL)shouldCacheFileDescriptors;
- (NSOrderedSet)segmentNames;
- (NSString)lastSegmentName;
- (NSString)path;
- (id)_segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(id)a4 direction:(unint64_t)a5;
- (id)fileHandleForFile:(id)a3 error:(id *)a4;
- (id)lastFrameStoreOrCreateWithTimestamp:(double)a3;
- (id)newFramestoreWithTimestamp:(double)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5;
- (id)nextSegmentAfterFrameStore:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 direction:(unint64_t)a6;
- (id)orderedSegmentsInDirectory:(id)a3 error:(id *)a4;
- (id)segmentAfterFrameStore:(id)a3 direction:(unint64_t)a4;
- (id)segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(double)a4;
- (id)segmentContainingTimestamp:(double)a3;
- (id)segmentWithFilename:(id)a3 error:(id *)a4;
- (id)segmentWithFilename:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 error:(id *)a6;
- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3;
- (void)_updateSegments;
- (void)dealloc;
- (void)enumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5;
- (void)enumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5;
- (void)handleDeviceLocking;
- (void)handleDeviceLockingCX;
- (void)handleDeviceUnlock;
- (void)openFiles:(id)a3 saveToOpenFiles:(id)a4;
- (void)pruneSegmentsToMaxAge:(double)a3;
- (void)pruneSegmentsToMaxSizeInBytes:(unint64_t)a3;
- (void)reverseEnumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5;
- (void)reverseEnumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)updateSegmentsWithGuardedDeviceLockStateData:(id)a3;
@end

@implementation BMSegmentManager

uint64_t __36__BMSegmentManager_isDataAccessible__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    BOOL v2 = *(unsigned char *)(a2 + 8) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v2;
  return result;
}

- (id)nextSegmentAfterFrameStore:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 direction:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v30 = a5;
  if (a6) {
    uint64_t v11 = -1;
  }
  else {
    uint64_t v11 = 1;
  }
  v28 = v9;
  if (v9
    && ([v9 segmentName],
        v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v10 indexOfObject:v12],
        v12,
        v13 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v14 = v13 + v11;
  }
  else if (a6)
  {
    unint64_t v14 = [v10 count] - 1;
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (a6 == 1) {
    uint64_t v15 = -1;
  }
  else {
    uint64_t v15 = 0;
  }
  do
  {
    unint64_t v16 = objc_msgSend(v10, "count", v24);
    v17 = 0;
    if ((v14 & 0x8000000000000000) != 0 || v14 >= v16) {
      break;
    }
    v18 = (void *)MEMORY[0x1AD11E210]();
    v19 = [v10 objectAtIndexedSubscript:v14];
    id v31 = 0;
    v17 = [(BMSegmentManager *)self segmentWithFilename:v19 segmentNames:v10 segmentFileHandles:v30 error:&v31];
    id v20 = v31;
    if (a6 || ([v10 containsObject:v19] & 1) == 0)
    {
      uint64_t v21 = v15;
      if (v20)
      {
LABEL_20:
        v22 = __biome_log_for_category();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v27 = [v28 segmentName];
          v25 = (void *)MEMORY[0x1E4F4FB78];
          v26 = [(BMSegmentManager *)self path];
          v24 = [v25 privacyPathname:v26];
          *(_DWORD *)buf = 138413058;
          v33 = v19;
          __int16 v34 = 2112;
          v35 = v27;
          __int16 v36 = 2112;
          v37 = v24;
          __int16 v38 = 2112;
          id v39 = v20;
          _os_log_error_impl(&dword_1AD076000, v22, OS_LOG_TYPE_ERROR, "Unable to getNextSegment (%@) for prevFrameStore:%@ in:%@. Error: %@", buf, 0x2Au);
        }
      }
    }
    else
    {
      uint64_t v21 = 1;
      if (v20) {
        goto LABEL_20;
      }
    }
    v14 += v21;
  }
  while (!v17);

  return v17;
}

- (id)newFramestoreWithTimestamp:(double)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [(id)objc_opt_class() segmentNameFromTimestamp:a3];
  uint64_t v11 = [v8 lastObject];
  if (!v11 || (uint64_t v12 = [v10 longLongValue], v12 >= objc_msgSend(v11, "longLongValue")))
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F4FB58], "biomeProtectionClassToOSProtectionClass:", -[BMStoreConfig protectionClass](self->_config, "protectionClass"));
    fileManager = self->_fileManager;
    id v34 = 0;
    uint64_t v13 = [(BMFileManager *)fileManager temporaryFileHandleWithProtection:v15 error:&v34];
    v17 = v34;
    if (v13)
    {
      char v32 = [(BMStoreConfig *)self->_config storeLocationOption];
      if (+[BMFrameStore writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:](BMFrameStore, "writeEmptyFrameStoreWithFileHandle:fileSize:datastoreVersion:", v13, objc_msgSend((id)objc_opt_class(), "sizeOfNewFrameStoreInBytesFromNonPagedSize:storeLocationOptions:", -[BMStoreConfig segmentSize](self->_config, "segmentSize"), -[BMStoreConfig storeLocationOption](self->_config, "storeLocationOption")), -[BMStoreConfig configDatastoreVersion](self->_config, "configDatastoreVersion")))
      {
        uint64_t v18 = [(NSString *)self->_path stringByAppendingPathComponent:v10];
        v19 = self->_fileManager;
        v33[1] = v17;
        id v31 = (void *)v18;
        id v20 = -[BMFileManager replaceFileAtPath:withFileHandle:protection:error:](v19, "replaceFileAtPath:withFileHandle:protection:error:");
        uint64_t v21 = v17;

        if (v20)
        {
          v22 = v20;
          [v9 setObject:v20 forKeyedSubscript:v10];
          v33[0] = v21;
          id v20 = [(BMSegmentManager *)self segmentWithFilename:v10 segmentNames:v8 segmentFileHandles:v9 error:v33];
          v17 = v33[0];
        }
        else
        {
          v22 = 0;
          v17 = v21;
        }
        v26 = [(BMStoreConfig *)self->_config pruningPolicy];
        v27 = v26;
        if ((v32 & 2) != 0)
        {
          uint64_t v28 = BMTombstoneSegmentMaxStreamSize(v26);
        }
        else
        {
          if (![v26 pruneOnAccess]) {
            goto LABEL_27;
          }
          uint64_t v28 = [v27 maxStreamSize];
        }
        [(BMSegmentManager *)self pruneSegmentsToMaxSizeInBytes:v28];
LABEL_27:
        if ([v27 pruneOnAccess])
        {
          [v27 maxAge];
          -[BMSegmentManager pruneSegmentsToMaxAge:](self, "pruneSegmentsToMaxAge:");
        }
        if (!v22 || v17)
        {
          v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:]((uint64_t)v31);
          }
        }
        else
        {
          if (v20)
          {
            id v14 = v20;
LABEL_38:

            goto LABEL_39;
          }
          v29 = __biome_log_for_category();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.4((uint64_t)v31);
          }
        }

        id v14 = 0;
        goto LABEL_38;
      }
      v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.5();
      }
    }
    else
    {
      v23 = __biome_log_for_category();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      if (!v17)
      {
        if (v24) {
          -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:]();
        }
        id v14 = 0;
        v17 = v23;
        goto LABEL_39;
      }
      if (v24) {
        -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:]();
      }
    }
    id v14 = 0;
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[BMSegmentManager newFramestoreWithTimestamp:segmentNames:segmentFileHandles:].cold.6();
  }
  id v14 = 0;
LABEL_40:

  return v14;
}

void __32__BMSegmentManager_segmentNames__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    v3 = *(void **)(a2 + 16);
  }
  else {
    v3 = 0;
  }
  id v7 = v3;
  uint64_t v4 = [v7 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)isDataAccessible
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__BMSegmentManager_isDataAccessible__block_invoke;
  v5[3] = &unk_1E5E78B80;
  v5[4] = &v6;
  [(_PASLock *)protectedState runWithLockAcquired:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)segmentAfterFrameStore:(id)a3 direction:(unint64_t)a4
{
  return [(BMSegmentManager *)self _segmentAfterFrameStore:a3 orCreateSegmentWithTimestamp:0 direction:a4];
}

- (id)_segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(id)a4 direction:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  BOOL v24 = __Block_byref_object_copy__3;
  v25 = __Block_byref_object_dispose__3;
  id v26 = 0;
  protectedState = self->_protectedState;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke;
  v15[3] = &unk_1E5E78CB0;
  id v11 = v8;
  id v16 = v11;
  v17 = self;
  v19 = &v21;
  unint64_t v20 = a5;
  id v12 = v9;
  id v18 = v12;
  [(_PASLock *)protectedState runWithLockAcquired:v15];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (id)segmentWithFilename:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__3;
  id v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  unint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  protectedState = self->_protectedState;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__BMSegmentManager_segmentWithFilename_error___block_invoke;
  v12[3] = &unk_1E5E78CD8;
  id v14 = &v16;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v22;
  [(_PASLock *)protectedState runWithLockAcquired:v12];
  if (a4)
  {
    id v9 = (void *)v23[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (NSOrderedSet)segmentNames
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__BMSegmentManager_segmentNames__block_invoke;
  v5[3] = &unk_1E5E78B80;
  v5[4] = &v6;
  [(_PASLock *)protectedState runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSOrderedSet *)v3;
}

uint64_t __67__BMSegmentManager_indexOfSegmentContainingEventTime_fromSegments___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a3;
  [v6 timestampFromSegmentName:a2];
  uint64_t v8 = objc_msgSend(v5, "numberWithDouble:");
  id v9 = (void *)MEMORY[0x1E4F28ED0];
  [*(id *)(a1 + 32) timestampFromSegmentName:v7];
  double v11 = v10;

  id v12 = [v9 numberWithDouble:v11];
  uint64_t v13 = [v8 compare:v12];

  return v13;
}

+ (double)timestampFromSegmentName:(id)a3
{
  return (double)[a3 longLongValue] / 1000000.0;
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v1 = *(void *)(a1 + 32);
  id v3 = *(void **)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 64);
  id v9 = 0;
  char v5 = [v3 createDirectoryAtPath:v4 error:&v9];
  id v6 = v9;
  id v7 = v6;
  if ((v5 & 1) == 0 && v6)
  {
    uint64_t v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_cold_1(v2, (uint64_t)v7, v8);
    }
  }
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)a1 + 64);
  unint64_t v6 = [*(id *)(*(void *)a1 + 40) protectionClass];
  if (v6 > 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"BMDataProtectionClassUnknown(%lu)", v6);
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = off_1E5E78D70[v6];
  }
  *(_DWORD *)buf = 138413058;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  __int16 v12 = 2112;
  uint64_t v13 = v7;
  __int16 v14 = 1024;
  int v15 = [MEMORY[0x1E4F93B10] isUnlocked];
  _os_log_error_impl(&dword_1AD076000, a3, OS_LOG_TYPE_ERROR, "Can't create stream folder at %@ with error %@, protectionClass: %@ isUnlocked: %hhd", buf, 0x26u);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentFrameStore, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_protectedState, 0);
  objc_storeStrong(&self->_deviceLockStateRegistration, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

void __47__BMSegmentManager_segmentContainingTimestamp___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD11E210]();
  if (v3) {
    uint64_t v5 = (void *)v3[2];
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  unint64_t v7 = [(id)objc_opt_class() indexOfSegmentContainingEventTime:v6 fromSegments:*(double *)(a1 + 48)];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*(double *)(a1 + 48) == 0.0)
    {
      uint64_t v8 = [*(id *)(a1 + 32) segmentAfterFrameStore:0 direction:0];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      __int16 v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
  else
  {
    unint64_t v11 = v7;
    if (v7 >= [v6 count])
    {
      v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __47__BMSegmentManager_segmentContainingTimestamp___block_invoke_cold_1();
      }
    }
    else
    {
      __int16 v12 = *(void **)(a1 + 32);
      uint64_t v13 = [v6 objectAtIndexedSubscript:v11];
      if (v3) {
        __int16 v14 = (void *)v3[3];
      }
      else {
        __int16 v14 = 0;
      }
      id v15 = v14;
      uint64_t v16 = [v12 segmentWithFilename:v13 segmentNames:v6 segmentFileHandles:v15 error:0];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_21(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(void *)(a1 + 48)) {
    goto LABEL_14;
  }
  uint64_t v4 = [*(id *)(a1 + 32) pruningPolicy];
  unint64_t v5 = [v4 maxStreamSize];

  char v6 = [*(id *)(a1 + 32) storeLocationOption];
  unint64_t v7 = *(void **)(a1 + 32);
  if ((v6 & 2) != 0)
  {
    uint64_t v8 = [v7 pruningPolicy];
    unint64_t v5 = BMTombstoneSegmentMaxStreamSize(v8);

    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_8;
  }
  if (([v7 storeLocationOption] & 4) != 0) {
    unint64_t v5 = 0x100000;
  }
  if (v5)
  {
LABEL_8:
    if (v5 != -1)
    {
      uint64_t v9 = *(void **)(a1 + 40);
      uint64_t v10 = v9[8];
      id v34 = 0;
      unint64_t v11 = [v9 orderedSegmentsInDirectory:v10 error:&v34];
      id v12 = v34;
      -[BMSegmentManagerProtectedState setSegmentNames:]((uint64_t)v3, v11);

      -[BMSegmentManagerProtectedState setError:]((uint64_t)v3, v12);
      if (v3) {
        uint64_t v13 = (void *)*((void *)v3 + 2);
      }
      else {
        uint64_t v13 = 0;
      }
      id v14 = v13;
      unint64_t v15 = [v14 count];
      unint64_t v16 = [*(id *)(a1 + 32) segmentSize];

      if (v15 > v5 / v16) {
        [*(id *)(a1 + 40) pruneSegmentsToMaxSizeInBytes:v5];
      }
    }
  }
LABEL_14:
  [*(id *)(a1 + 40) updateSegmentsWithGuardedDeviceLockStateData:v3];
  if (v3)
  {
    *((unsigned char *)v3 + 8) = 1;
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = (void *)*((void *)v3 + 2);
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v17 = *(void *)(a1 + 48);
  }
  if (v17 == 1)
  {
    id v19 = v18;
    [v19 lastObject];
  }
  else
  {
    id v19 = v18;
    [v19 firstObject];
  unint64_t v20 = };

  if (v20)
  {
    id v21 = *(void **)(a1 + 40);
    if (v3)
    {
      id v22 = *((id *)v3 + 2);
      uint64_t v23 = (void *)*((void *)v3 + 3);
    }
    else
    {
      id v22 = 0;
      uint64_t v23 = 0;
    }
    id v33 = 0;
    id v24 = v23;
    uint64_t v25 = [v21 segmentWithFilename:v20 segmentNames:v22 segmentFileHandles:v24 error:&v33];
    id v26 = v33;
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v28 = *(void **)(v27 + 72);
    *(void *)(v27 + 72) = v25;

    if (v26)
    {
      v29 = __biome_log_for_category();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        char v32 = [MEMORY[0x1E4F4FB78] privacyPathname:*(void *)(*(void *)(a1 + 40) + 64)];
        *(_DWORD *)buf = 138412802;
        __int16 v36 = v20;
        __int16 v37 = 2112;
        __int16 v38 = v32;
        __int16 v39 = 2112;
        id v40 = v26;
        _os_log_error_impl(&dword_1AD076000, v29, OS_LOG_TYPE_ERROR, "Unable to open framestore: %@ in %@ with error: %@", buf, 0x20u);
      }
      uint64_t v30 = *(void *)(a1 + 40);
      id v31 = *(void **)(v30 + 72);
      *(void *)(v30 + 72) = 0;
    }
  }
}

- (id)segmentWithFilename:(id)a3 segmentNames:(id)a4 segmentFileHandles:(id)a5 error:(id *)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if (!v10)
  {
    if (a6)
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      v30[0] = @"Failed to create new framestore with nil filename";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *a6 = [v18 errorWithDomain:@"com.apple.biome.BiomeStorage" code:-1 userInfo:v19];
    }
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager fileHandleForFile:error:]();
    }
    goto LABEL_13;
  }
  id v14 = [v12 objectForKeyedSubscript:v10];
  if (!v14)
  {
    id v26 = 0;
    id v14 = [(BMSegmentManager *)self fileHandleForFile:v10 error:&v26];
    id v20 = v26;
    if (!v20)
    {
      if ([(BMSegmentManager *)self shouldCacheFileDescriptors]) {
        [v13 setObject:v14 forKeyedSubscript:v10];
      }
      goto LABEL_3;
    }
    id v21 = v20;
    if (a6) {
      *a6 = v20;
    }
    [v11 removeObject:v10];

LABEL_13:
    unint64_t v16 = 0;
    goto LABEL_20;
  }
LABEL_3:
  [v11 addObject:v10];
  unint64_t v15 = [[BMFrameStore alloc] initWithFileHandle:v14 permission:self->_permission datastoreVersion:[(BMStoreConfig *)self->_config configDatastoreVersion]];
  unint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = v15;
  }
  else
  {
    if (a6)
    {
      id v22 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      uint64_t v28 = @"Failed to instantiate framestore with path";
      uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a6 = [v22 errorWithDomain:@"com.apple.biome.BiomeStorage" code:2 userInfo:v23];
    }
    id v24 = __biome_log_for_category();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager segmentWithFilename:segmentNames:segmentFileHandles:error:](v14);
    }
  }
LABEL_20:

  return v16;
}

- (void)updateSegmentsWithGuardedDeviceLockStateData:(id)a3
{
  uint64_t v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1AD11E210]();
  path = self->_path;
  id v22 = 0;
  unint64_t v7 = [(BMSegmentManager *)self orderedSegmentsInDirectory:path error:&v22];
  id v8 = v22;
  -[BMSegmentManagerProtectedState setSegmentNames:]((uint64_t)v4, v7);

  -[BMSegmentManagerProtectedState setError:]((uint64_t)v4, v8);
  if ([(BMSegmentManager *)self shouldCacheFileDescriptors])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAA0];
    if (v4) {
      id v10 = (void *)v4[3];
    }
    else {
      id v10 = 0;
    }
    id v11 = [v10 allKeys];
    id v12 = [v9 orderedSetWithArray:v11];

    uint64_t v13 = (void *)[v12 mutableCopy];
    id v14 = v13;
    if (v4)
    {
      [v13 minusOrderedSet:v4[2]];
      unint64_t v15 = (void *)v4[3];
    }
    else
    {
      [v13 minusOrderedSet:0];
      unint64_t v15 = 0;
    }
    id v16 = v15;
    uint64_t v17 = [v14 array];
    [v16 removeObjectsForKeys:v17];

    if (v4) {
      uint64_t v18 = (void *)v4[2];
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = (void *)[v18 mutableCopy];
    [v19 minusOrderedSet:v12];
    id v20 = [v19 set];
    if (v4) {
      uint64_t v21 = v4[3];
    }
    else {
      uint64_t v21 = 0;
    }
    [(BMSegmentManager *)self openFiles:v20 saveToOpenFiles:v21];
  }
}

- (id)orderedSegmentsInDirectory:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = objc_opt_new();
  id v8 = (void *)MEMORY[0x1AD11E210]();
  fileManager = self->_fileManager;
  id v27 = 0;
  id v10 = [(BMFileManager *)fileManager contentsOfDirectoryAtPath:v6 error:&v27];
  id v11 = v27;
  id v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    id v22 = v8;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if ([v20 characterAtIndex:0] - 48 <= 9) {
            [v7 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v17);
    }

    [v7 sortUsingComparator:&__block_literal_global_0];
    id v8 = v22;
  }
  else
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager orderedSegmentsInDirectory:error:]((uint64_t)v6);
    }
  }
  if (a4 && v12) {
    *a4 = v12;
  }

  return v7;
}

- (id)fileHandleForFile:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    unint64_t v7 = [(NSString *)self->_path stringByAppendingPathComponent:v6];
    if (self->_permission) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0x20000000;
    }
    uint64_t v9 = -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self->_fileManager, "fileHandleForFileAtPath:flags:protection:error:", v7, v8, objc_msgSend(MEMORY[0x1E4F4FB58], "biomeProtectionClassToOSProtectionClass:", -[BMStoreConfig protectionClass](self->_config, "protectionClass")), a4);
  }
  else
  {
    if (a4)
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28568];
      v15[0] = @"Failed to create new framestore with nil filename";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      *a4 = [v10 errorWithDomain:@"com.apple.biome.BiomeStorage" code:-1 userInfo:v11];
    }
    id v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager fileHandleForFile:error:]();
    }

    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)shouldCacheFileDescriptors
{
  return [(BMStoreConfig *)self->_config protectionClass] == 2;
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t v5 = [*(id *)(a1 + 32) segmentName];
    *(_DWORD *)buf = 138412290;
    v54 = v5;
    _os_log_impl(&dword_1AD076000, v4, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: %@", buf, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  if (v3)
  {
    id v8 = v3[2];
    id v9 = v3[3];
  }
  else
  {
    id v8 = 0;
    id v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 64);
  id v11 = v9;
  uint64_t v12 = [v6 nextSegmentAfterFrameStore:v7 segmentNames:v8 segmentFileHandles:v11 direction:v10];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v15)
  {
    if (*(void *)(a1 + 64) || *(void *)(a1 + 48)) {
      goto LABEL_29;
    }
    [*(id *)(a1 + 40) updateSegmentsWithGuardedDeviceLockStateData:v3];
    uint64_t v39 = *(void *)(a1 + 32);
    __int16 v38 = *(void **)(a1 + 40);
    if (v3)
    {
      id v40 = v3[2];
      id v41 = v3[3];
    }
    else
    {
      id v40 = 0;
      id v41 = 0;
    }
    uint64_t v42 = *(void *)(a1 + 64);
    id v43 = v41;
    uint64_t v44 = [v38 nextSegmentAfterFrameStore:v39 segmentNames:v40 segmentFileHandles:v43 direction:v42];
    uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
    v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

    id v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v15)
    {
LABEL_29:
      if (*(void *)(a1 + 48))
      {
        uint64_t v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD076000, v16, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: Attempting to create new frame store", buf, 2u);
        }

        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void **)(v17 + 64);
        id v19 = [*(id *)(v17 + 40) datastorePath];
        LOBYTE(v18) = [v18 hasPrefix:v19];

        if ((v18 & 1) == 0)
        {
          id v20 = __biome_log_for_category();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
            __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_cold_1();
          }
        }
        uint64_t v21 = *(void *)(a1 + 40);
        id v22 = *(void **)(v21 + 64);
        long long v23 = [*(id *)(v21 + 40) datastorePath];
        long long v24 = objc_msgSend(v22, "substringFromIndex:", objc_msgSend(v23, "length"));

        if ([v24 hasPrefix:@"/"])
        {
          uint64_t v25 = [v24 substringFromIndex:1];

          long long v24 = (void *)v25;
        }
        long long v26 = objc_msgSend(v24, "substringToIndex:", objc_msgSend(v24, "rangeOfString:", @"/"));

        id v27 = [*(id *)(*(void *)(a1 + 40) + 40) datastorePath];
        uint64_t v28 = [v27 stringByAppendingPathComponent:v26];
        uint64_t v29 = [MEMORY[0x1E4F4FBA0] lock];
        uint64_t v30 = [v28 stringByAppendingPathComponent:v29];

        id v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v30;
          _os_log_impl(&dword_1AD076000, v31, OS_LOG_TYPE_INFO, "_segmentAfterFrameStore: Attempting to acquire lockfile: %@", buf, 0xCu);
        }

        uint64_t v32 = *(void *)(a1 + 40);
        id v33 = *(void **)(v32 + 8);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_51;
        v47[3] = &unk_1E5E78C88;
        v47[4] = v32;
        id v34 = v3;
        uint64_t v35 = *(void *)(a1 + 56);
        v48 = v34;
        uint64_t v51 = v35;
        id v36 = *(id *)(a1 + 32);
        uint64_t v37 = *(void *)(a1 + 64);
        id v49 = v36;
        uint64_t v52 = v37;
        id v50 = *(id *)(a1 + 48);
        [v33 acquireLockfile:v30 andRunBlock:v47];

        id v15 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      }
      else
      {
        id v15 = 0;
      }
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 72), v15);
}

void __46__BMSegmentManager_segmentWithFilename_error___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  if (a2)
  {
    id v6 = *(id *)(a2 + 16);
    uint64_t v7 = *(void **)(a2 + 24);
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v8 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v8 + 40);
  id v9 = v7;
  uint64_t v10 = [v3 segmentWithFilename:v4 segmentNames:v6 segmentFileHandles:v9 error:&obj];
  objc_storeStrong((id *)(v8 + 40), obj);
  uint64_t v11 = *(void *)(a1[6] + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (BMSegmentManager)initWithDirectory:(id)a3 fileManager:(id)a4 permission:(unint64_t)a5 config:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v44.receiver = self;
  v44.super_class = (Class)BMSegmentManager;
  uint64_t v13 = [(BMSegmentManager *)&v44 init];
  if (!v13) {
    goto LABEL_10;
  }
  uint64_t v14 = [v10 copy];
  path = v13->_path;
  v13->_path = (NSString *)v14;

  objc_storeStrong((id *)&v13->_fileManager, a4);
  uint64_t v16 = [(BMFileManager *)v13->_fileManager delegate];

  if (!v16)
  {
    [(BMFileManager *)v13->_fileManager setDelegate:v13];
    if (v12) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v17 = +[BMStoreConfig newStreamDefaultConfigurationForPublicStream:0];
    goto LABEL_7;
  }
  if (!v12) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v17 = (BMStoreConfig *)v12;
LABEL_7:
  config = v13->_config;
  v13->_config = v17;

  v13->_permission = a5;
  uint64_t v19 = [MEMORY[0x1E4F93B10] isUnlocked];
  id v20 = objc_alloc(MEMORY[0x1E4F93B70]);
  uint64_t v21 = [[BMSegmentManagerProtectedState alloc] initWithDeviceStateIsUnlocked:v19];
  uint64_t v22 = [v20 initWithGuardedData:v21];
  protectedState = v13->_protectedState;
  v13->_protectedState = (_PASLock *)v22;

  long long v24 = v13->_protectedState;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke;
  v42[3] = &unk_1E5E78B08;
  uint64_t v25 = v13;
  id v43 = v25;
  [(_PASLock *)v24 runWithLockAcquired:v42];
  if (objc_msgSend(MEMORY[0x1E4F4FB58], "canOpenFilesForProtectionClass:", -[BMStoreConfig protectionClass](v13->_config, "protectionClass")))
  {
    long long v26 = v13->_protectedState;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_21;
    v38[3] = &unk_1E5E78B30;
    unint64_t v41 = a5;
    id v39 = v12;
    id v40 = v25;
    [(_PASLock *)v26 runWithLockAcquired:v38];
  }
  objc_initWeak(&location, v25);
  id v27 = (void *)MEMORY[0x1E4F4FB58];
  uint64_t v32 = MEMORY[0x1E4F143A8];
  uint64_t v33 = 3221225472;
  id v34 = __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_23;
  uint64_t v35 = &unk_1E5E78B58;
  objc_copyWeak(&v36, &location);
  uint64_t v28 = (void *)MEMORY[0x1AD11E420](&v32);
  uint64_t v29 = objc_msgSend(v27, "registerForLockStateChanges:", v28, v32, v33, v34, v35);
  id deviceLockStateRegistration = v25->_deviceLockStateRegistration;
  v25->_id deviceLockStateRegistration = (id)v29;

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_10:
  return v13;
}

+ (unint64_t)indexOfSegmentContainingEventTime:(double)a3 fromSegments:(id)a4
{
  id v6 = a4;
  if ([v6 count])
  {
    if (a3 <= 0.0)
    {
      unint64_t v16 = 0;
    }
    else
    {
      uint64_t v7 = [a1 segmentNameFromTimestamp:a3];
      uint64_t v8 = [v6 count];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __67__BMSegmentManager_indexOfSegmentContainingEventTime_fromSegments___block_invoke;
      v18[3] = &__block_descriptor_40_e31_q24__0__NSString_8__NSString_16l;
      v18[4] = a1;
      unint64_t v9 = objc_msgSend(v6, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, v8, 1024, v18);
      if (v9 && v9 < [v6 count])
      {
        id v10 = (void *)MEMORY[0x1E4F28ED0];
        id v11 = [v6 objectAtIndexedSubscript:v9];
        [a1 timestampFromSegmentName:v11];
        id v12 = objc_msgSend(v10, "numberWithDouble:");

        uint64_t v13 = (void *)MEMORY[0x1E4F28ED0];
        [a1 timestampFromSegmentName:v7];
        uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
        BOOL v15 = [v12 compare:v14] != 0;
      }
      else
      {
        BOOL v15 = v9 == [v6 count];
      }
      unint64_t v16 = v9 - v15;
    }
  }
  else
  {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v16;
}

+ (id)segmentNameFromTimestamp:(double)a3
{
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", vcvtmd_u64_f64(a3 * 1000000.0));
  return v3;
}

- (void)orderedSegmentsInDirectory:(uint64_t)a1 error:.cold.1(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v2, v3, "Failed to get contents of directory: %{public}@, error: %{error}@", v4, v5, v6, v7, v8);
}

- (void)dealloc
{
  if (self->_deviceLockStateRegistration)
  {
    objc_msgSend(MEMORY[0x1E4F4FB58], "unregister:");
    id deviceLockStateRegistration = self->_deviceLockStateRegistration;
    self->_id deviceLockStateRegistration = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BMSegmentManager;
  [(BMSegmentManager *)&v4 dealloc];
}

- (BMFrameStore)currentFrameStore
{
  return self->_currentFrameStore;
}

- (id)segmentContainingTimestamp:(double)a3
{
  uint64_t v7 = 0;
  uint8_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  id v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  protectedState = self->_protectedState;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__BMSegmentManager_segmentContainingTimestamp___block_invoke;
  v6[3] = &unk_1E5E78D00;
  *(double *)&v6[6] = a3;
  v6[4] = self;
  v6[5] = &v7;
  [(_PASLock *)protectedState runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_updateSegments
{
  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__BMSegmentManager__updateSegments__block_invoke;
  v3[3] = &unk_1E5E78B08;
  v3[4] = self;
  [(_PASLock *)protectedState runWithLockAcquired:v3];
}

- (void)enumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__BMSegmentManager_enumerateSegmentsFrom_to_withBlock___block_invoke;
  v10[3] = &unk_1E5E78D50;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(BMSegmentManager *)self enumerateSegmentsNamesFrom:v10 to:a3 withBlock:a4];
}

- (void)enumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *, unsigned char *))a5;
  if (a3 > a4 && a4 != -1.0)
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:]();
    }
    goto LABEL_29;
  }
  id v11 = [(BMSegmentManager *)self segmentNames];
  if (![v11 count])
  {
    uint64_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F4FB78];
      BOOL v15 = [(BMSegmentManager *)self path];
      unint64_t v16 = [v14 privacyPathname:v15];
      *(_DWORD *)id v20 = 138412290;
      *(void *)&v20[4] = v16;
      _os_log_impl(&dword_1AD076000, v13, OS_LOG_TYPE_INFO, "No segments to enumerate: %@", v20, 0xCu);
    }
    goto LABEL_28;
  }
  if (a3 == 0.0) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = [(id)objc_opt_class() indexOfSegmentContainingEventTime:v11 fromSegments:a3];
  }
  if (a4 == -1.0) {
    unint64_t v17 = [v11 count] - 1;
  }
  else {
    unint64_t v17 = [(id)objc_opt_class() indexOfSegmentContainingEventTime:v11 fromSegments:a4];
  }
  if (v10 >= [v11 count] || v17 >= [v11 count])
  {
    uint64_t v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:]();
    }
LABEL_28:

    goto LABEL_29;
  }
  if (v10 <= v17)
  {
    do
    {
      v20[0] = 0;
      uint64_t v18 = -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v10, *(void *)v20);
      v8[2](v8, v18, v20);

      ++v10;
      if (v20[0]) {
        BOOL v19 = 1;
      }
      else {
        BOOL v19 = v10 > v17;
      }
    }
    while (!v19);
  }
LABEL_29:
}

- (NSString)path
{
  return self->_path;
}

uint64_t __35__BMSegmentManager__updateSegments__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:a2];
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  id v4 = v3;
  if (v3) {
    uint64_t v3 = (void *)v3[2];
  }
  if ([v3 count])
  {
    if (v4)
    {
      id v5 = (id)v4[2];
      uint64_t v6 = (void *)v4[2];
    }
    else
    {
      id v5 = 0;
      uint64_t v6 = 0;
    }
    id v7 = v6;
    id v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v7, "count") - 1);

    id v9 = *(void **)(a1 + 32);
    if (v4)
    {
      id v10 = (id)v4[2];
      id v11 = (void *)v4[3];
    }
    else
    {
      id v10 = 0;
      id v11 = 0;
    }
    id v12 = v11;
    uint64_t v13 = [v9 segmentWithFilename:v8 segmentNames:v10 segmentFileHandles:v12 error:0];
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  else if (v4)
  {
    id v37 = (id)v4[4];
    if (v37)
    {
      __int16 v38 = v37;
      int ShouldTryAgainLater = BMStorageErrorShouldTryAgainLater();

      if (ShouldTryAgainLater)
      {
        [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:v4];
        if (v4[4]) {
          goto LABEL_22;
        }
      }
    }
  }
  unint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v16)
  {
    unint64_t v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD076000, v17, OS_LOG_TYPE_INFO, "lastFrameStoreOrCreateWithTimestamp: Attempting to create new frame store", buf, 2u);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    BOOL v19 = *(void **)(v18 + 64);
    id v20 = [*(id *)(v18 + 40) datastorePath];
    LOBYTE(v19) = [v19 hasPrefix:v20];

    if ((v19 & 1) == 0)
    {
      uint64_t v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_cold_1();
      }
    }
    uint64_t v22 = *(void *)(a1 + 32);
    long long v23 = *(void **)(v22 + 64);
    long long v24 = [*(id *)(v22 + 40) datastorePath];
    uint64_t v25 = objc_msgSend(v23, "substringFromIndex:", objc_msgSend(v24, "length"));

    if ([v25 hasPrefix:@"/"])
    {
      uint64_t v26 = [v25 substringFromIndex:1];

      uint64_t v25 = (void *)v26;
    }
    id v27 = objc_msgSend(v25, "substringToIndex:", objc_msgSend(v25, "rangeOfString:", @"/"));

    uint64_t v28 = [*(id *)(*(void *)(a1 + 32) + 40) datastorePath];
    uint64_t v29 = [v28 stringByAppendingPathComponent:v27];
    uint64_t v30 = [MEMORY[0x1E4F4FBA0] lock];
    id v31 = [v29 stringByAppendingPathComponent:v30];

    uint64_t v32 = __biome_log_for_category();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v45 = v31;
      _os_log_impl(&dword_1AD076000, v32, OS_LOG_TYPE_INFO, "lastFrameStoreOrCreateWithTimestamp: Attempting to acquire lockfile: %@", buf, 0xCu);
    }

    uint64_t v33 = *(void *)(a1 + 32);
    id v34 = *(void **)(v33 + 8);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_49;
    v40[3] = &unk_1E5E78C38;
    v40[4] = v33;
    uint64_t v35 = v4;
    uint64_t v36 = *(void *)(a1 + 40);
    id v41 = v35;
    uint64_t v42 = v36;
    uint64_t v43 = *(void *)(a1 + 48);
    [v34 acquireLockfile:v31 andRunBlock:v40];

    unint64_t v16 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), v16);
LABEL_22:
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_49(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3) {
    id v4 = *(void **)(v3 + 16);
  }
  else {
    id v4 = 0;
  }
  if ([v4 count])
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 16);
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = *(void **)(a1 + 40);
    if (v7) {
      id v7 = (void *)v7[2];
    }
    id v8 = v7;
    id v9 = v6;
    id v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "count") - 1);

    id v12 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      uint64_t v13 = *(void **)(v11 + 16);
    }
    else {
      uint64_t v13 = 0;
    }
    uint64_t v14 = *(void **)(a1 + 40);
    if (v14) {
      uint64_t v14 = (void *)v14[3];
    }
    BOOL v15 = v14;
    id v16 = v13;
    uint64_t v17 = [v12 segmentWithFilename:v10 segmentNames:v16 segmentFileHandles:v15 error:0];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v21 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    if (v20) {
      uint64_t v22 = *(void **)(v20 + 16);
    }
    else {
      uint64_t v22 = 0;
    }
    double v23 = *(double *)(a1 + 56);
    long long v24 = *(void **)(a1 + 40);
    if (v24) {
      long long v24 = (void *)v24[3];
    }
    uint64_t v25 = v24;
    id v26 = v22;
    uint64_t v27 = [v21 newFramestoreWithTimestamp:v26 segmentNames:v25 segmentFileHandles:v23];
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      uint64_t v30 = __biome_log_for_category();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_49_cold_1((id *)v2);
      }
    }
  }
}

- (id)lastFrameStoreOrCreateWithTimestamp:(double)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0;
  protectedState = self->_protectedState;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke;
  v6[3] = &unk_1E5E78C60;
  v6[4] = self;
  v6[5] = &v7;
  *(double *)&v6[6] = a3;
  [(_PASLock *)protectedState runWithLockAcquired:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (unint64_t)sizeOfNewFrameStoreInBytesFromNonPagedSize:(unint64_t)a3 storeLocationOptions:(int64_t)a4
{
  if (a3 > 0x100000 && (a4 & 2) != 0) {
    unint64_t v4 = 0x100000;
  }
  else {
    unint64_t v4 = a3;
  }
  if (((v4 > 0x100000) & (a4 >> 2)) != 0) {
    unint64_t v5 = 0x100000;
  }
  else {
    unint64_t v5 = v4;
  }
  NSUInteger v6 = NSPageSize();
  NSUInteger v7 = NSPageSize();
  uint64_t v8 = v5 / v7;
  if (v7 > v5) {
    uint64_t v8 = 1;
  }
  return v8 * v6;
}

void __68__BMSegmentManager_initWithDirectory_fileManager_permission_config___block_invoke_23(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 0:
    case 3:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained handleDeviceUnlock];
      goto LABEL_5;
    case 2:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained handleDeviceLocking];
      goto LABEL_5;
    case 5:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      [WeakRetained handleDeviceLockingCX];
LABEL_5:

      break;
    default:
      return;
  }
}

- (NSString)lastSegmentName
{
  uint64_t v6 = 0;
  NSUInteger v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__3;
  id v10 = __Block_byref_object_dispose__3;
  id v11 = 0;
  protectedState = self->_protectedState;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__BMSegmentManager_lastSegmentName__block_invoke;
  v5[3] = &unk_1E5E78B80;
  v5[4] = &v6;
  [(_PASLock *)protectedState runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__BMSegmentManager_lastSegmentName__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    id v3 = *(void **)(a2 + 16);
  }
  else {
    id v3 = 0;
  }
  id v7 = v3;
  uint64_t v4 = [v7 lastObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)pruneSegmentsToMaxSizeInBytes:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 && a3 != -1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    uint64_t v14 = 0;
    BOOL v15 = &v14;
    uint64_t v16 = 0x3032000000;
    uint64_t v17 = __Block_byref_object_copy__3;
    uint64_t v18 = __Block_byref_object_dispose__3;
    id v19 = (id)objc_opt_new();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke;
    v13[3] = &unk_1E5E78BA8;
    v13[4] = self;
    v13[5] = v20;
    v13[6] = &v14;
    v13[7] = a3;
    [(BMSegmentManager *)self reverseEnumerateSegmentsNamesFrom:v13 to:0.0 withBlock:-1.0];
    if ([(id)v15[5] count])
    {
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v5 = (id)v15[5];
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v21 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v10;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v5);
            }
            -[BMSegmentManager removeSegmentNamed:](self, "removeSegmentNamed:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
          }
          while (v6 != v8);
          uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v21 count:16];
        }
        while (v6);
      }

      [(BMSegmentManager *)self _updateSegments];
    }
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(v20, 8);
  }
}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x1AD11E210]();
  if (*(void *)(*(void *)(a1[5] + 8) + 24) >= a1[7])
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v3];
  }
  else
  {
    id v5 = [*(id *)(a1[4] + 64) stringByAppendingPathComponent:v3];
    uint64_t v6 = *(void **)(a1[4] + 8);
    id v11 = 0;
    uint64_t v7 = [v6 sizeOfFileAtPath:v5 error:&v11];
    id v8 = v11;
    *(void *)(*(void *)(a1[5] + 8) + 24) += v7;
    if (v8)
    {
      long long v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_2((uint64_t)v8, (uint64_t)v5);
      }
    }
    else if (!v7)
    {
      long long v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_1((uint64_t)v5);
      }

      [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v3];
    }
  }
}

- (void)pruneSegmentsToMaxAge:(double)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a3 != 0.0 && a3 != -1.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = __Block_byref_object_copy__3;
    uint64_t v20 = __Block_byref_object_dispose__3;
    id v21 = (id)objc_opt_new();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __42__BMSegmentManager_pruneSegmentsToMaxAge___block_invoke;
    v15[3] = &unk_1E5E78BD0;
    *(double *)&v15[5] = Current - a3;
    void v15[4] = &v16;
    -[BMSegmentManager enumerateSegmentsFrom:to:withBlock:](self, "enumerateSegmentsFrom:to:withBlock:", v15, 0.0);
    [(id)v17[5] removeLastObject];
    if ([(id)v17[5] count])
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v7 = (id)v17[5];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v12;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v7);
            }
            -[BMSegmentManager removeSegmentNamed:](self, "removeSegmentNamed:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v22 count:16];
        }
        while (v8);
      }

      [(BMSegmentManager *)self _updateSegments];
    }
    _Block_object_dispose(&v16, 8);
  }
}

void __42__BMSegmentManager_pruneSegmentsToMaxAge___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  +[BMSegmentManager timestampFromSegmentName:](BMSegmentManager, "timestampFromSegmentName:");
  if (v6 >= *(double *)(a1 + 40)) {
    *a4 = 1;
  }
  else {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  }
}

- (void)openFiles:(id)a3 saveToOpenFiles:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        long long v14 = (void *)MEMORY[0x1AD11E210](v9);
        BOOL v15 = -[BMSegmentManager fileHandleForFile:error:](self, "fileHandleForFile:error:", v13, 0, (void)v16);
        if (v15) {
          [v7 setObject:v15 forKeyedSubscript:v13];
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

uint64_t __53__BMSegmentManager_orderedSegmentsInDirectory_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 length];
  if (v6 == [v4 length])
  {
    uint64_t v7 = [v5 compare:v4];
  }
  else
  {
    unint64_t v8 = [v5 length];

    if (v8 < [v4 length]) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
  }

  return v7;
}

- (id)segmentAfterFrameStore:(id)a3 orCreateSegmentWithTimestamp:(double)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
  id v7 = a3;
  unint64_t v8 = [v6 numberWithDouble:a4];
  uint64_t v9 = [(BMSegmentManager *)self _segmentAfterFrameStore:v7 orCreateSegmentWithTimestamp:v8 direction:0];

  return v9;
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_51(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:*(void *)(a1 + 40)];
  id v3 = *v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    id v5 = *(void **)(v4 + 16);
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = (id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 48);
  unint64_t v8 = *(void **)(a1 + 40);
  if (v8) {
    unint64_t v8 = (void *)v8[3];
  }
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = v8;
  id v11 = v5;
  uint64_t v12 = [v3 nextSegmentAfterFrameStore:v7 segmentNames:v11 segmentFileHandles:v10 direction:v9];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    BOOL v15 = *(void **)(a1 + 32);
    [*(id *)(a1 + 56) doubleValue];
    double v17 = v16;
    uint64_t v18 = *(void *)(a1 + 40);
    if (v18) {
      long long v19 = *(void **)(v18 + 16);
    }
    else {
      long long v19 = 0;
    }
    uint64_t v20 = *(void **)(a1 + 40);
    if (v20) {
      uint64_t v20 = (void *)v20[3];
    }
    uint64_t v21 = v20;
    id v22 = v19;
    uint64_t v23 = [v15 newFramestoreWithTimestamp:v22 segmentNames:v21 segmentFileHandles:v17];
    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = v23;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      id v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_51_cold_1(v6, v2, v26);
      }
    }
  }
}

- (BOOL)removeSegmentNamed:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BMSegmentManager *)self delegate];

  if (v5)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = __Block_byref_object_copy__3;
    uint64_t v28 = __Block_byref_object_dispose__3;
    id v29 = 0;
    protectedState = self->_protectedState;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __39__BMSegmentManager_removeSegmentNamed___block_invoke;
    v22[3] = &unk_1E5E78D28;
    p_long long buf = &buf;
    v22[4] = self;
    id v7 = v4;
    id v23 = v7;
    [(_PASLock *)protectedState runWithLockAcquired:v22];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      unint64_t v8 = [(BMSegmentManager *)self delegate];
      [v8 segmentManager:self willDeleteSegmentName:v7 frameStore:*(void *)(*((void *)&buf + 1) + 40)];
    }
    _Block_object_dispose(&buf, 8);
  }
  uint64_t v9 = [(NSString *)self->_path stringByAppendingPathComponent:v4];
  uint64_t v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [MEMORY[0x1E4F4FB78] privacyPathname:v9];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1AD076000, v10, OS_LOG_TYPE_DEFAULT, "Removing frame store: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v12 = self->_protectedState;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __39__BMSegmentManager_removeSegmentNamed___block_invoke_56;
  v20[3] = &unk_1E5E78B08;
  id v13 = v4;
  id v21 = v13;
  [(_PASLock *)v12 runWithLockAcquired:v20];
  fileManager = self->_fileManager;
  id v19 = 0;
  char v15 = [(BMFileManager *)fileManager removeFileAtPath:v9 error:&v19];
  id v16 = v19;
  if (!v16) {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    double v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager removeSegmentNamed:]((uint64_t)v9, v17);
    }
  }
  return v15;
}

void __39__BMSegmentManager_removeSegmentNamed___block_invoke(void *a1, uint64_t a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  if (a2)
  {
    id v11 = *(id *)(a2 + 16);
    uint64_t v6 = *(void **)(a2 + 24);
  }
  else
  {
    id v11 = 0;
    uint64_t v6 = 0;
  }
  id v7 = v6;
  uint64_t v8 = [v3 segmentWithFilename:v4 segmentNames:v11 segmentFileHandles:v7 error:0];
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __39__BMSegmentManager_removeSegmentNamed___block_invoke_56(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = v3;
  if (v3) {
    id v3 = (void *)v3[2];
  }
  [v3 removeObject:*(void *)(a1 + 32)];
  uint64_t v4 = v5;
  if (v5) {
    uint64_t v4 = (void *)v5[3];
  }
  [v4 setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

void __55__BMSegmentManager_enumerateSegmentsFrom_to_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = 0;
  id v5 = [v4 segmentWithFilename:v3 error:&v11];
  id v6 = v11;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F4FB78];
      uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 64) stringByAppendingPathComponent:v3];
      uint64_t v10 = [v8 privacyPathname:v9];
      *(_DWORD *)long long buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1AD076000, v7, OS_LOG_TYPE_ERROR, "Failed to open frame store %{public}@ during enumeration, error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)reverseEnumerateSegmentsFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__BMSegmentManager_reverseEnumerateSegmentsFrom_to_withBlock___block_invoke;
  v10[3] = &unk_1E5E78D50;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(BMSegmentManager *)self reverseEnumerateSegmentsNamesFrom:v10 to:a3 withBlock:a4];
}

void __62__BMSegmentManager_reverseEnumerateSegmentsFrom_to_withBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = 0;
  id v5 = [v4 segmentWithFilename:v3 error:&v11];
  id v6 = v11;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (void *)MEMORY[0x1E4F4FB78];
      id v9 = [*(id *)(*(void *)(a1 + 32) + 64) stringByAppendingPathComponent:v3];
      uint64_t v10 = [v8 privacyPathname:v9];
      *(_DWORD *)long long buf = 138543618;
      id v13 = v10;
      __int16 v14 = 2114;
      id v15 = v6;
      _os_log_error_impl(&dword_1AD076000, v7, OS_LOG_TYPE_ERROR, "Failed to open frame store %{public}@ during reverse enumeration, error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)reverseEnumerateSegmentsNamesFrom:(double)a3 to:(double)a4 withBlock:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, void *, unsigned char *))a5;
  if (a3 > a4 && a4 != -1.0)
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager enumerateSegmentsNamesFrom:to:withBlock:]();
    }
    goto LABEL_28;
  }
  id v11 = [(BMSegmentManager *)self segmentNames];
  if (![v11 count])
  {
    id v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = (void *)MEMORY[0x1E4F4FB78];
      id v15 = [(BMSegmentManager *)self path];
      uint64_t v16 = [v14 privacyPathname:v15];
      *(_DWORD *)uint64_t v20 = 138412290;
      *(void *)&void v20[4] = v16;
      _os_log_impl(&dword_1AD076000, v13, OS_LOG_TYPE_INFO, "No segments to enumerate: %@", v20, 0xCu);
    }
    goto LABEL_27;
  }
  if (a3 == 0.0) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = [(id)objc_opt_class() indexOfSegmentContainingEventTime:v11 fromSegments:a3];
  }
  if (a4 == -1.0) {
    unint64_t v17 = [v11 count] - 1;
  }
  else {
    unint64_t v17 = [(id)objc_opt_class() indexOfSegmentContainingEventTime:v11 fromSegments:a4];
  }
  if (v10 >= [v11 count] || v17 >= [v11 count])
  {
    id v13 = __biome_log_for_category();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[BMSegmentManager reverseEnumerateSegmentsNamesFrom:to:withBlock:]();
    }
LABEL_27:

    goto LABEL_28;
  }
  do
  {
    v20[0] = 0;
    uint64_t v18 = -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v17, *(void *)v20);
    v8[2](v8, v18, v20);

    if (v20[0]) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v10 == v17;
    }
    --v17;
  }
  while (!v19);
LABEL_28:
}

- (void)handleDeviceUnlock
{
  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__BMSegmentManager_handleDeviceUnlock__block_invoke;
  v3[3] = &unk_1E5E78B08;
  v3[4] = self;
  [(_PASLock *)protectedState runWithLockAcquired:v3];
}

uint64_t __38__BMSegmentManager_handleDeviceUnlock__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(unsigned char *)(a2 + 8) = 1;
  }
  return [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:a2];
}

- (void)handleDeviceLockingCX
{
  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__BMSegmentManager_handleDeviceLockingCX__block_invoke;
  v3[3] = &unk_1E5E78B08;
  v3[4] = self;
  [(_PASLock *)protectedState runWithLockAcquired:v3];
}

uint64_t __41__BMSegmentManager_handleDeviceLockingCX__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) protectionClass];
  if (v5 && v3 == 5) {
    v5[8] = 0;
  }
  return MEMORY[0x1F41817F8](v3);
}

- (void)handleDeviceLocking
{
  protectedState = self->_protectedState;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__BMSegmentManager_handleDeviceLocking__block_invoke;
  v3[3] = &unk_1E5E78B08;
  v3[4] = self;
  [(_PASLock *)protectedState runWithLockAcquired:v3];
}

uint64_t __39__BMSegmentManager_handleDeviceLocking__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F4FB58], "losesReadAccessOnLock:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "protectionClass"));
  if (v3)
  {
    uint64_t v4 = v7;
    if (!v7) {
      goto LABEL_8;
    }
    char v5 = 0;
    goto LABEL_7;
  }
  uint64_t v3 = [*(id *)(a1 + 32) shouldCacheFileDescriptors];
  if (v3)
  {
    uint64_t v3 = [*(id *)(a1 + 32) updateSegmentsWithGuardedDeviceLockStateData:v7];
    uint64_t v4 = v7;
    if (v7)
    {
      char v5 = 1;
LABEL_7:
      v4[8] = v5;
    }
  }
LABEL_8:
  return MEMORY[0x1F41817F8](v3);
}

- (int64_t)cachingOptionsForFileHandleWithAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 path];
  char v5 = [v4 lastPathComponent];

  id v6 = [MEMORY[0x1E4F4FBA0] localDevice];
  if ([v5 isEqual:v6]) {
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4F4FBA0] remoteDevices];
  if ([v5 isEqual:v7])
  {
LABEL_5:

LABEL_6:
    int64_t v9 = 1;
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x1E4F4FBA0] lock];
  if ([v5 isEqual:v8])
  {

    goto LABEL_5;
  }
  id v11 = [MEMORY[0x1E4F4FBA0] tmp];
  char v12 = [v5 isEqual:v11];

  if (v12)
  {
    int64_t v9 = 1;
    goto LABEL_8;
  }
  id v13 = [MEMORY[0x1E4F4FBA0] metadata];
  char v14 = [v5 isEqual:v13];

  if (v14)
  {
    int64_t v9 = 0;
    goto LABEL_8;
  }
  id v15 = [v3 path];
  id v6 = [v15 componentsSeparatedByString:@"/"];

  if ((unint64_t)[v6 count] < 2)
  {
    int64_t v9 = 2;
  }
  else
  {
    uint64_t v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
    unint64_t v17 = [MEMORY[0x1E4F4FBA0] remoteDevices];
    int v18 = [v16 isEqual:v17];

    if (v18) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2;
    }
  }
LABEL_7:

LABEL_8:
  return v9;
}

- (BMSegmentManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BMSegmentManagerDelegate *)WeakRetained;
}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_1(&dword_1AD076000, v2, v3, "Segment %@ is getting removed. Invalid file size of 0 bytes", v4, v5, v6, v7, v8);
}

void __50__BMSegmentManager_pruneSegmentsToMaxSizeInBytes___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  uint8_t v8 = [MEMORY[0x1E4F4FB78] privacyPathname:a2];
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v2, v3, "Failed to get size of file error=%{public}@ for segment %@", v4, v5, v6, v7, 2u);
}

- (void)fileHandleForFile:error:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Failed to create new framestore with nil filename", v2, v3, v4, v5, v6);
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "lastFrameStoreOrCreateWithTimestamp: Assertion Failed: [_path hasPrefix:_config.datastorePath]", v2, v3, v4, v5, v6);
}

void __56__BMSegmentManager_lastFrameStoreOrCreateWithTimestamp___block_invoke_49_cold_1(id *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v2 = [*a1 path];
  uint64_t v3 = [v1 privacyPathname:v2];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8_1(&dword_1AD076000, v4, v5, "Unable to lastFrameStoreOrCreateWithTimestamp and   creation also failed for %@", v6, v7, v8, v9, v10);
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "_segmentAfterFrameStore: Assertion Failed: [_path hasPrefix:_config.datastorePath]", v2, v3, v4, v5, v6);
}

void __83__BMSegmentManager__segmentAfterFrameStore_orCreateSegmentWithTimestamp_direction___block_invoke_51_cold_1(id *a1, id *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 segmentName];
  uint8_t v6 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v7 = [*a2 path];
  uint64_t v8 = [v6 privacyPathname:v7];
  int v9 = 138412546;
  uint8_t v10 = v5;
  __int16 v11 = 2112;
  char v12 = v8;
  _os_log_fault_impl(&dword_1AD076000, a3, OS_LOG_TYPE_FAULT, "Unable to _segmentAfterFrameStore and creation also failed for prevStore:%@ in %@", (uint8_t *)&v9, 0x16u);
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Failed to create new file handle, no error reported", v2, v3, v4, v5, v6);
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "Failed to create new file handle with error, %@", v1, 0xCu);
}

- (void)newFramestoreWithTimestamp:(uint64_t)a1 segmentNames:segmentFileHandles:.cold.3(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0_1(&dword_1AD076000, v2, v3, "Failed to move temporary segment: %@ into segment list with error, %@", v4, v5, v6, v7, v8);
}

- (void)newFramestoreWithTimestamp:(uint64_t)a1 segmentNames:segmentFileHandles:.cold.4(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v2, v3, "Failed to create new segment file %@ without error code", v4, v5, v6, v7, v8);
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.5()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Failed to create new segment", v2, v3, v4, v5, v6);
}

- (void)newFramestoreWithTimestamp:segmentNames:segmentFileHandles:.cold.6()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Time traveling is not allowed. The last segment in the directory has a greater timestamp than the current timestamp.", v2, v3, v4, v5, v6);
}

- (void)segmentWithFilename:(void *)a1 segmentNames:segmentFileHandles:error:.cold.2(void *a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F4FB78];
  uint64_t v2 = [a1 attributes];
  uint64_t v3 = [v2 path];
  uint64_t v4 = [v1 privacyPathname:v3];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2(&dword_1AD076000, v5, v6, "Failed to instantiate framestore with path: %{public}@.", v7, v8, v9, v10, v11);
}

void __47__BMSegmentManager_segmentContainingTimestamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1AD076000, v0, v1, "Received an index beyond _segmentNames in newEnumeratorFromStartTime:", v2, v3, v4, v5, v6);
}

- (void)removeSegmentNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4FB78] privacyPathname:a1];
  int v4 = *__error();
  int v5 = 138543618;
  uint8_t v6 = v3;
  __int16 v7 = 1026;
  int v8 = v4;
  _os_log_error_impl(&dword_1AD076000, a2, OS_LOG_TYPE_ERROR, "Unable to delete frame store (%{public}@). Error: %{public, darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

- (void)enumerateSegmentsNamesFrom:to:withBlock:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_2();
  _os_log_error_impl(&dword_1AD076000, v0, OS_LOG_TYPE_ERROR, "Start date (%lf) is greater than end date (%lf)", v1, 0x16u);
}

- (void)enumerateSegmentsNamesFrom:to:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Received an index beyond _segmentNames in enumerateSegmentsNamesFrom:to:withBlock:", v2, v3, v4, v5, v6);
}

- (void)reverseEnumerateSegmentsNamesFrom:to:withBlock:.cold.2()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_0(&dword_1AD076000, v0, v1, "Received an index beyond _segmentNames in reverseEnumerateSegmentsNamesFrom:to:withBlock:", v2, v3, v4, v5, v6);
}

@end