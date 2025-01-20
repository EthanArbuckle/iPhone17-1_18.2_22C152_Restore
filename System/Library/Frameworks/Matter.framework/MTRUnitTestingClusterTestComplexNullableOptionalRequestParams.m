@interface MTRUnitTestingClusterTestComplexNullableOptionalRequestParams
- (ChipError)_encodeToTLVReader:(SEL)a3;
- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStruct;
- (MTRUnitTestingClusterSimpleStruct)nullableStruct;
- (MTRUnitTestingClusterSimpleStruct)optionalStruct;
- (MTRUnitTestingClusterTestComplexNullableOptionalRequestParams)init;
- (NSArray)nullableList;
- (NSArray)nullableOptionalList;
- (NSArray)optionalList;
- (NSNumber)nullableInt;
- (NSNumber)nullableOptionalInt;
- (NSNumber)optionalInt;
- (NSNumber)serverSideProcessingTimeout;
- (NSNumber)timedInvokeTimeoutMs;
- (NSString)nullableOptionalString;
- (NSString)nullableString;
- (NSString)optionalString;
- (id)_encodeAsDataValue:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setNullableInt:(NSNumber *)nullableInt;
- (void)setNullableList:(NSArray *)nullableList;
- (void)setNullableOptionalInt:(NSNumber *)nullableOptionalInt;
- (void)setNullableOptionalList:(NSArray *)nullableOptionalList;
- (void)setNullableOptionalString:(NSString *)nullableOptionalString;
- (void)setNullableOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStruct;
- (void)setNullableString:(NSString *)nullableString;
- (void)setNullableStruct:(MTRUnitTestingClusterSimpleStruct *)nullableStruct;
- (void)setOptionalInt:(NSNumber *)optionalInt;
- (void)setOptionalList:(NSArray *)optionalList;
- (void)setOptionalString:(NSString *)optionalString;
- (void)setOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)optionalStruct;
- (void)setServerSideProcessingTimeout:(NSNumber *)serverSideProcessingTimeout;
- (void)setTimedInvokeTimeoutMs:(NSNumber *)timedInvokeTimeoutMs;
@end

@implementation MTRUnitTestingClusterTestComplexNullableOptionalRequestParams

- (MTRUnitTestingClusterTestComplexNullableOptionalRequestParams)init
{
  v19.receiver = self;
  v19.super_class = (Class)MTRUnitTestingClusterTestComplexNullableOptionalRequestParams;
  v2 = [(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams *)&v19 init];
  v3 = v2;
  if (v2)
  {
    nullableInt = v2->_nullableInt;
    v2->_nullableInt = 0;

    optionalInt = v3->_optionalInt;
    v3->_optionalInt = 0;

    nullableOptionalInt = v3->_nullableOptionalInt;
    v3->_nullableOptionalInt = 0;

    nullableString = v3->_nullableString;
    v3->_nullableString = 0;

    optionalString = v3->_optionalString;
    v3->_optionalString = 0;

    nullableOptionalString = v3->_nullableOptionalString;
    v3->_nullableOptionalString = 0;

    nullableStruct = v3->_nullableStruct;
    v3->_nullableStruct = 0;

    optionalStruct = v3->_optionalStruct;
    v3->_optionalStruct = 0;

    nullableOptionalStruct = v3->_nullableOptionalStruct;
    v3->_nullableOptionalStruct = 0;

    nullableList = v3->_nullableList;
    v3->_nullableList = 0;

    optionalList = v3->_optionalList;
    v3->_optionalList = 0;

    nullableOptionalList = v3->_nullableOptionalList;
    v3->_nullableOptionalList = 0;

    timedInvokeTimeoutMs = v3->_timedInvokeTimeoutMs;
    v3->_timedInvokeTimeoutMs = 0;

    serverSideProcessingTimeout = v3->_serverSideProcessingTimeout;
    v3->_serverSideProcessingTimeout = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams);
  v7 = objc_msgSend_nullableInt(self, v5, v6);
  objc_msgSend_setNullableInt_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_optionalInt(self, v9, v10);
  objc_msgSend_setOptionalInt_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_nullableOptionalInt(self, v13, v14);
  objc_msgSend_setNullableOptionalInt_(v4, v16, (uint64_t)v15);

  objc_super v19 = objc_msgSend_nullableString(self, v17, v18);
  objc_msgSend_setNullableString_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_optionalString(self, v21, v22);
  objc_msgSend_setOptionalString_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_nullableOptionalString(self, v25, v26);
  objc_msgSend_setNullableOptionalString_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_nullableStruct(self, v29, v30);
  objc_msgSend_setNullableStruct_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_optionalStruct(self, v33, v34);
  objc_msgSend_setOptionalStruct_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_nullableOptionalStruct(self, v37, v38);
  objc_msgSend_setNullableOptionalStruct_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_nullableList(self, v41, v42);
  objc_msgSend_setNullableList_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_optionalList(self, v45, v46);
  objc_msgSend_setOptionalList_(v4, v48, (uint64_t)v47);

  v51 = objc_msgSend_nullableOptionalList(self, v49, v50);
  objc_msgSend_setNullableOptionalList_(v4, v52, (uint64_t)v51);

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
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: nullableInt:%@; optionalInt:%@; nullableOptionalInt:%@; nullableString:%@; optionalString:%@; nullableOptionalString:%@; nullableStruct:%@; optionalStruct:%@; nullableOptionalStruct:%@; nullableList:%@; optionalList:%@; nullableOptionalList:%@; >",
    v5,
    self->_nullableInt,
    self->_optionalInt,
    self->_nullableOptionalInt,
    self->_nullableString,
    self->_optionalString,
    self->_nullableOptionalString,
    self->_nullableStruct,
    self->_optionalStruct,
    self->_nullableOptionalStruct,
    self->_nullableList,
    self->_optionalList,
  v7 = self->_nullableOptionalList);

  return v7;
}

- (NSNumber)nullableInt
{
  return self->_nullableInt;
}

- (void)setNullableInt:(NSNumber *)nullableInt
{
}

- (NSNumber)optionalInt
{
  return self->_optionalInt;
}

- (void)setOptionalInt:(NSNumber *)optionalInt
{
}

- (NSNumber)nullableOptionalInt
{
  return self->_nullableOptionalInt;
}

- (void)setNullableOptionalInt:(NSNumber *)nullableOptionalInt
{
}

- (NSString)nullableString
{
  return self->_nullableString;
}

- (void)setNullableString:(NSString *)nullableString
{
}

- (NSString)optionalString
{
  return self->_optionalString;
}

- (void)setOptionalString:(NSString *)optionalString
{
}

- (NSString)nullableOptionalString
{
  return self->_nullableOptionalString;
}

- (void)setNullableOptionalString:(NSString *)nullableOptionalString
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableStruct
{
  return self->_nullableStruct;
}

- (void)setNullableStruct:(MTRUnitTestingClusterSimpleStruct *)nullableStruct
{
}

- (MTRUnitTestingClusterSimpleStruct)optionalStruct
{
  return self->_optionalStruct;
}

- (void)setOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)optionalStruct
{
}

- (MTRUnitTestingClusterSimpleStruct)nullableOptionalStruct
{
  return self->_nullableOptionalStruct;
}

- (void)setNullableOptionalStruct:(MTRUnitTestingClusterSimpleStruct *)nullableOptionalStruct
{
}

- (NSArray)nullableList
{
  return self->_nullableList;
}

- (void)setNullableList:(NSArray *)nullableList
{
}

- (NSArray)optionalList
{
  return self->_optionalList;
}

- (void)setOptionalList:(NSArray *)optionalList
{
}

- (NSArray)nullableOptionalList
{
  return self->_nullableOptionalList;
}

- (void)setNullableOptionalList:(NSArray *)nullableOptionalList
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
  objc_storeStrong((id *)&self->_nullableOptionalList, 0);
  objc_storeStrong((id *)&self->_optionalList, 0);
  objc_storeStrong((id *)&self->_nullableList, 0);
  objc_storeStrong((id *)&self->_nullableOptionalStruct, 0);
  objc_storeStrong((id *)&self->_optionalStruct, 0);
  objc_storeStrong((id *)&self->_nullableStruct, 0);
  objc_storeStrong((id *)&self->_nullableOptionalString, 0);
  objc_storeStrong((id *)&self->_optionalString, 0);
  objc_storeStrong((id *)&self->_nullableString, 0);
  objc_storeStrong((id *)&self->_nullableOptionalInt, 0);
  objc_storeStrong((id *)&self->_optionalInt, 0);

  objc_storeStrong((id *)&self->_nullableInt, 0);
}

- (ChipError)_encodeToTLVReader:(SEL)a3
{
  LOBYTE(v346) = 0;
  char v347 = 0;
  char v348 = 0;
  char v350 = 0;
  LOBYTE(v352) = 0;
  char v353 = 0;
  char v354 = 0;
  char v356 = 0;
  LOBYTE(v359[0]) = 0;
  char v361 = 0;
  char v362 = 0;
  char v365 = 0;
  LOBYTE(v369) = 0;
  char v371 = 0;
  char v372 = 0;
  char v375 = 0;
  v345[0] = 0;
  v345[1] = 0;
  v344 = v345;
  v7 = objc_msgSend_nullableInt(self, a3, (uint64_t)a4);

  if (v7)
  {
    __int16 v346 = 0;
    char v347 = 1;
    uint64_t v10 = objc_msgSend_nullableInt(self, v8, v9);
    __int16 v346 = objc_msgSend_unsignedShortValue(v10, v11, v12);
  }
  else if (v347)
  {
    char v347 = 0;
  }
  v13 = objc_msgSend_optionalInt(self, v8, v9);

  if (v13)
  {
    char v348 = 1;
    __int16 v349 = 0;
    v16 = objc_msgSend_optionalInt(self, v14, v15);
    __int16 v349 = objc_msgSend_unsignedShortValue(v16, v17, v18);
  }
  objc_super v19 = objc_msgSend_nullableOptionalInt(self, v14, v15);

  if (v19)
  {
    char v350 = 1;
    int v351 = 0;
    uint64_t v22 = objc_msgSend_nullableOptionalInt(self, v20, v21);

    if (v22)
    {
      LOWORD(v351) = 0;
      BYTE2(v351) = 1;
      v23 = objc_msgSend_nullableOptionalInt(self, v20, v21);
      LOWORD(v351) = objc_msgSend_unsignedShortValue(v23, v24, v25);
    }
    else if (BYTE2(v351))
    {
      BYTE2(v351) = 0;
    }
  }
  uint64_t v26 = objc_msgSend_nullableString(self, v20, v21);

  if (v26)
  {
    long long v352 = 0uLL;
    char v353 = 1;
    objc_msgSend_nullableString(self, v27, v28);
    id v29 = objc_claimAutoreleasedReturnValue();
    uint64_t v32 = objc_msgSend_UTF8String(v29, v30, v31);
    uint64_t v34 = objc_msgSend_lengthOfBytesUsingEncoding_(v29, v33, 4);
    sub_24479476C(v338, v32, v34);

    long long v352 = *(_OWORD *)v338;
  }
  else if (v353)
  {
    char v353 = 0;
  }
  v35 = objc_msgSend_optionalString(self, v27, v28);

  if (v35)
  {
    char v354 = 1;
    long long v355 = 0uLL;
    objc_msgSend_optionalString(self, v36, v37);
    id v38 = objc_claimAutoreleasedReturnValue();
    uint64_t v41 = objc_msgSend_UTF8String(v38, v39, v40);
    uint64_t v43 = objc_msgSend_lengthOfBytesUsingEncoding_(v38, v42, 4);
    sub_24479476C(v338, v41, v43);

    long long v355 = *(_OWORD *)v338;
  }
  v44 = objc_msgSend_nullableOptionalString(self, v36, v37);

  if (v44)
  {
    char v356 = 1;
    uint64_t v358 = 0;
    long long v357 = 0uLL;
    v47 = objc_msgSend_nullableOptionalString(self, v45, v46);

    if (v47)
    {
      long long v357 = 0uLL;
      LOBYTE(v358) = 1;
      objc_msgSend_nullableOptionalString(self, v45, v46);
      id v48 = objc_claimAutoreleasedReturnValue();
      uint64_t v51 = objc_msgSend_UTF8String(v48, v49, v50);
      uint64_t v53 = objc_msgSend_lengthOfBytesUsingEncoding_(v48, v52, 4);
      sub_24479476C(v338, v51, v53);

      long long v357 = *(_OWORD *)v338;
    }
    else if ((_BYTE)v358)
    {
      LOBYTE(v358) = 0;
    }
  }
  uint64_t v54 = objc_msgSend_nullableStruct(self, v45, v46);

  if (v54)
  {
    long long v360 = 0u;
    memset(v359, 0, sizeof(v359));
    char v361 = 1;
    v57 = objc_msgSend_nullableStruct(self, v55, v56);
    v60 = objc_msgSend_a(v57, v58, v59);
    LOBYTE(v359[0]) = objc_msgSend_unsignedCharValue(v60, v61, v62);

    v65 = objc_msgSend_nullableStruct(self, v63, v64);
    v68 = objc_msgSend_b(v65, v66, v67);
    BYTE1(v359[0]) = objc_msgSend_BOOLValue(v68, v69, v70);

    v73 = objc_msgSend_nullableStruct(self, v71, v72);
    v76 = objc_msgSend_c(v73, v74, v75);
    BYTE2(v359[0]) = objc_msgSend_unsignedCharValue(v76, v77, v78);

    v81 = objc_msgSend_nullableStruct(self, v79, v80);
    objc_msgSend_d(v81, v82, v83);
    id v84 = objc_claimAutoreleasedReturnValue();
    uint64_t v87 = objc_msgSend_bytes(v84, v85, v86);
    uint64_t v90 = objc_msgSend_length(v84, v88, v89);
    sub_2446C1098(v338, v87, v90);

    *(_OWORD *)&v359[1] = *(_OWORD *)v338;
    v93 = objc_msgSend_nullableStruct(self, v91, v92);
    objc_msgSend_e(v93, v94, v95);
    id v96 = objc_claimAutoreleasedReturnValue();
    uint64_t v99 = objc_msgSend_UTF8String(v96, v97, v98);
    uint64_t v101 = objc_msgSend_lengthOfBytesUsingEncoding_(v96, v100, 4);
    sub_24479476C(v338, v99, v101);

    *(_OWORD *)&v359[3] = *(_OWORD *)v338;
    v104 = objc_msgSend_nullableStruct(self, v102, v103);
    v107 = objc_msgSend_f(v104, v105, v106);
    LOBYTE(v359[5]) = objc_msgSend_unsignedCharValue(v107, v108, v109);

    v112 = objc_msgSend_nullableStruct(self, v110, v111);
    v115 = objc_msgSend_g(v112, v113, v114);
    objc_msgSend_floatValue(v115, v116, v117);
    HIDWORD(v359[5]) = v118;

    v121 = objc_msgSend_nullableStruct(self, v119, v120);
    v124 = objc_msgSend_h(v121, v122, v123);
    objc_msgSend_doubleValue(v124, v125, v126);
    *(void *)&long long v360 = v127;

    v130 = objc_msgSend_nullableStruct(self, v128, v129);
    v133 = objc_msgSend_i(v130, v131, v132);

    if (v133)
    {
      WORD4(v360) = 1;
      v134 = objc_msgSend_nullableStruct(self, v55, v56);
      v137 = objc_msgSend_i(v134, v135, v136);
      BYTE9(v360) = objc_msgSend_unsignedCharValue(v137, v138, v139);
    }
  }
  else if (v361)
  {
    char v361 = 0;
  }
  v140 = objc_msgSend_optionalStruct(self, v55, v56);

  if (v140)
  {
    char v362 = 1;
    memset(v363, 0, sizeof(v363));
    long long v364 = 0u;
    v143 = objc_msgSend_optionalStruct(self, v141, v142);
    v146 = objc_msgSend_a(v143, v144, v145);
    LOBYTE(v363[0]) = objc_msgSend_unsignedCharValue(v146, v147, v148);

    v151 = objc_msgSend_optionalStruct(self, v149, v150);
    v154 = objc_msgSend_b(v151, v152, v153);
    BYTE1(v363[0]) = objc_msgSend_BOOLValue(v154, v155, v156);

    v159 = objc_msgSend_optionalStruct(self, v157, v158);
    v162 = objc_msgSend_c(v159, v160, v161);
    BYTE2(v363[0]) = objc_msgSend_unsignedCharValue(v162, v163, v164);

    v167 = objc_msgSend_optionalStruct(self, v165, v166);
    objc_msgSend_d(v167, v168, v169);
    id v170 = objc_claimAutoreleasedReturnValue();
    uint64_t v173 = objc_msgSend_bytes(v170, v171, v172);
    uint64_t v176 = objc_msgSend_length(v170, v174, v175);
    sub_2446C1098(v338, v173, v176);

    *(_OWORD *)&v363[1] = *(_OWORD *)v338;
    v179 = objc_msgSend_optionalStruct(self, v177, v178);
    objc_msgSend_e(v179, v180, v181);
    id v182 = objc_claimAutoreleasedReturnValue();
    uint64_t v185 = objc_msgSend_UTF8String(v182, v183, v184);
    uint64_t v187 = objc_msgSend_lengthOfBytesUsingEncoding_(v182, v186, 4);
    sub_24479476C(v338, v185, v187);

    *(_OWORD *)&v363[3] = *(_OWORD *)v338;
    v190 = objc_msgSend_optionalStruct(self, v188, v189);
    v193 = objc_msgSend_f(v190, v191, v192);
    LOBYTE(v363[5]) = objc_msgSend_unsignedCharValue(v193, v194, v195);

    v198 = objc_msgSend_optionalStruct(self, v196, v197);
    v201 = objc_msgSend_g(v198, v199, v200);
    objc_msgSend_floatValue(v201, v202, v203);
    HIDWORD(v363[5]) = v204;

    v207 = objc_msgSend_optionalStruct(self, v205, v206);
    v210 = objc_msgSend_h(v207, v208, v209);
    objc_msgSend_doubleValue(v210, v211, v212);
    *(void *)&long long v364 = v213;

    v216 = objc_msgSend_optionalStruct(self, v214, v215);
    v219 = objc_msgSend_i(v216, v217, v218);

    if (v219)
    {
      WORD4(v364) = 1;
      v220 = objc_msgSend_optionalStruct(self, v141, v142);
      v223 = objc_msgSend_i(v220, v221, v222);
      BYTE9(v364) = objc_msgSend_unsignedCharValue(v223, v224, v225);
    }
  }
  v226 = objc_msgSend_nullableOptionalStruct(self, v141, v142);

  if (v226)
  {
    char v365 = 1;
    long long v367 = 0u;
    memset(v366, 0, sizeof(v366));
    uint64_t v368 = 0;
    v229 = objc_msgSend_nullableOptionalStruct(self, v227, v228);

    if (v229)
    {
      long long v367 = 0u;
      memset(v366, 0, sizeof(v366));
      LOBYTE(v368) = 1;
      v230 = objc_msgSend_nullableOptionalStruct(self, v227, v228);
      v233 = objc_msgSend_a(v230, v231, v232);
      LOBYTE(v366[0]) = objc_msgSend_unsignedCharValue(v233, v234, v235);

      v238 = objc_msgSend_nullableOptionalStruct(self, v236, v237);
      v241 = objc_msgSend_b(v238, v239, v240);
      BYTE1(v366[0]) = objc_msgSend_BOOLValue(v241, v242, v243);

      v246 = objc_msgSend_nullableOptionalStruct(self, v244, v245);
      v249 = objc_msgSend_c(v246, v247, v248);
      BYTE2(v366[0]) = objc_msgSend_unsignedCharValue(v249, v250, v251);

      v254 = objc_msgSend_nullableOptionalStruct(self, v252, v253);
      objc_msgSend_d(v254, v255, v256);
      id v257 = objc_claimAutoreleasedReturnValue();
      uint64_t v260 = objc_msgSend_bytes(v257, v258, v259);
      uint64_t v263 = objc_msgSend_length(v257, v261, v262);
      sub_2446C1098(v338, v260, v263);

      *(_OWORD *)&v366[1] = *(_OWORD *)v338;
      v266 = objc_msgSend_nullableOptionalStruct(self, v264, v265);
      objc_msgSend_e(v266, v267, v268);
      id v269 = objc_claimAutoreleasedReturnValue();
      uint64_t v272 = objc_msgSend_UTF8String(v269, v270, v271);
      uint64_t v274 = objc_msgSend_lengthOfBytesUsingEncoding_(v269, v273, 4);
      sub_24479476C(v338, v272, v274);

      *(_OWORD *)&v366[3] = *(_OWORD *)v338;
      v277 = objc_msgSend_nullableOptionalStruct(self, v275, v276);
      v280 = objc_msgSend_f(v277, v278, v279);
      LOBYTE(v366[5]) = objc_msgSend_unsignedCharValue(v280, v281, v282);

      v285 = objc_msgSend_nullableOptionalStruct(self, v283, v284);
      v288 = objc_msgSend_g(v285, v286, v287);
      objc_msgSend_floatValue(v288, v289, v290);
      HIDWORD(v366[5]) = v291;

      v294 = objc_msgSend_nullableOptionalStruct(self, v292, v293);
      v297 = objc_msgSend_h(v294, v295, v296);
      objc_msgSend_doubleValue(v297, v298, v299);
      *(void *)&long long v367 = v300;

      v303 = objc_msgSend_nullableOptionalStruct(self, v301, v302);
      v306 = objc_msgSend_i(v303, v304, v305);

      if (v306)
      {
        WORD4(v367) = 1;
        v307 = objc_msgSend_nullableOptionalStruct(self, v227, v228);
        v310 = objc_msgSend_i(v307, v308, v309);
        BYTE9(v367) = objc_msgSend_unsignedCharValue(v310, v311, v312);
      }
    }
    else if ((_BYTE)v368)
    {
      LOBYTE(v368) = 0;
    }
  }
  v313 = objc_msgSend_nullableList(self, v227, v228);

  if (v313)
  {
    uint64_t v369 = 0;
    uint64_t v370 = 0;
    char v371 = 1;
    v316 = objc_msgSend_nullableList(self, v314, v315);
    uint64_t v319 = objc_msgSend_count(v316, v317, v318);

    if (v319) {
      operator new();
    }
    uint64_t v369 = 0;
    uint64_t v370 = 0;
  }
  else if (v371)
  {
    char v371 = 0;
  }
  v320 = objc_msgSend_optionalList(self, v314, v315);

  if (v320)
  {
    char v372 = 1;
    uint64_t v373 = 0;
    uint64_t v374 = 0;
    v323 = objc_msgSend_optionalList(self, v321, v322);
    uint64_t v326 = objc_msgSend_count(v323, v324, v325);

    if (v326) {
      operator new();
    }
    uint64_t v373 = 0;
    uint64_t v374 = 0;
  }
  v327 = objc_msgSend_nullableOptionalList(self, v321, v322);

  if (v327)
  {
    char v375 = 1;
    uint64_t v378 = 0;
    uint64_t v376 = 0;
    uint64_t v377 = 0;
    v330 = objc_msgSend_nullableOptionalList(self, v328, v329);

    if (v330)
    {
      uint64_t v376 = 0;
      uint64_t v377 = 0;
      LOBYTE(v378) = 1;
      v333 = objc_msgSend_nullableOptionalList(self, v331, v332);
      uint64_t v336 = objc_msgSend_count(v333, v334, v335);

      if (v336) {
        operator new();
      }
      uint64_t v376 = 0;
      uint64_t v377 = 0;
    }
    else if ((_BYTE)v378)
    {
      LOBYTE(v378) = 0;
    }
  }
  sub_244CC8F5C(0x62FuLL, 0, &v343);
  if (v343)
  {
    sub_244CB62B8((uint64_t)v338);
    v340 = 0;
    v341 = 0;
    v339 = &unk_26F9536C8;
    char v342 = 0;
    sub_2447945A0((uint64_t)&v339, &v343, 0);
    sub_244CB6318((uint64_t)v338, (uint64_t)&v339, 0xFFFFFFFF, (uint64_t)v379);
    *(void *)&retstr->mError = 0;
    retstr->mFile = 0;
    *(void *)&retstr->mLine = 0;
    sub_244843A2C((uint64_t)&v346, v338, 256, (uint64_t)retstr);
    if (!retstr->mError)
    {
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      sub_2446DE160((uint64_t)v338, &v343, retstr);
      if (!retstr->mError)
      {
        sub_2446DE1E4((uint64_t)a4, &v343);
        sub_244CB55E4((uint64_t)a4, 21, 256, retstr);
      }
    }
    v339 = &unk_26F9536C8;
    sub_244794634(&v341);
    sub_244794634(&v340);
  }
  else
  {
    retstr->mError = 11;
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-ge"
                    "nerated/MTRCommandPayloadsObjc.mm";
    retstr->mLine = 39702;
  }
  sub_244794634(&v343);
  return (ChipError *)sub_24479466C((uint64_t)&v344);
}

- (id)_encodeAsDataValue:(id *)a3
{
  double v5 = sub_244CB3988((uint64_t)v14);
  uint64_t v15 = 0;
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
    int v11 = 39731;
    sub_244B26908((uint64_t)MTRError, &v10);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  sub_244794634(&v15);

  return v8;
}

@end