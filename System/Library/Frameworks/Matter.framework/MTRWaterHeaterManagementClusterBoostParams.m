@interface MTRWaterHeaterManagementClusterBoostParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRWaterHeaterManagementClusterBoostParams)init;
- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)boostInfo;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBoostInfo:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRWaterHeaterManagementClusterBoostParams

- (MTRWaterHeaterManagementClusterBoostParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRWaterHeaterManagementClusterBoostParams;
  v2 = [(MTRWaterHeaterManagementClusterBoostParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    boostInfo = v2->_boostInfo;
    v2->_boostInfo = (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWaterHeaterManagementClusterBoostParams);
  v7 = objc_msgSend_boostInfo(self, v5, v6);
  objc_msgSend_setBoostInfo_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_timedInvokeTimeoutMs(self, v9, v10);
  objc_msgSend_setTimedInvokeTimeoutMs_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_serverSideProcessingTimeout(self, v13, v14);
  objc_msgSend_setServerSideProcessingTimeout_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: boostInfo:%@ >", v5, self->_boostInfo);;

  return v7;
}

- (MTRWaterHeaterManagementClusterWaterHeaterBoostInfoStruct)boostInfo
{
  return self->_boostInfo;
}

- (void)setBoostInfo:(id)a3
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

  objc_storeStrong((id *)&self->_boostInfo, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  int v84 = 0;
  LOBYTE(v85) = 0;
  LOBYTE(v86) = 0;
  char v87 = 0;
  LOBYTE(v89) = 0;
  LOBYTE(v90) = 0;
  v83[0] = 0;
  v83[1] = 0;
  v82 = v83;
  v7 = objc_msgSend_boostInfo(self, a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_duration(v7, v8, v9);
  int v84 = objc_msgSend_unsignedIntValue(v10, v11, v12);

  v15 = objc_msgSend_boostInfo(self, v13, v14);
  v18 = objc_msgSend_oneShot(v15, v16, v17);

  if (v18)
  {
    __int16 v85 = 1;
    v21 = objc_msgSend_boostInfo(self, v19, v20);
    v24 = objc_msgSend_oneShot(v21, v22, v23);
    HIBYTE(v85) = objc_msgSend_BOOLValue(v24, v25, v26);
  }
  v27 = objc_msgSend_boostInfo(self, v19, v20);
  v30 = objc_msgSend_emergencyBoost(v27, v28, v29);

  if (v30)
  {
    __int16 v86 = 1;
    v33 = objc_msgSend_boostInfo(self, v31, v32);
    v36 = objc_msgSend_emergencyBoost(v33, v34, v35);
    HIBYTE(v86) = objc_msgSend_BOOLValue(v36, v37, v38);
  }
  v39 = objc_msgSend_boostInfo(self, v31, v32);
  v42 = objc_msgSend_temporarySetpoint(v39, v40, v41);

  if (v42)
  {
    char v87 = 1;
    __int16 v88 = 0;
    v45 = objc_msgSend_boostInfo(self, v43, v44);
    v48 = objc_msgSend_temporarySetpoint(v45, v46, v47);
    __int16 v88 = objc_msgSend_shortValue(v48, v49, v50);
  }
  v51 = objc_msgSend_boostInfo(self, v43, v44);
  v54 = objc_msgSend_targetPercentage(v51, v52, v53);

  if (v54)
  {
    __int16 v89 = 1;
    v57 = objc_msgSend_boostInfo(self, v55, v56);
    v60 = objc_msgSend_targetPercentage(v57, v58, v59);
    HIBYTE(v89) = objc_msgSend_unsignedCharValue(v60, v61, v62);
  }
  v63 = objc_msgSend_boostInfo(self, v55, v56);
  v66 = objc_msgSend_targetReheat(v63, v64, v65);

  if (v66)
  {
    __int16 v90 = 1;
    v69 = objc_msgSend_boostInfo(self, v67, v68);
    v72 = objc_msgSend_targetReheat(v69, v70, v71);
    HIBYTE(v90) = objc_msgSend_unsignedCharValue(v72, v73, v74);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v81);
  if (v81)
  {
    sub_244CB62B8((uint64_t)v76);
    v78 = 0;
    v79 = 0;
    v77 = &unk_26F9536C8;
    char v80 = 0;
    sub_2447945A0((uint64_t)&v77, &v81, 0);
    sub_244CB6318((uint64_t)v76, (uint64_t)&v77, 0xFFFFFFFF, (uint64_t)v91);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244815AC4(&v84, v76, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v76, &v81, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v81);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v77 = &unk_26F9536C8;
    sub_244794634(&v79);
    sub_244794634(&v78);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 15969;
  }
  sub_244794634(&v81);
  return (ChipError *)sub_24479466C((uint64_t)&v82);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  objc_super v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 15998;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end