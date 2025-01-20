@interface MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams)init;
- (NSData)clientIdentifier;
- (NSData)credentials;
- (NSData)networkIdentity;
- (NSData)possessionNonce;
- (NSData)ssid;
- (NSNumber)breadcrumb;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBreadcrumb:(NSNumber *)breadcrumb;
- (void)setClientIdentifier:(id)a3;
- (void)setCredentials:(NSData *)credentials;
- (void)setNetworkIdentity:(id)a3;
- (void)setPossessionNonce:(id)a3;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setSsid:(NSData *)ssid;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams

- (MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams)init
{
  v18.receiver = self;
  v18.super_class = (Class)MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams;
  v4 = [(MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams *)&v18 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    ssid = v4->_ssid;
    v4->_ssid = (NSData *)v5;

    uint64_t v9 = objc_msgSend_data(MEMORY[0x263EFF8F8], v7, v8);
    credentials = v4->_credentials;
    v4->_credentials = (NSData *)v9;

    breadcrumb = v4->_breadcrumb;
    v4->_breadcrumb = 0;

    networkIdentity = v4->_networkIdentity;
    v4->_networkIdentity = 0;

    clientIdentifier = v4->_clientIdentifier;
    v4->_clientIdentifier = 0;

    possessionNonce = v4->_possessionNonce;
    v4->_possessionNonce = 0;

    timedInvokeTimeoutMs = v4->_timedInvokeTimeoutMs;
    v4->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v4->_serverSideProcessingTimeout;
    v4->_serverSideProcessingTimeout = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRNetworkCommissioningClusterAddOrUpdateWiFiNetworkParams);
  v7 = objc_msgSend_ssid(self, v5, v6);
  objc_msgSend_setSsid_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_credentials(self, v9, v10);
  objc_msgSend_setCredentials_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_breadcrumb(self, v13, v14);
  objc_msgSend_setBreadcrumb_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_networkIdentity(self, v17, v18);
  objc_msgSend_setNetworkIdentity_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_clientIdentifier(self, v21, v22);
  objc_msgSend_setClientIdentifier_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_possessionNonce(self, v25, v26);
  objc_msgSend_setPossessionNonce_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_ssid, v6, 0);
  uint64_t v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_credentials, v8, 0);
  breadcrumb = self->_breadcrumb;
  v12 = objc_msgSend_base64EncodedStringWithOptions_(self->_networkIdentity, v11, 0);
  uint64_t v14 = objc_msgSend_base64EncodedStringWithOptions_(self->_clientIdentifier, v13, 0);
  v16 = objc_msgSend_base64EncodedStringWithOptions_(self->_possessionNonce, v15, 0);
  objc_msgSend_stringWithFormat_(v3, v17, @"<%@: ssid:%@; credentials:%@; breadcrumb:%@; networkIdentity:%@; clientIdentifier:%@; possessionNonce:%@; >",
    v5,
    v7,
    v9,
    breadcrumb,
    v12,
    v14,
  uint64_t v18 = v16);

  return v18;
}

- (NSData)ssid
{
  return self->_ssid;
}

- (void)setSsid:(NSData *)ssid
{
}

- (NSData)credentials
{
  return self->_credentials;
}

- (void)setCredentials:(NSData *)credentials
{
}

- (NSNumber)breadcrumb
{
  return self->_breadcrumb;
}

- (void)setBreadcrumb:(NSNumber *)breadcrumb
{
}

- (NSData)networkIdentity
{
  return self->_networkIdentity;
}

- (void)setNetworkIdentity:(id)a3
{
}

- (NSData)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSData)possessionNonce
{
  return self->_possessionNonce;
}

- (void)setPossessionNonce:(id)a3
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
  objc_storeStrong((id *)&self->_possessionNonce, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_networkIdentity, 0);
  objc_storeStrong((id *)&self->_breadcrumb, 0);
  objc_storeStrong((id *)&self->_credentials, 0);

  objc_storeStrong((id *)&self->_ssid, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v74 = 0;
  char v76 = 0;
  char v78 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  char v72 = 0;
  v69[0] = 0;
  v69[1] = 0;
  v68 = v69;
  objc_msgSend_ssid(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_bytes(v7, v8, v9);
  uint64_t v13 = objc_msgSend_length(v7, v11, v12);
  sub_2446C1098(v62, v10, v13);

  long long v70 = *(_OWORD *)v62;
  objc_msgSend_credentials(self, v14, v15);
  id v16 = objc_claimAutoreleasedReturnValue();
  uint64_t v19 = objc_msgSend_bytes(v16, v17, v18);
  uint64_t v22 = objc_msgSend_length(v16, v20, v21);
  sub_2446C1098(v62, v19, v22);

  long long v71 = *(_OWORD *)v62;
  v25 = objc_msgSend_breadcrumb(self, v23, v24);

  if (v25)
  {
    char v72 = 1;
    uint64_t v73 = 0;
    v28 = objc_msgSend_breadcrumb(self, v26, v27);
    uint64_t v73 = objc_msgSend_unsignedLongLongValue(v28, v29, v30);
  }
  v31 = objc_msgSend_networkIdentity(self, v26, v27);

  if (v31)
  {
    char v74 = 1;
    long long v75 = 0uLL;
    objc_msgSend_networkIdentity(self, v32, v33);
    id v34 = objc_claimAutoreleasedReturnValue();
    uint64_t v37 = objc_msgSend_bytes(v34, v35, v36);
    uint64_t v40 = objc_msgSend_length(v34, v38, v39);
    sub_2446C1098(v62, v37, v40);

    long long v75 = *(_OWORD *)v62;
  }
  v41 = objc_msgSend_clientIdentifier(self, v32, v33);

  if (v41)
  {
    char v76 = 1;
    long long v77 = 0uLL;
    objc_msgSend_clientIdentifier(self, v42, v43);
    id v44 = objc_claimAutoreleasedReturnValue();
    uint64_t v47 = objc_msgSend_bytes(v44, v45, v46);
    uint64_t v50 = objc_msgSend_length(v44, v48, v49);
    sub_2446C1098(v62, v47, v50);

    long long v77 = *(_OWORD *)v62;
  }
  v51 = objc_msgSend_possessionNonce(self, v42, v43);

  if (v51)
  {
    char v78 = 1;
    long long v79 = 0uLL;
    objc_msgSend_possessionNonce(self, v52, v53);
    id v54 = objc_claimAutoreleasedReturnValue();
    uint64_t v57 = objc_msgSend_bytes(v54, v55, v56);
    uint64_t v60 = objc_msgSend_length(v54, v58, v59);
    sub_2446C1098(v62, v57, v60);

    long long v79 = *(_OWORD *)v62;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v67);
  if (v67)
  {
    sub_244CB62B8((uint64_t)v62);
    v64 = 0;
    v65 = 0;
    v63 = &unk_26F9536C8;
    char v66 = 0;
    sub_2447945A0((uint64_t)&v63, &v67, 0);
    sub_244CB6318((uint64_t)v62, (uint64_t)&v63, 0xFFFFFFFF, (uint64_t)v80);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2447FE814((uint64_t)&v70, v62, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v62, &v67, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v67);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v63 = &unk_26F9536C8;
    sub_244794634(&v65);
    sub_244794634(&v64);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 6072;
  }
  sub_244794634(&v67);
  return (ChipError *)sub_24479466C((uint64_t)&v68);
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
    int v11 = 6101;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end