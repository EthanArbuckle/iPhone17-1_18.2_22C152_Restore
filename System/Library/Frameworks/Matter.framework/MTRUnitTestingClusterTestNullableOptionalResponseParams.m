@interface MTRUnitTestingClusterTestNullableOptionalResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRUnitTestingClusterTestNullableOptionalResponseParams)init;
- (MTRUnitTestingClusterTestNullableOptionalResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)originalValue;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)value;
- (NSNumber)wasNull;
- (NSNumber)wasPresent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOriginalValue:(NSNumber *)originalValue;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setValue:(NSNumber *)value;
- (void)setWasNull:(NSNumber *)wasNull;
- (void)setWasPresent:(NSNumber *)wasPresent;
@end

@implementation MTRUnitTestingClusterTestNullableOptionalResponseParams

- (MTRUnitTestingClusterTestNullableOptionalResponseParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestNullableOptionalResponseParams;
  v2 = [(MTRUnitTestingClusterTestNullableOptionalResponseParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    wasPresent = v2->_wasPresent;
    v2->_wasPresent = (NSNumber *)&unk_26F9C8548;

    wasNull = v3->_wasNull;
    v3->_wasNull = 0;

    value = v3->_value;
    v3->_value = 0;

    originalValue = v3->_originalValue;
    v3->_originalValue = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestNullableOptionalResponseParams);
  v7 = objc_msgSend_wasPresent(self, v5, v6);
  objc_msgSend_setWasPresent_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_wasNull(self, v9, v10);
  objc_msgSend_setWasNull_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_value(self, v13, v14);
  objc_msgSend_setValue_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_originalValue(self, v17, v18);
  objc_msgSend_setOriginalValue_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: wasPresent:%@; wasNull:%@; value:%@; originalValue:%@; >",
    v5,
    self->_wasPresent,
    self->_wasNull,
    self->_value,
  v7 = self->_originalValue);

  return v7;
}

- (MTRUnitTestingClusterTestNullableOptionalResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v39.receiver = self;
  v39.super_class = (Class)MTRUnitTestingClusterTestNullableOptionalResponseParams;
  v8 = [(MTRUnitTestingClusterTestNullableOptionalResponseParams *)&v39 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 4294048773, 6, error);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      __int16 v32 = 0;
      char v33 = 0;
      char v34 = 0;
      sub_244845B8C((uint64_t)&v32, (uint64_t)v37, (uint64_t)&buf);
      long long v35 = buf;
      uint64_t v36 = v43;
      if (!buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        long long v35 = buf;
        uint64_t v36 = v43;
        if (!buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
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
      uint64_t v40 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v41 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v30;
}

- (NSNumber)wasPresent
{
  return self->_wasPresent;
}

- (void)setWasPresent:(NSNumber *)wasPresent
{
}

- (NSNumber)wasNull
{
  return self->_wasNull;
}

- (void)setWasNull:(NSNumber *)wasNull
{
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(NSNumber *)value
{
}

- (NSNumber)originalValue
{
  return self->_originalValue;
}

- (void)setOriginalValue:(NSNumber *)originalValue
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
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_wasNull, 0);

  objc_storeStrong((id *)&self->_wasPresent, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithBool_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setWasPresent_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 1))
  {
    uint64_t v10 = NSNumber;
    v11 = sub_2446D18C8((unsigned char *)a4 + 1);
    v13 = objc_msgSend_numberWithBool_(v10, v12, *v11);
    objc_msgSend_setWasNull_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setWasNull_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 3))
  {
    v16 = NSNumber;
    uint64_t v17 = sub_2446F9190((unsigned char *)a4 + 3);
    v19 = objc_msgSend_numberWithUnsignedChar_(v16, v18, *v17);
    objc_msgSend_setValue_(self, v20, (uint64_t)v19);
  }
  else
  {
    objc_msgSend_setValue_(self, v15, 0);
  }
  int v23 = *((unsigned __int8 *)a4 + 5);
  uint64_t v22 = (char *)a4 + 5;
  if (v23 && sub_2446F9190(v22)[1])
  {
    v24 = NSNumber;
    v25 = sub_2446F9190(v22);
    if (!v25[1]) {
      sub_24479484C();
    }
    v27 = objc_msgSend_numberWithUnsignedChar_(v24, v26, *v25);
    objc_msgSend_setOriginalValue_(self, v28, (uint64_t)v27);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setOriginalValue_(self, v21, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 37211;
  return result;
}

@end