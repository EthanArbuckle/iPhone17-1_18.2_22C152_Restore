@interface HDSampleIteratorQueryServer
+ (BOOL)supportsAnchorBasedAuthorization;
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDSampleIteratorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)objectTypes;
- (void)_queue_deliverSamples:(void *)a3 queryCursor:(uint64_t)a4 deliverResults:;
- (void)_queue_start;
@end

@implementation HDSampleIteratorQueryServer

- (HDSampleIteratorQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDSampleIteratorQueryServer;
  v11 = [(HDQueryServer *)&v16 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    v12 = [v10 queryCursor];
    uint64_t v13 = [v12 copy];
    queryCursor = v11->_queryCursor;
    v11->_queryCursor = (HKSampleIteratorQueryCursor *)v13;

    v11->_limit = [v10 limit];
  }

  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  v6 = [a3 queryCursor];
  v7 = [v6 queryDescriptors];
  uint64_t v8 = [v7 count];

  if (!v8) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"Missing sample type for query");
  }
  return v8 != 0;
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 1;
}

- (id)objectTypes
{
  v2 = [(HKSampleIteratorQueryCursor *)self->_queryCursor queryDescriptors];
  v3 = objc_msgSend(v2, "hk_mapToSet:", &__block_literal_global_162);

  return v3;
}

uint64_t __42__HDSampleIteratorQueryServer_objectTypes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sampleType];
}

- (void)_queue_start
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)HDSampleIteratorQueryServer;
  [(HDQueryServer *)&v15 _queue_start];
  queryCursor = self->_queryCursor;
  unint64_t limit = self->_limit;
  v13[4] = self;
  id v14 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__HDSampleIteratorQueryServer__queue_start__block_invoke;
  v13[3] = &unk_1E6305360;
  int64_t v5 = [(HDBatchedQueryServer *)self batchObjectsWithMultitypeQueryCursor:queryCursor includeDeletedObjects:0 limit:limit error:&v14 batchHandler:v13];
  id v6 = v14;
  switch(v5)
  {
    case 1:
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = self;
        __int16 v18 = 2114;
        id v19 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error enumerating update results: %{public}@", buf, 0x16u);
      }
      uint64_t v8 = [(HDQueryServer *)self clientProxy];
      v9 = [(HDQueryServer *)self queryUUID];
      objc_msgSend(v8, "client_deliverError:forQuery:", v6, v9);

      goto LABEL_13;
    case 2:
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29F90];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v17 = self;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Client no longer authorized", buf, 0xCu);
      }

      -[HDSampleIteratorQueryServer _queue_deliverSamples:queryCursor:deliverResults:](self, MEMORY[0x1E4F1CBF0], self->_queryCursor, 1);
      goto LABEL_14;
    case 3:
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E4F29F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138543362;
      v17 = self;
      v12 = "%{public}@: Suspended during enumeration";
      break;
    case 4:
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E4F29F90];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F90], OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138543362;
      v17 = self;
      v12 = "%{public}@: Canceled during enumeration";
      break;
    default:
      goto LABEL_13;
  }
  _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
LABEL_13:

LABEL_14:
  [(HDQueryServer *)self setDataCount:self->_deliveredResultCount];
}

void __43__HDSampleIteratorQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  v9 = *(void **)(a1 + 32);
  id v10 = a5;
  id v11 = [v9 filteredSamplesForClientWithSamples:a2];
  *(void *)(*(void *)(a1 + 32) + 216) += [v11 count];
  -[HDSampleIteratorQueryServer _queue_deliverSamples:queryCursor:deliverResults:](*(void **)(a1 + 32), v11, v10, a6);
}

- (void)_queue_deliverSamples:(void *)a3 queryCursor:(uint64_t)a4 deliverResults:
{
  if (a1)
  {
    id v7 = a3;
    id v8 = a2;
    v9 = [a1 queryQueue];
    dispatch_assert_queue_V2(v9);

    id v11 = [a1 clientProxy];
    id v10 = [a1 queryUUID];
    objc_msgSend(v11, "client_deliverSampleObjects:queryCursor:deliverResults:query:", v8, v7, a4, v10);
  }
}

- (void).cxx_destruct
{
}

@end