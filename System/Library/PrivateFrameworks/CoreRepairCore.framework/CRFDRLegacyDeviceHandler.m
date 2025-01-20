@interface CRFDRLegacyDeviceHandler
+ (BOOL)isLegacyProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4;
@end

@implementation CRFDRLegacyDeviceHandler

+ (BOOL)isLegacyProductType:(int)a3
{
  return *(void *)&a3 == 1721691077 || *(void *)&a3 == 1429914406;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isLegacyProductType_(CRFDRLegacyDeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    v4 = objc_alloc_init(CRFDRLegacyDeviceHandler);
  }
  else {
    v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRLegacyDeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  v28 = v6;
  if (objc_msgSend_containsObject_(v6, v8, @"IPHONE COMP FACEID", v9))
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163590, v10, (uint64_t)&v30, (uint64_t)v36, 16);
    if (v11)
    {
      uint64_t v14 = v11;
      uint64_t v15 = *(void *)v31;
      v27 = a4;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(&unk_26D163590);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * v16);
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v12, v17, v13, v27))
        {
          id v29 = 0;
          int v19 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v18, (uint64_t)v7, v17, &v29);
          id v20 = v29;
          if (v19) {
            BOOL v21 = v20 == 0;
          }
          else {
            BOOL v21 = 0;
          }
          if (!v21)
          {
            v24 = v20;
            v25 = handleForCategory(0);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              sub_21FC60CC4((uint64_t)v24, v25);
            }

            a4 = v27;
            if (v27) {
              goto LABEL_21;
            }
            goto LABEL_22;
          }
        }
        else
        {
          v22 = handleForCategory(0);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v17;
            _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_26D163590, v12, (uint64_t)&v30, (uint64_t)v36, 16);
          v24 = 0;
          a4 = v27;
          if (v14) {
            goto LABEL_4;
          }
          goto LABEL_20;
        }
      }
    }
  }
  v24 = 0;
LABEL_20:
  if (a4) {
LABEL_21:
  }
    *a4 = v24;
LABEL_22:

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v11 = a3;
  if (a5)
  {
    v12 = objc_msgSend_currentProperties(self, v8, v9, v10);
    id v13 = *a5;
    *a5 = v12;
  }
  uint64_t v14 = AMFDRGetOptions();
  uint64_t v17 = v14;
  if (v14)
  {
    v18 = objc_msgSend_objectForKeyedSubscript_(v14, v15, @"Metadata", v16);
    v25 = objc_msgSend_mutableCopy(v18, v19, v20, v21);
    if (v25)
    {
      v26 = objc_msgSend_currentProperties(self, v22, v23, v24);
      id v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, @"mlb#", v28);

      if (v29)
      {
        long long v33 = objc_msgSend_currentProperties(self, v30, v31, v32);
        v36 = objc_msgSend_objectForKeyedSubscript_(v33, v34, @"mlb#", v35);
        objc_msgSend_setObject_forKeyedSubscript_(v25, v37, (uint64_t)v36, @"MLBNumber");
      }
      v38 = objc_msgSend_currentProperties(self, v30, v31, v32);
      v41 = objc_msgSend_objectForKeyedSubscript_(v38, v39, @"SrNm", v40);

      if (v41)
      {
        v45 = objc_msgSend_currentProperties(self, v42, v43, v44);
        v48 = objc_msgSend_objectForKeyedSubscript_(v45, v46, @"SrNm", v47);
        objc_msgSend_setObject_forKeyedSubscript_(v25, v49, (uint64_t)v48, @"SerialNumber");
      }
      AMFDRSetOption();
    }
    v50 = handleForCategory(0);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      int v52 = 138412290;
      v53 = v25;
      _os_log_impl(&dword_21FBF2000, v50, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", (uint8_t *)&v52, 0xCu);
    }
  }
  return 0;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  v4 = objc_opt_new();
  v5 = handleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_21FC60D3C(v5);
  }

  return v4;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v41 = 0;
  v12 = objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v41, a8);
  if (!a8 || !*a8)
  {
    id v13 = objc_opt_new();
    uint64_t v15 = objc_opt_new();
    uint64_t v16 = (void *)v15;
    if (v13) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v14 = !v17;
    if (v17)
    {
      long long v33 = handleForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_21FC60D80(v33);
      }
    }
    else
    {
      uint64_t v35 = a6;
      v36 = a7;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v18 = v12;
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v37, (uint64_t)v42, 16);
      if (v20)
      {
        uint64_t v23 = v20;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v18);
            }
            uint64_t v26 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v21, v26, v22, v35, v36, (void)v37);
            id v29 = objc_msgSend_objectForKeyedSubscript_(v18, v27, v26, v28);
            objc_msgSend_addObject_(v16, v30, (uint64_t)v29, v31);
          }
          uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v37, (uint64_t)v42, 16);
        }
        while (v23);
      }

      if (a5) {
        objc_storeStrong(a5, v13);
      }
      if (v35) {
        objc_storeStrong(v35, v16);
      }
      if (!v36) {
        goto LABEL_29;
      }
      id v32 = v41;
      long long v33 = *v36;
      id *v36 = v32;
    }

LABEL_29:
    goto LABEL_30;
  }
  id v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_21FC60DC4((uint64_t *)a8, v13);
  }
  BOOL v14 = 0;
LABEL_30:

  return v14;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v5 = a3;
  if (objc_msgSend_containsObject_(&unk_26D163590, v6, (uint64_t)a4, v7))
  {
    uint64_t v10 = @"IPHONE COMP FACEID";
    if (!objc_msgSend_containsObject_(v5, v8, @"IPHONE COMP FACEID", v9)) {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end