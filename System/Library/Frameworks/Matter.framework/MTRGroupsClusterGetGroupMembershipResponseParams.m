@interface MTRGroupsClusterGetGroupMembershipResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRGroupsClusterGetGroupMembershipResponseParams)init;
- (MTRGroupsClusterGetGroupMembershipResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)groupList;
- (NSNumber)capacity;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCapacity:(NSNumber *)capacity;
- (void)setGroupList:(NSArray *)groupList;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRGroupsClusterGetGroupMembershipResponseParams

- (MTRGroupsClusterGetGroupMembershipResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRGroupsClusterGetGroupMembershipResponseParams;
  v2 = [(MTRGroupsClusterGetGroupMembershipResponseParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    capacity = v2->_capacity;
    v2->_capacity = 0;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    groupList = v3->_groupList;
    v3->_groupList = (NSArray *)v7;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupsClusterGetGroupMembershipResponseParams);
  uint64_t v7 = objc_msgSend_capacity(self, v5, v6);
  objc_msgSend_setCapacity_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_groupList(self, v9, v10);
  objc_msgSend_setGroupList_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: capacity:%@; groupList:%@; >",
    v5,
    self->_capacity,
  uint64_t v7 = self->_groupList);

  return v7;
}

- (MTRGroupsClusterGetGroupMembershipResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRGroupsClusterGetGroupMembershipResponseParams;
  v8 = [(MTRGroupsClusterGetGroupMembershipResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4, 2, error);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      LOWORD(buf) = 0;
      sub_244CB3988((uint64_t)&buf + 8);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_2447F14AC((unsigned __int8 *)&buf, (uint64_t)v37, (uint64_t)&v33);
      long long v35 = v33;
      uint64_t v36 = v34;
      if (!v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        long long v35 = v33;
        uint64_t v36 = v34;
        if (!v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    objc_super v11 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
    v12 = sub_244CB7B34((const char **)&buf, 1);
    uint64_t v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      uint64_t v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v22 = v14;
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_244CC4DE0(0, 1);
    }
    if (error)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (NSNumber)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(NSNumber *)capacity
{
}

- (NSArray)groupList
{
  return self->_groupList;
}

- (void)setGroupList:(NSArray *)groupList
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
  objc_storeStrong((id *)&self->_groupList, 0);

  objc_storeStrong((id *)&self->_capacity, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  if (*((unsigned char *)a4 + 1))
  {
    uint64_t v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
    objc_msgSend_setCapacity_(self, v8, (uint64_t)v7);
  }
  else
  {
    objc_msgSend_setCapacity_(self, a3, 0);
  }
  uint64_t v9 = objc_opt_new();
  v17[0] = *((unsigned char *)a4 + 80);
  if (v17[0]) {
    v17[1] = *((unsigned char *)a4 + 81);
  }
  sub_2446D1930((uint64_t)&v14, (uint64_t)a4 + 8, v17);
  while (sub_244794970((uint64_t)&v14))
  {
    objc_super v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v14);
    objc_msgSend_addObject_(v9, v12, (uint64_t)v11);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v15 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v15;
    *(void *)&retstr->mLine = v16;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setGroupList_(self, v10, (uint64_t)v9);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 1232;
  return result;
}

@end