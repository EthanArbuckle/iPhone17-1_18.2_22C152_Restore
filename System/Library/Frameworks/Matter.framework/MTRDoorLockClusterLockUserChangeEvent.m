@interface MTRDoorLockClusterLockUserChangeEvent
- (MTRDoorLockClusterLockUserChangeEvent)init;
- (NSNumber)dataIndex;
- (NSNumber)dataOperationType;
- (NSNumber)fabricIndex;
- (NSNumber)lockDataType;
- (NSNumber)operationSource;
- (NSNumber)sourceNode;
- (NSNumber)userIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDataIndex:(NSNumber *)dataIndex;
- (void)setDataOperationType:(NSNumber *)dataOperationType;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setLockDataType:(NSNumber *)lockDataType;
- (void)setOperationSource:(NSNumber *)operationSource;
- (void)setSourceNode:(NSNumber *)sourceNode;
- (void)setUserIndex:(NSNumber *)userIndex;
@end

@implementation MTRDoorLockClusterLockUserChangeEvent

- (MTRDoorLockClusterLockUserChangeEvent)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRDoorLockClusterLockUserChangeEvent;
  v2 = [(MTRDoorLockClusterLockUserChangeEvent *)&v12 init];
  v3 = v2;
  if (v2)
  {
    lockDataType = v2->_lockDataType;
    v2->_lockDataType = (NSNumber *)&unk_26F9C8620;

    dataOperationType = v3->_dataOperationType;
    v3->_dataOperationType = (NSNumber *)&unk_26F9C8620;

    operationSource = v3->_operationSource;
    v3->_operationSource = (NSNumber *)&unk_26F9C8620;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    sourceNode = v3->_sourceNode;
    v3->_sourceNode = 0;

    dataIndex = v3->_dataIndex;
    v3->_dataIndex = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterLockUserChangeEvent);
  v7 = objc_msgSend_lockDataType(self, v5, v6);
  objc_msgSend_setLockDataType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_dataOperationType(self, v9, v10);
  objc_msgSend_setDataOperationType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_operationSource(self, v13, v14);
  objc_msgSend_setOperationSource_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_userIndex(self, v17, v18);
  objc_msgSend_setUserIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_fabricIndex(self, v21, v22);
  objc_msgSend_setFabricIndex_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_sourceNode(self, v25, v26);
  objc_msgSend_setSourceNode_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_dataIndex(self, v29, v30);
  objc_msgSend_setDataIndex_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: lockDataType:%@; dataOperationType:%@; operationSource:%@; userIndex:%@; fabricIndex:%@; sourceNode:%@; dataIndex:%@; >",
    v5,
    self->_lockDataType,
    self->_dataOperationType,
    self->_operationSource,
    self->_userIndex,
    self->_fabricIndex,
    self->_sourceNode,
  v7 = self->_dataIndex);

  return v7;
}

- (NSNumber)lockDataType
{
  return self->_lockDataType;
}

- (void)setLockDataType:(NSNumber *)lockDataType
{
}

- (NSNumber)dataOperationType
{
  return self->_dataOperationType;
}

- (void)setDataOperationType:(NSNumber *)dataOperationType
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

- (NSNumber)dataIndex
{
  return self->_dataIndex;
}

- (void)setDataIndex:(NSNumber *)dataIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataIndex, 0);
  objc_storeStrong((id *)&self->_sourceNode, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_operationSource, 0);
  objc_storeStrong((id *)&self->_dataOperationType, 0);

  objc_storeStrong((id *)&self->_lockDataType, 0);
}

@end