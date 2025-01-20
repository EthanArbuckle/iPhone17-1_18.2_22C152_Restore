@interface MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)init;
- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSNumber)action;
- (NSNumber)delayedActionTime;
- (NSNumber)timedInvokeTimeoutMs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAction:(NSNumber *)action;
- (void)setDelayedActionTime:(NSNumber *)delayedActionTime;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams

- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams;
  v2 = [(MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *)&v8 init];
  v3 = v2;
  if (v2)
  {
    action = v2->_action;
    v2->_action = (NSNumber *)&unk_26F9C8548;

    delayedActionTime = v3->_delayedActionTime;
    v3->_delayedActionTime = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams);
  v7 = objc_msgSend_action(self, v5, v6);
  objc_msgSend_setAction_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_delayedActionTime(self, v9, v10);
  objc_msgSend_setDelayedActionTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: action:%@; delayedActionTime:%@; >",
    v5,
    self->_action,
  v7 = self->_delayedActionTime);

  return v7;
}

- (MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams;
  objc_super v8 = [(MTROTASoftwareUpdateProviderClusterApplyUpdateResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 41, 3, error);
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
      int v33 = 0;
      sub_2447F9F74((uint64_t)v32, (uint64_t)v36, (uint64_t)&buf);
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

- (NSNumber)action
{
  return self->_action;
}

- (void)setAction:(NSNumber *)action
{
}

- (NSNumber)delayedActionTime
{
  return self->_delayedActionTime;
}

- (void)setDelayedActionTime:(NSNumber *)delayedActionTime
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
  objc_storeStrong((id *)&self->_delayedActionTime, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, a4->var0);
  objc_msgSend_setAction_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v9, *(unsigned int *)&a4[4].var0);
  objc_msgSend_setDelayedActionTime_(self, v11, (uint64_t)v10);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 4804;
  return result;
}

@end