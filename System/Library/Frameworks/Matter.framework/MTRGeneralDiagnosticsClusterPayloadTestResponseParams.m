@interface MTRGeneralDiagnosticsClusterPayloadTestResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)init;
- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSData)payload;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPayload:(id)a3;
@end

@implementation MTRGeneralDiagnosticsClusterPayloadTestResponseParams

- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRGeneralDiagnosticsClusterPayloadTestResponseParams;
  v4 = [(MTRGeneralDiagnosticsClusterPayloadTestResponseParams *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    payload = v4->_payload;
    v4->_payload = (NSData *)v5;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterPayloadTestResponseParams);
  v7 = objc_msgSend_payload(self, v5, v6);
  objc_msgSend_setPayload_(v4, v8, (uint64_t)v7);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_payload, v6, 0);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@: payload:%@ >", v5, v7);;

  return v9;
}

- (MTRGeneralDiagnosticsClusterPayloadTestResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)MTRGeneralDiagnosticsClusterPayloadTestResponseParams;
  objc_super v8 = [(MTRGeneralDiagnosticsClusterPayloadTestResponseParams *)&v37 init];
  if (!v8)
  {
    v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 51, 4, a4);
  if (v36)
  {
    sub_244CB3988((uint64_t)v35);
    sub_244CB39B8((uint64_t)v35, *((void *)v36 + 1), *((void *)v36 + 3));
    long long v33 = 0uLL;
    uint64_t v34 = 0;
    sub_244CB54B4((uint64_t)v35, 256, &v33);
    if (!v33)
    {
      long long v32 = 0uLL;
      sub_24480148C(&v32, (uint64_t)v35, (uint64_t)buf);
      long long v33 = *(_OWORD *)buf;
      uint64_t v34 = v41;
      if (!*(_DWORD *)buf)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&v32);
        long long v33 = *(_OWORD *)buf;
        uint64_t v34 = v41;
        if (!*(_DWORD *)buf)
        {
          v30 = v8;
          goto LABEL_14;
        }
      }
    }
    v10 = NSString;
    *(_OWORD *)buf = v33;
    uint64_t v41 = v34;
    v11 = sub_244CB7B34((const char **)buf, 1);
    v13 = objc_msgSend_stringWithFormat_(v10, v12, @"Command payload decoding failed: %s", v11);
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = v13;
      uint64_t v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v21 = v13;
      objc_msgSend_UTF8String(v21, v22, v23);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v38 = *MEMORY[0x263F08338];
      v24 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v19, v20);
      v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v39 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v39, &v38, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v30 = 0;
LABEL_14:
  sub_244794634(&v36);
LABEL_16:

  return v30;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  id v6 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], a3, *(void *)a4, *((void *)a4 + 1));
  objc_msgSend_setPayload_(self, v7, (uint64_t)v6);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 7508;
  return result;
}

@end