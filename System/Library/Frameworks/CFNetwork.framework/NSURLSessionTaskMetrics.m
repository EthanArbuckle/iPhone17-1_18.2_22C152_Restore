@interface NSURLSessionTaskMetrics
+ (BOOL)supportsSecureCoding;
- (NSArray)transactionMetrics;
- (NSDateInterval)taskInterval;
- (NSUInteger)redirectCount;
- (NSURLSessionTaskMetrics)init;
- (NSURLSessionTaskMetrics)initWithCoder:(id)a3;
- (id)description;
- (id)initWithMetrics:(id *)a1;
- (void)collectWithCompletionHandler:(void *)a3 queue:;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSURLSessionTaskMetrics

- (void).cxx_destruct
{
}

- (id)initWithMetrics:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NSURLSessionTaskMetrics;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

- (void)collectWithCompletionHandler:(void *)a3 queue:
{
  v5 = a2;
  objc_super v7 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  v8 = *(void **)(a1 + 8);
  if (!v8)
  {
    v10 = 0;
    goto LABEL_11;
  }
  id v9 = objc_getProperty(v8, v6, 96, 1);
  v10 = v9;
  if (!v9)
  {
LABEL_11:
    v11 = 0;
    goto LABEL_5;
  }
  v11 = (void *)*((void *)v9 + 30);
LABEL_5:
  v12 = v11;

  if (v12)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke;
    v13[3] = &unk_1E52583E0;
    v13[4] = a1;
    v14 = v5;
    nw_data_transfer_report_collect(v12, v7, v13);
  }
  else
  {
    v5[2](v5);
  }

LABEL_9:
}

- (NSUInteger)redirectCount
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  metrics = self->__metrics;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__NSURLSessionTaskMetrics_redirectCount__block_invoke;
  v5[3] = &unk_1E52583B8;
  v5[4] = &v6;
  -[__CFN_TaskMetrics lockTransactionMetrics:]((uint64_t)metrics, v5);
  NSUInteger v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)transactionMetrics
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  metrics = self->__metrics;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke;
  v5[3] = &unk_1E52583B8;
  v5[4] = &v6;
  -[__CFN_TaskMetrics lockTransactionMetrics:]((uint64_t)metrics, v5);
  NSUInteger v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __45__NSURLSessionTaskMetrics_transactionMetrics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        if (v11) {
          v12 = *(void **)(v11 + 72);
        }
        else {
          v12 = 0;
        }
        id v13 = v12;
        BOOL v14 = v13 == 0;

        if (!v14)
        {
          v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          v16 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]([NSURLSessionTaskTransactionMetrics alloc], (void *)v11, 1);
          objc_msgSend(v15, "addObject:", v16, (void)v23);
        }
        if (v11)
        {
          if (*(unsigned char *)(v11 + 8)) {
            goto LABEL_12;
          }
          v19 = *(void **)(v11 + 72);
        }
        else
        {
          v19 = 0;
        }
        id v20 = v19;
        BOOL v21 = v20 == 0;

        if (v21)
        {
LABEL_12:
          v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          v18 = -[NSURLSessionTaskTransactionMetrics initWithMetrics:forCache:]([NSURLSessionTaskTransactionMetrics alloc], (void *)v11, 0);
          [v17 addObject:v18];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v22 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v8 = v22;
    }
    while (v22);
  }
}

void __40__NSURLSessionTaskMetrics_redirectCount__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (v7 && *(void *)(v7 + 208) == 2) {
          ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateInterval)taskInterval
{
  metrics = self->__metrics;
  if (metrics)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:metrics->_createTime];
    uint64_t v5 = self->__metrics;
    double createTime = 0.0;
    if (v5)
    {
      double completeTime = v5->_completeTime;
      double createTime = v5->_createTime;
    }
    else
    {
      double completeTime = 0.0;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v9 = completeTime - createTime;
    if (completeTime - createTime < 0.0) {
      double v9 = 0.0;
    }
    uint64_t v10 = [v8 initWithStartDate:v4 duration:v9];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28C18]);
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v10 = [v11 initWithStartDate:v4 duration:0.0];
  }
  v12 = (void *)v10;

  return (NSDateInterval *)v12;
}

- (NSURLSessionTaskMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSURLSessionTaskMetrics;
  uint64_t v5 = [(NSURLSessionTaskMetrics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
    metrics = v5->__metrics;
    v5->__metrics = (__CFN_TaskMetrics *)v6;
  }
  return v5;
}

void __62__NSURLSessionTaskMetrics_collectWithCompletionHandler_queue___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v5)
  {
    uint64_t v6 = (id *)objc_getProperty(v5, v4, 96, 1);
    uint64_t v7 = v6;
    if (v6) {
      objc_storeStrong(v6 + 30, a2);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSURLSessionTaskMetrics *)self transactionMetrics];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v8 = NSString;
  objc_super v9 = [(NSURLSessionTaskMetrics *)self taskInterval];
  uint64_t v10 = [v8 stringWithFormat:@"(Task Interval) %@\n(Redirect Count) %lu\n(Transaction Metrics) %@", v9, -[NSURLSessionTaskMetrics redirectCount](self, "redirectCount"), v3];

  return v10;
}

- (NSURLSessionTaskMetrics)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskMetrics;
  return [(NSURLSessionTaskMetrics *)&v3 init];
}

@end