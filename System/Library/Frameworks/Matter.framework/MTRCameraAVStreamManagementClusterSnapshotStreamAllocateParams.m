@interface MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams)init;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution;
- (NSNumber)bitRate;
- (NSNumber)frameRate;
- (NSNumber)imageCodec;
- (NSNumber)quality;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBitRate:(id)a3;
- (void)setFrameRate:(id)a3;
- (void)setImageCodec:(id)a3;
- (void)setMaxResolution:(id)a3;
- (void)setMinResolution:(id)a3;
- (void)setQuality:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams

- (MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams;
  v2 = [(MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams *)&v15 init];
  v3 = v2;
  if (v2)
  {
    imageCodec = v2->_imageCodec;
    v2->_imageCodec = (NSNumber *)&unk_26F9C8548;

    frameRate = v3->_frameRate;
    v3->_frameRate = (NSNumber *)&unk_26F9C8548;

    bitRate = v3->_bitRate;
    v3->_bitRate = (NSNumber *)&unk_26F9C8548;

    uint64_t v7 = objc_opt_new();
    minResolution = v3->_minResolution;
    v3->_minResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v7;

    uint64_t v9 = objc_opt_new();
    maxResolution = v3->_maxResolution;
    v3->_maxResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v9;

    quality = v3->_quality;
    v3->_quality = (NSNumber *)&unk_26F9C8548;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterSnapshotStreamAllocateParams);
  uint64_t v7 = objc_msgSend_imageCodec(self, v5, v6);
  objc_msgSend_setImageCodec_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_frameRate(self, v9, v10);
  objc_msgSend_setFrameRate_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_bitRate(self, v13, v14);
  objc_msgSend_setBitRate_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_minResolution(self, v17, v18);
  objc_msgSend_setMinResolution_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_maxResolution(self, v21, v22);
  objc_msgSend_setMaxResolution_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_quality(self, v25, v26);
  objc_msgSend_setQuality_(v4, v28, (uint64_t)v27);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: imageCodec:%@; frameRate:%@; bitRate:%@; minResolution:%@; maxResolution:%@; quality:%@; >",
    v5,
    self->_imageCodec,
    self->_frameRate,
    self->_bitRate,
    self->_minResolution,
    self->_maxResolution,
  uint64_t v7 = self->_quality);

  return v7;
}

- (NSNumber)imageCodec
{
  return self->_imageCodec;
}

- (void)setImageCodec:(id)a3
{
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(id)a3
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

- (NSNumber)quality
{
  return self->_quality;
}

- (void)setQuality:(id)a3
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
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_maxResolution, 0);
  objc_storeStrong((id *)&self->_minResolution, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);

  objc_storeStrong((id *)&self->_imageCodec, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v66[0]) = 0;
  memset((char *)v66 + 2, 0, 15);
  v65[0] = 0;
  v65[1] = 0;
  v64 = v65;
  uint64_t v7 = objc_msgSend_imageCodec(self, a3, (uint64_t)a4);
  LOBYTE(v66[0]) = objc_msgSend_unsignedCharValue(v7, v8, v9);

  v12 = objc_msgSend_frameRate(self, v10, v11);
  HIWORD(v66[0]) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  v17 = objc_msgSend_bitRate(self, v15, v16);
  v66[1] = objc_msgSend_unsignedIntValue(v17, v18, v19);

  uint64_t v22 = objc_msgSend_minResolution(self, v20, v21);
  v25 = objc_msgSend_width(v22, v23, v24);
  LOWORD(v66[2]) = objc_msgSend_unsignedShortValue(v25, v26, v27);

  uint64_t v30 = objc_msgSend_minResolution(self, v28, v29);
  v33 = objc_msgSend_height(v30, v31, v32);
  HIWORD(v66[2]) = objc_msgSend_unsignedShortValue(v33, v34, v35);

  v38 = objc_msgSend_maxResolution(self, v36, v37);
  v41 = objc_msgSend_width(v38, v39, v40);
  LOWORD(v66[3]) = objc_msgSend_unsignedShortValue(v41, v42, v43);

  v46 = objc_msgSend_maxResolution(self, v44, v45);
  v49 = objc_msgSend_height(v46, v47, v48);
  HIWORD(v66[3]) = objc_msgSend_unsignedShortValue(v49, v50, v51);

  v54 = objc_msgSend_quality(self, v52, v53);
  LOBYTE(v66[4]) = objc_msgSend_unsignedCharValue(v54, v55, v56);

  sub_244CC8F5C(0x62FuLL, 0, &v63);
  if (v63)
  {
    sub_244CB62B8((uint64_t)v58);
    v60 = 0;
    v61 = 0;
    v59 = &unk_26F9536C8;
    char v62 = 0;
    sub_2447945A0((uint64_t)&v59, &v63, 0);
    sub_244CB6318((uint64_t)v58, (uint64_t)&v59, 0xFFFFFFFF, (uint64_t)v67);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483E2A8(v66, v58, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v58, &v63, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v63);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v59 = &unk_26F9536C8;
    sub_244794634(&v61);
    sub_244794634(&v60);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 33126;
  }
  sub_244794634(&v63);
  return (ChipError *)sub_24479466C((uint64_t)&v64);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  objc_super v15 = 0;
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
    int v11 = 33155;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end