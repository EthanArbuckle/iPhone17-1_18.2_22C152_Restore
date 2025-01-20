@interface MTRGroupKeyManagementClusterKeySetWriteParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRGroupKeyManagementClusterGroupKeySetStruct)groupKeySet;
- (MTRGroupKeyManagementClusterKeySetWriteParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setGroupKeySet:(MTRGroupKeyManagementClusterGroupKeySetStruct *)groupKeySet;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRGroupKeyManagementClusterKeySetWriteParams

- (MTRGroupKeyManagementClusterKeySetWriteParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRGroupKeyManagementClusterKeySetWriteParams;
  v2 = [(MTRGroupKeyManagementClusterKeySetWriteParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    groupKeySet = v2->_groupKeySet;
    v2->_groupKeySet = (MTRGroupKeyManagementClusterGroupKeySetStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRGroupKeyManagementClusterKeySetWriteParams);
  v7 = objc_msgSend_groupKeySet(self, v5, v6);
  objc_msgSend_setGroupKeySet_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: groupKeySet:%@ >", v5, self->_groupKeySet);;

  return v7;
}

- (MTRGroupKeyManagementClusterGroupKeySetStruct)groupKeySet
{
  return self->_groupKeySet;
}

- (void)setGroupKeySet:(MTRGroupKeyManagementClusterGroupKeySetStruct *)groupKeySet
{
}

- (NSNumber)timedInvokeTimeoutMs
{
  return self->_timedInvokeTimeoutMs;
}

- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs
{
}

- (NSNumber)serverSideProcessingTimeout
{
  return self->_serverSideProcessingTimeout;
}

- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverSideProcessingTimeout, 0);
  objc_storeStrong((id *)&self->_timedInvokeTimeoutMs, 0);

  objc_storeStrong((id *)&self->_groupKeySet, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  __int16 v116 = 0;
  char v117 = 0;
  LOBYTE(v118) = 0;
  char v119 = 0;
  LOBYTE(v120) = 0;
  char v121 = 0;
  LOBYTE(v122) = 0;
  char v123 = 0;
  LOBYTE(v124) = 0;
  char v125 = 0;
  LOBYTE(v126) = 0;
  char v127 = 0;
  LOBYTE(v128) = 0;
  char v129 = 0;
  v115[0] = 0;
  v115[1] = 0;
  v114 = v115;
  v7 = objc_msgSend_groupKeySet(self, a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_groupKeySetID(v7, v8, v9);
  __int16 v116 = objc_msgSend_unsignedShortValue(v10, v11, v12);

  v15 = objc_msgSend_groupKeySet(self, v13, v14);
  v18 = objc_msgSend_groupKeySecurityPolicy(v15, v16, v17);
  char v117 = objc_msgSend_unsignedCharValue(v18, v19, v20);

  v23 = objc_msgSend_groupKeySet(self, v21, v22);
  v26 = objc_msgSend_epochKey0(v23, v24, v25);

  if (v26)
  {
    long long v118 = 0uLL;
    char v119 = 1;
    v29 = objc_msgSend_groupKeySet(self, v27, v28);
    objc_msgSend_epochKey0(v29, v30, v31);
    id v32 = objc_claimAutoreleasedReturnValue();
    uint64_t v35 = objc_msgSend_bytes(v32, v33, v34);
    uint64_t v38 = objc_msgSend_length(v32, v36, v37);
    sub_2446C1098(v108, v35, v38);

    long long v118 = *(_OWORD *)v108;
  }
  v39 = objc_msgSend_groupKeySet(self, v27, v28);
  v42 = objc_msgSend_epochStartTime0(v39, v40, v41);

  if (v42)
  {
    uint64_t v120 = 0;
    char v121 = 1;
    v45 = objc_msgSend_groupKeySet(self, v43, v44);
    v48 = objc_msgSend_epochStartTime0(v45, v46, v47);
    uint64_t v120 = objc_msgSend_unsignedLongLongValue(v48, v49, v50);
  }
  v51 = objc_msgSend_groupKeySet(self, v43, v44);
  v54 = objc_msgSend_epochKey1(v51, v52, v53);

  if (v54)
  {
    long long v122 = 0uLL;
    char v123 = 1;
    v57 = objc_msgSend_groupKeySet(self, v55, v56);
    objc_msgSend_epochKey1(v57, v58, v59);
    id v60 = objc_claimAutoreleasedReturnValue();
    uint64_t v63 = objc_msgSend_bytes(v60, v61, v62);
    uint64_t v66 = objc_msgSend_length(v60, v64, v65);
    sub_2446C1098(v108, v63, v66);

    long long v122 = *(_OWORD *)v108;
  }
  v67 = objc_msgSend_groupKeySet(self, v55, v56);
  v70 = objc_msgSend_epochStartTime1(v67, v68, v69);

  if (v70)
  {
    uint64_t v124 = 0;
    char v125 = 1;
    v73 = objc_msgSend_groupKeySet(self, v71, v72);
    v76 = objc_msgSend_epochStartTime1(v73, v74, v75);
    uint64_t v124 = objc_msgSend_unsignedLongLongValue(v76, v77, v78);
  }
  v79 = objc_msgSend_groupKeySet(self, v71, v72);
  v82 = objc_msgSend_epochKey2(v79, v80, v81);

  if (v82)
  {
    long long v126 = 0uLL;
    char v127 = 1;
    v85 = objc_msgSend_groupKeySet(self, v83, v84);
    objc_msgSend_epochKey2(v85, v86, v87);
    id v88 = objc_claimAutoreleasedReturnValue();
    uint64_t v91 = objc_msgSend_bytes(v88, v89, v90);
    uint64_t v94 = objc_msgSend_length(v88, v92, v93);
    sub_2446C1098(v108, v91, v94);

    long long v126 = *(_OWORD *)v108;
  }
  v95 = objc_msgSend_groupKeySet(self, v83, v84);
  v98 = objc_msgSend_epochStartTime2(v95, v96, v97);

  if (v98)
  {
    uint64_t v128 = 0;
    char v129 = 1;
    v101 = objc_msgSend_groupKeySet(self, v99, v100);
    v104 = objc_msgSend_epochStartTime2(v101, v102, v103);
    uint64_t v128 = objc_msgSend_unsignedLongLongValue(v104, v105, v106);
  }
  sub_244CC8F5C(0x62FuLL, 0, &v113);
  if (v113)
  {
    sub_244CB62B8((uint64_t)v108);
    v110 = 0;
    v111 = 0;
    v109 = &unk_26F9536C8;
    char v112 = 0;
    sub_2447945A0((uint64_t)&v109, &v113, 0);
    sub_244CB6318((uint64_t)v108, (uint64_t)&v109, 0xFFFFFFFF, (uint64_t)v130);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_24480A4BC((uint64_t)&v116, v108, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v108, &v113, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v113);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v109 = &unk_26F9536C8;
    sub_244794634(&v111);
    sub_244794634(&v110);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 9933;
  }
  sub_244794634(&v113);
  return (ChipError *)sub_24479466C((uint64_t)&v114);
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
    int v11 = 9962;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end