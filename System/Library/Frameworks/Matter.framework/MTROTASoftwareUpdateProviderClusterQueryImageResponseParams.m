@interface MTROTASoftwareUpdateProviderClusterQueryImageResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)init;
- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error;
- (NSData)metadataForRequestor;
- (NSData)updateToken;
- (NSNumber)delayedActionTime;
- (NSNumber)softwareVersion;
- (NSNumber)status;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)userConsentNeeded;
- (NSString)imageURI;
- (NSString)softwareVersionString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDelayedActionTime:(NSNumber *)delayedActionTime;
- (void)setImageURI:(NSString *)imageURI;
- (void)setMetadataForRequestor:(NSData *)metadataForRequestor;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
- (void)setSoftwareVersionString:(NSString *)softwareVersionString;
- (void)setStatus:(NSNumber *)status;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUpdateToken:(NSData *)updateToken;
- (void)setUserConsentNeeded:(NSNumber *)userConsentNeeded;
@end

@implementation MTROTASoftwareUpdateProviderClusterQueryImageResponseParams

- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)init
{
  v14.receiver = self;
  v14.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageResponseParams;
  v2 = [(MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *)&v14 init];
  v3 = v2;
  if (v2)
  {
    status = v2->_status;
    v2->_status = (NSNumber *)&unk_26F9C8548;

    delayedActionTime = v3->_delayedActionTime;
    v3->_delayedActionTime = 0;

    imageURI = v3->_imageURI;
    v3->_imageURI = 0;

    softwareVersion = v3->_softwareVersion;
    v3->_softwareVersion = 0;

    softwareVersionString = v3->_softwareVersionString;
    v3->_softwareVersionString = 0;

    updateToken = v3->_updateToken;
    v3->_updateToken = 0;

    userConsentNeeded = v3->_userConsentNeeded;
    v3->_userConsentNeeded = 0;

    metadataForRequestor = v3->_metadataForRequestor;
    v3->_metadataForRequestor = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterQueryImageResponseParams);
  v7 = objc_msgSend_status(self, v5, v6);
  objc_msgSend_setStatus_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_delayedActionTime(self, v9, v10);
  objc_msgSend_setDelayedActionTime_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_imageURI(self, v13, v14);
  objc_msgSend_setImageURI_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_softwareVersion(self, v17, v18);
  objc_msgSend_setSoftwareVersion_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_softwareVersionString(self, v21, v22);
  objc_msgSend_setSoftwareVersionString_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_updateToken(self, v25, v26);
  objc_msgSend_setUpdateToken_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_userConsentNeeded(self, v29, v30);
  objc_msgSend_setUserConsentNeeded_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_metadataForRequestor(self, v33, v34);
  objc_msgSend_setMetadataForRequestor_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  status = self->_status;
  delayedActionTime = self->_delayedActionTime;
  imageURI = self->_imageURI;
  softwareVersion = self->_softwareVersion;
  softwareVersionString = self->_softwareVersionString;
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_updateToken, v11, 0);
  userConsentNeeded = self->_userConsentNeeded;
  v15 = objc_msgSend_base64EncodedStringWithOptions_(self->_metadataForRequestor, v14, 0);
  objc_msgSend_stringWithFormat_(v3, v16, @"<%@: status:%@; delayedActionTime:%@; imageURI:%@; softwareVersion:%@; softwareVersionString:%@; updateToken:%@; userConsentNeeded:%@; metadataForRequestor:%@; >",
    v5,
    status,
    delayedActionTime,
    imageURI,
    softwareVersion,
    softwareVersionString,
    v12,
    userConsentNeeded,
  v17 = v15);

  return v17;
}

- (MTROTASoftwareUpdateProviderClusterQueryImageResponseParams)initWithResponseValue:(NSDictionary *)responseValue error:(NSError *)error
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v6 = responseValue;
  v38.receiver = self;
  v38.super_class = (Class)MTROTASoftwareUpdateProviderClusterQueryImageResponseParams;
  v8 = [(MTROTASoftwareUpdateProviderClusterQueryImageResponseParams *)&v38 init];
  if (!v8)
  {
    uint64_t v30 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 41, 1, error);
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
      BYTE4(buf) = 0;
      LOBYTE(v42) = 0;
      char v43 = 0;
      char v44 = 0;
      char v45 = 0;
      char v46 = 0;
      char v47 = 0;
      sub_2447F9A1C((uint64_t)&buf, (uint64_t)v36, (uint64_t)&v32);
      long long v34 = v32;
      uint64_t v35 = v33;
      if (!v32)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v9, (uint64_t)&buf);
        long long v34 = v32;
        uint64_t v35 = v33;
        if (!v32)
        {
          uint64_t v30 = v8;
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
      uint64_t v26 = objc_msgSend_localizedStringForKey_value_table_(v24, v25, (uint64_t)v13, &stru_26F969DC8, 0);
      v40 = v26;
      v28 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v27, (uint64_t)&v40, &v39, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v29, @"MTRErrorDomain", 13, v28);
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    }
  }
  uint64_t v30 = 0;
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

- (NSNumber)delayedActionTime
{
  return self->_delayedActionTime;
}

- (void)setDelayedActionTime:(NSNumber *)delayedActionTime
{
}

- (NSString)imageURI
{
  return self->_imageURI;
}

- (void)setImageURI:(NSString *)imageURI
{
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSString)softwareVersionString
{
  return self->_softwareVersionString;
}

- (void)setSoftwareVersionString:(NSString *)softwareVersionString
{
}

- (NSData)updateToken
{
  return self->_updateToken;
}

- (void)setUpdateToken:(NSData *)updateToken
{
}

- (NSNumber)userConsentNeeded
{
  return self->_userConsentNeeded;
}

- (void)setUserConsentNeeded:(NSNumber *)userConsentNeeded
{
}

- (NSData)metadataForRequestor
{
  return self->_metadataForRequestor;
}

- (void)setMetadataForRequestor:(NSData *)metadataForRequestor
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
  objc_storeStrong((id *)&self->_metadataForRequestor, 0);
  objc_storeStrong((id *)&self->_userConsentNeeded, 0);
  objc_storeStrong((id *)&self->_updateToken, 0);
  objc_storeStrong((id *)&self->_softwareVersionString, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
  objc_storeStrong((id *)&self->_imageURI, 0);
  objc_storeStrong((id *)&self->_delayedActionTime, 0);

  objc_storeStrong((id *)&self->_status, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  v7 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a3, *(unsigned __int8 *)a4);
  objc_msgSend_setStatus_(self, v8, (uint64_t)v7);

  if (*((unsigned char *)a4 + 4))
  {
    uint64_t v10 = NSNumber;
    v11 = sub_2446F12CC((unsigned char *)a4 + 4);
    v13 = objc_msgSend_numberWithUnsignedInt_(v10, v12, *(unsigned int *)v11);
    objc_msgSend_setDelayedActionTime_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_msgSend_setDelayedActionTime_(self, v9, 0);
  }
  if (*((unsigned char *)a4 + 16))
  {
    v16 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 16);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    id v19 = [NSString alloc];
    id v21 = objc_msgSend_initWithBytes_length_encoding_(v19, v20, v17, v18, 4);
    objc_msgSend_setImageURI_(self, v22, (uint64_t)v21);

    v25 = objc_msgSend_imageURI(self, v23, v24);

    if (!v25)
    {
      v28 = &xmmword_265193F48;
LABEL_14:
      *(_OWORD *)&retstr->mError = *v28;
      *(void *)&retstr->mLine = *((void *)v28 + 2);
      return result;
    }
  }
  else
  {
    objc_msgSend_setImageURI_(self, v15, 0);
  }
  if (*((unsigned char *)a4 + 40))
  {
    v29 = NSNumber;
    uint64_t v30 = sub_2446F12CC((unsigned char *)a4 + 40);
    long long v32 = objc_msgSend_numberWithUnsignedInt_(v29, v31, *(unsigned int *)v30);
    objc_msgSend_setSoftwareVersion_(self, v33, (uint64_t)v32);
  }
  else
  {
    objc_msgSend_setSoftwareVersion_(self, v27, 0);
  }
  if (*((unsigned char *)a4 + 48))
  {
    uint64_t v35 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 48);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    id v38 = [NSString alloc];
    v40 = objc_msgSend_initWithBytes_length_encoding_(v38, v39, v36, v37, 4);
    objc_msgSend_setSoftwareVersionString_(self, v41, (uint64_t)v40);

    char v44 = objc_msgSend_softwareVersionString(self, v42, v43);

    if (!v44)
    {
      v28 = &xmmword_265193F60;
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend_setSoftwareVersionString_(self, v34, 0);
  }
  if (*((unsigned char *)a4 + 72))
  {
    char v46 = (uint64_t *)sub_2446D18A4((unsigned char *)a4 + 72);
    uint64_t v48 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v47, *v46, v46[1]);
    objc_msgSend_setUpdateToken_(self, v49, (uint64_t)v48);
  }
  else
  {
    objc_msgSend_setUpdateToken_(self, v45, 0);
  }
  if (*((unsigned char *)a4 + 96))
  {
    v51 = NSNumber;
    v52 = sub_2446D18C8((unsigned char *)a4 + 96);
    v54 = objc_msgSend_numberWithBool_(v51, v53, *v52);
    objc_msgSend_setUserConsentNeeded_(self, v55, (uint64_t)v54);
  }
  else
  {
    objc_msgSend_setUserConsentNeeded_(self, v50, 0);
  }
  int v58 = *((unsigned __int8 *)a4 + 104);
  v57 = (char *)a4 + 104;
  if (v58)
  {
    v59 = (uint64_t *)sub_2446D18A4(v57);
    v61 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v60, *v59, v59[1]);
    objc_msgSend_setMetadataForRequestor_(self, v62, (uint64_t)v61);
  }
  else
  {
    result = (ChipError *)objc_msgSend_setMetadataForRequestor_(self, v56, 0);
  }
  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 4613;
  return result;
}

@end