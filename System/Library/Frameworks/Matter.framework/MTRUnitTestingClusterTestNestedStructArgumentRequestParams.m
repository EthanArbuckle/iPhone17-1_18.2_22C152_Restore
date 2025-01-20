@interface MTRUnitTestingClusterTestNestedStructArgumentRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterNestedStruct)arg1;
- (MTRUnitTestingClusterTestNestedStructArgumentRequestParams)init;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setArg1:(MTRUnitTestingClusterNestedStruct *)arg1;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestNestedStructArgumentRequestParams

- (MTRUnitTestingClusterTestNestedStructArgumentRequestParams)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRUnitTestingClusterTestNestedStructArgumentRequestParams;
  v2 = [(MTRUnitTestingClusterTestNestedStructArgumentRequestParams *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    arg1 = v2->_arg1;
    v2->_arg1 = (MTRUnitTestingClusterNestedStruct *)v3;

    timedInvokeTimeoutMs = v2->_timedInvokeTimeoutMs;
    v2->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v2->_serverSideProcessingTimeout;
    v2->_serverSideProcessingTimeout = 0;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructArgumentRequestParams);
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

- (MTRUnitTestingClusterNestedStruct)arg1
{
  return self->_arg1;
}

- (void)setArg1:(MTRUnitTestingClusterNestedStruct *)arg1
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
  __int16 v212 = 0;
  __int16 v213 = 0;
  char v214 = 0;
  int v218 = 0;
  uint64_t v219 = 0;
  LOBYTE(v220) = 0;
  long long v215 = 0u;
  long long v216 = 0u;
  char v217 = 0;
  char v221 = 0;
  v211[0] = 0;
  v211[1] = 0;
  v210 = v211;
  v7 = objc_msgSend_arg1(self, a3, (uint64_t)a4);
  uint64_t v10 = objc_msgSend_a(v7, v8, v9);
  LOBYTE(v212) = objc_msgSend_unsignedCharValue(v10, v11, v12);

  v15 = objc_msgSend_arg1(self, v13, v14);
  v18 = objc_msgSend_b(v15, v16, v17);
  HIBYTE(v212) = objc_msgSend_BOOLValue(v18, v19, v20);

  v23 = objc_msgSend_arg1(self, v21, v22);
  v26 = objc_msgSend_c(v23, v24, v25);
  v29 = objc_msgSend_a(v26, v27, v28);
  LOBYTE(v213) = objc_msgSend_unsignedCharValue(v29, v30, v31);

  v34 = objc_msgSend_arg1(self, v32, v33);
  v37 = objc_msgSend_c(v34, v35, v36);
  v40 = objc_msgSend_b(v37, v38, v39);
  HIBYTE(v213) = objc_msgSend_BOOLValue(v40, v41, v42);

  v45 = objc_msgSend_arg1(self, v43, v44);
  v48 = objc_msgSend_c(v45, v46, v47);
  v51 = objc_msgSend_c(v48, v49, v50);
  char v214 = objc_msgSend_unsignedCharValue(v51, v52, v53);

  v56 = objc_msgSend_arg1(self, v54, v55);
  v59 = objc_msgSend_c(v56, v57, v58);
  objc_msgSend_d(v59, v60, v61);
  id v62 = objc_claimAutoreleasedReturnValue();
  uint64_t v65 = objc_msgSend_bytes(v62, v63, v64);
  uint64_t v68 = objc_msgSend_length(v62, v66, v67);
  sub_2446C1098(v204, v65, v68);

  long long v215 = *(_OWORD *)v204;
  v71 = objc_msgSend_arg1(self, v69, v70);
  v74 = objc_msgSend_c(v71, v72, v73);
  objc_msgSend_e(v74, v75, v76);
  id v77 = objc_claimAutoreleasedReturnValue();
  uint64_t v80 = objc_msgSend_UTF8String(v77, v78, v79);
  uint64_t v82 = objc_msgSend_lengthOfBytesUsingEncoding_(v77, v81, 4);
  sub_24479476C(v204, v80, v82);

  long long v216 = *(_OWORD *)v204;
  v85 = objc_msgSend_arg1(self, v83, v84);
  v88 = objc_msgSend_c(v85, v86, v87);
  v91 = objc_msgSend_f(v88, v89, v90);
  char v217 = objc_msgSend_unsignedCharValue(v91, v92, v93);

  v96 = objc_msgSend_arg1(self, v94, v95);
  v99 = objc_msgSend_c(v96, v97, v98);
  v102 = objc_msgSend_g(v99, v100, v101);
  objc_msgSend_floatValue(v102, v103, v104);
  int v218 = v105;

  v108 = objc_msgSend_arg1(self, v106, v107);
  v111 = objc_msgSend_c(v108, v109, v110);
  v114 = objc_msgSend_h(v111, v112, v113);
  objc_msgSend_doubleValue(v114, v115, v116);
  uint64_t v219 = v117;

  v120 = objc_msgSend_arg1(self, v118, v119);
  v123 = objc_msgSend_c(v120, v121, v122);
  v126 = objc_msgSend_i(v123, v124, v125);

  if (v126)
  {
    __int16 v220 = 1;
    v129 = objc_msgSend_arg1(self, v127, v128);
    v132 = objc_msgSend_c(v129, v130, v131);
    v135 = objc_msgSend_i(v132, v133, v134);
    HIBYTE(v220) = objc_msgSend_unsignedCharValue(v135, v136, v137);
  }
  v138 = objc_msgSend_arg1(self, v127, v128);
  v141 = objc_msgSend_d(v138, v139, v140);

  if (v141)
  {
    char v221 = 1;
    long long v222 = 0u;
    long long v223 = 0u;
    v144 = objc_msgSend_arg1(self, v142, v143);
    v147 = objc_msgSend_d(v144, v145, v146);
    objc_msgSend_name(v147, v148, v149);
    id v150 = objc_claimAutoreleasedReturnValue();
    uint64_t v153 = objc_msgSend_UTF8String(v150, v151, v152);
    uint64_t v155 = objc_msgSend_lengthOfBytesUsingEncoding_(v150, v154, 4);
    sub_24479476C(v204, v153, v155);

    long long v222 = *(_OWORD *)v204;
    v158 = objc_msgSend_arg1(self, v156, v157);
    v161 = objc_msgSend_d(v158, v159, v160);
    v164 = objc_msgSend_myBitmap(v161, v162, v163);

    if (v164)
    {
      LODWORD(v223) = 0;
      BYTE4(v223) = 1;
      v167 = objc_msgSend_arg1(self, v165, v166);
      v170 = objc_msgSend_d(v167, v168, v169);
      v173 = objc_msgSend_myBitmap(v170, v171, v172);
      LODWORD(v223) = objc_msgSend_unsignedIntValue(v173, v174, v175);
    }
    v176 = objc_msgSend_arg1(self, v165, v166);
    v179 = objc_msgSend_d(v176, v177, v178);
    v182 = objc_msgSend_myEnum(v179, v180, v181);

    if (v182)
    {
      BYTE8(v223) = 1;
      *(_WORD *)((char *)&v223 + 9) = 0;
      v185 = objc_msgSend_arg1(self, v183, v184);
      v188 = objc_msgSend_d(v185, v186, v187);
      v191 = objc_msgSend_myEnum(v188, v189, v190);

      if (v191)
      {
        *(_WORD *)((char *)&v223 + 9) = 256;
        v194 = objc_msgSend_arg1(self, v192, v193);
        v197 = objc_msgSend_d(v194, v195, v196);
        v200 = objc_msgSend_myEnum(v197, v198, v199);
        BYTE9(v223) = objc_msgSend_unsignedCharValue(v200, v201, v202);
      }
    }
  }
  sub_244CC8F5C(0x62FuLL, 0, &v209);
  if (v209)
  {
    sub_244CB62B8((uint64_t)v204);
    v206 = 0;
    v207 = 0;
    v205 = &unk_26F9536C8;
    char v208 = 0;
    sub_2447945A0((uint64_t)&v205, &v209, 0);
    sub_244CB6318((uint64_t)v204, (uint64_t)&v205, 0xFFFFFFFF, (uint64_t)v224);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_2448468F0((uint64_t)&v212, v204, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v204, &v209, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v209);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v205 = &unk_26F9536C8;
    sub_244794634(&v207);
    sub_244794634(&v206);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 37839;
  }
  sub_244794634(&v209);
  return (ChipError *)sub_24479466C((uint64_t)&v210);
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
    int v11 = 37868;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end