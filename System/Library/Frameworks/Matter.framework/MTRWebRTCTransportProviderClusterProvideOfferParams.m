@interface MTRWebRTCTransportProviderClusterProvideOfferParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRWebRTCTransportProviderClusterProvideOfferParams)init;
- (NSArray)iceServers;
- (NSNumber)audioStreamID;
- (NSNumber)metadataOptions;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)streamType;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)videoStreamID;
- (NSNumber)webRTCSessionID;
- (NSString)iceTransportPolicy;
- (NSString)sdp;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioStreamID:(id)a3;
- (void)setIceServers:(id)a3;
- (void)setIceTransportPolicy:(id)a3;
- (void)setMetadataOptions:(id)a3;
- (void)setSdp:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVideoStreamID:(id)a3;
- (void)setWebRTCSessionID:(id)a3;
@end

@implementation MTRWebRTCTransportProviderClusterProvideOfferParams

- (MTRWebRTCTransportProviderClusterProvideOfferParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRWebRTCTransportProviderClusterProvideOfferParams;
  v2 = [(MTRWebRTCTransportProviderClusterProvideOfferParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    webRTCSessionID = v2->_webRTCSessionID;
    v2->_webRTCSessionID = 0;

    sdp = v3->_sdp;
    v3->_sdp = (NSString *)&stru_26F969DC8;

    streamType = v3->_streamType;
    v3->_streamType = (NSNumber *)&unk_26F9C8548;

    videoStreamID = v3->_videoStreamID;
    v3->_videoStreamID = 0;

    audioStreamID = v3->_audioStreamID;
    v3->_audioStreamID = 0;

    iceServers = v3->_iceServers;
    v3->_iceServers = 0;

    iceTransportPolicy = v3->_iceTransportPolicy;
    v3->_iceTransportPolicy = 0;

    metadataOptions = v3->_metadataOptions;
    v3->_metadataOptions = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWebRTCTransportProviderClusterProvideOfferParams);
  v7 = objc_msgSend_webRTCSessionID(self, v5, v6);
  objc_msgSend_setWebRTCSessionID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_sdp(self, v9, v10);
  objc_msgSend_setSdp_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_streamType(self, v13, v14);
  objc_msgSend_setStreamType_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_videoStreamID(self, v17, v18);
  objc_msgSend_setVideoStreamID_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_audioStreamID(self, v21, v22);
  objc_msgSend_setAudioStreamID_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_iceServers(self, v25, v26);
  objc_msgSend_setIceServers_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_iceTransportPolicy(self, v29, v30);
  objc_msgSend_setIceTransportPolicy_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_metadataOptions(self, v33, v34);
  objc_msgSend_setMetadataOptions_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_timedInvokeTimeoutMs(self, v37, v38);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_serverSideProcessingTimeout(self, v41, v42);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: webRTCSessionID:%@; sdp:%@; streamType:%@; videoStreamID:%@; audioStreamID:%@; iceServers:%@; iceTransportPolicy:%@; metadataOptions:%@; >",
    v5,
    self->_webRTCSessionID,
    self->_sdp,
    self->_streamType,
    self->_videoStreamID,
    self->_audioStreamID,
    self->_iceServers,
    self->_iceTransportPolicy,
  v7 = self->_metadataOptions);

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

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)videoStreamID
{
  return self->_videoStreamID;
}

- (void)setVideoStreamID:(id)a3
{
}

- (NSNumber)audioStreamID
{
  return self->_audioStreamID;
}

- (void)setAudioStreamID:(id)a3
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

- (NSNumber)metadataOptions
{
  return self->_metadataOptions;
}

- (void)setMetadataOptions:(id)a3
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
  objc_storeStrong((id *)&self->_metadataOptions, 0);
  objc_storeStrong((id *)&self->_iceTransportPolicy, 0);
  objc_storeStrong((id *)&self->_iceServers, 0);
  objc_storeStrong((id *)&self->_audioStreamID, 0);
  objc_storeStrong((id *)&self->_videoStreamID, 0);
  objc_storeStrong((id *)&self->_streamType, 0);
  objc_storeStrong((id *)&self->_sdp, 0);

  objc_storeStrong((id *)&self->_webRTCSessionID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v71) = 0;
  char v72 = 0;
  char v75 = 0;
  char v77 = 0;
  char v79 = 0;
  char v82 = 0;
  LOBYTE(v84) = 0;
  long long v73 = 0uLL;
  char v74 = 0;
  v70[0] = 0;
  v70[1] = 0;
  v69 = v70;
  uint64_t v6 = objc_msgSend_webRTCSessionID(self, a3, (uint64_t)a4);

  if (v6)
  {
    __int16 v71 = 0;
    char v72 = 1;
    v9 = objc_msgSend_webRTCSessionID(self, v7, v8);
    __int16 v71 = objc_msgSend_unsignedShortValue(v9, v10, v11);
  }
  objc_msgSend_sdp(self, v7, v8);
  id v12 = objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend_UTF8String(v12, v13, v14);
  uint64_t v17 = objc_msgSend_lengthOfBytesUsingEncoding_(v12, v16, 4);
  sub_24479476C(v63, v15, v17);

  long long v73 = *(_OWORD *)v63;
  v20 = objc_msgSend_streamType(self, v18, v19);
  char v74 = objc_msgSend_unsignedCharValue(v20, v21, v22);

  v25 = objc_msgSend_videoStreamID(self, v23, v24);

  if (v25)
  {
    char v75 = 1;
    int v76 = 0;
    v28 = objc_msgSend_videoStreamID(self, v26, v27);

    if (v28)
    {
      LOWORD(v76) = 0;
      BYTE2(v76) = 1;
      v29 = objc_msgSend_videoStreamID(self, v26, v27);
      LOWORD(v76) = objc_msgSend_unsignedShortValue(v29, v30, v31);
    }
  }
  v32 = objc_msgSend_audioStreamID(self, v26, v27);

  if (v32)
  {
    char v77 = 1;
    int v78 = 0;
    v35 = objc_msgSend_audioStreamID(self, v33, v34);

    if (v35)
    {
      LOWORD(v78) = 0;
      BYTE2(v78) = 1;
      v36 = objc_msgSend_audioStreamID(self, v33, v34);
      LOWORD(v78) = objc_msgSend_unsignedShortValue(v36, v37, v38);
    }
  }
  v39 = objc_msgSend_iceServers(self, v33, v34);

  if (v39)
  {
    char v79 = 1;
    uint64_t v80 = 0;
    uint64_t v81 = 0;
    uint64_t v42 = objc_msgSend_iceServers(self, v40, v41);
    uint64_t v45 = objc_msgSend_count(v42, v43, v44);

    if (v45) {
      operator new();
    }
    uint64_t v80 = 0;
    uint64_t v81 = 0;
  }
  v46 = objc_msgSend_iceTransportPolicy(self, v40, v41);

  if (v46)
  {
    char v82 = 1;
    long long v83 = 0uLL;
    objc_msgSend_iceTransportPolicy(self, v47, v48);
    id v49 = objc_claimAutoreleasedReturnValue();
    uint64_t v52 = objc_msgSend_UTF8String(v49, v50, v51);
    uint64_t v54 = objc_msgSend_lengthOfBytesUsingEncoding_(v49, v53, 4);
    sub_24479476C(v63, v52, v54);

    long long v83 = *(_OWORD *)v63;
  }
  v55 = objc_msgSend_metadataOptions(self, v47, v48);

  if (v55)
  {
    __int16 v84 = 1;
    v58 = objc_msgSend_metadataOptions(self, v56, v57);
    HIBYTE(v84) = objc_msgSend_unsignedCharValue(v58, v59, v60);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v68);
  if (v68)
  {
    sub_244CB62B8((uint64_t)v63);
    v65 = 0;
    v66 = 0;
    v64 = &unk_26F9536C8;
    char v67 = 0;
    sub_2447945A0((uint64_t)&v64, &v68, 0);
    sub_244CB6318((uint64_t)v63, (uint64_t)&v64, 0xFFFFFFFF, (uint64_t)v85);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244840A98((uint64_t)&v71, v63, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v63, &v68, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v68);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v64 = &unk_26F9536C8;
    sub_244794634(&v66);
    sub_244794634(&v65);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34388;
  }
  sub_244794634(&v68);
  return (ChipError *)sub_24479466C((uint64_t)&v69);
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
    int v11 = 34417;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end