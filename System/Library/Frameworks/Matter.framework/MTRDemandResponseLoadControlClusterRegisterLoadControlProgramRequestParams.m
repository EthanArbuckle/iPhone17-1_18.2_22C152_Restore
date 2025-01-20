@interface MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)loadControlProgram;
- (MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLoadControlProgram:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams

- (MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams;
  v2 = [(MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    loadControlProgram = v2->_loadControlProgram;
    v2->_loadControlProgram = (MTRDemandResponseLoadControlClusterLoadControlProgramStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterRegisterLoadControlProgramRequestParams);
  v7 = objc_msgSend_loadControlProgram(self, v5, v6);
  objc_msgSend_setLoadControlProgram_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: loadControlProgram:%@ >", v5, self->_loadControlProgram);;

  return v7;
}

- (MTRDemandResponseLoadControlClusterLoadControlProgramStruct)loadControlProgram
{
  return self->_loadControlProgram;
}

- (void)setLoadControlProgram:(id)a3
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

  objc_storeStrong((id *)&self->_loadControlProgram, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  memset(v75, 0, sizeof(v75));
  v74[0] = 0;
  v74[1] = 0;
  v73 = v74;
  v7 = objc_msgSend_loadControlProgram(self, a3, (uint64_t)a4);
  objc_msgSend_programID(v7, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend_bytes(v10, v11, v12);
  uint64_t v16 = objc_msgSend_length(v10, v14, v15);
  sub_2446C1098(v67, v13, v16);

  *(_OWORD *)v75 = *(_OWORD *)v67;
  v19 = objc_msgSend_loadControlProgram(self, v17, v18);
  objc_msgSend_name(v19, v20, v21);
  id v22 = objc_claimAutoreleasedReturnValue();
  uint64_t v25 = objc_msgSend_UTF8String(v22, v23, v24);
  uint64_t v27 = objc_msgSend_lengthOfBytesUsingEncoding_(v22, v26, 4);
  sub_24479476C(v67, v25, v27);

  *(_OWORD *)&v75[16] = *(_OWORD *)v67;
  v30 = objc_msgSend_loadControlProgram(self, v28, v29);
  v33 = objc_msgSend_enrollmentGroup(v30, v31, v32);

  if (v33)
  {
    *(_WORD *)&v75[32] = 256;
    v36 = objc_msgSend_loadControlProgram(self, v34, v35);
    v39 = objc_msgSend_enrollmentGroup(v36, v37, v38);
    v75[32] = objc_msgSend_unsignedCharValue(v39, v40, v41);
  }
  v42 = objc_msgSend_loadControlProgram(self, v34, v35);
  v45 = objc_msgSend_randomStartMinutes(v42, v43, v44);

  if (v45)
  {
    *(_WORD *)&v75[34] = 256;
    v48 = objc_msgSend_loadControlProgram(self, v46, v47);
    v51 = objc_msgSend_randomStartMinutes(v48, v49, v50);
    v75[34] = objc_msgSend_unsignedCharValue(v51, v52, v53);
  }
  v54 = objc_msgSend_loadControlProgram(self, v46, v47);
  v57 = objc_msgSend_randomDurationMinutes(v54, v55, v56);

  if (v57)
  {
    *(_WORD *)&v75[36] = 256;
    v60 = objc_msgSend_loadControlProgram(self, v58, v59);
    v63 = objc_msgSend_randomDurationMinutes(v60, v61, v62);
    v75[36] = objc_msgSend_unsignedCharValue(v63, v64, v65);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v72);
  if (v72)
  {
    sub_244CB62B8((uint64_t)v67);
    v69 = 0;
    v70 = 0;
    v68 = &unk_26F9536C8;
    char v71 = 0;
    sub_2447945A0((uint64_t)&v68, &v72, 0);
    sub_244CB6318((uint64_t)v67, (uint64_t)&v68, 0xFFFFFFFF, (uint64_t)v76);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244817444((uint64_t)v75, v67, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v67, &v72, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v72);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v68 = &unk_26F9536C8;
    sub_244794634(&v70);
    sub_244794634(&v69);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 16140;
  }
  sub_244794634(&v72);
  return (ChipError *)sub_24479466C((uint64_t)&v73);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
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
    int v11 = 16169;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end