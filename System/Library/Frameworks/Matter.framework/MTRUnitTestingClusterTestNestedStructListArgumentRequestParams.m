@interface MTRUnitTestingClusterTestNestedStructListArgumentRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterNestedStructList)arg1;
- (MTRUnitTestingClusterTestNestedStructListArgumentRequestParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(MTRUnitTestingClusterNestedStructList *)arg1;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestNestedStructListArgumentRequestParams

- (MTRUnitTestingClusterTestNestedStructListArgumentRequestParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterTestNestedStructListArgumentRequestParams;
  v2 = [(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterNestedStructList *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams);
  v7 = objc_msgSend_arg1(self, v5, v6);
  objc_msgSend_setArg1_(v4, v8, (uint64_t)v7);

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
  v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: arg1:%@ >", v5, self->_arg1);;

  return v7;
}

- (MTRUnitTestingClusterNestedStructList)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterNestedStructList *)arg1
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

  objc_storeStrong((id *)&self->_arg1, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOWORD(v181) = 0;
  __int16 v182 = 0;
  char v183 = 0;
  int v187 = 0;
  uint64_t v188 = 0;
  LOBYTE(v189) = 0;
  long long v184 = 0u;
  long long v185 = 0u;
  char v186 = 0;
  long long v190 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v193 = 0u;
  v180[0] = 0;
  v180[1] = 0;
  v179 = v180;
  v5 = objc_msgSend_arg1(self, a3, (uint64_t)a4);
  objc_super v8 = objc_msgSend_a(v5, v6, v7);
  LOBYTE(v181) = objc_msgSend_unsignedCharValue(v8, v9, v10);

  v13 = objc_msgSend_arg1(self, v11, v12);
  v16 = objc_msgSend_b(v13, v14, v15);
  BYTE1(v181) = objc_msgSend_BOOLValue(v16, v17, v18);

  v21 = objc_msgSend_arg1(self, v19, v20);
  v24 = objc_msgSend_c(v21, v22, v23);
  v27 = objc_msgSend_a(v24, v25, v26);
  LOBYTE(v182) = objc_msgSend_unsignedCharValue(v27, v28, v29);

  v32 = objc_msgSend_arg1(self, v30, v31);
  v35 = objc_msgSend_c(v32, v33, v34);
  v38 = objc_msgSend_b(v35, v36, v37);
  HIBYTE(v182) = objc_msgSend_BOOLValue(v38, v39, v40);

  v43 = objc_msgSend_arg1(self, v41, v42);
  v46 = objc_msgSend_c(v43, v44, v45);
  v49 = objc_msgSend_c(v46, v47, v48);
  char v183 = objc_msgSend_unsignedCharValue(v49, v50, v51);

  v54 = objc_msgSend_arg1(self, v52, v53);
  v57 = objc_msgSend_c(v54, v55, v56);
  objc_msgSend_d(v57, v58, v59);
  id v60 = objc_claimAutoreleasedReturnValue();
  uint64_t v63 = objc_msgSend_bytes(v60, v61, v62);
  uint64_t v66 = objc_msgSend_length(v60, v64, v65);
  sub_2446C1098(v173, v63, v66);

  long long v184 = *(_OWORD *)v173;
  v69 = objc_msgSend_arg1(self, v67, v68);
  v72 = objc_msgSend_c(v69, v70, v71);
  objc_msgSend_e(v72, v73, v74);
  id v75 = objc_claimAutoreleasedReturnValue();
  uint64_t v78 = objc_msgSend_UTF8String(v75, v76, v77);
  uint64_t v80 = objc_msgSend_lengthOfBytesUsingEncoding_(v75, v79, 4);
  sub_24479476C(v173, v78, v80);

  long long v185 = *(_OWORD *)v173;
  v83 = objc_msgSend_arg1(self, v81, v82);
  v86 = objc_msgSend_c(v83, v84, v85);
  v89 = objc_msgSend_f(v86, v87, v88);
  char v186 = objc_msgSend_unsignedCharValue(v89, v90, v91);

  v94 = objc_msgSend_arg1(self, v92, v93);
  v97 = objc_msgSend_c(v94, v95, v96);
  v100 = objc_msgSend_g(v97, v98, v99);
  objc_msgSend_floatValue(v100, v101, v102);
  int v187 = v103;

  v106 = objc_msgSend_arg1(self, v104, v105);
  v109 = objc_msgSend_c(v106, v107, v108);
  v112 = objc_msgSend_h(v109, v110, v111);
  objc_msgSend_doubleValue(v112, v113, v114);
  uint64_t v188 = v115;

  v118 = objc_msgSend_arg1(self, v116, v117);
  v121 = objc_msgSend_c(v118, v119, v120);
  v124 = objc_msgSend_i(v121, v122, v123);

  if (v124)
  {
    __int16 v189 = 1;
    v127 = objc_msgSend_arg1(self, v125, v126);
    v130 = objc_msgSend_c(v127, v128, v129);
    v133 = objc_msgSend_i(v130, v131, v132);
    HIBYTE(v189) = objc_msgSend_unsignedCharValue(v133, v134, v135);
  }
  v136 = objc_msgSend_arg1(self, v125, v126);
  v139 = objc_msgSend_d(v136, v137, v138);
  uint64_t v142 = objc_msgSend_count(v139, v140, v141);

  if (v142) {
    operator new();
  }
  long long v190 = 0uLL;
  v145 = objc_msgSend_arg1(self, v143, v144);
  v148 = objc_msgSend_e(v145, v146, v147);
  uint64_t v151 = objc_msgSend_count(v148, v149, v150);

  if (v151) {
    operator new();
  }
  long long v191 = 0uLL;
  v154 = objc_msgSend_arg1(self, v152, v153);
  v157 = objc_msgSend_f(v154, v155, v156);
  uint64_t v160 = objc_msgSend_count(v157, v158, v159);

  if (v160) {
    operator new();
  }
  long long v192 = 0uLL;
  v163 = objc_msgSend_arg1(self, v161, v162);
  v166 = objc_msgSend_g(v163, v164, v165);
  uint64_t v169 = objc_msgSend_count(v166, v167, v168);

  if (v169) {
    operator new();
  }
  long long v193 = 0uLL;
  sub_244CC8F5C(0x62FuLL, 0, &v178);
  if (v178)
  {
    sub_244CB62B8((uint64_t)v173);
    v175 = 0;
    v176 = 0;
    v174 = &unk_26F9536C8;
    char v177 = 0;
    sub_2447945A0((uint64_t)&v174, &v178, 0);
    sub_244CB6318((uint64_t)v173, (uint64_t)&v174, 0xFFFFFFFF, (uint64_t)v194);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244846FAC(&v181, v173, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v173, &v178, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v178);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v174 = &unk_26F9536C8;
    sub_244794634(&v176);
    sub_244794634(&v175);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 38534;
  }
  sub_244794634(&v178);
  return (ChipError *)sub_24479466C((uint64_t)&v179);
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
    int v11 = 38563;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end