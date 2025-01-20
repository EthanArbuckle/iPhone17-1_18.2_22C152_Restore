@interface CRRepairHistory
- (BOOL)checkUsedStatusFor:(id)a3 withHistory:(id)a4 withClaimCount:(id)a5;
- (BOOL)deviceSupportsRepairBootIntent;
- (BOOL)hasHadRCHLBasedRepairForComponent:(id)a3 withHistory:(id)a4;
- (BOOL)isRCHLRepairHistoryDevice;
- (BOOL)isSelfServiceSalesDistrict:(id)a3;
- (BOOL)isSupportedIPad;
- (CRRepairHistory)init;
- (id)CAABasedRepairDateForComponent:(id)a3 withHistory:(id)a4;
- (id)RCHLBasedRepairDateForComponent:(id)a3 withHistory:(id)a4;
- (id)_getClaimCountEnforceDate;
- (id)extractRCHLRepairHistory;
- (id)extractRCHLRepairHistoryAndClaimCount:(id *)a3;
- (id)extractRepairCentersWithRCHLHistory:(id)a3;
- (id)extractRepairHistoryAsDictionary;
- (id)extractRepairsAfterACRZWithHistory:(id)a3;
- (id)getRCHLComponentWithType:(int)a3;
- (id)getUseCountExceptionsWith:(id)a3;
- (id)repairCenterForComponent:(id)a3 withRCHLHistory:(id)a4;
- (id)repairDateForComponent:(id)a3 withRCHLHistory:(id)a4 withCAAHistory:(id)a5;
@end

@implementation CRRepairHistory

- (CRRepairHistory)init
{
  v40[9] = *MEMORY[0x263EF8340];
  v38.receiver = self;
  v38.super_class = (Class)CRRepairHistory;
  v4 = [(CRRepairHistory *)&v38 init];
  if (v4)
  {
    v39[0] = @"Battery";
    v37 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v2, (uint64_t)&unk_26D1634A0, v3);
    v40[0] = v37;
    v39[1] = @"Display";
    v7 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v5, (uint64_t)&unk_26D1634B8, v6);
    v40[1] = v7;
    v39[2] = @"Camera";
    v10 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v8, (uint64_t)&unk_26D1634D0, v9);
    v40[2] = v10;
    v39[3] = @"FaceID";
    v13 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v11, (uint64_t)&unk_26D1634E8, v12);
    v40[3] = v13;
    v39[4] = @"Enclosure";
    v16 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v14, (uint64_t)&unk_26D163500, v15);
    v40[4] = v16;
    v39[5] = @"BackGlass";
    v19 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v17, (uint64_t)&unk_26D163518, v18);
    v40[5] = v19;
    v39[6] = @"MTUB";
    v22 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v20, (uint64_t)&unk_26D163530, v21);
    v40[6] = v22;
    v39[7] = @"TouchID";
    v25 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v23, (uint64_t)&unk_26D163548, v24);
    v40[7] = v25;
    v39[8] = @"System";
    v28 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v26, (uint64_t)&unk_26D163560, v27);
    v40[8] = v28;
    uint64_t v30 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v40, (uint64_t)v39, 9);
    repairHistoryMap = v4->repairHistoryMap;
    v4->repairHistoryMap = (NSDictionary *)v30;

    uint64_t v34 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v32, (uint64_t)&unk_26D163578, v33);
    useCountExceptionKeys = v4->useCountExceptionKeys;
    v4->useCountExceptionKeys = (NSSet *)v34;
  }
  return v4;
}

- (id)getRCHLComponentWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v13[8] = *MEMORY[0x263EF8340];
  v12[0] = &unk_26D163230;
  v12[1] = &unk_26D163248;
  v13[0] = @"Battery";
  v13[1] = @"Display";
  v12[2] = &unk_26D163260;
  v12[3] = &unk_26D163278;
  v13[2] = @"Camera";
  v13[3] = @"FaceID";
  v12[4] = &unk_26D163290;
  v12[5] = &unk_26D1632A8;
  v13[4] = @"TouchID";
  v13[5] = @"MTUB";
  v12[6] = &unk_26D1632C0;
  v12[7] = &unk_26D1632D8;
  v13[6] = @"BackGlass";
  v13[7] = @"Enclosure";
  v4 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v13, (uint64_t)v12, 8);
  v7 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v5, v3, v6);
  v10 = objc_msgSend_objectForKey_(v4, v8, (uint64_t)v7, v9);

  return v10;
}

- (BOOL)isSupportedIPad
{
  v2 = (void *)MGCopyAnswer();
  if (objc_msgSend_intValue(v2, v3, v4, v5) == 3)
  {
    uint64_t v6 = (void *)MGCopyAnswer();
    char v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isRCHLRepairHistoryDevice
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v3 = MGGetProductType();
  uint64_t v4 = (void *)MGCopyAnswer();
  int v8 = objc_msgSend_intValue(v4, v5, v6, v7);

  if (v8 == 1)
  {
    if ((objc_msgSend_isLegacyProductType_(CRFDRLegacyDeviceHandler, v9, v3, v11) & 1) == 0
      && (objc_msgSend_isGen1ProductType_(CRFDRGen1DeviceHandler, v42, v3, v43) & 1) == 0
      && (objc_msgSend_isGen2ProductType_(CRFDRGen2DeviceHandler, v44, v3, v45) & 1) == 0
      && (objc_msgSend_isGen3ProductType_(CRFDRGen3DeviceHandler, v46, v3, v47) & 1) == 0
      && (objc_msgSend_isGen4ProductType_(CRFDRGen4DeviceHandler, v48, v3, v49) & 1) == 0)
    {
LABEL_7:
      objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(self, v13, 0, v14);
      long long v98 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v98, (uint64_t)v105, 16);
      if (v17)
      {
        uint64_t v21 = v17;
        uint64_t v22 = *(void *)v99;
        obuint64_t j = v15;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v99 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void **)(*((void *)&v98 + 1) + 8 * i);
            v25 = objc_msgSend_dataClasses(v24, v18, v19, v20);
            if (objc_msgSend_containsObject_(v25, v26, @"FFFF", v27)) {
              goto LABEL_29;
            }
            v31 = objc_msgSend_properties(v24, v28, v29, v30);
            if (objc_msgSend_containsObject_(v31, v32, @"FFFF", v33))
            {

LABEL_29:
LABEL_30:
              uint64_t v15 = obj;
              v50 = objc_msgSend_extractRepairsAfterACRZWithHistory_(self, v18, (uint64_t)obj, v20);
              v51 = handleForCategory(0);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v104 = v50;
                _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "post Repair keys:%@", buf, 0xCu);
              }

              if (v50 && objc_msgSend_count(v50, v52, v53, v54))
              {
                v55 = objc_opt_new();
                v59 = objc_msgSend__populateSealingMapProperties(CRFDRBaseDeviceHandler, v56, v57, v58);
                v63 = objc_msgSend__populateSealingMapForCurrentDevice(CRFDRBaseDeviceHandler, v60, v61, v62);
                v66 = objc_msgSend_setWithSet_(MEMORY[0x263EFF9C0], v64, (uint64_t)v63, v65);
                v92 = v59;
                v70 = objc_msgSend_allKeys(v59, v67, v68, v69);
                objc_msgSend_addObjectsFromArray_(v66, v71, (uint64_t)v70, v72);

                long long v96 = 0u;
                long long v97 = 0u;
                long long v94 = 0u;
                long long v95 = 0u;
                v73 = self->repairHistoryMap;
                uint64_t v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v94, (uint64_t)v102, 16);
                if (v75)
                {
                  uint64_t v78 = v75;
                  uint64_t v79 = *(void *)v95;
                  do
                  {
                    for (uint64_t j = 0; j != v78; ++j)
                    {
                      if (*(void *)v95 != v79) {
                        objc_enumerationMutation(v73);
                      }
                      v81 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v76, *(void *)(*((void *)&v94 + 1) + 8 * j), v77);
                      objc_msgSend_unionSet_(v55, v82, (uint64_t)v81, v83);
                    }
                    uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v94, (uint64_t)v102, 16);
                  }
                  while (v78);
                }

                objc_msgSend_intersectSet_(v55, v84, (uint64_t)v66, v85);
                v86 = handleForCategory(0);
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v104 = v55;
                  _os_log_impl(&dword_21FBF2000, v86, OS_LOG_TYPE_DEFAULT, "Intersection keys:%@", buf, 0xCu);
                }

                int isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v55, v87, (uint64_t)v50, v88);
                v89 = handleForCategory(0);
                v90 = v89;
                uint64_t v15 = obj;
                if (isSubsetOfSet)
                {
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21FBF2000, v90, OS_LOG_TYPE_DEFAULT, "Device RCHL is valid after ACRZ", buf, 2u);
                  }
                }
                else if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  sub_21FC60C3C(v90);
                }
              }
              else
              {
                v55 = handleForCategory(0);
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21FBF2000, v55, OS_LOG_TYPE_DEFAULT, "No Repairs post ACRZ", buf, 2u);
                }
                LOBYTE(isSubsetOfSet) = 0;
              }

              goto LABEL_53;
            }
            v37 = objc_msgSend_repairCenter(v24, v34, v35, v36);
            char isEqualToString = objc_msgSend_isEqualToString_(v37, v38, @"ACRZ", v39);

            if (isEqualToString) {
              goto LABEL_30;
            }
          }
          uint64_t v15 = obj;
          uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v98, (uint64_t)v105, 16);
          LOBYTE(isSubsetOfSet) = 1;
          if (v21) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(isSubsetOfSet) = 1;
      }
LABEL_53:

      goto LABEL_54;
    }
  }
  else
  {
    if (v8 != 3)
    {
      uint64_t v15 = handleForCategory(0);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_21FC60BB4(v8, v3, v15);
      }
      LOBYTE(isSubsetOfSet) = 0;
LABEL_54:

      return isSubsetOfSet;
    }
    if (objc_msgSend_isSupportedIPad(self, v9, v10, v11))
    {
      uint64_t v12 = handleForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "Supported iPad", buf, 2u);
      }

      goto LABEL_7;
    }
  }
  LOBYTE(isSubsetOfSet) = 0;
  return isSubsetOfSet;
}

- (id)extractRepairsAfterACRZWithHistory:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v43 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = v3;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_dataClasses(v13, v7, v8, v9);
        if ((objc_msgSend_containsObject_(v14, v15, @"FFFF", v16) & 1) == 0)
        {
          uint64_t v20 = objc_msgSend_properties(v13, v17, v18, v19);
          if (objc_msgSend_containsObject_(v20, v21, @"FFFF", v22))
          {
          }
          else
          {
            v26 = objc_msgSend_repairCenter(v13, v23, v24, v25);
            char isEqualToString = objc_msgSend_isEqualToString_(v26, v27, @"ACRZ", v28);

            if (isEqualToString) {
              continue;
            }
            uint64_t v30 = objc_msgSend_dataClasses(v13, v7, v8, v9);
            objc_msgSend_unionSet_(v43, v31, (uint64_t)v30, v32);

            uint64_t v14 = objc_msgSend_properties(v13, v33, v34, v35);
            objc_msgSend_unionSet_(v43, v36, (uint64_t)v14, v37);
          }
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v10);
  }

  v41 = objc_msgSend_copy(v43, v38, v39, v40);
  return v41;
}

- (BOOL)hasHadRCHLBasedRepairForComponent:(id)a3 withHistory:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v38 = v9;
    obuint64_t j = v9;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v17 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend_dataClasses(v19, v13, v14, v15, v38);
          v23 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v21, (uint64_t)v6, v22);
          if (objc_msgSend_intersectsSet_(v20, v24, (uint64_t)v23, v25))
          {

LABEL_16:
            BOOL v36 = 1;
            goto LABEL_17;
          }
          uint64_t v29 = objc_msgSend_properties(v19, v26, v27, v28);
          uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v30, (uint64_t)v6, v31);
          char v35 = objc_msgSend_intersectsSet_(v29, v33, (uint64_t)v32, v34);

          if (v35) {
            goto LABEL_16;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        BOOL v36 = 0;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v36 = 0;
    }
LABEL_17:

    id v9 = v38;
  }
  else
  {
    BOOL v36 = 0;
  }

  return v36;
}

- (id)RCHLBasedRepairDateForComponent:(id)a3 withHistory:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v37 = v9;
    obuint64_t j = v9;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v39 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_dataClasses(v18, v13, v14, v15);
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v20, (uint64_t)v6, v21);
          if (objc_msgSend_intersectsSet_(v19, v23, (uint64_t)v22, v24))
          {

LABEL_16:
            char v35 = objc_msgSend_repairDateStr(v18, v13, v14, v15);
            goto LABEL_17;
          }
          uint64_t v28 = objc_msgSend_properties(v18, v25, v26, v27);
          uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v29, (uint64_t)v6, v30);
          int v34 = objc_msgSend_intersectsSet_(v28, v32, (uint64_t)v31, v33);

          if (v34) {
            goto LABEL_16;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        char v35 = 0;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v35 = 0;
    }
LABEL_17:

    id v9 = v37;
  }
  else
  {
    char v35 = 0;
  }

  return v35;
}

- (id)CAABasedRepairDateForComponent:(id)a3 withHistory:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v9 = a4;
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8);
  uint64_t v14 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_15;
  }
  uint64_t v15 = objc_msgSend_count(v9, v11, v12, v13);

  if (!v15)
  {
LABEL_15:
    uint64_t v22 = 0;
    goto LABEL_16;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v16, (uint64_t)v6, v17, 0);
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v22)
  {
    uint64_t v23 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v22; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v18);
        }
        uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v9, v20, v25, v21);

        if (v26)
        {
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v9, v20, v25, v21);
          goto LABEL_20;
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v28, (uint64_t)v32, 16);
      if (v22) {
        continue;
      }
      break;
    }
  }
LABEL_20:

LABEL_16:
  return v22;
}

- (id)extractRCHLRepairHistoryAndClaimCount:(id *)a3
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  uint64_t v190 = 0;
  v191 = 0;
  uint64_t v188 = 0;
  uint64_t v189 = 0;
  unint64_t v186 = 0;
  uint64_t v187 = 0;
  v185[0] = 0;
  v185[1] = 0;
  v184[0] = 0;
  v184[1] = 0;
  v183[0] = 0;
  v183[1] = 0;
  v182[0] = 0;
  v182[1] = 0;
  id v169 = (id)objc_opt_new();
  id v3 = objc_alloc_init(MEMORY[0x263F08790]);
  id v4 = objc_alloc(MEMORY[0x263EFF960]);
  uint64_t v7 = objc_msgSend_initWithLocaleIdentifier_(v4, v5, @"en_US_POSIX", v6);
  objc_msgSend_setLocale_(v3, v8, (uint64_t)v7, v9);

  uint64_t v12 = objc_msgSend_timeZoneWithName_(MEMORY[0x263EFFA18], v10, @"GMT", v11);
  objc_msgSend_setTimeZone_(v3, v13, (uint64_t)v12, v14);

  v174 = v3;
  objc_msgSend_setDateFormat_(v3, v15, @"yyyyMMddHHmmssZ", v16);
  uint64_t v17 = objc_opt_new();
  id v18 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v22 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v19, v20, v21);
  objc_msgSend_setLocale_(v18, v23, (uint64_t)v22, v24);

  long long v28 = objc_msgSend_localTimeZone(MEMORY[0x263EFFA18], v25, v26, v27);
  objc_msgSend_setTimeZone_(v18, v29, (uint64_t)v28, v30);

  objc_msgSend_setDateStyle_(v18, v31, 3, v32);
  objc_msgSend_setTimeStyle_(v18, v33, 0, v34);
  v173 = v18;
  objc_msgSend_setFormattingContext_(v18, v35, 5, v36);
  uint64_t v39 = objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x263F089C0], v37, @"#", v38);
  long long v43 = objc_msgSend_alphanumericCharacterSet(MEMORY[0x263F08708], v40, v41, v42);
  objc_msgSend_formUnionWithCharacterSet_(v39, v44, (uint64_t)v43, v45);

  v167 = v39;
  v172 = objc_msgSend_invertedSet(v39, v46, v47, v48);
  uint64_t v52 = objc_msgSend_getLocalSealingManifest(CRFDRUtils, v49, v50, v51);
  uint64_t v165 = AMFDRCreateTypeWithOptions();
  v166 = (void *)v52;
  if (!v165)
  {
    v70 = handleForCategory(0);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_21FC60C80(v70);
    }

    v71 = 0;
    uint64_t v72 = 0;
    v73 = 0;
    v74 = 0;
    uint64_t v75 = 0;
    v177 = 0;
    v170 = 0;
    v76 = 0;
    uint64_t v77 = a3;
    if (a3) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  AMFDRSetOption();
  AMFDRDataCopySealingManifestProperty();
  uint64_t v53 = handleForCategory(0);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    v56 = objc_msgSend_base64EncodedStringWithOptions_(v191, v54, 0, v55);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v56;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = objc_msgSend_length(v191, v57, v58, v59);
    _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "fetched RCHL successfully: %{public}@ length = %{public}ld", buf, 0x16u);
  }
  v60 = v191;
  uint64_t v189 = objc_msgSend_bytes(v60, v61, v62, v63);
  v164 = v60;
  uint64_t v190 = objc_msgSend_length(v60, v64, v65, v66);
  if (sub_21FC53678((unint64_t *)&v189, v185)) {
    goto LABEL_15;
  }
  if (sub_21FC536A4(v185, &v186)) {
    goto LABEL_15;
  }
  uint64_t v189 = v187;
  uint64_t v190 = v188;
  sub_21FC53678((unint64_t *)&v189, v185);
  while (!sub_21FC536A4(v185, &v186))
  {
    uint64_t v189 = v187;
    uint64_t v190 = v188;
  }
  if (sub_21FC53678((unint64_t *)&v189, v185) || sub_21FC536A4(v185, &v186))
  {
LABEL_15:
    v71 = 0;
    uint64_t v72 = 0;
    v73 = 0;
    v74 = 0;
    uint64_t v75 = 0;
    v177 = 0;
    v170 = 0;
    goto LABEL_16;
  }
  v170 = 0;
  v177 = 0;
  uint64_t v75 = 0;
  v74 = 0;
  v73 = 0;
  uint64_t v72 = 0;
  uint64_t v79 = 0;
  v171 = v17;
  do
  {
    uint64_t v189 = v187;
    uint64_t v190 = v188;
    if (!sub_21FC53678((unint64_t *)&v189, v183))
    {
      while (1)
      {
        if (sub_21FC536A4(v183, &v186)) {
          goto LABEL_91;
        }
        uint64_t v189 = v187;
        uint64_t v190 = v188;
        id v80 = objc_alloc(MEMORY[0x263EFF8F8]);
        v82 = objc_msgSend_initWithBytes_length_(v80, v81, v187, v188);
        if (v186 == 22)
        {
          uint64_t v83 = v79;
          id v84 = [NSString alloc];
          uint64_t v86 = objc_msgSend_initWithData_encoding_(v84, v85, (uint64_t)v82, 1);

          v87 = handleForCategory(0);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v86;
            _os_log_impl(&dword_21FBF2000, v87, OS_LOG_TYPE_DEFAULT, "repairCenter str:%@", buf, 0xCu);
          }

          v170 = (void *)v86;
          uint64_t v79 = v83;
        }
        if (!sub_21FC536A4(v183, &v186)) {
          break;
        }
LABEL_89:
      }
      v178 = v82;
      while (1)
      {
        uint64_t v189 = v187;
        uint64_t v190 = v188;

        if (!sub_21FC53678((unint64_t *)&v189, v184)) {
          break;
        }
        uint64_t v79 = 0;
        uint64_t v72 = 0;
        uint64_t v75 = 0;
        v177 = 0;
LABEL_88:
        if (sub_21FC536A4(v183, &v186)) {
          goto LABEL_89;
        }
      }
      if (sub_21FC536A4(v184, &v186))
      {
        v175 = 0;
        v176 = 0;
        uint64_t v75 = 0;
        v177 = 0;
LABEL_83:
        uint64_t v72 = v176;
        uint64_t v79 = v175;
        if (objc_msgSend_count(v176, v88, v89, v90) || objc_msgSend_count(v175, v156, v157, v158))
        {
          v159 = [CRFDRRCHL alloc];
          inited = objc_msgSend_initWithrepairDateStr_repairDate_repairCenter_dataClasses_properties_(v159, v160, (uint64_t)v177, (uint64_t)v75, v170, v176, v175);
          if (inited) {
            objc_msgSend_addObject_(v169, v161, (uint64_t)inited, v162);
          }

          uint64_t v79 = v175;
          uint64_t v72 = v176;
        }
        goto LABEL_88;
      }
      v177 = 0;
      uint64_t v75 = 0;
      v175 = 0;
      v176 = 0;
      unint64_t v91 = 0x263EFF000uLL;
      while (1)
      {
        uint64_t v189 = v187;
        uint64_t v190 = v188;
        id v92 = objc_alloc(*(Class *)(v91 + 2296));
        long long v94 = objc_msgSend_initWithBytes_length_(v92, v93, v187, v188);
        long long v95 = handleForCategory(0);
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v186;
          _os_log_impl(&dword_21FBF2000, v95, OS_LOG_TYPE_DEFAULT, "tag is:%llu", buf, 0xCu);
        }

        if (v186 > 1u)
        {
          if (v186 == 2)
          {
            if (!sub_21FC53678((unint64_t *)&v189, v182))
            {
              do
              {
LABEL_77:
                if (sub_21FC536A4(v182, &v186)) {
                  goto LABEL_78;
                }
                v181[0] = v187;
                v181[1] = v188;
                v180[0] = 0;
                v180[1] = 0;
                memset(buf, 0, sizeof(buf));
                unsigned int v179 = 0;
              }
              while (sub_21FC53678(v181, v180)
                   || sub_21FC536A4(v180, (unint64_t *)buf));
              v142 = 0;
              while (2)
              {
                if (buf[0] != 2)
                {
                  if (buf[0] == 4)
                  {
                    id v143 = objc_alloc(*(Class *)(v91 + 2296));
                    v145 = objc_msgSend_initWithBytes_length_(v143, v144, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16]);
                    id v146 = [NSString alloc];
                    uint64_t v148 = objc_msgSend_initWithData_encoding_(v146, v147, (uint64_t)v145, 1);

                    v149 = handleForCategory(0);
                    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v192 = 138412290;
                      uint64_t v193 = v148;
                      _os_log_impl(&dword_21FBF2000, v149, OS_LOG_TYPE_DEFAULT, "claimDataClass str:%@", v192, 0xCu);
                    }

                    v142 = (void *)v148;
                    v82 = v178;
LABEL_69:
                  }
                  if (v179) {
                    BOOL v153 = v142 == 0;
                  }
                  else {
                    BOOL v153 = 1;
                  }
                  if (!v153)
                  {
                    v154 = objc_msgSend_numberWithInt_(NSNumber, v140, v179, v141);
                    objc_msgSend_setObject_forKeyedSubscript_(v17, v155, (uint64_t)v154, (uint64_t)v142);
                  }
                  if (sub_21FC536A4(v180, (unint64_t *)buf))
                  {

                    goto LABEL_77;
                  }
                  continue;
                }
                break;
              }
              id v150 = objc_alloc(*(Class *)(v91 + 2296));
              v145 = objc_msgSend_initWithBytes_length_(v150, v151, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16]);
              objc_msgSend_getBytes_length_(v145, v152, (uint64_t)&v179, 4);
              goto LABEL_69;
            }
LABEL_78:
            long long v100 = handleForCategory(0);
            if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v17;
              _os_log_impl(&dword_21FBF2000, v100, OS_LOG_TYPE_DEFAULT, "claim count:%@", buf, 0xCu);
            }
            uint64_t v115 = (uint64_t)v75;
            goto LABEL_81;
          }
          if (v186 == 24)
          {
            id v116 = [NSString alloc];
            long long v100 = objc_msgSend_initWithData_encoding_(v116, v117, (uint64_t)v94, 1);

            v118 = handleForCategory(0);
            if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v100;
              _os_log_impl(&dword_21FBF2000, v118, OS_LOG_TYPE_DEFAULT, "generalizedTime str:%@", buf, 0xCu);
            }

            uint64_t v115 = objc_msgSend_dateFromString_(v174, v119, (uint64_t)v100, v120);

            v121 = handleForCategory(0);
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v115;
              _os_log_impl(&dword_21FBF2000, v121, OS_LOG_TYPE_DEFAULT, "date is:%@", buf, 0xCu);
            }

            v177 = objc_msgSend_stringFromDate_(v173, v122, v115, v123);
            unint64_t v91 = 0x263EFF000;
            goto LABEL_81;
          }
        }
        else
        {
          if ((_BYTE)v186)
          {
            if (v186 != 1 || sub_21FC53358((uint64_t)&v189, &v186)) {
              goto LABEL_82;
            }
            unint64_t v96 = v91;
            long long v97 = v73;
            id v98 = objc_alloc(*(Class *)(v96 + 2296));
            long long v100 = objc_msgSend_initWithBytes_length_(v98, v99, v187, v188);
            id v101 = [NSString alloc];
            v103 = objc_msgSend_initWithData_encoding_(v101, v102, (uint64_t)v100, 1);

            v104 = (void *)MEMORY[0x263EFFA08];
            v107 = objc_msgSend_stringByTrimmingCharactersInSet_(v103, v105, (uint64_t)v172, v106);
            v110 = objc_msgSend_componentsSeparatedByString_(v107, v108, @",", v109);
            uint64_t v113 = objc_msgSend_setWithArray_(v104, v111, (uint64_t)v110, v112);

            v114 = handleForCategory(0);
            if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v113;
              _os_log_impl(&dword_21FBF2000, v114, OS_LOG_TYPE_DEFAULT, "dataClasses str:%@", buf, 0xCu);
            }

            v176 = (void *)v113;
            v74 = v103;
            uint64_t v115 = (uint64_t)v75;
            uint64_t v17 = v171;
            v73 = v97;
            unint64_t v91 = 0x263EFF000;
LABEL_57:
            v82 = v178;
LABEL_81:

            uint64_t v75 = (void *)v115;
            goto LABEL_82;
          }
          if (!sub_21FC53358((uint64_t)&v189, &v186))
          {
            id v124 = objc_alloc(*(Class *)(v91 + 2296));
            long long v100 = objc_msgSend_initWithBytes_length_(v124, v125, v187, v188);
            id v126 = [NSString alloc];
            v128 = objc_msgSend_initWithData_encoding_(v126, v127, (uint64_t)v100, 1);

            v129 = (void *)MEMORY[0x263EFFA08];
            v132 = objc_msgSend_stringByTrimmingCharactersInSet_(v128, v130, (uint64_t)v172, v131);
            v135 = objc_msgSend_componentsSeparatedByString_(v132, v133, @",", v134);
            uint64_t v138 = objc_msgSend_setWithArray_(v129, v136, (uint64_t)v135, v137);

            v139 = handleForCategory(0);
            if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v138;
              _os_log_impl(&dword_21FBF2000, v139, OS_LOG_TYPE_DEFAULT, "properties str:%@", buf, 0xCu);
            }

            v175 = (void *)v138;
            v73 = v128;
            uint64_t v115 = (uint64_t)v75;
            uint64_t v17 = v171;
            goto LABEL_57;
          }
        }
LABEL_82:

        if (sub_21FC536A4(v184, &v186)) {
          goto LABEL_83;
        }
      }
    }
LABEL_91:
    ;
  }
  while (!sub_21FC536A4(v185, &v186));
  v71 = v79;
LABEL_16:
  uint64_t v77 = a3;
  v76 = v164;
  if (a3) {
LABEL_17:
  }
    *uint64_t v77 = (id)objc_msgSend_copy(v17, v67, v68, v69);
LABEL_18:
  if (v165) {
    AMSupportSafeRelease();
  }

  return v169;
}

- (id)extractRCHLRepairHistory
{
  return (id)objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(self, a2, 0, v2);
}

- (id)extractRepairHistoryAsDictionary
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = objc_opt_new();
  id v87 = 0;
  uint64_t v7 = objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v4, v5, (uint64_t)&v87, v6);
  id v8 = v87;

  uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v9, v10, v11);
  uint64_t v16 = v12;
  v73 = v12;
  v74 = v8;
  if (v8)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, @"claimCount");
  }
  else
  {
    uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v13, v14, v15);
    objc_msgSend_setObject_forKeyedSubscript_(v16, v21, (uint64_t)v20, @"claimCount");
  }
  id v80 = objc_msgSend_array(MEMORY[0x263EFF980], v17, v18, v19);
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obuint64_t j = v7;
  uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v81)
  {
    uint64_t v79 = *(void *)v84;
    do
    {
      for (uint64_t i = 0; i != v81; ++i)
      {
        if (*(void *)v84 != v79) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        v88[0] = @"dataclasses";
        long long v28 = objc_msgSend_dataClasses(v27, v23, v24, v25);
        char v35 = objc_msgSend_allObjects(v28, v29, v30, v31);
        uint64_t v36 = v35;
        if (!v35)
        {
          uint64_t v78 = objc_msgSend_null(MEMORY[0x263EFF9D0], v32, v33, v34);
          uint64_t v36 = v78;
        }
        v89[0] = v36;
        v88[1] = @"properties";
        id v37 = objc_msgSend_properties(v27, v32, v33, v34);
        long long v44 = objc_msgSend_allObjects(v37, v38, v39, v40);
        uint64_t v45 = v44;
        if (!v44)
        {
          uint64_t v77 = objc_msgSend_null(MEMORY[0x263EFF9D0], v41, v42, v43);
          uint64_t v45 = v77;
        }
        v89[1] = v45;
        v88[2] = @"repairDate";
        uint64_t v49 = objc_msgSend_repairDate(v27, v41, v42, v43);
        if (v49)
        {
          uint64_t v50 = NSString;
          uint64_t v3 = objc_msgSend_repairDate(v27, v46, v47, v48);
          uint64_t v53 = objc_msgSend_stringWithFormat_(v50, v51, @"%@", v52, v3);
          v82 = (void *)v53;
        }
        else
        {
          uint64_t v53 = objc_msgSend_null(MEMORY[0x263EFF9D0], v46, v47, v48);
          uint64_t v2 = (void *)v53;
        }
        v89[2] = v53;
        v88[3] = @"repairCenter";
        v60 = objc_msgSend_repairCenter(v27, v54, v55, v56);
        uint64_t v61 = v60;
        if (!v60)
        {
          v76 = objc_msgSend_null(MEMORY[0x263EFF9D0], v57, v58, v59);
          uint64_t v61 = v76;
        }
        v89[3] = v61;
        uint64_t v62 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v89, (uint64_t)v88, 4);
        objc_msgSend_addObject_(v80, v63, (uint64_t)v62, v64);

        if (!v60) {
        uint64_t v65 = v2;
        }
        if (v49)
        {

          uint64_t v65 = (void *)v3;
        }

        if (!v44) {
        if (!v35)
        }
      }
      uint64_t v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v83, (uint64_t)v90, 16);
    }
    while (v81);
  }

  if (v80)
  {
    uint64_t v69 = v73;
    objc_msgSend_setObject_forKeyedSubscript_(v73, v66, (uint64_t)v80, @"changedData");
  }
  else
  {
    v70 = objc_msgSend_null(MEMORY[0x263EFF9D0], v66, v67, v68);
    uint64_t v69 = v73;
    objc_msgSend_setObject_forKeyedSubscript_(v73, v71, (uint64_t)v70, @"changedData");
  }
  return v69;
}

- (id)repairDateForComponent:(id)a3 withRCHLHistory:(id)a4 withCAAHistory:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if (objc_msgSend_isRCHLRepairHistoryDevice(self, v11, v12, v13)) {
    objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(self, v14, (uint64_t)v10, (uint64_t)v8);
  }
  else {
  uint64_t v15 = objc_msgSend_CAABasedRepairDateForComponent_withHistory_(self, v14, (uint64_t)v10, (uint64_t)v9);
  }

  return v15;
}

- (id)repairCenterForComponent:(id)a3 withRCHLHistory:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v37 = v9;
    obuint64_t j = v9;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      uint64_t v16 = v12;
      uint64_t v39 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v41 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_dataClasses(v18, v13, v14, v15);
          uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v20, (uint64_t)v6, v21);
          if (objc_msgSend_intersectsSet_(v19, v23, (uint64_t)v22, v24))
          {

LABEL_16:
            char v35 = objc_msgSend_repairCenter(v18, v13, v14, v15);
            goto LABEL_17;
          }
          long long v28 = objc_msgSend_properties(v18, v25, v26, v27);
          uint64_t v31 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v29, (uint64_t)v6, v30);
          int v34 = objc_msgSend_intersectsSet_(v28, v32, (uint64_t)v31, v33);

          if (v34) {
            goto LABEL_16;
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        char v35 = 0;
        if (v16) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v35 = 0;
    }
LABEL_17:

    id v9 = v37;
  }
  else
  {
    char v35 = 0;
  }

  return v35;
}

- (id)extractRepairCentersWithRCHLHistory:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v4, v5, v6);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = v3;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v54, (uint64_t)v60, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v45 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v16 = objc_msgSend_dataClasses(v15, v10, v11, v12);
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, (uint64_t)v59, 16);
        if (v18)
        {
          uint64_t v22 = v18;
          uint64_t v23 = *(void *)v51;
          do
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v51 != v23) {
                objc_enumerationMutation(v16);
              }
              uint64_t v25 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              uint64_t v26 = objc_msgSend_repairCenter(v15, v19, v20, v21);
              objc_msgSend_setObject_forKeyedSubscript_(v7, v27, (uint64_t)v26, v25);
            }
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, (uint64_t)v59, 16);
          }
          while (v22);
        }

        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v31 = objc_msgSend_properties(v15, v28, v29, v30);
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v46, (uint64_t)v58, 16);
        if (v33)
        {
          uint64_t v37 = v33;
          uint64_t v38 = *(void *)v47;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v47 != v38) {
                objc_enumerationMutation(v31);
              }
              uint64_t v40 = *(void *)(*((void *)&v46 + 1) + 8 * k);
              long long v41 = objc_msgSend_repairCenter(v15, v34, v35, v36);
              objc_msgSend_setObject_forKeyedSubscript_(v7, v42, (uint64_t)v41, v40);
            }
            uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v46, (uint64_t)v58, 16);
          }
          while (v37);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v54, (uint64_t)v60, 16);
    }
    while (v13);
  }

  return v7;
}

- (BOOL)deviceSupportsRepairBootIntent
{
  uint64_t v2 = (void *)MGCopyAnswer();
  char v6 = objc_msgSend_BOOLValue(v2, v3, v4, v5);

  uint64_t v7 = (void *)MGCopyAnswer();
  int v11 = objc_msgSend_intValue(v7, v8, v9, v10);

  if (v6)
  {
    char v12 = 1;
  }
  else if (v11 == 1)
  {
    int64x2_t v13 = vdupq_n_s64(MGGetProductType());
    char v12 = vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_21FC6D380), (int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_21FC6D390)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_21FC6D3A0), (int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_21FC6D3B0))))) ^ 1;
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (id)_getClaimCountEnforceDate
{
  id v2 = objc_alloc_init(MEMORY[0x263F08790]);
  objc_msgSend_setDateFormat_(v2, v3, @"yyyy-MM-dd", v4);
  uint64_t v7 = objc_msgSend_dateFromString_(v2, v5, @"2024-09-16", v6);

  return v7;
}

- (BOOL)checkUsedStatusFor:(id)a3 withHistory:(id)a4 withClaimCount:(id)a5
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend__getClaimCountEnforceDate(self, v11, v12, v13);
  id v15 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v19 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v16, v17, v18);
  objc_msgSend_setLocale_(v15, v20, (uint64_t)v19, v21);

  uint64_t v25 = objc_msgSend_localTimeZone(MEMORY[0x263EFFA18], v22, v23, v24);
  objc_msgSend_setTimeZone_(v15, v26, (uint64_t)v25, v27);

  objc_msgSend_setDateStyle_(v15, v28, 3, v29);
  objc_msgSend_setTimeStyle_(v15, v30, 0, v31);
  objc_msgSend_setFormattingContext_(v15, v32, 5, v33);
  if (v8
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v34, (uint64_t)v8, v35),
        uint64_t v36 = objc_claimAutoreleasedReturnValue(),
        v36,
        v36)
    && (objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(self, v37, (uint64_t)v8, (uint64_t)v9),
        (uint64_t v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    long long v41 = (void *)v38;
    uint64_t v61 = objc_msgSend_dateFromString_(v15, v39, v38, v40);
    if (objc_msgSend_compare_(v61, v42, (uint64_t)v14, v43) == -1)
    {
      long long v46 = handleForCategory(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = v61;
        __int16 v69 = 2112;
        v70 = v14;
        _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "repairDate:%@ in the past:%@", buf, 0x16u);
      }
      LOBYTE(v50) = 0;
    }
    else
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v46 = objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v44, (uint64_t)v8, v45);
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v62, (uint64_t)v66, 16);
      if (v50)
      {
        uint64_t v59 = v41;
        id v60 = v9;
        uint64_t v51 = *(void *)v63;
        while (2)
        {
          for (uint64_t i = 0; i != v50; ++i)
          {
            if (*(void *)v63 != v51) {
              objc_enumerationMutation(v46);
            }
            long long v53 = objc_msgSend_objectForKeyedSubscript_(v10, v48, *(void *)(*((void *)&v62 + 1) + 8 * i), v49);
            int v57 = objc_msgSend_intValue(v53, v54, v55, v56);

            if (v57 > 1)
            {
              LOBYTE(v50) = 1;
              goto LABEL_16;
            }
          }
          uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v62, (uint64_t)v66, 16);
          if (v50) {
            continue;
          }
          break;
        }
LABEL_16:
        long long v41 = v59;
        id v9 = v60;
      }
    }
  }
  else
  {
    LOBYTE(v50) = 0;
  }

  return v50;
}

- (id)getUseCountExceptionsWith:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v30;
    *(void *)&long long v11 = 138412290;
    long long v28 = v11;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v6, v9, v15, v10, v28, (void)v29);
        if ((int)objc_msgSend_intValue(v16, v17, v18, v19) >= 2)
        {
          int v22 = objc_msgSend_containsObject_(self->useCountExceptionKeys, v20, v15, v21);

          if (!v22) {
            continue;
          }
          uint64_t v23 = handleForCategory(0);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            uint64_t v34 = v15;
            _os_log_error_impl(&dword_21FBF2000, v23, OS_LOG_TYPE_ERROR, "%@ has usedCount", buf, 0xCu);
          }

          uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v6, v24, v15, v25);
          objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)v16, v15);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isSelfServiceSalesDistrict:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"SS04", v5)) {
    char isEqualToString = 1;
  }
  else {
    char isEqualToString = objc_msgSend_isEqualToString_(v3, v6, @"SSR999", v7);
  }

  return isEqualToString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->useCountExceptionKeys, 0);
  objc_storeStrong((id *)&self->repairHistoryMap, 0);
}

@end