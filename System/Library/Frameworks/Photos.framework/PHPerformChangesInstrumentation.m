@interface PHPerformChangesInstrumentation
+ (PHPerformChangesInstrumentation)startPeformChangesWithName:(uint64_t)a1;
- (PHPerformChangesInstrumentation)init;
- (void)endPerformChangesWithSuccess:(void *)a3 error:;
- (void)initWithUUID:(void *)a1;
@end

@implementation PHPerformChangesInstrumentation

- (void).cxx_destruct
{
}

- (PHPerformChangesInstrumentation)init
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = (PHPerformChangesInstrumentation *)-[PHPerformChangesInstrumentation initWithUUID:](self, v3);

  return v4;
}

- (void)initWithUUID:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PHPerformChangesInstrumentation;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[5];
      a1[5] = v4;
    }
  }

  return a1;
}

+ (PHPerformChangesInstrumentation)startPeformChangesWithName:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self;
  id v3 = objc_alloc_init(PHPerformChangesInstrumentation);
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_performChangesName = a2;
    v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uuid = v4->_uuid;
      performChangesName = v4->_performChangesName;
      qos_class_self();
      v8 = PLStringFromQoSClass();
      int v10 = 138543874;
      v11 = uuid;
      __int16 v12 = 2082;
      v13 = performChangesName;
      __int16 v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] %{public}s called at %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }

  return v4;
}

- (void)endPerformChangesWithSuccess:(void *)a3 error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a1)
  {
    v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 8);
      qos_class_self();
      v9 = PLStringFromQoSClass();
      int v10 = @"NO";
      if (a2) {
        int v10 = @"YES";
      }
      v11 = v10;
      int v12 = 138544386;
      uint64_t v13 = v7;
      __int16 v14 = 2082;
      uint64_t v15 = v8;
      __int16 v16 = 2114;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v11;
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEFAULT, "PhotoKit changes: [%{public}@] %{public}s completed at %{public}@, success: %{public}@, error: %@", (uint8_t *)&v12, 0x34u);
    }
    *(void *)(a1 + 8) = 0;
  }
}

@end