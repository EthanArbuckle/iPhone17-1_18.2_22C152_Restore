@interface HMCharacteristicBatchRequest
+ (id)characteristicBatchRequestWithReadRequests:(id)a3;
+ (id)characteristicBatchRequestWithWriteRequests:(id)a3;
- (HMBatchRequest)batchRequest;
- (HMCharacteristicBatchRequest)initWithBatchRequest:(id)a3;
- (id)completionHandler;
- (id)progressHandler;
- (id)requests;
- (void)setBatchRequest:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation HMCharacteristicBatchRequest

- (id)progressHandler
{
  return [(HMBatchRequest *)self->_batchRequest progressHandler];
}

- (id)completionHandler
{
  return [(HMBatchRequest *)self->_batchRequest completionHandler];
}

- (HMBatchRequest)batchRequest
{
  return self->_batchRequest;
}

void __51__HMCharacteristicBatchRequest_setProgressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32))
  {
    v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v14 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v12 = v11;
          }
          else {
            v12 = 0;
          }
          id v13 = v12;

          if (v13) {
            objc_msgSend(v5, "addObject:", v13, (void)v14);
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setProgressHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMCharacteristicBatchRequest_setProgressHandler___block_invoke;
  v7[3] = &unk_1E593F3F8;
  id v8 = v4;
  batchRequest = self->_batchRequest;
  id v6 = v4;
  [(HMBatchRequest *)batchRequest setProgressHandler:v7];
}

- (void)setCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMCharacteristicBatchRequest_setCompletionHandler___block_invoke;
  v7[3] = &unk_1E59400F8;
  id v8 = v4;
  batchRequest = self->_batchRequest;
  id v6 = v4;
  [(HMBatchRequest *)batchRequest setCompletionHandler:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchRequest, 0);
  objc_storeStrong(&self->_progressHandler, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

+ (id)characteristicBatchRequestWithReadRequests:(id)a3
{
  id v3 = +[HMBatchRequest batchRequestWithReadRequests:a3];
  id v4 = [[HMCharacteristicBatchRequest alloc] initWithBatchRequest:v3];

  return v4;
}

- (HMCharacteristicBatchRequest)initWithBatchRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMCharacteristicBatchRequest;
  id v6 = [(HMCharacteristicBatchRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_batchRequest, a3);
  }

  return v7;
}

uint64_t __53__HMCharacteristicBatchRequest_setCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setBatchRequest:(id)a3
{
}

- (id)requests
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = self->_batchRequest;
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(HMBatchRequest *)v2 requests];
  id v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(HMBatchRequest *)v2 requests];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
        id v13 = v12;

        if (v13) {
          [v5 addObject:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  long long v14 = (void *)[v5 copy];

  return v14;
}

+ (id)characteristicBatchRequestWithWriteRequests:(id)a3
{
  id v3 = +[HMBatchRequest batchRequestWithWriteRequests:a3];
  id v4 = [[HMCharacteristicBatchRequest alloc] initWithBatchRequest:v3];

  return v4;
}

@end