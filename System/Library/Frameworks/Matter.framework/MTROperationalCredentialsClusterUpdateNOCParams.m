@interface MTROperationalCredentialsClusterUpdateNOCParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTROperationalCredentialsClusterUpdateNOCParams)init;
- (NSData)icacValue;
- (NSData)nocValue;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIcacValue:(NSData *)icacValue;
- (void)setNocValue:(NSData *)nocValue;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTROperationalCredentialsClusterUpdateNOCParams

- (MTROperationalCredentialsClusterUpdateNOCParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTROperationalCredentialsClusterUpdateNOCParams;
  v4 = [(MTROperationalCredentialsClusterUpdateNOCParams *)&v11 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    nocValue = v4->_nocValue;
    v4->_nocValue = (NSData *)v5;

    icacValue = v4->_icacValue;
    v4->_icacValue = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterUpdateNOCParams);
  v7 = objc_msgSend_nocValue(self, v5, v6);
  objc_msgSend_setNocValue_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_icacValue(self, v9, v10);
  objc_msgSend_setIcacValue_(v4, v12, (uint64_t)v11);

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
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_nocValue, v6, 0);
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_icacValue, v8, 0);
  objc_super v11 = objc_msgSend_stringWithFormat_(v3, v10, @"<%@: nocValue:%@ icacValue:%@; >", v5, v7, v9);;

  return v11;
}

- (NSData)nocValue
{
  return self->_nocValue;
}

- (void)setNocValue:(NSData *)nocValue
{
}

- (NSData)icacValue
{
  return self->_icacValue;
}

- (void)setIcacValue:(NSData *)icacValue
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
  objc_storeStrong((id *)&self->_icacValue, 0);

  objc_storeStrong((id *)&self->_nocValue, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v35 = 0uLL;
  char v36 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  objc_msgSend_nocValue(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v27, v10, v13);

  long long v35 = *(_OWORD *)v27;
  v16 = objc_msgSend_icacValue(self, v14, v15);

  if (v16)
  {
    char v36 = 1;
    long long v37 = 0uLL;
    objc_msgSend_icacValue(self, v17, v18);
    id v19 = objc_claimAutoreleasedReturnValue();
    uint64_t v22 = objc_msgSend_bytes(v19, v20, v21);
    uint64_t v25 = objc_msgSend_length(v19, v23, v24);
    sub_2446C1098(v27, v22, v25);

    long long v37 = *(_OWORD *)v27;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_244CB62B8((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_26F9536C8;
    char v31 = 0;
    sub_2447945A0((uint64_t)&v28, &v32, 0);
    sub_244CB6318((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v38);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447FFA04((uint64_t)&v35, v27, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v32);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_26F9536C8;
    sub_244794634(&v30);
    sub_244794634(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 9463;
  }
  sub_244794634(&v32);
  return (ChipError *)sub_24479466C((uint64_t)&v33);
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
    int v11 = 9492;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end