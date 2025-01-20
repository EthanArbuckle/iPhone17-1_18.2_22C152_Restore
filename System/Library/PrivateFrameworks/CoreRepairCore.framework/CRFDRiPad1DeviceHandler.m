@interface CRFDRiPad1DeviceHandler
+ (BOOL)isiPad1ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)_addHmCAToMutableArrayWithFdrRemote:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 error:(id *)a6;
- (BOOL)_hasALSOnDisplay;
- (BOOL)_hasRearALS;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (BOOL)supportMesaRepair;
- (BOOL)supportPatch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getPatchInfoPerSPC;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)spcWithComponent:(id)a3;
@end

@implementation CRFDRiPad1DeviceHandler

+ (BOOL)isiPad1ProductType:(int)a3
{
  BOOL result = 1;
  if (*(uint64_t *)&a3 > 2622433983)
  {
    if (*(uint64_t *)&a3 <= 2959111091)
    {
      if (*(void *)&a3 == 2622433984) {
        return result;
      }
      uint64_t v4 = 2634105757;
      goto LABEL_14;
    }
    if (*(void *)&a3 != 2959111092 && *(void *)&a3 != 3241053352)
    {
      uint64_t v4 = 3677894691;
LABEL_14:
      if (*(void *)&a3 != v4) {
        return 0;
      }
    }
  }
  else
  {
    if (*(uint64_t *)&a3 <= 2487868871)
    {
      if (*(void *)&a3 == 555503454) {
        return result;
      }
      uint64_t v4 = 810906663;
      goto LABEL_14;
    }
    if (*(void *)&a3 != 2487868872 && *(void *)&a3 != 2566016329)
    {
      uint64_t v4 = 2619317134;
      goto LABEL_14;
    }
  }
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isiPad1ProductType_(CRFDRiPad1DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRFDRiPad1DeviceHandler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRiPad1DeviceHandler);
}

- (BOOL)supportPatch
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134) {
      return v2;
    }
    uint64_t v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454) {
      return v2;
    }
    uint64_t v4 = 2487868872;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (BOOL)supportMesaRepair
{
  uint64_t v2 = MGGetProductType();
  return v2 == 2566016329 || v2 == 2959111092;
}

- (id)getPatchInfoPerSPC
{
  return &unk_26D163A20;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  int v10 = objc_msgSend_containsObject_(v6, v8, @"IPAD COMP DISPLAY", v9);

  if (!v10)
  {
    v17 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, @"tcrt", v12))
  {
    id v20 = 0;
    int v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, @"tcrt", &v20);
    id v15 = v20;
    id v16 = v15;
    if (!v14 || (v17 = 0, v15))
    {
      v18 = handleForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC61764();
      }
      goto LABEL_16;
    }
LABEL_8:
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v18 = handleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = @"tcrt";
    _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be claimed", buf, 0xCu);
  }
  id v16 = 0;
LABEL_16:

  v17 = v16;
  if (a4) {
LABEL_9:
  }
    *a4 = v17;
LABEL_10:

  return v7;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  int v10 = objc_msgSend_containsObject_(v6, v8, @"IPAD FRONT CAMERA", v9);

  if (!v10)
  {
    v17 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, @"psd2", v12))
  {
    id v20 = 0;
    int v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, @"psd2", &v20);
    id v15 = v20;
    id v16 = v15;
    if (!v14 || (v17 = 0, v15))
    {
      v18 = handleForCategory(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_21FC616FC();
      }
      goto LABEL_16;
    }
LABEL_8:
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v18 = handleForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = @"psd2";
    _os_log_impl(&dword_21FBF2000, v18, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be updated", buf, 0xCu);
  }
  id v16 = 0;
LABEL_16:

  v17 = v16;
  if (a4) {
LABEL_9:
  }
    *a4 = v17;
LABEL_10:

  return v7;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  uint64_t v205 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v16 = objc_msgSend_currentProperties(self, v13, v14, v15);
  id v20 = objc_msgSend_mutableCopy(v16, v17, v18, v19);

  uint64_t v21 = objc_opt_new();
  uint64_t v22 = objc_opt_new();
  id v183 = (id)v22;
  id obj = (id)v21;
  if (v21) {
    BOOL v23 = v22 == 0;
  }
  else {
    BOOL v23 = 1;
  }
  if (v23)
  {
    v24 = handleForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_21FC60D80(v24);
    }

    v25 = 0;
    v26 = 0;
    char v27 = 0;
    v29 = a7;
    v28 = a5;
    if (!a7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v31 = AMFDRGetOptions();
  v179 = v31;
  v182 = a4;
  if (v31)
  {
    v34 = objc_msgSend_objectForKeyedSubscript_(v31, v32, @"Metadata", v33);
    v41 = objc_msgSend_mutableCopy(v34, v35, v36, v37);
    if (v41)
    {
      v42 = objc_msgSend_currentProperties(self, v38, v39, v40);
      v45 = objc_msgSend_objectForKeyedSubscript_(v42, v43, @"mlb#", v44);

      if (v45)
      {
        v49 = objc_msgSend_currentProperties(self, v46, v47, v48);
        v52 = objc_msgSend_objectForKeyedSubscript_(v49, v50, @"mlb#", v51);
        objc_msgSend_setObject_forKeyedSubscript_(v41, v53, (uint64_t)v52, @"MLBNumber");
      }
      v54 = objc_msgSend_currentProperties(self, v46, v47, v48);
      v57 = objc_msgSend_objectForKeyedSubscript_(v54, v55, @"SrNm", v56);

      if (v57)
      {
        v61 = objc_msgSend_currentProperties(self, v58, v59, v60);
        v64 = objc_msgSend_objectForKeyedSubscript_(v61, v62, @"SrNm", v63);
        objc_msgSend_setObject_forKeyedSubscript_(v41, v65, (uint64_t)v64, @"SerialNumber");
      }
      AMFDRSetOption();
    }
    v66 = handleForCategory(0);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v41;
      _os_log_impl(&dword_21FBF2000, v66, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }
  }
  v177 = a8;
  v178 = v12;
  v176 = v20;
  if (!objc_msgSend_containsObject_(v12, v32, @"IPAD COMP DISPLAY", v33)
    || (long long v199 = 0u,
        long long v200 = 0u,
        long long v197 = 0u,
        long long v198 = 0u,
        (uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1636F8, v67, (uint64_t)&v197, (uint64_t)v203, 16)) == 0))
  {
    char v27 = 0;
    goto LABEL_76;
  }
  uint64_t v70 = v69;
  char v27 = 0;
  uint64_t v71 = *(void *)v198;
  do
  {
    uint64_t v72 = 0;
    do
    {
      if (*(void *)v198 != v71) {
        objc_enumerationMutation(&unk_26D1636F8);
      }
      v73 = *(void **)(*((void *)&v197 + 1) + 8 * v72);
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v67, (uint64_t)v73, v68) & 1) == 0)
      {
        v79 = handleForCategory(0);
        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v73;
          _os_log_impl(&dword_21FBF2000, v79, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
        }
LABEL_54:

        goto LABEL_55;
      }
      if (!objc_msgSend_isEqualToString_(v73, v74, @"HmCA", v75))
      {
        v79 = objc_opt_new();
        id v195 = 0;
        char v27 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v85, (uint64_t)v79, (uint64_t)v73, &v195);
        v25 = v195;
        if (objc_msgSend_allowMissingData(self, v86, v87, v88)
          && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v89, (uint64_t)v73, v90))
        {
          if (v25) {
            char v100 = 0;
          }
          else {
            char v100 = v27;
          }
          if ((v100 & 1) == 0)
          {
            v101 = handleForCategory(0);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v73;
              _os_log_impl(&dword_21FBF2000, v101, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v25) {
            char v91 = 0;
          }
          else {
            char v91 = v27;
          }
          if ((v91 & 1) == 0)
          {
            v143 = handleForCategory(0);
            if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
              sub_21FC61D90();
            }

            v173 = v79;
            goto LABEL_162;
          }
        }
        v92 = objc_msgSend_objectForKeyedSubscript_(v79, v89, (uint64_t)v73, v90);

        if (v92)
        {
          objc_msgSend_addObject_(obj, v93, (uint64_t)v73, v94);
          v97 = objc_msgSend_objectForKeyedSubscript_(v79, v95, (uint64_t)v73, v96);
          objc_msgSend_addObject_(v183, v98, (uint64_t)v97, v99);
        }
        char v27 = 1;
        goto LABEL_54;
      }
      if (!objc_msgSend__hasALSOnDisplay(self, v76, v77, v78)) {
        goto LABEL_55;
      }
      id v196 = 0;
      char v27 = objc_msgSend__addHmCAToMutableArrayWithFdrRemote_dataClasses_dataInstances_error_(self, v67, (uint64_t)v182, (uint64_t)obj, v183, &v196);
      v79 = v196;
      if (objc_msgSend_allowMissingData(self, v80, v81, v82)
        && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v67, (uint64_t)v73, v68))
      {
        if (v79) {
          char v102 = 0;
        }
        else {
          char v102 = v27;
        }
        if ((v102 & 1) == 0)
        {
          v103 = objc_msgSend_domain(v79, v67, v83, v68);
          if (!objc_msgSend_isEqual_(v103, v104, @"com.apple.corerepair", v105))
          {

LABEL_159:
            v173 = handleForCategory(0);
            id v12 = v178;
            if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR)) {
LABEL_160:
            }
              sub_21FC61D90();
LABEL_161:
            v25 = v79;
LABEL_162:
            id v20 = v176;
            a8 = v177;
            v29 = a7;
            v28 = a5;
            v26 = v179;

            if (!a7) {
              goto LABEL_10;
            }
LABEL_9:
            objc_storeStrong(v29, v20);
            goto LABEL_10;
          }
          uint64_t v109 = objc_msgSend_code(v79, v106, v107, v108);

          if (v109 != -26) {
            goto LABEL_159;
          }
          v110 = handleForCategory(0);
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v73;
            _os_log_impl(&dword_21FBF2000, v110, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
          }

          char v27 = 1;
          id v12 = v178;
          goto LABEL_54;
        }
      }
      else
      {
        if (v79) {
          char v84 = 0;
        }
        else {
          char v84 = v27;
        }
        if ((v84 & 1) == 0)
        {
          v173 = handleForCategory(0);
          if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR)) {
            goto LABEL_160;
          }
          goto LABEL_161;
        }
      }
LABEL_55:
      ++v72;
    }
    while (v70 != v72);
    uint64_t v111 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1636F8, v67, (uint64_t)&v197, (uint64_t)v203, 16);
    uint64_t v70 = v111;
  }
  while (v111);
LABEL_76:
  if (objc_msgSend_containsObject_(v12, v67, @"IPAD FRONT CAMERA", v68))
  {
    long long v194 = 0u;
    long long v192 = 0u;
    long long v193 = 0u;
    long long v191 = 0u;
    uint64_t v114 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163710, v112, (uint64_t)&v191, (uint64_t)v202, 16);
    if (v114)
    {
      uint64_t v115 = v114;
      uint64_t v116 = *(void *)v192;
      do
      {
        uint64_t v117 = 0;
        do
        {
          if (*(void *)v192 != v116) {
            objc_enumerationMutation(&unk_26D163710);
          }
          uint64_t v118 = *(void *)(*((void *)&v191 + 1) + 8 * v117);
          if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v112, v118, v113))
          {
            v119 = objc_opt_new();
            id v190 = 0;
            char v27 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v120, (uint64_t)v119, v118, &v190);
            v25 = v190;
            if (objc_msgSend_allowMissingData(self, v121, v122, v123)
              && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v124, v118, v125))
            {
              if (v25) {
                char v135 = 0;
              }
              else {
                char v135 = v27;
              }
              if ((v135 & 1) == 0)
              {
                v136 = handleForCategory(0);
                if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v118;
                  _os_log_impl(&dword_21FBF2000, v136, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
                }
              }
            }
            else
            {
              if (v25) {
                char v126 = 0;
              }
              else {
                char v126 = v27;
              }
              if ((v126 & 1) == 0)
              {
                v142 = handleForCategory(0);
                if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
                  sub_21FC61D90();
                }
                goto LABEL_151;
              }
            }
            v127 = objc_msgSend_objectForKeyedSubscript_(v119, v124, v118, v125);

            if (v127)
            {
              objc_msgSend_addObject_(obj, v128, v118, v129);
              v132 = objc_msgSend_objectForKeyedSubscript_(v119, v130, v118, v131);
              objc_msgSend_addObject_(v183, v133, (uint64_t)v132, v134);
            }
            char v27 = 1;
          }
          else
          {
            v119 = handleForCategory(0);
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v118;
              _os_log_impl(&dword_21FBF2000, v119, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }
          }

          ++v117;
        }
        while (v115 != v117);
        uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163710, v112, (uint64_t)&v191, (uint64_t)v202, 16);
        uint64_t v115 = v137;
      }
      while (v137);
    }
  }
  id v12 = v178;
  id v20 = v176;
  a8 = v177;
  if (objc_msgSend_containsObject_(v178, v112, @"IPAD REAR CAMERA", v113))
  {
    if (objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v138, @"RCSn", v139))
    {
      *(void *)buf = 0;
      v141 = AMFDRSealingMapCopyPropertyWithTag();
      v25 = *(NSObject **)buf;
      if (!v141 || *(void *)buf)
      {
        v175 = handleForCategory(0);
        if (os_log_type_enabled(v175, OS_LOG_TYPE_ERROR)) {
          sub_21FC6261C((uint64_t)v25, v175);
        }

        v27 &= 1u;
        goto LABEL_153;
      }
      objc_msgSend_setObject_forKeyedSubscript_(v176, v140, (uint64_t)v141, @"RCSn");
    }
    else
    {
      v141 = handleForCategory(0);
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = @"RCSn";
        _os_log_impl(&dword_21FBF2000, v141, OS_LOG_TYPE_DEFAULT, "The device doesn't support property %@, so the property won't be added", buf, 0xCu);
      }
    }
  }
  if (!objc_msgSend_containsObject_(v178, v138, @"IPAD TOUCH ID", v139)
    || !objc_msgSend_supportMesaRepair(self, v144, v145, v146)
    || (long long v188 = 0u,
        long long v189 = 0u,
        long long v186 = 0u,
        long long v187 = 0u,
        (uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163728, v147, (uint64_t)&v186, (uint64_t)v201, 16)) == 0))
  {
    v25 = 0;
    char v27 = 1;
    goto LABEL_153;
  }
  uint64_t v151 = v148;
  uint64_t v152 = *(void *)v187;
  while (2)
  {
    uint64_t v153 = 0;
LABEL_122:
    if (*(void *)v187 != v152) {
      objc_enumerationMutation(&unk_26D163728);
    }
    uint64_t v154 = *(void *)(*((void *)&v186 + 1) + 8 * v153);
    if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v149, v154, v150) & 1) == 0)
    {
      v119 = handleForCategory(0);
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v154;
        _os_log_impl(&dword_21FBF2000, v119, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
      }
      goto LABEL_135;
    }
    v119 = objc_opt_new();
    id v185 = 0;
    char v27 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v155, (uint64_t)v119, v154, &v185);
    v25 = v185;
    if (objc_msgSend_allowMissingData(self, v156, v157, v158)
      && !objc_msgSend_isFDRPrimaryDataClass_(CRFDRBaseDeviceHandler, v159, v154, v160))
    {
      if (v25) {
        char v170 = 0;
      }
      else {
        char v170 = v27;
      }
      if ((v170 & 1) == 0)
      {
        v171 = handleForCategory(0);
        if (os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v154;
          _os_log_impl(&dword_21FBF2000, v171, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
        }
      }
LABEL_131:
      v162 = objc_msgSend_objectForKeyedSubscript_(v119, v159, v154, v160);

      if (v162)
      {
        objc_msgSend_addObject_(obj, v163, v154, v164);
        v167 = objc_msgSend_objectForKeyedSubscript_(v119, v165, v154, v166);
        objc_msgSend_addObject_(v183, v168, (uint64_t)v167, v169);
      }
LABEL_135:

      if (v151 == ++v153)
      {
        uint64_t v172 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163728, v149, (uint64_t)&v186, (uint64_t)v201, 16);
        uint64_t v151 = v172;
        char v27 = 1;
        if (!v172)
        {
          v25 = 0;
          goto LABEL_152;
        }
        continue;
      }
      goto LABEL_122;
    }
    break;
  }
  if (v25) {
    char v161 = 0;
  }
  else {
    char v161 = v27;
  }
  if (v161) {
    goto LABEL_131;
  }
  v142 = handleForCategory(0);
  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
    sub_21FC61D90();
  }
LABEL_151:

LABEL_152:
  a8 = v177;
  id v12 = v178;
  id v20 = v176;
LABEL_153:
  v29 = a7;
  v28 = a5;
  v26 = v179;
  if (a7) {
    goto LABEL_9;
  }
LABEL_10:
  if (v28) {
    objc_storeStrong(v28, obj);
  }
  if (a6) {
    objc_storeStrong(a6, v183);
  }
  if (a8) {
    *a8 = v25;
  }

  return v27;
}

- (BOOL)_hasRearALS
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134) {
      return v2;
    }
    uint64_t v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454) {
      return v2;
    }
    uint64_t v4 = 2487868872;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (BOOL)_hasALSOnDisplay
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 2634105756)
  {
    if (v3 == 2634105757 || v3 == 3241053352) {
      return v2;
    }
    uint64_t v4 = 3677894691;
  }
  else
  {
    if (v3 == 555503454 || v3 == 2487868872) {
      return v2;
    }
    uint64_t v4 = 2619317134;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (BOOL)_addHmCAToMutableArrayWithFdrRemote:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 error:(id *)a6
{
  v164[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v139 = a5;
  uint64_t v151 = 0;
  uint64_t v152 = 0;
  uint64_t v150 = 0;
  uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF980], v11, v12, v13);
  uint64_t v18 = objc_msgSend_array(MEMORY[0x263EFF980], v15, v16, v17);
  uint64_t v22 = objc_msgSend_array(MEMORY[0x263EFF980], v19, v20, v21);
  if (objc_msgSend_containsObject_(v10, v23, @"HmCA", v24))
  {
    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v163 = *MEMORY[0x263F08320];
    v29 = objc_msgSend_stringWithFormat_(NSString, v25, @"MTUB combo repair not supported", v27);
    v164[0] = v29;
    v31 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v30, (uint64_t)v164, (uint64_t)&v163, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v28, v32, @"com.apple.corerepair", -72, v31);
    id v33 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    BOOL v39 = 0;
    goto LABEL_7;
  }
  v34 = objc_msgSend_set(MEMORY[0x263EFFA08], v25, v26, v27);
  v148.receiver = self;
  v148.super_class = (Class)CRFDRiPad1DeviceHandler;
  id v149 = 0;
  id v35 = [(CRFDRBaseDeviceHandler *)&v148 getCurrentManifestDataClassesAndInstancesWithPartSPC:v34 fdr:a3 currentClasses:&v151 currentInstances:&v150 currentProperties:0 fdrError:&v149];
  id v33 = v149;

  if (v33)
  {
    v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC626A8();
    }
    goto LABEL_6;
  }
  id obj = self;
  uint64_t v134 = v10;
  v136 = v22;
  if (objc_msgSend_count(v151, v36, v37, v38))
  {
    unint64_t v43 = 0;
    do
    {
      uint64_t v44 = objc_msgSend_objectAtIndexedSubscript_(v151, v41, v43, v42);
      int isEqualToString = objc_msgSend_isEqualToString_(v44, v45, @"HmCA", v46);

      if (isEqualToString)
      {
        uint64_t v51 = objc_msgSend_objectAtIndexedSubscript_(v150, v48, v43, v50);
        objc_msgSend_addObject_(v14, v52, (uint64_t)v51, v53);
      }
      ++v43;
    }
    while (objc_msgSend_count(v151, v48, v49, v50) > v43);
  }
  uint64_t v137 = v14;
  char v135 = a6;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163758, v41, (uint64_t)&v144, (uint64_t)v162, 16);
  v138 = v18;
  if (v54)
  {
    uint64_t v57 = v54;
    uint64_t v58 = *(void *)v145;
    while (2)
    {
      for (uint64_t i = 0; i != v57; ++i)
      {
        if (*(void *)v145 != v58) {
          objc_enumerationMutation(&unk_26D163758);
        }
        uint64_t v60 = *(void **)(*((void *)&v144 + 1) + 8 * i);
        uint64_t v152 = 0;
        v29 = ZhuGeCopyValue();
        uint64_t v63 = v152;
        if (v29) {
          BOOL v64 = v152 == 0;
        }
        else {
          BOOL v64 = 0;
        }
        if (!v64)
        {
          v65 = handleForCategory(0);
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v159 = (uint64_t)v60;
            __int16 v160 = 2112;
            char v161 = v63;
            _os_log_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_DEFAULT, "Failed to read live serial number of %@ failed, error: %@", buf, 0x16u);
          }

          if (objc_msgSend_isEqualToString_(v60, v66, @"AmbientLightSensorFrontLandSerialNumber", v67))
          {
            v124 = (void *)MEMORY[0x263F087E8];
            uint64_t v156 = *MEMORY[0x263F08320];
            uint64_t v125 = objc_msgSend_stringWithFormat_(NSString, v68, @"AmbientLightSensorFrontLandSerialNumber is missing", v69);
            uint64_t v157 = v125;
            v127 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v126, (uint64_t)&v157, (uint64_t)&v156, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v124, v128, @"com.apple.corerepair", -26, v127);
            id v33 = (id)objc_claimAutoreleasedReturnValue();

            BOOL v39 = 0;
            id v10 = v134;
            a6 = v135;
            uint64_t v14 = v137;
            uint64_t v18 = v138;
            uint64_t v22 = v136;
            goto LABEL_7;
          }

          v29 = &stru_26D158688;
          uint64_t v18 = v138;
        }
        objc_msgSend_addObject_(v18, v61, (uint64_t)v29, v62);
      }
      uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163758, v70, (uint64_t)&v144, (uint64_t)v162, 16);
      if (v57) {
        continue;
      }
      break;
    }
  }
  id v10 = v134;
  objc_msgSend_addObject_(v134, v55, @"HmCA", v56);
  v73 = objc_msgSend_objectAtIndexedSubscript_(v18, v71, 0, v72);
  objc_msgSend_addObject_(v139, v74, (uint64_t)v73, v75);

  v29 = objc_msgSend_setWithArray_(MEMORY[0x263EFF9C0], v76, (uint64_t)v14, v77);
  v80 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v78, (uint64_t)v18, v79);
  objc_msgSend_minusSet_(v29, v81, (uint64_t)v80, v82);

  v85 = objc_msgSend_objectAtIndexedSubscript_(v18, v83, 1, v84);
  objc_msgSend_addObject_(v136, v86, (uint64_t)v85, v87);

  if (objc_msgSend__hasRearALS(obj, v88, v89, v90))
  {
    v93 = objc_msgSend_objectAtIndexedSubscript_(v18, v91, 2, v92);
    objc_msgSend_addObject_(v136, v94, (uint64_t)v93, v95);
  }
  uint64_t v96 = handleForCategory(0);
  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v159 = (uint64_t)v14;
    _os_log_impl(&dword_21FBF2000, v96, OS_LOG_TYPE_DEFAULT, "Sealed ALS instances: %@", buf, 0xCu);
  }

  v97 = handleForCategory(0);
  a6 = v135;
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v159 = (uint64_t)v18;
    _os_log_impl(&dword_21FBF2000, v97, OS_LOG_TYPE_DEFAULT, "Live ALS instances: %@", buf, 0xCu);
  }

  v98 = handleForCategory(0);
  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v159 = (uint64_t)v29;
    _os_log_impl(&dword_21FBF2000, v98, OS_LOG_TYPE_DEFAULT, "Missing ALS instances: %@", buf, 0xCu);
  }

  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  uint64_t v22 = v136;
  id obja = v136;
  uint64_t v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v99, (uint64_t)&v140, (uint64_t)v155, 16);
  if (v100)
  {
    uint64_t v103 = v100;
    uint64_t v104 = *(void *)v141;
    while (2)
    {
      for (uint64_t j = 0; j != v103; ++j)
      {
        if (*(void *)v141 != v104) {
          objc_enumerationMutation(obja);
        }
        uint64_t v106 = *(void *)(*((void *)&v140 + 1) + 8 * j);
        if (objc_msgSend_containsObject_(v137, v101, v106, v102))
        {
          objc_msgSend_addObject_(v139, v107, v106, v109);
        }
        else
        {
          if (!objc_msgSend_count(v29, v107, v108, v109))
          {
            uint64_t v129 = (void *)MEMORY[0x263F087E8];
            uint64_t v153 = *MEMORY[0x263F08320];
            uint64_t v154 = @"No candidate instance to use";
            v130 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v112, (uint64_t)&v154, (uint64_t)&v153, 1);
            objc_msgSend_errorWithDomain_code_userInfo_(v129, v131, @"com.apple.corerepair", -42, v130);
            id v33 = (id)objc_claimAutoreleasedReturnValue();

            BOOL v39 = 0;
            goto LABEL_54;
          }
          uint64_t v115 = objc_msgSend_allObjects(v29, v112, v113, v114);
          uint64_t v118 = objc_msgSend_objectAtIndexedSubscript_(v115, v116, 0, v117);

          objc_msgSend_removeObject_(v29, v119, (uint64_t)v118, v120);
          objc_msgSend_addObject_(v139, v121, (uint64_t)v118, v122);
          uint64_t v123 = handleForCategory(0);
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v159 = v106;
            __int16 v160 = 2112;
            char v161 = v118;
            _os_log_impl(&dword_21FBF2000, v123, OS_LOG_TYPE_DEFAULT, "Found unsealed non-repairable instance: %@. Seal with instance: %@", buf, 0x16u);
          }
        }
        objc_msgSend_addObject_(v134, v110, @"HmCA", v111);
      }
      uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v101, (uint64_t)&v140, (uint64_t)v155, 16);
      if (v103) {
        continue;
      }
      break;
    }
    id v33 = 0;
    BOOL v39 = 1;
LABEL_54:
    a6 = v135;
    uint64_t v22 = v136;
    uint64_t v14 = v137;
  }
  else
  {
    id v33 = 0;
    BOOL v39 = 1;
  }

  uint64_t v18 = v138;
LABEL_7:

  if (a6) {
    *a6 = v33;
  }

  return v39;
}

- (id)spcWithComponent:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isEqual_(@"tcrt", v5, (uint64_t)v4, v6)) {
    goto LABEL_2;
  }
  if (objc_msgSend_isEqual_(@"RCSn", v7, (uint64_t)v4, v8))
  {
    uint64_t v9 = @"IPAD REAR CAMERA";
    goto LABEL_9;
  }
  if (objc_msgSend_containsObject_(&unk_26D1636F8, v10, (uint64_t)v4, v11))
  {
LABEL_2:
    uint64_t v9 = @"IPAD COMP DISPLAY";
  }
  else if ((objc_msgSend_containsObject_(&unk_26D163710, v12, (uint64_t)v4, v13) & 1) != 0 {
         || (objc_msgSend_isEqual_(@"psd2", v14, (uint64_t)v4, v15) & 1) != 0)
  }
  {
    uint64_t v9 = @"IPAD FRONT CAMERA";
  }
  else if (objc_msgSend_containsObject_(&unk_26D163728, v16, (uint64_t)v4, v17) {
         && (objc_msgSend_supportMesaRepair(self, v19, v20, v21) & 1) != 0)
  }
  {
    uint64_t v9 = @"IPAD TOUCH ID";
  }
  else if (objc_msgSend_isEqual_(@"MSRk", v19, (uint64_t)v4, v21))
  {
    if (objc_msgSend_supportMesaRepair(self, v22, v23, v24)) {
      uint64_t v9 = @"IPAD TOUCH ID";
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_9:

  return v9;
}

@end