@interface MTRChannelClusterProgramGuideResponseParams
- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3;
- (MTRChannelClusterChannelPagingStruct)paging;
- (MTRChannelClusterProgramGuideResponseParams)init;
- (MTRChannelClusterProgramGuideResponseParams)initWithResponseValue:(id)a3 error:(id *)a4;
- (NSArray)programList;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPaging:(id)a3;
- (void)setProgramList:(id)a3;
@end

@implementation MTRChannelClusterProgramGuideResponseParams

- (MTRChannelClusterProgramGuideResponseParams)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRChannelClusterProgramGuideResponseParams;
  v2 = [(MTRChannelClusterProgramGuideResponseParams *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    paging = v2->_paging;
    v2->_paging = (MTRChannelClusterChannelPagingStruct *)v3;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    programList = v2->_programList;
    v2->_programList = (NSArray *)v7;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterProgramGuideResponseParams);
  uint64_t v7 = objc_msgSend_paging(self, v5, v6);
  objc_msgSend_setPaging_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_programList(self, v9, v10);
  objc_msgSend_setProgramList_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: paging:%@; programList:%@; >",
    v5,
    self->_paging,
  uint64_t v7 = self->_programList);

  return v7;
}

- (MTRChannelClusterProgramGuideResponseParams)initWithResponseValue:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MTRChannelClusterProgramGuideResponseParams;
  v8 = [(MTRChannelClusterProgramGuideResponseParams *)&v39 init];
  if (!v8)
  {
    v31 = 0;
    goto LABEL_16;
  }
  objc_msgSend__responseDataForCommand_clusterID_commandID_error_(MTRBaseDevice, v7, (uint64_t)v6, 1284, 5, a4);
  if (v38)
  {
    sub_244CB3988((uint64_t)v37);
    sub_244CB39B8((uint64_t)v37, *((void *)v38 + 1), *((void *)v38 + 3));
    long long v35 = 0uLL;
    uint64_t v36 = 0;
    sub_244CB54B4((uint64_t)v37, 256, &v35);
    if (!v35)
    {
      LOBYTE(buf) = 0;
      char v44 = 0;
      sub_244CB3988((uint64_t)v45);
      v45[72] = 0;
      sub_244CB39B8(v9, 0, 0);
      sub_244832974((uint64_t)&buf, (uint64_t)v37, (uint64_t)&v33);
      long long v35 = v33;
      uint64_t v36 = v34;
      if (!v33)
      {
        objc_msgSend__setFieldsFromDecodableStruct_(v8, v10, (uint64_t)&buf);
        long long v35 = v33;
        uint64_t v36 = v34;
        if (!v33)
        {
          v31 = v8;
          goto LABEL_14;
        }
      }
    }
    v11 = NSString;
    long long buf = v35;
    uint64_t v43 = v36;
    v12 = sub_244CB7B34((const char **)&buf, 1);
    v14 = objc_msgSend_stringWithFormat_(v11, v13, @"Command payload decoding failed: %s", v12);
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v16 = v14;
      uint64_t v19 = objc_msgSend_UTF8String(v16, v17, v18);
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      id v22 = v14;
      objc_msgSend_UTF8String(v22, v23, v24);
      sub_244CC4DE0(0, 1);
    }
    if (a4)
    {
      uint64_t v40 = *MEMORY[0x263F08338];
      v25 = objc_msgSend_mainBundle(MEMORY[0x263F086E0], v20, v21);
      v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, (uint64_t)v14, &stru_26F969DC8, 0);
      v41 = v27;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v41, &v40, 1);

      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v30, @"MTRErrorDomain", 13, v29);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v31 = 0;
LABEL_14:
  sub_244794634(&v38);
LABEL_16:

  return v31;
}

- (MTRChannelClusterChannelPagingStruct)paging
{
  return self->_paging;
}

- (void)setPaging:(id)a3
{
}

- (NSArray)programList
{
  return self->_programList;
}

- (void)setProgramList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_programList, 0);

  objc_storeStrong((id *)&self->_paging, 0);
}

- (ChipError)_setFieldsFromDecodableStruct:(SEL)a3
{
  uint64_t v7 = objc_opt_new();
  objc_msgSend_setPaging_(self, v8, (uint64_t)v7);

  if (!*(unsigned char *)a4 || !sub_2446F7170(a4)[56])
  {
    v31 = objc_msgSend_paging(self, v9, v10);
    objc_msgSend_setPreviousToken_(v31, v32, 0);
LABEL_22:

    goto LABEL_23;
  }
  v11 = objc_opt_new();
  v14 = objc_msgSend_paging(self, v12, v13);
  objc_msgSend_setPreviousToken_(v14, v15, (uint64_t)v11);

  id v16 = sub_2446F7170(a4);
  if (!v16[56]) {
    goto LABEL_199;
  }
  if (*v16)
  {
    uint64_t v19 = NSNumber;
    v20 = sub_2446F7170(a4);
    if (!v20[56]) {
      goto LABEL_199;
    }
    uint64_t v21 = sub_2446D1880(v20);
    v23 = objc_msgSend_numberWithUnsignedShort_(v19, v22, *(unsigned __int16 *)v21);
    v26 = objc_msgSend_paging(self, v24, v25);
    v29 = objc_msgSend_previousToken(v26, v27, v28);
    objc_msgSend_setLimit_(v29, v30, (uint64_t)v23);
  }
  else
  {
    v23 = objc_msgSend_paging(self, v17, v18);
    v26 = objc_msgSend_previousToken(v23, v33, v34);
    objc_msgSend_setLimit_(v26, v35, 0);
  }

  uint64_t v36 = sub_2446F7170(a4);
  if (!v36[56]) {
    goto LABEL_199;
  }
  if (v36[8])
  {
    objc_super v39 = sub_2446F7170(a4);
    if (!v39[56]) {
      goto LABEL_199;
    }
    uint64_t v40 = (uint64_t *)sub_2446D18A4(v39 + 8);
    uint64_t v41 = *v40;
    uint64_t v42 = v40[1];
    id v43 = [NSString alloc];
    v45 = objc_msgSend_initWithBytes_length_encoding_(v43, v44, v41, v42, 4);
    v48 = objc_msgSend_paging(self, v46, v47);
    v51 = objc_msgSend_previousToken(v48, v49, v50);
    objc_msgSend_setAfter_(v51, v52, (uint64_t)v45);

    v55 = objc_msgSend_paging(self, v53, v54);
    v58 = objc_msgSend_previousToken(v55, v56, v57);
    v61 = objc_msgSend_after(v58, v59, v60);

    if (!v61)
    {
      v63 = &xmmword_265194218;
LABEL_43:
      *(_OWORD *)&retstr->mError = *v63;
      *(void *)&retstr->mLine = *((void *)v63 + 2);
      return result;
    }
  }
  else
  {
    v64 = objc_msgSend_paging(self, v37, v38);
    v67 = objc_msgSend_previousToken(v64, v65, v66);
    objc_msgSend_setAfter_(v67, v68, 0);
  }
  v69 = sub_2446F7170(a4);
  if (!v69[56]) {
    goto LABEL_199;
  }
  if (!v69[32])
  {
    v31 = objc_msgSend_paging(self, v70, v71);
    v99 = objc_msgSend_previousToken(v31, v97, v98);
    objc_msgSend_setBefore_(v99, v100, 0);

    goto LABEL_22;
  }
  v72 = sub_2446F7170(a4);
  if (!v72[56]) {
    goto LABEL_199;
  }
  v73 = (uint64_t *)sub_2446D18A4(v72 + 32);
  uint64_t v74 = *v73;
  uint64_t v75 = v73[1];
  id v76 = [NSString alloc];
  v78 = objc_msgSend_initWithBytes_length_encoding_(v76, v77, v74, v75, 4);
  v81 = objc_msgSend_paging(self, v79, v80);
  v84 = objc_msgSend_previousToken(v81, v82, v83);
  objc_msgSend_setBefore_(v84, v85, (uint64_t)v78);

  v88 = objc_msgSend_paging(self, v86, v87);
  v91 = objc_msgSend_previousToken(v88, v89, v90);
  v94 = objc_msgSend_before(v91, v92, v93);

  if (!v94)
  {
    v63 = &xmmword_265194230;
    goto LABEL_43;
  }
LABEL_23:
  if (!*((unsigned char *)a4 + 72) || !sub_2446F7170((unsigned char *)a4 + 72)[56])
  {
    v121 = objc_msgSend_paging(self, v95, v96);
    objc_msgSend_setNextToken_(v121, v122, 0);
LABEL_45:

    goto LABEL_46;
  }
  v101 = objc_opt_new();
  v104 = objc_msgSend_paging(self, v102, v103);
  objc_msgSend_setNextToken_(v104, v105, (uint64_t)v101);

  v106 = sub_2446F7170((unsigned char *)a4 + 72);
  if (!v106[56]) {
    goto LABEL_199;
  }
  if (*v106)
  {
    v109 = NSNumber;
    v110 = sub_2446F7170((unsigned char *)a4 + 72);
    if (!v110[56]) {
      goto LABEL_199;
    }
    v111 = sub_2446D1880(v110);
    v113 = objc_msgSend_numberWithUnsignedShort_(v109, v112, *(unsigned __int16 *)v111);
    v116 = objc_msgSend_paging(self, v114, v115);
    v119 = objc_msgSend_nextToken(v116, v117, v118);
    objc_msgSend_setLimit_(v119, v120, (uint64_t)v113);
  }
  else
  {
    v113 = objc_msgSend_paging(self, v107, v108);
    v116 = objc_msgSend_nextToken(v113, v123, v124);
    objc_msgSend_setLimit_(v116, v125, 0);
  }

  v126 = sub_2446F7170((unsigned char *)a4 + 72);
  if (!v126[56]) {
    goto LABEL_199;
  }
  if (v126[8])
  {
    v129 = sub_2446F7170((unsigned char *)a4 + 72);
    if (!v129[56]) {
      goto LABEL_199;
    }
    v130 = (uint64_t *)sub_2446D18A4(v129 + 8);
    uint64_t v131 = *v130;
    uint64_t v132 = v130[1];
    id v133 = [NSString alloc];
    v135 = objc_msgSend_initWithBytes_length_encoding_(v133, v134, v131, v132, 4);
    v138 = objc_msgSend_paging(self, v136, v137);
    v141 = objc_msgSend_nextToken(v138, v139, v140);
    objc_msgSend_setAfter_(v141, v142, (uint64_t)v135);

    v145 = objc_msgSend_paging(self, v143, v144);
    v148 = objc_msgSend_nextToken(v145, v146, v147);
    v151 = objc_msgSend_after(v148, v149, v150);

    if (!v151)
    {
      v63 = &xmmword_265194248;
      goto LABEL_43;
    }
  }
  else
  {
    v152 = objc_msgSend_paging(self, v127, v128);
    v155 = objc_msgSend_nextToken(v152, v153, v154);
    objc_msgSend_setAfter_(v155, v156, 0);
  }
  v157 = sub_2446F7170((unsigned char *)a4 + 72);
  if (!v157[56]) {
LABEL_199:
  }
    sub_24479484C();
  if (!v157[32])
  {
    v121 = objc_msgSend_paging(self, v158, v159);
    v185 = objc_msgSend_nextToken(v121, v183, v184);
    objc_msgSend_setBefore_(v185, v186, 0);

    goto LABEL_45;
  }
  v160 = sub_2446F7170((unsigned char *)a4 + 72);
  if (!v160[56]) {
    goto LABEL_199;
  }
  v161 = (uint64_t *)sub_2446D18A4(v160 + 32);
  uint64_t v162 = *v161;
  uint64_t v163 = v161[1];
  id v164 = [NSString alloc];
  v166 = objc_msgSend_initWithBytes_length_encoding_(v164, v165, v162, v163, 4);
  v169 = objc_msgSend_paging(self, v167, v168);
  v172 = objc_msgSend_nextToken(v169, v170, v171);
  objc_msgSend_setBefore_(v172, v173, (uint64_t)v166);

  v176 = objc_msgSend_paging(self, v174, v175);
  v179 = objc_msgSend_nextToken(v176, v177, v178);
  v182 = objc_msgSend_before(v179, v180, v181);

  if (!v182)
  {
    v63 = &xmmword_265194260;
    goto LABEL_43;
  }
LABEL_46:
  v534 = objc_opt_new();
  LOBYTE(v535) = *((unsigned char *)a4 + 216);
  if ((_BYTE)v535) {
    BYTE1(v535) = *((unsigned char *)a4 + 217);
  }
  sub_2447970A8((uint64_t)v541, (uint64_t)a4 + 144, (unsigned __int8 *)&v535);
  v533 = &v538;
  unint64_t v187 = 0x265191000uLL;
  unint64_t v188 = 0x263F08000uLL;
  v189 = retstr;
  while (sub_244797174((uint64_t)v541))
  {
    unint64_t v191 = v187;
    v192 = objc_opt_new();
    uint64_t v193 = v541[0];
    uint64_t v194 = v541[1];
    id v195 = [NSString alloc];
    v197 = objc_msgSend_initWithBytes_length_encoding_(v195, v196, v193, v194, 4);
    objc_msgSend_setIdentifier_(v192, v198, (uint64_t)v197);

    v201 = objc_msgSend_identifier(v192, v199, v200);

    if (!v201)
    {
      v532 = &xmmword_265194278;
      goto LABEL_196;
    }
    v202 = objc_opt_new();
    objc_msgSend_setChannel_(v192, v203, (uint64_t)v202);

    v205 = objc_msgSend_numberWithUnsignedShort_(*(void **)(v188 + 2584), v204, v542);
    v208 = objc_msgSend_channel(v192, v206, v207);
    objc_msgSend_setMajorNumber_(v208, v209, (uint64_t)v205);

    v211 = objc_msgSend_numberWithUnsignedShort_(*(void **)(v188 + 2584), v210, v543);
    v214 = objc_msgSend_channel(v192, v212, v213);
    objc_msgSend_setMinorNumber_(v214, v215, (uint64_t)v211);

    if (v544[0])
    {
      v218 = (uint64_t *)sub_2446D18A4(v544);
      uint64_t v219 = *v218;
      uint64_t v220 = v218[1];
      id v221 = [NSString alloc];
      v223 = objc_msgSend_initWithBytes_length_encoding_(v221, v222, v219, v220, 4);
      v226 = objc_msgSend_channel(v192, v224, v225);
      objc_msgSend_setName_(v226, v227, (uint64_t)v223);

      v230 = objc_msgSend_channel(v192, v228, v229);
      v233 = objc_msgSend_name(v230, v231, v232);

      if (!v233)
      {
        v532 = &xmmword_265194290;
LABEL_196:
        *(_OWORD *)&retstr->mError = *v532;
        *(void *)&retstr->mLine = *((void *)v532 + 2);
        goto LABEL_197;
      }
    }
    else
    {
      v236 = objc_msgSend_channel(v192, v216, v217);
      objc_msgSend_setName_(v236, v237, 0);
    }
    if (v545[0])
    {
      v238 = (uint64_t *)sub_2446D18A4(v545);
      uint64_t v239 = *v238;
      uint64_t v240 = v238[1];
      id v241 = [NSString alloc];
      v243 = objc_msgSend_initWithBytes_length_encoding_(v241, v242, v239, v240, 4);
      v246 = objc_msgSend_channel(v192, v244, v245);
      objc_msgSend_setCallSign_(v246, v247, (uint64_t)v243);

      v250 = objc_msgSend_channel(v192, v248, v249);
      v253 = objc_msgSend_callSign(v250, v251, v252);

      if (!v253)
      {
        v532 = &xmmword_2651942A8;
        goto LABEL_196;
      }
    }
    else
    {
      v256 = objc_msgSend_channel(v192, v234, v235);
      objc_msgSend_setCallSign_(v256, v257, 0);
    }
    if (v546[0])
    {
      v258 = (uint64_t *)sub_2446D18A4(v546);
      uint64_t v259 = *v258;
      uint64_t v260 = v258[1];
      id v261 = [NSString alloc];
      v263 = objc_msgSend_initWithBytes_length_encoding_(v261, v262, v259, v260, 4);
      v266 = objc_msgSend_channel(v192, v264, v265);
      objc_msgSend_setAffiliateCallSign_(v266, v267, (uint64_t)v263);

      v270 = objc_msgSend_channel(v192, v268, v269);
      v273 = objc_msgSend_affiliateCallSign(v270, v271, v272);

      if (!v273)
      {
        v532 = &xmmword_2651942C0;
        goto LABEL_196;
      }
    }
    else
    {
      v276 = objc_msgSend_channel(v192, v254, v255);
      objc_msgSend_setAffiliateCallSign_(v276, v277, 0);
    }
    if (v547[0])
    {
      v278 = (uint64_t *)sub_2446D18A4(v547);
      uint64_t v279 = *v278;
      uint64_t v280 = v278[1];
      id v281 = [NSString alloc];
      v283 = objc_msgSend_initWithBytes_length_encoding_(v281, v282, v279, v280, 4);
      v286 = objc_msgSend_channel(v192, v284, v285);
      objc_msgSend_setIdentifier_(v286, v287, (uint64_t)v283);

      v290 = objc_msgSend_channel(v192, v288, v289);
      v293 = objc_msgSend_identifier(v290, v291, v292);

      if (!v293)
      {
        v532 = &xmmword_2651942D8;
        goto LABEL_196;
      }
    }
    else
    {
      v296 = objc_msgSend_channel(v192, v274, v275);
      objc_msgSend_setIdentifier_(v296, v297, 0);
    }
    if (v548[0])
    {
      v298 = *(void **)(v188 + 2584);
      v299 = sub_2446F9190(v548);
      v301 = objc_msgSend_numberWithUnsignedChar_(v298, v300, *v299);
      v304 = objc_msgSend_channel(v192, v302, v303);
      objc_msgSend_setType_(v304, v305, (uint64_t)v301);
    }
    else
    {
      v301 = objc_msgSend_channel(v192, v294, v295);
      objc_msgSend_setType_(v301, v306, 0);
    }

    v308 = objc_msgSend_numberWithUnsignedInt_(*(void **)(v188 + 2584), v307, v549);
    objc_msgSend_setStartTime_(v192, v309, (uint64_t)v308);

    v311 = objc_msgSend_numberWithUnsignedInt_(*(void **)(v188 + 2584), v310, v550);
    objc_msgSend_setEndTime_(v192, v312, (uint64_t)v311);

    uint64_t v313 = v551;
    uint64_t v314 = v552;
    id v315 = [NSString alloc];
    v317 = objc_msgSend_initWithBytes_length_encoding_(v315, v316, v313, v314, 4);
    objc_msgSend_setTitle_(v192, v318, (uint64_t)v317);

    v321 = objc_msgSend_title(v192, v319, v320);

    if (!v321)
    {
      v532 = &xmmword_2651942F0;
      goto LABEL_196;
    }
    if (v553[0])
    {
      v323 = (uint64_t *)sub_2446D18A4(v553);
      uint64_t v324 = *v323;
      uint64_t v325 = v323[1];
      id v326 = [NSString alloc];
      v328 = objc_msgSend_initWithBytes_length_encoding_(v326, v327, v324, v325, 4);
      objc_msgSend_setSubtitle_(v192, v329, (uint64_t)v328);

      v332 = objc_msgSend_subtitle(v192, v330, v331);

      if (!v332)
      {
        v532 = &xmmword_265194308;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setSubtitle_(v192, v322, 0);
    }
    if (v554[0])
    {
      v334 = (uint64_t *)sub_2446D18A4(v554);
      uint64_t v335 = *v334;
      uint64_t v336 = v334[1];
      id v337 = [NSString alloc];
      v339 = objc_msgSend_initWithBytes_length_encoding_(v337, v338, v335, v336, 4);
      objc_msgSend_setDescriptionString_(v192, v340, (uint64_t)v339);

      v343 = objc_msgSend_descriptionString(v192, v341, v342);

      if (!v343)
      {
        v532 = &xmmword_265194320;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setDescriptionString_(v192, v333, 0);
    }
    if (v555[0])
    {
      v345 = objc_opt_new();
      v346 = sub_2446F7170(v555);
      unsigned __int8 v569 = v346[72];
      if (v569) {
        char v570 = v346[73];
      }
      sub_244797544((uint64_t)&v535, (uint64_t)v346, &v569);
      while (sub_2447975B4((uint64_t)&v535))
      {
        uint64_t v349 = v535;
        uint64_t v348 = v536;
        id v350 = [NSString alloc];
        v353 = objc_msgSend_initWithBytes_length_encoding_(v350, v351, v349, v348, 4);
        if (!v353)
        {
          v529 = &xmmword_265194338;
          goto LABEL_179;
        }
        objc_msgSend_addObject_(v345, v352, (uint64_t)v353);

        retstr = v189;
      }
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      if (v537 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
        unint64_t v188 = 0x263F08000;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v537;
        *(void *)&retstr->mLine = v538;
        unint64_t v188 = 0x263F08000;
        if (retstr->mError) {
          goto LABEL_180;
        }
      }
      objc_msgSend_setAudioLanguages_(v192, v347, (uint64_t)v345, v533);
    }
    else
    {
      objc_msgSend_setAudioLanguages_(v192, v344, 0);
    }
    if (v556[0])
    {
      v345 = objc_opt_new();
      v355 = sub_2446F7170(v556);
      unsigned __int8 v569 = v355[72];
      if (v569) {
        char v570 = v355[73];
      }
      sub_244797544((uint64_t)&v535, (uint64_t)v355, &v569);
      while (sub_2447975B4((uint64_t)&v535))
      {
        uint64_t v358 = v535;
        uint64_t v357 = v536;
        id v359 = [NSString alloc];
        v362 = objc_msgSend_initWithBytes_length_encoding_(v359, v360, v358, v357, 4);
        if (!v362)
        {
          v529 = &xmmword_265194350;
LABEL_179:
          *(_OWORD *)&v189->mError = *v529;
          *(void *)&v189->mLine = *((void *)v529 + 2);
LABEL_180:

          goto LABEL_197;
        }
        objc_msgSend_addObject_(v345, v361, (uint64_t)v362);

        retstr = v189;
      }
      *(void *)&retstr->mError = 0;
      retstr->mFile = 0;
      *(void *)&retstr->mLine = 0;
      if (v537 == 33)
      {
        retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        retstr->mLine = 147;
        unint64_t v188 = 0x263F08000;
      }
      else
      {
        *(_OWORD *)&retstr->mError = v537;
        *(void *)&retstr->mLine = v538;
        unint64_t v188 = 0x263F08000uLL;
        if (retstr->mError) {
          goto LABEL_180;
        }
      }
      objc_msgSend_setRatings_(v192, v356, (uint64_t)v345, v533);
    }
    else
    {
      objc_msgSend_setRatings_(v192, v354, 0);
    }
    if (v557[0])
    {
      v364 = (uint64_t *)sub_2446D18A4(v557);
      uint64_t v365 = *v364;
      uint64_t v366 = v364[1];
      id v367 = [NSString alloc];
      v369 = objc_msgSend_initWithBytes_length_encoding_(v367, v368, v365, v366, 4);
      objc_msgSend_setThumbnailUrl_(v192, v370, (uint64_t)v369);

      v373 = objc_msgSend_thumbnailUrl(v192, v371, v372);

      if (!v373)
      {
        v532 = &xmmword_265194368;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setThumbnailUrl_(v192, v363, 0);
    }
    if (v558[0])
    {
      v375 = (uint64_t *)sub_2446D18A4(v558);
      uint64_t v376 = *v375;
      uint64_t v377 = v375[1];
      id v378 = [NSString alloc];
      v380 = objc_msgSend_initWithBytes_length_encoding_(v378, v379, v376, v377, 4);
      objc_msgSend_setPosterArtUrl_(v192, v381, (uint64_t)v380);

      v384 = objc_msgSend_posterArtUrl(v192, v382, v383);

      if (!v384)
      {
        v532 = &xmmword_265194380;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setPosterArtUrl_(v192, v374, 0);
    }
    if (v559[0])
    {
      v386 = (uint64_t *)sub_2446D18A4(v559);
      uint64_t v387 = *v386;
      uint64_t v388 = v386[1];
      id v389 = [NSString alloc];
      v391 = objc_msgSend_initWithBytes_length_encoding_(v389, v390, v387, v388, 4);
      objc_msgSend_setDvbiUrl_(v192, v392, (uint64_t)v391);

      v395 = objc_msgSend_dvbiUrl(v192, v393, v394);

      if (!v395)
      {
        v532 = &xmmword_265194398;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setDvbiUrl_(v192, v385, 0);
    }
    if (v560[0])
    {
      v397 = (uint64_t *)sub_2446D18A4(v560);
      uint64_t v398 = *v397;
      uint64_t v399 = v397[1];
      id v400 = [NSString alloc];
      v402 = objc_msgSend_initWithBytes_length_encoding_(v400, v401, v398, v399, 4);
      objc_msgSend_setReleaseDate_(v192, v403, (uint64_t)v402);

      v406 = objc_msgSend_releaseDate(v192, v404, v405);

      if (!v406)
      {
        v532 = &xmmword_2651943B0;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setReleaseDate_(v192, v396, 0);
    }
    if (v561[0])
    {
      v408 = (uint64_t *)sub_2446D18A4(v561);
      uint64_t v409 = *v408;
      uint64_t v410 = v408[1];
      id v411 = [NSString alloc];
      v413 = objc_msgSend_initWithBytes_length_encoding_(v411, v412, v409, v410, 4);
      objc_msgSend_setParentalGuidanceText_(v192, v414, (uint64_t)v413);

      v417 = objc_msgSend_parentalGuidanceText(v192, v415, v416);

      if (!v417)
      {
        v532 = &xmmword_2651943C8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setParentalGuidanceText_(v192, v407, 0);
    }
    if (v562[0])
    {
      v419 = *(void **)(v188 + 2584);
      v420 = sub_2446F12CC(v562);
      v422 = objc_msgSend_numberWithUnsignedInt_(v419, v421, *(unsigned int *)v420);
      objc_msgSend_setRecordingFlag_(v192, v423, (uint64_t)v422);
    }
    else
    {
      objc_msgSend_setRecordingFlag_(v192, v418, 0);
    }
    if (v563[0] && sub_2446F7170(v563)[32])
    {
      v425 = objc_opt_new();
      objc_msgSend_setSeriesInfo_(v192, v426, (uint64_t)v425);

      v427 = sub_2446F7170(v563);
      if (!v427[32]) {
        goto LABEL_200;
      }
      uint64_t v428 = *(void *)v427;
      uint64_t v429 = *((void *)v427 + 1);
      id v430 = [NSString alloc];
      v432 = objc_msgSend_initWithBytes_length_encoding_(v430, v431, v428, v429, 4);
      v435 = objc_msgSend_seriesInfo(v192, v433, v434);
      objc_msgSend_setSeason_(v435, v436, (uint64_t)v432);

      v439 = objc_msgSend_seriesInfo(v192, v437, v438);
      v442 = objc_msgSend_season(v439, v440, v441);

      if (!v442)
      {
        v532 = &xmmword_2651943E0;
        goto LABEL_196;
      }
      v443 = sub_2446F7170(v563);
      if (!v443[32]) {
LABEL_200:
      }
        sub_24479484C();
      uint64_t v444 = *((void *)v443 + 2);
      uint64_t v445 = *((void *)v443 + 3);
      id v446 = [NSString alloc];
      v448 = objc_msgSend_initWithBytes_length_encoding_(v446, v447, v444, v445, 4);
      v451 = objc_msgSend_seriesInfo(v192, v449, v450);
      objc_msgSend_setEpisode_(v451, v452, (uint64_t)v448);

      v455 = objc_msgSend_seriesInfo(v192, v453, v454);
      v458 = objc_msgSend_episode(v455, v456, v457);

      if (!v458)
      {
        v532 = &xmmword_2651943F8;
        goto LABEL_196;
      }
    }
    else
    {
      objc_msgSend_setSeriesInfo_(v192, v424, 0, v533);
    }
    if (v564[0])
    {
      v460 = objc_opt_new();
      v461 = sub_2446F7170(v564);
      unsigned __int8 v569 = v461[72];
      if (v569) {
        char v570 = v461[73];
      }
      sub_24479765C((uint64_t)&v535, (uint64_t)v461, &v569);
      while (sub_2447976D4((uint64_t)&v535))
      {
        v463 = objc_opt_new();
        uint64_t v464 = v535;
        uint64_t v465 = v536;
        id v466 = [NSString alloc];
        v468 = objc_msgSend_initWithBytes_length_encoding_(v466, v467, v464, v465, 4);
        objc_msgSend_setCategory_(v463, v469, (uint64_t)v468);

        v472 = objc_msgSend_category(v463, v470, v471);

        if (!v472)
        {
          v530 = &xmmword_265194410;
          goto LABEL_191;
        }
        if ((_BYTE)v537)
        {
          v474 = (uint64_t *)sub_2446D18A4(&v537);
          uint64_t v475 = *v474;
          uint64_t v476 = v474[1];
          id v477 = [NSString alloc];
          v479 = objc_msgSend_initWithBytes_length_encoding_(v477, v478, v475, v476, 4);
          objc_msgSend_setSubCategory_(v463, v480, (uint64_t)v479);

          v483 = objc_msgSend_subCategory(v463, v481, v482);

          if (!v483)
          {
            v530 = &xmmword_265194428;
            goto LABEL_191;
          }
        }
        else
        {
          objc_msgSend_setSubCategory_(v463, v473, 0);
        }
        objc_msgSend_addObject_(v460, v484, (uint64_t)v463, v533);
      }
      *(void *)&v189->mError = 0;
      v189->mFile = 0;
      *(void *)&v189->mLine = 0;
      if (v539 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
      }
      else
      {
        *(_OWORD *)&v189->mError = v539;
        *(void *)&v189->mLine = v540;
        if (v189->mError) {
          goto LABEL_192;
        }
      }
      objc_msgSend_setCategoryList_(v192, v462, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setCategoryList_(v192, v459, 0);
    }
    if (v565[0])
    {
      v460 = objc_opt_new();
      v486 = sub_2446F7170(v565);
      unsigned __int8 v569 = v486[72];
      if (v569) {
        char v570 = v486[73];
      }
      sub_244797780((uint64_t)&v535, (uint64_t)v486, &v569);
      while (sub_2447977F8((uint64_t)&v535))
      {
        v488 = objc_opt_new();
        uint64_t v490 = v535;
        uint64_t v489 = v536;
        id v491 = [NSString alloc];
        v493 = objc_msgSend_initWithBytes_length_encoding_(v491, v492, v490, v489, 4);
        objc_msgSend_setName_(v488, v494, (uint64_t)v493);

        v497 = objc_msgSend_name(v488, v495, v496);

        if (!v497)
        {
          v531 = &xmmword_265194440;
LABEL_184:
          *(_OWORD *)&v189->mError = *v531;
          *(void *)&v189->mLine = *((void *)v531 + 2);

          goto LABEL_192;
        }
        long long v498 = v537;
        id v499 = [NSString alloc];
        v501 = objc_msgSend_initWithBytes_length_encoding_(v499, v500, v498, *((void *)&v498 + 1), 4);
        objc_msgSend_setRole_(v488, v502, (uint64_t)v501);

        v505 = objc_msgSend_role(v488, v503, v504);

        if (!v505)
        {
          v531 = &xmmword_265194458;
          goto LABEL_184;
        }
        objc_msgSend_addObject_(v460, v506, (uint64_t)v488);
      }
      *(void *)&v189->mError = 0;
      v189->mFile = 0;
      *(void *)&v189->mLine = 0;
      if (v538 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
        unint64_t v188 = 0x263F08000;
      }
      else
      {
        *(_OWORD *)&v189->mError = *(_OWORD *)v533;
        *(void *)&v189->mLine = v533[2];
        unint64_t v188 = 0x263F08000;
        if (v189->mError) {
          goto LABEL_192;
        }
      }
      objc_msgSend_setCastList_(v192, v487, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setCastList_(v192, v485, 0);
    }
    if (v566[0])
    {
      v460 = objc_opt_new();
      v508 = sub_2446F7170(v566);
      unsigned __int8 v569 = v508[72];
      if (v569) {
        char v570 = v508[73];
      }
      sub_244797780((uint64_t)&v535, (uint64_t)v508, &v569);
      while (sub_2447977F8((uint64_t)&v535))
      {
        v463 = objc_opt_new();
        uint64_t v511 = v535;
        uint64_t v510 = v536;
        id v512 = [NSString alloc];
        v514 = objc_msgSend_initWithBytes_length_encoding_(v512, v513, v511, v510, 4);
        objc_msgSend_setName_(v463, v515, (uint64_t)v514);

        v518 = objc_msgSend_name(v463, v516, v517);

        if (!v518)
        {
          v530 = &xmmword_265194470;
          goto LABEL_191;
        }
        long long v519 = v537;
        id v520 = [NSString alloc];
        v522 = objc_msgSend_initWithBytes_length_encoding_(v520, v521, v519, *((void *)&v519 + 1), 4);
        objc_msgSend_setRole_(v463, v523, (uint64_t)v522);

        v526 = objc_msgSend_role(v463, v524, v525);

        if (!v526)
        {
          v530 = &xmmword_265194488;
LABEL_191:
          *(_OWORD *)&v189->mError = *v530;
          *(void *)&v189->mLine = *((void *)v530 + 2);

LABEL_192:
LABEL_197:

LABEL_198:
          return result;
        }
        objc_msgSend_addObject_(v460, v527, (uint64_t)v463);

        unint64_t v188 = 0x263F08000;
      }
      *(void *)&v189->mError = 0;
      v189->mFile = 0;
      *(void *)&v189->mLine = 0;
      if (v538 == 33)
      {
        v189->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
        v189->mLine = 147;
      }
      else
      {
        *(_OWORD *)&v189->mError = *(_OWORD *)v533;
        *(void *)&v189->mLine = v533[2];
        if (v189->mError) {
          goto LABEL_192;
        }
      }
      objc_msgSend_setExternalIDList_(v192, v509, (uint64_t)v460, v533);

      retstr = v189;
    }
    else
    {
      objc_msgSend_setExternalIDList_(v192, v507, 0);
    }
    objc_msgSend_addObject_(v534, v528, (uint64_t)v192, v533);

    unint64_t v187 = v191;
  }
  *(void *)&retstr->mError = 0;
  retstr->mFile = 0;
  *(void *)&retstr->mLine = 0;
  if (v567 == 33)
  {
    retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/app/data-model/DecodableList.h";
    retstr->mLine = 147;
  }
  else
  {
    *(_OWORD *)&retstr->mError = v567;
    *(void *)&retstr->mLine = v568;
    if (retstr->mError) {
      goto LABEL_198;
    }
  }
  objc_msgSend_setProgramList_(self, v190, (uint64_t)v534, v533);

  retstr->mError = 0;
  retstr->mFile = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/zap-gene"
                  "rated/MTRCommandPayloadsObjc.mm";
  retstr->mLine = 27198;
  return result;
}

@end