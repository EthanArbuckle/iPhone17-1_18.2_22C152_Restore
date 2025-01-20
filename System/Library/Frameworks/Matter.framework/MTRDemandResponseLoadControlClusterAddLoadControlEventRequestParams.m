@interface MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams)init;
- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)event;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setEvent:(id)a3;
- (void)setServerSideProcessingTimeout:(id)a3;
- (void)setTimedInvokeTimeoutMs:(id)a3;
@end

@implementation MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams

- (MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams;
  v2 = [(MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    event = v2->_event;
    v2->_event = (MTRDemandResponseLoadControlClusterLoadControlEventStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRDemandResponseLoadControlClusterAddLoadControlEventRequestParams);
  v7 = objc_msgSend_event(self, v5, v6);
  objc_msgSend_setEvent_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: event:%@ >", v5, self->_event);;

  return v7;
}

- (MTRDemandResponseLoadControlClusterLoadControlEventStruct)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
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

  objc_storeStrong((id *)&self->_event, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  char v101 = 0;
  __int16 v102 = 0;
  int v103 = 0;
  LOBYTE(v104) = 0;
  char v105 = 0;
  LOBYTE(v106) = 0;
  char v107 = 0;
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  long long v99 = 0uLL;
  LOBYTE(v100) = 0;
  v98[0] = 0;
  v98[1] = 0;
  v97 = v98;
  v5 = objc_msgSend_event(self, a3, (uint64_t)a4);
  objc_msgSend_eventID(v5, v6, v7);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_bytes(v8, v9, v10);
  uint64_t v14 = objc_msgSend_length(v8, v12, v13);
  sub_2446C1098(v91, v11, v14);

  long long v99 = *(_OWORD *)v91;
  v17 = objc_msgSend_event(self, v15, v16);
  v20 = objc_msgSend_programID(v17, v18, v19);

  if (v20)
  {
    long long v100 = 0uLL;
    char v101 = 1;
    v23 = objc_msgSend_event(self, v21, v22);
    objc_msgSend_programID(v23, v24, v25);
    id v26 = objc_claimAutoreleasedReturnValue();
    uint64_t v29 = objc_msgSend_bytes(v26, v27, v28);
    uint64_t v32 = objc_msgSend_length(v26, v30, v31);
    sub_2446C1098(v91, v29, v32);

    long long v100 = *(_OWORD *)v91;
  }
  v33 = objc_msgSend_event(self, v21, v22);
  v36 = objc_msgSend_control(v33, v34, v35);
  __int16 v102 = objc_msgSend_unsignedShortValue(v36, v37, v38);

  v41 = objc_msgSend_event(self, v39, v40);
  v44 = objc_msgSend_deviceClass(v41, v42, v43);
  int v103 = objc_msgSend_unsignedIntValue(v44, v45, v46);

  v49 = objc_msgSend_event(self, v47, v48);
  v52 = objc_msgSend_enrollmentGroup(v49, v50, v51);

  if (v52)
  {
    __int16 v104 = 1;
    v55 = objc_msgSend_event(self, v53, v54);
    v58 = objc_msgSend_enrollmentGroup(v55, v56, v57);
    HIBYTE(v104) = objc_msgSend_unsignedCharValue(v58, v59, v60);
  }
  v61 = objc_msgSend_event(self, v53, v54);
  v64 = objc_msgSend_criticality(v61, v62, v63);
  char v105 = objc_msgSend_unsignedCharValue(v64, v65, v66);

  v69 = objc_msgSend_event(self, v67, v68);
  v72 = objc_msgSend_startTime(v69, v70, v71);

  if (v72)
  {
    int v106 = 0;
    char v107 = 1;
    v75 = objc_msgSend_event(self, v73, v74);
    v78 = objc_msgSend_startTime(v75, v76, v77);
    int v106 = objc_msgSend_unsignedIntValue(v78, v79, v80);
  }
  v81 = objc_msgSend_event(self, v73, v74);
  v84 = objc_msgSend_transitions(v81, v82, v83);
  uint64_t v87 = objc_msgSend_count(v84, v85, v86);

  if (v87) {
    operator new();
  }
  uint64_t v108 = 0;
  uint64_t v109 = 0;
  sub_244CC8F5C(0x62FuLL, 0, &v96);
  if (v96)
  {
    sub_244CB62B8((uint64_t)v91);
    v93 = 0;
    v94 = 0;
    v92 = &unk_26F9536C8;
    char v95 = 0;
    sub_2447945A0((uint64_t)&v92, &v96, 0);
    sub_244CB6318((uint64_t)v91, (uint64_t)&v92, 0xFFFFFFFF, (uint64_t)v110);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244817728((uint64_t)&v99, v91, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v91, &v96, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v96);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v92 = &unk_26F9536C8;
    sub_244794634(&v94);
    sub_244794634(&v93);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 16395;
  }
  sub_244794634(&v96);
  return (ChipError *)sub_24479466C((uint64_t)&v97);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  v15 = 0;
  long long v12 = 0uLL;
  uint64_t v13 = 0;
  objc_msgSend__encodeToTLVReader_(self, v6, (uint64_t)v14, v5);
  uint64_t v7 = sub_2447D5B3C((uint64_t)v14, 0);
  id v8 = (void *)v7;
  if (a3 && !v7)
  {
    LODWORD(v10) = 3;
    *((void *)&v10 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHI"
                            "P/zap-generated/MTRCommandPayloadsObjc.mm";
    int v11 = 16424;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end