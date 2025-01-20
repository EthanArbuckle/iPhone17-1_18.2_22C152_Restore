@interface MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct
- (MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct)init;
- (NSNumber)endpoint;
- (NSNumber)nodeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpoint:(id)a3;
- (void)setNodeID:(id)a3;
@end

@implementation MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct

- (MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct;
  v2 = [(MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    nodeID = v2->_nodeID;
    v2->_nodeID = (NSNumber *)&unk_26F9C8620;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterFabricScopedTrustedTimeSourceStruct);
  objc_super v7 = objc_msgSend_nodeID(self, v5, v6);
  objc_msgSend_setNodeID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_endpoint(self, v9, v10);
  objc_msgSend_setEndpoint_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: nodeID:%@; endpoint:%@; >",
    v5,
    self->_nodeID,
  objc_super v7 = self->_endpoint);

  return v7;
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
}

- (NSNumber)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_nodeID, 0);
}

@end