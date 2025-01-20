@interface MTRDoorLockClusterCredentialStruct
- (MTRDoorLockClusterCredentialStruct)init;
- (NSNumber)credentialIndex;
- (NSNumber)credentialType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredentialIndex:(NSNumber *)credentialIndex;
- (void)setCredentialType:(NSNumber *)credentialType;
@end

@implementation MTRDoorLockClusterCredentialStruct

- (MTRDoorLockClusterCredentialStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRDoorLockClusterCredentialStruct;
  v2 = [(MTRDoorLockClusterCredentialStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    credentialType = v2->_credentialType;
    v2->_credentialType = (NSNumber *)&unk_26F9C8620;

    credentialIndex = v3->_credentialIndex;
    v3->_credentialIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterCredentialStruct);
  objc_super v7 = objc_msgSend_credentialType(self, v5, v6);
  objc_msgSend_setCredentialType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_credentialIndex(self, v9, v10);
  objc_msgSend_setCredentialIndex_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: credentialType:%@; credentialIndex:%@; >",
    v5,
    self->_credentialType,
  objc_super v7 = self->_credentialIndex);

  return v7;
}

- (NSNumber)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(NSNumber *)credentialType
{
}

- (NSNumber)credentialIndex
{
  return self->_credentialIndex;
}

- (void)setCredentialIndex:(NSNumber *)credentialIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialIndex, 0);

  objc_storeStrong((id *)&self->_credentialType, 0);
}

@end