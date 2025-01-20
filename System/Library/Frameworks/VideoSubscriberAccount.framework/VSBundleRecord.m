@interface VSBundleRecord
- (LSBundleRecord)record;
- (NSOperationQueue)lsQueue;
- (VSBundleRecord)initWithBundleID:(id)a3;
- (id)bundleVersion;
- (void)setLsQueue:(id)a3;
- (void)setRecord:(id)a3;
@end

@implementation VSBundleRecord

- (VSBundleRecord)initWithBundleID:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)VSBundleRecord;
  v5 = [(VSBundleRecord *)&v44 init];
  if (v5)
  {
    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    lsQueue = v5->_lsQueue;
    v5->_lsQueue = v6;

    v8 = v5->_lsQueue;
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [(NSOperationQueue *)v8 setName:v10];

    [(NSOperationQueue *)v5->_lsQueue setMaxConcurrentOperationCount:1];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__4;
    v42 = __Block_byref_object_dispose__4;
    id v43 = 0;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__4;
    v36 = __Block_byref_object_dispose__4;
    id v37 = 0;
    v11 = objc_alloc_init(VSWaitGroup);
    [(VSWaitGroup *)v11 enter];
    v12 = v5->_lsQueue;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __35__VSBundleRecord_initWithBundleID___block_invoke;
    v27 = &unk_1E6BD36A0;
    v30 = &v32;
    id v13 = v4;
    id v28 = v13;
    v31 = &v38;
    v14 = v11;
    v29 = v14;
    [(NSOperationQueue *)v12 addOperationWithBlock:&v24];
    if (!-[VSWaitGroup waitWithMilliseconds:](v14, "waitWithMilliseconds:", 5000, v24, v25, v26, v27))
    {
      v15 = VSDefaultLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v13;
        _os_log_impl(&dword_1DA674000, v15, OS_LOG_TYPE_DEFAULT, "LaunchServices timed out while obtaining LSBundleRecord for bundleID %@", buf, 0xCu);
      }
    }
    if (v33[5]) {
      goto LABEL_14;
    }
    if (v39[5])
    {
      v16 = VSDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = v39[5];
        *(_DWORD *)buf = 138412546;
        id v46 = v13;
        __int16 v47 = 2112;
        uint64_t v48 = v17;
        v18 = "Received error while obtaining LSBundleRecord for bundleID %@: %@";
        v19 = v16;
        uint32_t v20 = 22;
LABEL_12:
        _os_log_impl(&dword_1DA674000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
    else
    {
      v16 = VSDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v13;
        v18 = "No LSBundleRecord found for bundleID %@";
        v19 = v16;
        uint32_t v20 = 12;
        goto LABEL_12;
      }
    }

LABEL_14:
    uint64_t v21 = [(id)v33[5] copy];
    record = v5->_record;
    v5->_record = (LSBundleRecord *)v21;

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
  return v5;
}

uint64_t __35__VSBundleRecord_initWithBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v2 allowPlaceholder:0 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return [*(id *)(a1 + 40) leave];
}

- (id)bundleVersion
{
  uint64_t v3 = [(VSBundleRecord *)self record];

  if (v3)
  {
    uint64_t v4 = [(VSBundleRecord *)self record];
    uint64_t v5 = [v4 bundleVersion];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (LSBundleRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSOperationQueue)lsQueue
{
  return self->_lsQueue;
}

- (void)setLsQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lsQueue, 0);

  objc_storeStrong((id *)&self->_record, 0);
}

@end