@interface CRRepairReport
+ (BOOL)_checkComponentResealedWithRCHL:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5;
+ (BOOL)checkComponentFailed:(int)a3 error:(id *)a4;
+ (BOOL)checkComponentResealed:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5;
+ (BOOL)checkComponentUnsealed:(int)a3 error:(id *)a4;
+ (BOOL)checkNonSecureRepair:(int)a3 error:(id *)a4;
+ (BOOL)isSelfRepairedComponent:(int)a3;
+ (id)determineRepairStatus:(id)a3 repairHistory:(id)a4;
+ (id)generateReport:(id)a3 error:(id *)a4;
+ (id)getSupportedComponents;
+ (id)populateDCSignedComponents;
+ (id)populateIssueComponents;
+ (id)populateRCHLHistory;
+ (id)populateUnsealedComponents;
+ (id)translateToExternalName:(id)a3;
+ (int)getComponentState:(int)a3 error:(id *)a4;
+ (void)insertItem:(id)a3 item:(id)a4;
@end

@implementation CRRepairReport

+ (id)generateReport:(id)a3 error:(id *)a4
{
  v42[6] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v9 = objc_msgSend_populateRCHLHistory(a1, v6, v7, v8);
  v13 = objc_msgSend_populateDCSignedComponents(a1, v10, v11, v12);
  v17 = objc_msgSend_populateUnsealedComponents(a1, v14, v15, v16);
  v21 = objc_msgSend_populateIssueComponents(a1, v18, v19, v20);
  v23 = objc_msgSend_determineRepairStatus_repairHistory_(a1, v22, (uint64_t)v5, (uint64_t)v9);

  v42[0] = @"0.2";
  v36 = @"Version";
  v37 = @"Status";
  uint64_t v27 = (uint64_t)v23;
  if (!v23)
  {
    uint64_t v27 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26);
  }
  uint64_t v34 = v27;
  v42[1] = v27;
  v38 = @"RepairHistory";
  v28 = v9;
  if (!v9)
  {
    v28 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26, v27, v36, v37, v38);
  }
  v42[2] = v28;
  v39 = @"UnsealedComponents";
  v29 = v17;
  if (!v17)
  {
    v29 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26);
  }
  v42[3] = v29;
  v40 = @"DCSignedComponents";
  v30 = v13;
  if (!v13)
  {
    v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26);
  }
  v42[4] = v30;
  v41 = @"IssueComponents";
  v31 = v21;
  if (!v21)
  {
    v31 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26);
  }
  v42[5] = v31;
  v32 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v24, (uint64_t)v42, (uint64_t)&v36, 6, v34);
  if (v21)
  {
    if (v13) {
      goto LABEL_13;
    }
  }
  else
  {

    if (v13)
    {
LABEL_13:
      if (v17) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }

  if (v17)
  {
LABEL_14:
    if (v9) {
      goto LABEL_15;
    }
LABEL_22:

    if (v23) {
      goto LABEL_16;
    }
    goto LABEL_23;
  }
LABEL_21:

  if (!v9) {
    goto LABEL_22;
  }
LABEL_15:
  if (v23) {
    goto LABEL_16;
  }
LABEL_23:

LABEL_16:
  return v32;
}

+ (int)getComponentState:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  char v34 = 0;
  uint64_t v7 = objc_msgSend_getSupportedComponents(a1, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v10 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v8, v5, v9);
  int v13 = objc_msgSend_containsObject_(v7, v11, (uint64_t)v10, v12);

  if (!v13)
  {
    id v18 = 0;
    int v19 = -1;
    goto LABEL_5;
  }
  id v33 = 0;
  char v15 = objc_msgSend_checkComponentUnsealed_error_(a1, v14, v5, (uint64_t)&v33);
  id v16 = v33;
  id v18 = v16;
  if (v15)
  {
    int v19 = 2;
    goto LABEL_5;
  }
  if (v16) {
    goto LABEL_25;
  }
  id v32 = 0;
  char v21 = objc_msgSend_checkComponentFailed_error_(a1, v17, v5, (uint64_t)&v32);
  id v22 = v32;
  id v18 = v22;
  if (v21)
  {
    int v19 = 1;
    goto LABEL_5;
  }
  if (v22) {
    goto LABEL_25;
  }
  id v31 = 0;
  int v24 = objc_msgSend_checkComponentResealed_usedPart_error_(a1, v23, v5, (uint64_t)&v34, &v31);
  id v25 = v31;
  id v18 = v25;
  if (v24)
  {
    if (v34) {
      int v19 = 4;
    }
    else {
      int v19 = 3;
    }
    goto LABEL_5;
  }
  if (v25)
  {
LABEL_25:
    int v19 = -1;
LABEL_21:
    v29 = handleForCategory(0);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_21FC642C4((uint64_t)v18, v29);
    }

    if (a4)
    {
      id v18 = v18;
      *a4 = v18;
    }
    goto LABEL_5;
  }
  id v30 = 0;
  char v27 = objc_msgSend_checkNonSecureRepair_error_(a1, v26, v5, (uint64_t)&v30);
  id v28 = v30;
  id v18 = v28;
  if (v27)
  {
    int v19 = 3;
    goto LABEL_5;
  }
  if (v28) {
    int v19 = -1;
  }
  else {
    int v19 = 0;
  }
  if (v28) {
    goto LABEL_21;
  }
LABEL_5:

  return v19;
}

+ (id)populateRCHLHistory
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  id v54 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_new();
  uint64_t v8 = objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v5, v6, 0, v7);
  uint64_t v12 = objc_msgSend_set(MEMORY[0x263EFF9C0], v9, v10, v11);
  objc_msgSend_addObject_(v12, v13, @"System", v14);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v53 = a1;
  id v18 = objc_msgSend_getSupportedComponents(a1, v15, v16, v17);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, (uint64_t)v64, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(v18);
        }
        uint64_t v27 = objc_msgSend_intValue(*(void **)(*((void *)&v59 + 1) + 8 * i), v21, v22, v23);
        id v32 = objc_msgSend_getRCHLComponentWithType_(v5, v28, v27, v29);
        if (v32) {
          objc_msgSend_addObject_(v12, v30, (uint64_t)v32, v31);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v59, (uint64_t)v64, 16);
    }
    while (v24);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v33 = v12;
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v55, (uint64_t)v63, 16);
  if (v35)
  {
    uint64_t v37 = v35;
    uint64_t v38 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v56 != v38) {
          objc_enumerationMutation(v33);
        }
        uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * j);
        if (objc_msgSend_hasHadRCHLBasedRepairForComponent_withHistory_(v5, v36, v40, (uint64_t)v8))
        {
          v43 = objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(v5, v36, v40, (uint64_t)v8);
          if (v43)
          {
            v44 = objc_msgSend_itemWithName_(CRRepairReportItem, v41, v40, v42);
            v47 = objc_msgSend_withStatus_(v44, v45, 2, v46);
            v50 = objc_msgSend_withDate_(v47, v48, (uint64_t)v43, v49);
            objc_msgSend_insertItem_item_(v53, v51, (uint64_t)v54, (uint64_t)v50);
          }
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v55, (uint64_t)v63, 16);
    }
    while (v37);
  }

  return v54;
}

+ (id)populateDCSignedComponents
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  if (objc_msgSend_isDcSignedSealingManifest_(CRFDRUtils, v6, 0, v7))
  {
    uint64_t v11 = objc_msgSend_itemWithName_(CRRepairReportItem, v8, @"System", v10);
    uint64_t v14 = objc_msgSend_withStatus_(v11, v12, 1, v13);
    objc_msgSend_insertItem_item_(a1, v15, (uint64_t)v5, (uint64_t)v14);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v16 = objc_msgSend_getSupportedComponentTypes(CRDeviceMap, v8, v9, v10, 0);
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    uint64_t v22 = v18;
    uint64_t v23 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v16);
        }
        uint64_t v25 = objc_msgSend_intValue(*(void **)(*((void *)&v39 + 1) + 8 * i), v19, v20, v21);
        if (objc_msgSend_isDcSignedComponent_error_(CRFDRUtils, v26, v25, 0))
        {
          uint64_t v27 = objc_msgSend_getComponentName_(CRDeviceMap, v19, v25, v21);
          id v28 = (void *)v27;
          if (v27) {
            uint64_t v29 = (__CFString *)v27;
          }
          else {
            uint64_t v29 = @"UNKNOWN";
          }
          id v30 = v29;

          id v33 = objc_msgSend_itemWithName_(CRRepairReportItem, v31, (uint64_t)v30, v32);

          v36 = objc_msgSend_withStatus_(v33, v34, 1, v35);
          objc_msgSend_insertItem_item_(a1, v37, (uint64_t)v5, (uint64_t)v36);
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v22);
  }

  return v5;
}

+ (id)populateUnsealedComponents
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2, v3);
  uint64_t v8 = objc_msgSend_findUnsealedDataWithError_(CRFDRUtils, v6, 0, v7);
  uint64_t v12 = v8;
  if (v8 && objc_msgSend_count(v8, v9, v10, v11))
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v12;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v13);
          }
          uint64_t v21 = objc_msgSend_itemWithName_(CRRepairReportItem, v16, *(void *)(*((void *)&v27 + 1) + 8 * i), v17, (void)v27);
          uint64_t v24 = objc_msgSend_withStatus_(v21, v22, 4, v23);
          objc_msgSend_insertItem_item_(a1, v25, (uint64_t)v5, (uint64_t)v24);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v18);
    }
  }
  return v5;
}

+ (id)populateIssueComponents
{
  v49[16] = *MEMORY[0x263EF8340];
  v43 = objc_opt_new();
  v49[0] = v43;
  long long v42 = objc_opt_new();
  v49[1] = v42;
  long long v41 = objc_opt_new();
  v49[2] = v41;
  long long v40 = objc_opt_new();
  v49[3] = v40;
  long long v39 = objc_opt_new();
  v49[4] = v39;
  uint64_t v38 = objc_opt_new();
  v49[5] = v38;
  uint64_t v37 = objc_opt_new();
  v49[6] = v37;
  uint64_t v3 = objc_opt_new();
  v49[7] = v3;
  v4 = objc_opt_new();
  v49[8] = v4;
  uint64_t v5 = objc_opt_new();
  v49[9] = v5;
  v6 = objc_opt_new();
  v49[10] = v6;
  uint64_t v7 = objc_opt_new();
  v49[11] = v7;
  uint64_t v8 = objc_opt_new();
  v49[12] = v8;
  uint64_t v9 = objc_opt_new();
  v49[13] = v9;
  uint64_t v10 = objc_opt_new();
  v49[14] = v10;
  uint64_t v11 = objc_opt_new();
  v49[15] = v11;
  v36 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v12, (uint64_t)v49, 16);

  uint64_t v16 = objc_msgSend_array(MEMORY[0x263EFF980], v13, v14, v15);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v17 = v36;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v45 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if (objc_msgSend_isComponentFailed(v26, v20, v21, v22, v36))
        {
          long long v27 = objc_msgSend_componentName(v26, v20, v21, v22);
          long long v30 = objc_msgSend_itemWithName_(CRRepairReportItem, v28, (uint64_t)v27, v29);
          id v33 = objc_msgSend_withStatus_(v30, v31, 3, v32);
          objc_msgSend_insertItem_item_(a1, v34, (uint64_t)v16, (uint64_t)v33);
        }
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v23);
  }

  return v16;
}

+ (id)determineRepairStatus:(id)a3 repairHistory:(id)a4
{
  v4 = NSNumber;
  BOOL v6 = objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4) != 0;
  return (id)objc_msgSend_numberWithInt_(v4, v5, v6, v7);
}

+ (id)translateToExternalName:(id)a3
{
  id v3 = a3;
  BOOL v6 = objc_msgSend_objectForKeyedSubscript_(&unk_26D163A70, v4, (uint64_t)v3, v5);
  uint64_t v7 = v6;
  if (!v6) {
    BOOL v6 = v3;
  }
  id v8 = v6;

  return v8;
}

+ (void)insertItem:(id)a3 item:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v7, v8, v9);
  uint64_t v14 = objc_msgSend_error(v6, v11, v12, v13);

  if (v14)
  {
    uint64_t v18 = objc_msgSend_error(v6, v15, v16, v17);
    uint64_t v14 = objc_msgSend_localizedDescription(v18, v19, v20, v21);

    uint64_t v25 = -1;
  }
  else
  {
    uint64_t v25 = objc_msgSend_statusCode(v6, v15, v16, v17);
  }
  uint64_t v26 = objc_msgSend_name(v6, v22, v23, v24);
  uint64_t v29 = objc_msgSend_translateToExternalName_(a1, v27, (uint64_t)v26, v28);
  objc_msgSend_setValue_forKey_(v10, v30, (uint64_t)v29, @"Name");

  id v33 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v31, v25, v32);
  objc_msgSend_setValue_forKey_(v10, v34, (uint64_t)v33, @"State");

  if (v14) {
    objc_msgSend_setValue_forKey_(v10, v35, (uint64_t)v14, @"Reason");
  }
  objc_msgSend_addObject_(v37, v35, (uint64_t)v10, v36);
}

+ (BOOL)checkComponentUnsealed:(int)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_getKeysInComponent_(CRDeviceMap, a2, *(uint64_t *)&a3, (uint64_t)a4);
  uint64_t v8 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6, v7))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v8;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = objc_msgSend_findUnsealedDataWithKey_error_(CRFDRUtils, v11, *(void *)(*((void *)&v21 + 1) + 8 * i), 0, (void)v21);
          uint64_t v19 = v15;
          if (v15 && objc_msgSend_count(v15, v16, v17, v18))
          {

            LOBYTE(v12) = 1;
            goto LABEL_15;
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (BOOL)_checkComponentResealedWithRCHL:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v13 = objc_msgSend_getRCHLComponentWithType_(v8, v9, v7, v10);
  if (v13)
  {
    id v20 = 0;
    uint64_t v14 = objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v8, v11, (uint64_t)&v20, v12);
    id v15 = v20;
    char hasHadRCHLBasedRepairForComponent_withHistory = objc_msgSend_hasHadRCHLBasedRepairForComponent_withHistory_(v8, v16, (uint64_t)v13, (uint64_t)v14);
    if (a4) {
      *a4 = objc_msgSend_checkUsedStatusFor_withHistory_withClaimCount_(v8, v17, (uint64_t)v13, (uint64_t)v14, v15);
    }
  }
  else if (a5)
  {
    sub_21FC02E70((void *)0xFFFFFFFFFFFFFFB8, @"Invalid component type", 0);
    char hasHadRCHLBasedRepairForComponent_withHistory = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char hasHadRCHLBasedRepairForComponent_withHistory = 0;
  }

  return hasHadRCHLBasedRepairForComponent_withHistory;
}

+ (BOOL)checkComponentResealed:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5
{
  uint64_t v7 = *(void *)&a3;
  id v9 = objc_opt_new();
  int isRCHLRepairHistoryDevice = objc_msgSend_isRCHLRepairHistoryDevice(v9, v10, v11, v12);

  if (isRCHLRepairHistoryDevice) {
    char isDcSignedComponent_error = objc_msgSend__checkComponentResealedWithRCHL_usedPart_error_(a1, v14, v7, (uint64_t)a4, a5);
  }
  else {
    char isDcSignedComponent_error = objc_msgSend_isDcSignedComponent_error_(CRFDRUtils, v14, v7, (uint64_t)a5);
  }
  BOOL v19 = isDcSignedComponent_error;
  if (a5 && *a5 && objc_msgSend_code(*a5, v16, v17, v18) == -72) {
    *a5 = 0;
  }
  return v19;
}

+ (BOOL)checkComponentFailed:(int)a3 error:(id *)a4
{
  switch(a3)
  {
    case 1024:
    case 1025:
    case 1027:
    case 1028:
      uint64_t v5 = objc_opt_new();
      char isComponentFailed = objc_msgSend_isComponentFailed(v5, v9, v10, v11);
      goto LABEL_6;
    case 1026:
      uint64_t v5 = objc_opt_new();
      if (objc_msgSend_isComponentFailed(v5, v6, v7, v8))
      {
        char isComponentFailed = 1;
      }
      else
      {
        uint64_t v13 = objc_opt_new();
        char isComponentFailed = objc_msgSend_isComponentFailed(v13, v14, v15, v16);
      }
LABEL_6:

      break;
    default:
      char isComponentFailed = 0;
      break;
  }
  return isComponentFailed;
}

+ (BOOL)checkNonSecureRepair:(int)a3 error:(id *)a4
{
  if (a3 == 1031)
  {
    uint64_t v5 = (void *)ZhuGeCopyValue();
    uint64_t v6 = (void *)ZhuGeCopyValue();
    id v7 = 0;
    int v10 = objc_msgSend_isEqualToData_(v5, v8, (uint64_t)v6, v9) ^ 1;
  }
  else
  {
    id v7 = 0;
    if (a4)
    {
      id v7 = 0;
      LOBYTE(v10) = 0;
      *a4 = v7;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

+ (id)getSupportedComponents
{
  return (id)objc_msgSend_getSupportedComponentTypes(CRDeviceMap, a2, v2, v3);
}

+ (BOOL)isSelfRepairedComponent:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_opt_new();
  uint64_t v9 = objc_msgSend_getRCHLComponentWithType_(v4, v5, v3, v6);
  if (v9)
  {
    int v10 = objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v4, v7, 0, v8);
    uint64_t v12 = objc_msgSend_repairCenterForComponent_withRCHLHistory_(v4, v11, (uint64_t)v9, (uint64_t)v10);
    char isSelfServiceSalesDistrict = objc_msgSend_isSelfServiceSalesDistrict_(v4, v13, (uint64_t)v12, v14);
  }
  else
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC6433C(v3, v16);
    }

    char isSelfServiceSalesDistrict = 0;
  }

  return isSelfServiceSalesDistrict;
}

@end