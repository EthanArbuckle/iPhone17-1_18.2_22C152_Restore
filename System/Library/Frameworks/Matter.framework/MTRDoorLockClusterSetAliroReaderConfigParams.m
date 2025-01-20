@interface MTRDoorLockClusterSetAliroReaderConfigParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDoorLockClusterSetAliroReaderConfigParams)init;
- (NSData)groupIdentifier;
- (NSData)groupResolvingKey;
- (NSData)signingKey;
- (NSData)verificationKey;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGroupIdentifier:(id)a3;
- (void)setGroupResolvingKey:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setSigningKey:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVerificationKey:(id)a3;
@end

@implementation MTRDoorLockClusterSetAliroReaderConfigParams

- (MTRDoorLockClusterSetAliroReaderConfigParams)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTRDoorLockClusterSetAliroReaderConfigParams;
  v4 = [(MTRDoorLockClusterSetAliroReaderConfigParams *)&v19 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    signingKey = v4->_signingKey;
    v4->_signingKey = (NSData *)v5;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    verificationKey = v4->_verificationKey;
    v4->_verificationKey = (NSData *)v9;

    uint64_t v13 = objc_msgSend_data(MEMORY[0x263EFF8F8], v11, v12);
    groupIdentifier = v4->_groupIdentifier;
    v4->_groupIdentifier = (NSData *)v13;

    groupResolvingKey = v4->_groupResolvingKey;
    v4->_groupResolvingKey = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDoorLockClusterSetAliroReaderConfigParams);
  v7 = objc_msgSend_signingKey(self, v5, v6);
  objc_msgSend_setSigningKey_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_verificationKey(self, v9, v10);
  objc_msgSend_setVerificationKey_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_groupIdentifier(self, v13, v14);
  objc_msgSend_setGroupIdentifier_(v4, v16, (uint64_t)v15);

  objc_super v19 = objc_msgSend_groupResolvingKey(self, v17, v18);
  objc_msgSend_setGroupResolvingKey_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_signingKey, v6, 0);
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_verificationKey, v8, 0);
  v11 = objc_msgSend_base64EncodedStringWithOptions_(self->_groupIdentifier, v10, 0);
  uint64_t v13 = objc_msgSend_base64EncodedStringWithOptions_(self->_groupResolvingKey, v12, 0);
  objc_msgSend_stringWithFormat_(v3, v14, @"<%@: signingKey:%@; verificationKey:%@; groupIdentifier:%@; groupResolvingKey:%@; >",
    v5,
    v7,
    v9,
    v11,
  v15 = v13);

  return v15;
}

- (NSData)signingKey
{
  return self->_signingKey;
}

- (void)setSigningKey:(id)a3
{
}

- (NSData)verificationKey
{
  return self->_verificationKey;
}

- (void)setVerificationKey:(id)a3
{
}

- (NSData)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (NSData)groupResolvingKey
{
  return self->_groupResolvingKey;
}

- (void)setGroupResolvingKey:(id)a3
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(id)a3
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);
  objc_storeStrong((id *)&self->_groupResolvingKey, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_verificationKey, 0);

  objc_storeStrong((id *)&self->_signingKey, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v56 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v53 = 0u;
  v52[0] = 0;
  v52[1] = 0;
  v51 = v52;
  objc_msgSend_signingKey(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v45, v10, v13);

  long long v53 = *(_OWORD *)v45;
  objc_msgSend_verificationKey(self, v14, v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_bytes(v16, v17, v18);
  uint64_t v22 = objc_msgSend_length(v16, v20, v21);
  sub_2446C1098(v45, v19, v22);

  long long v54 = *(_OWORD *)v45;
  objc_msgSend_groupIdentifier(self, v23, v24);
  id v25 = objc_claimAutoreleasedReturnValue();
  uint64_t v28 = objc_msgSend_bytes(v25, v26, v27);
  uint64_t v31 = objc_msgSend_length(v25, v29, v30);
  sub_2446C1098(v45, v28, v31);

  long long v55 = *(_OWORD *)v45;
  v34 = objc_msgSend_groupResolvingKey(self, v32, v33);

  if (v34)
  {
    char v56 = 1;
    long long v57 = 0uLL;
    objc_msgSend_groupResolvingKey(self, v35, v36);
    id v37 = objc_claimAutoreleasedReturnValue();
    uint64_t v40 = objc_msgSend_bytes(v37, v38, v39);
    uint64_t v43 = objc_msgSend_length(v37, v41, v42);
    sub_2446C1098(v45, v40, v43);

    long long v57 = *(_OWORD *)v45;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v50);
  if (v50)
  {
    sub_244CB62B8((uint64_t)v45);
    v47 = 0;
    v48 = 0;
    v46 = &unk_26F9536C8;
    char v49 = 0;
    sub_2447945A0((uint64_t)&v46, &v50, 0);
    sub_244CB6318((uint64_t)v45, (uint64_t)&v46, 0xFFFFFFFF, (uint64_t)v58);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24482272C((uint64_t)&v53, v45, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v45, &v50, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v50);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v46 = &unk_26F9536C8;
    sub_244794634(&v48);
    sub_244794634(&v47);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 21422;
  }
  sub_244794634(&v50);
  return (ChipError *)sub_24479466C((uint64_t)&v51);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  uint64_t v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 21451;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end