@interface MTRAttributeCacheContainer
- (MTRAttributeCacheContainer)init;
- (MTRClusterStateCacheContainer)realContainer;
- (void)readAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion;
@end

@implementation MTRAttributeCacheContainer

- (MTRAttributeCacheContainer)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRAttributeCacheContainer;
  v2 = [(MTRAttributeCacheContainer *)&v7 init];
  if (v2
    && (v3 = objc_alloc_init(MTRClusterStateCacheContainer),
        realContainer = v2->_realContainer,
        v2->_realContainer = v3,
        realContainer,
        !v2->_realContainer))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)readAttributeWithEndpointId:(NSNumber *)endpointId clusterId:(NSNumber *)clusterId attributeId:(NSNumber *)attributeId clientQueue:(dispatch_queue_t)clientQueue completion:(MTRDeviceResponseHandler)completion
{
  v20 = endpointId;
  v12 = clusterId;
  v13 = attributeId;
  v14 = clientQueue;
  MTRDeviceResponseHandler v15 = completion;
  v18 = objc_msgSend_realContainer(self, v16, v17);
  objc_msgSend_readAttributesWithEndpointID_clusterID_attributeID_queue_completion_(v18, v19, (uint64_t)v20, v12, v13, v14, v15);
}

- (MTRClusterStateCacheContainer)realContainer
{
  return self->_realContainer;
}

- (void).cxx_destruct
{
}

@end