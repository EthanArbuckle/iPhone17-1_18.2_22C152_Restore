@interface CKDMMCSRequestOptions
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)allowsPowerNapScheduling;
- (BOOL)isCrossOwner;
- (BOOL)resolvedAutomaticallyRetryNetworkFailures;
- (BOOL)shouldCloneFileInAssetCache;
- (BOOL)useFORD;
- (BOOL)usesBackgroundSession;
- (C2MetricOptions)metricOptions;
- (C2NetworkingDelegate)networkingDelegate;
- (CKContainerID)containerID;
- (CKDMMCSRequestOptions)initWithOperation:(id)a3;
- (CKOperationMMCSRequestOptions)MMCSRequestOptions;
- (NSArray)zoneNames;
- (NSData)authPutResponse;
- (NSDictionary)authPutResponseHeaders;
- (NSNumber)cacheDeleteAvailableSpaceClass;
- (NSString)applicationBundleIdentifierForContainerAccess;
- (NSString)applicationBundleIdentifierForNetworkAttribution;
- (NSString)applicationSecondaryID;
- (NSString)deviceHardwareID;
- (NSString)topmostParentOperationGroupID;
- (NSString)topmostParentOperationGroupName;
- (NSString)topmostParentOperationID;
- (id)CKPropertiesDescription;
- (id)MMCSOptions;
- (id)description;
- (int64_t)clientQueuePriority;
- (int64_t)databaseScope;
- (int64_t)qualityOfService;
- (unint64_t)duetPreClearedMode;
- (unint64_t)networkServiceType;
- (unint64_t)resolvedDiscretionaryNetworkBehavior;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
- (void)setAllowsPowerNapScheduling:(BOOL)a3;
- (void)setApplicationBundleIdentifierForContainerAccess:(id)a3;
- (void)setApplicationBundleIdentifierForNetworkAttribution:(id)a3;
- (void)setApplicationSecondaryID:(id)a3;
- (void)setAuthPutResponse:(id)a3;
- (void)setAuthPutResponseHeaders:(id)a3;
- (void)setCacheDeleteAvailableSpaceClass:(id)a3;
- (void)setClientQueuePriority:(int64_t)a3;
- (void)setContainerID:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setDeviceHardwareID:(id)a3;
- (void)setDuetPreClearedMode:(unint64_t)a3;
- (void)setIsCrossOwner:(BOOL)a3;
- (void)setMMCSRequestOptions:(id)a3;
- (void)setMetricOptions:(id)a3;
- (void)setNetworkServiceType:(unint64_t)a3;
- (void)setNetworkingDelegate:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setResolvedAutomaticallyRetryNetworkFailures:(BOOL)a3;
- (void)setResolvedDiscretionaryNetworkBehavior:(unint64_t)a3;
- (void)setShouldCloneFileInAssetCache:(BOOL)a3;
- (void)setTopmostParentOperationGroupID:(id)a3;
- (void)setTopmostParentOperationGroupName:(id)a3;
- (void)setTopmostParentOperationID:(id)a3;
- (void)setUseFORD:(BOOL)a3;
- (void)setZoneNames:(id)a3;
@end

@implementation CKDMMCSRequestOptions

- (CKDMMCSRequestOptions)initWithOperation:(id)a3
{
  id v4 = a3;
  v99.receiver = self;
  v99.super_class = (Class)CKDMMCSRequestOptions;
  v7 = [(CKDMMCSRequestOptions *)&v99 init];
  if (v7)
  {
    v8 = objc_msgSend_container(v4, v5, v6);
    v7->_databaseScope = objc_msgSend_databaseScope(v4, v9, v10);
    uint64_t v13 = objc_msgSend_containerID(v8, v11, v12);
    containerID = v7->_containerID;
    v7->_containerID = (CKContainerID *)v13;

    v17 = objc_msgSend_topmostParentOperation(v4, v15, v16);
    v20 = objc_msgSend_operationInfo(v17, v18, v19);
    v23 = objc_msgSend_group(v20, v21, v22);
    uint64_t v26 = objc_msgSend_operationGroupID(v23, v24, v25);
    topmostParentOperationGroupID = v7->_topmostParentOperationGroupID;
    v7->_topmostParentOperationGroupID = (NSString *)v26;

    v30 = objc_msgSend_operationInfo(v17, v28, v29);
    v33 = objc_msgSend_group(v30, v31, v32);
    uint64_t v36 = objc_msgSend_name(v33, v34, v35);
    topmostParentOperationGroupName = v7->_topmostParentOperationGroupName;
    v7->_topmostParentOperationGroupName = (NSString *)v36;

    uint64_t v40 = objc_msgSend_operationID(v17, v38, v39);
    topmostParentOperationID = v7->_topmostParentOperationID;
    v7->_topmostParentOperationID = (NSString *)v40;

    uint64_t v44 = objc_msgSend_applicationBundleIdentifierForContainerAccess(v4, v42, v43);
    applicationBundleIdentifierForContainerAccess = v7->_applicationBundleIdentifierForContainerAccess;
    v7->_applicationBundleIdentifierForContainerAccess = (NSString *)v44;

    uint64_t v48 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(v4, v46, v47);
    applicationBundleIdentifierForNetworkAttribution = v7->_applicationBundleIdentifierForNetworkAttribution;
    v7->_applicationBundleIdentifierForNetworkAttribution = (NSString *)v48;

    uint64_t v52 = objc_msgSend_sourceApplicationSecondaryIdentifier(v4, v50, v51);
    applicationSecondaryID = v7->_applicationSecondaryID;
    v7->_applicationSecondaryID = (NSString *)v52;

    v7->_allowsCellularAccess = objc_msgSend_allowsCellularAccess(v4, v54, v55);
    v7->_allowsExpensiveNetworkAccess = objc_msgSend_allowsExpensiveNetworkAccess(v4, v56, v57);
    v60 = objc_msgSend_entitlements(v8, v58, v59);
    v7->_allowsPowerNapScheduling = objc_msgSend_hasDarkWakeNetworkReachabilityEnabledEntitlement(v60, v61, v62);

    v7->_qualityOfService = objc_msgSend_qualityOfService(v4, v63, v64);
    v7->_clientQueuePriority = objc_msgSend_clientQueuePriority(v4, v65, v66);
    v7->_resolvedAutomaticallyRetryNetworkFailures = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(v4, v67, v68);
    v7->_resolvedDiscretionaryNetworkBehavior = objc_msgSend_resolvedDiscretionaryNetworkBehavior(v4, v69, v70);
    v7->_duetPreClearedMode = objc_msgSend_duetPreClearedMode(v4, v71, v72);
    uint64_t v74 = objc_msgSend_metricOptionsForNetworkOperation_(MEMORY[0x1E4F50D50], v73, (uint64_t)v4);
    metricOptions = v7->_metricOptions;
    v7->_metricOptions = (C2MetricOptions *)v74;

    v78 = objc_msgSend_deviceContext(v4, v76, v77);
    v81 = objc_msgSend_testServer(v78, v79, v80);

    if (v81 && (objc_msgSend_useLiveServer(v81, v82, v83) & 1) == 0)
    {
      uint64_t v84 = objc_msgSend_networkingDelegate(v81, v82, v83);
      networkingDelegate = v7->_networkingDelegate;
      v7->_networkingDelegate = (C2NetworkingDelegate *)v84;
    }
    v7->_networkServiceType = objc_msgSend_networkServiceType(v4, v82, v83);
    uint64_t v88 = objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v86, v87);
    cacheDeleteAvailableSpaceClass = v7->_cacheDeleteAvailableSpaceClass;
    v7->_cacheDeleteAvailableSpaceClass = (NSNumber *)v88;

    if ((objc_msgSend_preferAnonymousRequests(v4, v90, v91) & 1) == 0)
    {
      uint64_t v94 = objc_msgSend_hardwareID(v8, v92, v93);
      deviceHardwareID = v7->_deviceHardwareID;
      v7->_deviceHardwareID = (NSString *)v94;
    }
    uint64_t v96 = objc_msgSend_MMCSRequestOptions(v4, v92, v93);
    MMCSRequestOptions = v7->_MMCSRequestOptions;
    v7->_MMCSRequestOptions = (CKOperationMMCSRequestOptions *)v96;
  }
  return v7;
}

- (id)CKPropertiesDescription
{
  v3 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], a2, 3);
  id v4 = NSString;
  v7 = objc_msgSend_containerID(self, v5, v6);
  uint64_t v10 = objc_msgSend_ckShortDescription(v7, v8, v9);
  uint64_t v13 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v11, v12);
  v15 = objc_msgSend_stringWithFormat_(v4, v14, @"containerID=%@, applicationBundleIdentifierForNetworkAttribution=\"%@\"", v10, v13);
  objc_msgSend_addObject_(v3, v16, (uint64_t)v15);

  uint64_t v19 = objc_msgSend_applicationSecondaryID(self, v17, v18);

  if (v19)
  {
    uint64_t v22 = NSString;
    v23 = objc_msgSend_applicationSecondaryID(self, v20, v21);
    uint64_t v25 = objc_msgSend_stringWithFormat_(v22, v24, @"applicationSecondaryID=\"%@\"", v23);
    objc_msgSend_addObject_(v3, v26, (uint64_t)v25);
  }
  v27 = NSString;
  objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v20, v21);
  v28 = CKStringForDiscretionaryNetworkBehavior();
  v30 = objc_msgSend_stringWithFormat_(v27, v29, @"discretionary=\"%@\"", v28);
  objc_msgSend_addObject_(v3, v31, (uint64_t)v30);

  uint64_t v32 = NSString;
  objc_msgSend_duetPreClearedMode(self, v33, v34);
  uint64_t v35 = CKStringForDuetPreClearedMode();
  v37 = objc_msgSend_stringWithFormat_(v32, v36, @"duetPreClearedMode=\"%@\"", v35);
  objc_msgSend_addObject_(v3, v38, (uint64_t)v37);

  uint64_t v40 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v39, 4);
  if (objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v41, v42)) {
    objc_msgSend_addObject_(v40, v43, @"automatically-retry-network-failures");
  }
  if (objc_msgSend_allowsCellularAccess(self, v43, v44)) {
    objc_msgSend_addObject_(v40, v45, @"allows-cellular");
  }
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v45, v46)) {
    objc_msgSend_addObject_(v40, v47, @"allows-expensive");
  }
  if (objc_msgSend_allowsPowerNapScheduling(self, v47, v48)) {
    objc_msgSend_addObject_(v40, v49, @"allows-power-nap-scheduling");
  }
  uint64_t v51 = objc_msgSend_MMCSRequestOptions(self, v49, v50);
  int v54 = objc_msgSend_resumableContainerLimpMode(v51, v52, v53);

  if (v54) {
    objc_msgSend_addObject_(v40, v55, @"resumable-container-limp-mode");
  }
  uint64_t v57 = objc_msgSend_MMCSRequestOptions(self, v55, v56);
  int v60 = objc_msgSend_chunkingLibraryCorruptionMode(v57, v58, v59);

  if (v60) {
    objc_msgSend_addObject_(v40, v61, @"chunking-library-corruption-mode");
  }
  if (objc_msgSend_count(v40, v61, v62))
  {
    uint64_t v64 = NSString;
    v65 = objc_msgSend_componentsJoinedByString_(v40, v63, @"|");
    v67 = objc_msgSend_stringWithFormat_(v64, v66, @"flags=%@", v65);
    objc_msgSend_addObject_(v3, v68, (uint64_t)v67);
  }
  v69 = objc_msgSend_componentsJoinedByString_(v3, v63, @", ");

  return v69;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSRequestOptions *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)usesBackgroundSession
{
  char v4 = objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, a2, v2);
  uint64_t v7 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v5, v6);
  if (objc_msgSend_duetPreClearedMode(self, v8, v9) | v7) {
    return 1;
  }
  else {
    return v4;
  }
}

- (id)MMCSOptions
{
  v3 = objc_opt_new();
  char v4 = objc_opt_new();
  uint64_t v7 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v5, v6);
  uint64_t v10 = objc_msgSend_length(v7, v8, v9);

  if (v10)
  {
    uint64_t v13 = objc_msgSend_applicationBundleIdentifierForNetworkAttribution(self, v11, v12);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v14, (uint64_t)v13, *MEMORY[0x1E4F739A8]);
  }
  v15 = objc_msgSend_applicationSecondaryID(self, v11, v12);
  uint64_t v18 = objc_msgSend_length(v15, v16, v17);

  if (v18)
  {
    uint64_t v21 = objc_msgSend_applicationSecondaryID(self, v19, v20);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)v21, *MEMORY[0x1E4F739B0]);
  }
  v23 = objc_opt_new();
  uint64_t v26 = objc_msgSend_containerID(self, v24, v25);
  uint64_t v29 = objc_msgSend_containerIdentifier(v26, v27, v28);
  uint64_t v32 = objc_msgSend_length(v29, v30, v31);

  if (v32)
  {
    uint64_t v35 = objc_msgSend_containerID(self, v33, v34);
    v38 = objc_msgSend_containerIdentifier(v35, v36, v37);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v39, (uint64_t)v38, @"X-CloudKit-Container");
  }
  uint64_t v40 = objc_msgSend_containerID(self, v33, v34);
  if (objc_msgSend_environment(v40, v41, v42) == 1)
  {
    uint64_t v44 = @"production";
    objc_msgSend_setObject_forKeyedSubscript_(v23, v43, @"production", 0x1F204D310);
  }
  else
  {
    uint64_t v44 = @"sandbox";
    objc_msgSend_setObject_forKeyedSubscript_(v23, v43, @"sandbox", 0x1F204D310);
  }

  objc_msgSend_databaseScope(self, v45, v46);
  uint64_t v47 = CKDatabaseScopeString();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v48, (uint64_t)v47, 0x1F204D330);

  objc_msgSend_duetPreClearedMode(self, v49, v50);
  uint64_t v51 = CKStringForDuetPreClearedMode();
  objc_msgSend_setObject_forKeyedSubscript_(v23, v52, (uint64_t)v51, 0x1F204D350);

  uint64_t v55 = objc_msgSend_topmostParentOperationID(self, v53, v54);
  uint64_t v58 = objc_msgSend_length(v55, v56, v57);

  if (v58)
  {
    v61 = objc_msgSend_topmostParentOperationID(self, v59, v60);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v62, (uint64_t)v61, 0x1F204D170);
  }
  v63 = objc_msgSend_topmostParentOperationGroupID(self, v59, v60);
  uint64_t v66 = objc_msgSend_length(v63, v64, v65);

  if (v66)
  {
    v69 = objc_msgSend_topmostParentOperationGroupID(self, v67, v68);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v70, (uint64_t)v69, 0x1F204D190);
  }
  v71 = objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v67, v68);
  uint64_t v74 = objc_msgSend_length(v71, v72, v73);

  if (v74)
  {
    uint64_t v77 = objc_msgSend_applicationBundleIdentifierForContainerAccess(self, v75, v76);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v78, (uint64_t)v77, @"X-CloudKit-App-BundleID");
  }
  v79 = objc_msgSend_topmostParentOperationGroupName(self, v75, v76);
  uint64_t v82 = objc_msgSend_length(v79, v80, v81);

  if (v82)
  {
    v85 = objc_msgSend_containerID(self, v83, v84);
    uint64_t v88 = objc_msgSend_specialContainerType(v85, v86, v87);

    if (v88 == 5)
    {
      uint64_t v91 = objc_msgSend_topmostParentOperationGroupName(self, v89, v90);
      uint64_t v94 = objc_msgSend_CKProbablySafeHeaderValue(v91, v92, v93);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v95, (uint64_t)v94, 0x1F204D1B0);
    }
    uint64_t v96 = objc_msgSend_topmostParentOperationGroupName(self, v89, v90);
    objc_super v99 = objc_msgSend_CKBase64EncodedStructuredHeaderValueByteSequence(v96, v97, v98);
    objc_msgSend_setObject_forKeyedSubscript_(v23, v100, (uint64_t)v99, 0x1F204D1D0);
  }
  v101 = objc_msgSend_zoneNames(self, v83, v84);
  uint64_t v104 = objc_msgSend_count(v101, v102, v103);

  if (v104)
  {
    v107 = objc_msgSend_zoneNames(self, v105, v106);
    v109 = objc_msgSend_componentsJoinedByString_(v107, v108, @",");
    objc_msgSend_setObject_forKeyedSubscript_(v23, v110, (uint64_t)v109, @"X-CloudKit-Zones");
  }
  uint64_t v111 = objc_msgSend_deviceHardwareID(self, v105, v106);
  if (v111)
  {
    v114 = (void *)v111;
    v115 = objc_msgSend_deviceHardwareID(self, v112, v113);
    uint64_t v118 = objc_msgSend_length(v115, v116, v117);

    if (v118)
    {
      v120 = objc_msgSend_deviceHardwareID(self, v112, v119);
      objc_msgSend_setObject_forKeyedSubscript_(v23, v121, (uint64_t)v120, @"X-CloudKit-DeviceID");
    }
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v112, (uint64_t)v23, *MEMORY[0x1E4F73930]);
  v122 = (void *)MEMORY[0x1E4F28ED0];
  v125 = objc_msgSend_containerID(self, v123, v124);
  uint64_t v128 = objc_msgSend_c2ContainerType(v125, v126, v127);
  v130 = objc_msgSend_numberWithLong_(v122, v129, v128);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v131, (uint64_t)v130, *MEMORY[0x1E4F73910]);

  int v134 = objc_msgSend_allowsCellularAccess(self, v132, v133);
  uint64_t v136 = *MEMORY[0x1E4F1CFD0];
  uint64_t v137 = *MEMORY[0x1E4F1CFC8];
  if (v134) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v135, *MEMORY[0x1E4F1CFD0], *MEMORY[0x1E4F738C0]);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v135, *MEMORY[0x1E4F1CFC8], *MEMORY[0x1E4F738C0]);
  }
  if (objc_msgSend_allowsExpensiveNetworkAccess(self, v138, v139)) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v140, v136, *MEMORY[0x1E4F738C8]);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v140, v137, *MEMORY[0x1E4F738C8]);
  }
  if (objc_msgSend_allowsPowerNapScheduling(self, v141, v142)) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v143, v136, *MEMORY[0x1E4F738D0]);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v143, v137, *MEMORY[0x1E4F738D0]);
  }
  v146 = objc_msgSend_networkingDelegate(self, v144, v145);

  if (v146)
  {
    v149 = objc_msgSend_networkingDelegate(self, v147, v148);
    objc_msgSend_setObject_forKeyedSubscript_(v4, v150, (uint64_t)v149, *MEMORY[0x1E4F73958]);
  }
  uint64_t v152 = objc_msgSend_networkServiceType(self, v147, v148);
  if (!v152)
  {
    if (!objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v151, 0))
    {
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v151, 0);
      goto LABEL_41;
    }
    uint64_t v152 = 3;
  }
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E4F28ED0], v151, v152);
  v153 = LABEL_41:;
  objc_msgSend_setObject_forKeyedSubscript_(v4, v154, (uint64_t)v153, *MEMORY[0x1E4F73950]);

  v155 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v158 = objc_msgSend_qualityOfService(self, v156, v157);
  v160 = objc_msgSend_numberWithInteger_(v155, v159, v158);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v161, (uint64_t)v160, *MEMORY[0x1E4F73970]);

  uint64_t v164 = objc_msgSend_resolvedDiscretionaryNetworkBehavior(self, v162, v163);
  if (v164 == 2) {
    objc_msgSend_numberWithLong_(MEMORY[0x1E4F28ED0], v165, 2);
  }
  else {
  v166 = objc_msgSend_numberWithLong_(MEMORY[0x1E4F28ED0], v165, v164 == 1);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v167, (uint64_t)v166, *MEMORY[0x1E4F73918]);

  uint64_t v170 = objc_msgSend_duetPreClearedMode(self, v168, v169);
  if (v170 == 2) {
    objc_msgSend_numberWithLong_(MEMORY[0x1E4F28ED0], v171, 2);
  }
  else {
  v172 = objc_msgSend_numberWithLong_(MEMORY[0x1E4F28ED0], v171, v170 == 1);
  }
  objc_msgSend_setObject_forKeyedSubscript_(v4, v173, (uint64_t)v172, *MEMORY[0x1E4F73920]);

  if (objc_msgSend_resolvedAutomaticallyRetryNetworkFailures(self, v174, v175)) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v176, v136, *MEMORY[0x1E4F738D8]);
  }
  else {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v176, v137, *MEMORY[0x1E4F738D8]);
  }
  metricOptions = self->_metricOptions;
  if (metricOptions) {
    objc_msgSend_setObject_forKeyedSubscript_(v4, v177, (uint64_t)metricOptions, *MEMORY[0x1E4F73948]);
  }
  if (objc_msgSend_usesBackgroundSession(self, v177, (uint64_t)metricOptions))
  {
    v181 = objc_msgSend_sharedURLSessionPool(CKDURLSessionPool, v179, v180);
    uint64_t v184 = objc_msgSend_backgroundSessionConnectionPoolLimit(v181, v182, v183);

    if (v184)
    {
      v185 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v179, v184);
      objc_msgSend_setObject_forKeyedSubscript_(v4, v186, (uint64_t)v185, *MEMORY[0x1E4F738F0]);

      v189 = objc_msgSend_backgroundSessionConnectionPoolName(CKDURLSessionPool, v187, v188);
      objc_msgSend_setObject_forKeyedSubscript_(v4, v190, (uint64_t)v189, *MEMORY[0x1E4F738E8]);
    }
  }
  objc_msgSend_setObject_forKeyedSubscript_(v3, v179, (uint64_t)v4, *MEMORY[0x1E4F739B8]);
  uint64_t v193 = objc_msgSend_authPutResponse(self, v191, v192);
  if (v193)
  {
    v196 = (void *)v193;
    v197 = objc_msgSend_authPutResponse(self, v194, v195);
    uint64_t v200 = objc_msgSend_length(v197, v198, v199);

    if (v200)
    {
      v201 = objc_msgSend_authPutResponse(self, v194, v195);
      objc_msgSend_setObject_forKeyedSubscript_(v3, v202, (uint64_t)v201, *MEMORY[0x1E4F73960]);
    }
  }
  v203 = objc_msgSend_authPutResponseHeaders(self, v194, v195);

  if (v203)
  {
    v206 = objc_msgSend_authPutResponseHeaders(self, v204, v205);
    v208 = objc_msgSend_CKObjectForKeyCaseInsensitive_(v206, v207, @"x-apple-mmcs-proto-version");

    if (v208) {
      objc_msgSend_setObject_forKeyedSubscript_(v3, v209, (uint64_t)v208, *MEMORY[0x1E4F739A0]);
    }
  }
  v210 = objc_msgSend_cacheDeleteAvailableSpaceClass(self, v204, v205);

  if (v210)
  {
    v213 = objc_msgSend_cacheDeleteAvailableSpaceClass(self, v211, v212);
    objc_msgSend_setObject_forKeyedSubscript_(v3, v214, (uint64_t)v213, *MEMORY[0x1E4F738F8]);

    objc_msgSend_setObject_forKeyedSubscript_(v3, v215, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F73928]);
  }
  v216 = objc_msgSend_MMCSRequestOptions(self, v211, v212);
  int v219 = objc_msgSend_resumableContainerLimpMode(v216, v217, v218);

  if (v219) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v220, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F73980]);
  }
  v222 = objc_msgSend_MMCSRequestOptions(self, v220, v221);
  int v225 = objc_msgSend_chunkingLibraryCorruptionMode(v222, v223, v224);

  if (v225) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v226, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F73900]);
  }
  v228 = objc_msgSend_MMCSRequestOptions(self, v226, v227);
  int v231 = objc_msgSend_insufficientDiskSpaceMode(v228, v229, v230);

  if (v231) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v232, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F73938]);
  }
  v233 = objc_msgSend_numberWithInteger_(MEMORY[0x1E4F28ED0], v232, self->_clientQueuePriority);
  objc_msgSend_setObject_forKeyedSubscript_(v3, v234, (uint64_t)v233, *MEMORY[0x1E4F73968]);

  if (objc_msgSend_useFORD(self, v235, v236)) {
    objc_msgSend_setObject_forKeyedSubscript_(v3, v237, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F739C0]);
  }

  return v3;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (NSString)topmostParentOperationID
{
  return self->_topmostParentOperationID;
}

- (void)setTopmostParentOperationID:(id)a3
{
}

- (NSString)topmostParentOperationGroupID
{
  return self->_topmostParentOperationGroupID;
}

- (void)setTopmostParentOperationGroupID:(id)a3
{
}

- (NSString)topmostParentOperationGroupName
{
  return self->_topmostParentOperationGroupName;
}

- (void)setTopmostParentOperationGroupName:(id)a3
{
}

- (NSString)applicationBundleIdentifierForContainerAccess
{
  return self->_applicationBundleIdentifierForContainerAccess;
}

- (void)setApplicationBundleIdentifierForContainerAccess:(id)a3
{
}

- (NSString)applicationBundleIdentifierForNetworkAttribution
{
  return self->_applicationBundleIdentifierForNetworkAttribution;
}

- (void)setApplicationBundleIdentifierForNetworkAttribution:(id)a3
{
}

- (NSString)applicationSecondaryID
{
  return self->_applicationSecondaryID;
}

- (void)setApplicationSecondaryID:(id)a3
{
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (void)setZoneNames:(id)a3
{
}

- (NSString)deviceHardwareID
{
  return self->_deviceHardwareID;
}

- (void)setDeviceHardwareID:(id)a3
{
}

- (NSData)authPutResponse
{
  return self->_authPutResponse;
}

- (void)setAuthPutResponse:(id)a3
{
}

- (NSDictionary)authPutResponseHeaders
{
  return self->_authPutResponseHeaders;
}

- (void)setAuthPutResponseHeaders:(id)a3
{
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (BOOL)allowsPowerNapScheduling
{
  return self->_allowsPowerNapScheduling;
}

- (void)setAllowsPowerNapScheduling:(BOOL)a3
{
  self->_allowsPowerNapScheduling = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)clientQueuePriority
{
  return self->_clientQueuePriority;
}

- (void)setClientQueuePriority:(int64_t)a3
{
  self->_clientQueuePriority = a3;
}

- (BOOL)resolvedAutomaticallyRetryNetworkFailures
{
  return self->_resolvedAutomaticallyRetryNetworkFailures;
}

- (void)setResolvedAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_resolvedAutomaticallyRetryNetworkFailures = a3;
}

- (unint64_t)resolvedDiscretionaryNetworkBehavior
{
  return self->_resolvedDiscretionaryNetworkBehavior;
}

- (void)setResolvedDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_resolvedDiscretionaryNetworkBehavior = a3;
}

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (void)setMetricOptions:(id)a3
{
}

- (BOOL)isCrossOwner
{
  return self->_isCrossOwner;
}

- (void)setIsCrossOwner:(BOOL)a3
{
  self->_isCrossOwner = a3;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  return self->_cacheDeleteAvailableSpaceClass;
}

- (void)setCacheDeleteAvailableSpaceClass:(id)a3
{
}

- (BOOL)shouldCloneFileInAssetCache
{
  return self->_shouldCloneFileInAssetCache;
}

- (void)setShouldCloneFileInAssetCache:(BOOL)a3
{
  self->_shouldCloneFileInAssetCache = a3;
}

- (BOOL)useFORD
{
  return self->_useFORD;
}

- (void)setUseFORD:(BOOL)a3
{
  self->_useFORD = a3;
}

- (C2NetworkingDelegate)networkingDelegate
{
  return self->_networkingDelegate;
}

- (void)setNetworkingDelegate:(id)a3
{
}

- (unint64_t)networkServiceType
{
  return self->_networkServiceType;
}

- (void)setNetworkServiceType:(unint64_t)a3
{
  self->_networkServiceType = a3;
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_networkingDelegate, 0);
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_authPutResponseHeaders, 0);
  objc_storeStrong((id *)&self->_authPutResponse, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_applicationSecondaryID, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierForContainerAccess, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationGroupName, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationGroupID, 0);
  objc_storeStrong((id *)&self->_topmostParentOperationID, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end