@interface MTRGroupKeyManagementClusterGroupKeySetStruct
- (MTRGroupKeyManagementClusterGroupKeySetStruct)init;
- (NSData)epochKey0;
- (NSData)epochKey1;
- (NSData)epochKey2;
- (NSNumber)epochStartTime0;
- (NSNumber)epochStartTime1;
- (NSNumber)epochStartTime2;
- (NSNumber)groupKeySecurityPolicy;
- (NSNumber)groupKeySetID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEpochKey0:(NSData *)epochKey0;
- (void)setEpochKey1:(NSData *)epochKey1;
- (void)setEpochKey2:(NSData *)epochKey2;
- (void)setEpochStartTime0:(NSNumber *)epochStartTime0;
- (void)setEpochStartTime1:(NSNumber *)epochStartTime1;
- (void)setEpochStartTime2:(NSNumber *)epochStartTime2;
- (void)setGroupKeySecurityPolicy:(NSNumber *)groupKeySecurityPolicy;
- (void)setGroupKeySetID:(NSNumber *)groupKeySetID;
@end

@implementation MTRGroupKeyManagementClusterGroupKeySetStruct

- (MTRGroupKeyManagementClusterGroupKeySetStruct)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRGroupKeyManagementClusterGroupKeySetStruct;
  v2 = [(MTRGroupKeyManagementClusterGroupKeySetStruct *)&v13 init];
  v3 = v2;
  if (v2)
  {
    groupKeySetID = v2->_groupKeySetID;
    v2->_groupKeySetID = (NSNumber *)&unk_26F9C8620;

    groupKeySecurityPolicy = v3->_groupKeySecurityPolicy;
    v3->_groupKeySecurityPolicy = (NSNumber *)&unk_26F9C8620;

    epochKey0 = v3->_epochKey0;
    v3->_epochKey0 = 0;

    epochStartTime0 = v3->_epochStartTime0;
    v3->_epochStartTime0 = 0;

    epochKey1 = v3->_epochKey1;
    v3->_epochKey1 = 0;

    epochStartTime1 = v3->_epochStartTime1;
    v3->_epochStartTime1 = 0;

    epochKey2 = v3->_epochKey2;
    v3->_epochKey2 = 0;

    epochStartTime2 = v3->_epochStartTime2;
    v3->_epochStartTime2 = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterGroupKeySetStruct);
  v7 = objc_msgSend_groupKeySetID(self, v5, v6);
  objc_msgSend_setGroupKeySetID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_groupKeySecurityPolicy(self, v9, v10);
  objc_msgSend_setGroupKeySecurityPolicy_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_epochKey0(self, v13, v14);
  objc_msgSend_setEpochKey0_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_epochStartTime0(self, v17, v18);
  objc_msgSend_setEpochStartTime0_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_epochKey1(self, v21, v22);
  objc_msgSend_setEpochKey1_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_epochStartTime1(self, v25, v26);
  objc_msgSend_setEpochStartTime1_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_epochKey2(self, v29, v30);
  objc_msgSend_setEpochKey2_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_epochStartTime2(self, v33, v34);
  objc_msgSend_setEpochStartTime2_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  groupKeySetID = self->_groupKeySetID;
  groupKeySecurityPolicy = self->_groupKeySecurityPolicy;
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey0, v8, 0);
  epochStartTime0 = self->_epochStartTime0;
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey1, v11, 0);
  epochStartTime1 = self->_epochStartTime1;
  v15 = objc_msgSend_base64EncodedStringWithOptions_(self->_epochKey2, v14, 0);
  objc_msgSend_stringWithFormat_(v3, v16, @"<%@: groupKeySetID:%@; groupKeySecurityPolicy:%@; epochKey0:%@; epochStartTime0:%@; epochKey1:%@; epochStartTime1:%@; epochKey2:%@; epochStartTime2:%@; >",
    v5,
    groupKeySetID,
    groupKeySecurityPolicy,
    v9,
    epochStartTime0,
    v12,
    epochStartTime1,
    v15,
  v17 = self->_epochStartTime2);

  return v17;
}

- (NSNumber)groupKeySetID
{
  return self->_groupKeySetID;
}

- (void)setGroupKeySetID:(NSNumber *)groupKeySetID
{
}

- (NSNumber)groupKeySecurityPolicy
{
  return self->_groupKeySecurityPolicy;
}

- (void)setGroupKeySecurityPolicy:(NSNumber *)groupKeySecurityPolicy
{
}

- (NSData)epochKey0
{
  return self->_epochKey0;
}

- (void)setEpochKey0:(NSData *)epochKey0
{
}

- (NSNumber)epochStartTime0
{
  return self->_epochStartTime0;
}

- (void)setEpochStartTime0:(NSNumber *)epochStartTime0
{
}

- (NSData)epochKey1
{
  return self->_epochKey1;
}

- (void)setEpochKey1:(NSData *)epochKey1
{
}

- (NSNumber)epochStartTime1
{
  return self->_epochStartTime1;
}

- (void)setEpochStartTime1:(NSNumber *)epochStartTime1
{
}

- (NSData)epochKey2
{
  return self->_epochKey2;
}

- (void)setEpochKey2:(NSData *)epochKey2
{
}

- (NSNumber)epochStartTime2
{
  return self->_epochStartTime2;
}

- (void)setEpochStartTime2:(NSNumber *)epochStartTime2
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_epochStartTime2, 0);
  objc_storeStrong((id *)&self->_epochKey2, 0);
  objc_storeStrong((id *)&self->_epochStartTime1, 0);
  objc_storeStrong((id *)&self->_epochKey1, 0);
  objc_storeStrong((id *)&self->_epochStartTime0, 0);
  objc_storeStrong((id *)&self->_epochKey0, 0);
  objc_storeStrong((id *)&self->_groupKeySecurityPolicy, 0);

  objc_storeStrong((id *)&self->_groupKeySetID, 0);
}

@end