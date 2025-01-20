@interface MTRDoorLockClusterSetUserParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterSetUserParams)init;
- (NSNumber)credentialRule;
- (NSNumber)operationType;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (NSNumber)userStatus;
- (NSNumber)userType;
- (NSNumber)userUniqueID;
- (NSString)userName;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCredentialRule:(NSNumber *)credentialRule;
- (void)setOperationType:(NSNumber *)operationType;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
- (void)setUserName:(NSString *)userName;
- (void)setUserStatus:(NSNumber *)userStatus;
- (void)setUserType:(NSNumber *)userType;
- (void)setUserUniqueID:(NSNumber *)userUniqueID;
@end

@implementation MTRDoorLockClusterSetUserParams

- (MTRDoorLockClusterSetUserParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTRDoorLockClusterSetUserParams;
  v2 = [(MTRDoorLockClusterSetUserParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    operationType = v2->_operationType;
    v2->_operationType = (NSNumber *)&unk_26F9C8548;

    userIndex = v3->_userIndex;
    v3->_userIndex = (NSNumber *)&unk_26F9C8548;

    userName = v3->_userName;
    v3->_userName = 0;

    userUniqueID = v3->_userUniqueID;
    v3->_userUniqueID = 0;

    userStatus = v3->_userStatus;
    v3->_userStatus = 0;

    userType = v3->_userType;
    v3->_userType = 0;

    credentialRule = v3->_credentialRule;
    v3->_credentialRule = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterSetUserParams);
  v7 = objc_msgSend_operationType(self, v5, v6);
  objc_msgSend_setOperationType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_userIndex(self, v9, v10);
  objc_msgSend_setUserIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_userName(self, v13, v14);
  objc_msgSend_setUserName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_userUniqueID(self, v17, v18);
  objc_msgSend_setUserUniqueID_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_userStatus(self, v21, v22);
  objc_msgSend_setUserStatus_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_userType(self, v25, v26);
  objc_msgSend_setUserType_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_credentialRule(self, v29, v30);
  objc_msgSend_setCredentialRule_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_timedInvokeTimeoutMs(self, v33, v34);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_serverSideProcessingTimeout(self, v37, v38);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: operationType:%@; userIndex:%@; userName:%@; userUniqueID:%@; userStatus:%@; userType:%@; credentialRule:%@; >",
    v5,
    self->_operationType,
    self->_userIndex,
    self->_userName,
    self->_userUniqueID,
    self->_userStatus,
    self->_userType,
  v7 = self->_credentialRule);

  return v7;
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(NSNumber *)operationType
{
}

- (NSNumber)userIndex
{
  return self->_userIndex;
}

- (void)setUserIndex:(NSNumber *)userIndex
{
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(NSString *)userName
{
}

- (NSNumber)userUniqueID
{
  return self->_userUniqueID;
}

- (void)setUserUniqueID:(NSNumber *)userUniqueID
{
}

- (NSNumber)userStatus
{
  return self->_userStatus;
}

- (void)setUserStatus:(NSNumber *)userStatus
{
}

- (NSNumber)userType
{
  return self->_userType;
}

- (void)setUserType:(NSNumber *)userType
{
}

- (NSNumber)credentialRule
{
  return self->_credentialRule;
}

- (void)setCredentialRule:(NSNumber *)credentialRule
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_credentialRule, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userUniqueID, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userIndex, 0);

  objc_storeStrong((id *)&self->_operationType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v59[0] = 0;
  __int16 v60 = 0;
  LOBYTE(v61) = 0;
  char v62 = 0;
  LOBYTE(v63) = 0;
  char v64 = 0;
  int v65 = 0;
  __int16 v66 = 0;
  v58[0] = 0;
  v58[1] = 0;
  v57 = v58;
  v7 = objc_msgSend_operationType(self, a3, (uint64_t)a4);
  v59[0] = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_userIndex(self, v10, v11);
  __int16 v60 = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_userName(self, v15, v16);

  if (v17)
  {
    long long v61 = 0uLL;
    char v62 = 1;
    objc_msgSend_userName(self, v18, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    uint64_t v23 = objc_msgSend_UTF8String(v20, v21, v22);
    uint64_t v25 = objc_msgSend_lengthOfBytesUsingEncoding_(v20, v24, 4);
    sub_24479476C(v51, v23, v25);

    long long v61 = *(_OWORD *)v51;
  }
  uint64_t v26 = objc_msgSend_userUniqueID(self, v18, v19);

  if (v26)
  {
    int v63 = 0;
    char v64 = 1;
    v29 = objc_msgSend_userUniqueID(self, v27, v28);
    int v63 = objc_msgSend_unsignedIntValue(v29, v30, v31);
  }
  v32 = objc_msgSend_userStatus(self, v27, v28);

  if (v32)
  {
    LOWORD(v65) = 256;
    v35 = objc_msgSend_userStatus(self, v33, v34);
    LOBYTE(v65) = objc_msgSend_unsignedCharValue(v35, v36, v37);
  }
  uint64_t v38 = objc_msgSend_userType(self, v33, v34);

  if (v38)
  {
    HIWORD(v65) = 256;
    v41 = objc_msgSend_userType(self, v39, v40);
    BYTE2(v65) = objc_msgSend_unsignedCharValue(v41, v42, v43);
  }
  v44 = objc_msgSend_credentialRule(self, v39, v40);

  if (v44)
  {
    __int16 v66 = 256;
    v47 = objc_msgSend_credentialRule(self, v45, v46);
    LOBYTE(v66) = objc_msgSend_unsignedCharValue(v47, v48, v49);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v56);
  if (v56)
  {
    sub_244CB62B8((uint64_t)v51);
    v53 = 0;
    v54 = 0;
    v52 = &unk_26F9536C8;
    char v55 = 0;
    sub_2447945A0((uint64_t)&v52, &v56, 0);
    sub_244CB6318((uint64_t)v51, (uint64_t)&v52, 0xFFFFFFFF, (uint64_t)v67);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244820E38(v59, v51, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v51, &v56, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v56);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v52 = &unk_26F9536C8;
    sub_244794634(&v54);
    sub_244794634(&v53);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 20341;
  }
  sub_244794634(&v56);
  return (ChipError *)sub_24479466C((uint64_t)&v57);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 20370;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end