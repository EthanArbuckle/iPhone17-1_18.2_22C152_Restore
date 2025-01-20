@interface MTRMediaPlaybackClusterActivateAudioTrackParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRMediaPlaybackClusterActivateAudioTrackParams)init;
- (NSNumber)audioOutputIndex;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)trackID;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioOutputIndex:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setTrackID:(id)a3;
@end

@implementation MTRMediaPlaybackClusterActivateAudioTrackParams

- (MTRMediaPlaybackClusterActivateAudioTrackParams)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRMediaPlaybackClusterActivateAudioTrackParams;
  v2 = [(MTRMediaPlaybackClusterActivateAudioTrackParams *)&v9 init];
  v3 = v2;
  if (v2)
  {
    trackID = v2->_trackID;
    v2->_trackID = (NSString *)&stru_26F969DC8;

    audioOutputIndex = v3->_audioOutputIndex;
    v3->_audioOutputIndex = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaPlaybackClusterActivateAudioTrackParams);
  v7 = objc_msgSend_trackID(self, v5, v6);
  objc_msgSend_setTrackID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_audioOutputIndex(self, v9, v10);
  objc_msgSend_setAudioOutputIndex_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_timedInvokeTimeoutMs(self, v13, v14);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_serverSideProcessingTimeout(self, v17, v18);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: trackID:%@; audioOutputIndex:%@; >",
    v5,
    self->_trackID,
  v7 = self->_audioOutputIndex);

  return v7;
}

- (NSString)trackID
{
  return self->_trackID;
}

- (void)setTrackID:(id)a3
{
}

- (NSNumber)audioOutputIndex
{
  return self->_audioOutputIndex;
}

- (void)setAudioOutputIndex:(id)a3
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
  objc_storeStrong((id *)&self->_audioOutputIndex, 0);

  objc_storeStrong((id *)&self->_trackID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  long long v27 = 0uLL;
  char v28 = 0;
  v26[0] = 0;
  v26[1] = 0;
  v25 = v26;
  objc_msgSend_trackID(self, a3, (uint64_t)a4);
  id v7 = objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_UTF8String(v7, v8, v9);
  uint64_t v12 = objc_msgSend_lengthOfBytesUsingEncoding_(v7, v11, 4);
  sub_24479476C(v19, v10, v12);

  long long v27 = *(_OWORD *)v19;
  v15 = objc_msgSend_audioOutputIndex(self, v13, v14);
  char v28 = objc_msgSend_unsignedCharValue(v15, v16, v17);

  sub_244CC8F5C(0x62FuLL, 0, &v24);
  if (v24)
  {
    sub_244CB62B8((uint64_t)v19);
    v21 = 0;
    v22 = 0;
    v20 = &unk_26F9536C8;
    char v23 = 0;
    sub_2447945A0((uint64_t)&v20, &v24, 0);
    sub_244CB6318((uint64_t)v19, (uint64_t)&v20, 0xFFFFFFFF, (uint64_t)v29);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244834760((uint64_t)&v27, v19, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v19, &v24, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v24);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v20 = &unk_26F9536C8;
    sub_244794634(&v22);
    sub_244794634(&v21);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 28612;
  }
  sub_244794634(&v24);
  return (ChipError *)sub_24479466C((uint64_t)&v25);
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
    int v11 = 28641;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end