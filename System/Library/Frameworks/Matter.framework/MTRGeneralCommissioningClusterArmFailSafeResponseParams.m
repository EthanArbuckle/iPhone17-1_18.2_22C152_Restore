@interface MTRGeneralCommissioningClusterArmFailSafeResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRGeneralCommissioningClusterArmFailSafeResponseParams)init;
- (MTRGeneralCommissioningClusterArmFailSafeResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)errorCode;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)debugText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDebugText:(NSString *)debugText;
- (void)setErrorCode:(NSNumber *)errorCode;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRGeneralCommissioningClusterArmFailSafeResponseParams

- (MTRGeneralCommissioningClusterArmFailSafeResponseParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRGeneralCommissioningClusterArmFailSafeResponseParams;
  v2 = [(MTRGeneralCommissioningClusterArmFailSafeResponseParams *)&v8 init];
  v3 = v2;
  if (v2)
  {
    errorCode = v2->_errorCode;
    v2->_errorCode = (NSNumber *)&unk_26F9C8548;

    debugText = v3->_debugText;
    v3->_debugText = (NSString *)&stru_26F969DC8;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralCommissioningClusterArmFailSafeResponseParams);
  v7 = objc_msgSend_errorCode(self, v5, v6);
  objc_msgSend_setErrorCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_debugText(self, v9, v10);
  objc_msgSend_setDebugText_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: errorCode:%@; debugText:%@; >",
    v5,
    self->_errorCode,
  v7 = self->_debugText);

  return v7;
}

- (MTRGeneralCommissioningClusterArmFailSafeResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRGeneralCommissioningClusterArmFailSafeResponseParams;
  objc_super v8 = [(MTRGeneralCommissioningClusterArmFailSafeResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 48, 1, error);
  if (v37)
  {
    sub_244CB3988((uint64_t)v36);
    sub_244CB39B8((uint64_t)v36, *((void *)v37 + 1), *((void *)v37 + 3));
    long long v34 = 0uLL;
    uint64_t v35 = 0;
    sub_244CB54B4((uint64_t)v36, 256, &v34);
    if (!v34)
    {
      LOBYTE(buf) = 0;
      *((void *)&buf + 1) = 0;
      uint64_t v42 = 0;
      sub_2447FCCC8((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(NSNumber *)errorCode
{
}

- (NSString)debugText
{
  return self->_debugText;
}

- (void)setDebugText:(NSString *)debugText
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
  objc_storeStrong((id *)&self->_debugText, 0);

  objc_storeStrong((id *)&self->_errorCode, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setErrorCode_(self, v8, (uint64_t)v7);

  uint64_t v9 = *((void *)a4 + 1);
  uint64_t v10 = *((void *)a4 + 2);
  id v11 = [NSString alloc];
  v13 = objc_msgSend_initWithBytes_length_encoding_(v11, v12, v9, v10, 4);
  objc_msgSend_setDebugText_(self, v14, (uint64_t)v13);

  uint64_t v17 = objc_msgSend_debugText(self, v15, v16);

  if (v17)
  {
    retstr->mError = 0;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 5215;
  }
  else
  {
    *(_OWORD *)&retstr->mError = xmmword_265193F78;
    *(void *)&retstr->mLine = 5211;
  }
  return result;
}

@end