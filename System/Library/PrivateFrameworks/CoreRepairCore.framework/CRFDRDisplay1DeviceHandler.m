@interface CRFDRDisplay1DeviceHandler
+ (BOOL)isDisplay1ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (BOOL)syncSysConfig:(id)a3 key:(unsigned int)a4 inBuffer:(id)a5;
- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6;
- (NSDictionary)KBBTransferProperties;
- (NSString)KBBMLBSerialNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3;
- (id)getExcludedPropertiesForFactoryReset;
- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6;
- (int64_t)mlbRepairChecks;
- (int64_t)performPostSealingStage:(id)a3;
- (void)setKBBMLBSerialNumber:(id)a3;
- (void)setKBBTransferProperties:(id)a3;
@end

@implementation CRFDRDisplay1DeviceHandler

+ (BOOL)isDisplay1ProductType:(int)a3
{
  return *(void *)&a3 == 376943508;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isDisplay1ProductType_(CRFDRDisplay1DeviceHandler, a2, *(uint64_t *)&a3, v3))v4 = objc_alloc_init(CRFDRDisplay1DeviceHandler); {
  else
  }
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRDisplay1DeviceHandler);
}

- (id)getExcludedPropertiesForFactoryReset
{
  return &unk_26D163440;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  v304[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  v290 = 0;
  id v274 = (id)objc_opt_new();
  v14 = objc_msgSend_currentProperties(self, v11, v12, v13);
  obuint64_t j = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);

  if (objc_msgSend_allowFactoryReset(self, v18, v19, v20))
  {
    v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "Resetting to factory settings", buf, 2u);
    }

    objc_msgSend_setObject_forKeyedSubscript_(obj, v25, @"1", @"SrvP");
    v29 = objc_msgSend_getExcludedPropertiesForFactoryReset(self, v26, v27, v28);
    objc_msgSend_removeObjectsForKeys_(obj, v30, (uint64_t)v29, v31);
    v32 = AMFDRGetOptions();
    v35 = v32;
    if (v32)
    {
      v36 = v29;
      v37 = a5;
      v38 = objc_msgSend_objectForKeyedSubscript_(v32, v33, @"Metadata", v34);
      v45 = objc_msgSend_mutableCopy(v38, v39, v40, v41);
      if (v45)
      {
        v46 = objc_msgSend_currentProperties(self, v42, v43, v44);
        v49 = objc_msgSend_objectForKeyedSubscript_(v46, v47, @"mlb#", v48);

        if (v49)
        {
          v304[0] = @"SerialNumber";
          v51 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v50, (uint64_t)v304, 1);
          objc_msgSend_removeObjectsForKeys_(v45, v52, (uint64_t)v51, v53);

          v57 = objc_msgSend_currentProperties(self, v54, v55, v56);
          v60 = objc_msgSend_objectForKeyedSubscript_(v57, v58, @"mlb#", v59);
          objc_msgSend_setObject_forKeyedSubscript_(v45, v61, (uint64_t)v60, @"MLBNumber");

          AMFDRSetOption();
        }
      }
      v62 = handleForCategory(0);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v45;
        _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
      }

      a5 = v37;
      v29 = v36;
    }

    v63 = 0;
    v64 = 0;
    goto LABEL_36;
  }
  if (objc_msgSend_isServicePart(self, v21, v22, v23))
  {
    if ((objc_msgSend_containsObject_(v10, v65, @"MLB", v66) & 1) == 0)
    {
      v110 = handleForCategory(0);
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
        sub_21FC5ED88();
      }

      v111 = (void *)MEMORY[0x263F087E8];
      uint64_t v300 = *MEMORY[0x263F08320];
      v301 = @"KGB isServicePart without MLB SPC";
      uint64_t v113 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v112, (uint64_t)&v301, (uint64_t)&v300, 1);
      v114 = v111;
      v29 = v113;
      v64 = objc_msgSend_errorWithDomain_code_userInfo_(v114, v115, @"com.apple.corerepair", -30, v113);
      goto LABEL_35;
    }
    id v289 = 0;
    v29 = objc_msgSend_getDataClassesAndInstancesOfKBBWith_propertiesDict_fdrError_(self, v67, (uint64_t)a4, (uint64_t)&v290, &v289);
    id v68 = v289;
    if (v68)
    {
      v64 = v68;
      v71 = handleForCategory(0);
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
        sub_21FC5ED54();
      }
LABEL_17:

LABEL_35:
      v63 = 0;
LABEL_36:

      goto LABEL_37;
    }
    v265 = v29;
    v270 = a5;
    if (v290)
    {
      v139 = objc_msgSend_objectForKeyedSubscript_(v290, v69, @"mlb#", v70);
      v143 = objc_msgSend_KBBMLBSerialNumber(self, v140, v141, v142);
      char isEqualToString = objc_msgSend_isEqualToString_(v139, v144, (uint64_t)v143, v145);

      if ((isEqualToString & 1) == 0)
      {
        v148 = NSString;
        v149 = objc_msgSend_KBBSerialNumber(self, v69, v147, v70);
        v153 = objc_msgSend_KBBMLBSerialNumber(self, v150, v151, v152);
        v156 = objc_msgSend_objectForKeyedSubscript_(v290, v154, @"mlb#", v155);
        v159 = objc_msgSend_stringWithFormat_(v148, v157, @"FGSN: %@, Entered KBB MLBSN: %@ doesn't match MLBSN in seal properties %@", v158, v149, v153, v156);
        objc_msgSend_storeWarningStrings_(self, v160, (uint64_t)v159, v161);
      }
      if (v290)
      {
        v162 = objc_msgSend_objectForKeyedSubscript_(v290, v69, @"SrvP", v70);
        int v165 = objc_msgSend_isEqualToString_(v162, v163, @"1", v164);

        if (v165)
        {
          v166 = handleForCategory(0);
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR)) {
            sub_21FC5ED20();
          }

          v167 = (void *)MEMORY[0x263F087E8];
          uint64_t v298 = *MEMORY[0x263F08320];
          v299 = @"KBB isServicePart";
          v71 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v168, (uint64_t)&v299, (uint64_t)&v298, 1);
          v64 = objc_msgSend_errorWithDomain_code_userInfo_(v167, v169, @"com.apple.corerepair", -29, v71);
          a5 = v270;
          v29 = v265;
          goto LABEL_17;
        }
      }
    }
    v273 = a6;
    v77 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v69, (uint64_t)&unk_26D163458, v70);
    if (v290 && objc_msgSend_count(v290, v170, v171, v172))
    {
      id v267 = v10;
      long long v287 = 0u;
      long long v288 = 0u;
      long long v285 = 0u;
      long long v286 = 0u;
      v173 = v290;
      uint64_t v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v285, (uint64_t)v297, 16);
      if (v175)
      {
        uint64_t v178 = v175;
        uint64_t v179 = *(void *)v286;
        do
        {
          for (uint64_t i = 0; i != v178; ++i)
          {
            if (*(void *)v286 != v179) {
              objc_enumerationMutation(v173);
            }
            uint64_t v181 = *(void *)(*((void *)&v285 + 1) + 8 * i);
            if (objc_msgSend_containsObject_(v77, v176, v181, v177))
            {
              v185 = objc_msgSend_objectForKeyedSubscript_(v290, v176, v181, v177);
              if (v185)
              {
                objc_msgSend_setObject_forKeyedSubscript_(obj, v182, (uint64_t)v185, v181);
              }
              else
              {
                v186 = objc_msgSend_null(MEMORY[0x263EFF9D0], v182, v183, v184);
                objc_msgSend_setObject_forKeyedSubscript_(obj, v187, (uint64_t)v186, v181);
              }
            }
          }
          uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v176, (uint64_t)&v285, (uint64_t)v297, 16);
        }
        while (v178);
      }

      id v10 = v267;
    }
    v188 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v170, (uint64_t)obj, v172);
    objc_msgSend_setKBBTransferProperties_(self, v189, (uint64_t)v188, v190);

    objc_msgSend_setObject_forKeyedSubscript_(obj, v191, @"0", @"SrvP");
    uint64_t v195 = objc_msgSend_mlbRepairChecks(self, v192, v193, v194);
    v76 = v265;
    if (v195)
    {
      uint64_t v196 = v195;
      v197 = handleForCategory(0);
      if (os_log_type_enabled(v197, OS_LOG_TYPE_ERROR)) {
        sub_21FC5ECEC();
      }

      v198 = (void *)MEMORY[0x263F087E8];
      uint64_t v295 = *MEMORY[0x263F08320];
      v201 = objc_msgSend_stringWithFormat_(NSString, v199, @"MLB repair pre-check failed", v200);
      v296 = v201;
      v203 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v202, (uint64_t)&v296, (uint64_t)&v295, 1);
      v64 = objc_msgSend_errorWithDomain_code_userInfo_(v198, v204, @"com.apple.corerepair", v196, v203);

      v63 = 0;
      a5 = v270;
      v29 = v265;
      goto LABEL_36;
    }
    v205 = AMFDRGetOptions();
    v84 = v205;
    if (v205)
    {
      v209 = objc_msgSend_objectForKeyedSubscript_(v205, v206, @"Metadata", v208);
      v216 = objc_msgSend_mutableCopy(v209, v210, v211, v212);
      if (v216)
      {
        v268 = v209;
        v217 = objc_msgSend_currentProperties(self, v213, v214, v215);
        v220 = objc_msgSend_objectForKeyedSubscript_(v217, v218, @"mlb#", v219);

        if (v220)
        {
          v224 = objc_msgSend_currentProperties(self, v221, v222, v223);
          v227 = objc_msgSend_objectForKeyedSubscript_(v224, v225, @"mlb#", v226);
          objc_msgSend_setObject_forKeyedSubscript_(v216, v228, (uint64_t)v227, @"MLBNumber");
        }
        v229 = objc_msgSend_objectForKeyedSubscript_(v290, v221, @"SrNm", v223);

        if (v229)
        {
          v232 = objc_msgSend_objectForKeyedSubscript_(v290, v230, @"SrNm", v231);
          objc_msgSend_setObject_forKeyedSubscript_(v216, v233, (uint64_t)v232, @"SerialNumber");
        }
        AMFDRSetOption();
        v209 = v268;
      }
      v234 = handleForCategory(0);
      if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v303 = v216;
        _os_log_impl(&dword_21FBF2000, v234, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
      }
    }
    if (!v265 || !objc_msgSend_count(v265, v206, v207, v208))
    {
      v63 = 0;
      goto LABEL_31;
    }
    v238 = (void *)MEMORY[0x263EFF9C0];
    v239 = objc_msgSend_allKeys(v265, v235, v236, v237);
    v63 = objc_msgSend_setWithArray_(v238, v240, (uint64_t)v239, v241);

    v244 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v242, (uint64_t)&unk_26D163470, v243);
    objc_msgSend_intersectSet_(v63, v245, (uint64_t)v244, v246);

    v247 = handleForCategory(0);
    if (os_log_type_enabled(v247, OS_LOG_TYPE_DEFAULT))
    {
      v251 = objc_msgSend_allObjects(v63, v248, v249, v250);
      *(_DWORD *)buf = 138412290;
      v303 = v251;
      _os_log_impl(&dword_21FBF2000, v247, OS_LOG_TYPE_DEFAULT, "MakedataCLasses:%@", buf, 0xCu);
    }
    if (!v63 || !objc_msgSend_count(v63, v252, v253, v254)) {
      goto LABEL_31;
    }
    long long v283 = 0u;
    long long v284 = 0u;
    long long v281 = 0u;
    long long v282 = 0u;
    v109 = v265;
    uint64_t v256 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v255, (uint64_t)&v281, (uint64_t)v294, 16);
    if (v256)
    {
      uint64_t v259 = v256;
      id v269 = v10;
      uint64_t v260 = *(void *)v282;
      do
      {
        for (uint64_t j = 0; j != v259; ++j)
        {
          if (*(void *)v282 != v260) {
            objc_enumerationMutation(v109);
          }
          uint64_t v262 = *(void *)(*((void *)&v281 + 1) + 8 * j);
          if (objc_msgSend_containsObject_(v63, v257, v262, v258))
          {
            v263 = objc_msgSend_objectForKeyedSubscript_(v109, v257, v262, v258);
            objc_msgSend_setObject_forKeyedSubscript_(v274, v264, (uint64_t)v263, v262);
          }
        }
        uint64_t v259 = objc_msgSend_countByEnumeratingWithState_objects_count_(v109, v257, (uint64_t)&v281, (uint64_t)v294, 16);
      }
      while (v259);
      v76 = v109;
      id v10 = v269;
      a6 = v273;
    }
    else
    {
      v76 = v109;
    }
LABEL_30:

LABEL_31:
    a5 = v270;
    goto LABEL_45;
  }
  v72 = handleForCategory(0);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v72, OS_LOG_TYPE_DEFAULT, "MLB SPC ignored when not servivce Parts", buf, 2u);
  }

  v73 = AMFDRGetOptions();
  v76 = v73;
  if (v73)
  {
    v77 = objc_msgSend_objectForKeyedSubscript_(v73, v74, @"Metadata", v75);
    v84 = objc_msgSend_mutableCopy(v77, v78, v79, v80);
    if (v84)
    {
      v85 = objc_msgSend_currentProperties(self, v81, v82, v83);
      v88 = objc_msgSend_objectForKeyedSubscript_(v85, v86, @"mlb#", v87);

      if (v88)
      {
        v92 = objc_msgSend_currentProperties(self, v89, v90, v91);
        v95 = objc_msgSend_objectForKeyedSubscript_(v92, v93, @"mlb#", v94);
        objc_msgSend_setObject_forKeyedSubscript_(v84, v96, (uint64_t)v95, @"MLBNumber");
      }
      v97 = objc_msgSend_currentProperties(self, v89, v90, v91);
      v100 = objc_msgSend_objectForKeyedSubscript_(v97, v98, @"SrNm", v99);

      if (v100)
      {
        v104 = objc_msgSend_currentProperties(self, v101, v102, v103);
        v107 = objc_msgSend_objectForKeyedSubscript_(v104, v105, @"SrNm", v106);
        objc_msgSend_setObject_forKeyedSubscript_(v84, v108, (uint64_t)v107, @"SerialNumber");
      }
      AMFDRSetOption();
    }
    v270 = a5;
    v109 = handleForCategory(0);
    if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v303 = v84;
      _os_log_impl(&dword_21FBF2000, v109, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }
    v63 = 0;
    goto LABEL_30;
  }
  v63 = 0;
LABEL_45:

  if (objc_msgSend_containsObject_(v10, v117, @"LCD", v118))
  {
    v271 = a5;
    long long v279 = 0u;
    long long v280 = 0u;
    long long v277 = 0u;
    long long v278 = 0u;
    uint64_t v120 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163488, v119, (uint64_t)&v277, (uint64_t)v293, 16);
    if (v120)
    {
      uint64_t v123 = v120;
      v272 = a6;
      id v266 = v10;
      uint64_t v124 = *(void *)v278;
LABEL_48:
      uint64_t v125 = 0;
      while (1)
      {
        if (*(void *)v278 != v124) {
          objc_enumerationMutation(&unk_26D163488);
        }
        uint64_t v126 = *(void *)(*((void *)&v277 + 1) + 8 * v125);
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v121, v126, v122))
        {
          id v276 = 0;
          int v127 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v121, (uint64_t)v274, v126, &v276);
          id v128 = v276;
          if (!v127 || v128 != 0) {
            break;
          }
        }
        if (v123 == ++v125)
        {
          uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163488, v121, (uint64_t)&v277, (uint64_t)v293, 16);
          if (v123) {
            goto LABEL_48;
          }
          v64 = 0;
          id v10 = v266;
          a6 = v272;
          goto LABEL_66;
        }
      }
      v64 = v128;
      v130 = handleForCategory(0);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
        sub_21FC5EC84();
      }

      id v10 = v266;
      a5 = v271;
      a6 = v272;
      if (!v64)
      {
        v134 = (void *)MEMORY[0x263F087E8];
        uint64_t v291 = *MEMORY[0x263F08320];
        uint64_t v135 = objc_msgSend_stringWithFormat_(NSString, v132, @"Unable to copy current identifier for dataClass:%@", v133, v126);
        uint64_t v292 = v135;
        v137 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v136, (uint64_t)&v292, (uint64_t)&v291, 1);
        v64 = objc_msgSend_errorWithDomain_code_userInfo_(v134, v138, @"com.apple.corerepair", -26, v137);

        v29 = v135;
        goto LABEL_36;
      }
    }
    else
    {
      v64 = 0;
LABEL_66:
      a5 = v271;
    }
  }
  else
  {
    v64 = 0;
  }
LABEL_37:
  if (a5) {
    objc_storeStrong(a5, obj);
  }
  if (a6) {
    *a6 = v64;
  }

  return v274;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3
{
  uint64_t v3 = objc_opt_new();
  v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_21FC5EDBC();
  }

  return v3;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  v75[1] = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  v14 = objc_msgSend_currentProperties(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"SrNm", v16);

  v21 = objc_msgSend_currentProperties(self, v18, v19, v20);
  v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, @"mlb#", v23);

  uint64_t v27 = objc_msgSend_componentsSeparatedByString_(v10, v25, @",", v26);
  if (!objc_msgSend_count(v27, v28, v29, v30) || (unint64_t)objc_msgSend_count(v27, v31, v32, v33) >= 3)
  {
    v37 = handleForCategory(0);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_21FC5EDF0((uint64_t)v10, v37, v38, v39, v40, v41, v42, v43);
    }

    uint64_t v44 = (void *)MEMORY[0x263F087E8];
    uint64_t v74 = *MEMORY[0x263F08320];
    v75[0] = @"Serial number entered not valid";
    v46 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v45, (uint64_t)v75, (uint64_t)&v74, 1);
    uint64_t v48 = objc_msgSend_errorWithDomain_code_userInfo_(v44, v47, @"com.apple.corerepair", -34, v46);
    goto LABEL_6;
  }
  if (objc_msgSend_count(v27, v34, v35, v36) == 2)
  {
    v46 = objc_msgSend_objectAtIndexedSubscript_(v27, v50, 1, v51);
  }
  else
  {
    v46 = 0;
  }
  v52 = objc_msgSend_objectAtIndexedSubscript_(v27, v50, 0, v51);
  if ((objc_msgSend_allowFactoryReset(self, v53, v54, v55) & 1) == 0)
  {
    if (v17)
    {
      if ((objc_msgSend_isEqualToString_(v17, v56, (uint64_t)v52, v57) & 1) == 0)
      {
        v58 = handleForCategory(0);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          sub_21FC5EEC4();
        }

        objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v59, (uint64_t)&v71, (uint64_t)&v70, 1, MEMORY[0x263F087E8], *MEMORY[0x263F08320], @"Serial number passed in doesn't match what's on device", v72, v73);
        v67 = LABEL_25:;
        uint64_t v48 = objc_msgSend_errorWithDomain_code_userInfo_(v69, v68, @"com.apple.corerepair", -27, v67);

LABEL_6:
        BOOL v49 = 0;
        goto LABEL_19;
      }
    }
    else if (!v24 || (objc_msgSend_isEqualToString_(v24, v56, (uint64_t)v9, v57) & 1) == 0)
    {
      v65 = handleForCategory(0);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_21FC5EE5C();
      }

      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v66, (uint64_t)&v73, (uint64_t)&v72, 1, MEMORY[0x263F087E8], v70, v71, *MEMORY[0x263F08320], @"MLB Serial number passed in doesn't match what's on device");
      goto LABEL_25;
    }
  }
  objc_msgSend_setKBBSerialNumber_(self, v56, (uint64_t)v52, v57);
  objc_msgSend_setKGBSerialNumber_(self, v60, (uint64_t)v9, v61);
  objc_msgSend_setKBBMLBSerialNumber_(self, v62, (uint64_t)v46, v63);

  uint64_t v48 = 0;
  BOOL v49 = 1;
LABEL_19:

  if (a6) {
    *a6 = v48;
  }

  return v49;
}

- (int64_t)performPostSealingStage:(id)a3
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = handleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v108) = 0;
    _os_log_impl(&dword_21FBF2000, v5, OS_LOG_TYPE_DEFAULT, "performPostSealingStage...", (uint8_t *)&v108, 2u);
  }

  int v8 = objc_msgSend_containsObject_(v4, v6, @"MLB", v7);
  if (!v8) {
    return 0;
  }
  int64_t v12 = objc_msgSend_mlbRepairChecks(self, v9, v10, v11);
  if (!v12)
  {
    uint64_t v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v108 = 138412290;
      v109 = @"Mod#";
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
    }

    uint64_t v17 = objc_msgSend_KBBTransferProperties(self, v14, v15, v16);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"Mod#", v19);

    id v21 = objc_alloc(MEMORY[0x263EFF990]);
    v24 = objc_msgSend_initWithCapacity_(v21, v22, 16, v23);
    objc_msgSend_resetBytesInRange_(v24, v25, 0, 16);
    uint64_t v29 = objc_msgSend_length(v20, v26, v27, v28);
    id v30 = v20;
    uint64_t v34 = objc_msgSend_UTF8String(v30, v31, v32, v33);
    objc_msgSend_replaceBytesInRange_withBytes_(v24, v35, 0, v29, v34);
    LOBYTE(v29) = objc_msgSend_syncSysConfig_key_inBuffer_(self, v36, @"Mod#", 5036, v24);
    v37 = handleForCategory(0);
    uint64_t v38 = v37;
    if (v29)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int v108 = 138412290;
        v109 = @"Regn";
        _os_log_impl(&dword_21FBF2000, v38, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
      }

      uint64_t v42 = objc_msgSend_KBBTransferProperties(self, v39, v40, v41);
      uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v42, v43, @"Regn", v44);

      id v46 = objc_alloc(MEMORY[0x263EFF990]);
      BOOL v49 = objc_msgSend_initWithCapacity_(v46, v47, 16, v48);
      objc_msgSend_resetBytesInRange_(v49, v50, 0, 16);
      uint64_t v54 = objc_msgSend_length((void *)v45, v51, v52, v53);
      uint64_t v38 = (id) v45;
      uint64_t v58 = objc_msgSend_UTF8String(v38, v55, v56, v57);
      objc_msgSend_replaceBytesInRange_withBytes_(v49, v59, 0, v54, v58);
      LOBYTE(v45) = objc_msgSend_syncSysConfig_key_inBuffer_(self, v60, @"Regn", 31964, v49);
      uint64_t v61 = handleForCategory(0);
      v62 = v61;
      if (v45)
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          int v108 = 138412290;
          v109 = @"SrNm";
          _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "Syncing sysconfig: %@", (uint8_t *)&v108, 0xCu);
        }

        uint64_t v66 = objc_msgSend_KBBTransferProperties(self, v63, v64, v65);
        v69 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"SrNm", v68);

        id v70 = objc_alloc(MEMORY[0x263EFF990]);
        uint64_t v73 = objc_msgSend_initWithCapacity_(v70, v71, 16, v72);
        objc_msgSend_resetBytesInRange_(v73, v74, 0, 16);
        uint64_t v78 = objc_msgSend_length(v69, v75, v76, v77);
        v62 = v69;
        uint64_t v82 = objc_msgSend_UTF8String(v62, v79, v80, v81);
        objc_msgSend_replaceBytesInRange_withBytes_(v73, v83, 0, v78, v82);
        int64_t v12 = 0;
        if ((objc_msgSend_syncSysConfig_key_inBuffer_(self, v84, @"SrNm", 46339, v73) & 1) == 0)
        {
          v85 = handleForCategory(0);
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
            sub_21FC5EF2C(v85, v86, v87, v88, v89, v90, v91, v92);
          }

          int64_t v12 = 65;
        }
      }
      else
      {
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_21FC5EFA4(v62, v100, v101, v102, v103, v104, v105, v106);
        }
        int64_t v12 = 64;
      }
    }
    else
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_21FC5F01C(v38, v93, v94, v95, v96, v97, v98, v99);
      }
      int64_t v12 = 63;
    }
  }
  return v12;
}

- (BOOL)syncSysConfig:(id)a3 key:(unsigned int)a4 inBuffer:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int64_t v12 = objc_msgSend_sharedAccess(CRSysConfig, v9, v10, v11);
  LOBYTE(v6) = objc_msgSend_writeSystemConfig_inBuffer_(v12, v13, v6, (uint64_t)v8);

  if (v6)
  {
    uint64_t v17 = objc_msgSend_sharedAccess(CRSysConfig, v14, v15, v16);
    id v21 = objc_msgSend_readSystemConfigAll(v17, v18, v19, v20);

    v24 = objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v7, v23);
    uint64_t v27 = v24;
    if (v24)
    {
      if (objc_msgSend_isEqualToData_(v24, v25, (uint64_t)v8, v26))
      {
        BOOL v28 = 1;
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v35 = handleForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        int v43 = 138412802;
        id v44 = v7;
        __int16 v45 = 2112;
        id v46 = v8;
        __int16 v47 = 2112;
        uint64_t v48 = v27;
        _os_log_error_impl(&dword_21FBF2000, v35, OS_LOG_TYPE_ERROR, "Sysconfig %@ mismatch after write, expect:%@ actual:%@", (uint8_t *)&v43, 0x20u);
      }
    }
    else
    {
      uint64_t v35 = handleForCategory(0);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        sub_21FC5F094((uint64_t)v7, v35, v36, v37, v38, v39, v40, v41);
      }
    }

    BOOL v28 = 0;
    goto LABEL_13;
  }
  id v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_21FC5F100((uint64_t)v7, v21, v29, v30, v31, v32, v33, v34);
  }
  BOOL v28 = 0;
LABEL_14:

  return v28;
}

- (int64_t)mlbRepairChecks
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend_sharedAccess(CRSysConfig, a2, v2, v3);
  id v9 = objc_msgSend_readSystemConfigAll(v5, v6, v7, v8);

  uint64_t v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v94 = 138412290;
    uint64_t v95 = v9;
    _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, "SysCfg Dict: %@", (uint8_t *)&v94, 0xCu);
  }

  uint64_t v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_KBBTransferProperties(self, v12, v13, v14);
    int v94 = 138412290;
    uint64_t v95 = v15;
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "KBB transfer properties: %@", (uint8_t *)&v94, 0xCu);
  }
  uint64_t v19 = objc_msgSend_KBBTransferProperties(self, v16, v17, v18);
  uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"Mod#", v21);

  if (v22)
  {
    uint64_t v26 = objc_msgSend_KBBTransferProperties(self, v23, v24, v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, @"Regn", v28);

    if (v29)
    {
      uint64_t v33 = objc_msgSend_KBBTransferProperties(self, v30, v31, v32);
      uint64_t v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"SrNm", v35);

      if (v36)
      {
        uint64_t v40 = objc_msgSend_KBBTransferProperties(self, v37, v38, v39);
        int v43 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"Mod#", v42);

        if ((unint64_t)objc_msgSend_length(v43, v44, v45, v46) <= 0x10
          && objc_msgSend_length(v43, v47, v48, v49))
        {
          uint64_t v53 = objc_msgSend_KBBTransferProperties(self, v50, v51, v52);
          uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v53, v54, @"Regn", v55);

          if ((unint64_t)objc_msgSend_length(v56, v57, v58, v59) <= 0x10
            && objc_msgSend_length(v56, v60, v61, v62))
          {
            uint64_t v66 = objc_msgSend_KBBTransferProperties(self, v63, v64, v65);
            v69 = objc_msgSend_objectForKeyedSubscript_(v66, v67, @"SrNm", v68);

            if ((unint64_t)objc_msgSend_length(v69, v70, v71, v72) <= 0x10
              && objc_msgSend_length(v69, v73, v74, v75))
            {
              uint64_t v78 = objc_msgSend_objectForKeyedSubscript_(v9, v76, @"Mod#", v77);

              if (v78)
              {
                uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v9, v79, @"Regn", v80);

                if (v81)
                {
                  v84 = objc_msgSend_objectForKeyedSubscript_(v9, v82, @"SrNm", v83);
                  uint64_t v87 = objc_msgSend_objectForKeyedSubscript_(v9, v85, @"XXSN", v86);
                  uint64_t v91 = v87;
                  if (v87)
                  {
                    if (v84)
                    {
                      int64_t v92 = 58;
                    }
                    else if ((unint64_t)objc_msgSend_length(v87, v88, v89, v90) <= 0x10)
                    {
                      int64_t v92 = 0;
                    }
                    else
                    {
                      int64_t v92 = 60;
                    }
                  }
                  else
                  {
                    int64_t v92 = 59;
                  }
                }
                else
                {
                  int64_t v92 = 62;
                }
              }
              else
              {
                int64_t v92 = 61;
              }
            }
            else
            {
              int64_t v92 = -54;
            }
          }
          else
          {
            int64_t v92 = -53;
          }
        }
        else
        {
          int64_t v92 = -52;
        }
      }
      else
      {
        int64_t v92 = -57;
      }
    }
    else
    {
      int64_t v92 = -56;
    }
  }
  else
  {
    int64_t v92 = -55;
  }

  return v92;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v47 = 0;
  int64_t v12 = objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v47, a8);
  if (!a8 || !*a8)
  {
    uint64_t v13 = objc_opt_new();
    uint64_t v21 = objc_opt_new();
    uint64_t v22 = (void *)v21;
    if (v13) {
      BOOL v23 = v21 == 0;
    }
    else {
      BOOL v23 = 1;
    }
    BOOL v20 = !v23;
    if (v23)
    {
      uint64_t v39 = handleForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_21FC5F16C();
      }
    }
    else
    {
      uint64_t v41 = a6;
      uint64_t v42 = a7;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v24 = v12;
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v43, (uint64_t)v48, 16);
      if (v26)
      {
        uint64_t v29 = v26;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v24);
            }
            uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v41, v42, (void)v43);
            uint64_t v35 = objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);
          }
          uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v43, (uint64_t)v48, 16);
        }
        while (v29);
      }

      if (a5) {
        objc_storeStrong(a5, v13);
      }
      if (v41) {
        objc_storeStrong(v41, v22);
      }
      if (!v42) {
        goto LABEL_29;
      }
      id v38 = v47;
      uint64_t v39 = *v42;
      id *v42 = v38;
    }

LABEL_29:
    goto LABEL_30;
  }
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_21FC5F1A0((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  }
  BOOL v20 = 0;
LABEL_30:

  return v20;
}

- (NSString)KBBMLBSerialNumber
{
  return self->KBBMLBSerialNumber;
}

- (void)setKBBMLBSerialNumber:(id)a3
{
}

- (NSDictionary)KBBTransferProperties
{
  return self->_KBBTransferProperties;
}

- (void)setKBBTransferProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KBBTransferProperties, 0);
  objc_storeStrong((id *)&self->KBBMLBSerialNumber, 0);
}

@end