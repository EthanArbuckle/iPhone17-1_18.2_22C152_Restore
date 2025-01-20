@interface MTRDoorLockClusterLockOperationEvent
- (MTRDoorLockClusterLockOperationEvent)init;
- (NSArray)credentials;
- (NSNumber)fabricIndex;
- (NSNumber)lockOperationType;
- (NSNumber)operationSource;
- (NSNumber)sourceNode;
- (NSNumber)userIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredentials:(NSArray *)credentials;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setLockOperationType:(NSNumber *)lockOperationType;
- (void)setOperationSource:(NSNumber *)operationSource;
- (void)setSourceNode:(NSNumber *)sourceNode;
- (void)setUserIndex:(NSNumber *)userIndex;
@end

@implementation MTRDoorLockClusterLockOperationEvent

- (MTRDoorLockClusterLockOperationEvent)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRDoorLockClusterLockOperationEvent;
  v2 = [(MTRDoorLockClusterLockOperationEvent *)&v11 init];
  v3 = v2;
  if (v2)
  {
    lockOperationType = v2->_lockOperationType;
    v2->_lockOperationType = (NSNumber *)&unk_26F9C8620;

    operationSource = v3->_operationSource;
    v3->_operationSource = (NSNumber *)&unk_26F9C8620;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    sourceNode = v3->_sourceNode;
    v3->_sourceNode = 0;

    credentials = v3->_credentials;
    v3->_credentials = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterLockOperationEvent);
  v7 = objc_msgSend_lockOperationType(self, v5, v6);
  objc_msgSend_setLockOperationType_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_operationSource(self, v9, v10);
  objc_msgSend_setOperationSource_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_userIndex(self, v13, v14);
  objc_msgSend_setUserIndex_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_sourceNode(self, v21, v22);
  objc_msgSend_setSourceNode_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_credentials(self, v25, v26);
  objc_msgSend_setCredentials_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: lockOperationType:%@; operationSource:%@; userIndex:%@; fabricIndex:%@; sourceNode:%@; credentials:%@; >",
    v5,
    self->_lockOperationType,
    self->_operationSource,
    self->_userIndex,
    self->_fabricIndex,
    self->_sourceNode,
  v7 = self->_credentials);

  return v7;
}

- (NSNumber)lockOperationType
{
  return self->_lockOperationType;
}

- (void)setLockOperationType:(NSNumber *)lockOperationType
{
}

- (NSNumber)operationSource
{
  return self->_operationSource;
}

- (void)setOperationSource:(NSNumber *)operationSource
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (NSNumber)sourceNode
{
  return self->_sourceNode;
}

- (void)setSourceNode:(NSNumber *)sourceNode
{
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSArray *)credentials
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_operationSource, 0);

  objc_storeStrong((id *)&self->_lockOperationType, 0);
}

@end