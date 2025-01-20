@interface MTRThermostatClusterAtomicResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRThermostatClusterAtomicResponseParams)init;
- (MTRThermostatClusterAtomicResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSArray)attributeStatus;
- (NSNumber)statusCode;
- (NSNumber)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAttributeStatus:(id)a3;
- (void)setStatusCode:(id)a3;
- (void)setTimeout:(id)a3;
@end

@implementation MTRThermostatClusterAtomicResponseParams

- (MTRThermostatClusterAtomicResponseParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRThermostatClusterAtomicResponseParams;
  v2 = [(MTRThermostatClusterAtomicResponseParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    statusCode = v2->_statusCode;
    v2->_statusCode = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    attributeStatus = v3->_attributeStatus;
    v3->_attributeStatus = (NSArray *)v7;

    timeout = v3->_timeout;
    v3->_timeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThermostatClusterAtomicResponseParams);
  uint64_t v7 = objc_msgSend_statusCode(self, v5, v6);
  objc_msgSend_setStatusCode_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_attributeStatus(self, v9, v10);
  objc_msgSend_setAttributeStatus_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timeout(self, v13, v14);
  objc_msgSend_setTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: statusCode:%@; attributeStatus:%@; timeout:%@; >",
    v5,
    self->_statusCode,
    self->_attributeStatus,
  uint64_t v7 = self->_timeout);

  return v7;
}

- (MTRThermostatClusterAtomicResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTRThermostatClusterAtomicResponseParams;
  v8 = [(MTRThermostatClusterAtomicResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 513, 253, a4);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      LOBYTE(buf) = 0;
      sub_244CB3988((uint64_t)&buf + 8);
      char v44 = 0;
      sub_244CB39B8(v9, 0, 0);
      char v45 = 0;
      sub_244828EDC((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
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
    if (a4)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(id)a3
{
}

- (NSArray)attributeStatus
{
  return self->_attributeStatus;
}

- (void)setAttributeStatus:(id)a3
{
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_attributeStatus, 0);

  objc_storeStrong((id *)&self->_statusCode, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setStatusCode_(self, v8, (uint64_t)v7);

  uint64_t v9 = objc_opt_new();
  v32[0] = *((unsigned char *)a4 + 80);
  if (v32[0]) {
    v32[1] = *((unsigned char *)a4 + 81);
  }
  sub_244796C7C((uint64_t)&v28, (uint64_t)a4 + 8, v32);
  while (sub_244796CF4((uint64_t)&v28))
  {
    objc_super v11 = objc_opt_new();
    v13 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v12, v28);
    objc_msgSend_setAttributeID_(v11, v14, (uint64_t)v13);

    id v16 = objc_msgSend_numberWithUnsignedChar_(NSNumber, v15, v29);
    objc_msgSend_setStatusCode_(v11, v17, (uint64_t)v16);

    objc_msgSend_addObject_(v9, v18, (uint64_t)v11);
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v30 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v30;
    *(void *)&retstr->mLine = v31;
    if (retstr->mError)
    {

      return result;
    }
  }
  objc_msgSend_setAttributeStatus_(self, v10, (uint64_t)v9);

  int v22 = *((unsigned __int8 *)a4 + 88);
  uint64_t v21 = (char *)a4 + 88;
  if (v22)
  {
    v23 = NSNumber;
    uint64_t v24 = sub_2446D1880(v21);
    v26 = objc_msgSend_numberWithUnsignedShort_(v23, v25, *(unsigned __int16 *)v24);
    objc_msgSend_setTimeout_(self, v27, (uint64_t)v26);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setTimeout_(self, v20, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 23189;
  return result;
}

@end