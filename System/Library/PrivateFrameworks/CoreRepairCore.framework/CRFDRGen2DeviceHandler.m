@interface CRFDRGen2DeviceHandler
+ (BOOL)isGen2ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4;
@end

@implementation CRFDRGen2DeviceHandler

+ (BOOL)isGen2ProductType:(int)a3
{
  return *(void *)&a3 == 2722529672 || *(void *)&a3 == 1371389549 || *(void *)&a3 == 2080700391;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen2ProductType_(CRFDRGen2DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    v4 = objc_alloc_init(CRFDRGen2DeviceHandler);
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen2DeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  int v10 = objc_msgSend_containsObject_(v6, v8, @"IPHONE COMP FACEID", v9);

  if (v10)
  {
    id v25 = 0;
    int v12 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v11, (uint64_t)v7, @"psd2", &v25);
    id v13 = v25;
    v14 = 0;
    if (v12) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    if (!v15)
    {
      uint64_t v16 = (uint64_t)v13;
      v17 = handleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_21FC60E40(v16, v17, v18, v19, v20, v21, v22, v23);
      }

      v14 = (void *)v16;
    }
  }
  else
  {
    v14 = 0;
  }
  if (a4) {
    *a4 = v14;
  }

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v12 = objc_opt_new();
  if (a5)
  {
    id v13 = objc_msgSend_currentProperties(self, v9, v10, v11);
    id v14 = *a5;
    *a5 = v13;
  }
  BOOL v15 = AMFDRGetOptions();
  uint64_t v18 = v15;
  if (v15)
  {
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"Metadata", v17);
    v26 = objc_msgSend_mutableCopy(v19, v20, v21, v22);
    if (v26)
    {
      v27 = objc_msgSend_currentProperties(self, v23, v24, v25);
      v30 = objc_msgSend_objectForKeyedSubscript_(v27, v28, @"mlb#", v29);

      if (v30)
      {
        v34 = objc_msgSend_currentProperties(self, v31, v32, v33);
        v37 = objc_msgSend_objectForKeyedSubscript_(v34, v35, @"mlb#", v36);
        objc_msgSend_setObject_forKeyedSubscript_(v26, v38, (uint64_t)v37, @"MLBNumber");
      }
      v39 = objc_msgSend_currentProperties(self, v31, v32, v33);
      v42 = objc_msgSend_objectForKeyedSubscript_(v39, v40, @"SrNm", v41);

      if (v42)
      {
        v46 = objc_msgSend_currentProperties(self, v43, v44, v45);
        v49 = objc_msgSend_objectForKeyedSubscript_(v46, v47, @"SrNm", v48);
        objc_msgSend_setObject_forKeyedSubscript_(v26, v50, (uint64_t)v49, @"SerialNumber");
      }
      AMFDRSetOption();
    }
    v51 = handleForCategory(0);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v84 = (uint64_t)v26;
      _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }
  }
  v76 = v8;
  if (objc_msgSend_containsObject_(v8, v16, @"IPHONE COMP FACEID", v17)
    && (long long v80 = 0u,
        long long v81 = 0u,
        long long v78 = 0u,
        long long v79 = 0u,
        (uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1635C0, v52, (uint64_t)&v78, (uint64_t)v82, 16)) != 0))
  {
    uint64_t v56 = v53;
    uint64_t v57 = *(void *)v79;
    while (2)
    {
      for (uint64_t i = 0; i != v56; ++i)
      {
        if (*(void *)v79 != v57) {
          objc_enumerationMutation(&unk_26D1635C0);
        }
        uint64_t v59 = *(void *)(*((void *)&v78 + 1) + 8 * i);
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v54, v59, v55))
        {
          id v77 = 0;
          int v61 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v60, (uint64_t)v12, v59, &v77);
          id v62 = v77;
          if (v61) {
            BOOL v63 = v62 == 0;
          }
          else {
            BOOL v63 = 0;
          }
          if (!v63)
          {
            v65 = v62;
            v66 = handleForCategory(0);
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
              sub_21FC60EAC((uint64_t)v65, v66, v68, v69, v70, v71, v72, v73);
            }

            goto LABEL_35;
          }
        }
        else
        {
          v64 = handleForCategory(0);
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v84 = v59;
            _os_log_impl(&dword_21FBF2000, v64, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
          }
        }
      }
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D1635C0, v54, (uint64_t)&v78, (uint64_t)v82, 16);
      v65 = 0;
      if (v56) {
        continue;
      }
      break;
    }
  }
  else
  {
    v65 = 0;
  }
LABEL_35:
  if (a6) {
    *a6 = v65;
  }

  return v12;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v31 = (id)objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v6;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v36;
    v30 = a4;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v7);
        }
        BOOL v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_msgSend_isEqualToString_(v15, v10, @"IPHONE COMP BATTERY", v11))
        {
          id v34 = 0;
          int v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v31, @"vcrt", &v34);
          id v19 = v34;
          uint64_t v20 = v19;
          if (!v18 || v19)
          {
            uint64_t v22 = handleForCategory(0);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_21FC61690((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);
            }

            goto LABEL_19;
          }
        }
        if (objc_msgSend_isEqualToString_(v15, v16, @"IPHONE COMP DISPLAY", v17))
        {
          uint64_t v21 = handleForCategory(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_21FC60F18(&buf, v33, v21);
          }
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v35, (uint64_t)v39, 16);
      if (v12) {
        continue;
      }
      break;
    }
    uint64_t v20 = 0;
LABEL_19:
    a4 = v30;
  }
  else
  {
    uint64_t v20 = 0;
  }

  if (a4) {
    *a4 = v20;
  }

  return v31;
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
      v39 = handleForCategory(0);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        sub_21FC60D80(v39);
      }
    }
    else
    {
      uint64_t v41 = a6;
      v42 = a7;
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
            long long v35 = objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
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
      v39 = *v42;
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

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!objc_msgSend_isEqual_(@"vcrt", v7, (uint64_t)v6, v8)
    || (uint64_t v11 = @"IPHONE COMP BATTERY",
        (objc_msgSend_containsObject_(v5, v9, @"IPHONE COMP BATTERY", v10) & 1) == 0))
  {
    if (objc_msgSend_containsObject_(&unk_26D1635C0, v9, (uint64_t)v6, v10))
    {
      uint64_t v11 = @"IPHONE COMP FACEID";
      if (!objc_msgSend_containsObject_(v5, v12, @"IPHONE COMP FACEID", v13)) {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }

  return v11;
}

@end