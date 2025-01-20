@interface MTRCameraAVStreamManagementClusterAudioStreamAllocateParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRCameraAVStreamManagementClusterAudioStreamAllocateParams)init;
- (NSNumber)audioCodec;
- (NSNumber)bitDepth;
- (NSNumber)bitRate;
- (NSNumber)channelCount;
- (NSNumber)sampleRate;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)streamType;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioCodec:(id)a3;
- (void)setBitDepth:(id)a3;
- (void)setBitRate:(id)a3;
- (void)setChannelCount:(id)a3;
- (void)setSampleRate:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterAudioStreamAllocateParams

- (MTRCameraAVStreamManagementClusterAudioStreamAllocateParams)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRCameraAVStreamManagementClusterAudioStreamAllocateParams;
  v2 = [(MTRCameraAVStreamManagementClusterAudioStreamAllocateParams *)&v13 init];
  v3 = v2;
  if (v2)
  {
    streamType = v2->_streamType;
    v2->_streamType = (NSNumber *)&unk_26F9C8548;

    audioCodec = v3->_audioCodec;
    v3->_audioCodec = (NSNumber *)&unk_26F9C8548;

    channelCount = v3->_channelCount;
    v3->_channelCount = (NSNumber *)&unk_26F9C8548;

    sampleRate = v3->_sampleRate;
    v3->_sampleRate = (NSNumber *)&unk_26F9C8548;

    bitRate = v3->_bitRate;
    v3->_bitRate = (NSNumber *)&unk_26F9C8548;

    bitDepth = v3->_bitDepth;
    v3->_bitDepth = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterAudioStreamAllocateParams);
  v7 = objc_msgSend_streamType(self, v5, v6);
  objc_msgSend_setStreamType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_audioCodec(self, v9, v10);
  objc_msgSend_setAudioCodec_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_channelCount(self, v13, v14);
  objc_msgSend_setChannelCount_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_sampleRate(self, v17, v18);
  objc_msgSend_setSampleRate_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_bitRate(self, v21, v22);
  objc_msgSend_setBitRate_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_bitDepth(self, v25, v26);
  objc_msgSend_setBitDepth_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: streamType:%@; audioCodec:%@; channelCount:%@; sampleRate:%@; bitRate:%@; bitDepth:%@; >",
    v5,
    self->_streamType,
    self->_audioCodec,
    self->_channelCount,
    self->_sampleRate,
    self->_bitRate,
  v7 = self->_bitDepth);

  return v7;
}

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)audioCodec
{
  return self->_audioCodec;
}

- (void)setAudioCodec:(id)a3
{
}

- (NSNumber)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(id)a3
{
}

- (NSNumber)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(id)a3
{
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(id)a3
{
}

- (NSNumber)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(id)a3
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
  objc_storeStrong((id *)&self->_bitDepth, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_channelCount, 0);
  objc_storeStrong((id *)&self->_audioCodec, 0);

  objc_storeStrong((id *)&self->_streamType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v44 = 0;
  char v45 = 0;
  uint64_t v46 = 0;
  char v47 = 0;
  v43[0] = 0;
  v43[1] = 0;
  v42 = v43;
  v7 = objc_msgSend_streamType(self, a3, (uint64_t)a4);
  LOBYTE(v44) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_audioCodec(self, v10, v11);
  HIBYTE(v44) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  v17 = objc_msgSend_channelCount(self, v15, v16);
  char v45 = objc_msgSend_unsignedCharValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_sampleRate(self, v20, v21);
  LODWORD(v46) = objc_msgSend_unsignedIntValue(v22, v23, v24);

  v27 = objc_msgSend_bitRate(self, v25, v26);
  HIDWORD(v46) = objc_msgSend_unsignedIntValue(v27, v28, v29);

  v32 = objc_msgSend_bitDepth(self, v30, v31);
  char v47 = objc_msgSend_unsignedCharValue(v32, v33, v34);

  sub_244CC8F5C(0x62FuLL, 0, &v41);
  if (v41)
  {
    sub_244CB62B8((uint64_t)v36);
    v38 = 0;
    v39 = 0;
    v37 = &unk_26F9536C8;
    char v40 = 0;
    sub_2447945A0((uint64_t)&v37, &v41, 0);
    sub_244CB6318((uint64_t)v36, (uint64_t)&v37, 0xFFFFFFFF, (uint64_t)v48);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483D43C(&v44, v36, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v36, &v41, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v41);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v37 = &unk_26F9536C8;
    sub_244794634(&v39);
    sub_244794634(&v38);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 32439;
  }
  sub_244794634(&v41);
  return (ChipError *)sub_24479466C((uint64_t)&v42);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
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
    int v11 = 32468;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end