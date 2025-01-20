@interface MTRScenesManagementClusterRemoveAllScenesResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRScenesManagementClusterRemoveAllScenesResponseParams)init;
- (MTRScenesManagementClusterRemoveAllScenesResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSNumber)groupID;
- (NSNumber)status;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGroupID:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation MTRScenesManagementClusterRemoveAllScenesResponseParams

- (MTRScenesManagementClusterRemoveAllScenesResponseParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRScenesManagementClusterRemoveAllScenesResponseParams;
  v2 = [(MTRScenesManagementClusterRemoveAllScenesResponseParams *)&v7 init];
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_26F9C8548;

    groupID = v3->_groupID;
    v3->_groupID = (NSNumber *)&unk_26F9C8548;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRScenesManagementClusterRemoveAllScenesResponseParams);
  objc_super v7 = objc_msgSend_status(self, v5, v6);
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_groupID(self, v9, v10);
  objc_msgSend_setGroupID_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: status:%@; groupID:%@; >",
    v5,
    self->_status,
  objc_super v7 = self->_groupID);

  return v7;
}

- (MTRScenesManagementClusterRemoveAllScenesResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)MTRScenesManagementClusterRemoveAllScenesResponseParams;
  v8 = [(MTRScenesManagementClusterRemoveAllScenesResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 98, 3, a4);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      v32[0] = 0;
      __int16 v33 = 0;
      sub_244811EB4((uint64_t)v32, (uint64_t)v36, (uint64_t)&buf);
      long long v34 = buf;
      uint64_t v35 = v42;
      if (!buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)v32);
        long long v34 = buf;
        uint64_t v35 = v42;
        if (!buf)
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
    if (a4)
    {
      uint64_t v39 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v37);
LABEL_16:

  return v30;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  objc_super v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, a4->var0);
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v9, *(unsigned __int16 *)&a4[2].var0);
  objc_msgSend_setGroupID_(self, v11, (uint64_t)v10);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 14761;
  return result;
}

@end