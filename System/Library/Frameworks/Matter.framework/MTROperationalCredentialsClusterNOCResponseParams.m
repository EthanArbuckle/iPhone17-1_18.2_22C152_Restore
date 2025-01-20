@interface MTROperationalCredentialsClusterNOCResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTROperationalCredentialsClusterNOCResponseParams)init;
- (MTROperationalCredentialsClusterNOCResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)fabricIndex;
- (NSNumber)statusCode;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)debugText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDebugText:(NSString *)debugText;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setStatusCode:(NSNumber *)statusCode;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROperationalCredentialsClusterNOCResponseParams

- (MTROperationalCredentialsClusterNOCResponseParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTROperationalCredentialsClusterNOCResponseParams;
  v2 = [(MTROperationalCredentialsClusterNOCResponseParams *)&v9 init];
  v3 = v2;
  if (v2)
  {
    statusCode = v2->_statusCode;
    v2->_statusCode = (NSNumber *)&unk_26F9C8548;

    fabricIndex = v3->_fabricIndex;
    v3->_fabricIndex = 0;

    debugText = v3->_debugText;
    v3->_debugText = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterNOCResponseParams);
  v7 = objc_msgSend_statusCode(self, v5, v6);
  objc_msgSend_setStatusCode_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_fabricIndex(self, v9, v10);
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_debugText(self, v13, v14);
  objc_msgSend_setDebugText_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_timedInvokeTimeoutMs(self, v17, v18);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: statusCode:%@; fabricIndex:%@; debugText:%@; >",
    v5,
    self->_statusCode,
    self->_fabricIndex,
  v7 = self->_debugText);

  return v7;
}

- (MTROperationalCredentialsClusterNOCResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTROperationalCredentialsClusterNOCResponseParams;
  v8 = [(MTROperationalCredentialsClusterNOCResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 62, 8, error);
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
      sub_244809374((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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

- (NSNumber)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(NSNumber *)statusCode
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
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
  objc_storeStrong((id *)&self->_fabricIndex, 0);

  objc_storeStrong((id *)&self->_statusCode, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setStatusCode_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 1))
  {
    uint64_t v10 = NSNumber;
    v11 = sub_2446F9190((unsigned char *)a4 + 1);
    v13 = objc_msgSend_numberWithUnsignedChar_(v10, v12, *v11);
    objc_msgSend_setFabricIndex_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setFabricIndex_(self, v9, 0);
  }
  int v17 = *((unsigned __int8 *)a4 + 8);
  v16 = (char *)a4 + 8;
  if (v17)
  {
    uint64_t v18 = (uint64_t *)sub_2446D18A4(v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    id v21 = [NSString alloc];
    uint64_t v23 = objc_msgSend_initWithBytes_length_encoding_(v21, v22, v19, v20, 4);
    objc_msgSend_setDebugText_(self, v24, (uint64_t)v23);

    v27 = objc_msgSend_debugText(self, v25, v26);

    if (!v27)
    {
      *(_OWORD *)&retstr->mError = xmmword_265194020;
      *(void *)&retstr->mLine = 9592;
      return result;
    }
  }
  else
  {
    result = (ChipError *)objc_msgSend_setDebugText_(self, v15, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 9599;
  return result;
}

@end