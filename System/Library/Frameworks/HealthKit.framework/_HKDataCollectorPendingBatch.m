@interface _HKDataCollectorPendingBatch
- (BOOL)isTransient;
- (HKDevice)device;
- (NSArray)completions;
- (NSArray)data;
- (NSDictionary)metadata;
- (NSUUID)batchUUID;
- (_HKDataCollectorPendingBatch)init;
- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completion:(id)a8;
- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completions:(id)a8;
- (id)batchByAddingData:(id)a3 completion:(id)a4;
- (id)description;
- (unint64_t)options;
- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation _HKDataCollectorPendingBatch

- (_HKDataCollectorPendingBatch)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completion:(id)a8
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  if (a8)
  {
    v18 = _Block_copy(a8);
    v24[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v20 = [(_HKDataCollectorPendingBatch *)self initWithIdentifier:v17 data:v16 metadata:v15 device:v14 options:a7 completions:v19];

    v21 = v20;
  }
  else
  {
    v22 = [(_HKDataCollectorPendingBatch *)self initWithIdentifier:v17 data:v16 metadata:v15 device:v14 options:a7 completions:MEMORY[0x1E4F1CBF0]];

    v21 = v22;
  }

  return v21;
}

- (_HKDataCollectorPendingBatch)initWithIdentifier:(id)a3 data:(id)a4 metadata:(id)a5 device:(id)a6 options:(unint64_t)a7 completions:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_HKDataCollectorPendingBatch;
  v19 = [(_HKDataCollectorPendingBatch *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    batchUUID = v19->_batchUUID;
    v19->_batchUUID = (NSUUID *)v20;

    uint64_t v22 = [v15 copy];
    data = v19->_data;
    v19->_data = (NSArray *)v22;

    uint64_t v24 = [v16 copy];
    metadata = v19->_metadata;
    v19->_metadata = (NSDictionary *)v24;

    uint64_t v26 = [v17 copy];
    device = v19->_device;
    v19->_device = (HKDevice *)v26;

    v19->_options = a7;
    uint64_t v28 = [v18 copy];
    completions = v19->_completions;
    v19->_completions = (NSArray *)v28;
  }
  return v19;
}

- (id)batchByAddingData:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [_HKDataCollectorPendingBatch alloc];
  batchUUID = self->_batchUUID;
  v10 = [(NSArray *)self->_data arrayByAddingObjectsFromArray:v7];

  metadata = self->_metadata;
  device = self->_device;
  unint64_t options = self->_options;
  completions = self->_completions;
  if (v6)
  {
    id v15 = _Block_copy(v6);
    id v16 = [(NSArray *)completions arrayByAddingObject:v15];
    id v17 = [(_HKDataCollectorPendingBatch *)v8 initWithIdentifier:batchUUID data:v10 metadata:metadata device:device options:options completions:v16];
  }
  else
  {
    id v17 = [(_HKDataCollectorPendingBatch *)v8 initWithIdentifier:batchUUID data:v10 metadata:metadata device:device options:options completions:completions];
  }

  return v17;
}

- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(NSArray *)self->_completions count])
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogDataCollection;
    if (os_log_type_enabled((os_log_t)HKLogDataCollection, OS_LOG_TYPE_INFO))
    {
      batchUUID = self->_batchUUID;
      v8 = v6;
      v9 = HKDiagnosticStringFromUUID(batchUUID);
      NSUInteger v10 = [(NSArray *)self->_completions count];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v9;
      __int16 v25 = 2048;
      NSUInteger v26 = v10;
      _os_log_impl(&dword_19C023000, v8, OS_LOG_TYPE_INFO, "%{public}@: Batch %{public}@: Calling %ld completions from client.", buf, 0x20u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v11 = (void *)[(NSArray *)self->_completions copy];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15++) + 16))();
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = HKDiagnosticStringFromUUID(self->_batchUUID);
  id v6 = [v3 stringWithFormat:@"<%@:%p %@ datums={%lu count} metadata={%lu values} device=%@>", v4, self, v5, -[NSArray count](self->_data, "count"), -[NSDictionary count](self->_metadata, "count"), self->_device];

  return v6;
}

- (BOOL)isTransient
{
  return self->_options & 1;
}

- (NSUUID)batchUUID
{
  return self->_batchUUID;
}

- (NSArray)data
{
  return self->_data;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (HKDevice)device
{
  return self->_device;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSArray)completions
{
  return self->_completions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_batchUUID, 0);
}

@end