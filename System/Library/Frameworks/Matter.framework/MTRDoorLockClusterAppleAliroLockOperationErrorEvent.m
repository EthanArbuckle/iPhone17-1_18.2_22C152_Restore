@interface MTRDoorLockClusterAppleAliroLockOperationErrorEvent
- (MTRDoorLockClusterAppleAliroLockOperationErrorEvent)init;
- (NSArray)credentials;
- (NSNumber)fabricIndex;
- (NSNumber)lockOperationType;
- (NSNumber)operationError;
- (NSNumber)userIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredentials:(id)a3;
- (void)setFabricIndex:(id)a3;
- (void)setLockOperationType:(id)a3;
- (void)setOperationError:(id)a3;
- (void)setUserIndex:(id)a3;
@end

@implementation MTRDoorLockClusterAppleAliroLockOperationErrorEvent

- (MTRDoorLockClusterAppleAliroLockOperationErrorEvent)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRDoorLockClusterAppleAliroLockOperationErrorEvent;
  v2 = [(MTRDoorLockClusterAppleAliroLockOperationErrorEvent *)&v10 init];
  v3 = v2;
  if (v2)
  {
    lockOperationType = v2->_lockOperationType;
    v2->_lockOperationType = (NSNumber *)&unk_26F9C8620;

    operationError = v3->_operationError;
    v3->_operationError = (NSNumber *)&unk_26F9C8620;

    userIndex = v3->_userIndex;
    v3->_userIndex = 0;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    credentials = v3->_credentials;
    v3->_credentials = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterAppleAliroLockOperationErrorEvent);
  v7 = objc_msgSend_lockOperationType(self, v5, v6);
  objc_msgSend_setLockOperationType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_operationError(self, v9, v10);
  objc_msgSend_setOperationError_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_userIndex(self, v13, v14);
  objc_msgSend_setUserIndex_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_fabricIndex(self, v17, v18);
  objc_msgSend_setFabricIndex_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_credentials(self, v21, v22);
  objc_msgSend_setCredentials_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: lockOperationType:%@; operationError:%@; userIndex:%@; fabricIndex:%@; credentials:%@; >",
    v5,
    self->_lockOperationType,
    self->_operationError,
    self->_userIndex,
    self->_fabricIndex,
  v7 = self->_credentials);

  return v7;
}

- (NSNumber)lockOperationType
{
  return self->_lockOperationType;
}

- (void)setLockOperationType:(id)a3
{
}

- (NSNumber)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(id)a3
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
}

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);
  objc_storeStrong((id *)&self->_operationError, 0);

  objc_storeStrong((id *)&self->_lockOperationType, 0);
}

@end