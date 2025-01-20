@interface HDCloudSyncStateStore
- (BOOL)data:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5;
- (HDCloudSyncStateStore)initWithData:(id)a3;
- (NSMutableDictionary)mergedData;
- (unint64_t)aggregateMergedDataLength;
- (void)setAggregateMergedDataLength:(unint64_t)a3;
- (void)unitTest_setMergedData:(id)a3;
@end

@implementation HDCloudSyncStateStore

- (HDCloudSyncStateStore)initWithData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncStateStore;
  v5 = [(HDCloudSyncStateStore *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    stateData = v5->_stateData;
    v5->_stateData = (NSDictionary *)v6;
  }
  return v5;
}

- (BOOL)data:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v7 = [(NSDictionary *)self->_stateData objectForKey:a4];
  v8 = v7;
  if (v7)
  {
    id v14 = 0;
    objc_super v9 = [v7 decompressedDataUsingAlgorithm:0 error:&v14];
    id v10 = v14;
    if (v9)
    {
      v11 = v9;
      if (!a3)
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v16 = self;
        __int16 v17 = 2114;
        id v18 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to decompress data: %{public}@", buf, 0x16u);
      }
      v11 = v8;
      if (!a3) {
        goto LABEL_5;
      }
    }
    *a3 = v11;
    goto LABEL_5;
  }
LABEL_6:

  return 1;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDCloudSyncStateStore *)self mergedData];

  if (v10)
  {
    id v11 = v8;
    if (!self)
    {
LABEL_20:

      v29 = self;
      v30 = v29;
      if (v29)
      {
        if (a5)
        {
          v30 = v29;
          BOOL v19 = 0;
          *a5 = v30;
        }
        else
        {
          _HKLogDroppedError();
          BOOL v19 = 0;
        }
        id v18 = v30;
      }
      else
      {
        id v18 = 0;
        BOOL v19 = 0;
      }
      goto LABEL_34;
    }
  }
  else
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    mergedData = self->_mergedData;
    self->_mergedData = v12;

    id v14 = v8;
  }
  unint64_t v15 = [v8 length];
  if (v15 >> 11 >= 0x19)
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v35 = self;
      __int16 v36 = 2050;
      unint64_t v37 = v15;
      __int16 v38 = 2050;
      uint64_t v39 = 51200;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "[%{public}@] Record size: %{public}lu exceeds soft size limit: %{public}lu", buf, 0x20u);
    }
    if (v15 >> 11 >= 0x7D)
    {
      v26 = (void *)MEMORY[0x1E4F28C58];
      v27 = @"Individual data size limit exceeded.";
      goto LABEL_16;
    }
  }
  if ([(HDCloudSyncStateStore *)self aggregateMergedDataLength] + v15 >= 0x300000)
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    v27 = @"Aggregate data size limit exceeded.";
LABEL_16:
    objc_msgSend(v26, "hk_error:description:", 736, v27);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    if (v28) {
      self = (HDCloudSyncStateStore *)v28;
    }
    else {
      self = 0;
    }

    goto LABEL_20;
  }

  id v33 = 0;
  __int16 v17 = [v8 compressedDataUsingAlgorithm:0 error:&v33];
  id v18 = (HDCloudSyncStateStore *)v33;
  BOOL v19 = v17 != 0;
  _HKInitializeLogging();
  v20 = *MEMORY[0x1E4F29FA8];
  v21 = *MEMORY[0x1E4F29FA8];
  if (v17)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v20;
      uint64_t v23 = [v8 length];
      uint64_t v24 = [v8 length];
      *(_DWORD *)buf = 138544130;
      v35 = self;
      __int16 v36 = 2114;
      unint64_t v37 = (unint64_t)v9;
      __int16 v38 = 2048;
      uint64_t v39 = v23;
      __int16 v40 = 2048;
      uint64_t v41 = v24;
      _os_log_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Compressed data for key: %{public}@ from %lu to %lu", buf, 0x2Au);
    }
    v25 = [(HDCloudSyncStateStore *)self mergedData];
    [v25 setObject:v17 forKeyedSubscript:v9];

    -[HDCloudSyncStateStore setAggregateMergedDataLength:](self, "setAggregateMergedDataLength:", -[HDCloudSyncStateStore aggregateMergedDataLength](self, "aggregateMergedDataLength")+ [v17 length]);
  }
  else
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      __int16 v36 = 2114;
      unint64_t v37 = (unint64_t)v18;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to compress data: %{public}@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 740, @"Failed to compress data.");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      if (a5) {
        *a5 = v31;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  v30 = 0;
LABEL_34:

  return v19;
}

- (void)unitTest_setMergedData:(id)a3
{
  id v4 = (NSMutableDictionary *)[a3 mutableCopy];
  mergedData = self->_mergedData;
  self->_mergedData = v4;
}

- (unint64_t)aggregateMergedDataLength
{
  return self->_aggregateMergedDataLength;
}

- (void)setAggregateMergedDataLength:(unint64_t)a3
{
  self->_aggregateMergedDataLength = a3;
}

- (NSMutableDictionary)mergedData
{
  return self->_mergedData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergedData, 0);

  objc_storeStrong((id *)&self->_stateData, 0);
}

@end