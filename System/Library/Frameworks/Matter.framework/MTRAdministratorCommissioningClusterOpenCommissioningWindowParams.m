@interface MTRAdministratorCommissioningClusterOpenCommissioningWindowParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRAdministratorCommissioningClusterOpenCommissioningWindowParams)init;
- (NSData)pakePasscodeVerifier;
- (NSData)salt;
- (NSNumber)commissioningTimeout;
- (NSNumber)discriminator;
- (NSNumber)iterations;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCommissioningTimeout:(NSNumber *)commissioningTimeout;
- (void)setDiscriminator:(NSNumber *)discriminator;
- (void)setIterations:(NSNumber *)iterations;
- (void)setPakePasscodeVerifier:(NSData *)pakePasscodeVerifier;
- (void)setSalt:(NSData *)salt;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRAdministratorCommissioningClusterOpenCommissioningWindowParams

- (MTRAdministratorCommissioningClusterOpenCommissioningWindowParams)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTRAdministratorCommissioningClusterOpenCommissioningWindowParams;
  v2 = [(MTRAdministratorCommissioningClusterOpenCommissioningWindowParams *)&v18 init];
  v3 = v2;
  if (v2)
  {
    commissioningTimeout = v2->_commissioningTimeout;
    v2->_commissioningTimeout = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_msgSend_data(MEMORY[0x263EFF8F8], v5, v6);
    pakePasscodeVerifier = v3->_pakePasscodeVerifier;
    v3->_pakePasscodeVerifier = (NSData *)v7;

    discriminator = v3->_discriminator;
    v3->_discriminator = (NSNumber *)&unk_26F9C8548;

    iterations = v3->_iterations;
    v3->_iterations = (NSNumber *)&unk_26F9C8548;

    uint64_t v13 = objc_msgSend_data(MEMORY[0x263EFF8F8], v11, v12);
    salt = v3->_salt;
    v3->_salt = (NSData *)v13;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAdministratorCommissioningClusterOpenCommissioningWindowParams);
  uint64_t v7 = objc_msgSend_commissioningTimeout(self, v5, v6);
  objc_msgSend_setCommissioningTimeout_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_pakePasscodeVerifier(self, v9, v10);
  objc_msgSend_setPakePasscodeVerifier_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_discriminator(self, v13, v14);
  objc_msgSend_setDiscriminator_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_iterations(self, v17, v18);
  objc_msgSend_setIterations_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_salt(self, v21, v22);
  objc_msgSend_setSalt_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_timedInvokeTimeoutMs(self, v25, v26);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_serverSideProcessingTimeout(self, v29, v30);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  commissioningTimeout = self->_commissioningTimeout;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_pakePasscodeVerifier, v7, 0);
  discriminator = self->_discriminator;
  iterations = self->_iterations;
  uint64_t v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_salt, v11, 0);
  objc_msgSend_stringWithFormat_(v3, v13, @"<%@: commissioningTimeout:%@; pakePasscodeVerifier:%@; discriminator:%@; iterations:%@; salt:%@; >",
    v5,
    commissioningTimeout,
    v8,
    discriminator,
    iterations,
  uint64_t v14 = v12);

  return v14;
}

- (NSNumber)commissioningTimeout
{
  return self->_commissioningTimeout;
}

- (void)setCommissioningTimeout:(NSNumber *)commissioningTimeout
{
}

- (NSData)pakePasscodeVerifier
{
  return self->_pakePasscodeVerifier;
}

- (void)setPakePasscodeVerifier:(NSData *)pakePasscodeVerifier
{
}

- (NSNumber)discriminator
{
  return self->_discriminator;
}

- (void)setDiscriminator:(NSNumber *)discriminator
{
}

- (NSNumber)iterations
{
  return self->_iterations;
}

- (void)setIterations:(NSNumber *)iterations
{
}

- (NSData)salt
{
  return self->_salt;
}

- (void)setSalt:(NSData *)salt
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
  objc_storeStrong((id *)&self->_salt, 0);
  objc_storeStrong((id *)&self->_iterations, 0);
  objc_storeStrong((id *)&self->_discriminator, 0);
  objc_storeStrong((id *)&self->_pakePasscodeVerifier, 0);

  objc_storeStrong((id *)&self->_commissioningTimeout, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v47 = 0;
  long long v48 = 0uLL;
  __int16 v49 = 0;
  memset(v50, 0, sizeof(v50));
  v46[0] = 0;
  v46[1] = 0;
  v45 = v46;
  uint64_t v7 = objc_msgSend_commissioningTimeout(self, a3, (uint64_t)a4);
  __int16 v47 = objc_msgSend_unsignedShortValue(v7, v8, v9);

  objc_msgSend_pakePasscodeVerifier(self, v10, v11);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_bytes(v12, v13, v14);
  uint64_t v18 = objc_msgSend_length(v12, v16, v17);
  sub_2446C1098(v39, v15, v18);

  long long v48 = *(_OWORD *)v39;
  v21 = objc_msgSend_discriminator(self, v19, v20);
  __int16 v49 = objc_msgSend_unsignedShortValue(v21, v22, v23);

  uint64_t v26 = objc_msgSend_iterations(self, v24, v25);
  v50[0] = objc_msgSend_unsignedIntValue(v26, v27, v28);

  objc_msgSend_salt(self, v29, v30);
  id v31 = objc_claimAutoreleasedReturnValue();
  uint64_t v34 = objc_msgSend_bytes(v31, v32, v33);
  uint64_t v37 = objc_msgSend_length(v31, v35, v36);
  sub_2446C1098(v39, v34, v37);

  *(_OWORD *)&v50[1] = *(_OWORD *)v39;
  sub_244CC8F5C(0x62FuLL, 0, &v44);
  if (v44)
  {
    sub_244CB62B8((uint64_t)v39);
    v41 = 0;
    v42 = 0;
    v40 = &unk_26F9536C8;
    char v43 = 0;
    sub_2447945A0((uint64_t)&v40, &v44, 0);
    sub_244CB6318((uint64_t)v39, (uint64_t)&v40, 0xFFFFFFFF, (uint64_t)v51);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244807600((uint64_t)&v47, v39, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v39, &v44, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v44);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v40 = &unk_26F9536C8;
    sub_244794634(&v42);
    sub_244794634(&v41);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 8519;
  }
  sub_244794634(&v44);
  return (ChipError *)sub_24479466C((uint64_t)&v45);
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
    int v11 = 8548;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end