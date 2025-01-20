@interface MTRTimeSynchronizationClusterTrustedTimeSourceStruct
- (MTRTimeSynchronizationClusterTrustedTimeSourceStruct)init;
- (NSNumber)endpoint;
- (NSNumber)fabricIndex;
- (NSNumber)nodeID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEndpoint:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setNodeID:(id)a3;
@end

@implementation MTRTimeSynchronizationClusterTrustedTimeSourceStruct

- (MTRTimeSynchronizationClusterTrustedTimeSourceStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRTimeSynchronizationClusterTrustedTimeSourceStruct;
  v2 = [(MTRTimeSynchronizationClusterTrustedTimeSourceStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    fabricIndex = v2->_fabricIndex;
    v2->_fabricIndex = (NSNumber *)&unk_26F9C8620;

    nodeID = v3->_nodeID;
    v3->_nodeID = (NSNumber *)&unk_26F9C8620;

    endpoint = v3->_endpoint;
    v3->_endpoint = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTimeSynchronizationClusterTrustedTimeSourceStruct);
  v7 = objc_msgSend_fabricIndex(self, v5, v6);
  objc_msgSend_setFabricIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_nodeID(self, v9, v10);
  objc_msgSend_setNodeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_endpoint(self, v13, v14);
  objc_msgSend_setEndpoint_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: fabricIndex:%@; nodeID:%@; endpoint:%@; >",
    v5,
    self->_fabricIndex,
    self->_nodeID,
  v7 = self->_endpoint);

  return v7;
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
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

  objc_storeStrong((id *)&self->_fabricIndex, 0);
}

@end