@interface MTRWebRTCTransportRequestorClusterOfferParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRWebRTCTransportRequestorClusterOfferParams)init;
- (NSArray)iceServers;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)webRTCSessionID;
- (NSString)iceTransportPolicy;
- (NSString)sdp;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIceServers:(id)a3;
- (void)setIceTransportPolicy:(id)a3;
- (void)setSdp:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setWebRTCSessionID:(id)a3;
@end

@implementation MTRWebRTCTransportRequestorClusterOfferParams

- (MTRWebRTCTransportRequestorClusterOfferParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRWebRTCTransportRequestorClusterOfferParams;
  v2 = [(MTRWebRTCTransportRequestorClusterOfferParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    webRTCSessionID = v2->_webRTCSessionID;
    v2->_webRTCSessionID = (NSNumber *)&unk_26F9C8548;

    sdp = v3->_sdp;
    v3->_sdp = (NSString *)&stru_26F969DC8;

    iceServers = v3->_iceServers;
    v3->_iceServers = 0;

    iceTransportPolicy = v3->_iceTransportPolicy;
    v3->_iceTransportPolicy = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWebRTCTransportRequestorClusterOfferParams);
  v7 = objc_msgSend_webRTCSessionID(self, v5, v6);
  objc_msgSend_setWebRTCSessionID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_sdp(self, v9, v10);
  objc_msgSend_setSdp_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_iceServers(self, v13, v14);
  objc_msgSend_setIceServers_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_iceTransportPolicy(self, v17, v18);
  objc_msgSend_setIceTransportPolicy_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_timedInvokeTimeoutMs(self, v21, v22);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_serverSideProcessingTimeout(self, v25, v26);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v28, (uint64_t)v27);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: webRTCSessionID:%@; sdp:%@; iceServers:%@; iceTransportPolicy:%@; >",
    v5,
    self->_webRTCSessionID,
    self->_sdp,
    self->_iceServers,
  v7 = self->_iceTransportPolicy);

  return v7;
}

- (NSNumber)webRTCSessionID
{
  return self->_webRTCSessionID;
}

- (void)setWebRTCSessionID:(id)a3
{
}

- (NSString)sdp
{
  return self->_sdp;
}

- (void)setSdp:(id)a3
{
}

- (NSArray)iceServers
{
  return self->_iceServers;
}

- (void)setIceServers:(id)a3
{
}

- (NSString)iceTransportPolicy
{
  return self->_iceTransportPolicy;
}

- (void)setIceTransportPolicy:(id)a3
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
  objc_storeStrong((id *)&self->_iceTransportPolicy, 0);
  objc_storeStrong((id *)&self->_iceServers, 0);
  objc_storeStrong((id *)&self->_sdp, 0);

  objc_storeStrong((id *)&self->_webRTCSessionID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v45 = 0;
  char v50 = 0;
  long long v46 = 0uLL;
  char v47 = 0;
  v44[0] = 0;
  v44[1] = 0;
  v43 = v44;
  uint64_t v6 = objc_msgSend_webRTCSessionID(self, a3, (uint64_t)a4);
  __int16 v45 = objc_msgSend_unsignedShortValue(v6, v7, v8);

  objc_msgSend_sdp(self, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v14 = objc_msgSend_UTF8String(v11, v12, v13);
  uint64_t v16 = objc_msgSend_lengthOfBytesUsingEncoding_(v11, v15, 4);
  sub_24479476C(v37, v14, v16);

  long long v46 = *(_OWORD *)v37;
  v19 = objc_msgSend_iceServers(self, v17, v18);

  if (v19)
  {
    char v47 = 1;
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    uint64_t v22 = objc_msgSend_iceServers(self, v20, v21);
    uint64_t v25 = objc_msgSend_count(v22, v23, v24);

    if (v25) {
      operator new();
    }
    uint64_t v48 = 0;
    uint64_t v49 = 0;
  }
  uint64_t v26 = objc_msgSend_iceTransportPolicy(self, v20, v21);

  if (v26)
  {
    char v50 = 1;
    long long v51 = 0uLL;
    objc_msgSend_iceTransportPolicy(self, v27, v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend_UTF8String(v29, v30, v31);
    uint64_t v34 = objc_msgSend_lengthOfBytesUsingEncoding_(v29, v33, 4);
    sub_24479476C(v37, v32, v34);

    long long v51 = *(_OWORD *)v37;
  }
  sub_244CC8F5C(0x62FuLL, 0, &v42);
  if (v42)
  {
    sub_244CB62B8((uint64_t)v37);
    v39 = 0;
    v40 = 0;
    v38 = &unk_26F9536C8;
    char v41 = 0;
    sub_2447945A0((uint64_t)&v38, &v42, 0);
    sub_244CB6318((uint64_t)v37, (uint64_t)&v38, 0xFFFFFFFF, (uint64_t)v52);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24484149C((uint64_t)&v45, v37, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v37, &v42, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v42);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v38 = &unk_26F9536C8;
    sub_244794634(&v40);
    sub_244794634(&v39);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34891;
  }
  sub_244794634(&v42);
  return (ChipError *)sub_24479466C((uint64_t)&v43);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 34920;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end