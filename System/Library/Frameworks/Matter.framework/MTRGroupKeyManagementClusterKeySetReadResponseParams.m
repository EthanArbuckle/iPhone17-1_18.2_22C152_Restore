@interface MTRGroupKeyManagementClusterKeySetReadResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRGroupKeyManagementClusterGroupKeySetStruct)groupKeySet;
- (MTRGroupKeyManagementClusterKeySetReadResponseParams)init;
- (MTRGroupKeyManagementClusterKeySetReadResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGroupKeySet:(MTRGroupKeyManagementClusterGroupKeySetStruct *)groupKeySet;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRGroupKeyManagementClusterKeySetReadResponseParams

- (MTRGroupKeyManagementClusterKeySetReadResponseParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadResponseParams;
  v2 = [(MTRGroupKeyManagementClusterKeySetReadResponseParams *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    groupKeySet = v2->_groupKeySet;
    v2->_groupKeySet = (MTRGroupKeyManagementClusterGroupKeySetStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterKeySetReadResponseParams);
  objc_super v7 = objc_msgSend_groupKeySet(self, v5, v6);
  objc_msgSend_setGroupKeySet_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupKeySet:%@ >", v5, self->_groupKeySet);;

  return v7;
}

- (MTRGroupKeyManagementClusterKeySetReadResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRGroupKeyManagementClusterKeySetReadResponseParams;
  v8 = [(MTRGroupKeyManagementClusterKeySetReadResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 63, 2, error);
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
      BYTE2(buf) = 0;
      BYTE8(buf) = 0;
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      char v46 = 0;
      char v47 = 0;
      char v48 = 0;
      char v49 = 0;
      char v50 = 0;
      char v51 = 0;
      char v52 = 0;
      char v53 = 0;
      sub_24480A750((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v34;
    uint64_t v42 = v35;
    v11 = sub_244CB7B34((const char **)&buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    v14 = sub_244CC8484(0, "NotSpecified");
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
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (MTRGroupKeyManagementClusterGroupKeySetStruct)groupKeySet
{
  return self->_groupKeySet;
}

- (void)setGroupKeySet:(MTRGroupKeyManagementClusterGroupKeySetStruct *)groupKeySet
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

  objc_storeStrong((id *)&self->_groupKeySet, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  objc_super v7 = objc_opt_new();
  objc_msgSend_setGroupKeySet_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v9, *(unsigned __int16 *)a4);
  v13 = objc_msgSend_groupKeySet(self, v11, v12);
  objc_msgSend_setGroupKeySetID_(v13, v14, (uint64_t)v10);

  v16 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v15, *((unsigned __int8 *)a4 + 2));
  v19 = objc_msgSend_groupKeySet(self, v17, v18);
  objc_msgSend_setGroupKeySecurityPolicy_(v19, v20, (uint64_t)v16);

  if (*((unsigned char *)a4 + 24))
  {
    uint64_t v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v21, *((void *)a4 + 1), *((void *)a4 + 2));
    v26 = objc_msgSend_groupKeySet(self, v24, v25);
    objc_msgSend_setEpochKey0_(v26, v27, (uint64_t)v23);
  }
  else
  {
    uint64_t v23 = objc_msgSend_groupKeySet(self, v21, v22);
    objc_msgSend_setEpochKey0_(v23, v28, 0);
  }

  if (*((unsigned char *)a4 + 40))
  {
    v31 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v29, *((void *)a4 + 4));
    long long v34 = objc_msgSend_groupKeySet(self, v32, v33);
    objc_msgSend_setEpochStartTime0_(v34, v35, (uint64_t)v31);
  }
  else
  {
    v31 = objc_msgSend_groupKeySet(self, v29, v30);
    objc_msgSend_setEpochStartTime0_(v31, v36, 0);
  }

  if (*((unsigned char *)a4 + 64))
  {
    uint64_t v39 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v37, *((void *)a4 + 6), *((void *)a4 + 7));
    uint64_t v42 = objc_msgSend_groupKeySet(self, v40, v41);
    objc_msgSend_setEpochKey1_(v42, v43, (uint64_t)v39);
  }
  else
  {
    uint64_t v39 = objc_msgSend_groupKeySet(self, v37, v38);
    objc_msgSend_setEpochKey1_(v39, v44, 0);
  }

  if (*((unsigned char *)a4 + 80))
  {
    char v47 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v45, *((void *)a4 + 9));
    char v50 = objc_msgSend_groupKeySet(self, v48, v49);
    objc_msgSend_setEpochStartTime1_(v50, v51, (uint64_t)v47);
  }
  else
  {
    char v47 = objc_msgSend_groupKeySet(self, v45, v46);
    objc_msgSend_setEpochStartTime1_(v47, v52, 0);
  }

  if (*((unsigned char *)a4 + 104))
  {
    v55 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v53, *((void *)a4 + 11), *((void *)a4 + 12));
    v58 = objc_msgSend_groupKeySet(self, v56, v57);
    objc_msgSend_setEpochKey2_(v58, v59, (uint64_t)v55);
  }
  else
  {
    v55 = objc_msgSend_groupKeySet(self, v53, v54);
    objc_msgSend_setEpochKey2_(v55, v60, 0);
  }

  if (*((unsigned char *)a4 + 120))
  {
    v63 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v61, *((void *)a4 + 14));
    v66 = objc_msgSend_groupKeySet(self, v64, v65);
    objc_msgSend_setEpochStartTime2_(v66, v67, (uint64_t)v63);
  }
  else
  {
    v63 = objc_msgSend_groupKeySet(self, v61, v62);
    objc_msgSend_setEpochStartTime2_(v63, v68, 0);
  }

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 10156;
  return result;
}

@end