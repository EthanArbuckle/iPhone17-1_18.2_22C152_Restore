@interface MTRCameraAVStreamManagementClusterVideoStreamModifyParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution;
- (MTRCameraAVStreamManagementClusterVideoStreamModifyParams)init;
- (NSNumber)osdEnabled;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSNumber)videoStreamID;
- (NSNumber)watermarkEnabled;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setOsdEnabled:(id)a3;
- (void)setResolution:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
- (void)setVideoStreamID:(id)a3;
- (void)setWatermarkEnabled:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterVideoStreamModifyParams

- (MTRCameraAVStreamManagementClusterVideoStreamModifyParams)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTRCameraAVStreamManagementClusterVideoStreamModifyParams;
  v2 = [(MTRCameraAVStreamManagementClusterVideoStreamModifyParams *)&v11 init];
  v3 = v2;
  if (v2)
  {
    videoStreamID = v2->_videoStreamID;
    v2->_videoStreamID = (NSNumber *)&unk_26F9C8548;

    resolution = v3->_resolution;
    v3->_resolution = 0;

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
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamModifyParams);
  v7 = objc_msgSend_videoStreamID(self, v5, v6);
  objc_msgSend_setVideoStreamID_(v4, v8, (uint64_t)v7);

  objc_super v11 = objc_msgSend_resolution(self, v9, v10);
  objc_msgSend_setResolution_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_watermarkEnabled(self, v13, v14);
  objc_msgSend_setWatermarkEnabled_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_osdEnabled(self, v17, v18);
  objc_msgSend_setOsdEnabled_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: videoStreamID:%@; resolution:%@; watermarkEnabled:%@; osdEnabled:%@; >",
    v5,
    self->_videoStreamID,
    self->_resolution,
    self->_watermarkEnabled,
  v7 = self->_osdEnabled);

  return v7;
}

- (NSNumber)videoStreamID
{
  return self->_videoStreamID;
}

- (void)setVideoStreamID:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution
{
  return self->_resolution;
}

- (void)setResolution:(id)a3
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
  objc_storeStrong((id *)&self->_resolution, 0);

  objc_storeStrong((id *)&self->_videoStreamID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v50 = 0;
  char v51 = 0;
  LOBYTE(v53) = 0;
  LOBYTE(v54) = 0;
  v49[0] = 0;
  v49[1] = 0;
  v48 = v49;
  v7 = objc_msgSend_videoStreamID(self, a3, (uint64_t)a4);
  __int16 v50 = objc_msgSend_unsignedShortValue(v7, v8, v9);

  v12 = objc_msgSend_resolution(self, v10, v11);

  if (v12)
  {
    char v51 = 1;
    int v52 = 0;
    v15 = objc_msgSend_resolution(self, v13, v14);
    uint64_t v18 = objc_msgSend_width(v15, v16, v17);
    LOWORD(v52) = objc_msgSend_unsignedShortValue(v18, v19, v20);

    v23 = objc_msgSend_resolution(self, v21, v22);
    uint64_t v26 = objc_msgSend_height(v23, v24, v25);
    HIWORD(v52) = objc_msgSend_unsignedShortValue(v26, v27, v28);
  }
  v29 = objc_msgSend_watermarkEnabled(self, v13, v14);

  if (v29)
  {
    __int16 v53 = 1;
    v32 = objc_msgSend_watermarkEnabled(self, v30, v31);
    HIBYTE(v53) = objc_msgSend_BOOLValue(v32, v33, v34);
  }
  v35 = objc_msgSend_osdEnabled(self, v30, v31);

  if (v35)
  {
    __int16 v54 = 1;
    v38 = objc_msgSend_osdEnabled(self, v36, v37);
    HIBYTE(v54) = objc_msgSend_BOOLValue(v38, v39, v40);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v47);
  if (v47)
  {
    sub_244CB62B8((uint64_t)v42);
    v44 = 0;
    v45 = 0;
    v43 = &unk_26F9536C8;
    char v46 = 0;
    sub_2447945A0((uint64_t)&v43, &v47, 0);
    sub_244CB6318((uint64_t)v42, (uint64_t)&v43, 0xFFFFFFFF, (uint64_t)v55);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483DEE4(&v50, v42, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v42, &v47, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v47);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v43 = &unk_26F9536C8;
    sub_244794634(&v45);
    sub_244794634(&v44);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 32936;
  }
  sub_244794634(&v47);
  return (ChipError *)sub_24479466C((uint64_t)&v48);
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
    int v11 = 32965;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end