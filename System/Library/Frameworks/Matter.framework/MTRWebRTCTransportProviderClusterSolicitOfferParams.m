@interface MTRWebRTCTransportProviderClusterSolicitOfferParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRWebRTCTransportProviderClusterSolicitOfferParams)init;
- (NSArray)iceServers;
- (NSNumber)audioStreamID;
- (NSNumber)metadataOptions;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)streamType;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)videoStreamID;
- (NSString)iceTransportPolicy;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioStreamID:(id)a3;
- (void)setIceServers:(id)a3;
- (void)setIceTransportPolicy:(id)a3;
- (void)setMetadataOptions:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVideoStreamID:(id)a3;
@end

@implementation MTRWebRTCTransportProviderClusterSolicitOfferParams

- (MTRWebRTCTransportProviderClusterSolicitOfferParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRWebRTCTransportProviderClusterSolicitOfferParams;
  v2 = [(MTRWebRTCTransportProviderClusterSolicitOfferParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    streamType = v2->_streamType;
    v2->_streamType = (NSNumber *)&unk_26F9C8548;

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
  v4 = objc_alloc_init(MTRWebRTCTransportProviderClusterSolicitOfferParams);
  v7 = objc_msgSend_streamType(self, v5, v6);
  objc_msgSend_setStreamType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_videoStreamID(self, v9, v10);
  objc_msgSend_setVideoStreamID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_audioStreamID(self, v13, v14);
  objc_msgSend_setAudioStreamID_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_iceServers(self, v17, v18);
  objc_msgSend_setIceServers_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_iceTransportPolicy(self, v21, v22);
  objc_msgSend_setIceTransportPolicy_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_metadataOptions(self, v25, v26);
  objc_msgSend_setMetadataOptions_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_timedInvokeTimeoutMs(self, v29, v30);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_serverSideProcessingTimeout(self, v33, v34);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: streamType:%@; videoStreamID:%@; audioStreamID:%@; iceServers:%@; iceTransportPolicy:%@; metadataOptions:%@; >",
    v5,
    self->_streamType,
    self->_videoStreamID,
    self->_audioStreamID,
    self->_iceServers,
    self->_iceTransportPolicy,
  v7 = self->_metadataOptions);

  return v7;
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
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  v57[0] = 0;
  char v58 = 0;
  char v60 = 0;
  char v62 = 0;
  char v65 = 0;
  LOBYTE(v67) = 0;
  v56[0] = 0;
  v56[1] = 0;
  v55 = v56;
  uint64_t v6 = objc_msgSend_streamType(self, a3, (uint64_t)a4);
  v57[0] = objc_msgSend_unsignedCharValue(v6, v7, v8);

  v11 = objc_msgSend_videoStreamID(self, v9, v10);

  if (v11)
  {
    char v58 = 1;
    int v59 = 0;
    uint64_t v14 = objc_msgSend_videoStreamID(self, v12, v13);

    if (v14)
    {
      LOWORD(v59) = 0;
      BYTE2(v59) = 1;
      v15 = objc_msgSend_videoStreamID(self, v12, v13);
      LOWORD(v59) = objc_msgSend_unsignedShortValue(v15, v16, v17);
    }
  }
  uint64_t v18 = objc_msgSend_audioStreamID(self, v12, v13);

  if (v18)
  {
    char v60 = 1;
    int v61 = 0;
    v21 = objc_msgSend_audioStreamID(self, v19, v20);

    if (v21)
    {
      LOWORD(v61) = 0;
      BYTE2(v61) = 1;
      uint64_t v22 = objc_msgSend_audioStreamID(self, v19, v20);
      LOWORD(v61) = objc_msgSend_unsignedShortValue(v22, v23, v24);
    }
  }
  v25 = objc_msgSend_iceServers(self, v19, v20);

  if (v25)
  {
    char v62 = 1;
    uint64_t v63 = 0;
    uint64_t v64 = 0;
    v28 = objc_msgSend_iceServers(self, v26, v27);
    uint64_t v31 = objc_msgSend_count(v28, v29, v30);

    if (v31) {
      operator new();
    }
    uint64_t v63 = 0;
    uint64_t v64 = 0;
  }
  v32 = objc_msgSend_iceTransportPolicy(self, v26, v27);

  if (v32)
  {
    char v65 = 1;
    long long v66 = 0uLL;
    objc_msgSend_iceTransportPolicy(self, v33, v34);
    id v35 = objc_claimAutoreleasedReturnValue();
    uint64_t v38 = objc_msgSend_UTF8String(v35, v36, v37);
    uint64_t v40 = objc_msgSend_lengthOfBytesUsingEncoding_(v35, v39, 4);
    sub_24479476C(v49, v38, v40);

    long long v66 = *(_OWORD *)v49;
  }
  v41 = objc_msgSend_metadataOptions(self, v33, v34);

  if (v41)
  {
    __int16 v67 = 1;
    v44 = objc_msgSend_metadataOptions(self, v42, v43);
    HIBYTE(v67) = objc_msgSend_unsignedCharValue(v44, v45, v46);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v54);
  if (v54)
  {
    sub_244CB62B8((uint64_t)v49);
    v51 = 0;
    v52 = 0;
    v50 = &unk_26F9536C8;
    char v53 = 0;
    sub_2447945A0((uint64_t)&v50, &v54, 0);
    sub_244CB6318((uint64_t)v49, (uint64_t)&v50, 0xFFFFFFFF, (uint64_t)v68);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244840438(v57, v49, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v49, &v54, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v54);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v50 = &unk_26F9536C8;
    sub_244794634(&v52);
    sub_244794634(&v51);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 34070;
  }
  sub_244794634(&v54);
  return (ChipError *)sub_24479466C((uint64_t)&v55);
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
    int v11 = 34099;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end