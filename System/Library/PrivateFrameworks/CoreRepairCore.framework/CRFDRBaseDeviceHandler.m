@interface CRFDRBaseDeviceHandler
+ (BOOL)isFDRDataClassSupported:(id)a3;
+ (BOOL)isFDRPrimaryDataClass:(id)a3;
+ (BOOL)isFDRPropertySupported:(id)a3;
+ (id)_getDataClassUsingComponentAuthName:(id)a3;
+ (id)_populateSealingMapForCurrentDevice;
+ (id)_populateSealingMapProperties;
+ (id)copySealingManifestDataInstanceForComponent:(id)a3;
+ (id)getDeviceHandlerForProductType:(int)a3;
+ (id)getPropertyArrayFrom:(id)a3;
+ (id)getRegisterChangeDictUsingComponentAuthName:(id)a3;
+ (id)getSealingMap;
+ (void)initSealingMap;
- (BOOL)_addDataClassAndInstanceToMutableDictionary:(id)a3 dataClass:(id)a4 withError:(id *)a5;
- (BOOL)_addDataClassAndInstancesToMutableArray:(id)a3 dataClasses:(id)a4 dataInstances:(id)a5 withError:(id *)a6;
- (BOOL)_addPropertyToMutableDictionary:(id)a3 property:(id)a4 withError:(id *)a5;
- (BOOL)allowFactoryReset;
- (BOOL)allowMissingData;
- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8;
- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9;
- (BOOL)getPatchExpectedDataWithPartSPC:(id)a3 amfdr:(__AMFDR *)a4 expectedClasses:(id *)a5 expectedInstances:(id *)a6 expectedValues:(id *)a7 expectedDatas:(id *)a8 validClasses:(id)a9 validInstances:(id)a10 error:(id *)a11;
- (BOOL)isServicePart;
- (BOOL)storeWarningStrings:(id)a3;
- (BOOL)supportCameraDepth;
- (BOOL)supportHarvestPearl;
- (BOOL)supportMSRk;
- (BOOL)supportMctubMinus;
- (BOOL)supportPatch;
- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6;
- (BOOL)validatePatchWithPartSPC:(id)a3 originalClasses:(id)a4 originalInstances:(id)a5 originalValues:(id)a6 validClasses:(id)a7 validInstances:(id)a8;
- (BOOL)validateSwappedForDays:(int64_t)a3 currentSN:(id)a4 previousSN:(id)a5 sealDate:(id)a6;
- (CRFDRBaseDeviceHandler)init;
- (NSArray)currentDataClasses;
- (NSArray)currentDataInstances;
- (NSData)kbbSealingManifest;
- (NSDictionary)currentProperties;
- (NSMutableArray)warnings;
- (NSMutableDictionary)updateProperties;
- (NSString)KBBSerialNumber;
- (NSString)KGBSerialNumber;
- (NSString)kbbCGSN;
- (NSString)kbbSealDate;
- (NSString)previousCGSN;
- (NSString)sealDate;
- (double)timeIntervalSinceLastSealing:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getCurrentManifestDataClassesAndInstancesWithPartSPC:(id)a3 fdr:(__AMFDR *)a4 currentClasses:(id *)a5 currentInstances:(id *)a6 currentProperties:(id *)a7 fdrError:(id *)a8;
- (id)getDataClassesAndInstancesOfKBBWith:(__AMFDR *)a3 propertiesDict:(id *)a4 fdrError:(id *)a5;
- (id)getExcludedPropertiesForFactoryReset;
- (id)getExpectedPatchInfo:(id)a3;
- (id)getPatchInfoPerSPC;
- (id)getSealDateFromSealingManifestData:(id)a3;
- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4;
- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4;
- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4;
- (id)spcWithComponent:(id)a3;
- (int64_t)performPostSealingStage:(id)a3;
- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4;
- (void)setAllowFactoryReset:(BOOL)a3;
- (void)setAllowMissingData:(BOOL)a3;
- (void)setCurrentDataClasses:(id)a3;
- (void)setCurrentDataInstances:(id)a3;
- (void)setCurrentProperties:(id)a3;
- (void)setIsServicePart:(BOOL)a3;
- (void)setKBBSerialNumber:(id)a3;
- (void)setKGBSerialNumber:(id)a3;
- (void)setKbbCGSN:(id)a3;
- (void)setKbbSealDate:(id)a3;
- (void)setKbbSealingManifest:(id)a3;
- (void)setPreviousCGSN:(id)a3;
- (void)setSealDate:(id)a3;
- (void)setUpdateProperties:(id)a3;
- (void)setWarnings:(id)a3;
@end

@implementation CRFDRBaseDeviceHandler

+ (void)initSealingMap
{
  id obj = a1;
  objc_sync_enter(obj);
  if (!qword_26AC133C0 || !objc_msgSend_count((void *)qword_26AC133C0, v2, v3, v4))
  {
    uint64_t v5 = objc_msgSend__populateSealingMapForCurrentDevice(CRFDRBaseDeviceHandler, v2, v3, v4);
    v6 = (void *)qword_26AC133C0;
    qword_26AC133C0 = v5;
  }
  if (!qword_26AC133C8 || !objc_msgSend_count((void *)qword_26AC133C8, v2, v3, v4))
  {
    uint64_t v7 = objc_msgSend__populateSealingMapProperties(CRFDRBaseDeviceHandler, v2, v3, v4);
    v8 = (void *)qword_26AC133C8;
    qword_26AC133C8 = v7;
  }
  objc_sync_exit(obj);
}

- (CRFDRBaseDeviceHandler)init
{
  v9.receiver = self;
  v9.super_class = (Class)CRFDRBaseDeviceHandler;
  uint64_t v5 = [(CRFDRBaseDeviceHandler *)&v9 init];
  if (v5)
  {
    objc_msgSend_initSealingMap(CRFDRBaseDeviceHandler, v2, v3, v4);
    *(_WORD *)&v5->isServicePart = 0;
    v5->allowMissingData = 0;
    uint64_t v6 = objc_opt_new();
    warnings = v5->warnings;
    v5->warnings = (NSMutableArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (id)_populateSealingMapForCurrentDevice
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = AMFDRSealingMapGetEntriesForDevice();
  uint64_t v6 = objc_msgSend_set(MEMORY[0x263EFF9C0], v3, v4, v5);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v2;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"Tag", v15, (void)v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_addObject_(v6, v17, (uint64_t)v16, v18);
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v14, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  return v6;
}

+ (id)_populateSealingMapProperties
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend_getSealingMap(CRFDRBaseDeviceHandler, a2, v2, v3);
  id v7 = objc_msgSend_getPropertyArrayFrom_(CRFDRBaseDeviceHandler, v5, (uint64_t)v4, v6);
  objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9, v10);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v27 = v7;
    v28 = v4;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v7;
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v13)
    {
      uint64_t v15 = v13;
      v16 = 0;
      v17 = 0;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v11);
          }
          long long v20 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (v20)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v22 = objc_msgSend_objectForKey_(v20, v14, @"Tag", v21);

              if (v22)
              {
                uint64_t v24 = objc_msgSend_objectForKey_(v20, v14, @"PropertyIdentifier", v23);

                if (v24)
                {
                  objc_msgSend_setObject_forKey_(v29, v14, v24, v22);
                  v16 = (void *)v24;
                }
                else
                {
                  v16 = 0;
                }
                v17 = (void *)v22;
              }
              else
              {
                v17 = 0;
              }
            }
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v30, (uint64_t)v34, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }

    id v7 = v27;
    uint64_t v4 = v28;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  id v25 = v29;

  return v25;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  return 0;
}

- (BOOL)_addDataClassAndInstanceToMutableDictionary:(id)a3 dataClass:(id)a4 withError:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = (void *)AMFDRSealingMapCopyInstanceForClass();
  if (v10)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v7, v9, (uint64_t)v10, (uint64_t)v8);
  }
  else
  {
    id v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC65804();
    }
  }
  if (a5) {
    *a5 = 0;
  }

  return v10 != 0;
}

- (BOOL)_addDataClassAndInstancesToMutableArray:(id)a3 dataClasses:(id)a4 dataInstances:(id)a5 withError:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v15 = v11;
  if (!v10 || !v11 || (uint64_t v16 = objc_msgSend_count(v10, v12, v13, v14), v16 != objc_msgSend_count(v15, v17, v18, v19)))
  {
    v55 = objc_msgSend_stringWithFormat_(NSString, v12, @"Malformed dataClasses or dataInstances: %@ %@", v14, v10, v15);
    v42 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD6, v55, 0);

    uint64_t v21 = 0;
    v41 = 0;
    goto LABEL_16;
  }
  uint64_t v21 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v12, v20, v14);
  if (objc_msgSend_count(v10, v22, v23, v24))
  {
    unint64_t v27 = 0;
    do
    {
      v28 = objc_msgSend_objectAtIndexedSubscript_(v10, v25, v27, v26);
      int isEqual = objc_msgSend_isEqual_(v9, v29, (uint64_t)v28, v30);

      if (isEqual) {
        objc_msgSend_addIndex_(v21, v32, v27, v34);
      }
      ++v27;
    }
    while (objc_msgSend_count(v10, v32, v33, v34) > v27);
  }
  objc_msgSend_removeObjectsAtIndexes_(v10, v25, (uint64_t)v21, v26);
  objc_msgSend_removeObjectsAtIndexes_(v15, v35, (uint64_t)v21, v36);
  v37 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
  v41 = v37;
  v42 = 0;
  if (!v37)
  {
    v57 = handleForCategory(0);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      sub_21FC6587C();
    }

LABEL_16:
    BOOL v54 = 0;
    if (!a6) {
      goto LABEL_18;
    }
LABEL_17:
    *a6 = v42;
    goto LABEL_18;
  }
  if (objc_msgSend_count(v37, v38, v39, v40))
  {
    unint64_t v45 = 0;
    do
    {
      objc_msgSend_addObject_(v10, v43, (uint64_t)v9, v44);
      v48 = objc_msgSend_objectAtIndexedSubscript_(v41, v46, v45, v47);
      objc_msgSend_addObject_(v15, v49, (uint64_t)v48, v50);

      ++v45;
    }
    while (objc_msgSend_count(v41, v51, v52, v53) > v45);
  }
  v42 = 0;
  BOOL v54 = 1;
  if (a6) {
    goto LABEL_17;
  }
LABEL_18:

  return v54;
}

- (BOOL)_addPropertyToMutableDictionary:(id)a3 property:(id)a4 withError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v10 = a4;
  if (!qword_26AC133C8)
  {
    id v11 = 0;
    goto LABEL_10;
  }
  id v11 = objc_msgSend_objectForKeyedSubscript_((void *)qword_26AC133C8, v8, (uint64_t)v10, v9);
  if (!v11) {
    goto LABEL_10;
  }
  v12 = (void *)AMFDRSealingMapCallMGCopyAnswer();
  if (!v12) {
    goto LABEL_10;
  }
  uint64_t v13 = v12;
  CFTypeID v14 = CFGetTypeID(v12);
  if (v14 != CFDataGetTypeID())
  {
    CFRelease(v13);
LABEL_10:
    uint64_t v23 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08320];
    uint64_t v24 = objc_msgSend_stringWithFormat_(NSString, v8, @"Unable to fetch property:%@", v9, v10);
    uint64_t v30 = v24;
    uint64_t v26 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v25, (uint64_t)&v30, (uint64_t)&v29, 1);
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, @"com.apple.corerepair", -26, v26);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      id v21 = v21;
      BOOL v22 = 0;
      *a5 = v21;
    }
    else
    {
      BOOL v22 = 0;
    }
    goto LABEL_13;
  }
  uint64_t v18 = objc_msgSend_convertToHexString(v13, v15, v16, v17);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v18, (uint64_t)v10);

  uint64_t v20 = handleForCategory(0);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v7;
    _os_log_impl(&dword_21FBF2000, v20, OS_LOG_TYPE_DEFAULT, "copied property:%@", buf, 0xCu);
  }

  id v21 = 0;
  BOOL v22 = 1;
LABEL_13:

  return v22;
}

+ (BOOL)isFDRDataClassSupported:(id)a3
{
  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)a3, v3);
}

+ (BOOL)isFDRPropertySupported:(id)a3
{
  id v4 = a3;
  objc_msgSend_initSealingMap(a1, v5, v6, v7);
  id v11 = objc_msgSend_allKeys((void *)qword_26AC133C8, v8, v9, v10);
  char v14 = objc_msgSend_containsObject_(v11, v12, (uint64_t)v4, v13);

  return v14;
}

+ (BOOL)isFDRPrimaryDataClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  if (objc_msgSend_isFDRDataClassSupported_(a1, v6, @"tcrt", v7)) {
    objc_msgSend_addObject_(v5, v8, @"tcrt", v9);
  }
  else {
    objc_msgSend_addObject_(v5, v8, @"dCfg", v9);
  }
  if (objc_msgSend_isFDRDataClassSupported_(a1, v10, @"prpc", v11)) {
    objc_msgSend_addObject_(v5, v12, @"prpc", v13);
  }
  else {
    objc_msgSend_addObject_(v5, v12, @"PlCl", v13);
  }
  objc_msgSend_addObject_(v5, v14, @"CmCl", v15);
  objc_msgSend_addObject_(v5, v16, @"NBCl", v17);
  objc_msgSend_addObject_(v5, v18, @"MSRk", v19);
  objc_msgSend_addObject_(v5, v20, @"FSCl", v21);
  objc_msgSend_addObject_(v5, v22, @"LCfg", v23);
  objc_msgSend_addObject_(v5, v24, @"bcrt", v25);
  char v28 = objc_msgSend_containsObject_(v5, v26, (uint64_t)v4, v27);

  return v28;
}

+ (id)getRegisterChangeDictUsingComponentAuthName:(id)a3
{
  id v4 = objc_msgSend__getDataClassUsingComponentAuthName_(a1, a2, (uint64_t)a3, v3);
  uint64_t v5 = objc_opt_new();
  uint64_t v10 = 0;
  if (v4)
  {
    uint64_t v7 = (void *)AMFDRSealingMapCopyInstanceForClass();
    if (v7)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)v7, (uint64_t)v4);
    }
    else
    {
      id v8 = handleForCategory(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_21FC658E4((uint64_t)v4, &v10, v8);
      }
    }
  }

  return v5;
}

+ (id)_getDataClassUsingComponentAuthName:(id)a3
{
  id v3 = a3;
  uint64_t v6 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if (objc_msgSend_compare_(v3, v4, @"Battery", v5))
  {
    if (objc_msgSend_compare_(v6, v7, @"TouchController", v8))
    {
      if (objc_msgSend_compare_(v6, v9, @"Camera", v10))
      {
        if (objc_msgSend_compare_(v6, v11, @"FaceID", v12))
        {
          if (objc_msgSend_compare_(v6, v13, @"TouchID", v14))
          {
            if (objc_msgSend_compare_(v6, v15, @"BackGlass", v16))
            {
              if (objc_msgSend_compare_(v6, v17, @"Enclosure", v18))
              {
LABEL_9:
                uint64_t v21 = 0;
                goto LABEL_25;
              }
              uint64_t v21 = @"NBCl";
              int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v19, @"NBCl", v20);
            }
            else
            {
              uint64_t v21 = @"bCfg";
              if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v17, @"bCfg", v18))goto LABEL_25; {
              uint64_t v21 = @"LCfg";
              }
              int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v33, @"LCfg", v34);
            }
          }
          else
          {
            uint64_t v21 = @"FSCl";
            if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v15, @"FSCl", v16))goto LABEL_25; {
            uint64_t v21 = @"MSRk";
            }
            int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v31, @"MSRk", v32);
          }
        }
        else
        {
          uint64_t v21 = @"psd2";
          if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v13, @"psd2", v14))goto LABEL_25; {
          uint64_t v21 = @"prpc";
          }
          int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v29, @"prpc", v30);
        }
      }
      else
      {
        uint64_t v21 = @"CmCl";
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, @"CmCl", v12))goto LABEL_25; {
        uint64_t v21 = @"RCSn";
        }
        int isFDRDataClassSupported = objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v27, @"RCSn", v28);
      }
    }
    else
    {
      uint64_t v21 = @"tcrt";
      if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v9, @"tcrt", v10)) {
        goto LABEL_25;
      }
      uint64_t v21 = @"dCfg";
      int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v25, @"dCfg", v26);
    }
  }
  else
  {
    uint64_t v21 = @"vcrt";
    if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v7, @"vcrt", v8)) {
      goto LABEL_25;
    }
    uint64_t v21 = @"bcrt";
    int isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v22, @"bcrt", v23);
  }
  if (!isFDRDataClassSupported) {
    uint64_t v21 = 0;
  }
LABEL_25:

  return v21;
}

+ (id)copySealingManifestDataInstanceForComponent:(id)a3
{
  v25[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v7 = objc_msgSend__getDataClassUsingComponentAuthName_(a1, v5, (uint64_t)v4, v6, 0);
  uint64_t v10 = v7;
  if (!v7)
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC6596C();
    }
    goto LABEL_10;
  }
  if (objc_msgSend_compare_(v7, v8, @"RCSn", v9))
  {
    uint64_t v12 = (void *)AMFDRSealingManifestCopyInstanceForClass();
    if (!v12)
    {
LABEL_8:
      uint64_t v15 = handleForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_21FC659D4((uint64_t)&v23, v15, v16, v17, v18, v19, v20, v21);
      }
LABEL_10:

      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v24 = @"DataStore";
    v25[0] = @"Local";
    uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)v25, (uint64_t)&v24, 1);
    uint64_t v14 = AMFDRCreateWithOptions();
    uint64_t v12 = (void *)AMFDRSealingMapCopyPropertyWithTag();
    if (v14) {
      AMSupportSafeRelease();
    }

    if (!v12) {
      goto LABEL_8;
    }
  }
  AMSupportSafeRelease();

  return v12;
}

+ (id)getSealingMap
{
  return (id)MEMORY[0x270F91E70](a1, a2);
}

+ (id)getPropertyArrayFrom:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"ManifestProperties", v5);

    if (!v6)
    {
LABEL_9:
      uint64_t v32 = 0;
      goto LABEL_10;
    }
    uint64_t v7 = MGCopyAnswer();
    if (v7)
    {
      uint64_t v6 = (void *)v7;
      uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v3, v8, @"ManifestProperties", v9);
      uint64_t v13 = objc_msgSend_objectForKey_(v10, v11, (uint64_t)v6, v12);
      if (v13)
      {
        uint64_t v16 = (void *)v13;
        uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v3, v14, @"ManifestProperties", v15);
        uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v6, v19);
        uint64_t v23 = objc_msgSend_objectForKey_(v20, v21, @"Properties", v22);

        if (v23)
        {
          uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v3, v24, @"ManifestProperties", v25);
          uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v6, v28);
          uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v29, v30, @"Properties", v31);

          goto LABEL_10;
        }
      }
      else
      {
      }
      goto LABEL_9;
    }
    uint64_t v34 = handleForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_21FC65A78();
    }
  }
  else
  {
    uint64_t v34 = handleForCategory(0);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_21FC65A44();
    }
  }

  uint64_t v32 = 0;
  uint64_t v6 = 0;
LABEL_10:

  return v32;
}

- (id)getDataClassesAndInstancesOfKBBWith:(__AMFDR *)a3 propertiesDict:(id *)a4 fdrError:(id *)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)qword_267EF81A8;
  qword_267EF81A8 = 0;

  uint64_t v11 = objc_msgSend_KBBSerialNumber(self, v8, v9, v10);

  if (!v11)
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFDELL, @"No KBB Serial Number", 0);
    uint64_t v40 = 0;
    uint64_t v29 = 0;
LABEL_29:
    uint64_t v21 = 0;
    goto LABEL_30;
  }
  AMSupportLogSetHandler();
  uint64_t v15 = objc_msgSend_KBBSerialNumber(self, v12, v13, v14);
  uint64_t v16 = AMFDRCreatePermissionsString();

  if (!v16)
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"Unable to Create Persmission String for KBB sealingManifest copy", 0);
LABEL_28:
    uint64_t v40 = 0;
    uint64_t v29 = 0;
    goto LABEL_29;
  }
  AMFDRSetOption();
  AMFDRSetOption();
  if (!AMFDRPermissionsRequest())
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFADLL, @"Failed to request FDRSNMAP Permissions", 0);

    goto LABEL_28;
  }
  uint64_t v20 = objc_msgSend_KBBSerialNumber(self, v17, v18, v19);
  uint64_t v21 = (void *)AMFDRDataCopy();

  if (!v21)
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFDELL, @"Failed to copy FDRSNMAP of KBBSrNM", 0);

LABEL_40:
    uint64_t v40 = 0;
    uint64_t v29 = 0;
    goto LABEL_30;
  }
  if (!qword_267EF81A8)
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE6, @"Unable to extract SealHeader", 0);
    goto LABEL_40;
  }
  uint64_t v22 = handleForCategory(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = qword_267EF81A8;
    _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "SealHeader:(%@)", buf, 0xCu);
  }

  AMSupportLogSetHandler();
  uint64_t v23 = (void *)qword_267EF81A8;
  uint64_t v26 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F08708], v24, @":", v25);
  uint64_t v29 = objc_msgSend_componentsSeparatedByCharactersInSet_(v23, v27, (uint64_t)v26, v28);

  uint64_t v30 = handleForCategory(0);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = (uint64_t)v29;
    _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "sealHeaderArray:%@", buf, 0xCu);
  }

  if (!v29 || objc_msgSend_count(v29, v31, v32, v33) != 2)
  {
    v42 = (void *)v6;
    v55 = @"Unable to extract SealHeader";
    uint64_t v56 = -26;
LABEL_37:
    v57 = sub_21FC02E70((void *)v56, v55, 0);
LABEL_38:
    uint64_t v40 = 0;
    goto LABEL_30;
  }
  objc_msgSend_lastObject(v29, v34, v35, v36);
  if ((AMFDRDataAppendPermissionsString() & 1) == 0)
  {
    v42 = (void *)v6;
    v55 = @"Unable to Create Persmission String using KBBB sealheaders";
    uint64_t v56 = -84;
    goto LABEL_37;
  }
  AMFDRSetOption();
  if (!AMFDRPermissionsRequest())
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFADLL, @"Failed to request SEAL-SIK KBB Permissions", 0);

    goto LABEL_38;
  }
  objc_msgSend_lastObject(v29, v37, v38, v39);
  uint64_t v40 = (void *)AMFDRDataCopy();
  if (v40)
  {
    v41 = handleForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = (uint64_t)v40;
      _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "oldSealingManifest:%@", buf, 0xCu);
    }
    v42 = (void *)v6;

    objc_msgSend_setKbbSealingManifest_(self, v43, (uint64_t)v40, v44);
    uint64_t v47 = objc_msgSend_getSealDateFromSealingManifestData_(self, v45, (uint64_t)v40, v46);
    objc_msgSend_setKbbSealDate_(self, v48, (uint64_t)v47, v49);

    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      uint64_t v50 = handleForCategory(0);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = 0;
        _os_log_impl(&dword_21FBF2000, v50, OS_LOG_TYPE_DEFAULT, "old data classes:%@", buf, 0xCu);
      }

      v51 = handleForCategory(0);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = 0;
        _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "old data instances:%@", buf, 0xCu);
      }

      uint64_t v52 = handleForCategory(0);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = 0;
        _os_log_impl(&dword_21FBF2000, v52, OS_LOG_TYPE_DEFAULT, "old properties:%@", buf, 0xCu);
      }

      v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE6, @"DataInstances and Classes count mismatch", 0);
    }
    else
    {
      v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE6, @"old SealingManifestCopyDataClassesInstancesAndProperties failed", 0);
    }
  }
  else
  {
    v42 = (void *)v6;
    v57 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFDELL, @"AMFDRSealingMapCopyManifestProperties failed", 0);
  }
LABEL_30:
  AMFDRSetOption();
  if (a5) {
    *a5 = v57;
  }
  AMSupportSafeRelease();
  id v53 = v42;

  return v53;
}

- (id)getCurrentManifestDataClassesAndInstancesWithPartSPC:(id)a3 fdr:(__AMFDR *)a4 currentClasses:(id *)a5 currentInstances:(id *)a6 currentProperties:(id *)a7 fdrError:(id *)a8
{
  uint64_t v31 = 0;
  CFTypeRef cf = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  uint64_t v9 = objc_opt_new();
  if (AMFDRSealingMapPopulateSealingManifest())
  {
    uint64_t v10 = handleForCategory(0);
    uint64_t v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC65AAC(v11, v21, v22, v23, v24, v25, v26, v27);
    }

    uint64_t v19 = 0;
    if (!a8) {
      goto LABEL_10;
    }
LABEL_9:
    *a8 = v19;
    goto LABEL_10;
  }
  uint64_t v12 = handleForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_21FC65BEC((uint64_t)&v31, v12, v13, v14, v15, v16, v17, v18);
  }

  if (v31) {
    uint64_t v19 = v31;
  }
  else {
    uint64_t v19 = 0;
  }
  if (a8) {
    goto LABEL_9;
  }
LABEL_10:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }

  return v9;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "No update only data classes, skipping.", v6, 2u);
  }

  return 0;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  if (a7) {
    objc_storeStrong(a7, self->currentProperties);
  }
  return 1;
}

- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9
{
  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "Minimal manifests not supported.", v11, 2u);
  }

  return 1;
}

- (BOOL)supportMSRk
{
  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"MSRk", v2);
}

- (BOOL)supportHarvestPearl
{
  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, @"psd3", v2);
}

- (BOOL)supportCameraDepth
{
  return 0;
}

- (BOOL)supportMctubMinus
{
  return 0;
}

- (BOOL)supportPatch
{
  return 0;
}

- (id)getPatchInfoPerSPC
{
  return 0;
}

- (id)getExpectedPatchInfo:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_getPatchInfoPerSPC(self, v5, v6, v7);
  uint64_t v9 = objc_opt_new();
  if (v8)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v23 = v8;
    id v10 = v8;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v12)
    {
      uint64_t v15 = v12;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v10);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v4, v13, v18, v14, v23))
          {
            uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v10, v13, v18, v14);
            v24[0] = MEMORY[0x263EF8330];
            v24[1] = 3221225472;
            v24[2] = sub_21FC40E1C;
            v24[3] = &unk_26452AA60;
            id v25 = v9;
            objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v19, v20, (uint64_t)v24, v21);
          }
        }
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v26, (uint64_t)v30, 16);
      }
      while (v15);
    }

    uint64_t v8 = v23;
  }

  return v9;
}

- (BOOL)validatePatchWithPartSPC:(id)a3 originalClasses:(id)a4 originalInstances:(id)a5 originalValues:(id)a6 validClasses:(id)a7 validInstances:(id)a8
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v14 = a3;
  unint64_t v15 = (unint64_t)a4;
  unint64_t v16 = (unint64_t)a5;
  unint64_t v17 = (unint64_t)a6;
  id v18 = a7;
  id v19 = a8;
  if ((objc_msgSend_supportPatch(self, v20, v21, v22) & 1) == 0)
  {
    if (!(v15 | v16 | v17))
    {
      BOOL v102 = 1;
      goto LABEL_56;
    }
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC65EA4();
    }
LABEL_54:
    BOOL v102 = 0;
    goto LABEL_55;
  }
  if (!(v15 | v16 | v17))
  {
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "No patch info for validation, skipping.", buf, 2u);
    }
    BOOL v102 = 1;
    goto LABEL_55;
  }
  if (!v15 || !v16 || !v17)
  {
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC65E70();
    }
    goto LABEL_54;
  }
  uint64_t v26 = objc_msgSend_count((void *)v15, v23, v24, v25);
  if (v26 != objc_msgSend_count((void *)v16, v27, v28, v29))
  {
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC65E3C();
    }
    goto LABEL_54;
  }
  uint64_t v33 = objc_msgSend_count((void *)v15, v30, v31, v32);
  if (v33 != objc_msgSend_count((void *)v17, v34, v35, v36))
  {
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_21FC65E08();
    }
    goto LABEL_54;
  }
  v111 = v19;
  id v112 = v14;
  uint64_t v39 = objc_msgSend_getExpectedPatchInfo_(self, v37, (uint64_t)v14, v38);
  uint64_t v40 = handleForCategory(0);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    sub_21FC65D94();
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v41 = (id)v15;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v120, (uint64_t)v126, 16);
  id obj = v41;
  if (!v43) {
    goto LABEL_18;
  }
  uint64_t v46 = v43;
  uint64_t v47 = *(void *)v121;
  do
  {
    for (uint64_t i = 0; i != v46; ++i)
    {
      if (*(void *)v121 != v47) {
        objc_enumerationMutation(obj);
      }
      uint64_t v49 = objc_msgSend_objectForKey_(v39, v44, *(void *)(*((void *)&v120 + 1) + 8 * i), v45);

      if (!v49)
      {
        v104 = handleForCategory(0);
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
          sub_21FC65D2C();
        }

LABEL_63:
        BOOL v102 = 0;
LABEL_64:
        id v19 = v111;
        id v14 = v112;
        goto LABEL_55;
      }
    }
    id v41 = obj;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v120, (uint64_t)v126, 16);
  }
  while (v46);
LABEL_18:

  if (!objc_msgSend_count(v41, v50, v51, v52)) {
    goto LABEL_29;
  }
  uint64_t v56 = 0;
  do
  {
    uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v41, v53, v56, v55);
    uint64_t v107 = v56;
    uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_((void *)v17, v58, v56, v59);
    v109 = (void *)v57;
    v63 = objc_msgSend_objectForKeyedSubscript_(v39, v61, v57, v62);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    id v113 = v60;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v64, (uint64_t)&v116, (uint64_t)v125, 16);
    if (!v65) {
      goto LABEL_28;
    }
    uint64_t v68 = v65;
    uint64_t v69 = *(void *)v117;
    do
    {
      for (uint64_t j = 0; j != v68; ++j)
      {
        if (*(void *)v117 != v69) {
          objc_enumerationMutation(v113);
        }
        if ((objc_msgSend_containsObject_(v63, v66, *(void *)(*((void *)&v116 + 1) + 8 * j), v67) & 1) == 0)
        {
          v105 = handleForCategory(0);
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR)) {
            sub_21FC65CC4();
          }

          goto LABEL_63;
        }
      }
      uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v66, (uint64_t)&v116, (uint64_t)v125, 16);
    }
    while (v68);
LABEL_28:

    uint64_t v56 = v107 + 1;
    id v41 = obj;
  }
  while (objc_msgSend_count(obj, v71, v72, v73) > (unint64_t)(v107 + 1));
LABEL_29:
  if (!objc_msgSend_count(v41, v53, v54, v55))
  {
    BOOL v102 = 1;
    goto LABEL_64;
  }
  unint64_t v76 = 0;
  id v19 = v111;
LABEL_31:
  v77 = objc_msgSend_objectAtIndexedSubscript_(obj, v74, v76, v75);
  unint64_t v108 = v76;
  objc_msgSend_objectAtIndexedSubscript_((void *)v16, v78, v76, v79);
  id v114 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v18, v80, v81, v82))
  {
    unint64_t v85 = 0;
    v110 = v77;
    do
    {
      v86 = objc_msgSend_objectAtIndexedSubscript_(v18, v83, v85, v84);
      if (objc_msgSend_isEqual_(v77, v87, (uint64_t)v86, v88))
      {
        v91 = objc_msgSend_objectAtIndexedSubscript_(v111, v89, v85, v90);
        char isEqual = objc_msgSend_isEqual_(v114, v92, (uint64_t)v91, v93);

        v77 = v110;
        if (isEqual)
        {

          unint64_t v76 = v108 + 1;
          unint64_t v101 = objc_msgSend_count(obj, v98, v99, v100);
          BOOL v102 = 1;
          if (v101 <= v76) {
            goto LABEL_68;
          }
          goto LABEL_31;
        }
      }
      else
      {
      }
      ++v85;
    }
    while (objc_msgSend_count(v18, v95, v96, v97) > v85);
  }
  v106 = handleForCategory(0);
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
    sub_21FC65C5C();
  }

  BOOL v102 = 0;
LABEL_68:
  id v14 = v112;
LABEL_55:

LABEL_56:
  return v102;
}

- (BOOL)getPatchExpectedDataWithPartSPC:(id)a3 amfdr:(__AMFDR *)a4 expectedClasses:(id *)a5 expectedInstances:(id *)a6 expectedValues:(id *)a7 expectedDatas:(id *)a8 validClasses:(id)a9 validInstances:(id)a10 error:(id *)a11
{
  uint64_t v113 = *MEMORY[0x263EF8340];
  id v80 = a3;
  id v12 = a9;
  id v88 = a10;
  if ((objc_msgSend_supportPatch(self, v13, v14, v15) & 1) == 0)
  {
    v42 = handleForCategory(0);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, "Patch not supported, skipping.", buf, 2u);
    }
    char v70 = 1;
    goto LABEL_69;
  }
  BOOL v102 = 0;
  uint64_t v16 = objc_opt_new();
  id v86 = (id)objc_opt_new();
  id v85 = (id)objc_opt_new();
  uint64_t v17 = objc_opt_new();
  uint64_t v20 = (void *)v17;
  id obj = (id)v16;
  if (!v16 || !v86 || !v85 || !v17)
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC65F4C();
    }
    goto LABEL_74;
  }
  if (!v12 || !v88)
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC65ED8();
    }
LABEL_74:
    v71 = 0;
    uint64_t v26 = 0;
    char v70 = 0;
    goto LABEL_53;
  }
  objc_msgSend_getExpectedPatchInfo_(self, v18, (uint64_t)v80, v19);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  uint64_t v21 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v98, (uint64_t)v112, 16);
  uint64_t v26 = 0;
  if (!v78) {
    goto LABEL_52;
  }
  uint64_t v79 = *(void *)v99;
  id v82 = v12;
  v83 = v20;
  v87 = v21;
LABEL_10:
  uint64_t v27 = 0;
  while (1)
  {
    if (*(void *)v99 != v79) {
      objc_enumerationMutation(v21);
    }
    uint64_t v81 = v27;
    v91 = *(void **)(*((void *)&v98 + 1) + 8 * v27);
    if (objc_msgSend_count(v12, v23, v24, v25)) {
      break;
    }
LABEL_50:
    uint64_t v27 = v81 + 1;
    uint64_t v21 = v87;
    if (v81 + 1 == v78)
    {
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v23, (uint64_t)&v98, (uint64_t)v112, 16);
      if (!v78)
      {
LABEL_52:
        char v70 = 1;
        v71 = v21;
LABEL_53:

        uint64_t v72 = v71;
        v42 = v26;
        goto LABEL_58;
      }
      goto LABEL_10;
    }
  }
  uint64_t v28 = 0;
  while (1)
  {
    uint64_t v29 = objc_msgSend_objectAtIndexedSubscript_(v12, v23, v28, v25);
    int isEqual = objc_msgSend_isEqual_(v91, v30, (uint64_t)v29, v31);

    if (isEqual) {
      break;
    }
LABEL_39:
    if (objc_msgSend_count(v12, v33, v34, v35) <= (unint64_t)++v28) {
      goto LABEL_50;
    }
  }
  uint64_t v36 = (void *)MEMORY[0x223C5C2A0]();
  uint64_t v39 = objc_msgSend_objectAtIndexedSubscript_(v88, v37, v28, v38);
  uint64_t v40 = objc_opt_new();
  uint64_t v90 = (void *)v39;
  if (v40)
  {
    id v41 = AMFDRDataDictCopy();
    v42 = v102;

    if (!v41 || v42)
    {
      uint64_t v68 = handleForCategory(0);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v104 = (uint64_t)v42;
        _os_log_error_impl(&dword_21FBF2000, v68, OS_LOG_TYPE_ERROR, "AMFDRDataDictCopy failed with error: %@", buf, 0xCu);
      }

      int v67 = 4;
    }
    else
    {
      v89 = v36;
      uint64_t v45 = objc_msgSend_objectForKeyedSubscript_(v87, v43, (uint64_t)v91, v44);
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v92, (uint64_t)v111, 16);
      if (v47)
      {
        uint64_t v50 = v47;
        uint64_t v51 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v93 != v51) {
              objc_enumerationMutation(v45);
            }
            uint64_t v53 = *(void *)(*((void *)&v92 + 1) + 8 * i);
            uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v41, v48, v53, v49);
            if (v55)
            {
              objc_msgSend_setObject_forKey_(v40, v54, (uint64_t)v55, v53);
            }
            else
            {
              uint64_t v56 = handleForCategory(0);
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v104 = v53;
                _os_log_error_impl(&dword_21FBF2000, v56, OS_LOG_TYPE_ERROR, "Missing expect tag %@. Ignored.", buf, 0xCu);
              }
            }
          }
          uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v92, (uint64_t)v111, 16);
        }
        while (v50);
      }
      uint64_t v57 = handleForCategory(0);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        uint64_t v104 = (uint64_t)v91;
        __int16 v105 = 2112;
        v106 = v90;
        __int16 v107 = 2112;
        unint64_t v108 = v41;
        __int16 v109 = 2112;
        v110 = v40;
        _os_log_impl(&dword_21FBF2000, v57, OS_LOG_TYPE_DEFAULT, "%@-%@ dict: %@ result dict: %@", buf, 0x2Au);
      }

      uint64_t v60 = (void *)AMFDRDataCopy();
      v42 = v102;
      uint64_t v20 = v83;
      if (!v60 || v102)
      {
        uint64_t v69 = handleForCategory(0);
        id v12 = v82;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v104 = (uint64_t)v42;
          _os_log_error_impl(&dword_21FBF2000, v69, OS_LOG_TYPE_ERROR, "Failed to copy local data, error: %@", buf, 0xCu);
        }

        int v67 = 4;
      }
      else
      {
        objc_msgSend_addObject_(obj, v58, (uint64_t)v91, v59);
        objc_msgSend_addObject_(v86, v61, (uint64_t)v90, v62);
        objc_msgSend_addObject_(v85, v63, (uint64_t)v40, v64);
        objc_msgSend_addObject_(v83, v65, (uint64_t)v60, v66);
        int v67 = 0;
        id v12 = v82;
      }

      uint64_t v36 = v89;
    }
  }
  else
  {
    id v41 = handleForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_21FC65F0C(&v96, v97, v41);
    }
    int v67 = 4;
    v42 = v26;
  }

  if (!v67)
  {
    uint64_t v26 = v42;
    goto LABEL_39;
  }
  uint64_t v72 = v87;

  char v70 = 0;
LABEL_58:
  if (a11) {
    *a11 = v42;
  }
  if (a5) {
    objc_storeStrong(a5, obj);
  }
  if (a6) {
    objc_storeStrong(a6, v86);
  }
  if (a7) {
    objc_storeStrong(a7, v85);
  }
  if (a8) {
    objc_storeStrong(a8, v20);
  }

LABEL_69:
  return v70 & 1;
}

- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4
{
  id v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "No update properties, skipping.", v6, 2u);
  }

  return 0;
}

- (id)getExcludedPropertiesForFactoryReset
{
  uint64_t v2 = handleForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21FBF2000, v2, OS_LOG_TYPE_DEFAULT, "No excluded properties, skipping.", v4, 2u);
  }

  return 0;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v14 = a5;
  currentProperties = self->currentProperties;
  if (currentProperties)
  {
    uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(currentProperties, v12, @"SrNm", v13);
    uint64_t v17 = v16;
    if (v16 && (objc_msgSend_isEqualToString_(v16, v12, (uint64_t)v11, v13) & 1) != 0)
    {
      id v18 = 0;
      BOOL v19 = 1;
      if (!a6) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v12, @"Current serial number: %@ doesn't match SPC KGBSerialNumber: %@", v13, v17, v11);
  id v18 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFE5, v20, 0);

  BOOL v19 = 0;
  if (a6) {
LABEL_8:
  }
    *a6 = v18;
LABEL_9:

  return v19;
}

- (double)timeIntervalSinceLastSealing:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = (objc_class *)MEMORY[0x263F08790];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  objc_msgSend_setDateFormat_(v5, v6, @"yyMMddHHmmssZ", v7);
  id v10 = objc_msgSend_dateFromString_(v5, v8, (uint64_t)v4, v9);

  id v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    double v24 = *(double *)&v10;
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "Sealing date: %@", (uint8_t *)&v23, 0xCu);
  }

  id v12 = objc_opt_new();
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    double v24 = *(double *)&v12;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Current date: %@", (uint8_t *)&v23, 0xCu);
  }

  if (v10 && v12)
  {
    objc_msgSend_timeIntervalSinceDate_(v12, v14, (uint64_t)v10, v15);
    double v17 = v16;
    id v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 134217984;
      double v24 = v17;
      BOOL v19 = "time diff: %lf";
      uint64_t v20 = v18;
      uint32_t v21 = 12;
LABEL_11:
      _os_log_impl(&dword_21FBF2000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    }
  }
  else
  {
    id v18 = handleForCategory(0);
    double v17 = 0.0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      BOOL v19 = "Date information is missing";
      uint64_t v20 = v18;
      uint32_t v21 = 2;
      goto LABEL_11;
    }
  }

  return v17;
}

- (BOOL)validateSwappedForDays:(int64_t)a3 currentSN:(id)a4 previousSN:(id)a5 sealDate:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = handleForCategory(0);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    int64_t v29 = (int64_t)v10;
    _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Current SN: %@", (uint8_t *)&v28, 0xCu);
  }

  id v14 = handleForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138412290;
    int64_t v29 = (int64_t)v11;
    _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Previous SN: %@", (uint8_t *)&v28, 0xCu);
  }

  if (!v10)
  {
    uint64_t v22 = handleForCategory(0);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    LOWORD(v28) = 0;
    int v23 = "Missing current serial number.";
LABEL_17:
    double v24 = v22;
    uint32_t v25 = 2;
    goto LABEL_18;
  }
  if (!v11)
  {
    uint64_t v22 = handleForCategory(0);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    LOWORD(v28) = 0;
    int v23 = "Missing previous serial number.";
    goto LABEL_17;
  }
  if ((objc_msgSend_isEqual_(v10, v15, (uint64_t)v11, v16) & 1) == 0)
  {
    uint64_t v22 = handleForCategory(0);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    LOWORD(v28) = 0;
    int v23 = "SN are different. No check needed.";
    goto LABEL_17;
  }
  objc_msgSend_timeIntervalSinceLastSealing_(self, v17, (uint64_t)v12, v18);
  double v20 = v19;
  uint32_t v21 = handleForCategory(0);
  uint64_t v22 = v21;
  if (v20 <= (double)(86400 * a3))
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 134217984;
      int64_t v29 = a3;
      int v23 = "SN are same and last sealing date is within %ld days.";
      double v24 = v22;
      uint32_t v25 = 12;
LABEL_18:
      _os_log_impl(&dword_21FBF2000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v28, v25);
    }
LABEL_19:
    BOOL v26 = 1;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_21FC65F80();
  }
  BOOL v26 = 0;
LABEL_20:

  return v26;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  id v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Validate display swapped, unsupported.", v6, 2u);
  }

  return 0;
}

- (BOOL)storeWarningStrings:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_warnings(self, v5, v6, v7);
  objc_msgSend_addObject_(v8, v9, (uint64_t)v4, v10);

  return 1;
}

- (id)getSealDateFromSealingManifestData:(id)a3
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  id v4 = a3;
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, @"DataStore", @"Local");
  AMFDRCreateWithOptions();
  AMFDRDataDecodeAndSetSealingManifest();

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_21FC660B8();
  }

  return 0;
}

- (int64_t)performPostSealingStage:(id)a3
{
  CFAllocatorRef v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "performPostSealingStage, no-ops.", v5, 2u);
  }

  return 0;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v4 = handleForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21FBF2000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported, no-ops", v6, 2u);
  }

  return 0;
}

- (id)spcWithComponent:(id)a3
{
  CFAllocatorRef v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "Unsupported, no-ops", v5, 2u);
  }

  return 0;
}

- (BOOL)isServicePart
{
  return self->isServicePart;
}

- (void)setIsServicePart:(BOOL)a3
{
  self->isServicePart = a3;
}

- (BOOL)allowFactoryReset
{
  return self->allowFactoryReset;
}

- (void)setAllowFactoryReset:(BOOL)a3
{
  self->allowFactoryReset = a3;
}

- (BOOL)allowMissingData
{
  return self->allowMissingData;
}

- (void)setAllowMissingData:(BOOL)a3
{
  self->allowMissingData = a3;
}

- (NSDictionary)currentProperties
{
  return self->currentProperties;
}

- (void)setCurrentProperties:(id)a3
{
}

- (NSArray)currentDataClasses
{
  return self->currentDataClasses;
}

- (void)setCurrentDataClasses:(id)a3
{
}

- (NSArray)currentDataInstances
{
  return self->currentDataInstances;
}

- (void)setCurrentDataInstances:(id)a3
{
}

- (NSMutableArray)warnings
{
  return self->warnings;
}

- (void)setWarnings:(id)a3
{
}

- (NSString)sealDate
{
  return self->_sealDate;
}

- (void)setSealDate:(id)a3
{
}

- (NSString)kbbSealDate
{
  return self->_kbbSealDate;
}

- (void)setKbbSealDate:(id)a3
{
}

- (NSData)kbbSealingManifest
{
  return self->_kbbSealingManifest;
}

- (void)setKbbSealingManifest:(id)a3
{
}

- (NSString)previousCGSN
{
  return self->_previousCGSN;
}

- (void)setPreviousCGSN:(id)a3
{
}

- (NSString)kbbCGSN
{
  return self->_kbbCGSN;
}

- (void)setKbbCGSN:(id)a3
{
}

- (NSMutableDictionary)updateProperties
{
  return self->_updateProperties;
}

- (void)setUpdateProperties:(id)a3
{
}

- (NSString)KBBSerialNumber
{
  return self->_KBBSerialNumber;
}

- (void)setKBBSerialNumber:(id)a3
{
}

- (NSString)KGBSerialNumber
{
  return self->_KGBSerialNumber;
}

- (void)setKGBSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->_KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->_updateProperties, 0);
  objc_storeStrong((id *)&self->_kbbCGSN, 0);
  objc_storeStrong((id *)&self->_previousCGSN, 0);
  objc_storeStrong((id *)&self->_kbbSealingManifest, 0);
  objc_storeStrong((id *)&self->_kbbSealDate, 0);
  objc_storeStrong((id *)&self->_sealDate, 0);
  objc_storeStrong((id *)&self->warnings, 0);
  objc_storeStrong((id *)&self->currentDataInstances, 0);
  objc_storeStrong((id *)&self->currentDataClasses, 0);
  objc_storeStrong((id *)&self->currentProperties, 0);
}

@end