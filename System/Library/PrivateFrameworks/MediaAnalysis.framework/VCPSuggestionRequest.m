@interface VCPSuggestionRequest
+ (id)requestWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5;
- (NSArray)cflags;
- (NSArray)csns;
- (NSMutableDictionary)clusterFlagByClusterId;
- (NSString)requestId;
- (VCPSuggestionRequest)initWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5;
- (VNCanceller)canceller;
- (id)updateHandler;
- (unint64_t)type;
- (void)setUpdateHandler:(id)a3;
@end

@implementation VCPSuggestionRequest

- (VCPSuggestionRequest)initWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] && (uint64_t v11 = objc_msgSend(v8, "count"), v11 == objc_msgSend(v9, "count")))
  {
    v29.receiver = self;
    v29.super_class = (Class)VCPSuggestionRequest;
    v12 = [(VCPSuggestionRequest *)&v29 init];
    v13 = v12;
    if (v12)
    {
      v12->_type = 1;
      v14 = [MEMORY[0x1E4F29128] UUID];
      v15 = [v14 UUIDString];
      uint64_t v16 = [v15 copy];
      requestId = v13->_requestId;
      v13->_requestId = (NSString *)v16;

      v18 = [MEMORY[0x1E4F1CA60] dictionary];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __74__VCPSuggestionRequest_initWithFaceClusterIds_clusterFlags_updateHandler___block_invoke;
      v26[3] = &unk_1E62973D8;
      id v27 = v9;
      id v19 = v18;
      id v28 = v19;
      [v8 enumerateObjectsUsingBlock:v26];
      objc_storeStrong((id *)&v13->_clusterFlagByClusterId, v18);
      v20 = _Block_copy(v10);
      id updateHandler = v13->_updateHandler;
      v13->_id updateHandler = v20;

      v22 = (VNCanceller *)objc_alloc_init(MEMORY[0x1E4F456C8]);
      canceller = v13->_canceller;
      v13->_canceller = v22;
    }
    self = v13;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __74__VCPSuggestionRequest_initWithFaceClusterIds_clusterFlags_updateHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
}

+ (id)requestWithFaceClusterIds:(id)a3 clusterFlags:(id)a4 updateHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithFaceClusterIds:v8 clusterFlags:v9 updateHandler:v10];

  return v11;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)requestId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableDictionary)clusterFlagByClusterId
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)csns
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)cflags
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (id)updateHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setUpdateHandler:(id)a3
{
}

- (VNCanceller)canceller
{
  return (VNCanceller *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canceller, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_cflags, 0);
  objc_storeStrong((id *)&self->_csns, 0);
  objc_storeStrong((id *)&self->_clusterFlagByClusterId, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end