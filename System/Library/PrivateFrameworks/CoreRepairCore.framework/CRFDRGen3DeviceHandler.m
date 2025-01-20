@interface CRFDRGen3DeviceHandler
+ (BOOL)isGen3ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4;
- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4;
- (id)spcWithComponent:(id)a3;
- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4;
@end

@implementation CRFDRGen3DeviceHandler

+ (BOOL)isGen3ProductType:(int)a3
{
  BOOL result = 1;
  if (*(uint64_t *)&a3 > 3001488777)
  {
    if (*(uint64_t *)&a3 > 3885279869)
    {
      if (*(void *)&a3 == 3885279870) {
        return result;
      }
      uint64_t v4 = 4201643249;
    }
    else
    {
      if (*(void *)&a3 == 3001488778) {
        return result;
      }
      uint64_t v4 = 3585085679;
    }
  }
  else if (*(uint64_t *)&a3 > 1169082143)
  {
    if (*(void *)&a3 == 1169082144) {
      return result;
    }
    uint64_t v4 = 2309863438;
  }
  else
  {
    if (*(void *)&a3 == 689804742) {
      return result;
    }
    uint64_t v4 = 1060988941;
  }
  if (*(void *)&a3 != v4) {
    return 0;
  }
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen3ProductType_(CRFDRGen3DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRFDRGen3DeviceHandler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen3DeviceHandler);
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    v25 = a4;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend_isEqualToString_(v15, v10, @"IPHONE COMP BATTERY", v11, v25))
        {
          id v28 = 0;
          int v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v7, @"vcrt", &v28);
          id v19 = v28;
          v20 = v19;
          if (!v18 || v19)
          {
            v23 = handleForCategory(0);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
LABEL_19:
            }
              sub_21FC61764();
LABEL_20:
            a4 = v25;

            goto LABEL_21;
          }
        }
        if (objc_msgSend_isEqualToString_(v15, v16, @"IPHONE COMP DISPLAY", v17))
        {
          id v27 = 0;
          int v21 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v10, (uint64_t)v7, @"tcrt", &v27);
          id v22 = v27;
          v20 = v22;
          if (!v21 || v22)
          {
            v23 = handleForCategory(0);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              goto LABEL_19;
            }
            goto LABEL_20;
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v12) {
        continue;
      }
      break;
    }
    v20 = 0;
    a4 = v25;
  }
  else
  {
    v20 = 0;
  }
LABEL_21:

  if (a4) {
    *a4 = v20;
  }

  return v7;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  int v10 = objc_msgSend_containsObject_(v6, v8, @"IPHONE COMP FACEID", v9);

  if (v10
    && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, @"psd2", v12))
  {
    id v20 = 0;
    int v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, @"psd2", &v20);
    id v15 = v20;
    id v16 = v15;
    if (!v14 || (uint64_t v17 = 0, v15))
    {
      int v18 = handleForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC616FC();
      }

      uint64_t v17 = v16;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (a4) {
    *a4 = v17;
  }

  return v7;
}

- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4
{
  v33[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend_containsObject_(v5, v7, @"IPHONE COMP CAMERA", v8))
  {
    if (!v6) {
      goto LABEL_10;
    }
LABEL_6:
    uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"PrCL", v10);

    if (!v13)
    {
LABEL_10:
      uint64_t v12 = 0;
      goto LABEL_15;
    }
    if (objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v14, @"PrCL", v15))
    {
      int v18 = (void *)MEMORY[0x263EFF8F8];
      id v19 = objc_msgSend_objectForKeyedSubscript_(v6, v16, @"PrCL", v17);
      id v22 = objc_msgSend_dataWithHexString_(v18, v20, (uint64_t)v19, v21);

      if (v22)
      {
        long long v32 = @"PrCL";
        v33[0] = v22;
        uint64_t v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v33, (uint64_t)&v32, 1);
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      id v22 = handleForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_21FC61D18(v22, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  char v11 = objc_msgSend_containsObject_(v5, v9, @"IPHONE REAR ASSEMBLY", v10);
  uint64_t v12 = 0;
  if (v6 && (v11 & 1) != 0) {
    goto LABEL_6;
  }
LABEL_15:

  return v12;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  uint64_t v277 = *MEMORY[0x263EF8340];
  id v10 = a3;
  v268 = 0;
  v235 = objc_opt_new();
  int v14 = objc_msgSend_currentProperties(self, v11, v12, v13);
  int v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);

  id v19 = AMFDRGetOptions();
  v23 = v19;
  v234 = v18;
  if (v19)
  {
    uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"Metadata", v22);
    long long v31 = objc_msgSend_mutableCopy(v24, v25, v26, v27);
    if (v31)
    {
      long long v32 = a4;
      v33 = objc_msgSend_currentProperties(self, v28, v29, v30);
      v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"mlb#", v35);

      if (v36)
      {
        v40 = objc_msgSend_currentProperties(self, v37, v38, v39);
        v43 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"mlb#", v42);
        objc_msgSend_setObject_forKeyedSubscript_(v31, v44, (uint64_t)v43, @"MLBNumber");
      }
      v45 = objc_msgSend_currentProperties(self, v37, v38, v39);
      v48 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"SrNm", v47);

      if (v48)
      {
        v52 = objc_msgSend_currentProperties(self, v49, v50, v51);
        v55 = objc_msgSend_objectForKeyedSubscript_(v52, v53, @"SrNm", v54);
        objc_msgSend_setObject_forKeyedSubscript_(v31, v56, (uint64_t)v55, @"SerialNumber");
      }
      a4 = v32;
      AMFDRSetOption();
    }
    v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v276 = (uint64_t)v31;
      _os_log_impl(&dword_21FBF2000, v57, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }

    int v18 = v234;
  }
  v233 = v23;
  if (objc_msgSend_allowFactoryReset(self, v20, v21, v22))
  {
    objc_msgSend_setObject_forKeyedSubscript_(v18, v58, @"1", @"SrvP");
    v61 = 0;
    v62 = 0;
    goto LABEL_215;
  }
  if (objc_msgSend_isServicePart(self, v58, v59, v60))
  {
    if ((objc_msgSend_containsObject_(v10, v63, @"IPHONE REAR ASSEMBLY", v64) & 1) == 0
      && (objc_msgSend_containsObject_(v10, v65, @"IPHONE MID ASSEMBLY", v66) & 1) == 0
      && (objc_msgSend_containsObject_(v10, v65, @"IPHONE MCTUB", v67) & 1) == 0)
    {
      v62 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE2, @"KGB isServicePart without MTUB SPC", 0);
      v61 = 0;
      goto LABEL_215;
    }
    id v267 = 0;
    v68 = objc_msgSend_getDataClassesAndInstancesOfKBBWith_propertiesDict_fdrError_(self, v65, (uint64_t)a4, (uint64_t)&v268, &v267);
    v69 = v267;
    if (v69)
    {
      v62 = v69;
      v72 = handleForCategory(0);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
        sub_21FC61E60(v72);
      }

      v61 = 0;
      goto LABEL_21;
    }
    if (v268)
    {
      v166 = objc_msgSend_objectForKeyedSubscript_(v268, v70, @"SrvP", v71);
      int isEqualToString = objc_msgSend_isEqualToString_(v166, v167, @"1", v168);

      if (isEqualToString)
      {
        v62 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE3, @"KBB isServicePart", 0);
        v61 = 0;
        int v18 = v234;
LABEL_21:

        goto LABEL_215;
      }
    }
    v170 = handleForCategory(0);
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v276 = (uint64_t)v268;
      _os_log_impl(&dword_21FBF2000, v170, OS_LOG_TYPE_DEFAULT, "temp makeProperties:%@", buf, 0xCu);
    }

    v173 = v234;
    if (v268)
    {
      v174 = objc_msgSend_objectForKeyedSubscript_(v268, v171, @"drp#", v172);

      if (v174)
      {
        v176 = objc_msgSend_objectForKeyedSubscript_(v268, v171, @"drp#", v175);
        objc_msgSend_setObject_forKeyedSubscript_(v234, v177, (uint64_t)v176, @"drp#");

        v173 = v234;
        v178 = handleForCategory(0);
        if (os_log_type_enabled(v178, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v276 = (uint64_t)v234;
          _os_log_impl(&dword_21FBF2000, v178, OS_LOG_TYPE_DEFAULT, "transferring properties:%@", buf, 0xCu);
        }

        v181 = objc_msgSend_objectForKeyedSubscript_(v234, v179, @"drp#", v180);
        objc_msgSend_setKbbCGSN_(self, v182, (uint64_t)v181, v183);
      }
    }
    objc_msgSend_setObject_forKeyedSubscript_(v173, v171, @"0", @"SrvP");
    v230 = a6;
    if (v68 && objc_msgSend_count(v68, v184, v185, v186))
    {
      if (objc_msgSend_supportMctubMinus(self, v187, v188, v189)) {
        v193 = &unk_26D1636C8;
      }
      else {
        v193 = &unk_26D163638;
      }
      v194 = (void *)MEMORY[0x263EFF9C0];
      v195 = objc_msgSend_allKeys(v68, v190, v191, v192);
      v61 = objc_msgSend_setWithArray_(v194, v196, (uint64_t)v195, v197);

      v200 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v198, (uint64_t)v193, v199);
      objc_msgSend_intersectSet_(v61, v201, (uint64_t)v200, v202);

      v203 = handleForCategory(0);
      if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_allObjects(v61, v204, v205, v206);
        id v207 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        uint64_t v276 = (uint64_t)v207;
        _os_log_impl(&dword_21FBF2000, v203, OS_LOG_TYPE_DEFAULT, "MakedataCLasses:%@", buf, 0xCu);
      }
      int v18 = v234;
      if (!v61 || !objc_msgSend_count(v61, v208, v209, v210))
      {
        v62 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE6, @"Get Make DataClasses failed", 0);
        goto LABEL_21;
      }
      v229 = a5;
      id v232 = v10;
      long long v265 = 0u;
      long long v266 = 0u;
      long long v263 = 0u;
      long long v264 = 0u;
      id v211 = v68;
      uint64_t v213 = objc_msgSend_countByEnumeratingWithState_objects_count_(v211, v212, (uint64_t)&v263, (uint64_t)v274, 16);
      if (v213)
      {
        uint64_t v216 = v213;
        uint64_t v217 = *(void *)v264;
        do
        {
          for (uint64_t i = 0; i != v216; ++i)
          {
            if (*(void *)v264 != v217) {
              objc_enumerationMutation(v211);
            }
            uint64_t v219 = *(void *)(*((void *)&v263 + 1) + 8 * i);
            if (objc_msgSend_containsObject_(v61, v214, v219, v215)
              && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v214, v219, v215))
            {
              objc_msgSend_objectForKeyedSubscript_(v211, v214, v219, v215);
              v221 = v220 = v61;
              objc_msgSend_setObject_forKeyedSubscript_(v235, v222, (uint64_t)v221, v219);

              v61 = v220;
            }
          }
          uint64_t v216 = objc_msgSend_countByEnumeratingWithState_objects_count_(v211, v214, (uint64_t)&v263, (uint64_t)v274, 16);
        }
        while (v216);
      }

      id v10 = v232;
    }
    else
    {
      v229 = a5;
      v61 = 0;
    }
    v228 = v61;
  }
  else
  {
    v229 = a5;
    v230 = a6;
    v228 = 0;
  }
  v231 = v10;
  if (objc_msgSend_containsObject_(v10, v63, @"IPHONE COMP DISPLAY", v64))
  {
    long long v261 = 0u;
    long long v262 = 0u;
    long long v259 = 0u;
    long long v260 = 0u;
    uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163650, v73, (uint64_t)&v259, (uint64_t)v273, 16);
    if (v75)
    {
      uint64_t v78 = v75;
      uint64_t v79 = *(void *)v260;
      do
      {
        uint64_t v80 = 0;
        do
        {
          if (*(void *)v260 != v79) {
            objc_enumerationMutation(&unk_26D163650);
          }
          uint64_t v81 = *(void *)(*((void *)&v259 + 1) + 8 * v80);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v76, v81, v77) & 1) == 0)
          {
            v62 = handleForCategory(0);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v276 = v81;
              _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }
            goto LABEL_39;
          }
          id v258 = 0;
          char v83 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v82, (uint64_t)v235, v81, &v258);
          v62 = v258;
          if (objc_msgSend_allowMissingData(self, v84, v85, v86)
            && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v76, v81, v77))
          {
            if (v62) {
              char v88 = 0;
            }
            else {
              char v88 = v83;
            }
            if ((v88 & 1) == 0)
            {
              v89 = handleForCategory(0);
              if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v276 = v81;
                _os_log_impl(&dword_21FBF2000, v89, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
              }

LABEL_39:
            }
          }
          else
          {
            if (v62) {
              char v87 = 0;
            }
            else {
              char v87 = v83;
            }
            if ((v87 & 1) == 0)
            {
              v164 = handleForCategory(0);
              if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                sub_21FC61D90();
              }
LABEL_211:

              goto LABEL_212;
            }
          }
          ++v80;
        }
        while (v78 != v80);
        uint64_t v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163650, v76, (uint64_t)&v259, (uint64_t)v273, 16);
        uint64_t v78 = v90;
      }
      while (v90);
    }
    id v257 = 0;
    int v18 = v234;
    int v91 = objc_msgSend__addPropertyToMutableDictionary_property_withError_(self, v76, (uint64_t)v234, @"drp#", &v257);
    v92 = v257;
    v62 = v92;
    id v10 = v231;
    if (!v91 || v92)
    {
      v223 = handleForCategory(0);
      if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR)) {
        sub_21FC61DF8();
      }

      a5 = v229;
      a6 = v230;
      goto LABEL_214;
    }
  }
  if ((objc_msgSend_containsObject_(v10, v73, @"IPHONE COMP CAMERA", v74) & 1) != 0
    || objc_msgSend_containsObject_(v10, v93, @"IPHONE COMP RCAM", v95))
  {
    long long v253 = 0u;
    long long v254 = 0u;
    v97 = objc_msgSend_supportCameraDepth(self, v93, v94, v95) ? &unk_26D1636B0 : &unk_26D163668;
    long long v255 = 0uLL;
    long long v256 = 0uLL;
    uint64_t v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v96, (uint64_t)&v253, (uint64_t)v272, 16);
    if (v98)
    {
      uint64_t v99 = v98;
      uint64_t v100 = *(void *)v254;
      do
      {
        uint64_t v101 = 0;
        do
        {
          if (*(void *)v254 != v100) {
            objc_enumerationMutation(v97);
          }
          uint64_t v102 = *(void *)(*((void *)&v253 + 1) + 8 * v101);
          if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v93, v102, v95))
          {
            id v252 = 0;
            char v105 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v103, (uint64_t)v235, v102, &v252);
            v62 = v252;
            if (objc_msgSend_allowMissingData(self, v106, v107, v108)
              && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v103, v102, v104))
            {
              if (v62) {
                char v111 = 0;
              }
              else {
                char v111 = v105;
              }
              if ((v111 & 1) == 0)
              {
                v112 = handleForCategory(0);
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v276 = v102;
                  _os_log_impl(&dword_21FBF2000, v112, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
                }
              }
            }
            else
            {
              if (v62) {
                char v109 = 0;
              }
              else {
                char v109 = v105;
              }
              if ((v109 & 1) == 0)
              {
                v164 = handleForCategory(0);
                if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                  sub_21FC61D90();
                }
                goto LABEL_211;
              }
            }
          }
          if (objc_msgSend_isEqual_(@"CmCl", v103, v102, v104))
          {
            uint64_t v251 = 0;
            v110 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass();
            if (v110)
            {
              AMFDRSetAssemblyIdentifierToVerify();
            }
          }
          ++v101;
        }
        while (v99 != v101);
        uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v97, v93, (uint64_t)&v253, (uint64_t)v272, 16);
        uint64_t v99 = v113;
        id v10 = v231;
      }
      while (v113);
    }
  }
  if (objc_msgSend_containsObject_(v10, v93, @"IPHONE COMP FACEID", v95))
  {
    long long v249 = 0u;
    long long v250 = 0u;
    long long v247 = 0u;
    long long v248 = 0u;
    uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163680, v114, (uint64_t)&v247, (uint64_t)v271, 16);
    if (v116)
    {
      uint64_t v117 = v116;
      uint64_t v118 = *(void *)v248;
      do
      {
        uint64_t v119 = 0;
        do
        {
          if (*(void *)v248 != v118) {
            objc_enumerationMutation(&unk_26D163680);
          }
          uint64_t v120 = *(void *)(*((void *)&v247 + 1) + 8 * v119);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v114, v120, v115) & 1) == 0)
          {
            v129 = handleForCategory(0);
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v276 = v120;
              _os_log_impl(&dword_21FBF2000, v129, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }
            goto LABEL_100;
          }
          id v246 = 0;
          char v122 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v121, (uint64_t)v235, v120, &v246);
          v62 = v246;
          if (objc_msgSend_allowMissingData(self, v123, v124, v125)
            && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v126, v120, v127))
          {
            if (v62) {
              char v130 = 0;
            }
            else {
              char v130 = v122;
            }
            if ((v130 & 1) == 0)
            {
              v131 = handleForCategory(0);
              if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v276 = v120;
                _os_log_impl(&dword_21FBF2000, v131, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
              }
            }
          }
          else
          {
            if (v62) {
              char v128 = 0;
            }
            else {
              char v128 = v122;
            }
            if ((v128 & 1) == 0)
            {
              v164 = handleForCategory(0);
              if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                sub_21FC61D90();
              }
              goto LABEL_211;
            }
          }
          if (objc_msgSend_isEqual_(@"PlCl", v126, v120, v127))
          {
            v129 = AMFDRSealingMapCopyAssemblyIdentifierForClass();
            if (v129) {
              AMFDRSetAssemblyIdentifierToVerify();
            }
LABEL_100:
          }
          ++v119;
        }
        while (v117 != v119);
        uint64_t v132 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163680, v114, (uint64_t)&v247, (uint64_t)v271, 16);
        uint64_t v117 = v132;
      }
      while (v132);
    }
  }
  if (objc_msgSend_containsObject_(v231, v114, @"IPHONE BACK GLASS", v115))
  {
    long long v245 = 0u;
    long long v243 = 0u;
    long long v244 = 0u;
    long long v242 = 0u;
    uint64_t v135 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163698, v133, (uint64_t)&v242, (uint64_t)v270, 16);
    if (v135)
    {
      uint64_t v136 = v135;
      uint64_t v137 = *(void *)v243;
      do
      {
        for (uint64_t j = 0; j != v136; ++j)
        {
          if (*(void *)v243 != v137) {
            objc_enumerationMutation(&unk_26D163698);
          }
          uint64_t v139 = *(void *)(*((void *)&v242 + 1) + 8 * j);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v133, v139, v134) & 1) == 0)
          {
            v62 = handleForCategory(0);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v276 = v139;
              _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }
            goto LABEL_134;
          }
          id v241 = 0;
          char v141 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v140, (uint64_t)v235, v139, &v241);
          v62 = v241;
          if (objc_msgSend_allowMissingData(self, v142, v143, v144)
            && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v133, v139, v134))
          {
            if (v62) {
              char v146 = 0;
            }
            else {
              char v146 = v141;
            }
            if ((v146 & 1) == 0)
            {
              v147 = handleForCategory(0);
              if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v276 = v139;
                _os_log_impl(&dword_21FBF2000, v147, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
              }

LABEL_134:
              continue;
            }
          }
          else
          {
            if (v62) {
              char v145 = 0;
            }
            else {
              char v145 = v141;
            }
            if ((v145 & 1) == 0)
            {
              v164 = handleForCategory(0);
              if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
                sub_21FC61D90();
              }
              goto LABEL_211;
            }
          }
        }
        uint64_t v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163698, v133, (uint64_t)&v242, (uint64_t)v270, 16);
      }
      while (v136);
    }
  }
  id v10 = v231;
  if (!objc_msgSend_containsObject_(v231, v133, @"IPHONE COMP ENCL", v134)
    || (long long v239 = 0u,
        long long v240 = 0u,
        long long v237 = 0u,
        long long v238 = 0u,
        (uint64_t v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1636E0, v148, (uint64_t)&v237, (uint64_t)v269, 16)) == 0))
  {
    v62 = 0;
    goto LABEL_213;
  }
  uint64_t v152 = v149;
  uint64_t v153 = *(void *)v238;
  while (2)
  {
    for (uint64_t k = 0; k != v152; ++k)
    {
      if (*(void *)v238 != v153) {
        objc_enumerationMutation(&unk_26D1636E0);
      }
      uint64_t v155 = *(void *)(*((void *)&v237 + 1) + 8 * k);
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v150, v155, v151) & 1) == 0)
      {
        v62 = handleForCategory(0);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v276 = v155;
          _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
        }
        goto LABEL_160;
      }
      id v236 = 0;
      char v157 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v156, (uint64_t)v235, v155, &v236);
      v62 = v236;
      if (objc_msgSend_allowMissingData(self, v158, v159, v160)
        && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v150, v155, v151))
      {
        if (v62) {
          char v162 = 0;
        }
        else {
          char v162 = v157;
        }
        if ((v162 & 1) == 0)
        {
          v163 = handleForCategory(0);
          if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v276 = v155;
            _os_log_impl(&dword_21FBF2000, v163, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
          }

LABEL_160:
          continue;
        }
      }
      else
      {
        if (v62) {
          char v161 = 0;
        }
        else {
          char v161 = v157;
        }
        if ((v161 & 1) == 0)
        {
          v164 = handleForCategory(0);
          if (os_log_type_enabled(v164, OS_LOG_TYPE_ERROR)) {
            sub_21FC61D90();
          }
          goto LABEL_211;
        }
      }
    }
    uint64_t v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1636E0, v150, (uint64_t)&v237, (uint64_t)v269, 16);
    if (v152) {
      continue;
    }
    break;
  }
  v62 = 0;
LABEL_212:
  id v10 = v231;
LABEL_213:
  a5 = v229;
  a6 = v230;
  int v18 = v234;
LABEL_214:
  v61 = v228;
LABEL_215:
  if (a5) {
    objc_storeStrong(a5, v18);
  }
  if (a6) {
    *a6 = v62;
  }
  id v226 = v235;

  return v226;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CRFDRGen3DeviceHandler;
  id v29 = 0;
  unsigned int v13 = [(CRFDRBaseDeviceHandler *)&v28 validateAndSetSerialNumbersUsingPartSPC:v10 KGBSerialNumber:v11 KBBSerialNumber:v12 withError:&v29];
  id v16 = v29;
  if (!v13)
  {
    BOOL v23 = 0;
    if (!a6) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if ((objc_msgSend_containsObject_(v10, v14, @"IPHONE REAR ASSEMBLY", v15) & 1) == 0
    && (objc_msgSend_containsObject_(v10, v17, @"IPHONE MID ASSEMBLY", v19) & 1) == 0
    && !objc_msgSend_containsObject_(v10, v17, @"IPHONE MCTUB", v19)
    || v11 && v12 && objc_msgSend_length(v11, v17, v18, v19) && objc_msgSend_length(v12, v17, v20, v19))
  {
    if (!v11 || !v12 || !objc_msgSend_isEqualToString_(v11, v17, (uint64_t)v12, v19))
    {
      objc_msgSend_setKBBSerialNumber_(self, v17, (uint64_t)v12, v19);
      objc_msgSend_setKGBSerialNumber_(self, v26, (uint64_t)v11, v27);
      BOOL v23 = 1;
      if (!a6) {
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v17, @"KGBSrnm:%@ matches KBBSrnm:%@", v19, v11, v12);
    uint64_t v22 = -31;
  }
  else
  {
    uint64_t v21 = objc_msgSend_stringWithFormat_(NSString, v17, @"Missing required Srnm KGBSrnm:%@ KBBSrnm:%@", v19, v11, v12);
    uint64_t v22 = -32;
  }
  uint64_t v24 = sub_21FC02E70((void *)v22, v21, 0);

  BOOL v23 = 0;
  id v16 = (id)v24;
  if (a6) {
LABEL_17:
  }
    *a6 = v16;
LABEL_18:

  return v23;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v10 = v7;
  if (!v7 || objc_msgSend_isEqual_(v7, v8, (uint64_t)&unk_26D1632F0, v9))
  {
    unsigned int v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "No requirement for display swapped duration check", buf, 2u);
    }
    int64_t v14 = 0;
    goto LABEL_6;
  }
  if (!objc_msgSend_containsObject_(v6, v11, @"IPHONE COMP DISPLAY", v12))
  {
    int64_t v14 = 0;
    goto LABEL_7;
  }
  unsigned int v13 = MGCopyAnswer();
  uint64_t v19 = objc_msgSend_convertToHexString(v13, v16, v17, v18);
  int isServicePart = objc_msgSend_isServicePart(self, v20, v21, v22);
  uint64_t v24 = handleForCategory(0);
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!isServicePart)
  {
    if (v25)
    {
      *(_WORD *)uint64_t v54 = 0;
      _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with original MLB", v54, 2u);
    }

    uint64_t v43 = (int)objc_msgSend_intValue(v10, v40, v41, v42);
    uint64_t v47 = objc_msgSend_previousCGSN(self, v44, v45, v46);
    uint64_t v51 = objc_msgSend_sealDate(self, v48, v49, v50);
    int v53 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v52, v43, (uint64_t)v19, v47, v51);

    if (!v53)
    {
      int64_t v14 = -44;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with service MLB", v55, 2u);
  }

  uint64_t v29 = (int)objc_msgSend_intValue(v10, v26, v27, v28);
  v33 = objc_msgSend_kbbCGSN(self, v30, v31, v32);
  v37 = objc_msgSend_kbbSealDate(self, v34, v35, v36);
  char v39 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v38, v29, (uint64_t)v19, v33, v37);

  if (v39)
  {
LABEL_18:
    int64_t v14 = 0;
    goto LABEL_20;
  }
  int64_t v14 = -51;
LABEL_20:

LABEL_6:
LABEL_7:

  return v14;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v47 = 0;
  uint64_t v12 = objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v47, a8);
  if (!a8 || !*a8)
  {
    unsigned int v13 = objc_opt_new();
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
      char v39 = handleForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_21FC60D80(v39);
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
      char v39 = *v42;
      *uint64_t v42 = v38;
    }

LABEL_29:
    goto LABEL_30;
  }
  unsigned int v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_21FC5F1A0((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  }
  BOOL v20 = 0;
LABEL_30:

  return v20;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_supportCameraDepth(self, v8, v9, v10)) {
    uint64_t v14 = &unk_26D1636B0;
  }
  else {
    uint64_t v14 = &unk_26D163668;
  }
  if (objc_msgSend_supportMctubMinus(self, v11, v12, v13)) {
    uint64_t v17 = &unk_26D1636C8;
  }
  else {
    uint64_t v17 = &unk_26D163638;
  }
  if (!objc_msgSend_isEqual_(@"vcrt", v15, (uint64_t)v7, v16)
    || (BOOL v20 = @"IPHONE COMP BATTERY",
        (objc_msgSend_containsObject_(v6, v18, @"IPHONE COMP BATTERY", v19) & 1) == 0))
  {
    if (!objc_msgSend_isEqual_(@"tcrt", v18, (uint64_t)v7, v19)
      || (BOOL v20 = @"IPHONE COMP DISPLAY",
          (objc_msgSend_containsObject_(v6, v21, @"IPHONE COMP DISPLAY", v22) & 1) == 0))
    {
      if (!objc_msgSend_isEqual_(@"prpc", v21, (uint64_t)v7, v22)
        || (BOOL v20 = @"IPHONE COMP FACEID",
            (objc_msgSend_containsObject_(v6, v23, @"IPHONE COMP FACEID", v24) & 1) == 0))
      {
        if (!objc_msgSend_containsObject_(v14, v23, (uint64_t)v7, v24)
          || (BOOL v20 = @"IPHONE COMP CAMERA",
              (objc_msgSend_containsObject_(v6, v25, @"IPHONE COMP CAMERA", v26) & 1) == 0)
          && (BOOL v20 = @"IPHONE COMP RCAM",
              (objc_msgSend_containsObject_(v6, v27, @"IPHONE COMP RCAM", v28) & 1) == 0))
        {
          if (!objc_msgSend_containsObject_(&unk_26D163698, v25, (uint64_t)v7, v26)
            || (BOOL v20 = @"IPHONE BACK GLASS",
                (objc_msgSend_containsObject_(v6, v29, @"IPHONE BACK GLASS", v30) & 1) == 0))
          {
            if (!objc_msgSend_containsObject_(&unk_26D163650, v29, (uint64_t)v7, v30)
              || (BOOL v20 = @"IPHONE COMP DISPLAY",
                  (objc_msgSend_containsObject_(v6, v31, @"IPHONE COMP DISPLAY", v32) & 1) == 0))
            {
              if (!objc_msgSend_containsObject_(&unk_26D163680, v31, (uint64_t)v7, v32)
                || (BOOL v20 = @"IPHONE COMP FACEID",
                    (objc_msgSend_containsObject_(v6, v33, @"IPHONE COMP FACEID", v34) & 1) == 0))
              {
                if (!objc_msgSend_containsObject_(&unk_26D1636E0, v33, (uint64_t)v7, v34)
                  || (BOOL v20 = @"IPHONE COMP ENCL",
                      (objc_msgSend_containsObject_(v6, v35, @"IPHONE COMP ENCL", v36) & 1) == 0))
                {
                  if (objc_msgSend_containsObject_(v17, v35, (uint64_t)v7, v36))
                  {
                    BOOL v20 = @"IPHONE REAR ASSEMBLY";
                    if ((objc_msgSend_containsObject_(v6, v37, @"IPHONE REAR ASSEMBLY", v38) & 1) == 0)
                    {
                      BOOL v20 = @"IPHONE MID ASSEMBLY";
                      if ((objc_msgSend_containsObject_(v6, v39, @"IPHONE MID ASSEMBLY", v40) & 1) == 0)
                      {
                        if (objc_msgSend_containsObject_(v6, v41, @"IPHONE MCTUB", v42)) {
                          BOOL v20 = @"IPHONE MCTUB";
                        }
                        else {
                          BOOL v20 = 0;
                        }
                      }
                    }
                  }
                  else
                  {
                    BOOL v20 = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v20;
}

- (id)spcWithComponent:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_supportCameraDepth(self, v5, v6, v7)) {
    uint64_t v10 = &unk_26D1636B0;
  }
  else {
    uint64_t v10 = &unk_26D163668;
  }
  if (objc_msgSend_isEqual_(@"vcrt", v8, (uint64_t)v4, v9))
  {
    uint64_t v13 = @"IPHONE COMP BATTERY";
    goto LABEL_11;
  }
  if (objc_msgSend_isEqual_(@"tcrt", v11, (uint64_t)v4, v12)) {
    goto LABEL_10;
  }
  if (objc_msgSend_isEqual_(@"prpc", v14, (uint64_t)v4, v15))
  {
LABEL_8:
    uint64_t v13 = @"IPHONE COMP FACEID";
    goto LABEL_11;
  }
  if (objc_msgSend_isEqual_(@"drp#", v16, (uint64_t)v4, v17))
  {
LABEL_10:
    uint64_t v13 = @"IPHONE COMP DISPLAY";
    goto LABEL_11;
  }
  if (objc_msgSend_containsObject_(v10, v18, (uint64_t)v4, v19))
  {
    if (objc_msgSend_supportCameraDepth(self, v21, v22, v23)) {
      uint64_t v13 = @"IPHONE COMP RCAM";
    }
    else {
      uint64_t v13 = @"IPHONE COMP CAMERA";
    }
  }
  else
  {
    if (objc_msgSend_containsObject_(&unk_26D163698, v21, (uint64_t)v4, v23))
    {
      uint64_t v13 = @"IPHONE BACK GLASS";
      goto LABEL_11;
    }
    if (objc_msgSend_containsObject_(&unk_26D163650, v24, (uint64_t)v4, v25)) {
      goto LABEL_10;
    }
    if ((objc_msgSend_containsObject_(&unk_26D163680, v26, (uint64_t)v4, v27) & 1) != 0
      || (objc_msgSend_isEqual_(@"psd2", v28, (uint64_t)v4, v29) & 1) != 0)
    {
      goto LABEL_8;
    }
    if (objc_msgSend_containsObject_(&unk_26D1636E0, v30, (uint64_t)v4, v31)) {
      uint64_t v13 = @"IPHONE COMP ENCL";
    }
    else {
      uint64_t v13 = 0;
    }
  }
LABEL_11:

  return v13;
}

@end