@interface MTRCameraAVStreamManagementClusterVideoStreamAllocateParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution;
- (MTRCameraAVStreamManagementClusterVideoStreamAllocateParams)init;
- (NSNumber)maxBitRate;
- (NSNumber)maxFragmentLen;
- (NSNumber)maxFrameRate;
- (NSNumber)minBitRate;
- (NSNumber)minFragmentLen;
- (NSNumber)minFrameRate;
- (NSNumber)osdEnabled;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)streamType;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)videoCodec;
- (NSNumber)watermarkEnabled;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaxBitRate:(id)a3;
- (void)setMaxFragmentLen:(id)a3;
- (void)setMaxFrameRate:(id)a3;
- (void)setMaxResolution:(id)a3;
- (void)setMinBitRate:(id)a3;
- (void)setMinFragmentLen:(id)a3;
- (void)setMinFrameRate:(id)a3;
- (void)setMinResolution:(id)a3;
- (void)setOsdEnabled:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVideoCodec:(id)a3;
- (void)setWatermarkEnabled:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterVideoStreamAllocateParams

- (MTRCameraAVStreamManagementClusterVideoStreamAllocateParams)init
{
  v21.receiver = self;
  v21.super_class = (Class)MTRCameraAVStreamManagementClusterVideoStreamAllocateParams;
  v2 = [(MTRCameraAVStreamManagementClusterVideoStreamAllocateParams *)&v21 init];
  v3 = v2;
  if (v2)
  {
    streamType = v2->_streamType;
    v2->_streamType = (NSNumber *)&unk_26F9C8548;

    videoCodec = v3->_videoCodec;
    v3->_videoCodec = (NSNumber *)&unk_26F9C8548;

    minFrameRate = v3->_minFrameRate;
    v3->_minFrameRate = (NSNumber *)&unk_26F9C8548;

    maxFrameRate = v3->_maxFrameRate;
    v3->_maxFrameRate = (NSNumber *)&unk_26F9C8548;

    uint64_t v8 = objc_opt_new();
    minResolution = v3->_minResolution;
    v3->_minResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v8;

    uint64_t v10 = objc_opt_new();
    maxResolution = v3->_maxResolution;
    v3->_maxResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v10;

    minBitRate = v3->_minBitRate;
    v3->_minBitRate = (NSNumber *)&unk_26F9C8548;

    maxBitRate = v3->_maxBitRate;
    v3->_maxBitRate = (NSNumber *)&unk_26F9C8548;

    minFragmentLen = v3->_minFragmentLen;
    v3->_minFragmentLen = (NSNumber *)&unk_26F9C8548;

    maxFragmentLen = v3->_maxFragmentLen;
    v3->_maxFragmentLen = (NSNumber *)&unk_26F9C8548;

    watermarkEnabled = v3->_watermarkEnabled;
    v3->_watermarkEnabled = 0;

    osdEnabled = v3->_osdEnabled;
    v3->_osdEnabled = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamAllocateParams);
  v7 = objc_msgSend_streamType(self, v5, v6);
  objc_msgSend_setStreamType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_videoCodec(self, v9, v10);
  objc_msgSend_setVideoCodec_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_minFrameRate(self, v13, v14);
  objc_msgSend_setMinFrameRate_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_maxFrameRate(self, v17, v18);
  objc_msgSend_setMaxFrameRate_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_minResolution(self, v21, v22);
  objc_msgSend_setMinResolution_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_maxResolution(self, v25, v26);
  objc_msgSend_setMaxResolution_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_minBitRate(self, v29, v30);
  objc_msgSend_setMinBitRate_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_maxBitRate(self, v33, v34);
  objc_msgSend_setMaxBitRate_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_minFragmentLen(self, v37, v38);
  objc_msgSend_setMinFragmentLen_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_maxFragmentLen(self, v41, v42);
  objc_msgSend_setMaxFragmentLen_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_watermarkEnabled(self, v45, v46);
  objc_msgSend_setWatermarkEnabled_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_osdEnabled(self, v49, v50);
  objc_msgSend_setOsdEnabled_(v4, v52, (uint64_t)v51);

  v55 = objc_msgSend_timedInvokeTimeoutMs(self, v53, v54);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v56, (uint64_t)v55);

  v59 = objc_msgSend_serverSideProcessingTimeout(self, v57, v58);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v60, (uint64_t)v59);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: streamType:%@; videoCodec:%@; minFrameRate:%@; maxFrameRate:%@; minResolution:%@; maxResolution:%@; minBitRate:%@; maxBitRate:%@; minFragmentLen:%@; maxFragmentLen:%@; watermarkEnabled:%@; osdEnabled:%@; >",
    v5,
    self->_streamType,
    self->_videoCodec,
    self->_minFrameRate,
    self->_maxFrameRate,
    self->_minResolution,
    self->_maxResolution,
    self->_minBitRate,
    self->_maxBitRate,
    self->_minFragmentLen,
    self->_maxFragmentLen,
    self->_watermarkEnabled,
  v7 = self->_osdEnabled);

  return v7;
}

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)videoCodec
{
  return self->_videoCodec;
}

- (void)setVideoCodec:(id)a3
{
}

- (NSNumber)minFrameRate
{
  return self->_minFrameRate;
}

- (void)setMinFrameRate:(id)a3
{
}

- (NSNumber)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution
{
  return self->_minResolution;
}

- (void)setMinResolution:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution
{
  return self->_maxResolution;
}

- (void)setMaxResolution:(id)a3
{
}

- (NSNumber)minBitRate
{
  return self->_minBitRate;
}

- (void)setMinBitRate:(id)a3
{
}

- (NSNumber)maxBitRate
{
  return self->_maxBitRate;
}

- (void)setMaxBitRate:(id)a3
{
}

- (NSNumber)minFragmentLen
{
  return self->_minFragmentLen;
}

- (void)setMinFragmentLen:(id)a3
{
}

- (NSNumber)maxFragmentLen
{
  return self->_maxFragmentLen;
}

- (void)setMaxFragmentLen:(id)a3
{
}

- (NSNumber)watermarkEnabled
{
  return self->_watermarkEnabled;
}

- (void)setWatermarkEnabled:(id)a3
{
}

- (NSNumber)osdEnabled
{
  return self->_osdEnabled;
}

- (void)setOsdEnabled:(id)a3
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
  objc_storeStrong((id *)&self->_osdEnabled, 0);
  objc_storeStrong((id *)&self->_watermarkEnabled, 0);
  objc_storeStrong((id *)&self->_maxFragmentLen, 0);
  objc_storeStrong((id *)&self->_minFragmentLen, 0);
  objc_storeStrong((id *)&self->_maxBitRate, 0);
  objc_storeStrong((id *)&self->_minBitRate, 0);
  objc_storeStrong((id *)&self->_maxResolution, 0);
  objc_storeStrong((id *)&self->_minResolution, 0);
  objc_storeStrong((id *)&self->_maxFrameRate, 0);
  objc_storeStrong((id *)&self->_minFrameRate, 0);
  objc_storeStrong((id *)&self->_videoCodec, 0);

  objc_storeStrong((id *)&self->_streamType, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v102) = 0;
  memset(v100, 0, 14);
  *(void *)v101 = 0;
  *(void *)&v101[5] = 0;
  v99[0] = 0;
  v99[1] = 0;
  v98 = v99;
  v7 = objc_msgSend_streamType(self, a3, (uint64_t)a4);
  LOBYTE(v100[0]) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_videoCodec(self, v10, v11);
  BYTE1(v100[0]) = objc_msgSend_unsignedCharValue(v12, v13, v14);

  v17 = objc_msgSend_minFrameRate(self, v15, v16);
  WORD1(v100[0]) = objc_msgSend_unsignedShortValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_maxFrameRate(self, v20, v21);
  WORD2(v100[0]) = objc_msgSend_unsignedShortValue(v22, v23, v24);

  v27 = objc_msgSend_minResolution(self, v25, v26);
  uint64_t v30 = objc_msgSend_width(v27, v28, v29);
  HIWORD(v100[0]) = objc_msgSend_unsignedShortValue(v30, v31, v32);

  v35 = objc_msgSend_minResolution(self, v33, v34);
  uint64_t v38 = objc_msgSend_height(v35, v36, v37);
  LOWORD(v100[1]) = objc_msgSend_unsignedShortValue(v38, v39, v40);

  v43 = objc_msgSend_maxResolution(self, v41, v42);
  uint64_t v46 = objc_msgSend_width(v43, v44, v45);
  WORD1(v100[1]) = objc_msgSend_unsignedShortValue(v46, v47, v48);

  v51 = objc_msgSend_maxResolution(self, v49, v50);
  uint64_t v54 = objc_msgSend_height(v51, v52, v53);
  WORD2(v100[1]) = objc_msgSend_unsignedShortValue(v54, v55, v56);

  v59 = objc_msgSend_minBitRate(self, v57, v58);
  *(_DWORD *)v101 = objc_msgSend_unsignedIntValue(v59, v60, v61);

  v64 = objc_msgSend_maxBitRate(self, v62, v63);
  *(_DWORD *)&v101[4] = objc_msgSend_unsignedIntValue(v64, v65, v66);

  v69 = objc_msgSend_minFragmentLen(self, v67, v68);
  *(_WORD *)&v101[8] = objc_msgSend_unsignedShortValue(v69, v70, v71);

  v74 = objc_msgSend_maxFragmentLen(self, v72, v73);
  *(_WORD *)&v101[10] = objc_msgSend_unsignedShortValue(v74, v75, v76);

  v79 = objc_msgSend_watermarkEnabled(self, v77, v78);

  if (v79)
  {
    *(_WORD *)&v101[12] = 1;
    v82 = objc_msgSend_watermarkEnabled(self, v80, v81);
    v101[13] = objc_msgSend_BOOLValue(v82, v83, v84);
  }
  v85 = objc_msgSend_osdEnabled(self, v80, v81);

  if (v85)
  {
    __int16 v102 = 1;
    v88 = objc_msgSend_osdEnabled(self, v86, v87);
    HIBYTE(v102) = objc_msgSend_BOOLValue(v88, v89, v90);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v97);
  if (v97)
  {
    sub_244CB62B8((uint64_t)v92);
    v94 = 0;
    v95 = 0;
    v93 = &unk_26F9536C8;
    char v96 = 0;
    sub_2447945A0((uint64_t)&v93, &v97, 0);
    sub_244CB6318((uint64_t)v92, (uint64_t)&v93, 0xFFFFFFFF, (uint64_t)v103);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483D920(v100, v92, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v92, &v97, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v97);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v93 = &unk_26F9536C8;
    sub_244794634(&v95);
    sub_244794634(&v94);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 32750;
  }
  sub_244794634(&v97);
  return (ChipError *)sub_24479466C((uint64_t)&v98);
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
    int v11 = 32779;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end