@interface MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams)init;
- (MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSArray)groupKeySetIDs;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGroupKeySetIDs:(NSArray *)groupKeySetIDs;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams

- (MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams;
  v4 = [(MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF8C0], v2, v3);
    groupKeySetIDs = v4->_groupKeySetIDs;
    v4->_groupKeySetIDs = (NSArray *)v5;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams);
  v7 = objc_msgSend_groupKeySetIDs(self, v5, v6);
  objc_msgSend_setGroupKeySetIDs_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupKeySetIDs:%@ >", v5, self->_groupKeySetIDs);;

  return v7;
}

- (MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams;
  v8 = [(MTRGroupKeyManagementClusterKeySetReadAllIndicesResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 63, 5, error);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      sub_244CB3988((uint64_t)&buf);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_24480A900((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
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
    v11 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
    v12 = sub_244CB7B34((const char **)&buf, 1);
    v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
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

- (NSArray)groupKeySetIDs
{
  return self->_groupKeySetIDs;
}

- (void)setGroupKeySetIDs:(NSArray *)groupKeySetIDs
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

  objc_storeStrong((id *)&self->_groupKeySetIDs, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_opt_new();
  v15[0] = *((unsigned char *)a4 + 72);
  if (v15[0]) {
    v15[1] = *((unsigned char *)a4 + 73);
  }
  sub_2446D1930((uint64_t)&v12, (uint64_t)a4, v15);
  while (sub_244794970((uint64_t)&v12))
  {
    uint64_t v9 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v8, v12);
    objc_msgSend_addObject_(v7, v10, (uint64_t)v9);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v13 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v13;
    *(void *)&retstr->mLine = v14;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setGroupKeySetIDs_(self, v8, (uint64_t)v7);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 10403;
  return result;
}

@end