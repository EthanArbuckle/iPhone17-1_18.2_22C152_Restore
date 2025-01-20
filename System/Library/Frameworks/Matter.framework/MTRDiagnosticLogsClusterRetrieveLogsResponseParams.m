@interface MTRDiagnosticLogsClusterRetrieveLogsResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)init;
- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSData)logContent;
- (NSNumber)status;
- (NSNumber)timeSinceBoot;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)utcTimeStamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLogContent:(NSData *)logContent;
- (void)setStatus:(NSNumber *)status;
- (void)setTimeSinceBoot:(NSNumber *)timeSinceBoot;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUtcTimeStamp:(NSNumber *)utcTimeStamp;
@end

@implementation MTRDiagnosticLogsClusterRetrieveLogsResponseParams

- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsResponseParams;
  v2 = [(MTRDiagnosticLogsClusterRetrieveLogsResponseParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_msgSend_data(MEMORY[0x263EFF8F8], v5, v6);
    logContent = v3->_logContent;
    v3->_logContent = (NSData *)v7;

    utcTimeStamp = v3->_utcTimeStamp;
    v3->_utcTimeStamp = 0;

    timeSinceBoot = v3->_timeSinceBoot;
    v3->_timeSinceBoot = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDiagnosticLogsClusterRetrieveLogsResponseParams);
  uint64_t v7 = objc_msgSend_status(self, v5, v6);
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_logContent(self, v9, v10);
  objc_msgSend_setLogContent_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_utcTimeStamp(self, v13, v14);
  objc_msgSend_setUtcTimeStamp_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_timeSinceBoot(self, v17, v18);
  objc_msgSend_setTimeSinceBoot_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  status = self->_status;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_logContent, v7, 0);
  objc_msgSend_stringWithFormat_(v3, v9, @"<%@: status:%@; logContent:%@; utcTimeStamp:%@; timeSinceBoot:%@; >",
    v5,
    status,
    v8,
    self->_utcTimeStamp,
  uint64_t v10 = self->_timeSinceBoot);

  return v10;
}

- (MTRDiagnosticLogsClusterRetrieveLogsResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTRDiagnosticLogsClusterRetrieveLogsResponseParams;
  v8 = [(MTRDiagnosticLogsClusterRetrieveLogsResponseParams *)&v38 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 50, 1, error);
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
      char v44 = 0;
      *((void *)&buf + 1) = 0;
      uint64_t v42 = 0;
      char v43 = 0;
      sub_2448004CC((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
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
    objc_super v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
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

- (NSNumber)status
{
  return self->_status;
}

- (void)setStatus:(NSNumber *)status
{
}

- (NSData)logContent
{
  return self->_logContent;
}

- (void)setLogContent:(NSData *)logContent
{
}

- (NSNumber)utcTimeStamp
{
  return self->_utcTimeStamp;
}

- (void)setUtcTimeStamp:(NSNumber *)utcTimeStamp
{
}

- (NSNumber)timeSinceBoot
{
  return self->_timeSinceBoot;
}

- (void)setTimeSinceBoot:(NSNumber *)timeSinceBoot
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
  objc_storeStrong((id *)&self->_timeSinceBoot, 0);
  objc_storeStrong((id *)&self->_utcTimeStamp, 0);
  objc_storeStrong((id *)&self->_logContent, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  uint64_t v10 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v9, *((void *)a4 + 1), *((void *)a4 + 2));
  objc_msgSend_setLogContent_(self, v11, (uint64_t)v10);

  if (*((unsigned char *)a4 + 24))
  {
    objc_super v13 = NSNumber;
    uint64_t v14 = (uint64_t *)sub_2446F7170((unsigned char *)a4 + 24);
    v16 = objc_msgSend_numberWithUnsignedLongLong_(v13, v15, *v14);
    objc_msgSend_setUtcTimeStamp_(self, v17, (uint64_t)v16);
  }
  else
  {
    objc_msgSend_setUtcTimeStamp_(self, v12, 0);
  }
  int v20 = *((unsigned __int8 *)a4 + 40);
  v19 = (char *)a4 + 40;
  if (v20)
  {
    id v21 = NSNumber;
    uint64_t v22 = (uint64_t *)sub_2446F7170(v19);
    v24 = objc_msgSend_numberWithUnsignedLongLong_(v21, v23, *v22);
    objc_msgSend_setTimeSinceBoot_(self, v25, (uint64_t)v24);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setTimeSinceBoot_(self, v18, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 7069;
  return result;
}

@end