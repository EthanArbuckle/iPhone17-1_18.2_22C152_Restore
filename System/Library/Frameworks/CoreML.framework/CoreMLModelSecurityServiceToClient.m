@interface CoreMLModelSecurityServiceToClient
- (CoreMLModelSecurityServiceToClient)init;
- (NSCountedSet)featureProviderCount;
- (NSMutableDictionary)featureProviderMap;
- (OS_dispatch_queue)serviceToClientQueue;
- (void)clientFeatureNames:(id)a3 withReply:(id)a4;
- (void)clientFeatureValueForName:(id)a3 uniqueKeyForProvider:(id)a4 withReply:(id)a5;
- (void)setFeatureProviderCount:(id)a3;
- (void)setFeatureProviderMap:(id)a3;
- (void)setServiceToClientQueue:(id)a3;
@end

@implementation CoreMLModelSecurityServiceToClient

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceToClientQueue, 0);
  objc_storeStrong((id *)&self->_featureProviderCount, 0);

  objc_storeStrong((id *)&self->_featureProviderMap, 0);
}

- (void)setServiceToClientQueue:(id)a3
{
}

- (OS_dispatch_queue)serviceToClientQueue
{
  return self->_serviceToClientQueue;
}

- (void)setFeatureProviderCount:(id)a3
{
}

- (NSCountedSet)featureProviderCount
{
  return self->_featureProviderCount;
}

- (void)setFeatureProviderMap:(id)a3
{
}

- (NSMutableDictionary)featureProviderMap
{
  return self->_featureProviderMap;
}

- (void)clientFeatureNames:(id)a3 withReply:(id)a4
{
  v6 = (void (**)(id, void *, void))a4;
  id v7 = a3;
  v8 = [(CoreMLModelSecurityServiceToClient *)self featureProviderMap];
  id v10 = [v8 objectForKeyedSubscript:v7];

  v9 = [v10 featureNames];
  v6[2](v6, v9, 0);
}

- (void)clientFeatureValueForName:(id)a3 uniqueKeyForProvider:(id)a4 withReply:(id)a5
{
  v8 = (void (**)(id, void *, void))a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(CoreMLModelSecurityServiceToClient *)self featureProviderMap];
  id v13 = [v11 objectForKeyedSubscript:v9];

  v12 = [v13 featureValueForName:v10];

  v8[2](v8, v12, 0);
}

- (CoreMLModelSecurityServiceToClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)CoreMLModelSecurityServiceToClient;
  v2 = [(CoreMLModelSecurityServiceToClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    featureProviderMap = v2->_featureProviderMap;
    v2->_featureProviderMap = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    featureProviderCount = v2->_featureProviderCount;
    v2->_featureProviderCount = (NSCountedSet *)v5;
  }
  return v2;
}

@end