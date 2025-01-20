@interface CRFDRSeal
+ (BOOL)currentProcessHasEntitlement:(id)a3;
- (BOOL)CRFDRCheckVerificationFatalErrors:(__CFError *)a3 fdrLocal:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 strict:(BOOL)a6;
- (BOOL)_commitData:(id)a3 fdrlocal:(__AMFDR *)a4 fdrError:(id *)a5;
- (BOOL)_urlsOverrideIsAllowed;
- (BOOL)_writeBatteryDateOfFirstUse:(__AMFDR *)a3 error:(id *)a4;
- (BOOL)allowSelfService;
- (BOOL)allowUsedPart;
- (BOOL)deleteLocalData:(id)a3;
- (BOOL)deleteLocalData:(id)a3 dataClass:(id)a4;
- (BOOL)generateFinalData;
- (BOOL)skipStageEAN;
- (BOOL)stageDataClasses:(id)a3 dataInstances:(id)a4 fdrRemote:(__AMFDR *)a5 fdrLocal:(__AMFDR *)a6 fdrError:(id *)a7;
- (CRFDRBaseDeviceHandler)handler;
- (CRFDRSeal)init;
- (CRFDRSeal)initWithParameters:(id)a3;
- (CRFDRSeal)sealWithDataClass:(id)a3 fdrError:(id *)a4 registerOnly:(BOOL)a5;
- (NSArray)minimalSealedClasses;
- (NSArray)minimalSealedInstances;
- (NSArray)minimalSealingInstances;
- (NSArray)patchDataClasses;
- (NSArray)patchDataInstances;
- (NSArray)patchItems;
- (NSArray)patchValues;
- (NSData)apTicketData;
- (NSDictionary)claimDict;
- (NSDictionary)currentProperties;
- (NSDictionary)makeProperties;
- (NSDictionary)updateClassDict;
- (NSDictionary)updateProperties;
- (NSMutableArray)currentClasses;
- (NSMutableArray)currentInstances;
- (NSMutableArray)makeClasses;
- (NSMutableArray)makeInstances;
- (NSMutableArray)mergedDataClasses;
- (NSMutableArray)mergedDataInstances;
- (NSMutableArray)recoverDataClasses;
- (NSMutableArray)recoverDataInstances;
- (NSSet)partSPC;
- (NSString)failedSPC;
- (NSString)sealedDataInstance;
- (id)_baseFDROptionsWithDataStore:(id)a3;
- (id)_copyFDROptionsForPatch:(__AMFDR *)a3;
- (id)_getCRFDRMetaDataDictionary;
- (id)_personalizeTrustObjectWithDigest:(id)a3 withError:(id *)a4;
- (id)initForRegisterChangeWithParameters:(id)a3;
- (id)setLocalAndRemotePermission:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4;
- (id)summarizePatchInputs;
- (int64_t)CRFDRDataRepairRecover:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6;
- (int64_t)CRFDRLocalPopulate:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 fdrError:(id *)a6;
- (int64_t)CRFDRPostRecoverVerify:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6;
- (int64_t)CRFDRRecoverMissingData:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5;
- (int64_t)CRFDRVerifyLocal:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 mergedDataClasses:(id)a6 mergedDataInstances:(id)a7 currentManifestProperties:(id)a8 fdrError:(id *)a9 syncEAN:(BOOL)a10 postSeal:(BOOL)a11 ignoreBenignError:(BOOL)a12;
- (int64_t)CRFDRVerifyProperties:(__AMFDR *)a3 currentManifestProperties:(id)a4 fdrError:(id *)a5;
- (int64_t)_commitSealedData:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 syncEAN:(BOOL)a6 returnError:(id *)a7;
- (int64_t)_fetchRemoteTrustObject:(__AMFDR *)a3 apTrustObjectDigest:(id)a4 remoteTrustObject:(id *)a5 fdrError:(id *)a6;
- (int64_t)localPatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 error:(id *)a7;
- (int64_t)patchWithOptions:(id)a3 amfdr:(__AMFDR *)a4 dataClasses:(id)a5 dataInstances:(id)a6 values:(id)a7 datas:(id)a8 error:(id *)a9 local:(BOOL)a10;
- (int64_t)performHTTPChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6 registerOnly:(BOOL)a7;
- (int64_t)performMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5;
- (int64_t)performRealToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5;
- (int64_t)performRealToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5;
- (int64_t)performSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5;
- (int64_t)performStagedChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6;
- (int64_t)performStagedMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5;
- (int64_t)performStagedSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5;
- (int64_t)performStagedToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5;
- (int64_t)performStagedToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5;
- (int64_t)prefetchPermissionsForSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10;
- (int64_t)prefetchPermissionsForStagedSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10;
- (int64_t)prefetchPermissionsWith:(__AMFDR *)a3 returnError:(id *)a4;
- (int64_t)registerChangeForComponent:(id)a3 fdrError:(id *)a4;
- (int64_t)remotePatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 datas:(id)a7 error:(id *)a8;
- (int64_t)seal:(id *)a3 oldSealingManifest:(id *)a4 newSealingManifest:(id *)a5 stats:(id *)a6;
- (int64_t)setLocalAndRemoteTrustObject:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 remoteTrustObjectDigest:(id)a5 fdrError:(id *)a6;
- (int64_t)verifyClaimCountAndSalesDistrictWithError:(id *)a3;
- (setupModuleChallengeCallBack)delegate;
- (void)_logSealingRequest:(__AMFDRSealedData *)a3;
- (void)setAllowSelfService:(BOOL)a3;
- (void)setAllowUsedPart:(BOOL)a3;
- (void)setApTicketData:(id)a3;
- (void)setClaimDict:(id)a3;
- (void)setCurrentClasses:(id)a3;
- (void)setCurrentInstances:(id)a3;
- (void)setCurrentProperties:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailedSPC:(id)a3;
- (void)setHandler:(id)a3;
- (void)setMakeClasses:(id)a3;
- (void)setMakeInstances:(id)a3;
- (void)setMakeProperties:(id)a3;
- (void)setMergedDataClasses:(id)a3;
- (void)setMergedDataInstances:(id)a3;
- (void)setMinimalSealedClasses:(id)a3;
- (void)setMinimalSealedInstances:(id)a3;
- (void)setMinimalSealingInstances:(id)a3;
- (void)setPartSPC:(id)a3;
- (void)setPatchDataClasses:(id)a3;
- (void)setPatchDataInstances:(id)a3;
- (void)setPatchItems:(id)a3;
- (void)setPatchValues:(id)a3;
- (void)setRecoverDataClasses:(id)a3;
- (void)setRecoverDataInstances:(id)a3;
- (void)setSealedDataInstance:(id)a3;
- (void)setSkipStageEAN:(BOOL)a3;
- (void)setUpdateClassDict:(id)a3;
- (void)setUpdateProperties:(id)a3;
@end

@implementation CRFDRSeal

- (int64_t)performRealToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  id v126 = 0;
  id v127 = 0;
  id v125 = 0;
  v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_21FC6476C(v9);
  }

  v13 = objc_msgSend_makeProperties(self, v10, v11, v12);

  if (v13)
  {
    v17 = objc_msgSend_makeProperties(self, v14, v15, v16);
    AMFDRSetOption();
    AMFDRSetOption();
  }
  v18 = objc_msgSend_mergedDataClasses(self, v14, v15, v16);
  v22 = objc_msgSend_mergedDataInstances(self, v19, v20, v21);
  v26 = objc_msgSend_currentProperties(self, v23, v24, v25);
  id v124 = 0;
  BYTE2(v115) = 0;
  LOWORD(v115) = objc_msgSend_skipStageEAN(self, v27, v28, v29) ^ 1;
  uint64_t v31 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v30, (uint64_t)a4, (uint64_t)a5, 0, v18, v22, v26, &v124, v115);
  id v32 = v124;

  BOOL v33 = (v31 | (unint64_t)v32) == 0;
  v34 = handleForCategory(0);
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (v31 | (unint64_t)v32)
  {
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "Local FDR data not verified, continue to recover", buf, 2u);
    }

    v34 = v32;
  }
  else if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
  }

  uint64_t v39 = objc_msgSend_patchDataClasses(self, v36, v37, v38);
  if (v39)
  {
    v43 = (void *)v39;
    v44 = objc_msgSend_patchDataClasses(self, v40, v41, v42);
    uint64_t v48 = objc_msgSend_count(v44, v45, v46, v47);

    if (v48)
    {
      v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC64738();
      }
      id v50 = 0;
LABEL_16:
      int64_t Instances_patchClasses_patchInstances = -66;
      goto LABEL_43;
    }
  }
  uint64_t v52 = objc_msgSend_updateProperties(self, v40, v41, v42);
  if (v52)
  {
    v56 = (void *)v52;
    v57 = objc_msgSend_updateProperties(self, v53, v54, v55);
    uint64_t v61 = objc_msgSend_count(v57, v58, v59, v60);

    if (v61)
    {
      v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC64704();
      }
      id v50 = 0;
      int64_t Instances_patchClasses_patchInstances = -89;
      goto LABEL_43;
    }
  }
  id v122 = 0;
  v62 = objc_msgSend_claimDict(self, v53, v54, v55);
  v66 = objc_msgSend_makeClasses(self, v63, v64, v65);
  v70 = objc_msgSend_makeInstances(self, v67, v68, v69);
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForStagedSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v71, (uint64_t)&v122, (uint64_t)a5, a4, v62, v66, v70, 0, 0);
  id v50 = v122;

  if (Instances_patchClasses_patchInstances || v50)
  {
    v49 = handleForCategory(0);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      sub_21FC643F8();
    }
  }
  else
  {
    id v121 = 0;
    v75 = objc_msgSend_claimDict(self, v72, v73, v74);
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_performStagedChallengeClaim_fdrLocal_fdrError_claimClassDict_(self, v76, (uint64_t)a5, (uint64_t)a4, &v121, v75);
    id v50 = v121;

    if (Instances_patchClasses_patchInstances || v50)
    {
      v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC64460();
      }
    }
    else
    {
      if (!v33)
      {
        id v120 = 0;
        int64_t Instances_patchClasses_patchInstances = objc_msgSend_CRFDRRecoverMissingData_fdrLocal_fdrRemote_(self, v77, (uint64_t)&v120, (uint64_t)a4, a5);
        id v112 = v120;
        id v50 = v112;
        if (Instances_patchClasses_patchInstances || v112)
        {
          v49 = handleForCategory(0);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_21FC64634();
          }
          goto LABEL_43;
        }
        id v119 = 0;
        int64_t Instances_patchClasses_patchInstances = objc_msgSend_performStagedMake_fdrLocal_fdrError_(self, v113, (uint64_t)a5, (uint64_t)a4, &v119);
        id v114 = v119;
        id v50 = v114;
        if (Instances_patchClasses_patchInstances || v114)
        {
          v49 = handleForCategory(0);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_21FC6469C();
          }
          goto LABEL_43;
        }
      }
      v78 = handleForCategory(0);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v78, OS_LOG_TYPE_DEFAULT, "Get all local patch data", buf, 2u);
      }

      v82 = objc_msgSend_handler(self, v79, v80, v81);
      v86 = objc_msgSend_partSPC(self, v83, v84, v85);
      v90 = objc_msgSend_mergedDataClasses(self, v87, v88, v89);
      v94 = objc_msgSend_mergedDataInstances(self, v91, v92, v93);
      id v118 = 0;
      int PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error = objc_msgSend_getPatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error_(v82, v95, (uint64_t)v86, (uint64_t)a4, &v127, &v126, &v125, 0, v90, v94, &v118);
      id v50 = v118;

      if (!PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error
        || v50)
      {
        v49 = handleForCategory(0);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_21FC645CC();
        }
        goto LABEL_16;
      }
      id v117 = 0;
      int64_t Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v97, (uint64_t)a4, (uint64_t)v127, v126, v125, &v117);
      id v98 = v117;
      id v50 = v98;
      if (Instances_patchClasses_patchInstances || v98)
      {
        v49 = handleForCategory(0);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
          sub_21FC644C8();
        }
      }
      else
      {
        id v116 = 0;
        int64_t Instances_patchClasses_patchInstances = objc_msgSend_performStagedSealing_fdrLocal_fdrError_(self, v99, (uint64_t)a5, (uint64_t)a4, &v116);
        id v100 = v116;
        id v50 = v100;
        if (Instances_patchClasses_patchInstances || v100)
        {
          v49 = handleForCategory(0);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_21FC64530();
          }
        }
        else
        {
          v104 = objc_msgSend_handler(self, v101, v102, v103);
          v108 = objc_msgSend_partSPC(self, v105, v106, v107);
          int64_t Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v104, v109, (uint64_t)v108, v110);

          if (!Instances_patchClasses_patchInstances)
          {
            id v50 = 0;
            if (!a3) {
              goto LABEL_45;
            }
            goto LABEL_44;
          }
          v49 = handleForCategory(0);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
            sub_21FC64598();
          }
          id v50 = 0;
        }
      }
    }
  }
LABEL_43:

  if (a3) {
LABEL_44:
  }
    *a3 = v50;
LABEL_45:

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performStagedToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_21FC64824(v9);
  }

  v13 = objc_msgSend_localManifestProperties(CRFDRUtils, v10, v11, v12);
  v17 = objc_msgSend_mutableCopy(v13, v14, v15, v16);

  if (v17)
  {
    AMFDRSetOption();
    AMFDRSetOption();
  }
  uint64_t v21 = objc_msgSend_mergedDataClasses(self, v18, v19, v20);
  uint64_t v25 = objc_msgSend_mergedDataInstances(self, v22, v23, v24);
  id v115 = 0;
  BYTE2(v111) = 0;
  LOWORD(v111) = objc_msgSend_skipStageEAN(self, v26, v27, v28) ^ 1;
  uint64_t v30 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v29, (uint64_t)a4, (uint64_t)a5, 0, v21, v25, v17, &v115, v111);
  id v31 = v115;

  id v32 = handleForCategory(0);
  BOOL v33 = v32;
  if (v30 || v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_21FC647F0();
    }
    v49 = 0;
    int64_t Instances_patchClasses_patchInstances = -40;
    goto LABEL_43;
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
  }

  uint64_t v37 = objc_msgSend_patchDataClasses(self, v34, v35, v36);
  if (v37
    && (uint64_t v41 = (void *)v37,
        objc_msgSend_patchDataClasses(self, v38, v39, v40),
        uint64_t v42 = objc_claimAutoreleasedReturnValue(),
        uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45),
        v42,
        v41,
        v46))
  {
    uint64_t v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v48 = "Patch needed, continue";
LABEL_20:
      _os_log_impl(&dword_21FBF2000, v47, OS_LOG_TYPE_DEFAULT, v48, buf, 2u);
    }
  }
  else
  {
    uint64_t v51 = objc_msgSend_updateProperties(self, v38, v39, v40);
    if (!v51
      || (uint64_t v55 = (void *)v51,
          objc_msgSend_updateProperties(self, v52, v53, v54),
          v56 = objc_claimAutoreleasedReturnValue(),
          uint64_t v60 = objc_msgSend_count(v56, v57, v58, v59),
          v56,
          v55,
          !v60))
    {
      BOOL v33 = handleForCategory(0);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "Skip recovery and seal", buf, 2u);
      }
      v49 = 0;
      id v31 = 0;
      int64_t Instances_patchClasses_patchInstances = 0;
      goto LABEL_43;
    }
    uint64_t v47 = handleForCategory(0);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v48 = "Update properties needed, continue";
      goto LABEL_20;
    }
  }

  id v114 = 0;
  uint64_t v64 = objc_msgSend_patchDataClasses(self, v61, v62, v63);
  uint64_t v68 = objc_msgSend_patchDataInstances(self, v65, v66, v67);
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForStagedSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v69, (uint64_t)&v114, (uint64_t)a5, a4, 0, 0, 0, v64, v68);
  id v31 = v114;

  if (Instances_patchClasses_patchInstances || v31)
  {
    BOOL v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC643F8();
    }
    goto LABEL_42;
  }
  uint64_t v73 = objc_msgSend_patchDataClasses(self, v70, v71, v72);
  v77 = objc_msgSend_patchDataInstances(self, v74, v75, v76);
  uint64_t v81 = objc_msgSend_patchValues(self, v78, v79, v80);
  id v113 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v82, (uint64_t)a4, (uint64_t)v73, v77, v81, &v113);
  id v31 = v113;

  if (Instances_patchClasses_patchInstances || v31)
  {
    BOOL v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC644C8();
    }
LABEL_42:
    v49 = 0;
    goto LABEL_43;
  }
  v86 = objc_msgSend_handler(self, v83, v84, v85);
  v90 = objc_msgSend_partSPC(self, v87, v88, v89);
  v94 = objc_msgSend_updateProperties(self, v91, v92, v93);
  v49 = objc_msgSend_getUpdatePropertyWithPartSPC_propertiesFromParam_(v86, v95, (uint64_t)v90, (uint64_t)v94);

  if (v49)
  {
    objc_msgSend_addEntriesFromDictionary_(v17, v96, (uint64_t)v49, v97);
    id v98 = handleForCategory(0);
    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v117 = v17;
      _os_log_impl(&dword_21FBF2000, v98, OS_LOG_TYPE_DEFAULT, "Updated properties: %@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
  }
  id v112 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_performStagedSealing_fdrLocal_fdrError_(self, v96, (uint64_t)a5, (uint64_t)a4, &v112);
  id v99 = v112;
  id v31 = v99;
  if (Instances_patchClasses_patchInstances || v99)
  {
    BOOL v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC64530();
    }
  }
  else
  {
    uint64_t v103 = objc_msgSend_handler(self, v100, v101, v102);
    uint64_t v107 = objc_msgSend_partSPC(self, v104, v105, v106);
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v103, v108, (uint64_t)v107, v109);

    if (!Instances_patchClasses_patchInstances)
    {
      id v31 = 0;
      if (!a3) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    BOOL v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC64598();
    }
    id v31 = 0;
  }
LABEL_43:

  if (a3) {
LABEL_44:
  }
    *a3 = v31;
LABEL_45:

  return Instances_patchClasses_patchInstances;
}

- (BOOL)stageDataClasses:(id)a3 dataInstances:(id)a4 fdrRemote:(__AMFDR *)a5 fdrLocal:(__AMFDR *)a6 fdrError:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  uint64_t v25 = 0;
  CFDictionaryRef v13 = (const __CFDictionary *)AMFDRGetOptions();
  if (!v13)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC648A8();
    }
    v14 = 0;
    goto LABEL_8;
  }
  CFDictionaryGetValue(v13, @"UseSikDataInstance");
  AMFDRSetOption();
  v14 = (void *)AMFDRDataMultiCopy();
  AMFDRSetOption();
  id v15 = v25;
  if (!v14)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC648DC();
    }
    goto LABEL_9;
  }
  uint64_t v19 = handleForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Get 1.0 data successful", buf, 2u);
  }

  CFDictionaryRef v20 = (const __CFDictionary *)AMFDRGetOptions();
  if (!v20)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC648A8();
    }
LABEL_8:
    id v15 = 0;
LABEL_9:
    LOBYTE(v17) = 0;
    goto LABEL_10;
  }
  CFDictionaryGetValue(v20, @"SignData");
  AMFDRSetOption();
  id v23 = 0;
  int v17 = objc_msgSend__commitData_fdrlocal_fdrError_(self, v21, (uint64_t)v14, (uint64_t)a6, &v23);
  id v15 = v23;
  AMFDRSetOption();
  v22 = handleForCategory(0);
  uint64_t v16 = v22;
  if (!v17 || v15)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_21FC64944();
    }
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "Staged data successful", buf, 2u);
    }
    id v15 = 0;
    LOBYTE(v17) = 1;
  }
LABEL_10:

  if (a7) {
    *a7 = v15;
  }

  return v17;
}

- (int64_t)prefetchPermissionsForStagedSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10
{
  v128[1] = *MEMORY[0x263EF8340];
  id v15 = a6;
  id v111 = a7;
  id v113 = a8;
  id v112 = a9;
  id v114 = a10;
  id v119 = 0;
  uint64_t v16 = objc_opt_new();
  int v17 = a5;
  v18 = objc_opt_new();
  CFDictionaryRef v20 = objc_msgSend_setLocalAndRemotePermission_fdrRemote_(self, v19, (uint64_t)v17, (uint64_t)a4);
  uint64_t v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
  if (!v24)
  {
    v94 = handleForCategory(0);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      sub_21FC649AC();
    }

    v95 = (void *)MEMORY[0x263F087E8];
    uint64_t v127 = *MEMORY[0x263F08320];
    v128[0] = @"Unable to create LocalAndRemotePermission for Sealing";
    uint64_t v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v96, (uint64_t)v128, (uint64_t)&v127, 1);
    int64_t v93 = -3;
    uint64_t v92 = objc_msgSend_errorWithDomain_code_userInfo_(v95, v98, @"com.apple.corerepair", -3, v97);
    v91 = a3;
    uint64_t v42 = v111;
    goto LABEL_58;
  }
  v108 = v20;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v109 = v15;
  id v25 = v15;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v115, (uint64_t)v126, 16);
  if (v27)
  {
    uint64_t v30 = v27;
    uint64_t v31 = *(void *)v116;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v116 != v31) {
          objc_enumerationMutation(v25);
        }
        uint64_t v33 = *(void *)(*((void *)&v115 + 1) + 8 * i);
        v34 = objc_msgSend_objectForKeyedSubscript_(v25, v28, v33, v29);
        objc_msgSend_addObject_(v16, v35, v33, v36);
        objc_msgSend_addObject_(v18, v37, (uint64_t)v34, v38);
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v115, (uint64_t)v126, 16);
    }
    while (v30);
  }

  uint64_t v42 = v111;
  if (v111)
  {
    if (v113)
    {
      uint64_t v43 = objc_msgSend_count(v111, v39, v40, v41);
      if (v43 == objc_msgSend_count(v113, v44, v45, v46))
      {
        objc_msgSend_addObjectsFromArray_(v16, v39, (uint64_t)v111, v41);
        objc_msgSend_addObjectsFromArray_(v18, v47, (uint64_t)v113, v48);
      }
    }
  }
  if (v16)
  {
    if (v18)
    {
      uint64_t v49 = objc_msgSend_count(v16, v39, v40, v41);
      if (v49 == objc_msgSend_count(v18, v50, v51, v52))
      {
        CFDictionaryRef v53 = (const __CFDictionary *)AMFDRGetOptions();
        if (!v53)
        {
          uint64_t v97 = handleForCategory(0);
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
            sub_21FC648A8();
          }
          uint64_t v92 = 0;
          int64_t v93 = -26;
LABEL_54:
          id v15 = v109;
          v91 = a3;
          CFDictionaryRef v20 = v108;
          goto LABEL_58;
        }
        CFDictionaryGetValue(v53, @"UseSikDataInstance");
        AMFDRSetOption();
        if (objc_msgSend_count(v16, v54, v55, v56))
        {
          uint64_t v59 = 0;
          while (1)
          {
            uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(v16, v57, v59, v58);
            uint64_t v63 = objc_msgSend_objectAtIndexedSubscript_(v18, v61, v59, v62);
            char appended = AMFDRDataAppendPermissionsString();

            if ((appended & 1) == 0) {
              break;
            }
            if (objc_msgSend_count(v16, v65, v66, v67) <= (unint64_t)++v59) {
              goto LABEL_21;
            }
          }
          uint64_t v103 = handleForCategory(0);
          CFDictionaryRef v20 = v108;
          id v15 = v109;
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
            sub_21FC64AE4();
          }

          v104 = (void *)MEMORY[0x263F087E8];
          uint64_t v124 = *MEMORY[0x263F08320];
          id v125 = @"AMFDRDataAppendPermissionsString GET 1.0 failed";
          uint64_t v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v105, (uint64_t)&v125, (uint64_t)&v124, 1);
          int64_t v93 = -26;
          uint64_t v92 = objc_msgSend_errorWithDomain_code_userInfo_(v104, v106, @"com.apple.corerepair", -26, v97);
          v91 = a3;
          goto LABEL_58;
        }
LABEL_21:
        AMFDRSetOption();
      }
    }
  }
  if (v112)
  {
    if (v114)
    {
      uint64_t v68 = objc_msgSend_count(v112, v39, v40, v41);
      if (v68 == objc_msgSend_count(v114, v69, v70, v71))
      {
        if (objc_msgSend_count(v112, v72, v73, v74))
        {
          uint64_t v77 = 0;
          while (1)
          {
            v78 = objc_msgSend_objectAtIndexedSubscript_(v112, v75, v77, v76);
            uint64_t v81 = objc_msgSend_objectAtIndexedSubscript_(v114, v79, v77, v80);
            char v82 = AMFDRDataAppendPermissionsString();

            if ((v82 & 1) == 0) {
              break;
            }
            if (objc_msgSend_count(v112, v83, v84, v85) <= (unint64_t)++v77) {
              goto LABEL_29;
            }
          }
          id v99 = handleForCategory(0);
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
            sub_21FC64AB0();
          }

          id v100 = (void *)MEMORY[0x263F087E8];
          uint64_t v122 = *MEMORY[0x263F08320];
          v123 = @"AMFDRDataAppendPermissionsString Patch failed";
          uint64_t v97 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v101, (uint64_t)&v123, (uint64_t)&v122, 1);
          int64_t v93 = -66;
          uint64_t v92 = objc_msgSend_errorWithDomain_code_userInfo_(v100, v102, @"com.apple.corerepair", -66, v97);
          goto LABEL_54;
        }
      }
    }
  }
LABEL_29:
  v86 = handleForCategory(0);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v121 = v24;
    _os_log_impl(&dword_21FBF2000, v86, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr For Sealing :%@", buf, 0xCu);
  }

  AMFDRSetOption();
  AMFDRSetOption();
  CFDictionaryRef v20 = v108;
  id v15 = v109;
  if (AMFDRPermissionsRequest())
  {
    v91 = a3;
    if (AMFDRMigrateCredentials())
    {
      uint64_t v92 = 0;
      int64_t v93 = 0;
      if (!a3) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
    uint64_t v92 = v119;
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v89, (uint64_t)v119, v90) == 11) {
      int64_t v93 = -13;
    }
    else {
      int64_t v93 = -3;
    }
    uint64_t v97 = handleForCategory(0);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      sub_21FC649E0();
    }
  }
  else
  {
    uint64_t v92 = v119;
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v87, (uint64_t)v119, v88) == 11) {
      int64_t v93 = -13;
    }
    else {
      int64_t v93 = -3;
    }
    uint64_t v97 = handleForCategory(0);
    v91 = a3;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      sub_21FC64A48();
    }
  }
LABEL_58:

  if (v91)
  {
LABEL_59:
    objc_msgSend_getInnermostNSError_(CRUtils, v89, (uint64_t)v92, v90);
    id *v91 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_60:
  AMSupportSafeRelease();

  return v93;
}

- (int64_t)performStagedChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a6;
  v9 = objc_opt_new();
  v10 = objc_opt_new();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v11 = v8;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        CFDictionaryRef v20 = objc_msgSend_objectForKeyedSubscript_(v11, v14, v19, v15);
        objc_msgSend_addObject_(v9, v21, v19, v22);
        objc_msgSend_addObject_(v10, v23, (uint64_t)v20, v24);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v16);
  }

  if (v9) {
    BOOL v28 = v10 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28 && objc_msgSend_count(v9, v25, v26, v27) && objc_msgSend_count(v10, v29, v30, v31))
  {
    id v32 = handleForCategory(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "Perform staged CLAIM", buf, 2u);
    }

    id v46 = 0;
    int v34 = objc_msgSend_stageDataClasses_dataInstances_fdrRemote_fdrLocal_fdrError_(self, v33, (uint64_t)v9, (uint64_t)v10, a3, a4, &v46);
    id v35 = v46;
    uint64_t v36 = v35;
    if (!v34 || v35)
    {
      uint64_t v37 = handleForCategory(0);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_21FC64B18();
      }

      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v38, (uint64_t)v36, v39) == 11) {
        int64_t v40 = -13;
      }
      else {
        int64_t v40 = -11;
      }
      if (!a5) {
        goto LABEL_32;
      }
LABEL_31:
      *a5 = v36;
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v41 = handleForCategory(0);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "No claim data, skipping.", buf, 2u);
    }
  }
  uint64_t v42 = handleForCategory(0);
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v42, OS_LOG_TYPE_DEFAULT, "Claim and commit local successful", buf, 2u);
  }

  uint64_t v36 = 0;
  int64_t v40 = 0;
  if (a5) {
    goto LABEL_31;
  }
LABEL_32:

  return v40;
}

- (int64_t)performStagedMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  v74[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = objc_msgSend_makeClasses(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (!v9) {
    goto LABEL_19;
  }
  uint64_t v13 = (void *)v9;
  uint64_t v14 = objc_msgSend_makeInstances(self, v10, v11, v12);
  if (!v14) {
    goto LABEL_18;
  }
  v18 = (void *)v14;
  uint64_t v19 = objc_msgSend_makeClasses(self, v15, v16, v17);
  if (!objc_msgSend_count(v19, v20, v21, v22))
  {

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v26 = objc_msgSend_makeInstances(self, v23, v24, v25);
  uint64_t v30 = objc_msgSend_count(v26, v27, v28, v29);

  if (!v30)
  {
LABEL_19:
    uint64_t v64 = handleForCategory(0);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v64, OS_LOG_TYPE_DEFAULT, "No make data, skipping.", buf, 2u);
    }

    goto LABEL_22;
  }
  int v34 = objc_msgSend_makeClasses(self, v31, v32, v33);
  uint64_t v38 = objc_msgSend_count(v34, v35, v36, v37);
  uint64_t v42 = objc_msgSend_makeInstances(self, v39, v40, v41);
  uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45);

  uint64_t v47 = handleForCategory(0);
  long long v48 = v47;
  if (v38 != v46)
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_21FC64B80();
    }

    uint64_t v67 = (void *)MEMORY[0x263F087E8];
    uint64_t v73 = *MEMORY[0x263F08320];
    v74[0] = @"make classes and instances count mismatched";
    uint64_t v69 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v68, (uint64_t)v74, (uint64_t)&v73, 1);
    int64_t v63 = -26;
    objc_msgSend_errorWithDomain_code_userInfo_(v67, v70, @"com.apple.corerepair", -26, v69);
    id v59 = (id)objc_claimAutoreleasedReturnValue();

    if (a5) {
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "Perform staged MAKE", buf, 2u);
  }

  uint64_t v52 = objc_msgSend_makeClasses(self, v49, v50, v51);
  uint64_t v56 = objc_msgSend_makeInstances(self, v53, v54, v55);
  id v71 = 0;
  int v58 = objc_msgSend_stageDataClasses_dataInstances_fdrRemote_fdrLocal_fdrError_(self, v57, (uint64_t)v52, (uint64_t)v56, a3, a4, &v71);
  id v59 = v71;

  if (!v58 || v59)
  {
    uint64_t v60 = handleForCategory(0);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
      sub_21FC64B4C();
    }

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v61, (uint64_t)v59, v62) == 11) {
      int64_t v63 = -13;
    }
    else {
      int64_t v63 = -26;
    }
    if (!a5) {
      goto LABEL_26;
    }
LABEL_25:
    *a5 = v59;
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v65 = handleForCategory(0);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v65, OS_LOG_TYPE_DEFAULT, "Make and commit local successful", buf, 2u);
  }

  id v59 = 0;
  int64_t v63 = 0;
  if (a5) {
    goto LABEL_25;
  }
LABEL_26:

  return v63;
}

- (int64_t)performStagedSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "Enable staged seal", buf, 2u);
  }

  AMFDRSetOption();
  AMFDRSetOption();
  int v13 = objc_msgSend_skipStageEAN(self, v10, v11, v12);
  id v39 = 0;
  uint64_t v15 = objc_msgSend_CRFDRDataRepairRecover_fdrRemote_syncEAN_fdrError_(self, v14, (uint64_t)a4, (uint64_t)a3, v13 ^ 1u, &v39);
  id v16 = v39;
  id v20 = v16;
  if (v15 || v16)
  {
    uint64_t v33 = handleForCategory(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_21FC64BB4();
    }

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v34, (uint64_t)v20, v35) == 11) {
      int64_t v23 = -13;
    }
    else {
      int64_t v23 = v15;
    }
LABEL_18:
    if (!a5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  int v21 = objc_msgSend_skipStageEAN(self, v17, v18, v19);
  id v38 = 0;
  int64_t v23 = objc_msgSend_CRFDRPostRecoverVerify_fdrRemote_syncEAN_fdrError_(self, v22, (uint64_t)a4, (uint64_t)a3, v21 ^ 1u, &v38);
  id v24 = v38;
  id v20 = v24;
  if (v23 || v24) {
    goto LABEL_18;
  }
  int v28 = objc_msgSend_skipStageEAN(self, v25, v26, v27);
  id v37 = 0;
  int DeviceStagedSealedFromEAN_error = objc_msgSend_queryDeviceStagedSealedFromEAN_error_(CRFDRUtils, v29, v28 ^ 1u, (uint64_t)&v37);
  id v20 = v37;
  uint64_t v31 = handleForCategory(0);
  uint64_t v32 = v31;
  if (DeviceStagedSealedFromEAN_error && !v20)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v32, OS_LOG_TYPE_DEFAULT, "Partial Seal Successful", buf, 2u);
    }

    id v20 = 0;
    int64_t v23 = 0;
    if (!a5) {
      goto LABEL_20;
    }
LABEL_19:
    *a5 = v20;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_21FC64C1C();
  }

  int64_t v23 = -40;
  if (a5) {
    goto LABEL_19;
  }
LABEL_20:

  return v23;
}

- (CRFDRSeal)init
{
  return 0;
}

- (BOOL)_urlsOverrideIsAllowed
{
  if ((MGGetBoolAnswer() & 1) != 0 || !MGGetBoolAnswer()) {
    return 1;
  }
  v3 = objc_opt_new();
  char hasEntitlementBoolForTag_inAPTicket = objc_msgSend_hasEntitlementBoolForTag_inAPTicket_(v3, v4, 1633776739, (uint64_t)self->apTicketData);

  return hasEntitlementBoolForTag_inAPTicket;
}

- (CRFDRSeal)initWithParameters:(id)a3
{
  uint64_t v183 = *MEMORY[0x263EF8340];
  v4 = a3;
  char v180 = 0;
  if (!objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v5, @"com.apple.private.corerepair.fdr", v6))goto LABEL_13; {
  v179.receiver = self;
  }
  v179.super_class = (Class)CRFDRSeal;
  v7 = [(CRFDRSeal *)&v179 init];
  self = v7;
  if (!v7) {
    goto LABEL_12;
  }
  FDRPersistentDataPath = v7->FDRPersistentDataPath;
  v7->FDRPersistentDataPath = 0;

  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v182 = v4;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "initWithParameters: %@", buf, 0xCu);
  }

  self->doSeal = 1;
  objc_msgSend_NSDataFromKey_defaultValue_failed_(v4, v10, @"keyBlob", 0, &v180);
  uint64_t v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  keyBlob = self->keyBlob;
  self->keyBlob = v11;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC664C8();
    }
LABEL_11:

    goto LABEL_12;
  }
  self->enableProxy = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v13, @"enableProxy", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC66494();
    }
    goto LABEL_11;
  }
  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v15, @"UseSOCKSHost", 0, 0);
  uint64_t v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  SOCKSHost = self->SOCKSHost;
  self->SOCKSHost = v18;

  uint64_t v22 = objc_msgSend_numberWithInt_(NSNumber, v20, 0x10000, v21);
  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v4, v23, @"UseSOCKSPort", (uint64_t)&unk_26D163368, v22, 0, 0);
  id v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  SOCKSPort = self->SOCKSPort;
  self->SOCKSPort = v24;

  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v26, @"datapath", 0, 0);
  uint64_t v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  int v28 = self->FDRPersistentDataPath;
  self->FDRPersistentDataPath = v27;

  uint64_t v31 = self->FDRPersistentDataPath;
  if (v31)
  {
    objc_msgSend_URLWithString_(NSURL, v29, (uint64_t)v31, v30);
    uint64_t v32 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataDirectoryURL = self->dataDirectoryURL;
    self->dataDirectoryURL = v32;
  }
  if (!self->dataDirectoryURL)
  {
    id v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_21FC660EC();
    }
    goto LABEL_29;
  }
  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v29, @"KBBSerialNumber", 0, 0);
  int v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  KBBSerialNumber = self->KBBSerialNumber;
  self->KBBSerialNumber = v34;

  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v36, @"KGBSerialNumber", 0, 0);
  id v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  KGBSerialNumber = self->KGBSerialNumber;
  self->KGBSerialNumber = v37;

  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v4, v39, @"DisplayMaxDuration", (uint64_t)&unk_26D163368, &unk_26D163380, &unk_26D163398, 0);
  uint64_t v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  displayMaxDuration = self->displayMaxDuration;
  self->displayMaxDuration = v40;

  uint64_t v45 = objc_msgSend_sharedSingleton(CRFDRDeviceController, v42, v43, v44);
  objc_msgSend_getHandlerForDevice(v45, v46, v47, v48);
  long long v49 = (CRFDRBaseDeviceHandler *)objc_claimAutoreleasedReturnValue();
  handler = self->handler;
  self->handler = v49;

  if (!self->handler)
  {
    id v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_21FC66120();
    }
LABEL_29:

    char v180 = 1;
    goto LABEL_12;
  }
  uint64_t HasEntitlement = objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v51, @"com.apple.private.corerepair.factoryservice", v52);
  objc_msgSend_setAllowFactoryReset_(self->handler, v54, HasEntitlement, v55);
  if (self->keyBlob) {
    objc_msgSend_setAllowMissingData_(self->handler, v56, 1, v57);
  }
  self->enableStagedSeal = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v56, @"enableStagedSeal", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC66460();
    }
    goto LABEL_11;
  }
  self->ignoreStagedData = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v58, @"ignoreStagedData", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6642C();
    }
    goto LABEL_11;
  }
  self->_skipStageEAN = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v60, @"skipStageEAN", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC663F8();
    }
    goto LABEL_11;
  }
  self->_allowUsedPart = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v61, @"allowUsedPart", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC663C4();
    }
    goto LABEL_11;
  }
  self->_allowSelfService = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v62, @"allowSelfService", 0, &v180);
  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC66390();
    }
    goto LABEL_11;
  }
  int64_t v63 = (void *)MEMORY[0x263EFFA08];
  uint64_t v64 = objc_opt_class();
  uint64_t v67 = objc_msgSend_setWithObject_(v63, v65, v64, v66);
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v68, @"patchDataClasses", (uint64_t)v67, 32, 0, &v180);
  uint64_t v69 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchDataClasses = self->_patchDataClasses;
  self->_patchDataClasses = v69;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC6635C();
    }
    goto LABEL_11;
  }
  id v71 = (void *)MEMORY[0x263EFFA08];
  uint64_t v72 = objc_opt_class();
  uint64_t v75 = objc_msgSend_setWithObject_(v71, v73, v72, v74);
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v76, @"patchDataInstances", (uint64_t)v75, 32, 0, &v180);
  uint64_t v77 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchDataInstances = self->_patchDataInstances;
  self->_patchDataInstances = v77;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC66328();
    }
    goto LABEL_11;
  }
  uint64_t v79 = (void *)MEMORY[0x263EFFA08];
  uint64_t v80 = objc_opt_class();
  v83 = objc_msgSend_setWithObject_(v79, v81, v80, v82);
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v84, @"patchValues", (uint64_t)v83, 32, 0, &v180);
  uint64_t v85 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchValues = self->_patchValues;
  self->_patchValues = v85;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC662F4();
    }
    goto LABEL_11;
  }
  v87 = (void *)MEMORY[0x263EFFA08];
  uint64_t v88 = objc_opt_class();
  v91 = objc_msgSend_setWithObject_(v87, v89, v88, v90);
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v92, @"patchItems", (uint64_t)v91, 32, 0, &v180);
  int64_t v93 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchItems = self->_patchItems;
  self->_patchItems = v93;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC662C0();
    }
    goto LABEL_11;
  }
  uint64_t v97 = self->_patchItems;
  if (v97)
  {
    uint64_t v98 = objc_msgSend_decodePatchItems_(CRPatchUtils, v95, (uint64_t)v97, v96);
    if (!v98)
    {
      uint64_t v14 = handleForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_21FC66258();
      }
      goto LABEL_11;
    }
    uint64_t v14 = v98;
    id v99 = objc_opt_new();
    id v100 = objc_opt_new();
    uint64_t v101 = objc_opt_new();
    v175[0] = MEMORY[0x263EF8330];
    v175[1] = 3221225472;
    v175[2] = sub_21FC43F58;
    v175[3] = &unk_26452AB98;
    id v170 = v99;
    id v176 = v170;
    id v169 = v100;
    id v177 = v169;
    id v168 = v101;
    id v178 = v168;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v14, v102, (uint64_t)v175, v103);
    objc_storeStrong((id *)&self->_patchDataClasses, v99);
    objc_storeStrong((id *)&self->_patchDataInstances, v100);
    objc_storeStrong((id *)&self->_patchValues, v101);
    if (!self->_patchDataClasses || !self->_patchDataInstances || !self->_patchValues)
    {
      id v109 = handleForCategory(0);
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        sub_21FC6628C();
      }

      goto LABEL_11;
    }
  }
  v104 = objc_opt_new();
  objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(v4, v105, @"updateProperties", (uint64_t)v104, &v180);
  uint64_t v106 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  updateProperties = self->_updateProperties;
  self->_updateProperties = v106;

  if (v180)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC66224();
    }
    goto LABEL_11;
  }
  objc_msgSend_NSSetFromKey_defaultValue_failed_(v4, v108, @"partSPC", 0, 0);
  uint64_t v110 = (NSSet *)objc_claimAutoreleasedReturnValue();
  partSPC = self->_partSPC;
  self->_partSPC = v110;

  objc_msgSend__getCRFDRMetaDataDictionary(self, v112, v113, v114);
  long long v115 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  metadataDict = self->metadataDict;
  self->metadataDict = v115;

  id v120 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v117, v118, v119);
  id v174 = 0;
  uint64_t v14 = objc_msgSend_copyPathForPersonalizedData_error_(v120, v121, 2, (uint64_t)&v174);
  id v122 = v174;

  v123 = handleForCategory(0);
  uint64_t v124 = v123;
  if (!v14 || v122)
  {
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
      sub_21FC66154();
    }

    char v180 = 1;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v182 = v14;
    _os_log_impl(&dword_21FBF2000, v124, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
  }

  id v173 = 0;
  objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v125, (uint64_t)v14, 2, &v173);
  id v126 = (NSData *)objc_claimAutoreleasedReturnValue();
  id v127 = v173;
  apTicketData = self->apTicketData;
  self->apTicketData = v126;

  if (!self->apTicketData || v127)
  {
    v160 = handleForCategory(0);
    if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR)) {
      sub_21FC661BC();
    }

    char v180 = 1;
    goto LABEL_11;
  }
  v129 = objc_opt_new();
  int isHorizonRamdiskBootInApticket = objc_msgSend_isHorizonRamdiskBootInApticket_(v129, v130, (uint64_t)self->apTicketData, v131);

  if (!isHorizonRamdiskBootInApticket)
  {
LABEL_84:
    if (objc_msgSend__urlsOverrideIsAllowed(self, v133, v134, v135))
    {
      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v148, @"CAURL", 0, 0);
      v149 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRCAURL = self->FDRCAURL;
      self->FDRCAURL = v149;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v151, @"DSURL", 0, 0);
      v152 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRDSURL = self->FDRDSURL;
      self->FDRDSURL = v152;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v154, @"SealingURL", 0, 0);
      v155 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRSealingURL = self->FDRSealingURL;
      self->FDRSealingURL = v155;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v157, @"TrustObjectURL", 0, 0);
      v158 = (NSString *)objc_claimAutoreleasedReturnValue();
      trustObjectURL = self->trustObjectURL;
      self->trustObjectURL = v158;
    }
    else
    {
      trustObjectURL = handleForCategory(0);
      if (os_log_type_enabled(trustObjectURL, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, trustObjectURL, OS_LOG_TYPE_DEFAULT, "No permission for URLs override, default URLs are used", buf, 2u);
      }
    }

    AMSupportLogSetHandler();
    AMSupportLogSetHandler();
    v161 = (NSMutableDictionary *)objc_opt_new();
    postSealingManifest = self->postSealingManifest;
    self->postSealingManifest = v161;

    v163 = (NSMutableDictionary *)objc_opt_new();
    preSealingManifest = self->preSealingManifest;
    self->preSealingManifest = v163;

    v165 = (NSMutableDictionary *)objc_opt_new();
    repairStats = self->repairStats;
    self->repairStats = v165;

    self->sealCount = 0;
    goto LABEL_11;
  }
  v136 = handleForCategory(0);
  if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v136, OS_LOG_TYPE_DEFAULT, "Ramdisk booting... Fetch local apticket", buf, 2u);
  }

  v137 = objc_opt_new();
  id v172 = 0;
  v140 = objc_msgSend_getPathForApTicketWithError_(v137, v138, (uint64_t)&v172, v139);
  id v141 = v172;

  v142 = handleForCategory(0);
  v143 = v142;
  if (!v140 || v141)
  {
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
      sub_21FC66154();
    }

    char v180 = 1;
  }
  else
  {
    if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v182 = v140;
      _os_log_impl(&dword_21FBF2000, v143, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
    }

    id v171 = 0;
    objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v144, (uint64_t)v140, 2, &v171);
    v145 = (NSData *)objc_claimAutoreleasedReturnValue();
    id v146 = v171;
    v147 = self->apTicketData;
    self->apTicketData = v145;

    if (self->apTicketData && !v146)
    {
      uint64_t v14 = v140;
      goto LABEL_84;
    }
    v167 = handleForCategory(0);
    if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR)) {
      sub_21FC661BC();
    }

    char v180 = 1;
  }

LABEL_12:
  if (!v180)
  {
    self = self;
    id v16 = self;
    goto LABEL_14;
  }
LABEL_13:
  id v16 = 0;
LABEL_14:

  return v16;
}

- (id)initForRegisterChangeWithParameters:(id)a3
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v75 = 0;
  if (!objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v5, @"com.apple.private.corerepair.fdr", v6))goto LABEL_40; {
  v74.receiver = self;
  }
  v74.super_class = (Class)CRFDRSeal;
  v7 = [(CRFDRSeal *)&v74 init];
  self = v7;
  if (v7)
  {
    FDRPersistentDataPath = v7->FDRPersistentDataPath;
    v7->FDRPersistentDataPath = 0;

    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v77 = v4;
      _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "initWithParameters: %@", buf, 0xCu);
    }

    self->enableProxy = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v10, @"enableProxy", 0, &v75);
    objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v11, @"datapath", 0, 0);
    uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    int v13 = self->FDRPersistentDataPath;
    self->FDRPersistentDataPath = v12;

    id v16 = self->FDRPersistentDataPath;
    if (v16)
    {
      objc_msgSend_URLWithString_(NSURL, v14, (uint64_t)v16, v15);
      uint64_t v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
      dataDirectoryURL = self->dataDirectoryURL;
      self->dataDirectoryURL = v17;
    }
    if (self->dataDirectoryURL)
    {
      objc_msgSend__getCRFDRMetaDataDictionary(self, v14, (uint64_t)v16, v15);
      uint64_t v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      metadataDict = self->metadataDict;
      self->metadataDict = v19;

      id v24 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v21, v22, v23);
      id v73 = 0;
      uint64_t v26 = objc_msgSend_copyPathForPersonalizedData_error_(v24, v25, 2, (uint64_t)&v73);
      id v27 = v73;

      int v28 = handleForCategory(0);
      uint64_t v29 = v28;
      if (!v26 || v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_21FC66154();
        }

        char v75 = 1;
        goto LABEL_38;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v77 = v26;
        _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
      }

      id v72 = 0;
      objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v30, (uint64_t)v26, 2, &v72);
      uint64_t v31 = (NSData *)objc_claimAutoreleasedReturnValue();
      id v32 = v72;
      apTicketData = self->apTicketData;
      self->apTicketData = v31;

      if (!self->apTicketData || v32)
      {
        uint64_t v66 = handleForCategory(0);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
          sub_21FC661BC();
        }

        char v75 = 1;
        goto LABEL_38;
      }
      int v34 = objc_opt_new();
      int isHorizonRamdiskBootInApticket = objc_msgSend_isHorizonRamdiskBootInApticket_(v34, v35, (uint64_t)self->apTicketData, v36);

      if (!isHorizonRamdiskBootInApticket)
      {
LABEL_24:
        if (objc_msgSend__urlsOverrideIsAllowed(self, v38, v39, v40))
        {
          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v53, @"CAURL", 0, 0);
          uint64_t v54 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRCAURL = self->FDRCAURL;
          self->FDRCAURL = v54;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v56, @"DSURL", 0, 0);
          uint64_t v57 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRDSURL = self->FDRDSURL;
          self->FDRDSURL = v57;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v59, @"SealingURL", 0, 0);
          uint64_t v60 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRSealingURL = self->FDRSealingURL;
          self->FDRSealingURL = v60;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v62, @"TrustObjectURL", 0, 0);
          int64_t v63 = (NSString *)objc_claimAutoreleasedReturnValue();
          trustObjectURL = self->trustObjectURL;
          self->trustObjectURL = v63;
        }
        else
        {
          trustObjectURL = handleForCategory(0);
          if (os_log_type_enabled(trustObjectURL, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FBF2000, trustObjectURL, OS_LOG_TYPE_DEFAULT, "No permission for URLs override, default URLs are used", buf, 2u);
          }
        }

        AMSupportLogSetHandler();
        AMSupportLogSetHandler();
LABEL_38:

        goto LABEL_39;
      }
      uint64_t v41 = handleForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "Ramdisk booting... Fetch local apticket", buf, 2u);
      }

      uint64_t v42 = objc_opt_new();
      id v71 = 0;
      uint64_t v45 = objc_msgSend_getPathForApTicketWithError_(v42, v43, (uint64_t)&v71, v44);
      id v46 = v71;

      uint64_t v47 = handleForCategory(0);
      uint64_t v48 = v47;
      if (!v45 || v46)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_21FC66154();
        }

        char v75 = 1;
      }
      else
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v77 = v45;
          _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
        }

        id v70 = 0;
        objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x263EFF8F8], v49, (uint64_t)v45, 2, &v70);
        uint64_t v50 = (NSData *)objc_claimAutoreleasedReturnValue();
        id v51 = v70;
        uint64_t v52 = self->apTicketData;
        self->apTicketData = v50;

        if (self->apTicketData && !v51)
        {
          uint64_t v26 = v45;
          goto LABEL_24;
        }
        uint64_t v69 = handleForCategory(0);
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          sub_21FC661BC();
        }

        char v75 = 1;
      }
    }
    else
    {
      uint64_t v65 = handleForCategory(0);
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
        sub_21FC660EC();
      }

      char v75 = 1;
    }
  }
LABEL_39:
  if (!v75)
  {
    self = self;
    uint64_t v67 = self;
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v67 = 0;
LABEL_41:

  return v67;
}

- (BOOL)generateFinalData
{
  uint64_t v196 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  id v179 = (id)v4;
  if (v3) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    v181 = handleForCategory(0);
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR)) {
      sub_21FC65F4C();
    }
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = objc_opt_new();
    char v180 = (void *)v8;
    v181 = v7;
    if (v7) {
      BOOL v9 = v8 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_21FC65F4C();
      }
      BOOL v6 = 0;
    }
    else
    {
      v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = (void *)v11;
      if (v10 && v11)
      {
        uint64_t v13 = objc_opt_new();
        uint64_t v14 = objc_opt_new();
        id v176 = v13;
        id v178 = (void *)v14;
        if (v13) {
          BOOL v18 = v14 == 0;
        }
        else {
          BOOL v18 = 1;
        }
        BOOL v6 = !v18;
        if (v18)
        {
          p_super = handleForCategory(0);
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
            sub_21FC65F4C();
          }
        }
        else
        {
          BOOL v172 = v6;
          p_makeClasses = (void **)&self->_makeClasses;
          id v175 = v12;
          location = (void **)&self->_makeClasses;
          if (objc_msgSend_count(self->_makeClasses, v15, v16, v17))
          {
            unint64_t v23 = 0;
            do
            {
              id v24 = objc_msgSend_objectAtIndexedSubscript_(self->_makeClasses, v20, v23, v22);
              id v27 = objc_msgSend_objectAtIndexedSubscript_(self->_makeInstances, v25, v23, v26);
              uint64_t v30 = objc_msgSend_objectForKey_(self->_claimDict, v28, (uint64_t)v24, v29);

              if (!v30)
              {
                uint64_t v36 = objc_msgSend_count(self->_currentClasses, v31, v32, v33);
                id v37 = v10;
                id v38 = v12;
                if (v36)
                {
                  unint64_t v39 = 0;
                  do
                  {
                    uint64_t v40 = objc_msgSend_objectAtIndexedSubscript_(self->_currentClasses, v34, v39, v35);
                    if (objc_msgSend_isEqual_(v24, v41, (uint64_t)v40, v42))
                    {
                      uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(self->_currentInstances, v43, v39, v44);
                      char isEqual = objc_msgSend_isEqual_(v27, v46, (uint64_t)v45, v47);

                      if (isEqual)
                      {
                        uint64_t v12 = v175;
                        id v37 = v176;
                        id v38 = v178;
                        goto LABEL_37;
                      }
                    }
                    else
                    {
                    }
                    ++v39;
                  }
                  while (objc_msgSend_count(self->_currentClasses, v34, v49, v35) > v39);
                  id v37 = v10;
                  uint64_t v12 = v175;
                  id v38 = v175;
LABEL_37:
                  p_makeClasses = (void **)&self->_makeClasses;
                }
                objc_msgSend_addObject_(v37, v34, (uint64_t)v24, v35);
                objc_msgSend_addObject_(v38, v50, (uint64_t)v27, v51);
              }

              ++v23;
            }
            while (objc_msgSend_count(*p_makeClasses, v52, v53, v54) > v23);
          }
          if (objc_msgSend_count(self->_currentClasses, v20, v21, v22))
          {
            unint64_t v58 = 0;
            do
            {
              id v59 = objc_msgSend_objectAtIndexedSubscript_(self->_currentClasses, v55, v58, v57);
              uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(self->_currentInstances, v60, v58, v61);
              if (objc_msgSend_isEqualToString_(v59, v63, @"seal", v64))
              {
                objc_storeStrong((id *)&self->_sealedDataInstance, v62);
              }
              else if ((objc_msgSend_containsObject_(*location, v65, (uint64_t)v59, v66) & 1) == 0)
              {
                uint64_t v69 = objc_msgSend_objectForKey_(self->_updateClassDict, v67, (uint64_t)v59, v68);

                if (!v69)
                {
                  id v72 = objc_msgSend_objectForKey_(self->_claimDict, v70, (uint64_t)v59, v71);

                  if (!v72)
                  {
                    id v73 = handleForCategory(0);
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      uint64_t v193 = (uint64_t)v59;
                      __int16 v194 = 2112;
                      v195 = v62;
                      _os_log_impl(&dword_21FBF2000, v73, OS_LOG_TYPE_DEFAULT, "Added current data to merged data: %@-%@", buf, 0x16u);
                    }

                    objc_msgSend_addObject_(v3, v74, (uint64_t)v59, v75);
                    objc_msgSend_addObject_(v179, v76, (uint64_t)v62, v77);
                    objc_msgSend_addObject_(v181, v78, (uint64_t)v59, v79);
                    objc_msgSend_addObject_(v180, v80, (uint64_t)v62, v81);
                  }
                }
              }

              ++v58;
            }
            while (objc_msgSend_count(self->_currentClasses, v82, v83, v84) > v58);
          }
          if (objc_msgSend_count(v10, v55, v56, v57))
          {
            unint64_t v88 = 0;
            do
            {
              uint64_t v89 = objc_msgSend_objectAtIndexedSubscript_(v10, v85, v88, v87);
              uint64_t v92 = objc_msgSend_objectAtIndexedSubscript_(v12, v90, v88, v91);
              v95 = objc_msgSend_objectForKey_(self->_updateClassDict, v93, (uint64_t)v89, v94);

              if (!v95)
              {
                uint64_t v98 = objc_msgSend_objectForKey_(self->_claimDict, v96, (uint64_t)v89, v97);

                if (!v98)
                {
                  id v99 = handleForCategory(0);
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v193 = (uint64_t)v89;
                    __int16 v194 = 2112;
                    v195 = v92;
                    _os_log_impl(&dword_21FBF2000, v99, OS_LOG_TYPE_DEFAULT, "Added make data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v181, v100, (uint64_t)v89, v101);
                  objc_msgSend_addObject_(v180, v102, (uint64_t)v92, v103);
                }
              }

              ++v88;
            }
            while (objc_msgSend_count(v10, v104, v105, v106) > v88);
          }
          if (objc_msgSend_count(v176, v85, v86, v87))
          {
            unint64_t v109 = 0;
            do
            {
              uint64_t v110 = objc_msgSend_objectAtIndexedSubscript_(v176, v107, v109, v108);
              uint64_t v113 = objc_msgSend_objectAtIndexedSubscript_(v178, v111, v109, v112);
              long long v116 = objc_msgSend_objectForKey_(self->_updateClassDict, v114, (uint64_t)v110, v115);

              if (!v116)
              {
                uint64_t v119 = objc_msgSend_objectForKey_(self->_claimDict, v117, (uint64_t)v110, v118);

                if (!v119)
                {
                  id v120 = handleForCategory(0);
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v193 = (uint64_t)v110;
                    __int16 v194 = 2112;
                    v195 = v113;
                    _os_log_impl(&dword_21FBF2000, v120, OS_LOG_TYPE_DEFAULT, "Added non-make data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v3, v121, (uint64_t)v110, v122);
                  objc_msgSend_addObject_(v179, v123, (uint64_t)v113, v124);
                  objc_msgSend_addObject_(v181, v125, (uint64_t)v110, v126);
                  objc_msgSend_addObject_(v180, v127, (uint64_t)v113, v128);
                }
              }

              ++v109;
            }
            while (objc_msgSend_count(v176, v129, v130, v131) > v109);
          }
          obuint64_t j = v10;
          long long v188 = 0u;
          long long v189 = 0u;
          long long v186 = 0u;
          long long v187 = 0u;
          v132 = self->_updateClassDict;
          uint64_t v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v132, v133, (uint64_t)&v186, (uint64_t)v191, 16);
          if (v134)
          {
            uint64_t v137 = v134;
            uint64_t v138 = *(void *)v187;
            do
            {
              for (uint64_t i = 0; i != v137; ++i)
              {
                if (*(void *)v187 != v138) {
                  objc_enumerationMutation(v132);
                }
                uint64_t v140 = *(void *)(*((void *)&v186 + 1) + 8 * i);
                id v141 = objc_msgSend_objectForKeyedSubscript_(self->_updateClassDict, v135, v140, v136);
                v144 = objc_msgSend_objectForKey_(self->_claimDict, v142, v140, v143);

                if (!v144)
                {
                  v145 = handleForCategory(0);
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v193 = v140;
                    __int16 v194 = 2112;
                    v195 = v141;
                    _os_log_impl(&dword_21FBF2000, v145, OS_LOG_TYPE_DEFAULT, "Added update data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v3, v146, v140, v147);
                  objc_msgSend_addObject_(v179, v148, (uint64_t)v141, v149);
                  objc_msgSend_addObject_(v181, v150, v140, v151);
                  objc_msgSend_addObject_(v180, v152, (uint64_t)v141, v153);
                }
              }
              uint64_t v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v132, v135, (uint64_t)&v186, (uint64_t)v191, 16);
            }
            while (v137);
          }
          id v174 = v3;

          long long v184 = 0u;
          long long v185 = 0u;
          long long v182 = 0u;
          long long v183 = 0u;
          v154 = self->_claimDict;
          uint64_t v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v155, (uint64_t)&v182, (uint64_t)v190, 16);
          if (v156)
          {
            uint64_t v159 = v156;
            uint64_t v160 = *(void *)v183;
            do
            {
              for (uint64_t j = 0; j != v159; ++j)
              {
                if (*(void *)v183 != v160) {
                  objc_enumerationMutation(v154);
                }
                uint64_t v162 = *(void *)(*((void *)&v182 + 1) + 8 * j);
                v163 = objc_msgSend_objectForKeyedSubscript_(self->_claimDict, v157, v162, v158);
                v164 = handleForCategory(0);
                if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v193 = v162;
                  __int16 v194 = 2112;
                  v195 = v163;
                  _os_log_impl(&dword_21FBF2000, v164, OS_LOG_TYPE_DEFAULT, "Added claim data to merged data: %@-%@", buf, 0x16u);
                }

                objc_msgSend_addObject_(v181, v165, v162, v166);
                objc_msgSend_addObject_(v180, v167, (uint64_t)v163, v168);
              }
              uint64_t v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v157, (uint64_t)&v182, (uint64_t)v190, 16);
            }
            while (v159);
          }

          v10 = obj;
          objc_storeStrong(location, obj);
          uint64_t v12 = v175;
          objc_storeStrong((id *)&self->_makeInstances, v175);
          v3 = v174;
          objc_storeStrong((id *)&self->_recoverDataClasses, v174);
          objc_storeStrong((id *)&self->_recoverDataInstances, v179);
          objc_storeStrong((id *)&self->_mergedDataClasses, v181);
          id v169 = v180;
          p_super = &self->_mergedDataInstances->super.super;
          self->_mergedDataInstances = v169;
          BOOL v6 = v172;
        }
      }
      else
      {
        id v176 = handleForCategory(0);
        if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR)) {
          sub_21FC65F4C();
        }
        BOOL v6 = 0;
      }
    }
  }

  return v6;
}

- (int64_t)registerChangeForComponent:(id)a3 fdrError:(id *)a4
{
  id v6 = a3;
  BOOL v9 = objc_msgSend_getRegisterChangeDictUsingComponentAuthName_(CRFDRBaseDeviceHandler, v7, (uint64_t)v6, v8);
  uint64_t v13 = v9;
  if (v9 && objc_msgSend_count(v9, v10, v11, v12))
  {
    int64_t v15 = objc_msgSend_sealWithDataClass_fdrError_registerOnly_(self, v14, (uint64_t)v13, (uint64_t)a4, 1);
  }
  else
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC66564();
    }

    int64_t v15 = -12;
  }

  return v15;
}

- (int64_t)seal:(id *)a3 oldSealingManifest:(id *)a4 newSealingManifest:(id *)a5 stats:(id *)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  handler = self->handler;
  partSPC = self->_partSPC;
  id v59 = 0;
  objc_msgSend_getClaimDataClassesAndInstancesWithPartSPC_withError_(handler, a2, (uint64_t)partSPC, (uint64_t)&v59);
  uint64_t v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v14 = v59;
  claimDict = self->_claimDict;
  self->_claimDict = v13;

  uint64_t v16 = handleForCategory(0);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = self->_claimDict;
    *(_DWORD *)buf = 138412290;
    uint64_t v61 = v17;
    _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "Claim classes: %@", buf, 0xCu);
  }

  if (!self->handler || v14)
  {
    uint64_t v30 = handleForCategory(0);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_21FC665CC();
    }

    if (a3) {
      *a3 = v14;
    }
    int64_t v19 = -11;
  }
  else
  {
    int64_t v19 = objc_msgSend_sealWithDataClass_fdrError_registerOnly_(self, v18, (uint64_t)self->_claimDict, (uint64_t)a3, 0);
    if (MGGetBoolAnswer())
    {
      if (a4) {
        objc_storeStrong(a4, self->preSealingManifest);
      }
      if (a5)
      {
        p_postSealingManifest = &self->postSealingManifest;
        postSealingManifest = self->postSealingManifest;
        if (!postSealingManifest || !objc_msgSend_count(postSealingManifest, v20, v21, v22)) {
          p_postSealingManifest = &self->preSealingManifest;
        }
        objc_storeStrong(a5, *p_postSealingManifest);
      }
    }
    int v28 = objc_msgSend_allObjects(self->_partSPC, v20, v21, v22);
    if (v28)
    {
      p_repairStats = (void **)&self->repairStats;
      objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v25, (uint64_t)v28, @"partSPC");
    }
    else
    {
      uint64_t v31 = objc_msgSend_null(MEMORY[0x263EFF9D0], v25, v26, v27);
      p_repairStats = (void **)&self->repairStats;
      objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v32, (uint64_t)v31, @"partSPC");
    }
    uint64_t v35 = objc_msgSend_numberWithInt_(NSNumber, v33, self->sealCount, v34);
    objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v36, (uint64_t)v35, @"SealCount");

    uint64_t v40 = (void *)MGGetStringAnswer();
    if (v40)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v37, (uint64_t)v40, @"ProductType");
    }
    else
    {
      uint64_t v41 = objc_msgSend_null(MEMORY[0x263EFF9D0], v37, v38, v39);
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v42, (uint64_t)v41, @"ProductType");
    }
    uint64_t v49 = objc_msgSend_summarizePatchInputs(self, v43, v44, v45);
    if (v49)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v46, (uint64_t)v49, @"patchInputs");
    }
    else
    {
      uint64_t v50 = objc_msgSend_null(MEMORY[0x263EFF9D0], v46, v47, v48);
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v51, (uint64_t)v50, @"patchInputs");
    }
    uint64_t v55 = self->_partSPC;
    if (v55)
    {
      if ((unint64_t)objc_msgSend_count(v55, v52, v53, v54) >= 2)
      {
        failedSPC = self->_failedSPC;
        if (failedSPC) {
          objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v56, (uint64_t)failedSPC, @"failedSPC");
        }
      }
    }
    if (a6) {
      objc_storeStrong(a6, *p_repairStats);
    }
  }

  return v19;
}

- (int64_t)prefetchPermissionsWith:(__AMFDR *)a3 returnError:(id *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  uint64_t v7 = (NSString *)AMFDRSealingMapCopyInstanceForClass();
  sealedDataInstance = self->_sealedDataInstance;
  self->_sealedDataInstance = v7;

  if (!self->_sealedDataInstance)
  {
    BOOL v9 = @"Could not get Sealed Data Instance";
    uint64_t v10 = -42;
LABEL_3:
    uint64_t v11 = sub_21FC02E70((void *)v10, v9, 0);

    goto LABEL_11;
  }
  char appended = AMFDRDataAppendPermissionsString();
  if (Mutable && (appended & 1) != 0)
  {
    uint64_t v13 = handleForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFMutableStringRef v20 = Mutable;
      _os_log_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr:%@", buf, 0xCu);
    }

    AMFDRSetOption();
    if ((AMFDRPermissionsRequest() & 1) == 0)
    {
      BOOL v9 = @"Failed to request FDR permissions";
      uint64_t v10 = -83;
      goto LABEL_3;
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"AMFDRCreatePermissionsString GET Seal failed", 0);
  }
LABEL_11:
  if (a4) {
    *a4 = v11;
  }
  AMSupportSafeRelease();
  if (v11) {
    int64_t v17 = objc_msgSend_code(v11, v14, v15, v16);
  }
  else {
    int64_t v17 = 0;
  }

  return v17;
}

- (int64_t)prefetchPermissionsForSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v15 = a6;
  id v16 = a7;
  id v82 = a8;
  id v17 = a9;
  id v18 = a10;
  uint64_t v87 = 0;
  CFMutableStringRef v20 = objc_msgSend_setLocalAndRemotePermission_fdrRemote_(self, v19, (uint64_t)a5, (uint64_t)a4);
  uint64_t v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
  if (!v24)
  {
    uint64_t v69 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"Unable to create LocalAndRemotePermission for Sealing", 0);
    goto LABEL_35;
  }
  uint64_t v77 = a5;
  uint64_t v78 = v20;
  id v79 = v15;
  uint64_t v80 = v18;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v25 = v15;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v27)
  {
    uint64_t v30 = v27;
    uint64_t v31 = *(void *)v84;
    while (2)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v84 != v31) {
          objc_enumerationMutation(v25);
        }
        uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v25, v28, *(void *)(*((void *)&v83 + 1) + 8 * i), v29, v77);
        if (!AMFDRAppendPermissionsString())
        {
          uint64_t v69 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"AMFDRDataAppendPermissionsString Claim failed", 0);

          goto LABEL_30;
        }
      }
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v83, (uint64_t)v90, 16);
      if (v30) {
        continue;
      }
      break;
    }
  }

  if (!v16
    || !v82
    || (uint64_t v37 = objc_msgSend_count(v16, v34, v35, v36), v37 != objc_msgSend_count(v82, v38, v39, v40))
    || !objc_msgSend_count(v16, v34, v35, v36))
  {
LABEL_17:
    id v15 = v79;
    id v18 = v80;
    if (v17)
    {
      if (v80)
      {
        uint64_t v50 = objc_msgSend_count(v17, v34, v35, v36);
        if (v50 == objc_msgSend_count(v80, v51, v52, v53))
        {
          if (objc_msgSend_count(v17, v54, v55, v56))
          {
            unint64_t v59 = 0;
            while (1)
            {
              uint64_t v60 = objc_msgSend_objectAtIndexedSubscript_(v17, v57, v59, v58, v77);
              int64_t v63 = objc_msgSend_objectAtIndexedSubscript_(v18, v61, v59, v62);
              char appended = AMFDRDataAppendPermissionsString();

              if ((appended & 1) == 0) {
                break;
              }
              ++v59;
              id v18 = v80;
              if (objc_msgSend_count(v17, v65, v66, v67) <= v59) {
                goto LABEL_24;
              }
            }
            uint64_t v69 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"AMFDRDataAppendPermissionsString Patch failed", 0);
            goto LABEL_31;
          }
        }
      }
    }
LABEL_24:
    uint64_t v68 = handleForCategory(0);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v89 = v24;
      _os_log_impl(&dword_21FBF2000, v68, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr For Sealing :%@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
    CFMutableStringRef v20 = v78;
    if (AMFDRPermissionsRequest() & 1) != 0 && (AMFDRMigrateCredentials())
    {
      uint64_t v69 = 0;
    }
    else
    {
      uint64_t v71 = v87;
      uint64_t v69 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFADLL, @"Failed to request FDR permissions", v87);
    }
LABEL_35:
    id v70 = a3;
    if (!a3) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  uint64_t v41 = 0;
  while (1)
  {
    uint64_t v42 = objc_msgSend_objectAtIndexedSubscript_(v16, v34, v41, v36, v77);
    uint64_t v45 = objc_msgSend_objectAtIndexedSubscript_(v82, v43, v41, v44);
    char v46 = AMFDRDataAppendPermissionsString();

    if ((v46 & 1) == 0) {
      break;
    }
    if (objc_msgSend_count(v16, v47, v48, v49) <= (unint64_t)++v41) {
      goto LABEL_17;
    }
  }
  uint64_t v69 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFACLL, @"AMFDRDataAppendPermissionsString Make failed", 0);
LABEL_30:
  id v15 = v79;
LABEL_31:
  id v18 = v80;
  id v70 = a3;
  CFMutableStringRef v20 = v78;
  if (a3) {
LABEL_36:
  }
    id *v70 = v69;
LABEL_37:
  AMSupportSafeRelease();
  if (v69) {
    int64_t v75 = objc_msgSend_code(v69, v72, v73, v74);
  }
  else {
    int64_t v75 = 0;
  }

  return v75;
}

- (CRFDRSeal)sealWithDataClass:(id)a3 fdrError:(id *)a4 registerOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v203 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v12 = objc_msgSend__baseFDROptionsWithDataStore_(self, v8, @"Local", v9);
  if (!v12)
  {
    uint64_t v139 = handleForCategory(0);
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      sub_21FC66634();
    }
    goto LABEL_82;
  }
  uint64_t v13 = objc_msgSend__baseFDROptionsWithDataStore_(self, v10, @"Remote", v11);
  if (!v13)
  {
    uint64_t v139 = handleForCategory(0);
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR)) {
      sub_21FC66668();
    }
LABEL_82:

    uint64_t v60 = 0;
    id v24 = 0;
    id v14 = 0;
LABEL_89:
    uint64_t v20 = -3;
    goto LABEL_42;
  }
  id v14 = (void *)v13;
  uint64_t v15 = AMFDRCreateWithOptions();
  if (!v15)
  {
    uint64_t v140 = handleForCategory(0);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
      sub_21FC6669C();
    }
    goto LABEL_88;
  }
  uint64_t v16 = v15;
  uint64_t v17 = AMFDRCreateWithOptions();
  if (!v17)
  {
    uint64_t v140 = handleForCategory(0);
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR)) {
      sub_21FC666D0();
    }
LABEL_88:

    uint64_t v60 = 0;
    id v24 = 0;
    goto LABEL_89;
  }
  uint64_t v19 = v17;
  id v198 = 0;
  uint64_t v20 = objc_msgSend_setLocalAndRemoteTrustObject_fdrLocal_remoteTrustObjectDigest_fdrError_(self, v18, v17, v16, 0, &v198);
  id v21 = v198;
  if (v20) {
    BOOL v23 = 0;
  }
  else {
    BOOL v23 = v21 == 0;
  }
  if (!v23)
  {
    id v24 = v21;
    id v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC66704();
    }
LABEL_40:

LABEL_41:
    uint64_t v60 = 0;
    goto LABEL_42;
  }
  if (v5)
  {
    id v197 = 0;
    uint64_t v20 = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v22, v19, v16, &v197, v7, 1);
    id v24 = v197;
    id v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v200 = v20;
      __int16 v201 = 2112;
      id v202 = v24;
      _os_log_impl(&dword_21FBF2000, v25, OS_LOG_TYPE_DEFAULT, "RegisterChange status: %ld error: %@", buf, 0x16u);
    }
    goto LABEL_40;
  }
  id v196 = 0;
  uint64_t v20 = objc_msgSend_prefetchPermissionsWith_returnError_(self, v22, v19, (uint64_t)&v196);
  id v26 = v196;
  id v24 = v26;
  if (v20 || v26)
  {
    id v25 = handleForCategory(0);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC643F8();
    }
    goto LABEL_40;
  }
  handler = self->handler;
  partSPC = self->_partSPC;
  p_currentClasses = (void **)&self->_currentClasses;
  p_currentProperties = (void **)&self->_currentProperties;
  v195[1] = 0;
  p_currentInstances = (void **)&self->_currentInstances;
  objc_msgSend_getCurrentManifestDataClassesAndInstancesWithPartSPC_fdr_currentClasses_currentInstances_currentProperties_fdrError_(handler, v27, (uint64_t)partSPC, v19, &self->_currentClasses);
  uint64_t v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v24 = 0;
  manifestDataClassesAndInstances = self->manifestDataClassesAndInstances;
  self->manifestDataClassesAndInstances = v32;

  uint64_t v37 = self->manifestDataClassesAndInstances;
  if (!v37
    || !objc_msgSend_count(v37, v34, v35, v36)
    || v24
    || !*p_currentProperties
    || !objc_msgSend_count(*p_currentProperties, v38, v39, v40))
  {
    uint64_t v103 = handleForCategory(0);
    id v100 = a4;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
      sub_21FC6676C();
    }

    uint64_t v107 = objc_msgSend_domain(v24, v104, v105, v106);
    int isEqualToString = objc_msgSend_isEqualToString_(v107, v108, @"com.apple.corerepair", v109);

    if (!isEqualToString)
    {
      uint64_t v60 = 0;
      goto LABEL_55;
    }
    uint64_t v20 = objc_msgSend_code(v24, v98, v111, v99);
LABEL_53:
    uint64_t v60 = 0;
    goto LABEL_43;
  }
  uint64_t v41 = handleForCategory(0);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = *p_currentClasses;
    *(_DWORD *)buf = 138412290;
    uint64_t v200 = (uint64_t)v42;
    _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "Current data classes: %@", buf, 0xCu);
  }

  uint64_t v43 = handleForCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = *p_currentInstances;
    *(_DWORD *)buf = 138412290;
    uint64_t v200 = (uint64_t)v44;
    _os_log_impl(&dword_21FBF2000, v43, OS_LOG_TYPE_DEFAULT, "Current data instances: %@", buf, 0xCu);
  }

  uint64_t v45 = handleForCategory(0);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    char v46 = *p_currentProperties;
    *(_DWORD *)buf = 138412290;
    uint64_t v200 = (uint64_t)v46;
    _os_log_impl(&dword_21FBF2000, v45, OS_LOG_TYPE_DEFAULT, "Current properties: %@", buf, 0xCu);
  }

  uint64_t v49 = objc_msgSend_objectForKeyedSubscript_(self->manifestDataClassesAndInstances, v47, @"seal", v48);

  if (!v49)
  {
    uint64_t v20 = -3;
    sub_21FC02E70((void *)0xFFFFFFFFFFFFFFFDLL, @"manifestDataClassesAndInstances missing seal", 0);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  uint64_t v51 = self->handler;
  uint64_t v52 = self->_partSPC;
  KBBSerialNumber = self->KBBSerialNumber;
  KGBSerialNumber = self->KGBSerialNumber;
  v195[0] = 0;
  int v55 = objc_msgSend_validateAndSetSerialNumbersUsingPartSPC_KGBSerialNumber_KBBSerialNumber_withError_(v51, v50, (uint64_t)v52, (uint64_t)KGBSerialNumber, KBBSerialNumber, v195);
  id v56 = v195[0];
  id v24 = v56;
  if (!v55 || v56)
  {
    id v100 = a4;
    if (a4) {
      *a4 = v56;
    }
    uint64_t v20 = objc_msgSend_code(v24, v57, v58, v59);
    uint64_t v112 = handleForCategory(0);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
      sub_21FC66A44();
    }

    goto LABEL_53;
  }
  long long v182 = v12;
  id v183 = v7;
  uint64_t v60 = objc_opt_new();
  if (objc_msgSend_count(*p_currentClasses, v61, v62, v63))
  {
    unint64_t v66 = 0;
    do
    {
      uint64_t v67 = NSString;
      uint64_t v68 = objc_msgSend_objectAtIndexedSubscript_(*p_currentClasses, v64, v66, v65);
      objc_msgSend_objectAtIndexedSubscript_(*p_currentInstances, v69, v66, v70);
      uint64_t v71 = v60;
      uint64_t v73 = v72 = p_currentClasses;
      uint64_t v76 = objc_msgSend_stringWithFormat_(v67, v74, @"%@-%@", v75, v68, v73);

      p_currentClasses = v72;
      uint64_t v60 = v71;

      objc_msgSend_addObject_(v71, v77, (uint64_t)v76, v78);
      ++v66;
    }
    while (objc_msgSend_count(*p_currentClasses, v79, v80, v81) > v66);
  }
  id v82 = NSString;
  long long v83 = objc_msgSend_objectForKeyedSubscript_(self->manifestDataClassesAndInstances, v64, @"seal", v65);
  long long v86 = objc_msgSend_stringWithFormat_(v82, v84, @"%@-%@", v85, @"seal", v83);
  objc_msgSend_addObject_(v60, v87, (uint64_t)v86, v88);

  objc_msgSend_setObject_forKeyedSubscript_(self->preSealingManifest, v89, (uint64_t)v60, @"dataClasses");
  objc_msgSend_setObject_forKeyedSubscript_(self->preSealingManifest, v90, (uint64_t)self->_currentProperties, @"properties");
  uint64_t v91 = self->handler;
  uint64_t v92 = self->_partSPC;
  id v194 = 0;
  objc_msgSend_getUpdateDataClassesAndInstancesWithPartSPC_withError_(v91, v93, (uint64_t)v92, (uint64_t)&v194);
  uint64_t v94 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  id v24 = v194;
  updateClassDict = self->_updateClassDict;
  self->_updateClassDict = v94;

  if (v24)
  {
    uint64_t v97 = handleForCategory(0);
    uint64_t v12 = v182;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      sub_21FC669DC();
    }

    uint64_t v20 = -45;
LABEL_37:
    id v7 = v183;
LABEL_42:
    id v100 = a4;
    goto LABEL_43;
  }
  uint64_t v113 = self->handler;
  uint64_t v114 = self->_partSPC;
  v193[1] = 0;
  p_makeClasses = &self->_makeClasses;
  p_makeInstances = &self->_makeInstances;
  int PropertiesDict_fdrError = objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makeClasses_makeInstances_makePropertiesDict_fdrError_(v113, v96, (uint64_t)v114, v19);
  id v24 = 0;
  long long v116 = handleForCategory(0);
  long long v117 = v116;
  uint64_t v12 = v182;
  if (PropertiesDict_fdrError && !v24)
  {
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v118 = *p_makeClasses;
      *(_DWORD *)buf = 138412290;
      uint64_t v200 = (uint64_t)v118;
      _os_log_impl(&dword_21FBF2000, v117, OS_LOG_TYPE_DEFAULT, "Make data classes: %@", buf, 0xCu);
    }

    uint64_t v119 = handleForCategory(0);
    id v7 = v183;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      id v120 = *p_makeInstances;
      *(_DWORD *)buf = 138412290;
      uint64_t v200 = (uint64_t)v120;
      _os_log_impl(&dword_21FBF2000, v119, OS_LOG_TYPE_DEFAULT, "Make data instances: %@", buf, 0xCu);
    }

    uint64_t v121 = handleForCategory(0);
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      makeProperties = self->_makeProperties;
      *(_DWORD *)buf = 138412290;
      uint64_t v200 = (uint64_t)makeProperties;
      _os_log_impl(&dword_21FBF2000, v121, OS_LOG_TYPE_DEFAULT, "Make properties: %@", buf, 0xCu);
    }

    v123 = self->handler;
    uint64_t v124 = self->_partSPC;
    v193[0] = 0;
    int MinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error = objc_msgSend_getMinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error_(v123, v125, (uint64_t)v124, v16, v19, &self->_minimalSealingInstances, &self->_minimalSealedClasses, &self->_minimalSealedInstances, v193);
    id v127 = v193[0];
    id v24 = v127;
    if (MinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error
      && !v127)
    {
      uint64_t v129 = objc_msgSend_validateDisplaySwapped_lessThan_(self->handler, v128, (uint64_t)self->_partSPC, (uint64_t)self->displayMaxDuration);
      if (v129)
      {
        uint64_t v20 = v129;
        id v24 = 0;
        goto LABEL_42;
      }
      char FinalData = objc_msgSend_generateFinalData(self, v98, v130, v99);
      uint64_t v143 = handleForCategory(0);
      v144 = v143;
      if ((FinalData & 1) == 0)
      {
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
          sub_21FC668D8();
        }

        id v24 = 0;
        uint64_t v20 = -67;
        goto LABEL_37;
      }
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        v145 = *p_makeClasses;
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)v145;
        _os_log_impl(&dword_21FBF2000, v144, OS_LOG_TYPE_DEFAULT, "Final Make data classes: %@", buf, 0xCu);
      }

      id v146 = handleForCategory(0);
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v147 = *p_makeInstances;
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)v147;
        _os_log_impl(&dword_21FBF2000, v146, OS_LOG_TYPE_DEFAULT, "Final Make data instances: %@", buf, 0xCu);
      }

      v148 = handleForCategory(0);
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataClasses = self->_mergedDataClasses;
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)mergedDataClasses;
        _os_log_impl(&dword_21FBF2000, v148, OS_LOG_TYPE_DEFAULT, "Final Merged data classes: %@", buf, 0xCu);
      }

      v150 = handleForCategory(0);
      if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataInstances = self->_mergedDataInstances;
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)mergedDataInstances;
        _os_log_impl(&dword_21FBF2000, v150, OS_LOG_TYPE_DEFAULT, "Final Merged data instances: %@", buf, 0xCu);
      }

      v152 = handleForCategory(0);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
      {
        sealedDataInstance = self->_sealedDataInstance;
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)sealedDataInstance;
        _os_log_impl(&dword_21FBF2000, v152, OS_LOG_TYPE_DEFAULT, "Sealed data instance: %@", buf, 0xCu);
      }

      if ((objc_msgSend_validatePatchWithPartSPC_originalClasses_originalInstances_originalValues_validClasses_validInstances_(self->handler, v154, (uint64_t)self->_partSPC, (uint64_t)self->_patchDataClasses, self->_patchDataInstances, self->_patchValues, self->_mergedDataClasses, self->_mergedDataInstances) & 1) == 0)
      {
        id v171 = handleForCategory(0);
        if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR)) {
          sub_21FC668A4();
        }

        id v24 = 0;
        uint64_t v20 = -66;
        goto LABEL_127;
      }
      if (objc_msgSend_allowFactoryReset(self->handler, v155, v156, v157))
      {
        objc_msgSend_getExcludedPropertiesForFactoryReset(self->handler, v158, v159, v160);
        v161 = (NSArray *)objc_claimAutoreleasedReturnValue();
        removedProperties = self->removedProperties;
        self->removedProperties = v161;

        if (self->removedProperties)
        {
          v164 = handleForCategory(0);
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
          {
            v165 = self->removedProperties;
            *(_DWORD *)buf = 138412290;
            uint64_t v200 = (uint64_t)v165;
            _os_log_impl(&dword_21FBF2000, v164, OS_LOG_TYPE_DEFAULT, "FactoryReset: removedProperties:%@", buf, 0xCu);
          }

          AMFDRSetOption();
          AMFDRSetOption();
        }
        objc_msgSend_deleteLocalData_dataClass_(self, v163, (uint64_t)self->FDRPersistentDataPath, @"seal");
      }
      id v192 = 0;
      int DeviceStagedSealedFromEAN_error = objc_msgSend_queryDeviceStagedSealedFromEAN_error_(CRFDRUtils, v158, 0, (uint64_t)&v192);
      id v167 = v192;
      id v24 = v167;
      self->isStagedSealed = DeviceStagedSealedFromEAN_error;
      if (self->ignoreStagedData)
      {
        if (v167) {
          int v168 = 1;
        }
        else {
          int v168 = DeviceStagedSealedFromEAN_error;
        }
        if (v168 == 1)
        {
          id v169 = handleForCategory(0);
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FBF2000, v169, OS_LOG_TYPE_DEFAULT, "Ignore staged data", buf, 2u);
          }

          objc_msgSend_deleteLocalData_dataClass_(self, v170, (uint64_t)self->FDRPersistentDataPath, @"seal");
          self->isStagedSealed = 0;
        }
      }
      else if (v167)
      {
        BOOL v172 = handleForCategory(0);
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR)) {
          sub_21FC6683C();
        }

        uint64_t v20 = -3;
        goto LABEL_127;
      }
      id v173 = handleForCategory(0);
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
      {
        if (self->isStagedSealed) {
          id v174 = @"YES";
        }
        else {
          id v174 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v200 = (uint64_t)v174;
        _os_log_impl(&dword_21FBF2000, v173, OS_LOG_TYPE_DEFAULT, "Device is staged sealed: %@", buf, 0xCu);
      }

      if (self->enableStagedSeal)
      {
        if (self->isStagedSealed)
        {
          uint64_t v191 = 0;
          id v176 = (id *)&v191;
          uint64_t v177 = objc_msgSend_performStagedToStagedRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v191, v16, v19);
        }
        else
        {
          uint64_t v190 = 0;
          id v176 = (id *)&v190;
          uint64_t v177 = objc_msgSend_performRealToStagedRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v190, v16, v19);
        }
      }
      else if (self->isStagedSealed)
      {
        uint64_t v189 = 0;
        id v176 = (id *)&v189;
        uint64_t v177 = objc_msgSend_performStagedToRealRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v189, v16, v19);
      }
      else
      {
        uint64_t v188 = 0;
        id v176 = (id *)&v188;
        uint64_t v177 = objc_msgSend_performRealToRealRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v188, v16, v19);
      }
      uint64_t v20 = v177;
      id v178 = *v176;
      id v24 = v178;
      if (!v20 && !v178)
      {
        id v187 = 0;
        uint64_t v20 = objc_msgSend_verifyClaimCountAndSalesDistrictWithError_(self, v98, (uint64_t)&v187, v99);
        id v24 = v187;
        id v179 = handleForCategory(0);
        char v180 = v179;
        if (v20 || v24)
        {
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
            sub_21FC667D4();
          }
        }
        else
        {
          if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FBF2000, v180, OS_LOG_TYPE_DEFAULT, "AMFDRSeal SUCCESS", buf, 2u);
          }

          id v24 = 0;
          uint64_t v20 = 0;
        }
      }
LABEL_127:
      id v7 = v183;
      id v100 = a4;
      uint64_t v12 = v182;
      goto LABEL_43;
    }
    id v141 = handleForCategory(0);
    id v100 = a4;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR)) {
      sub_21FC6690C();
    }

LABEL_55:
    uint64_t v20 = -3;
    goto LABEL_43;
  }
  id v100 = a4;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
    sub_21FC66974();
  }

  uint64_t v134 = objc_msgSend_domain(v24, v131, v132, v133);
  int v137 = objc_msgSend_isEqualToString_(v134, v135, @"com.apple.corerepair", v136);

  if (v137) {
    uint64_t v20 = objc_msgSend_code(v24, v98, v138, v99);
  }
  else {
    uint64_t v20 = -26;
  }
  id v7 = v183;
LABEL_43:
  if (v100) {
    *id v100 = v24;
  }
  if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v98, (uint64_t)v24, v99) == 11) {
    uint64_t v101 = -13;
  }
  else {
    uint64_t v101 = v20;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return (CRFDRSeal *)v101;
}

- (id)_copyFDROptionsForPatch:(__AMFDR *)a3
{
  v116[15] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v3)
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_70;
    }
    goto LABEL_71;
  }
  uint64_t v4 = AMFDRGetOptions();
  if (!v4)
  {
    id v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
LABEL_70:
    }
      sub_21FC66A78();
LABEL_71:
    id v88 = 0;
    goto LABEL_66;
  }
  id v7 = v4;
  v115[0] = @"DataVersion";
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"DataVersion", v6);
  uint64_t v12 = (void *)v8;
  if (!v8)
  {
    uint64_t v8 = objc_msgSend_null(MEMORY[0x263EFF9D0], v9, v10, v11);
  }
  uint64_t v102 = (void *)v8;
  v116[0] = v8;
  v115[1] = @"APTicket";
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v7, v9, @"APTicket", v11);
  uint64_t v17 = (void *)v13;
  if (!v13)
  {
    uint64_t v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v14, v15, v16);
  }
  uint64_t v101 = (void *)v13;
  v116[1] = v13;
  v115[2] = @"DataDirectory";
  uint64_t v18 = objc_msgSend_objectForKeyedSubscript_(v7, v14, @"DataDirectory", v16);
  uint64_t v22 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = objc_msgSend_null(MEMORY[0x263EFF9D0], v19, v20, v21);
  }
  id v100 = (void *)v18;
  v116[2] = v18;
  v115[3] = @"UseSOCKSHost";
  uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v7, v19, @"UseSOCKSHost", v21);
  uint64_t v27 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = objc_msgSend_null(MEMORY[0x263EFF9D0], v24, v25, v26);
  }
  uint64_t v99 = (void *)v23;
  v116[3] = v23;
  v115[4] = @"UseSOCKSPort";
  uint64_t v28 = objc_msgSend_objectForKeyedSubscript_(v7, v24, @"UseSOCKSPort", v26);
  uint64_t v32 = (void *)v28;
  if (!v28)
  {
    uint64_t v28 = objc_msgSend_null(MEMORY[0x263EFF9D0], v29, v30, v31);
  }
  uint64_t v98 = (void *)v28;
  v116[4] = v28;
  v115[5] = @"EnableProxy";
  uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v7, v29, @"EnableProxy", v31);
  uint64_t v37 = (void *)v33;
  if (!v33)
  {
    uint64_t v33 = objc_msgSend_null(MEMORY[0x263EFF9D0], v34, v35, v36);
  }
  uint64_t v97 = (void *)v33;
  v116[5] = v33;
  v115[6] = @"EnableProxySsl";
  uint64_t v38 = objc_msgSend_objectForKeyedSubscript_(v7, v34, @"EnableProxySsl", v36);
  uint64_t v42 = (void *)v38;
  if (!v38)
  {
    uint64_t v38 = objc_msgSend_null(MEMORY[0x263EFF9D0], v39, v40, v41);
  }
  uint64_t v96 = (void *)v38;
  v116[6] = v38;
  v115[7] = @"CAURL";
  uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v7, v39, @"CAURL", v41);
  uint64_t v47 = (void *)v43;
  if (!v43)
  {
    uint64_t v43 = objc_msgSend_null(MEMORY[0x263EFF9D0], v44, v45, v46);
  }
  v95 = (void *)v43;
  v116[7] = v43;
  v115[8] = @"DSURL";
  uint64_t v51 = objc_msgSend_objectForKeyedSubscript_(v7, v44, @"DSURL", v46);
  uint64_t v112 = (void *)v51;
  if (!v51)
  {
    uint64_t v51 = objc_msgSend_null(MEMORY[0x263EFF9D0], v48, v49, v50);
  }
  uint64_t v94 = (void *)v51;
  v116[8] = v51;
  v115[9] = @"SealingURL";
  uint64_t v55 = objc_msgSend_objectForKeyedSubscript_(v7, v48, @"SealingURL", v50);
  uint64_t v111 = (void *)v55;
  if (!v55)
  {
    uint64_t v55 = objc_msgSend_null(MEMORY[0x263EFF9D0], v52, v53, v54);
  }
  uint64_t v107 = v32;
  int64_t v93 = (void *)v55;
  v116[9] = v55;
  v115[10] = @"TrustObjectURL";
  uint64_t v59 = objc_msgSend_objectForKeyedSubscript_(v7, v52, @"TrustObjectURL", v54);
  uint64_t v103 = (void *)v59;
  if (!v59)
  {
    uint64_t v59 = objc_msgSend_null(MEMORY[0x263EFF9D0], v56, v57, v58);
  }
  uint64_t v106 = v37;
  uint64_t v92 = (void *)v59;
  v116[10] = v59;
  v115[11] = @"ExtraSslRoots";
  uint64_t v60 = objc_msgSend_objectForKeyedSubscript_(v7, v56, @"ExtraSslRoots", v58);
  uint64_t v64 = (void *)v60;
  if (!v60)
  {
    uint64_t v60 = objc_msgSend_null(MEMORY[0x263EFF9D0], v61, v62, v63);
  }
  uint64_t v105 = v42;
  uint64_t v108 = v27;
  uint64_t v110 = v12;
  uint64_t v91 = (void *)v60;
  v116[11] = v60;
  v115[12] = @"TrustObjectDigest";
  uint64_t v65 = objc_msgSend_objectForKeyedSubscript_(v7, v61, @"TrustObjectDigest", v63);
  uint64_t v69 = (void *)v65;
  if (!v65)
  {
    uint64_t v65 = objc_msgSend_null(MEMORY[0x263EFF9D0], v66, v67, v68);
  }
  v104 = v47;
  uint64_t v109 = v17;
  uint64_t v70 = v3;
  uint64_t v90 = (void *)v65;
  v116[12] = v65;
  v115[13] = @"TrustObject";
  uint64_t v74 = objc_msgSend_objectForKeyedSubscript_(v7, v66, @"TrustObject", v68);
  uint64_t v75 = v74;
  if (!v74)
  {
    uint64_t v75 = objc_msgSend_null(MEMORY[0x263EFF9D0], v71, v72, v73);
  }
  uint64_t v76 = v22;
  v116[13] = v75;
  v115[14] = @"Permissions";
  uint64_t v80 = objc_msgSend_objectForKeyedSubscript_(v7, v71, @"Permissions", v73);
  uint64_t v81 = v80;
  if (!v80)
  {
    uint64_t v81 = objc_msgSend_null(MEMORY[0x263EFF9D0], v77, v78, v79);
  }
  v116[14] = v81;
  id v82 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v77, (uint64_t)v116, (uint64_t)v115, 15);
  objc_msgSend_addEntriesFromDictionary_(v70, v83, (uint64_t)v82, v84);

  if (!v80) {
  if (!v74)
  }

  id v3 = v70;
  if (!v69) {

  }
  if (!v64) {
  if (!v103)
  }

  uint64_t v85 = v111;
  if (!v111)
  {

    uint64_t v85 = 0;
  }

  long long v86 = v112;
  if (!v112)
  {

    long long v86 = 0;
  }

  if (!v104) {
  if (!v105)
  }

  if (!v106) {
  if (!v107)
  }

  if (!v108) {
  if (!v76)
  }

  if (!v109) {
  if (!v110)
  }

  uint64_t v87 = handleForCategory(0);
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v114 = v70;
    _os_log_impl(&dword_21FBF2000, v87, OS_LOG_TYPE_DEFAULT, "fdr options are :%@", buf, 0xCu);
  }

  id v88 = v70;
LABEL_66:

  return v88;
}

- (id)_baseFDROptionsWithDataStore:(id)a3
{
  v52[15] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (!v5)
  {
    uint64_t v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC66A78();
    }
    goto LABEL_47;
  }
  uint64_t v46 = MGCopyAnswer();
  if (!v46)
  {
    uint64_t v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      sub_21FC66AAC();
    }
LABEL_47:
    id v42 = 0;
    goto LABEL_38;
  }
  uint64_t FDRDataVersionForDevice = AMFDRSealingMapGetFDRDataVersionForDevice();
  uint64_t v10 = MEMORY[0x263EFFA88];
  uint64_t v11 = MEMORY[0x263EFFA80];
  v51[0] = @"CSRRefKeyCountersign";
  v51[1] = @"SignData";
  v52[0] = MEMORY[0x263EFFA88];
  v52[1] = MEMORY[0x263EFFA80];
  v52[2] = MEMORY[0x263EFFA80];
  v51[2] = @"VerifyData";
  v51[3] = @"Metadata";
  metadataDict = self->metadataDict;
  uint64_t v13 = (uint64_t)metadataDict;
  if (!metadataDict)
  {
    uint64_t v13 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  }
  uint64_t v44 = (void *)v13;
  v52[3] = v13;
  v51[4] = @"DataDirectory";
  dataDirectoryURL = self->dataDirectoryURL;
  uint64_t v15 = dataDirectoryURL;
  if (!dataDirectoryURL)
  {
    uint64_t v15 = objc_msgSend_null(MEMORY[0x263EFF9D0], v6, v7, v8);
  }
  v52[4] = v15;
  v51[5] = @"DataVersion";
  uint64_t v19 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, FDRDataVersionForDevice, v8);
  v52[5] = v19;
  v51[6] = @"DataStore";
  uint64_t v20 = v4;
  id v45 = v4;
  if (!v4)
  {
    uint64_t v20 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v18);
  }
  v52[6] = v20;
  v52[7] = v11;
  v51[7] = @"GetCombined";
  v51[8] = @"INST";
  v51[9] = @"EnableMultiRequest";
  v51[10] = @"SealIdentifiers";
  v52[10] = v10;
  v52[11] = v11;
  v51[11] = @"ForceSealing";
  v51[12] = @"APTicket";
  apTicketData = self->apTicketData;
  uint64_t v22 = apTicketData;
  v52[8] = v46;
  v52[9] = v10;
  if (!apTicketData)
  {
    uint64_t v22 = objc_msgSend_null(MEMORY[0x263EFF9D0], v16, v17, v18);
  }
  v52[12] = v22;
  v52[13] = v10;
  v51[13] = @"EnableGetManifest";
  v51[14] = @"EnableDigest";
  v52[14] = v10;
  uint64_t v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v16, (uint64_t)v52, (uint64_t)v51, 15);
  objc_msgSend_addEntriesFromDictionary_(v5, v24, (uint64_t)v23, v25);

  if (!apTicketData) {
  id v4 = v45;
  }
  if (!v45) {

  }
  if (dataDirectoryURL)
  {
    if (metadataDict) {
      goto LABEL_17;
    }
  }
  else
  {

    if (metadataDict) {
      goto LABEL_17;
    }
  }

LABEL_17:
  if (self->SOCKSHost && self->SOCKSPort)
  {
    uint64_t v26 = handleForCategory(0);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      SOCKSHost = self->SOCKSHost;
      SOCKSPort = self->SOCKSPort;
      *(_DWORD *)buf = 138412546;
      uint64_t v48 = SOCKSHost;
      __int16 v49 = 2112;
      uint64_t v50 = SOCKSPort;
      _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Sockhost and SockPort found:%@:%@", buf, 0x16u);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v5, v29, (uint64_t)self->SOCKSHost, @"UseSOCKSHost");
    objc_msgSend_setObject_forKeyedSubscript_(v5, v30, (uint64_t)self->SOCKSPort, @"UseSOCKSPort");
  }
  if (MGGetBoolAnswer() && self->enableProxy)
  {
    uint64_t v33 = objc_msgSend_numberWithBool_(NSNumber, v31, 1, v32);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v34, (uint64_t)v33, @"EnableProxy");

    objc_msgSend_setObject_forKeyedSubscript_(v5, v35, @"ForHttps", @"EnableProxySsl");
  }
  FDRCAURL = self->FDRCAURL;
  if (FDRCAURL) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRCAURL, @"CAURL");
  }
  FDRDSURL = self->FDRDSURL;
  if (FDRDSURL) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRDSURL, @"DSURL");
  }
  FDRSealingURL = self->FDRSealingURL;
  if (FDRSealingURL) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRSealingURL, @"SealingURL");
  }
  trustObjectURL = self->trustObjectURL;
  if (trustObjectURL) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)trustObjectURL, @"TrustObjectURL");
  }
  keyBlob = self->keyBlob;
  if (keyBlob) {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)keyBlob, @"RefKeyBlob");
  }
  uint64_t v41 = handleForCategory(0);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = (NSString *)v5;
    _os_log_impl(&dword_21FBF2000, v41, OS_LOG_TYPE_DEFAULT, "fdr options are :%@", buf, 0xCu);
  }

  id v42 = v5;
LABEL_38:

  return v42;
}

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = (__CFString *)a3;
  id v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v4)
  {
    id v5 = v4;
    CFErrorRef error = 0;
    uint64_t v9 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v12 = handleForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v16 = v9;
        __int16 v17 = 2112;
        uint64_t v18 = v3;
        __int16 v19 = 2112;
        CFErrorRef v20 = error;
        _os_log_error_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_ERROR, "Unexpected value %@ for %@ entitlement: %@", buf, 0x20u);
      }

      char v10 = 0;
    }
    else
    {
      char v10 = objc_msgSend_BOOLValue(v9, v6, v7, v8);
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC66AE0();
    }

    char v10 = 0;
  }

  return v10;
}

- (int64_t)performHTTPChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6 registerOnly:(BOOL)a7
{
  BOOL v72 = a7;
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v79 = 0;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = a6;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v75, (uint64_t)v84, 16);
  unint64_t v12 = 0x26B592000;
  if (!v11)
  {
    uint64_t v16 = 0;
    uint64_t v48 = 0;
    uint64_t v15 = 0;
    id v14 = 0;
    uint64_t v49 = 0;
    goto LABEL_56;
  }
  uint64_t v13 = v11;
  id v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v70 = self;
  p_delegate = &self->delegate;
  uint64_t v71 = *(void *)v76;
  uint64_t v69 = a5;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v76 != v71) {
        objc_enumerationMutation(obj);
      }
      __int16 v19 = *(void **)(*((void *)&v75 + 1) + 8 * i);
      CFErrorRef v20 = (void *)MEMORY[0x223C5C2A0]();
      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(obj, v21, (uint64_t)v19, v22);

      if (!v23)
      {
        uint64_t v50 = handleForCategory(0);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_21FC66BB0();
        }

        if (!v72)
        {
          uint64_t v48 = 0;
          uint64_t v16 = 0;
          goto LABEL_54;
        }
        uint64_t v16 = @"0";
        objc_msgSend_stringWithFormat_(NSString, v51, @"CLAIM/%@:%@", v52, v19, @"0");
        goto LABEL_39;
      }
      uint64_t v16 = (__CFString *)v23;
      if (v72)
      {
        id v14 = 0;
        uint64_t v15 = 0;
        objc_msgSend_stringWithFormat_(NSString, v24, @"CLAIM/%@:%@", v25, v19, v23);
        uint64_t v48 = LABEL_39:;
        uint64_t v53 = handleForCategory(0);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v81 = v48;
          _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "registering FDR permission: %@", buf, 0xCu);
        }

        if (v48)
        {
          AMFDRSetOption();
          if (AMFDRPermissionsRequest())
          {
            uint64_t v54 = handleForCategory(0);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21FBF2000, v54, OS_LOG_TYPE_DEFAULT, "AMFDRPermisisonRequest successful", buf, 2u);
            }

            uint64_t v49 = 0;
          }
          else
          {
            uint64_t v64 = v79;
            if (v79)
            {

              id v14 = v64;
            }
            uint64_t v65 = handleForCategory(0);
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
              sub_21FC66B48();
            }

            if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v66, (uint64_t)v14, v67) == 11) {
              uint64_t v49 = -83;
            }
            else {
              uint64_t v49 = 0;
            }
          }
        }
        else
        {
          uint64_t v68 = handleForCategory(0);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
            sub_21FC66B14();
          }

          uint64_t v48 = 0;
          uint64_t v49 = -84;
        }
        goto LABEL_55;
      }
      id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

      if (WeakRetained)
      {
        id v27 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend_setupModuleChallengeCallBack_(v27, v28, (uint64_t)a3, v29);
      }
      uint64_t v30 = handleForCategory(0);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v81 = v19;
        __int16 v82 = 2112;
        long long v83 = v16;
        _os_log_impl(&dword_21FBF2000, v30, OS_LOG_TYPE_DEFAULT, "Challenge Claim by Server, dataClass:%@, dataInstance: %@", buf, 0x16u);
      }

      uint64_t v31 = AMFDRDataHTTPChallengeClaim();
      if (v31)
      {
        uint64_t v32 = (void *)v31;

        uint64_t v15 = v32;
      }
      uint64_t v33 = v79;
      if (v79)
      {

        id v14 = v33;
LABEL_47:
        uint64_t v55 = handleForCategory(0);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          sub_21FC66C80();
        }

        uint64_t v57 = objc_msgSend_spcInPartSPC_withDataClass_(v70->handler, v56, (uint64_t)v70->_partSPC, (uint64_t)v19);
        failedSPC = v70->_failedSPC;
        v70->_failedSPC = (NSString *)v57;

LABEL_53:
        uint64_t v48 = 0;
LABEL_54:
        uint64_t v49 = -11;
LABEL_55:
        a5 = v69;
        unint64_t v12 = 0x26B592000uLL;
        goto LABEL_56;
      }
      if (v14 || !v15) {
        goto LABEL_47;
      }
      if ((AMFDRDataPut() & 1) == 0)
      {
        id v14 = v79;
        uint64_t v59 = handleForCategory(0);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
          sub_21FC66C18();
        }

        goto LABEL_53;
      }
      uint64_t v34 = handleForCategory(0);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "HTTP Challenge Claim Successful", buf, 2u);
      }

      if (_os_feature_enabled_impl()
        && objc_msgSend_isEqual_(v19, v35, @"vcrt", v36)
        && (CFBooleanRef v37 = (const __CFBoolean *)MGCopyAnswer(), Value = CFBooleanGetValue(v37), CFRelease(v37), Value))
      {
        uint64_t v39 = handleForCategory(0);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "Write date of first use to battery", buf, 2u);
        }

        id v74 = 0;
        char v41 = objc_msgSend__writeBatteryDateOfFirstUse_error_(v70, v40, (uint64_t)a3, (uint64_t)&v74);
        id v42 = v74;
        id v14 = v42;
        if ((v41 & 1) == 0)
        {
          if (v42)
          {
            uint64_t v49 = objc_msgSend_code(v42, v43, v44, v45);
            uint64_t v48 = 0;
          }
          else
          {
            uint64_t v48 = 0;
            uint64_t v49 = -999;
          }
          goto LABEL_55;
        }
        uint64_t v46 = handleForCategory(0);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Battery date of first use was written successfully", buf, 2u);
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v75, (uint64_t)v84, 16);
    uint64_t v48 = 0;
    uint64_t v49 = 0;
    a5 = v69;
    unint64_t v12 = 0x26B592000;
    if (v13) {
      continue;
    }
    break;
  }
LABEL_56:

  if (a5) {
    *a5 = v14;
  }
  if (objc_msgSend_getInnermostNSErrorCode_((void *)(v12 + 3168), v60, (uint64_t)v14, v61) == 11) {
    int64_t v62 = -13;
  }
  else {
    int64_t v62 = v49;
  }

  return v62;
}

- (BOOL)_writeBatteryDateOfFirstUse:(__AMFDR *)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = AMFDRGetCert();
  id v32 = 0;
  uint64_t v6 = sub_21FC1A650(v5, 0, &v32);
  id v7 = v32;
  uint64_t v8 = handleForCategory(0);
  uint64_t v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC66CE8();
    }
    uint64_t v18 = 0;
    uint64_t v13 = 0;
LABEL_12:

    BOOL v29 = 0;
    id v19 = v7;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v6;
    _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "the date retrieved from cert is: %@", buf, 0xCu);
  }

  uint64_t v13 = objc_msgSend_dateByAddingTimeInterval_(v6, v10, v11, v12, 86400.0);
  handleForCategory(0);
  id v14 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG)) {
    sub_21FC66D50(v13, v14, v15, v16);
  }

  id v31 = v7;
  uint64_t v18 = objc_msgSend_setBatteryDateOfFirstUse_error_(CRBatteryController, v17, (uint64_t)v13, (uint64_t)&v31);
  id v19 = v31;

  if (v18)
  {
    uint64_t v23 = objc_msgSend_dateByAddingTimeInterval_(v13, v20, v21, v22, 86400.0);
    uint64_t v26 = objc_msgSend_compare_(v18, v24, (uint64_t)v23, v25);

    if (v26 == -1)
    {
      BOOL v29 = 1;
      if (!a4) {
        goto LABEL_19;
      }
      goto LABEL_17;
    }
    uint64_t v9 = objc_msgSend_stringWithFormat_(NSString, v27, @"DOFU of battery (%@) is in future", v28, v18);
    sub_21FC02E70((void *)0x46, v9, 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  BOOL v29 = 0;
  if (!a4) {
    goto LABEL_19;
  }
LABEL_17:
  if (v19) {
    *a4 = v19;
  }
LABEL_19:

  return v29;
}

- (id)_personalizeTrustObjectWithDigest:(id)a3 withError:(id *)a4
{
  id v27 = 0;
  id v6 = a3;
  uint64_t DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v7, v8, v9);
  SOCKSHost = self->SOCKSHost;
  if (SOCKSHost && self->SOCKSPort) {
    AMAuthInstallSetSOCKSProxyInformation();
  }
  uint64_t v13 = objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, (const char *)SOCKSHost, DefaultAMAuthInstallRef, v10);
  id v26 = 0;
  RemoteTrustObjectDigestWithExistedDigest_digestData_CFErrorRef error = objc_msgSend_getRemoteTrustObjectDigestWithExistedDigest_digestData_error_(v13, v14, (uint64_t)v6, (uint64_t)&v27, &v26);

  id v16 = v26;
  if (a4 && (RemoteTrustObjectDigestWithExistedDigest_digestData_error & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_code(v16, v17, v18, v19);
    if (objc_msgSend_IsTatsuErrorNetworkingRelated_(CRPersonalizationManager, v21, v20, v22))
    {
      sub_21FC02E70((void *)0xFFFFFFFFFFFFFFF3, @"Fail to personalize object", 0);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = v16;
    }
    *a4 = v23;
  }
  AMSupportSafeRelease();
  id v24 = v27;

  return v24;
}

- (int64_t)_fetchRemoteTrustObject:(__AMFDR *)a3 apTrustObjectDigest:(id)a4 remoteTrustObject:(id *)a5 fdrError:(id *)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v43 = 0;
  uint64_t v44 = 0;
  if (objc_msgSend__urlsOverrideIsAllowed(self, v10, v11, v12)
    && !objc_msgSend_isEqual_(self->trustObjectURL, v13, @"http://gg.apple.com/fdrtrustobject", v14))
  {
    id v31 = handleForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      trustObjectURL = self->trustObjectURL;
      *(_DWORD *)buf = 138412290;
      uint64_t v46 = trustObjectURL;
      _os_log_impl(&dword_21FBF2000, v31, OS_LOG_TYPE_DEFAULT, "Override trust object URL is %@", buf, 0xCu);
    }

    if ((AMFDRDataCopyTrustObject() & 1) == 0)
    {
      __int16 v17 = 0;
      id v22 = 0;
      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v33, v44, v34) == 11) {
        int64_t v35 = -13;
      }
      else {
        int64_t v35 = -35;
      }
      id v20 = 0;
      goto LABEL_32;
    }
    uint64_t v40 = handleForCategory(0);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_21FC66E24();
    }

    id v20 = 0;
    __int16 v17 = 0;
LABEL_41:
    id v22 = 0;
    int64_t v35 = -35;
    goto LABEL_32;
  }
  uint64_t v15 = handleForCategory(0);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "No trust object URL is override", buf, 2u);
  }

  id v42 = 0;
  __int16 v17 = objc_msgSend__personalizeTrustObjectWithDigest_withError_(self, v16, 0, (uint64_t)&v42);
  id v20 = v42;
  if (!v17)
  {
    id v23 = handleForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_21FC66DF0();
    }

    objc_msgSend_domain(v20, v24, v25, v26);
    id v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v27 != @"com.apple.corerepair")
    {
      __int16 v17 = 0;
      id v22 = 0;
      int64_t v35 = -15;
      goto LABEL_32;
    }
    int64_t v35 = objc_msgSend_code(v20, v28, v29, v30);
    __int16 v17 = 0;
    goto LABEL_31;
  }
  if (!objc_msgSend_isEqual_(v9, v18, (uint64_t)v17, v19))
  {
    AMFDRSetOption();
    if (AMFDRDataCopyTrustObject())
    {
      if (v43)
      {
        id v22 = v43;
        int64_t v35 = 0;
        *a5 = v22;
        goto LABEL_32;
      }
      char v41 = handleForCategory(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_21FC66E24();
      }

      goto LABEL_41;
    }
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v36, v44, v37) == 11) {
      int64_t v35 = -13;
    }
    else {
      int64_t v35 = -35;
    }
    uint64_t v38 = v44;
    if (v44)
    {

      id v22 = 0;
      id v20 = (id)v38;
      goto LABEL_32;
    }
LABEL_31:
    id v22 = 0;
    goto LABEL_32;
  }
  uint64_t v21 = handleForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v21, OS_LOG_TYPE_DEFAULT, "Local trust object is good to use", buf, 2u);
  }

  id v22 = 0;
  int64_t v35 = 0;
  *a5 = 0;
LABEL_32:
  if (a6) {
    *a6 = v20;
  }

  return v35;
}

- (int64_t)setLocalAndRemoteTrustObject:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 remoteTrustObjectDigest:(id)a5 fdrError:(id *)a6
{
  v25[1] = 0;
  uint64_t v26 = 0;
  uint64_t v11 = AMFDRDataApTicketCopyObjectProperty();
  if (v11)
  {
    id v24 = 0;
    v25[0] = 0;
    int64_t RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = objc_msgSend__fetchRemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError_(self, v10, (uint64_t)a3, v11, v25, &v24);
    id v13 = v25[0];
    id v14 = v24;
    uint64_t v15 = v14;
    if (RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError || v14)
    {
      id v22 = handleForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_21FC66EC0();
      }

      if (a6) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    id v16 = handleForCategory(0);
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v17)
      {
        *(_WORD *)id v23 = 0;
        _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "Using local trust object", v23, 2u);
      }

LABEL_13:
      AMFDRSetOption();
      AMFDRDataCopyTrustObject();
      AMFDRSetOption();
      AMFDRSetOption();
      uint64_t v15 = 0;
      int64_t RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = 0;
      if (!a6) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    if (v17)
    {
      *(_WORD *)id v23 = 0;
      _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "Using remote trust object For SSL Roots", v23, 2u);
    }

    CFGetAllocator(a4);
    uint64_t v18 = AMFDRDataCopySslRoots();
    uint64_t v15 = v26;
    if (!v26 && v18)
    {
      AMFDRSetOption();
      AMFDRSetOption();
      goto LABEL_13;
    }
    uint64_t v19 = handleForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_21FC66EF4();
    }
  }
  else
  {
    uint64_t v21 = handleForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_21FC66E8C();
    }

    uint64_t v15 = 0;
    id v13 = 0;
  }
  int64_t RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = -35;
  if (a6) {
LABEL_19:
  }
    *a6 = v15;
LABEL_20:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError;
}

- (id)setLocalAndRemotePermission:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = handleForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sealedDataInstance = self->_sealedDataInstance;
    int v42 = 138412546;
    id v43 = @"seal";
    __int16 v44 = 2112;
    uint64_t v45 = (NSMutableArray *)sealedDataInstance;
    _os_log_impl(&dword_21FBF2000, v5, OS_LOG_TYPE_DEFAULT, "Sealed data class:%@::Seal instances:%@", (uint8_t *)&v42, 0x16u);
  }

  if (objc_msgSend_count(self->_mergedDataClasses, v7, v8, v9))
  {
    uint64_t v12 = 0;
    PermissionsString = 0;
    while (1)
    {
      id v14 = objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v10, v12, v11);
      BOOL v17 = objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v15, v12, v16);
      if (PermissionsString)
      {
        char appended = AMFDRDataAppendPermissionsString();

        if ((appended & 1) == 0)
        {
          uint64_t v28 = handleForCategory(0);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v30, v12, v31);
            id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v33, v12, v34);
            int64_t v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            int v42 = 138412802;
            id v43 = v32;
            __int16 v44 = 2112;
            uint64_t v45 = v35;
            __int16 v46 = 1024;
            int v47 = 0;
            _os_log_error_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_ERROR, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", (uint8_t *)&v42, 0x1Cu);
          }
          goto LABEL_19;
        }
      }
      else
      {
        PermissionsString = (__CFString *)AMFDRDataCreatePermissionsString();

        if (!PermissionsString)
        {
          uint64_t v28 = handleForCategory(0);
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            goto LABEL_19;
          }
          objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v36, v12, v37);
          uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v39, v12, v40);
          char v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          int v42 = 138412802;
          id v43 = v38;
          __int16 v44 = 2112;
          uint64_t v45 = v41;
          __int16 v46 = 1024;
          int v47 = 0;
          _os_log_error_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_ERROR, "Failed to create permissions string for data class '%@', data instance '%@', action '%d'", (uint8_t *)&v42, 0x1Cu);

LABEL_32:
          PermissionsString = 0;
          goto LABEL_19;
        }
      }
      if (objc_msgSend_count(self->_mergedDataClasses, v19, v20, v21) <= (unint64_t)++v12) {
        goto LABEL_12;
      }
    }
  }
  PermissionsString = 0;
LABEL_12:
  if (AMFDRDataAppendPermissionsString())
  {
    char v22 = AMFDRDataAppendPermissionsString();
    id v23 = handleForCategory(0);
    uint64_t v28 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataClasses = self->_mergedDataClasses;
        mergedDataInstances = self->_mergedDataInstances;
        int v42 = 138412546;
        id v43 = (__CFString *)mergedDataClasses;
        __int16 v44 = 2112;
        uint64_t v45 = mergedDataInstances;
        _os_log_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_DEFAULT, "Merged Data classes:%@::instances:%@", (uint8_t *)&v42, 0x16u);
      }

      uint64_t v26 = handleForCategory(0);
      uint64_t v28 = v26;
      if (!PermissionsString)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          sub_21FC66F5C();
        }
        goto LABEL_32;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v42 = 138412290;
        id v43 = PermissionsString;
        _os_log_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_DEFAULT, "New Permisisons:%@", (uint8_t *)&v42, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_21FC66F90();
    }
  }
  else
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67018();
    }
  }
LABEL_19:

  return PermissionsString;
}

- (int64_t)localPatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  BOOL v17 = objc_msgSend__copyFDROptionsForPatch_(self, v15, (uint64_t)a3, v16);
  char v21 = 1;
  int64_t v19 = objc_msgSend_patchWithOptions_amfdr_dataClasses_dataInstances_values_datas_error_local_(self, v18, (uint64_t)v17, (uint64_t)a3, v14, v13, v12, 0, a7, v21);

  return v19;
}

- (int64_t)remotePatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 datas:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  uint64_t v20 = objc_msgSend__copyFDROptionsForPatch_(self, v18, (uint64_t)a3, v19);
  char v24 = 0;
  int64_t v22 = objc_msgSend_patchWithOptions_amfdr_dataClasses_dataInstances_values_datas_error_local_(self, v21, (uint64_t)v20, (uint64_t)a3, v17, v16, v15, v14, a8, v24);

  return v22;
}

- (int64_t)patchWithOptions:(id)a3 amfdr:(__AMFDR *)a4 dataClasses:(id)a5 dataInstances:(id)a6 values:(id)a7 datas:(id)a8 error:(id *)a9 local:(BOOL)a10
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = handleForCategory(0);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v19, OS_LOG_TYPE_DEFAULT, "Start patching ...", buf, 2u);
  }

  uint64_t v159 = v18;
  uint64_t v160 = v14;
  if (!v15 || !v16 || !v17)
  {
    uint64_t v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (!objc_msgSend_count(v15, v20, v21, v22))
  {
    uint64_t v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
LABEL_20:
    }
      sub_21FC6709C();
LABEL_21:

    uint64_t v57 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v61 = 0;
    uint64_t v40 = 0;
    int64_t context = 0;
    goto LABEL_30;
  }
  uint64_t v26 = objc_msgSend_count(v15, v23, v24, v25);
  if (v26 != objc_msgSend_count(v16, v27, v28, v29))
  {
    int64_t v62 = handleForCategory(0);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_21FC6749C();
    }
    goto LABEL_28;
  }
  uint64_t v33 = objc_msgSend_count(v15, v30, v31, v32);
  if (v33 != objc_msgSend_count(v17, v34, v35, v36))
  {
    int64_t v62 = handleForCategory(0);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_21FC67468();
    }
    goto LABEL_28;
  }
  if (!v14)
  {
    int64_t v62 = handleForCategory(0);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
      sub_21FC670D0();
    }
LABEL_28:

    uint64_t v57 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v61 = 0;
    uint64_t v40 = 0;
LABEL_29:
    int64_t context = -66;
    goto LABEL_30;
  }
  uint64_t v40 = objc_msgSend_mutableCopy(v14, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v40, v41, @"Local", @"DataStore");
  uint64_t v42 = MEMORY[0x263EFFA80];
  objc_msgSend_setObject_forKeyedSubscript_(v40, v43, MEMORY[0x263EFFA80], @"VerifyData");
  objc_msgSend_setObject_forKeyedSubscript_(v40, v44, v42, @"SignData");
  objc_msgSend_setObject_forKeyedSubscript_(v40, v45, v42, @"PutCombined");
  if (!AMFDRCreateWithOptions())
  {
    uint64_t v64 = handleForCategory(0);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
      sub_21FC67104();
    }

    uint64_t v57 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    uint64_t v61 = 0;
    goto LABEL_29;
  }
  if (!AMFDRMigrateCredentials())
  {
    uint64_t v65 = handleForCategory(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_21FC67400();
    }
    goto LABEL_56;
  }
  if (v18)
  {
    __int16 v46 = handleForCategory(0);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v46, OS_LOG_TYPE_DEFAULT, "Use pass in data array", buf, 2u);
    }

    uint64_t v50 = objc_msgSend_count(v18, v47, v48, v49);
    if (v50 == objc_msgSend_count(v15, v51, v52, v53))
    {
      uint64_t v57 = objc_msgSend_mutableCopy(v18, v54, v55, v56);
      uint64_t v58 = 0;
      goto LABEL_47;
    }
    uint64_t v65 = handleForCategory(0);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
      sub_21FC673CC();
    }
LABEL_56:

    uint64_t v57 = 0;
    uint64_t v60 = 0;
    uint64_t v58 = 0;
    goto LABEL_57;
  }
  uint64_t v151 = (void *)AMFDRDataMultiCopy();
  if (!v151)
  {
    uint64_t v128 = handleForCategory(0);
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR)) {
      sub_21FC67138();
    }

    uint64_t v57 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = 0;
    int64_t context = -66;
    uint64_t v58 = 0;
    goto LABEL_30;
  }
  v154 = objc_opt_new();
  uint64_t v58 = v151;
  if (!objc_msgSend_count(v151, v66, v67, v68))
  {
LABEL_46:
    uint64_t v57 = v154;
LABEL_47:
    uint64_t v85 = handleForCategory(0);
    BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
    if (a10)
    {
      if (v86)
      {
        *(_DWORD *)buf = 138412802;
        id v162 = v15;
        __int16 v163 = 2112;
        id v164 = v16;
        __int16 v165 = 2112;
        id v166 = v17;
        _os_log_impl(&dword_21FBF2000, v85, OS_LOG_TYPE_DEFAULT, "Local patch for classes: %@ instances: %@ values: %@", buf, 0x20u);
      }

      uint64_t v60 = (void *)AMFDRDataMultiPatch();
      uint64_t v87 = handleForCategory(0);
      id v88 = v87;
      if (v60)
      {
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FBF2000, v88, OS_LOG_TYPE_DEFAULT, "Local patch SUCCESS", buf, 2u);
        }

        uint64_t v61 = 0;
        int64_t context = 0;
        goto LABEL_30;
      }
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR)) {
        sub_21FC671A0();
      }

LABEL_57:
      uint64_t v61 = 0;
      int64_t context = -66;
      goto LABEL_30;
    }
    if (v86)
    {
      *(_DWORD *)buf = 138412802;
      id v162 = v15;
      __int16 v163 = 2112;
      id v164 = v16;
      __int16 v165 = 2112;
      id v166 = v17;
      _os_log_impl(&dword_21FBF2000, v85, OS_LOG_TYPE_DEFAULT, "Remote commit patch for classes: %@ instances: %@ values: %@", buf, 0x20u);
    }

    uint64_t v61 = objc_msgSend_mutableCopy(v14, v89, v90, v91);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v92, @"Remote", @"DataStore");
    if (!AMFDRCreateWithOptions())
    {
      uint64_t v129 = v61;
      uint64_t v130 = handleForCategory(0);
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR)) {
        sub_21FC67208();
      }

      int64_t context = -66;
      uint64_t v61 = v129;
      uint64_t v60 = 0;
      goto LABEL_30;
    }
    if (AMFDRMigrateCredentials())
    {
      uint64_t v60 = (void *)AMFDRDataMultiCommitPatch();
      if (v60)
      {
        if (objc_msgSend_count(v15, v93, v94, v95))
        {
          contextb = 0;
          while (1)
          {
            uint64_t v149 = (void *)MEMORY[0x223C5C2A0]();
            uint64_t v96 = handleForCategory(0);
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              v152 = objc_msgSend_objectAtIndexedSubscript_(v15, v97, (uint64_t)contextb, v98);
              uint64_t v101 = objc_msgSend_objectAtIndexedSubscript_(v16, v99, (uint64_t)contextb, v100);
              *(_DWORD *)buf = 138412546;
              id v162 = v152;
              __int16 v163 = 2112;
              id v164 = v101;
              _os_log_impl(&dword_21FBF2000, v96, OS_LOG_TYPE_DEFAULT, "Sync class: %@ instance: %@", buf, 0x16u);
            }
            v104 = objc_msgSend_objectAtIndexedSubscript_(v15, v102, (uint64_t)contextb, v103);
            uint64_t v107 = objc_msgSend_objectAtIndexedSubscript_(v16, v105, (uint64_t)contextb, v106);
            FullKey = (void *)AMFDRDataLocalCreateFullKey();

            if (!FullKey) {
              break;
            }
            uint64_t v153 = objc_msgSend_objectForKeyedSubscript_(v60, v108, (uint64_t)FullKey, v109);
            if (!v153)
            {
              long long v117 = handleForCategory(0);
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                sub_21FC672A4(buf, &buf[1]);
              }
              goto LABEL_108;
            }
            uint64_t v112 = objc_msgSend_objectAtIndexedSubscript_(v15, v110, (uint64_t)contextb, v111);
            uint64_t v115 = objc_msgSend_objectAtIndexedSubscript_(v16, v113, (uint64_t)contextb, v114);
            int v147 = AMFDRDataDelete();

            long long v116 = handleForCategory(0);
            long long v117 = v116;
            if (!v147)
            {
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR)) {
                sub_21FC67304(buf, &buf[1]);
              }
              goto LABEL_108;
            }
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v162 = v153;
              _os_log_impl(&dword_21FBF2000, v117, OS_LOG_TYPE_DEFAULT, "Put local data: %@", buf, 0xCu);
            }

            id v120 = objc_msgSend_objectAtIndexedSubscript_(v15, v118, (uint64_t)contextb, v119);
            v123 = objc_msgSend_objectAtIndexedSubscript_(v16, v121, (uint64_t)contextb, v122);
            int v148 = AMFDRDataPutWithOptions();

            if (!v148)
            {
              long long v117 = handleForCategory(0);
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                sub_21FC672D4(buf, &buf[1]);
              }
LABEL_108:

              goto LABEL_109;
            }

            if ((unint64_t)++contextb >= objc_msgSend_count(v15, v124, v125, v126)) {
              goto LABEL_74;
            }
          }
          int v137 = handleForCategory(0);
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            v155 = objc_msgSend_objectAtIndexedSubscript_(v15, v138, (uint64_t)contextb, v139);
            id v146 = objc_msgSend_objectAtIndexedSubscript_(v16, v144, (uint64_t)contextb, v145);
            *(_DWORD *)buf = 138412546;
            id v162 = v155;
            __int16 v163 = 2112;
            id v164 = v146;
            _os_log_error_impl(&dword_21FBF2000, v137, OS_LOG_TYPE_ERROR, "Failed to create full key for data class: %@ instance: %@", buf, 0x16u);
          }
          int64_t context = -66;
        }
        else
        {
LABEL_74:
          id v127 = handleForCategory(0);
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FBF2000, v127, OS_LOG_TYPE_DEFAULT, "Remote commit patch SUCCESS", buf, 2u);
          }

          int64_t context = 0;
        }
        goto LABEL_30;
      }
      uint64_t v136 = handleForCategory(0);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR)) {
        sub_21FC6723C();
      }
    }
    else
    {
      uint64_t v131 = handleForCategory(0);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR)) {
        sub_21FC67334();
      }

      uint64_t v60 = 0;
    }
LABEL_109:
    int64_t context = -66;
    goto LABEL_30;
  }
  uint64_t v69 = 0;
  while (1)
  {
    contexta = (void *)MEMORY[0x223C5C2A0]();
    BOOL v72 = objc_msgSend_objectAtIndexedSubscript_(v15, v70, v69, v71);
    long long v75 = objc_msgSend_objectAtIndexedSubscript_(v16, v73, v69, v74);
    long long v76 = (void *)AMFDRDataLocalCreateFullKey();

    if (!v76) {
      break;
    }
    uint64_t v81 = objc_msgSend_objectForKeyedSubscript_(v151, v77, (uint64_t)v76, v78);
    if (!v81)
    {
      uint64_t v135 = handleForCategory(0);
      if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR)) {
        sub_21FC6739C(buf, &buf[1]);
      }

      goto LABEL_95;
    }
    objc_msgSend_addObject_(v154, v79, (uint64_t)v81, v80);

    if (++v69 >= (unint64_t)objc_msgSend_count(v151, v82, v83, v84))
    {
      id v14 = v160;
      goto LABEL_46;
    }
  }
  uint64_t v132 = handleForCategory(0);
  if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
  {
    uint64_t v140 = objc_msgSend_objectAtIndexedSubscript_(v15, v133, v69, v134);
    uint64_t v143 = objc_msgSend_objectAtIndexedSubscript_(v16, v141, v69, v142);
    *(_DWORD *)buf = 138412546;
    id v162 = v140;
    __int16 v163 = 2112;
    id v164 = v143;
    _os_log_error_impl(&dword_21FBF2000, v132, OS_LOG_TYPE_ERROR, "Failed to create full key for data class: %@ instance: %@", buf, 0x16u);
  }
LABEL_95:
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  int64_t context = -66;
  uint64_t v57 = v154;
LABEL_30:
  if (a9) {
    *a9 = 0;
  }
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return context;
}

- (BOOL)deleteLocalData:(id)a3 dataClass:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v5 = a4;
  uint64_t v52 = 0;
  uint64_t v53 = &v52;
  uint64_t v54 = 0x3032000000;
  uint64_t v55 = sub_21FC4A1CC;
  uint64_t v56 = sub_21FC4A1DC;
  id v57 = (id)objc_opt_new();
  uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8);
  char v41 = objc_msgSend_contentsOfDirectoryAtPath_error_(v9, v10, (uint64_t)v43, 0);

  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = sub_21FC4A1E4;
  v49[3] = &unk_26452ABC0;
  id v40 = v5;
  id v50 = v40;
  uint64_t v51 = &v52;
  objc_msgSend_enumerateObjectsUsingBlock_(v41, v11, (uint64_t)v49, v12);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = (id)v53[5];
  id v14 = 0;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v45, (uint64_t)v62, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v46;
    while (2)
    {
      uint64_t v17 = 0;
      id v18 = v14;
      do
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v45 + 1) + 8 * v17);
        uint64_t v20 = (void *)MEMORY[0x223C5C2A0]();
        uint64_t v24 = objc_msgSend_mutableCopy(v43, v21, v22, v23);
        objc_msgSend_appendString_(v24, v25, @"/", v26);
        objc_msgSend_appendString_(v24, v27, v19, v28);
        uint64_t v29 = handleForCategory(0);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v24;
          _os_log_impl(&dword_21FBF2000, v29, OS_LOG_TYPE_DEFAULT, "Deleting path:%@", buf, 0xCu);
        }

        uint64_t v33 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v30, v31, v32);
        id v44 = v18;
        int v35 = objc_msgSend_removeItemAtPath_error_(v33, v34, (uint64_t)v24, (uint64_t)&v44);
        id v14 = v44;

        if (v35)
        {
          uint64_t v36 = handleForCategory(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v59 = v24;
            _os_log_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_DEFAULT, "Successfully deleted:%@", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v36 = handleForCategory(0);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v59 = v24;
            __int16 v60 = 2112;
            id v61 = v14;
            _os_log_error_impl(&dword_21FBF2000, v36, OS_LOG_TYPE_ERROR, "Failed to delete file:%@:%@", buf, 0x16u);
          }
        }

        if (!v35)
        {
          BOOL v38 = 0;
          goto LABEL_18;
        }
        ++v17;
        id v18 = v14;
      }
      while (v15 != v17);
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v45, (uint64_t)v62, 16);
      if (v15) {
        continue;
      }
      break;
    }
  }
  BOOL v38 = 1;
LABEL_18:

  _Block_object_dispose(&v52, 8);
  return v38;
}

- (BOOL)deleteLocalData:(id)a3
{
  return objc_msgSend_deleteLocalData_dataClass_(self, a2, (uint64_t)a3, 0);
}

- (int64_t)_commitSealedData:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 syncEAN:(BOOL)a6 returnError:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v65 = 0;
  uint64_t v10 = objc_opt_new();
  if (!AMFDRSealedDataGetSealingManifest())
  {
    uint64_t v55 = handleForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_21FC674D0();
    }
    goto LABEL_26;
  }
  AMFDRSetOption();
  if (!objc_msgSend_deleteLocalData_(self, v11, (uint64_t)self->FDRPersistentDataPath, v12))
  {
LABEL_27:
    id v19 = 0;
LABEL_28:
    uint64_t v49 = 0;
    goto LABEL_29;
  }
  if (!AMFDRSealedDataCommit())
  {
    uint64_t v55 = handleForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_21FC67764();
    }
    goto LABEL_26;
  }
  if ((AMFDRSealedDataRestoreOptions() & 1) == 0)
  {
    uint64_t v55 = handleForCategory(0);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_21FC67730();
    }
LABEL_26:

    goto LABEL_27;
  }
  id v19 = 0;
  if (objc_msgSend_isEANSupported(v10, v13, v14, v15) && v8)
  {
    if ((objc_msgSend_setupVersionedFDRWithApTicket_(v10, v16, (uint64_t)self->apTicketData, v18) & 1) == 0)
    {
      uint64_t v58 = handleForCategory(0);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
        sub_21FC676FC();
      }

      id v19 = 0;
      goto LABEL_41;
    }
    uint64_t v23 = objc_msgSend_absoluteString(self->dataDirectoryURL, v20, v21, v22);
    id v64 = 0;
    char v25 = objc_msgSend_stageVersionedFDREANWithdataDir_error_(v10, v24, (uint64_t)v23, (uint64_t)&v64);
    id v19 = v64;

    uint64_t v26 = handleForCategory(0);
    id v27 = v26;
    if ((v25 & 1) == 0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_21FC67694();
      }

      goto LABEL_41;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v27, OS_LOG_TYPE_DEFAULT, "stageFDREANWithApTicket passed", buf, 2u);
    }
  }
  uint64_t v28 = objc_msgSend_sharedSingleton(CRFileSystemController, v16, v17, v18);
  uint64_t v32 = objc_msgSend_commitToFileSystem(v28, v29, v30, v31);

  if (v32)
  {
    uint64_t v59 = handleForCategory(0);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
      sub_21FC67660();
    }

    goto LABEL_28;
  }
  if (v8)
  {
    uint64_t v36 = objc_msgSend_sharedSingleton(CRFileSystemController, v33, v34, v35);
    char v40 = objc_msgSend_syncAlternativeFDRPath(v36, v37, v38, v39);

    if ((v40 & 1) == 0)
    {
      __int16 v60 = handleForCategory(0);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
        sub_21FC6762C();
      }

LABEL_41:
      uint64_t v49 = 0;
      int64_t v54 = -999;
      goto LABEL_30;
    }
  }
  if ((objc_msgSend_allowFactoryReset(self->handler, v33, v34, v35) & 1) != 0 || self->enableStagedSeal) {
    goto LABEL_19;
  }
  id v63 = v19;
  char v44 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v41, @"40A0DDD2-77F8-4392-B4A3-1E7304206516:IsServicePart", (uint64_t)&v63);
  id v45 = v63;

  if (v44)
  {
    id v19 = v45;
LABEL_19:
    long long v46 = v19;
    long long v47 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v41, v42, v43);
    id v62 = v19;
    uint64_t v49 = objc_msgSend_copyPathForPersistentData_error_(v47, v48, 100, (uint64_t)&v62);
    id v19 = v62;

    id v50 = handleForCategory(0);
    uint64_t v51 = v50;
    if (v49 && !v19)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v67 = v49;
        _os_log_impl(&dword_21FBF2000, v51, OS_LOG_TYPE_DEFAULT, "new FDR data path is %@", buf, 0xCu);
      }

      objc_msgSend_URLWithString_(NSURL, v52, (uint64_t)v49, v53);
      AMFDRSetOption();
      id v19 = 0;
      int64_t v54 = 0;
      goto LABEL_30;
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      sub_21FC67538();
    }

LABEL_29:
    int64_t v54 = -17;
    goto LABEL_30;
  }
  id v61 = handleForCategory(0);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_21FC675A0((uint64_t)v45, v61);
  }

  uint64_t v49 = 0;
  int64_t v54 = -999;
  id v19 = v45;
LABEL_30:
  uint64_t v56 = v65;
  if (v65)
  {

    id v19 = v56;
  }
  if (a7) {
    *a7 = v19;
  }

  return v54;
}

- (int64_t)CRFDRPostRecoverVerify:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6
{
  AMFDRSetOption();
  AMFDRSetOption();
  if (AMFDRSealingMapPopulateSealingManifest())
  {
    uint64_t v7 = handleForCategory(0);
    BOOL v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC677CC();
    }
  }
  else
  {
    BOOL v8 = handleForCategory(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_21FC67904();
    }
  }

  if (a6) {
    *a6 = 0;
  }
  AMSupportSafeRelease();

  return -3;
}

- (int64_t)CRFDRDataRepairRecover:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v26 = 0;
  id v27 = 0;
  id v25 = 0;
  uint64_t v11 = objc_msgSend_CRFDRLocalPopulate_fdrRemote_sealedData_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v26, &v25);
  id v12 = v25;
  id v13 = handleForCategory(0);
  uint64_t v14 = v13;
  if (v11 || v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_21FC6796C();
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "FDR Data Populated", buf, 2u);
  }

  if (!AMFDRSealedDataCreateSealingRequest() || v27)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC67B0C();
    }
    goto LABEL_22;
  }
  if (!AMFDRSealedDataGetSealingRequest())
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC679D4();
    }
    goto LABEL_22;
  }
  if ((AMFDRSealedDataClearSealingManifest() & 1) == 0)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC67AD8();
    }
    goto LABEL_22;
  }
  objc_msgSend__logSealingRequest_(self, v15, v26, v16);
  ++self->sealCount;
  if (!AMFDRSealedDataHTTPSign() || !AMFDRSealedDataGetSealingManifest() || v27)
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC67A08();
    }
    goto LABEL_22;
  }
  uint64_t v17 = handleForCategory(0);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_DEFAULT, "Remote FDR Data Sealing successful", buf, 2u);
  }

  if (!AMFDRSealedDataGetSealingManifest())
  {
    uint64_t v14 = handleForCategory(0);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_21FC67A70();
    }
LABEL_22:
    id v12 = 0;
LABEL_23:
    int64_t v19 = -3;
    goto LABEL_24;
  }
  id v23 = 0;
  int64_t v19 = objc_msgSend__commitSealedData_fdrRemote_sealedData_syncEAN_returnError_(self, v18, (uint64_t)a3, (uint64_t)a4, v26, v7, &v23);
  id v20 = v23;
  id v12 = v20;
  if (!v19 && !v20)
  {
    int64_t v19 = 0;
    goto LABEL_25;
  }
  uint64_t v14 = handleForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_21FC67AA4();
  }
LABEL_24:

LABEL_25:
  uint64_t v21 = v27;
  if (v27)
  {

    id v12 = v21;
  }
  if (a6) {
    *a6 = v12;
  }
  AMSupportSafeRelease();

  return v19;
}

- (void)_logSealingRequest:(__AMFDRSealedData *)a3
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  id v3 = AMFDRSealedDataGetSealingRequest();
  AMSupportBase64Encode();
}

- (BOOL)_commitData:(id)a3 fdrlocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v83 = 0;
  long long v77 = objc_opt_new();
  long long v75 = objc_opt_new();
  long long v76 = objc_opt_new();
  id v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_21FC67C7C();
  }

  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = v5;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v79, (uint64_t)v88, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v80 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        id v13 = handleForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v87 = v12;
          _os_log_debug_impl(&dword_21FBF2000, v13, OS_LOG_TYPE_DEBUG, "key:%@", buf, 0xCu);
        }

        id v14 = objc_alloc(MEMORY[0x263F08AE8]);
        uint64_t v16 = objc_msgSend_initWithPattern_options_error_(v14, v15, @"([a-zA-Z0-9]{4})-(.*$)", 0, 0);
        uint64_t v20 = objc_msgSend_length(v12, v17, v18, v19);
        uint64_t v22 = objc_msgSend_firstMatchInString_options_range_(v16, v21, (uint64_t)v12, 0, 0, v20);
        id v23 = handleForCategory(0);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          sub_21FC67C10(v84, v22, &v85, v23);
        }

        if (v22 && (unint64_t)objc_msgSend_numberOfRanges(v22, v24, v25, v26) >= 2)
        {
          uint64_t v29 = objc_msgSend_rangeAtIndex_(v22, v27, 1, v28);
          uint64_t v31 = objc_msgSend_substringWithRange_(v12, v30, v29, (uint64_t)v30);
          uint64_t v34 = objc_msgSend_rangeAtIndex_(v22, v32, 2, v33);
          uint64_t v36 = objc_msgSend_substringWithRange_(v12, v35, v34, (uint64_t)v35);
          uint64_t v39 = (void *)v36;
          if (v31 && v36)
          {
            objc_msgSend_addObject_(v77, v37, (uint64_t)v31, v38);
            objc_msgSend_addObject_(v75, v40, (uint64_t)v39, v41);
            char v44 = objc_msgSend_objectForKeyedSubscript_(obj, v42, (uint64_t)v12, v43);
            objc_msgSend_addObject_(v76, v45, (uint64_t)v44, v46);
          }
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v79, (uint64_t)v88, 16);
    }
    while (v9);
  }

  long long v48 = handleForCategory(0);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v87 = v77;
    _os_log_impl(&dword_21FBF2000, v48, OS_LOG_TYPE_DEFAULT, "Commit dataClasses:%@", buf, 0xCu);
  }

  uint64_t v49 = handleForCategory(0);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v87 = v75;
    _os_log_impl(&dword_21FBF2000, v49, OS_LOG_TYPE_DEFAULT, "Commit dataInstances:%@", buf, 0xCu);
  }

  id v50 = handleForCategory(0);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v87 = v76;
    _os_log_impl(&dword_21FBF2000, v50, OS_LOG_TYPE_DEFAULT, "Commit dataForPut:%@", buf, 0xCu);
  }

  if (!objc_msgSend_count(v77, v51, v52, v53)
    && !objc_msgSend_count(v75, v54, v55, v56)
    && !objc_msgSend_count(v76, v54, v55, v56))
  {
    uint64_t v70 = handleForCategory(0);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v70, OS_LOG_TYPE_DEFAULT, "No data to recover, skipping ...", buf, 2u);
    }
    BOOL v69 = 1;
LABEL_38:

    uint64_t v68 = 0;
    if (!a5) {
      goto LABEL_40;
    }
LABEL_39:
    *a5 = v68;
    goto LABEL_40;
  }
  uint64_t v57 = objc_msgSend_count(v77, v54, v55, v56, a4);
  if (v57 != objc_msgSend_count(v75, v58, v59, v60)
    || (uint64_t v64 = objc_msgSend_count(v76, v61, v62, v63), v64 != objc_msgSend_count(v75, v65, v66, v67)))
  {
    uint64_t v70 = handleForCategory(0);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      sub_21FC67BDC();
    }
    BOOL v69 = 0;
    goto LABEL_38;
  }
  if (AMFDRDataMultiPut() && !v83)
  {
    uint64_t v68 = 0;
    BOOL v69 = 1;
    if (!a5) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  BOOL v72 = handleForCategory(0);
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
    sub_21FC67B74();
  }

  BOOL v69 = 0;
  if (v83) {
    uint64_t v68 = v83;
  }
  else {
    uint64_t v68 = 0;
  }
  if (a5) {
    goto LABEL_39;
  }
LABEL_40:

  return v69;
}

- (id)_getCRFDRMetaDataDictionary
{
  v2 = objc_opt_new();
  id v3 = (void *)MGCopyAnswer();
  uint64_t v4 = (void *)MGCopyAnswer();
  id v5 = (void *)MGCopyAnswer();
  BOOL v7 = (void *)MGCopyAnswer();
  if (v3) {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v3, @"ECID");
  }
  if (v4) {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v4, @"ChipID");
  }
  if (v5) {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v5, @"BoardID");
  }
  if (v7) {
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v7, @"UDID");
  }

  return v2;
}

- (int64_t)CRFDRVerifyLocal:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 mergedDataClasses:(id)a6 mergedDataInstances:(id)a7 currentManifestProperties:(id)a8 fdrError:(id *)a9 syncEAN:(BOOL)a10 postSeal:(BOOL)a11 ignoreBenignError:(BOOL)a12
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v53 = 0;
  uint64_t v20 = objc_opt_new();
  SealedData = (__AMFDRSealedData *)AMFDRSealingManifestCreateSealedData();
  if (!SealedData)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67CF0();
    }
    goto LABEL_43;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67FFC();
    }
    id v34 = 0;
    int64_t v29 = -999;
    goto LABEL_44;
  }
  if (!AMFDRSealedDataConfigureOptionsForRecover())
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67F94();
    }
    goto LABEL_43;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67F2C();
    }
    goto LABEL_43;
  }
  minimalSealingInstances = self->_minimalSealingInstances;
  if (minimalSealingInstances
    && objc_msgSend_count(minimalSealingInstances, v22, v23, v24)
    && !AMFDRSealedDataSetMinimalManifestClassInstance())
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67EC4();
    }
    goto LABEL_43;
  }
  if (!AMFDRSealedDataPopulate())
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67E5C();
    }
    goto LABEL_43;
  }
  if (AMFDRSealedDataVerify()) {
    goto LABEL_15;
  }
  if (!a12)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = v53;
      _os_log_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_DEFAULT, "Local FDR Data verification failure:%@", buf, 0xCu);
    }
    goto LABEL_43;
  }
  int v50 = objc_msgSend_CRFDRCheckVerificationFatalErrors_fdrLocal_sealedData_strict_(self, v26, 0, (uint64_t)a3, SealedData, 1);
  id v27 = handleForCategory(0);
  uint64_t v28 = v27;
  if (!v50)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_21FC67DF4();
    }
LABEL_43:
    id v34 = 0;
    int64_t v29 = -40;
    goto LABEL_44;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = v53;
    _os_log_impl(&dword_21FBF2000, v28, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate failed with benign error, conitnue: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  uint64_t v53 = 0;
LABEL_15:
  id v52 = 0;
  int64_t v29 = objc_msgSend_CRFDRVerifyProperties_currentManifestProperties_fdrError_(self, v26, (uint64_t)a3, (uint64_t)v19, &v52);
  id v30 = v52;
  id v34 = v30;
  if (v29 || v30)
  {
    uint64_t v28 = handleForCategory(0);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_21FC67D24();
    }
  }
  else
  {
    if (!a10 || !objc_msgSend_isEANSupported(v20, v31, v32, v33))
    {
      int64_t v29 = 0;
      id v34 = 0;
      goto LABEL_45;
    }
    id v34 = 0;
    if (objc_msgSend_verifyFDRDataFromEANUsingCache_cachedData_(v20, v35, 0, 0)) {
      goto LABEL_25;
    }
    uint64_t v39 = handleForCategory(0);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v39, OS_LOG_TYPE_DEFAULT, "Verify FDR Data from EAN failed, sync EAN...", buf, 2u);
    }

    uint64_t v43 = objc_msgSend_sharedDataAccessor(MEMORY[0x263F53618], v40, v41, v42);
    id v51 = 0;
    uint64_t v28 = objc_msgSend_copyPathForPersistentData_error_(v43, v44, 100, (uint64_t)&v51);
    id v34 = v51;

    if (v28)
    {
      if (objc_msgSend_writeFDRDataToEANWithdataDir_(v20, v45, (uint64_t)v28, v46))
      {

LABEL_25:
        if (!a11 || (objc_msgSend_swapVersionedFDR(v20, v36, v37, v38) & 1) != 0)
        {
          int64_t v29 = 0;
          goto LABEL_45;
        }
        uint64_t v28 = handleForCategory(0);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_21FC67D8C();
        }
        int64_t v29 = -68;
        goto LABEL_44;
      }
      uint64_t v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC67DC0();
      }
    }
    else
    {
      uint64_t v49 = handleForCategory(0);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_21FC67538();
      }
    }

    int64_t v29 = -19;
  }
LABEL_44:

LABEL_45:
  long long v47 = v53;
  if (v53)
  {

    id v34 = v47;
  }
  if (a9) {
    *a9 = v34;
  }
  if (a5) {
    *a5 = SealedData;
  }
  else {
    AMSupportSafeRelease();
  }

  return v29;
}

- (int64_t)CRFDRLocalPopulate:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 fdrError:(id *)a6
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  SealedData = (__AMFDRSealedData *)AMFDRSealingManifestCreateSealedData();
  if (!SealedData)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC67CF0();
    }
LABEL_13:

    int64_t v15 = -3;
    if (!a6) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC67FFC();
    }
    goto LABEL_13;
  }
  if ((AMFDRSealedDataConfigureOptionsForRecover() & 1) == 0)
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC68064();
    }
    goto LABEL_13;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC67F2C();
    }
    goto LABEL_13;
  }
  minimalSealingInstances = self->_minimalSealingInstances;
  if (minimalSealingInstances
    && objc_msgSend_count(minimalSealingInstances, v11, v12, v13)
    && !AMFDRSealedDataSetMinimalManifestClassInstance())
  {
    uint64_t v16 = handleForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_21FC67EC4();
    }
    goto LABEL_13;
  }
  if (AMFDRSealedDataPopulate())
  {
    int64_t v15 = 0;
    if (!a6) {
      goto LABEL_15;
    }
LABEL_14:
    *a6 = 0;
    goto LABEL_15;
  }
  AMSupportSafeRelease();
  AMFDRSealedDataVerify();
  int v19 = objc_msgSend_CRFDRCheckVerificationFatalErrors_fdrLocal_sealedData_strict_(self, v18, 0, (uint64_t)a3, SealedData, 0);
  uint64_t v20 = handleForCategory(0);
  uint64_t v16 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_21FC67DF4();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = 0;
    _os_log_impl(&dword_21FBF2000, v16, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate failed with benign error, conitnue: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  int64_t v15 = 0;
  if (a6) {
    goto LABEL_14;
  }
LABEL_15:
  if (a5) {
    *a5 = SealedData;
  }
  else {
    AMSupportSafeRelease();
  }

  return v15;
}

- (int64_t)verifyClaimCountAndSalesDistrictWithError:(id *)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  uint64_t v8 = v5;
  if (self->keyBlob)
  {
    uint64_t v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v9, OS_LOG_TYPE_DEFAULT, "Skip checking for SSR", buf, 2u);
    }

    id v10 = 0;
    int64_t v11 = 0;
    uint64_t v12 = 0;
    id v13 = 0;
  }
  else
  {
    id v88 = 0;
    uint64_t v12 = objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v5, v6, (uint64_t)&v88, v7);
    id v13 = v88;
    int64_t v11 = 0;
    long long v77 = v8;
    uint64_t v73 = a3;
    uint64_t v74 = v12;
    id v72 = v13;
    id v10 = 0;
    if ((objc_msgSend_allowUsedPart(self, v14, v15, v16) & 1) == 0 && v13)
    {
      long long v86 = 0u;
      long long v87 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v20 = v13;
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v84, (uint64_t)v96, 16);
      if (v22)
      {
        uint64_t v25 = v22;
        uint64_t v75 = 0;
        id v10 = 0;
        uint64_t v26 = *(void *)v85;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v85 != v26) {
              objc_enumerationMutation(v20);
            }
            uint64_t v28 = *(void *)(*((void *)&v84 + 1) + 8 * i);
            int64_t v29 = objc_msgSend_spcWithComponent_(self->handler, v23, v28, v24);
            uint64_t v32 = objc_msgSend_objectForKeyedSubscript_(v20, v30, v28, v31);
            uint64_t v33 = handleForCategory(0);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v91 = v28;
              __int16 v92 = 2112;
              int64_t v93 = v29;
              __int16 v94 = 2112;
              uint64_t v95 = v32;
              _os_log_impl(&dword_21FBF2000, v33, OS_LOG_TYPE_DEFAULT, "key: %@, spc: %@, cc: %@", buf, 0x20u);
            }

            if (v29)
            {
              if (objc_msgSend_containsObject_(self->_partSPC, v34, (uint64_t)v29, v35))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend_intValue(v32, v36, v37, v38) >= 2)
                {
                  uint64_t v41 = NSString;
                  objc_msgSend_objectForKeyedSubscript_(v20, v39, (uint64_t)v29, v40);
                  uint64_t v42 = v78 = v10;
                  id v45 = objc_msgSend_stringWithFormat_(v41, v43, @"Not allow used part %@ (%@): %@", v44, v29, v28, v42);
                  uint64_t v75 = -90;
                  uint64_t v46 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFA6, v45, 0);

                  id v10 = (id)v46;
                }
              }
            }
          }
          uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v84, (uint64_t)v96, 16);
        }
        while (v25);
      }
      else
      {
        uint64_t v75 = 0;
        id v10 = 0;
      }

      int64_t v11 = v75;
      uint64_t v8 = v77;
      a3 = v73;
      uint64_t v12 = v74;
      id v13 = v72;
    }
    if ((objc_msgSend_allowSelfService(self, v17, v18, v19) & 1) == 0 && v12)
    {
      long long v79 = v10;
      uint64_t v76 = v11;
      uint64_t v49 = objc_msgSend_extractRepairCentersWithRCHLHistory_(v8, v47, (uint64_t)v12, v48);
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v80, (uint64_t)v89, 16);
      if (v51)
      {
        uint64_t v54 = v51;
        uint64_t v55 = *(void *)v81;
        do
        {
          for (uint64_t j = 0; j != v54; ++j)
          {
            if (*(void *)v81 != v55) {
              objc_enumerationMutation(v49);
            }
            uint64_t v57 = *(void *)(*((void *)&v80 + 1) + 8 * j);
            uint64_t v58 = objc_msgSend_spcWithComponent_(self->handler, v52, v57, v53);
            id v61 = objc_msgSend_objectForKeyedSubscript_(v49, v59, v57, v60);
            uint64_t v62 = handleForCategory(0);
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v91 = v57;
              __int16 v92 = 2112;
              int64_t v93 = v58;
              __int16 v94 = 2112;
              uint64_t v95 = v61;
              _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "key: %@, spc: %@, sd: %@", buf, 0x20u);
            }

            if (v58
              && objc_msgSend_containsObject_(self->_partSPC, v63, (uint64_t)v58, v64)
              && objc_msgSend_isSelfServiceSalesDistrict_(v77, v65, (uint64_t)v61, v66))
            {
              BOOL v69 = objc_msgSend_stringWithFormat_(NSString, v67, @"Not allow self repaired %@ (%@): %@", v68, v58, v57, v61);
              uint64_t v76 = -91;
              uint64_t v70 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFA5, v69, 0);

              long long v79 = (void *)v70;
            }
          }
          uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v80, (uint64_t)v89, 16);
        }
        while (v54);
      }

      int64_t v11 = v76;
      uint64_t v8 = v77;
      a3 = v73;
      uint64_t v12 = v74;
      id v13 = v72;
      id v10 = v79;
    }
    if (a3 && v10)
    {
      id v10 = v10;
      *a3 = v10;
    }
  }

  return v11;
}

- (int64_t)CRFDRVerifyProperties:(__AMFDR *)a3 currentManifestProperties:(id)a4 fdrError:(id *)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = AMFDRGetOptions();
  int64_t v11 = v7;
  if (v7 && objc_msgSend_count(v7, v8, v9, v10))
  {
    uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v11, v8, @"SealingPropertiesOverride", v10);
    uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v16 = objc_msgSend_count(0, v8, v9, v10);
  }
  uint64_t v20 = v16;
  uint64_t v21 = objc_msgSend_count(v6, v17, v18, v19);
  if (!v12 || !v20)
  {
    long long v47 = @"sealingProperties empty";
    goto LABEL_28;
  }
  if (!v6 || !v21)
  {
    long long v47 = @"currentManifestProperties empty";
LABEL_28:
    int64_t v45 = -40;
    uint64_t v46 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD8, v47, 0);
    if (!a5) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  int v50 = a5;
  uint64_t v22 = handleForCategory(0);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v57 = v12;
    _os_log_impl(&dword_21FBF2000, v22, OS_LOG_TYPE_DEFAULT, "sealingProperties: %@", buf, 0xCu);
  }

  uint64_t v23 = handleForCategory(0);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v57 = v6;
    _os_log_impl(&dword_21FBF2000, v23, OS_LOG_TYPE_DEFAULT, "currentManifestProperties: %@", buf, 0xCu);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v24 = v12;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v51, (uint64_t)v55, 16);
  if (!v26)
  {
LABEL_22:

    uint64_t v44 = handleForCategory(0);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v44, OS_LOG_TYPE_DEFAULT, "Properties verify successful", buf, 2u);
    }

    int64_t v45 = 0;
    uint64_t v46 = 0;
    a5 = v50;
    if (!v50) {
      goto LABEL_30;
    }
LABEL_29:
    *a5 = v46;
    goto LABEL_30;
  }
  uint64_t v29 = v26;
  uint64_t v30 = *(void *)v52;
  uint64_t v49 = v11;
LABEL_15:
  uint64_t v31 = 0;
  while (1)
  {
    if (*(void *)v52 != v30) {
      objc_enumerationMutation(v24);
    }
    uint64_t v32 = *(void *)(*((void *)&v51 + 1) + 8 * v31);
    uint64_t v33 = objc_msgSend_objectForKeyedSubscript_(v6, v27, v32, v28, v49);
    if (!v33) {
      break;
    }
    uint64_t v36 = (void *)v33;
    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v6, v34, v32, v35);
    uint64_t v40 = objc_msgSend_objectForKeyedSubscript_(v24, v38, v32, v39);
    int isEqual = objc_msgSend_isEqual_(v37, v41, (uint64_t)v40, v42);

    if (!isEqual) {
      break;
    }
    if (v29 == ++v31)
    {
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v51, (uint64_t)v55, 16);
      int64_t v11 = v49;
      if (v29) {
        goto LABEL_15;
      }
      goto LABEL_22;
    }
  }
  int64_t v45 = -40;
  uint64_t v46 = sub_21FC02E70((void *)0xFFFFFFFFFFFFFFD8, @"sealingProperties and currentManifestProperties mismatched", 0);

  int64_t v11 = v49;
  a5 = v50;
  if (v50) {
    goto LABEL_29;
  }
LABEL_30:

  return v45;
}

- (BOOL)CRFDRCheckVerificationFatalErrors:(__CFError *)a3 fdrLocal:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 strict:(BOOL)a6
{
  char v7 = 0;
  if (AMFDRSealedDataVerificationErrorIsBenign())
  {
    CFDictionaryRef v8 = CFErrorCopyUserInfo(a3);
    CFDictionaryRef v11 = v8;
    if (v8)
    {
      uint64_t v12 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"MissingDataInstances", v10);
      uint64_t v16 = v12;
      if (v12)
      {
        if (objc_msgSend_count(v12, v13, v14, v15)) {
          char v7 = 0;
        }
        else {
          char v7 = -1;
        }
      }
      else
      {
        char v7 = 1;
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  return v7 & 1;
}

- (int64_t)CRFDRRecoverMissingData:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  *(void *)&v13[5] = *MEMORY[0x263EF8340];
  id v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)id v13 = "-[CRFDRSeal CRFDRRecoverMissingData:fdrLocal:fdrRemote:]";
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "entering %s ...", buf, 0xCu);
  }

  if (!AMFDRSealingManifestCreateSealedData())
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC67CF0();
    }
    goto LABEL_17;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC67FFC();
    }
    goto LABEL_17;
  }
  if ((AMFDRSealedDataConfigureOptionsForRecover() & 1) == 0)
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC68064();
    }
    goto LABEL_17;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC67F2C();
    }
    goto LABEL_17;
  }
  int v7 = AMFDRSealedDataPopulate();
  CFDictionaryRef v8 = handleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13[0] = v7;
    LOWORD(v13[1]) = 2112;
    *(void *)((char *)&v13[1] + 2) = 0;
    _os_log_impl(&dword_21FBF2000, v8, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate status: %d error: %@", buf, 0x12u);
  }

  AMSupportSafeRelease();
  if (!AMFDRSealedDataPopulateWithExistingData())
  {
    uint64_t v10 = handleForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_21FC68100();
    }
LABEL_17:
    int64_t v9 = -3;
    goto LABEL_18;
  }
  if (AMFDRSealedDataCommit())
  {
    int64_t v9 = 0;
    if (!a3) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_21FC68098();
  }
  int64_t v9 = -17;
LABEL_18:

  if (a3) {
LABEL_19:
  }
    *a3 = 0;
LABEL_20:
  AMSupportSafeRelease();

  return v9;
}

- (id)summarizePatchInputs
{
  id v5 = objc_opt_new();
  if (self->_patchValues)
  {
    id v6 = objc_opt_new();
    if (objc_msgSend_count(self->_patchValues, v7, v8, v9))
    {
      unint64_t v10 = 0;
      do
      {
        CFDictionaryRef v11 = objc_msgSend_objectAtIndexedSubscript_(self->_patchValues, v3, v10, v4);
        uint64_t v12 = objc_opt_new();
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = sub_21FC4D004;
        v35[3] = &unk_26452AA60;
        id v36 = v12;
        id v13 = v12;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v11, v14, (uint64_t)v35, v15);
        objc_msgSend_addObject_(v6, v16, (uint64_t)v13, v17);

        ++v10;
      }
      while (objc_msgSend_count(self->_patchValues, v18, v19, v20) > v10);
    }
  }
  else
  {
    id v6 = 0;
  }
  patchDataClasses = self->_patchDataClasses;
  if (patchDataClasses)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v3, (uint64_t)patchDataClasses, @"patchDataClasses");
  }
  else
  {
    id v24 = objc_msgSend_null(MEMORY[0x263EFF9D0], v3, 0, v4);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, @"patchDataClasses");
  }
  patchDataInstances = self->_patchDataInstances;
  if (patchDataInstances)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v22, (uint64_t)patchDataInstances, @"patchDataInstances");
    if (v6)
    {
LABEL_12:
      objc_msgSend_setObject_forKeyedSubscript_(v5, v27, (uint64_t)v6, @"patchValues");
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v30 = objc_msgSend_null(MEMORY[0x263EFF9D0], v22, 0, v23);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)v30, @"patchDataInstances");

    if (v6) {
      goto LABEL_12;
    }
  }
  uint64_t v32 = objc_msgSend_null(MEMORY[0x263EFF9D0], v27, v28, v29);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v33, (uint64_t)v32, @"patchValues");

LABEL_15:
  return v5;
}

- (NSData)apTicketData
{
  return self->apTicketData;
}

- (void)setApTicketData:(id)a3
{
}

- (CRFDRBaseDeviceHandler)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
}

- (setupModuleChallengeCallBack)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (setupModuleChallengeCallBack *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)sealedDataInstance
{
  return self->_sealedDataInstance;
}

- (void)setSealedDataInstance:(id)a3
{
}

- (NSDictionary)claimDict
{
  return self->_claimDict;
}

- (void)setClaimDict:(id)a3
{
}

- (NSDictionary)updateClassDict
{
  return self->_updateClassDict;
}

- (void)setUpdateClassDict:(id)a3
{
}

- (NSMutableArray)currentClasses
{
  return self->_currentClasses;
}

- (void)setCurrentClasses:(id)a3
{
}

- (NSMutableArray)currentInstances
{
  return self->_currentInstances;
}

- (void)setCurrentInstances:(id)a3
{
}

- (NSDictionary)currentProperties
{
  return self->_currentProperties;
}

- (void)setCurrentProperties:(id)a3
{
}

- (NSMutableArray)makeClasses
{
  return self->_makeClasses;
}

- (void)setMakeClasses:(id)a3
{
}

- (NSMutableArray)makeInstances
{
  return self->_makeInstances;
}

- (void)setMakeInstances:(id)a3
{
}

- (NSDictionary)makeProperties
{
  return self->_makeProperties;
}

- (void)setMakeProperties:(id)a3
{
}

- (NSDictionary)updateProperties
{
  return self->_updateProperties;
}

- (void)setUpdateProperties:(id)a3
{
}

- (NSArray)minimalSealingInstances
{
  return self->_minimalSealingInstances;
}

- (void)setMinimalSealingInstances:(id)a3
{
}

- (NSArray)minimalSealedClasses
{
  return self->_minimalSealedClasses;
}

- (void)setMinimalSealedClasses:(id)a3
{
}

- (NSArray)minimalSealedInstances
{
  return self->_minimalSealedInstances;
}

- (void)setMinimalSealedInstances:(id)a3
{
}

- (NSMutableArray)recoverDataClasses
{
  return self->_recoverDataClasses;
}

- (void)setRecoverDataClasses:(id)a3
{
}

- (NSMutableArray)recoverDataInstances
{
  return self->_recoverDataInstances;
}

- (void)setRecoverDataInstances:(id)a3
{
}

- (NSMutableArray)mergedDataClasses
{
  return self->_mergedDataClasses;
}

- (void)setMergedDataClasses:(id)a3
{
}

- (NSMutableArray)mergedDataInstances
{
  return self->_mergedDataInstances;
}

- (void)setMergedDataInstances:(id)a3
{
}

- (NSArray)patchItems
{
  return self->_patchItems;
}

- (void)setPatchItems:(id)a3
{
}

- (NSArray)patchDataClasses
{
  return self->_patchDataClasses;
}

- (void)setPatchDataClasses:(id)a3
{
}

- (NSArray)patchDataInstances
{
  return self->_patchDataInstances;
}

- (void)setPatchDataInstances:(id)a3
{
}

- (NSArray)patchValues
{
  return self->_patchValues;
}

- (void)setPatchValues:(id)a3
{
}

- (NSSet)partSPC
{
  return self->_partSPC;
}

- (void)setPartSPC:(id)a3
{
}

- (NSString)failedSPC
{
  return self->_failedSPC;
}

- (void)setFailedSPC:(id)a3
{
}

- (BOOL)skipStageEAN
{
  return self->_skipStageEAN;
}

- (void)setSkipStageEAN:(BOOL)a3
{
  self->_skipStageEAN = a3;
}

- (BOOL)allowUsedPart
{
  return self->_allowUsedPart;
}

- (void)setAllowUsedPart:(BOOL)a3
{
  self->_allowUsedPart = a3;
}

- (BOOL)allowSelfService
{
  return self->_allowSelfService;
}

- (void)setAllowSelfService:(BOOL)a3
{
  self->_allowSelfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSPC, 0);
  objc_storeStrong((id *)&self->_partSPC, 0);
  objc_storeStrong((id *)&self->_patchValues, 0);
  objc_storeStrong((id *)&self->_patchDataInstances, 0);
  objc_storeStrong((id *)&self->_patchDataClasses, 0);
  objc_storeStrong((id *)&self->_patchItems, 0);
  objc_storeStrong((id *)&self->_mergedDataInstances, 0);
  objc_storeStrong((id *)&self->_mergedDataClasses, 0);
  objc_storeStrong((id *)&self->_recoverDataInstances, 0);
  objc_storeStrong((id *)&self->_recoverDataClasses, 0);
  objc_storeStrong((id *)&self->_minimalSealedInstances, 0);
  objc_storeStrong((id *)&self->_minimalSealedClasses, 0);
  objc_storeStrong((id *)&self->_minimalSealingInstances, 0);
  objc_storeStrong((id *)&self->_updateProperties, 0);
  objc_storeStrong((id *)&self->_makeProperties, 0);
  objc_storeStrong((id *)&self->_makeInstances, 0);
  objc_storeStrong((id *)&self->_makeClasses, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_currentInstances, 0);
  objc_storeStrong((id *)&self->_currentClasses, 0);
  objc_storeStrong((id *)&self->_updateClassDict, 0);
  objc_storeStrong((id *)&self->_claimDict, 0);
  objc_storeStrong((id *)&self->_sealedDataInstance, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->handler, 0);
  objc_storeStrong((id *)&self->apTicketData, 0);
  objc_storeStrong((id *)&self->keyBlob, 0);
  objc_storeStrong((id *)&self->displayMaxDuration, 0);
  objc_storeStrong((id *)&self->SOCKSPort, 0);
  objc_storeStrong((id *)&self->SOCKSHost, 0);
  objc_storeStrong((id *)&self->repairStats, 0);
  objc_storeStrong((id *)&self->FDRPersistentDataPath, 0);
  objc_storeStrong((id *)&self->preSealingManifest, 0);
  objc_storeStrong((id *)&self->postSealingManifest, 0);
  objc_storeStrong((id *)&self->overridePropertySet, 0);
  objc_storeStrong((id *)&self->manifestDataClassesAndInstances, 0);
  objc_storeStrong((id *)&self->removedProperties, 0);
  objc_storeStrong((id *)&self->metadataDict, 0);
  objc_storeStrong((id *)&self->dataDirectoryURL, 0);
  objc_storeStrong((id *)&self->FDRSealingURL, 0);
  objc_storeStrong((id *)&self->FDRDSURL, 0);
  objc_storeStrong((id *)&self->trustObjectURL, 0);
  objc_storeStrong((id *)&self->FDRCAURL, 0);
  objc_storeStrong((id *)&self->KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->currentMLBSerialNumber, 0);
  objc_storeStrong((id *)&self->currentSerialNumber, 0);
}

- (int64_t)performRealToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  uint64_t v8 = handleForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_21FC6867C(v8);
  }

  uint64_t v12 = objc_msgSend_makeProperties(self, v9, v10, v11);

  if (v12)
  {
    uint64_t v16 = objc_msgSend_makeProperties(self, v13, v14, v15);
    uint64_t v12 = objc_msgSend_mutableCopy(v16, v17, v18, v19);

    AMFDRSetOption();
    AMFDRSetOption();
  }
  uint64_t v20 = objc_msgSend_mergedDataClasses(self, v13, v14, v15);
  id v24 = objc_msgSend_mergedDataInstances(self, v21, v22, v23);
  uint64_t v28 = objc_msgSend_currentProperties(self, v25, v26, v27);
  id v160 = 0;
  BYTE2(v149) = 0;
  LOWORD(v149) = 1;
  v152 = a4;
  uint64_t v29 = a5;
  uint64_t v31 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v30, (uint64_t)a4, (uint64_t)a5, 0, v20, v24, v28, &v160, v149);
  uint64_t v32 = (uint64_t)v160;

  BOOL v33 = (v31 | v32) == 0;
  id v34 = handleForCategory(0);
  BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
  if (!(v31 | v32))
  {
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
    }

    uint64_t v39 = objc_msgSend_patchDataClasses(self, v36, v37, v38);
    if (v39
      && (uint64_t v43 = (void *)v39,
          objc_msgSend_patchDataClasses(self, v40, v41, v42),
          uint64_t v44 = objc_claimAutoreleasedReturnValue(),
          uint64_t v48 = objc_msgSend_count(v44, v45, v46, v47),
          v44,
          v43,
          v48))
    {
      BOOL v150 = v33;
      uint64_t v32 = handleForCategory(0);
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = v12;
        *(_WORD *)buf = 0;
        int v50 = "Patch needed, continue";
LABEL_19:
        _os_log_impl(&dword_21FBF2000, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, v50, buf, 2u);
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v51 = objc_msgSend_updateProperties(self, v40, v41, v42);
      if (!v51
        || (uint64_t v55 = (void *)v51,
            objc_msgSend_updateProperties(self, v52, v53, v54),
            uint64_t v56 = objc_claimAutoreleasedReturnValue(),
            uint64_t v60 = objc_msgSend_count(v56, v57, v58, v59),
            v56,
            v55,
            !v60))
      {
        id v61 = handleForCategory(0);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21FBF2000, v61, OS_LOG_TYPE_DEFAULT, "Skip recovery and seal", buf, 2u);
        }
        uint64_t v62 = 0;
        id v63 = 0;
        int64_t Instances_patchClasses_patchInstances = 0;
        goto LABEL_58;
      }
      BOOL v150 = v33;
      uint64_t v32 = handleForCategory(0);
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v49 = v12;
        *(_WORD *)buf = 0;
        int v50 = "Update properties needed, continue";
        goto LABEL_19;
      }
    }
    uint64_t v49 = v12;
    goto LABEL_24;
  }
  BOOL v150 = 0;
  if (v35)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FBF2000, v34, OS_LOG_TYPE_DEFAULT, "Local FDR data not verified, continue to recover", buf, 2u);
  }
  uint64_t v49 = v12;

LABEL_24:
  id v159 = 0;
  uint64_t v68 = objc_msgSend_claimDict(self, v65, v66, v67);
  id v72 = objc_msgSend_makeClasses(self, v69, v70, v71);
  uint64_t v76 = objc_msgSend_makeInstances(self, v73, v74, v75);
  long long v80 = objc_msgSend_patchDataClasses(self, v77, v78, v79);
  long long v84 = objc_msgSend_patchDataInstances(self, v81, v82, v83);
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v85, (uint64_t)&v159, (uint64_t)v29, v152, v68, v72, v76, v80, v84);
  id v63 = v159;

  if (Instances_patchClasses_patchInstances || v63)
  {
    id v61 = handleForCategory(0);
    uint64_t v12 = v49;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC643F8();
    }
    goto LABEL_57;
  }
  id v158 = 0;
  uint64_t v89 = objc_msgSend_claimDict(self, v86, v87, v88);
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v90, (uint64_t)v29, (uint64_t)v152, &v158, v89, 0);
  id v63 = v158;

  if (Instances_patchClasses_patchInstances || v63)
  {
    id v61 = handleForCategory(0);
    uint64_t v12 = v49;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC684DC();
    }
    goto LABEL_57;
  }
  uint64_t v12 = v49;
  if (v150) {
    goto LABEL_29;
  }
  id v157 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_CRFDRRecoverMissingData_fdrLocal_fdrRemote_(self, v91, (uint64_t)&v157, (uint64_t)v152, v29);
  id v145 = v157;
  id v63 = v145;
  if (Instances_patchClasses_patchInstances || v145)
  {
    id v61 = handleForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC685AC();
    }
    goto LABEL_57;
  }
  id v156 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_performMake_fdrLocal_fdrError_(self, v146, (uint64_t)v29, (uint64_t)v152, &v156);
  id v147 = v156;
  id v63 = v147;
  if (Instances_patchClasses_patchInstances || v147)
  {
    id v61 = handleForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC68614();
    }
LABEL_57:
    uint64_t v62 = 0;
LABEL_58:
    v144 = a3;
    goto LABEL_59;
  }
LABEL_29:
  __int16 v94 = objc_msgSend_patchDataClasses(self, v91, v92, v93);
  uint64_t v98 = objc_msgSend_patchDataInstances(self, v95, v96, v97);
  uint64_t v102 = objc_msgSend_patchValues(self, v99, v100, v101);
  id v155 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v103, (uint64_t)v152, (uint64_t)v94, v98, v102, &v155);
  id v63 = v155;

  if (Instances_patchClasses_patchInstances || v63)
  {
    id v61 = handleForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC644C8();
    }
    goto LABEL_64;
  }
  uint64_t v107 = objc_msgSend_patchDataClasses(self, v104, v105, v106);
  uint64_t v111 = objc_msgSend_patchDataInstances(self, v108, v109, v110);
  uint64_t v115 = objc_msgSend_patchValues(self, v112, v113, v114);
  id v154 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_remotePatch_dataClasses_dataInstances_values_datas_error_(self, v116, (uint64_t)v29, (uint64_t)v107, v111, v115, 0, &v154);
  id v63 = v154;

  if (Instances_patchClasses_patchInstances || v63)
  {
    id v61 = handleForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC68544();
    }
LABEL_64:
    uint64_t v62 = 0;
    v144 = a3;
LABEL_65:
    uint64_t v12 = v49;
    goto LABEL_59;
  }
  id v120 = objc_msgSend_handler(self, v117, v118, v119);
  uint64_t v124 = objc_msgSend_partSPC(self, v121, v122, v123);
  uint64_t v128 = objc_msgSend_updateProperties(self, v125, v126, v127);
  uint64_t v62 = objc_msgSend_getUpdatePropertyWithPartSPC_propertiesFromParam_(v120, v129, (uint64_t)v124, (uint64_t)v128);

  uint64_t v12 = v49;
  if (v62)
  {
    objc_msgSend_addEntriesFromDictionary_(v49, v130, (uint64_t)v62, v131);
    uint64_t v132 = handleForCategory(0);
    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v162 = v49;
      _os_log_impl(&dword_21FBF2000, v132, OS_LOG_TYPE_DEFAULT, "Updated properties: %@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
  }
  id v153 = 0;
  int64_t Instances_patchClasses_patchInstances = objc_msgSend_performSealing_fdrLocal_fdrError_(self, v130, (uint64_t)v29, (uint64_t)v152, &v153);
  id v133 = v153;
  id v63 = v133;
  if (!Instances_patchClasses_patchInstances && !v133)
  {
    int v137 = objc_msgSend_handler(self, v134, v135, v136);
    id v141 = objc_msgSend_partSPC(self, v138, v139, v140);
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v137, v142, (uint64_t)v141, v143);

    v144 = a3;
    if (!Instances_patchClasses_patchInstances)
    {
      id v63 = 0;
      uint64_t v12 = v49;
      if (!a3) {
        goto LABEL_61;
      }
      goto LABEL_60;
    }
    id v61 = handleForCategory(0);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      sub_21FC64598();
    }
    id v63 = 0;
    goto LABEL_65;
  }
  id v61 = handleForCategory(0);
  v144 = a3;
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
    sub_21FC64530();
  }
LABEL_59:

  if (v144) {
LABEL_60:
  }
    id *v144 = v63;
LABEL_61:

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performStagedToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  id v139 = 0;
  id v140 = 0;
  id v138 = 0;
  id v137 = 0;
  uint64_t v9 = handleForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_21FC68838(v9);
  }

  uint64_t v16 = objc_msgSend_localManifestProperties(CRFDRUtils, v10, v11, v12);
  if (v16)
  {
    AMFDRSetOption();
    AMFDRSetOption();
  }
  uint64_t v17 = objc_msgSend_mergedDataClasses(self, v13, v14, v15);
  uint64_t v21 = objc_msgSend_mergedDataInstances(self, v18, v19, v20);
  id v136 = 0;
  BYTE2(v125) = 0;
  LOWORD(v125) = 1;
  uint64_t v23 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v22, (uint64_t)a4, (uint64_t)a5, 0, v17, v21, v16, &v136, v125);
  id v24 = v136;

  uint64_t v25 = handleForCategory(0);
  uint64_t v26 = v25;
  if (v23 || v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_21FC68700();
    }

    int64_t Instances_patchClasses_patchInstances = -40;
  }
  else
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v26, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
    }

    uint64_t v30 = objc_msgSend_patchDataClasses(self, v27, v28, v29);
    if (v30)
    {
      id v34 = (void *)v30;
      BOOL v35 = objc_msgSend_patchDataClasses(self, v31, v32, v33);
      uint64_t v39 = objc_msgSend_count(v35, v36, v37, v38);

      if (v39)
      {
        uint64_t v40 = handleForCategory(0);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_21FC68804();
        }

        id v24 = 0;
LABEL_46:
        int64_t Instances_patchClasses_patchInstances = -66;
        goto LABEL_61;
      }
    }
    uint64_t v42 = objc_msgSend_updateProperties(self, v31, v32, v33);
    if (v42)
    {
      uint64_t v46 = (void *)v42;
      uint64_t v47 = objc_msgSend_updateProperties(self, v43, v44, v45);
      uint64_t v51 = objc_msgSend_count(v47, v48, v49, v50);

      if (v51)
      {
        long long v52 = handleForCategory(0);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
          sub_21FC687D0();
        }

        id v24 = 0;
        int64_t Instances_patchClasses_patchInstances = -89;
        goto LABEL_61;
      }
    }
    uint64_t v127 = a3;
    uint64_t v53 = handleForCategory(0);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v53, OS_LOG_TYPE_DEFAULT, "Get all local patch data", buf, 2u);
    }

    id v57 = objc_msgSend_handler(self, v54, v55, v56);
    id v61 = objc_msgSend_partSPC(self, v58, v59, v60);
    uint64_t v65 = objc_msgSend_mergedDataClasses(self, v62, v63, v64);
    BOOL v69 = objc_msgSend_mergedDataInstances(self, v66, v67, v68);
    id v134 = 0;
    int PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error = objc_msgSend_getPatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error_(v57, v70, (uint64_t)v61, (uint64_t)a4, &v140, &v139, &v138, &v137, v65, v69, &v134);
    id v24 = v134;

    if (!PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error
      || v24)
    {
      uint64_t v121 = handleForCategory(0);
      a3 = v127;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
        sub_21FC68768();
      }

      goto LABEL_46;
    }
    id v133 = 0;
    uint64_t v75 = objc_msgSend_claimDict(self, v72, v73, v74);
    uint64_t v79 = objc_msgSend_makeClasses(self, v76, v77, v78);
    uint64_t v83 = objc_msgSend_makeInstances(self, v80, v81, v82);
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v84, (uint64_t)&v133, (uint64_t)a5, a4, v75, v79, v83, v140, v139);
    id v24 = v133;

    a3 = v127;
    if (Instances_patchClasses_patchInstances || v24)
    {
      uint64_t v122 = handleForCategory(0);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        sub_21FC643F8();
      }
      goto LABEL_60;
    }
    id v132 = 0;
    uint64_t v88 = objc_msgSend_claimDict(self, v85, v86, v87);
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v89, (uint64_t)a5, (uint64_t)a4, &v132, v88, 0);
    id v24 = v132;

    if (Instances_patchClasses_patchInstances || v24)
    {
      uint64_t v122 = handleForCategory(0);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        sub_21FC684DC();
      }
      goto LABEL_60;
    }
    id v131 = 0;
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_performMake_fdrLocal_fdrError_(self, v90, (uint64_t)a5, (uint64_t)a4, &v131);
    id v91 = v131;
    id v24 = v91;
    if (Instances_patchClasses_patchInstances || v91)
    {
      uint64_t v122 = handleForCategory(0);
      if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
        sub_21FC68614();
      }
      goto LABEL_60;
    }
    uint64_t v92 = (void *)MEMORY[0x223C5C2A0]();
    id v130 = 0;
    int64_t Instances_patchClasses_patchInstances = objc_msgSend_remotePatch_dataClasses_dataInstances_values_datas_error_(self, v93, (uint64_t)a5, (uint64_t)v140, v139, v138, v137, &v130);
    id v94 = v130;
    id v24 = v94;
    if (!Instances_patchClasses_patchInstances && !v94)
    {
      id v95 = v140;
      id v140 = 0;

      id v96 = v139;
      id v139 = 0;

      id v97 = v138;
      id v138 = 0;

      id v98 = v137;
      id v137 = 0;

      uint64_t v102 = objc_msgSend_mergedDataClasses(self, v99, v100, v101);
      uint64_t v106 = objc_msgSend_mergedDataInstances(self, v103, v104, v105);
      id v129 = 0;
      BYTE2(v126) = 1;
      LOWORD(v126) = 1;
      int64_t Instances_patchClasses_patchInstances = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v107, (uint64_t)a4, (uint64_t)a5, 0, v102, v106, v16, &v129, v126);
      id v24 = v129;

      if (Instances_patchClasses_patchInstances || v24)
      {
        uint64_t v122 = handleForCategory(0);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
          sub_21FC68734();
        }
      }
      else
      {
        id v128 = 0;
        int64_t Instances_patchClasses_patchInstances = objc_msgSend_performSealing_fdrLocal_fdrError_(self, v108, (uint64_t)a5, (uint64_t)a4, &v128);
        id v109 = v128;
        id v24 = v109;
        if (!Instances_patchClasses_patchInstances && !v109)
        {
          uint64_t v113 = objc_msgSend_handler(self, v110, v111, v112);
          long long v117 = objc_msgSend_partSPC(self, v114, v115, v116);
          int64_t Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v113, v118, (uint64_t)v117, v119);

          if (Instances_patchClasses_patchInstances)
          {
            id v120 = handleForCategory(0);
            if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR)) {
              sub_21FC64598();
            }
          }
          id v24 = 0;
          goto LABEL_61;
        }
        uint64_t v122 = handleForCategory(0);
        if (os_log_type_enabled(v122, OS_LOG_TYPE_ERROR)) {
          sub_21FC64530();
        }
      }
LABEL_60:

      goto LABEL_61;
    }
    uint64_t v123 = handleForCategory(0);
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR)) {
      sub_21FC68544();
    }
  }
LABEL_61:
  if (a3) {
    *a3 = v24;
  }

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  v123[1] = *MEMORY[0x263EF8340];
  uint64_t v121 = 0;
  uint64_t v8 = objc_msgSend_makeClasses(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v12 = (void *)v8;
  uint64_t v13 = objc_msgSend_makeInstances(self, v9, v10, v11);
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v17 = (void *)v13;
  uint64_t v18 = objc_msgSend_makeClasses(self, v14, v15, v16);
  if (!objc_msgSend_count(v18, v19, v20, v21))
  {

LABEL_13:
    goto LABEL_14;
  }
  uint64_t v25 = objc_msgSend_makeInstances(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_count(v25, v26, v27, v28);

  if (!v29)
  {
LABEL_14:
    uint64_t v62 = handleForCategory(0);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v62, OS_LOG_TYPE_DEFAULT, "No make data, skipping.", buf, 2u);
    }

    uint64_t v54 = 0;
LABEL_17:
    uint64_t v63 = handleForCategory(0);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v63, OS_LOG_TYPE_DEFAULT, "Make and commit local successful", buf, 2u);
    }
    uint64_t v55 = 0;
    int64_t v61 = 0;
    goto LABEL_20;
  }
  uint64_t v33 = objc_msgSend_makeClasses(self, v30, v31, v32);
  uint64_t v37 = objc_msgSend_count(v33, v34, v35, v36);
  uint64_t v41 = objc_msgSend_makeInstances(self, v38, v39, v40);
  uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);

  if (v37 == v45)
  {
    uint64_t v49 = objc_msgSend_makeClasses(self, v46, v47, v48);
    uint64_t v53 = objc_msgSend_makeInstances(self, v50, v51, v52);
    uint64_t v54 = (void *)AMFDRDataMultiMake();

    uint64_t v55 = v121;
    if (!v54)
    {
      uint64_t v56 = handleForCategory(0);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_21FC688BC();
      }

      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v57, (uint64_t)v121, v58) == 11)
      {
        int64_t v61 = -13;
        if (!a5) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v59, (uint64_t)v121, v60) != 21)
      {
        int64_t v61 = -26;
        if (!a5) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      uint64_t v63 = objc_msgSend_getInnermostNSError_(CRUtils, v69, (uint64_t)v121, v70);
      uint64_t v74 = objc_msgSend_makeClasses(self, v71, v72, v73);
      uint64_t v78 = objc_msgSend_count(v74, v75, v76, v77);

      if (v78)
      {
        unint64_t v82 = 0;
        while (1)
        {
          uint64_t v83 = objc_msgSend_makeClasses(self, v79, v80, v81);
          uint64_t v86 = objc_msgSend_objectAtIndexedSubscript_(v83, v84, v82, v85);

          uint64_t v90 = objc_msgSend_makeInstances(self, v87, v88, v89);
          uint64_t v93 = objc_msgSend_objectAtIndexedSubscript_(v90, v91, v82, v92);

          if (objc_msgSend_foundInMultiRequestError_dataClass_dataInstance_(CRUtils, v94, (uint64_t)v63, (uint64_t)v86, v93))break; {
          ++v82;
          }
          uint64_t v101 = objc_msgSend_makeClasses(self, v98, v99, v100);
          unint64_t v105 = objc_msgSend_count(v101, v102, v103, v104);

          int64_t v61 = -26;
          if (v105 <= v82) {
            goto LABEL_20;
          }
        }
        uint64_t v110 = objc_msgSend_handler(self, v95, v96, v97);
        uint64_t v114 = objc_msgSend_partSPC(self, v111, v112, v113);
        uint64_t v116 = objc_msgSend_spcInPartSPC_withDataClass_(v110, v115, (uint64_t)v114, (uint64_t)v86);
        objc_msgSend_setFailedSPC_(self, v117, (uint64_t)v116, v118);
      }
      goto LABEL_41;
    }
    uint64_t v106 = handleForCategory(0);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FBF2000, v106, OS_LOG_TYPE_DEFAULT, "MAKE Successful", buf, 2u);
    }

    id v119 = 0;
    int v108 = objc_msgSend__commitData_fdrlocal_fdrError_(self, v107, (uint64_t)v54, (uint64_t)a4, &v119);
    id v109 = v119;
    uint64_t v55 = v109;
    if (!v108 || v109)
    {
      uint64_t v63 = handleForCategory(0);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        sub_21FC68924();
      }
LABEL_41:
      int64_t v61 = -26;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  uint64_t v65 = handleForCategory(0);
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
    sub_21FC6898C();
  }

  uint64_t v66 = (void *)MEMORY[0x263F087E8];
  uint64_t v122 = *MEMORY[0x263F08320];
  v123[0] = @"make classes and instances count mismatched";
  uint64_t v63 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v67, (uint64_t)v123, (uint64_t)&v122, 1);
  int64_t v61 = -26;
  uint64_t v55 = objc_msgSend_errorWithDomain_code_userInfo_(v66, v68, @"com.apple.corerepair", -26, v63);
  uint64_t v54 = 0;
LABEL_20:

  if (a5) {
LABEL_21:
  }
    *a5 = v55;
LABEL_22:

  return v61;
}

- (int64_t)performSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  id v21 = 0;
  int64_t v9 = objc_msgSend_CRFDRDataRepairRecover_fdrRemote_syncEAN_fdrError_(self, a2, (uint64_t)a4, (uint64_t)a3, 1, &v21);
  id v10 = v21;
  uint64_t v12 = v10;
  if (v9 || v10)
  {
    uint64_t v15 = handleForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_21FC689C0();
    }

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v16, (uint64_t)v12, v17) == 11) {
      int64_t v9 = -13;
    }
  }
  else
  {
    id v20 = 0;
    int64_t v9 = objc_msgSend_CRFDRPostRecoverVerify_fdrRemote_syncEAN_fdrError_(self, v11, (uint64_t)a4, (uint64_t)a3, 1, &v20);
    id v13 = v20;
    uint64_t v12 = v13;
    if (!v9 && !v13)
    {
      uint64_t v14 = handleForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_21FBF2000, v14, OS_LOG_TYPE_DEFAULT, "Partial Seal Successful", v19, 2u);
      }

      uint64_t v12 = 0;
      int64_t v9 = 0;
    }
  }
  if (a5) {
    *a5 = v12;
  }

  return v9;
}

@end