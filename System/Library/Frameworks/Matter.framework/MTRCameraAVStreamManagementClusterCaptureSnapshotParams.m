@interface MTRCameraAVStreamManagementClusterCaptureSnapshotParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRCameraAVStreamManagementClusterCaptureSnapshotParams)init;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)requestedResolution;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)snapshotStreamID;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setRequestedResolution:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setSnapshotStreamID:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterCaptureSnapshotParams

- (MTRCameraAVStreamManagementClusterCaptureSnapshotParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRCameraAVStreamManagementClusterCaptureSnapshotParams;
  v2 = [(MTRCameraAVStreamManagementClusterCaptureSnapshotParams *)&v10 init];
  v3 = v2;
  if (v2)
  {
    snapshotStreamID = v2->_snapshotStreamID;
    v2->_snapshotStreamID = (NSNumber *)&unk_26F9C8548;

    uint64_t v5 = objc_opt_new();
    requestedResolution = v3->_requestedResolution;
    v3->_requestedResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v5;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterCaptureSnapshotParams);
  v7 = objc_msgSend_snapshotStreamID(self, v5, v6);
  objc_msgSend_setSnapshotStreamID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_requestedResolution(self, v9, v10);
  objc_msgSend_setRequestedResolution_(v4, v12, (uint64_t)v11);

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
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: snapshotStreamID:%@; requestedResolution:%@; >",
    v5,
    self->_snapshotStreamID,
  v7 = self->_requestedResolution);

  return v7;
}

- (NSNumber)snapshotStreamID
{
  return self->_snapshotStreamID;
}

- (void)setSnapshotStreamID:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)requestedResolution
{
  return self->_requestedResolution;
}

- (void)setRequestedResolution:(id)a3
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
  objc_storeStrong((id *)&self->_requestedResolution, 0);

  objc_storeStrong((id *)&self->_snapshotStreamID, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  int v35 = 0;
  __int16 v36 = 0;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  v7 = objc_msgSend_snapshotStreamID(self, a3, (uint64_t)a4);
  LOWORD(v35) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  v12 = objc_msgSend_requestedResolution(self, v10, v11);
  v15 = objc_msgSend_width(v12, v13, v14);
  HIWORD(v35) = objc_msgSend_unsignedShortValue(v15, v16, v17);

  v20 = objc_msgSend_requestedResolution(self, v18, v19);
  v23 = objc_msgSend_height(v20, v21, v22);
  __int16 v36 = objc_msgSend_unsignedShortValue(v23, v24, v25);

  sub_244CC8F5C(0x62FuLL, 0, &v32);
  if (v32)
  {
    sub_244CB62B8((uint64_t)v27);
    v29 = 0;
    v30 = 0;
    v28 = &unk_26F9536C8;
    char v31 = 0;
    sub_2447945A0((uint64_t)&v28, &v32, 0);
    sub_244CB6318((uint64_t)v27, (uint64_t)&v28, 0xFFFFFFFF, (uint64_t)v37);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24483E948(v27, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v27, &v32, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v32);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v28 = &unk_26F9536C8;
    sub_244794634(&v30);
    sub_244794634(&v29);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 33470;
  }
  sub_244794634(&v32);
  return (ChipError *)sub_24479466C((uint64_t)&v33);
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
    int v11 = 33499;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end