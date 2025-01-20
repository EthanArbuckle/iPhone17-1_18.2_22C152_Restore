@interface MTRKeypadInputClusterSendKeyResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRKeypadInputClusterSendKeyResponseParams)init;
- (MTRKeypadInputClusterSendKeyResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)status;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setStatus:(NSNumber *)status;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRKeypadInputClusterSendKeyResponseParams

- (MTRKeypadInputClusterSendKeyResponseParams)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRKeypadInputClusterSendKeyResponseParams;
  v2 = [(MTRKeypadInputClusterSendKeyResponseParams *)&v7 init];
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRKeypadInputClusterSendKeyResponseParams);
  objc_super v7 = objc_msgSend_status(self, v5, v6);
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: status:%@ >", v5, self->_status);;

  return v7;
}

- (MTRKeypadInputClusterSendKeyResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v37.receiver = self;
  v37.super_class = (Class)MTRKeypadInputClusterSendKeyResponseParams;
  v8 = [(MTRKeypadInputClusterSendKeyResponseParams *)&v37 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1289, 1, error);
  if (v36)
  {
    sub_244CB3988((uint64_t)v35);
    sub_244CB39B8((uint64_t)v35, *((void *)v36 + 1), *((void *)v36 + 3));
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    sub_244CB54B4((uint64_t)v35, 256, &v33);
    if (!v33)
    {
      char v32 = 0;
      sub_244835A10(&v32, (uint64_t)v35, (uint64_t)&buf);
      long long v33 = buf;
      uint64_t v34 = v41;
      if (!buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        long long v33 = buf;
        uint64_t v34 = v41;
        if (!buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    uint64_t v10 = NSString;
    long long buf = v33;
    uint64_t v41 = v34;
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
      uint64_t v38 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v39 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v39, &v38, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v36);
LABEL_16:

  return v30;
}

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
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

  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v6 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, a4->var0);
  objc_msgSend_setStatus_(self, v7, (uint64_t)v6);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 29338;
  return result;
}

@end