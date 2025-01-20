@interface CKAssetRepairOperationUtilities
+ (BOOL)errorIsRetriableInNearFuture:(id)a3;
+ (BOOL)errorShouldTriggerNetworkReachabilityEvent:(id)a3;
+ (BOOL)repairErrorShouldBeMarkedAsBroken:(id)a3;
+ (id)createRepairContainerFromContainer:(id)a3;
+ (id)createRepairContainerFromContainer:(id)a3 withOverrides:(id)a4;
+ (id)createRepairOperationGroupWithName:(id)a3;
+ (id)repairRecordFromRecord:(id)a3 field:(id)a4 listIndex:(int64_t)a5 repairZoneID:(id)a6;
+ (id)uploadRequestMetadataFromRepairRecord:(id)a3;
+ (void)clearRepairZoneForDatabase:(id)a3 withRepairContainerOverrides:(id)a4 completionHandler:(id)a5;
@end

@implementation CKAssetRepairOperationUtilities

+ (id)createRepairOperationGroupWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(CKOperationConfiguration);
  objc_msgSend_setDiscretionaryNetworkBehavior_(v4, v5, 0, v6);
  objc_msgSend_setAutomaticallyRetryNetworkFailures_(v4, v7, 0, v8);
  objc_msgSend_setQualityOfService_(v4, v9, 17, v10);
  objc_msgSend_setAllowsCellularAccess_(v4, v11, 0, v12);
  objc_msgSend_setRequestOriginator_(v4, v13, 1, v14);
  v15 = objc_alloc_init(CKOperationGroup);
  objc_msgSend_setDefaultConfiguration_(v15, v16, (uint64_t)v4, v17);
  objc_msgSend_setName_(v15, v18, (uint64_t)v3, v19);

  return v15;
}

+ (id)createRepairContainerFromContainer:(id)a3
{
  return (id)objc_msgSend_createRepairContainerFromContainer_withOverrides_(a1, a2, (uint64_t)a3, 0);
}

+ (id)createRepairContainerFromContainer:(id)a3 withOverrides:(id)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v11 = objc_msgSend_primaryIdentifier(v5, v7, v8, v9);
  if (v11)
  {
    uint64_t v12 = objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v10, (uint64_t)v5, (uint64_t)v6);
    v13 = objc_opt_new();
    uint64_t v17 = objc_msgSend_options(v5, v14, v15, v16);
    v21 = objc_msgSend_accountOverrideInfo(v17, v18, v19, v20);
    objc_msgSend_setAccountOverrideInfo_(v13, v22, (uint64_t)v21, v23);

    if (__sTestOverridesAvailable)
    {
      v27 = objc_msgSend_options(v5, v24, v25, v26);
      v31 = objc_msgSend_testDeviceReferenceProtocol(v27, v28, v29, v30);
      objc_msgSend_setTestDeviceReferenceProtocol_(v13, v32, (uint64_t)v31, v33);

      v37 = objc_msgSend_options(v5, v34, v35, v36);
      v41 = objc_msgSend_fakeEntitlements(v37, v38, v39, v40);
      objc_msgSend_setFakeEntitlements_(v13, v42, (uint64_t)v41, v43);
    }
    objc_msgSend_setBypassPCSEncryption_(v13, v24, 1, v26);
    v47 = objc_msgSend_applicationBundleIdentifierOverride(v12, v44, v45, v46);
    objc_msgSend_setApplicationBundleIdentifierOverride_(v13, v48, (uint64_t)v47, v49);

    v50 = [CKContainerID alloc];
    v54 = objc_msgSend_containerIdentifier(v12, v51, v52, v53);
    v58 = objc_msgSend_containerID(v5, v55, v56, v57);
    uint64_t v62 = objc_msgSend_environment(v58, v59, v60, v61);
    v64 = objc_msgSend_initWithContainerIdentifier_environment_(v50, v63, (uint64_t)v54, v62);

    if (__sTestOverridesAvailable)
    {
      id v65 = objc_alloc((Class)sub_18B0725AC());
      v69 = objc_msgSend_testDeviceReferenceProtocol(v13, v66, v67, v68);
      v71 = objc_msgSend_initWithContainerID_options_testDeviceReferenceProtocol_(v65, v70, (uint64_t)v64, (uint64_t)v13, v69);
    }
    else
    {
      v73 = [CKContainer alloc];
      v71 = objc_msgSend_initWithContainerID_options_(v73, v74, (uint64_t)v64, (uint64_t)v13);
    }
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v72 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      int v76 = 138412290;
      id v77 = v5;
      _os_log_error_impl(&dword_18AF10000, v72, OS_LOG_TYPE_ERROR, "Couldn't get repair container application identifier for container %@", (uint8_t *)&v76, 0xCu);
    }
    v71 = 0;
  }

  return v71;
}

+ (void)clearRepairZoneForDatabase:(id)a3 withRepairContainerOverrides:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(0, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_18B141614;
  v15[3] = &unk_1E5465150;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v19 = a1;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

+ (id)repairRecordFromRecord:(id)a3 field:(id)a4 listIndex:(int64_t)a5 repairZoneID:(id)a6
{
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v13 = a6;
  if (!v13)
  {
    id v14 = [CKRecordZoneID alloc];
    id v13 = (id)objc_msgSend_initWithZoneName_ownerName_(v14, v15, @"RepairZone", @"__defaultOwner__");
  }
  id v16 = objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v10, v12);
  if (a5 < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v23 = v16;
      goto LABEL_14;
    }
LABEL_11:

    goto LABEL_18;
  }
  if (objc_msgSend_count(v16, v17, v18, v19) <= a5) {
    goto LABEL_11;
  }
  v22 = objc_msgSend_objectAtIndex_(v16, v20, a5, v21);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v23 = v22;
  }
  else {
    id v23 = 0;
  }

LABEL_14:
  if (v23)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v25 = v23;
    if (isKindOfClass)
    {
      uint64_t v26 = [CKRecord alloc];
      v28 = objc_msgSend_initWithRecordType_zoneID_(v26, v27, @"MissingAsset", (uint64_t)v13);
      v32 = objc_msgSend_recordID(v9, v29, v30, v31);
      uint64_t v36 = objc_msgSend_zoneID(v32, v33, v34, v35);
      uint64_t v40 = objc_msgSend_zoneName(v36, v37, v38, v39);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v41, (uint64_t)v40, @"zone");

      uint64_t v45 = objc_msgSend_recordID(v9, v42, v43, v44);
      uint64_t v49 = objc_msgSend_recordName(v45, v46, v47, v48);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v50, (uint64_t)v49, @"affectedRecordID");

      v54 = objc_msgSend_recordType(v9, v51, v52, v53);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v55, (uint64_t)v54, @"affectedRecordType");

      v59 = objc_msgSend_signature(v25, v56, v57, v58);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v60, (uint64_t)v59, @"fileSignature");

      v64 = objc_msgSend_referenceSignature(v25, v61, v62, v63);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v65, (uint64_t)v64, @"referenceSignature");

      objc_msgSend_setObject_forKeyedSubscript_(v28, v66, (uint64_t)v10, @"fieldName");
      if (a5 < 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      v69 = objc_msgSend_numberWithInteger_(NSNumber, v67, a5, v68);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v70, (uint64_t)v69, @"listIndex");
    }
    else
    {
      v69 = objc_opt_new();
      v72 = objc_opt_new();
      int v76 = objc_msgSend_assets(v25, v73, v74, v75);
      uint64_t v80 = objc_msgSend_count(v76, v77, v78, v79);

      if (v80)
      {
        unint64_t v84 = 0;
        do
        {
          v85 = objc_msgSend_assets(v25, v81, v82, v83);
          v88 = objc_msgSend_objectAtIndexedSubscript_(v85, v86, v84, v87);
          v92 = objc_msgSend_signature(v88, v89, v90, v91);
          objc_msgSend_addObject_(v69, v93, (uint64_t)v92, v94);

          v98 = objc_msgSend_assets(v25, v95, v96, v97);
          v101 = objc_msgSend_objectAtIndexedSubscript_(v98, v99, v84, v100);
          v105 = objc_msgSend_referenceSignature(v101, v102, v103, v104);
          objc_msgSend_addObject_(v72, v106, (uint64_t)v105, v107);

          ++v84;
          v111 = objc_msgSend_assets(v25, v108, v109, v110);
          unint64_t v115 = objc_msgSend_count(v111, v112, v113, v114);
        }
        while (v84 < v115);
      }
      v116 = [CKRecord alloc];
      v28 = objc_msgSend_initWithRecordType_zoneID_(v116, v117, @"MissingPackage", (uint64_t)v13);
      v121 = objc_msgSend_recordID(v9, v118, v119, v120);
      v125 = objc_msgSend_zoneID(v121, v122, v123, v124);
      v129 = objc_msgSend_zoneName(v125, v126, v127, v128);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v130, (uint64_t)v129, @"zone");

      v134 = objc_msgSend_recordID(v9, v131, v132, v133);
      v138 = objc_msgSend_recordName(v134, v135, v136, v137);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v139, (uint64_t)v138, @"affectedRecordID");

      v143 = objc_msgSend_recordType(v9, v140, v141, v142);
      objc_msgSend_setObject_forKeyedSubscript_(v28, v144, (uint64_t)v143, @"affectedRecordType");

      objc_msgSend_setObject_forKeyedSubscript_(v28, v145, (uint64_t)v10, @"fieldName");
      if (objc_msgSend_count(v69, v146, v147, v148))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v28, v149, (uint64_t)v69, @"fileSignature");
        objc_msgSend_setObject_forKeyedSubscript_(v28, v150, (uint64_t)v72, @"referenceSignature");
      }
    }
    goto LABEL_30;
  }
LABEL_18:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v71 = ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
  {
    int v152 = 138412802;
    id v153 = v10;
    __int16 v154 = 2048;
    int64_t v155 = a5;
    __int16 v156 = 2112;
    id v157 = v9;
    _os_log_error_impl(&dword_18AF10000, v71, OS_LOG_TYPE_ERROR, "Could not find asset or package in field %@ and index %ld of record %@", (uint8_t *)&v152, 0x20u);
  }
  v28 = 0;
LABEL_31:

  return v28;
}

+ (id)uploadRequestMetadataFromRepairRecord:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v7 = objc_msgSend_recordType(v3, v4, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"MissingAsset", v9);

  if (isEqualToString)
  {
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v3, v11, @"zone", v13);
    uint64_t v17 = objc_msgSend_objectForKeyedSubscript_(v3, v15, @"affectedRecordID", v16);
    uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v3, v18, @"affectedRecordType", v19);
    id v23 = objc_msgSend_objectForKeyedSubscript_(v3, v21, @"fieldName", v22);
    uint64_t v26 = objc_msgSend_objectForKeyedSubscript_(v3, v24, @"fileSignature", v25);
    uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v3, v27, @"referenceSignature", v28);
    v32 = objc_msgSend_objectForKeyedSubscript_(v3, v30, @"listIndex", v31);
    uint64_t v33 = [CKRecordZoneID alloc];
    uint64_t v87 = (void *)v14;
    uint64_t v35 = objc_msgSend_initWithZoneName_ownerName_(v33, v34, v14, @"__defaultOwner__");
    uint64_t v36 = [CKRecordID alloc];
    v86 = (void *)v17;
    uint64_t v38 = objc_msgSend_initWithRecordName_zoneID_(v36, v37, v17, (uint64_t)v35);
    uint64_t v39 = [CKAssetUploadRequestMetadata alloc];
    uint64_t v46 = objc_msgSend_recordID(v3, v40, v41, v42);
    if (v32)
    {
      uint64_t v47 = objc_msgSend_integerValue(v32, v43, v44, v45);
      uint64_t v49 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v39, v48, (uint64_t)v46, 2, v38, v20, v23, v26, v29, v47);
    }
    else
    {
      uint64_t v49 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_(v39, v43, (uint64_t)v46, 2, v38, v20, v23, v26, v29);
    }
    uint64_t v83 = (void *)v49;
  }
  else
  {
    v50 = objc_msgSend_recordType(v3, v11, v12, v13);
    int v53 = objc_msgSend_isEqualToString_(v50, v51, @"MissingPackage", v52);

    if (v53)
    {
      v88 = objc_msgSend_objectForKeyedSubscript_(v3, v54, @"zone", v55);
      uint64_t v58 = objc_msgSend_objectForKeyedSubscript_(v3, v56, @"affectedRecordID", v57);
      uint64_t v61 = objc_msgSend_objectForKeyedSubscript_(v3, v59, @"affectedRecordType", v60);
      v64 = objc_msgSend_objectForKeyedSubscript_(v3, v62, @"fieldName", v63);
      uint64_t v67 = objc_msgSend_objectForKeyedSubscript_(v3, v65, @"fileSignature", v66);
      v70 = objc_msgSend_objectForKeyedSubscript_(v3, v68, @"referenceSignature", v69);
      v71 = [CKRecordZoneID alloc];
      v73 = objc_msgSend_initWithZoneName_ownerName_(v71, v72, (uint64_t)v88, @"__defaultOwner__");
      uint64_t v74 = [CKRecordID alloc];
      int v76 = objc_msgSend_initWithRecordName_zoneID_(v74, v75, (uint64_t)v58, (uint64_t)v73);
      id v77 = [CKPackageUploadRequestMetadata alloc];
      v81 = objc_msgSend_recordID(v3, v78, v79, v80);
      uint64_t v83 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v77, v82, (uint64_t)v81, 2, v76, v61, v64, v67, v70);
    }
    else
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      unint64_t v84 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v90 = v3;
        _os_log_error_impl(&dword_18AF10000, v84, OS_LOG_TYPE_ERROR, "Invalid record type for repair record %@", buf, 0xCu);
      }
      uint64_t v83 = 0;
    }
  }

  return v83;
}

+ (BOOL)repairErrorShouldBeMarkedAsBroken:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_domain(v3, v4, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"CKErrorDomain", v9);

  uint64_t v14 = v3;
  if (isEqualToString)
  {
    uint64_t v15 = objc_msgSend_userInfo(v3, v11, v12, v13);
    uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v15, v16, *MEMORY[0x1E4F28A50], v17);
  }
  uint64_t v18 = objc_msgSend_domain(v14, v11, v12, v13);
  int v21 = objc_msgSend_isEqualToString_(v18, v19, @"CKInternalErrorDomain", v20);

  if (v21) {
    BOOL v25 = objc_msgSend_code(v14, v22, v23, v24) == 3012;
  }
  else {
    BOOL v25 = 0;
  }

  return v25;
}

+ (BOOL)errorIsRetriableInNearFuture:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_domain(v3, v4, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"CKErrorDomain", v9);

  if (isEqualToString)
  {
    unint64_t v14 = objc_msgSend_code(v3, v11, v12, v13);
    BOOL v18 = 0;
    if (v14 <= 0x17 && ((1 << v14) & 0x8000D0) != 0)
    {
      uint64_t v19 = objc_msgSend_userInfo(v3, v15, v16, v17);
      uint64_t v22 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"CKRetryAfter", v21);

      if (v22)
      {
        uint64_t v26 = objc_msgSend_userInfo(v3, v23, v24, v25);
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v26, v27, @"CKRetryAfter", v28);
        objc_msgSend_doubleValue(v29, v30, v31, v32);
        double v34 = v33;

        BOOL v18 = v34 <= 300.0;
      }
      else
      {
        BOOL v18 = 1;
      }
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)errorShouldTriggerNetworkReachabilityEvent:(id)a3
{
  id v3 = a3;
  v7 = objc_msgSend_domain(v3, v4, v5, v6);
  int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"CKErrorDomain", v9);

  if (isEqualToString) {
    BOOL v14 = objc_msgSend_code(v3, v11, v12, v13) == 3;
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

@end