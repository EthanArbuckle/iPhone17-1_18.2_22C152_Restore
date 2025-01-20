@interface CRFDRGen6DeviceHandler
+ (BOOL)isGen6ProductType:(int)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9;
- (BOOL)setBrunorMinimalSealingMeta:(__AMFDR *)a3 instances:(id)a4;
- (BOOL)supportCameraDepth;
- (BOOL)supportMctubMinus;
- (BOOL)supportPatch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getPatchInfoPerSPC;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
@end

@implementation CRFDRGen6DeviceHandler

+ (BOOL)isGen6ProductType:(int)a3
{
  BOOL result = 1;
  if (*(uint64_t *)&a3 > 2793418700)
  {
    if (*(uint64_t *)&a3 > 2941181570)
    {
      if (*(void *)&a3 == 2941181571) {
        return result;
      }
      uint64_t v4 = 3825599860;
    }
    else
    {
      if (*(void *)&a3 == 2793418701) {
        return result;
      }
      uint64_t v4 = 2795618603;
    }
  }
  else if (*(uint64_t *)&a3 > 574536382)
  {
    if (*(void *)&a3 == 574536383) {
      return result;
    }
    uint64_t v4 = 851437781;
  }
  else
  {
    if (*(void *)&a3 == 133314240) {
      return result;
    }
    uint64_t v4 = 330877086;
  }
  if (*(void *)&a3 != v4) {
    return 0;
  }
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  if (objc_msgSend_isGen6ProductType_(CRFDRGen6DeviceHandler, a2, *(uint64_t *)&a3, v3)) {
    uint64_t v4 = objc_alloc_init(CRFDRGen6DeviceHandler);
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen6DeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  if (objc_msgSend_supportHarvestPearl(self, v8, v9, v10))
  {
    v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "No update only data classes, skipping.", buf, 2u);
    }
    id v14 = 0;
LABEL_5:

    v15 = v14;
    goto LABEL_13;
  }
  if (objc_msgSend_containsObject_(v6, v11, @"IPHONE COMP FACEID", v12)
    && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v16, @"psd2", v17))
  {
    id v22 = 0;
    int v19 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v18, (uint64_t)v7, @"psd2", &v22);
    id v20 = v22;
    id v14 = v20;
    if (!v19 || (v15 = 0, v20))
    {
      v13 = handleForCategory(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_21FC616FC();
      }
      goto LABEL_5;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_13:
  if (a4) {
    *a4 = v15;
  }

  return v7;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v34, (uint64_t)v38, 16);
  if (!v9)
  {
    id v20 = 0;
    goto LABEL_27;
  }
  uint64_t v12 = v9;
  v29 = a4;
  uint64_t v13 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if (objc_msgSend_isEqualToString_(v15, v10, @"IPHONE COMP BATTERY", v11))
      {
        id v33 = 0;
        int v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v7, @"vcrt", &v33);
        id v19 = v33;
        id v20 = v19;
        if (!v18 || v19)
        {
          v27 = handleForCategory(0);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
      if (objc_msgSend_isEqualToString_(v15, v16, @"IPHONE COMP DISPLAY", v17))
      {
        id v32 = 0;
        int v23 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v21, (uint64_t)v7, @"tcrt", &v32);
        id v24 = v32;
        id v20 = v24;
        if (!v23 || v24)
        {
          v27 = handleForCategory(0);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
LABEL_25:
          }
            sub_21FC61764();
LABEL_26:
          a4 = v29;

          goto LABEL_27;
        }
      }
      if (objc_msgSend_isEqualToString_(v15, v21, @"IPHONE COMP FACEID", v22))
      {
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v10, @"prpc", v11))
        {
          id v31 = 0;
          int v25 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v10, (uint64_t)v7, @"prpc", &v31);
          id v26 = v31;
          id v20 = v26;
          if (!v25 || v26)
          {
            v27 = handleForCategory(0);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              goto LABEL_25;
            }
            goto LABEL_26;
          }
        }
      }
    }
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v34, (uint64_t)v38, 16);
    if (v12) {
      continue;
    }
    break;
  }
  id v20 = 0;
  a4 = v29;
LABEL_27:

  if (a4) {
    *a4 = v20;
  }

  return v7;
}

- (BOOL)supportPatch
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 2795618602)
  {
    if (v3 == 2795618603) {
      return v2;
    }
    uint64_t v4 = 2941181571;
  }
  else
  {
    if (v3 == 133314240) {
      return v2;
    }
    uint64_t v4 = 330877086;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (BOOL)supportCameraDepth
{
  uint64_t v2 = MGGetProductType();
  return v2 == 2795618603 || v2 == 330877086;
}

- (BOOL)supportMctubMinus
{
  BOOL v2 = 1;
  uint64_t v3 = MGGetProductType();
  if (v3 > 851437780)
  {
    if (v3 == 851437781) {
      return v2;
    }
    uint64_t v4 = 2795618603;
  }
  else
  {
    if (v3 == 330877086) {
      return v2;
    }
    uint64_t v4 = 574536383;
  }
  if (v3 != v4) {
    return 0;
  }
  return v2;
}

- (id)getPatchInfoPerSPC
{
  BOOL v2 = 0;
  uint64_t v3 = MGGetProductType();
  if (v3 <= 2795618602)
  {
    if (v3 != 133314240)
    {
      uint64_t v4 = 330877086;
      goto LABEL_6;
    }
    return &unk_26D1639D0;
  }
  if (v3 == 2941181571) {
    return &unk_26D1639D0;
  }
  uint64_t v4 = 2795618603;
LABEL_6:
  if (v3 == v4) {
    return &unk_26D163958;
  }
  return v2;
}

- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (objc_msgSend_supportHarvestPearl(self, v11, v12, v13))
  {
    id v35 = v10;
    if (objc_msgSend_isServicePart(self, v14, v15, v16)
      && objc_msgSend_containsObject_(v10, v17, @"IPHONE MCTUB", v18))
    {
      id v20 = objc_msgSend_kbbSealingManifest(self, v17, v19, v18);

      if (!v20)
      {
        v29 = handleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_21FC617CC();
        }
        BOOL v31 = 0;
        goto LABEL_20;
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      CFDictionarySetValue(Mutable, @"DataStore", @"Local");
      AMFDRCreateWithOptions();
      int v25 = objc_msgSend_kbbSealingManifest(self, v22, v23, v24);
      char v26 = AMFDRDataDecodeAndSetSealingManifest();

      if ((v26 & 1) == 0)
      {
        v29 = handleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          sub_21FC61904();
        }
        BOOL v31 = 0;
        goto LABEL_20;
      }
      int v27 = AMFDRSealingManifestCopyMinimalManifestClassesAndInstances();

      v28 = handleForCategory(0);
      v29 = v28;
      if (!v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_21FC6189C();
        }
        BOOL v31 = 0;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = 0;
        __int16 v38 = 2112;
        uint64_t v39 = 0;
        __int16 v40 = 2112;
        uint64_t v41 = 0;
        _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "KBB MinimalManifests: %@, %@, %@", buf, 0x20u);
      }

      id v10 = v35;
    }
    if (!objc_msgSend_containsObject_(v10, v17, @"IPHONE COMP FACEID", v18))
    {
      v30 = 0;
LABEL_19:
      BOOL v31 = 1;
LABEL_21:
      AMSupportSafeRelease();
      AMSupportSafeRelease();

      goto LABEL_22;
    }
    int v32 = AMFDRSealingMapCopyMinimalManifestClassesAndInstances();
    v30 = 0;

    id v33 = handleForCategory(0);
    v29 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v37 = 0;
        __int16 v38 = 2112;
        uint64_t v39 = 0;
        __int16 v40 = 2112;
        uint64_t v41 = 0;
        _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "Current MinimalManifests: %@, %@, %@", buf, 0x20u);
      }

      id v10 = v35;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC61834();
    }
    BOOL v31 = 0;
LABEL_20:

    v30 = 0;
    id v10 = v35;
    goto LABEL_21;
  }
  v30 = handleForCategory(0);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "Minimal manifests not supported.", buf, 2u);
  }
  BOOL v31 = 1;
LABEL_22:

  return v31;
}

- (BOOL)setBrunorMinimalSealingMeta:(__AMFDR *)a3 instances:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a4;
  v5 = objc_opt_new();
  if (!v5)
  {
    id v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC6196C();
    }

LABEL_32:
    BOOL v30 = 0;
    goto LABEL_33;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v38, (uint64_t)v44, 16);
  if (!v7) {
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  id v34 = v4;
  uint64_t v37 = v5;
  uint64_t v9 = 0;
  id v10 = 0;
  SikInstanceString = 0;
  uint64_t v12 = 0;
  uint64_t v36 = *(void *)v39;
  while (2)
  {
    uint64_t v13 = 0;
    id v14 = v9;
    uint64_t v15 = v10;
    uint64_t v16 = SikInstanceString;
    uint64_t v17 = v12;
    do
    {
      if (*(void *)v39 != v36) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * v13);
      uint64_t v12 = objc_opt_new();

      if (!v12)
      {
        BOOL v31 = handleForCategory(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_21FC619A0();
        }

        uint64_t v22 = v14;
        id v14 = v15;
        goto LABEL_31;
      }
      SikInstanceString = AMFDRDataCreateSikInstanceString();

      if (!SikInstanceString)
      {
        uint64_t v22 = handleForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_21FC619D4();
        }
        uint64_t v16 = v15;
        goto LABEL_31;
      }
      id v10 = objc_msgSend_stringWithFormat_(NSString, v19, @"%@:%@", v20, @"pspc", SikInstanceString);

      v21 = handleForCategory(0);
      uint64_t v22 = v21;
      if (!v10)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_21FC61A08();
        }
LABEL_30:
        uint64_t v16 = SikInstanceString;
LABEL_31:
        id v4 = v34;
        v5 = v37;

        goto LABEL_32;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v10;
        _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "instance full string: %@", buf, 0xCu);
      }

      objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v10, @"x-fdr-manifest-prop-mpub-key");
      objc_msgSend_setObject_forKeyedSubscript_(v12, v24, @"mpub", @"x-fdr-add-manifest-props");
      uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v25, @"%@-%@", v26, @"minimal-manifest", v18);

      if (!v9)
      {
        uint64_t v22 = handleForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_21FC61A3C();
        }
        id v14 = v10;
        goto LABEL_30;
      }
      objc_msgSend_setObject_forKeyedSubscript_(v37, v27, (uint64_t)v12, (uint64_t)v9);
      ++v13;
      id v14 = v9;
      uint64_t v15 = v10;
      uint64_t v16 = SikInstanceString;
      uint64_t v17 = v12;
    }
    while (v8 != v13);
    uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v38, (uint64_t)v44, 16);
    if (v8) {
      continue;
    }
    break;
  }

  id v4 = v34;
  v5 = v37;
LABEL_16:

  v29 = handleForCategory(0);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "MultiSealingMetadata: %@", buf, 0xCu);
  }

  AMFDRSetOption();
  BOOL v30 = 1;
LABEL_33:

  return v30;
}

@end