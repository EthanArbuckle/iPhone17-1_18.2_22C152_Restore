@interface MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams)init;
- (NSData)updateToken;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)softwareVersion;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
- (void)setUpdateToken:(NSData *)updateToken;
@end

@implementation MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams

- (MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams;
  v4 = [(MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    updateToken = v4->_updateToken;
    v4->_updateToken = (NSData *)v5;

    softwareVersion = v4->_softwareVersion;
    v4->_softwareVersion = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateProviderClusterNotifyUpdateAppliedParams);
  v7 = objc_msgSend_updateToken(self, v5, v6);
  objc_msgSend_setUpdateToken_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_softwareVersion(self, v9, v10);
  objc_msgSend_setSoftwareVersion_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_updateToken, v6, 0);
  objc_msgSend_stringWithFormat_(v3, v8, @"<%@: updateToken:%@; softwareVersion:%@; >",
    v5,
    v7,
  v9 = self->_softwareVersion);

  return v9;
}

- (NSData)updateToken
{
  return self->_updateToken;
}

- (void)setUpdateToken:(NSData *)updateToken
{
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);

  objc_storeStrong((id *)&self->_updateToken, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v28 = 0uLL;
  int v29 = 0;
  v27[0] = 0;
  v27[1] = 0;
  v26 = v27;
  objc_msgSend_updateToken(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v20, v10, v13);

  long long v28 = *(_OWORD *)v20;
  v16 = objc_msgSend_softwareVersion(self, v14, v15);
  int v29 = objc_msgSend_unsignedIntValue(v16, v17, v18);

  sub_244CC8F5C(0x62FuLL, 0, &v25);
  if (v25)
  {
    sub_244CB62B8((uint64_t)v20);
    v22 = 0;
    v23 = 0;
    v21 = &unk_26F9536C8;
    char v24 = 0;
    sub_2447945A0((uint64_t)&v21, &v25, 0);
    sub_244CB6318((uint64_t)v20, (uint64_t)&v21, 0xFFFFFFFF, (uint64_t)v30);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447F9C28((uint64_t)&v28, v20, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v20, &v25, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v25);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v21 = &unk_26F9536C8;
    sub_244794634(&v23);
    sub_244794634(&v22);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 4864;
  }
  sub_244794634(&v25);
  return (ChipError *)sub_24479466C((uint64_t)&v26);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 4893;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end