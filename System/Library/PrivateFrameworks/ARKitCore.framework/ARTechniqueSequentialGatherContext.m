@interface ARTechniqueSequentialGatherContext
+ (BOOL)supportsSecureCoding;
- (ARTechniqueSequentialGatherContext)initWithCoder:(id)a3;
- (ARTechniqueSequentialGatherContext)initWithParentContext:(id)a3;
- (id)gatheredData;
- (void)addResultData:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeResultsOfContext:(id)a3 resultFilterBlock:(id)a4;
@end

@implementation ARTechniqueSequentialGatherContext

- (ARTechniqueSequentialGatherContext)initWithParentContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARTechniqueSequentialGatherContext;
  v3 = [(ARTechniqueGatherContext *)&v7 initWithParentContext:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    gatheredData = v3->_gatheredData;
    v3->_gatheredData = (NSMutableArray *)v4;
  }
  return v3;
}

- (id)gatheredData
{
  return self->_gatheredData;
}

- (void)addResultData:(id)a3
{
}

- (void)mergeResultsOfContext:(id)a3 resultFilterBlock:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 gatheredData];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __78__ARTechniqueSequentialGatherContext_mergeResultsOfContext_resultFilterBlock___block_invoke;
  v10[3] = &unk_1E6187690;
  id v11 = v6;
  id v8 = v6;
  v9 = objc_msgSend(v7, "ar_filter:", v10);

  [(ARTechniqueSequentialGatherContext *)self addResultData:v9];
}

uint64_t __78__ARTechniqueSequentialGatherContext_mergeResultsOfContext_resultFilterBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARTechniqueSequentialGatherContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARTechniqueSequentialGatherContext;
  v5 = [(ARTechniqueGatherContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"gatheredData"];
    gatheredData = v5->_gatheredData;
    v5->_gatheredData = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ARTechniqueSequentialGatherContext;
  [(ARTechniqueGatherContext *)&v24 encodeWithCoder:v4];
  v5 = self->_gatheredData;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = objc_opt_new();
    objc_super v7 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v19 = self;
    id v8 = self->_gatheredData;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ([v13 conformsToProtocol:&unk_1F12629E8]) {
            v14 = (void *)v6;
          }
          else {
            v14 = v7;
          }
          [v14 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v20 objects:v31 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      if (_ARLogDaemon_onceToken != -1) {
        dispatch_once(&_ARLogDaemon_onceToken, &__block_literal_global_78);
      }
      v15 = (void *)_ARLogDaemon_logObj;
      if (os_log_type_enabled((os_log_t)_ARLogDaemon_logObj, OS_LOG_TYPE_DEBUG))
      {
        v16 = v15;
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543874;
        v26 = v18;
        __int16 v27 = 2048;
        v28 = v19;
        __int16 v29 = 2112;
        v30 = v7;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: got insecure contexts to encode for daemon connection: %@", buf, 0x20u);
      }
    }

    v5 = (NSMutableArray *)v6;
  }
  [v4 encodeObject:v5 forKey:@"gatheredData"];
}

- (void).cxx_destruct
{
}

@end