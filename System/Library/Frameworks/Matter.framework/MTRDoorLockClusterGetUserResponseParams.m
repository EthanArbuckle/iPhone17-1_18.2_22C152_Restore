@interface MTRDoorLockClusterGetUserResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDoorLockClusterGetUserResponseParams)init;
- (MTRDoorLockClusterGetUserResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)credentials;
- (NSNumber)creatorFabricIndex;
- (NSNumber)credentialRule;
- (NSNumber)lastModifiedFabricIndex;
- (NSNumber)nextUserIndex;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userIndex;
- (NSNumber)userStatus;
- (NSNumber)userType;
- (NSNumber)userUniqueID;
- (NSString)userName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex;
- (void)setCredentialRule:(NSNumber *)credentialRule;
- (void)setCredentials:(NSArray *)credentials;
- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex;
- (void)setNextUserIndex:(NSNumber *)nextUserIndex;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUserIndex:(NSNumber *)userIndex;
- (void)setUserName:(NSString *)userName;
- (void)setUserStatus:(NSNumber *)userStatus;
- (void)setUserType:(NSNumber *)userType;
- (void)setUserUniqueID:(NSNumber *)userUniqueID;
@end

@implementation MTRDoorLockClusterGetUserResponseParams

- (MTRDoorLockClusterGetUserResponseParams)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRDoorLockClusterGetUserResponseParams;
  v2 = [(MTRDoorLockClusterGetUserResponseParams *)&v16 init];
  v3 = v2;
  if (v2)
  {
    userIndex = v2->_userIndex;
    v2->_userIndex = (NSNumber *)&unk_26F9C8548;

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

    credentials = v3->_credentials;
    v3->_credentials = 0;

    creatorFabricIndex = v3->_creatorFabricIndex;
    v3->_creatorFabricIndex = 0;

    lastModifiedFabricIndex = v3->_lastModifiedFabricIndex;
    v3->_lastModifiedFabricIndex = 0;

    nextUserIndex = v3->_nextUserIndex;
    v3->_nextUserIndex = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterGetUserResponseParams);
  v7 = objc_msgSend_userIndex(self, v5, v6);
  objc_msgSend_setUserIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_userName(self, v9, v10);
  objc_msgSend_setUserName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_userUniqueID(self, v13, v14);
  objc_msgSend_setUserUniqueID_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_userStatus(self, v17, v18);
  objc_msgSend_setUserStatus_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_userType(self, v21, v22);
  objc_msgSend_setUserType_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_credentialRule(self, v25, v26);
  objc_msgSend_setCredentialRule_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_credentials(self, v29, v30);
  objc_msgSend_setCredentials_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_creatorFabricIndex(self, v33, v34);
  objc_msgSend_setCreatorFabricIndex_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_lastModifiedFabricIndex(self, v37, v38);
  objc_msgSend_setLastModifiedFabricIndex_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_nextUserIndex(self, v41, v42);
  objc_msgSend_setNextUserIndex_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_timedInvokeTimeoutMs(self, v45, v46);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v48, (uint64_t)v47);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: userIndex:%@; userName:%@; userUniqueID:%@; userStatus:%@; userType:%@; credentialRule:%@; credentials:%@; creatorFabricIndex:%@; lastModifiedFabricIndex:%@; nextUserIndex:%@; >",
    v5,
    self->_userIndex,
    self->_userName,
    self->_userUniqueID,
    self->_userStatus,
    self->_userType,
    self->_credentialRule,
    self->_credentials,
    self->_creatorFabricIndex,
    self->_lastModifiedFabricIndex,
  v7 = self->_nextUserIndex);

  return v7;
}

- (MTRDoorLockClusterGetUserResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDoorLockClusterGetUserResponseParams;
  v8 = [(MTRDoorLockClusterGetUserResponseParams *)&v38 init];
  if (!v8)
  {
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 257, 28, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOWORD(buf) = 0;
      BYTE8(buf) = 0;
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      char v48 = 0;
      char v49 = 0;
      char v52 = 0;
      int v46 = 0;
      __int16 v47 = 0;
      int v50 = 0;
      char v51 = 0;
      sub_2448215F8((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          uint64_t v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    uint64_t v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
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

- (NSArray)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSArray *)credentials
{
}

- (NSNumber)creatorFabricIndex
{
  return self->_creatorFabricIndex;
}

- (void)setCreatorFabricIndex:(NSNumber *)creatorFabricIndex
{
}

- (NSNumber)lastModifiedFabricIndex
{
  return self->_lastModifiedFabricIndex;
}

- (void)setLastModifiedFabricIndex:(NSNumber *)lastModifiedFabricIndex
{
}

- (NSNumber)nextUserIndex
{
  return self->_nextUserIndex;
}

- (void)setNextUserIndex:(NSNumber *)nextUserIndex
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_nextUserIndex, 0);
  objc_storeStrong((id *)&self->_lastModifiedFabricIndex, 0);
  objc_storeStrong((id *)&self->_creatorFabricIndex, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_credentialRule, 0);
  objc_storeStrong((id *)&self->_userType, 0);
  objc_storeStrong((id *)&self->_userStatus, 0);
  objc_storeStrong((id *)&self->_userUniqueID, 0);
  objc_storeStrong((id *)&self->_userName, 0);

  objc_storeStrong((id *)&self->_userIndex, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedShort_(NSNumber, a3, *(unsigned __int16 *)a4);
  objc_msgSend_setUserIndex_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 24))
  {
    uint64_t v10 = *((void *)a4 + 1);
    uint64_t v11 = *((void *)a4 + 2);
    id v12 = [NSString alloc];
    uint64_t v14 = objc_msgSend_initWithBytes_length_encoding_(v12, v13, v10, v11, 4);
    objc_msgSend_setUserName_(self, v15, (uint64_t)v14);

    uint64_t v18 = objc_msgSend_userName(self, v16, v17);

    if (!v18)
    {
      *(_OWORD *)&retstr->mError = xmmword_2651941B8;
      *(void *)&retstr->mLine = 20577;
      return result;
    }
  }
  else
  {
    objc_msgSend_setUserName_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 36))
  {
    id v21 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v20, *((unsigned int *)a4 + 8));
    objc_msgSend_setUserUniqueID_(self, v22, (uint64_t)v21);
  }
  else
  {
    objc_msgSend_setUserUniqueID_(self, v20, 0);
  }
  if (*((unsigned char *)a4 + 41))
  {
    v24 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v23, *((unsigned __int8 *)a4 + 40));
    objc_msgSend_setUserStatus_(self, v25, (uint64_t)v24);
  }
  else
  {
    objc_msgSend_setUserStatus_(self, v23, 0);
  }
  if (*((unsigned char *)a4 + 43))
  {
    v27 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v26, *((unsigned __int8 *)a4 + 42));
    objc_msgSend_setUserType_(self, v28, (uint64_t)v27);
  }
  else
  {
    objc_msgSend_setUserType_(self, v26, 0);
  }
  if (*((unsigned char *)a4 + 45))
  {
    uint64_t v30 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v29, *((unsigned __int8 *)a4 + 44));
    objc_msgSend_setCredentialRule_(self, v31, (uint64_t)v30);
  }
  else
  {
    objc_msgSend_setCredentialRule_(self, v29, 0);
  }
  if (*((unsigned char *)a4 + 128))
  {
    uint64_t v33 = objc_opt_new();
    if (!*((unsigned char *)a4 + 128)) {
      sub_24479484C();
    }
    v55[0] = *((unsigned char *)a4 + 120);
    if (v55[0]) {
      v55[1] = *((unsigned char *)a4 + 121);
    }
    sub_2447967D8((uint64_t)&v52, (uint64_t)a4 + 48, v55);
    while (sub_244796850(&v52))
    {
      uint64_t v35 = objc_opt_new();
      v37 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v36, v52);
      objc_msgSend_setCredentialType_(v35, v38, (uint64_t)v37);

      v40 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v39, HIWORD(v52));
      objc_msgSend_setCredentialIndex_(v35, v41, (uint64_t)v40);

      objc_msgSend_addObject_(v33, v42, (uint64_t)v35);
    }
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    if (v53 == 33)
    {
      retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
      retstr->mLine = 147;
    }
    else
    {
      *(_OWORD *)&retstr->mError = v53;
      *(void *)&retstr->mLine = v54;
      if (retstr->mError)
      {

        return result;
      }
    }
    objc_msgSend_setCredentials_(self, v34, (uint64_t)v33);
  }
  else
  {
    objc_msgSend_setCredentials_(self, v32, 0);
  }
  if (*((unsigned char *)a4 + 137))
  {
    char v44 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v43, *((unsigned __int8 *)a4 + 136));
    objc_msgSend_setCreatorFabricIndex_(self, v45, (uint64_t)v44);
  }
  else
  {
    objc_msgSend_setCreatorFabricIndex_(self, v43, 0);
  }
  if (*((unsigned char *)a4 + 139))
  {
    __int16 v47 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v46, *((unsigned __int8 *)a4 + 138));
    objc_msgSend_setLastModifiedFabricIndex_(self, v48, (uint64_t)v47);
  }
  else
  {
    objc_msgSend_setLastModifiedFabricIndex_(self, v46, 0);
  }
  if (*((unsigned char *)a4 + 142))
  {
    int v50 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v49, *((unsigned __int16 *)a4 + 70));
    objc_msgSend_setNextUserIndex_(self, v51, (uint64_t)v50);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setNextUserIndex_(self, v49, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 20654;
  return result;
}

@end