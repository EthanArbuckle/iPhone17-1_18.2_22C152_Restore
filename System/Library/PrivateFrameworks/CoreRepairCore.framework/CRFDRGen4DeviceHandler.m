@interface CRFDRGen4DeviceHandler
+ (BOOL)isGen4ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6;
- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4;
- (id)spcWithComponent:(id)a3;
- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4;
@end

@implementation CRFDRGen4DeviceHandler

+ (BOOL)isGen4ProductType:(int)a3
{
  return *(void *)&a3 == 2078329141;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen4ProductType_(CRFDRGen4DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    v4 = objc_alloc_init(CRFDRGen4DeviceHandler);
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen4DeviceHandler);
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
  id v8 = v6;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    v27 = a4;
    uint64_t v14 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v8);
        }
        if (objc_msgSend_isEqualToString_(*(void **)(*((void *)&v29 + 1) + 8 * i), v11, @"IPHONE COMP BATTERY", v12, v27))
        {
          id v28 = 0;
          int v16 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v11, (uint64_t)v7, @"vcrt", &v28);
          id v17 = v28;
          v18 = v17;
          if (!v16 || v17)
          {
            v19 = handleForCategory(0);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_21FC641EC((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
            }

            goto LABEL_15;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v13) {
        continue;
      }
      break;
    }
    v18 = 0;
LABEL_15:
    a4 = v27;
  }
  else
  {
    v18 = 0;
  }

  if (a4) {
    *a4 = v18;
  }

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = objc_opt_new();
  uint64_t v14 = objc_msgSend_currentProperties(self, v11, v12, v13);
  uint64_t v92 = objc_msgSend_mutableCopy(v14, v15, v16, v17);

  v93 = AMFDRGetOptions();
  if (v93)
  {
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v93, v18, @"Metadata", v19);
    v27 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
    if (v27)
    {
      id v28 = objc_msgSend_currentProperties(self, v24, v25, v26);
      long long v31 = objc_msgSend_objectForKeyedSubscript_(v28, v29, @"mlb#", v30);

      if (v31)
      {
        v35 = objc_msgSend_currentProperties(self, v32, v33, v34);
        v38 = objc_msgSend_objectForKeyedSubscript_(v35, v36, @"mlb#", v37);
        objc_msgSend_setObject_forKeyedSubscript_(v27, v39, (uint64_t)v38, @"MLBNumber");
      }
      v40 = objc_msgSend_currentProperties(self, v32, v33, v34);
      v43 = objc_msgSend_objectForKeyedSubscript_(v40, v41, @"SrNm", v42);

      if (v43)
      {
        v47 = objc_msgSend_currentProperties(self, v44, v45, v46);
        v50 = objc_msgSend_objectForKeyedSubscript_(v47, v48, @"SrNm", v49);
        objc_msgSend_setObject_forKeyedSubscript_(v27, v51, (uint64_t)v50, @"SerialNumber");
      }
      AMFDRSetOption();
    }
    v52 = handleForCategory(0);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v102 = v27;
      _os_log_impl(&dword_21FBF2000, v52, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }
  }
  if (!objc_msgSend_containsObject_(v9, v18, @"IPHONE COMP DISPLAY", v19))
  {
    v73 = 0;
    v70 = (void *)v92;
    goto LABEL_42;
  }
  v89 = a6;
  v90 = a5;
  id v91 = v9;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1638F0, v53, (uint64_t)&v96, (uint64_t)v100, 16);
  if (!v54) {
    goto LABEL_37;
  }
  uint64_t v57 = v54;
  uint64_t v58 = *(void *)v97;
  while (2)
  {
    for (uint64_t i = 0; i != v57; ++i)
    {
      if (*(void *)v97 != v58) {
        objc_enumerationMutation(&unk_26D1638F0);
      }
      v60 = *(void **)(*((void *)&v96 + 1) + 8 * i);
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v55, (uint64_t)v60, v56) & 1) == 0)
      {
        v63 = handleForCategory(0);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v102 = v60;
          _os_log_impl(&dword_21FBF2000, v63, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
        }
        goto LABEL_34;
      }
      id v95 = 0;
      char v62 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v61, (uint64_t)v10, (uint64_t)v60, &v95);
      v63 = v95;
      if (objc_msgSend_allowMissingData(self, v64, v65, v66)
        && !objc_msgSend_isEqual_(v60, v55, @"dCfg", v56))
      {
        if (v63) {
          char v68 = 0;
        }
        else {
          char v68 = v62;
        }
        if ((v68 & 1) == 0)
        {
          v69 = handleForCategory(0);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v102 = v60;
            _os_log_impl(&dword_21FBF2000, v69, OS_LOG_TYPE_DEFAULT, "%@ is missing, but allowed", buf, 0xCu);
          }

LABEL_34:
          continue;
        }
      }
      else
      {
        if (v63) {
          char v67 = 0;
        }
        else {
          char v67 = v62;
        }
        if ((v67 & 1) == 0)
        {
          v81 = handleForCategory(0);
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
            sub_21FC60EAC((uint64_t)v63, v81, v83, v84, v85, v86, v87, v88);
          }
          a5 = v90;
          id v9 = v91;
          a6 = v89;
          v70 = (void *)v92;
          goto LABEL_52;
        }
      }
    }
    uint64_t v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1638F0, v55, (uint64_t)&v96, (uint64_t)v100, 16);
    if (v57) {
      continue;
    }
    break;
  }
LABEL_37:
  id v94 = 0;
  v70 = (void *)v92;
  int v71 = objc_msgSend__addPropertyToMutableDictionary_property_withError_(self, v55, v92, @"drp#", &v94);
  v72 = v94;
  v63 = v72;
  a5 = v90;
  id v9 = v91;
  a6 = v89;
  if (v71)
  {
    v73 = 0;
    if (!v72)
    {
LABEL_42:
      if (!a6) {
        goto LABEL_44;
      }
      goto LABEL_43;
    }
  }
  v81 = handleForCategory(0);
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
    sub_21FC64258((uint64_t)v63, v81, v74, v75, v76, v77, v78, v79);
  }
LABEL_52:

  v73 = v63;
  if (a6) {
LABEL_43:
  }
    *a6 = v73;
LABEL_44:
  if (a5) {
    objc_storeStrong(a5, v70);
  }

  return v10;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = v7;
  if (!v7 || objc_msgSend_isEqual_(v7, v8, (uint64_t)&unk_26D163320, v9))
  {
    uint64_t v13 = handleForCategory(0);
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
  uint64_t v13 = MGCopyAnswer();
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
    v47 = objc_msgSend_previousCGSN(self, v44, v45, v46);
    v51 = objc_msgSend_sealDate(self, v48, v49, v50);
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
  uint64_t v33 = objc_msgSend_kbbCGSN(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_kbbSealDate(self, v34, v35, v36);
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
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_21FC5F1A0((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  }
  BOOL v20 = 0;
LABEL_30:

  return v20;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!objc_msgSend_isEqual_(@"vcrt", v7, (uint64_t)v6, v8)
    || (v11 = @"IPHONE COMP BATTERY",
        (objc_msgSend_containsObject_(v5, v9, @"IPHONE COMP BATTERY", v10) & 1) == 0))
  {
    if (objc_msgSend_containsObject_(&unk_26D1638F0, v9, (uint64_t)v6, v10))
    {
      v11 = @"IPHONE COMP DISPLAY";
      if (!objc_msgSend_containsObject_(v5, v12, @"IPHONE COMP DISPLAY", v13)) {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)spcWithComponent:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqual_(@"vcrt", v4, (uint64_t)v3, v5))
  {
    uint64_t v8 = @"IPHONE COMP BATTERY";
  }
  else if (objc_msgSend_isEqual_(@"drp#", v6, (uint64_t)v3, v7))
  {
    uint64_t v8 = @"IPHONE COMP DISPLAY";
  }
  else
  {
    uint64_t v8 = @"IPHONE COMP DISPLAY";
    if ((objc_msgSend_containsObject_(&unk_26D1638F0, v9, (uint64_t)v3, v10) & 1) == 0
      && !objc_msgSend_isEqual_(@"MSRk", v11, (uint64_t)v3, v12))
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

@end