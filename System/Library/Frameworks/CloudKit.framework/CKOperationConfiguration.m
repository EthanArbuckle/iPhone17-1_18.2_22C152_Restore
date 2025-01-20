@interface CKOperationConfiguration
+ (BOOL)supportsSecureCoding;
+ (CKOperationConfiguration)defaultConvenienceOperationConfiguration;
+ (void)initialize;
- (BGSystemTask)systemTask;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)automaticallyRetryNetworkFailures;
- (BOOL)discretionarySchedulingForEntireOperation;
- (BOOL)hasAllowsExpensiveNetworkAccess;
- (BOOL)hasAutomaticallyRetryNetworkFailures;
- (BOOL)hasDiscretionaryNetworkBehavior;
- (BOOL)hasQualityOfService;
- (BOOL)hasXPCActivity;
- (BOOL)isCloudKitSupportOperation;
- (BOOL)isLongLived;
- (BOOL)preferAnonymousRequests;
- (BOOL)xpcActivityAutomaticallyDefer;
- (CKAssetDownloadStagingManager)assetDownloadStagingManager;
- (CKContainer)container;
- (CKOperationConfiguration)init;
- (CKOperationConfiguration)initWithCoder:(id)a3;
- (CKSchedulerActivity)schedulerActivity;
- (CKXPCActivity)ckXPCActivity;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSDictionary)unitTestOverrides;
- (NSMutableArray)mTestErrorInducerBoxes;
- (NSMutableArray)mTestResultOverlayBoxes;
- (NSNumber)cacheDeleteAvailableSpaceClass;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSQualityOfService)qualityOfService;
- (NSString)_sourceApplicationSecondaryIdentifier;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)sourceApplicationBundleIdentifier;
- (NSTimeInterval)timeoutIntervalForRequest;
- (NSTimeInterval)timeoutIntervalForResource;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resolveAgainstGenericConfiguration:(id)a3;
- (id)testErrorInducerBoxes;
- (id)testResultOverlayBoxes;
- (unint64_t)discretionaryNetworkBehavior;
- (unint64_t)requestOriginator;
- (void)_commonInit;
- (void)addTestErrorInducerBox:(id)a3;
- (void)addTestResultOverlayBox:(id)a3;
- (void)addUnitTestOverrides:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeTestErrorInducerBoxWithID:(id)a3;
- (void)removeTestResultOverlayBoxWithID:(id)a3;
- (void)removeUnitTestOverride:(id)a3;
- (void)setAdditionalRequestHTTPHeaders:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess;
- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3;
- (void)setApplicationBundleIdentifierOverride:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setAssetDownloadStagingManager:(id)a3;
- (void)setAutomaticallyRetryNetworkFailures:(BOOL)a3;
- (void)setCKXPCActivity:(id)a3;
- (void)setCacheDeleteAvailableSpaceClass:(id)a3;
- (void)setContainer:(CKContainer *)container;
- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3;
- (void)setDiscretionarySchedulingForEntireOperation:(BOOL)a3;
- (void)setHasAllowsExpensiveNetworkAccess:(BOOL)a3;
- (void)setHasAutomaticallyRetryNetworkFailures:(BOOL)a3;
- (void)setHasDiscretionaryNetworkBehavior:(BOOL)a3;
- (void)setHasQualityOfService:(BOOL)a3;
- (void)setIsCloudKitSupportOperation:(BOOL)a3;
- (void)setLongLived:(BOOL)longLived;
- (void)setPreferAnonymousRequests:(BOOL)a3;
- (void)setPrivacyProxyFailClosedOverride:(id)a3;
- (void)setQualityOfService:(NSQualityOfService)qualityOfService;
- (void)setRequestOriginator:(unint64_t)a3;
- (void)setSchedulerActivity:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setSystemTask:(id)a3;
- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest;
- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource;
- (void)setXPCActivity:(id)a3;
- (void)setXpcActivity:(id)a3;
- (void)setXpcActivityAutomaticallyDefer:(BOOL)a3;
- (void)set_sourceApplicationSecondaryIdentifier:(id)a3;
@end

@implementation CKOperationConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemTask, 0);
  objc_storeStrong((id *)&self->_mTestResultOverlayBoxes, 0);
  objc_storeStrong((id *)&self->_mTestErrorInducerBoxes, 0);
  objc_storeStrong((id *)&self->_unitTestOverrides, 0);
  objc_storeStrong((id *)&self->_assetDownloadStagingManager, 0);
  objc_storeStrong((id *)&self->_cacheDeleteAvailableSpaceClass, 0);
  objc_storeStrong((id *)&self->_additionalRequestHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_schedulerActivity, 0);
  objc_storeStrong((id *)&self->_ckXPCActivity, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  objc_sync_enter(v3);
  v7 = objc_alloc_init((Class)objc_opt_class());
  if (v3 && v3->_hasContainer)
  {
    v8 = objc_msgSend_container(v3, v4, v5, v6);
    objc_msgSend_setContainer_(v7, v9, (uint64_t)v8, v10);
  }
  if (objc_msgSend_hasQualityOfService(v3, v4, v5, v6))
  {
    uint64_t v14 = objc_msgSend_qualityOfService(v3, v11, v12, v13);
    objc_msgSend_setQualityOfService_(v7, v15, v14, v16);
  }
  if (v3 && v3->_hasAllowsCellularAccess)
  {
    uint64_t v17 = objc_msgSend_allowsCellularAccess(v3, v11, v12, v13);
    objc_msgSend_setAllowsCellularAccess_(v7, v18, v17, v19);
  }
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v3, v11, v12, v13))
  {
    uint64_t v23 = objc_msgSend_allowsExpensiveNetworkAccess(v3, v20, v21, v22);
    objc_msgSend_setAllowsExpensiveNetworkAccess_(v7, v24, v23, v25);
  }
  if (v3)
  {
    if (v3->_hasLongLived)
    {
      uint64_t isLongLived = objc_msgSend_isLongLived(v3, v20, v21, v22);
      objc_msgSend_setLongLived_(v7, v27, isLongLived, v28);
    }
    if (v3->_hasTimeoutIntervalForRequest)
    {
      objc_msgSend_timeoutIntervalForRequest(v3, v20, v21, v22);
      objc_msgSend_setTimeoutIntervalForRequest_(v7, v29, v30, v31);
    }
    if (v3->_hasTimeoutIntervalForResource)
    {
      objc_msgSend_timeoutIntervalForResource(v3, v20, v21, v22);
      objc_msgSend_setTimeoutIntervalForResource_(v7, v32, v33, v34);
    }
  }
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v3, v20, v21, v22))
  {
    uint64_t v38 = objc_msgSend_automaticallyRetryNetworkFailures(v3, v35, v36, v37);
    objc_msgSend_setAutomaticallyRetryNetworkFailures_(v7, v39, v38, v40);
  }
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v3, v35, v36, v37))
  {
    uint64_t v44 = objc_msgSend_discretionaryNetworkBehavior(v3, v41, v42, v43);
    objc_msgSend_setDiscretionaryNetworkBehavior_(v7, v45, v44, v46);
  }
  if (v3)
  {
    if (v3->_hasCKXPCActivity)
    {
      v47 = objc_msgSend_ckXPCActivity(v3, v41, v42, v43);
      objc_msgSend_setCKXPCActivity_(v7, v48, (uint64_t)v47, v49);
    }
    if (v3->_hasXPCActivityAutomaticallyDefer)
    {
      uint64_t v50 = objc_msgSend_xpcActivityAutomaticallyDefer(v3, v41, v42, v43);
      objc_msgSend_setXpcActivityAutomaticallyDefer_(v7, v51, v50, v52);
    }
    if (v3->_hasSchedulerActivity)
    {
      v53 = objc_msgSend_schedulerActivity(v3, v41, v42, v43);
      objc_msgSend_setSchedulerActivity_(v7, v54, (uint64_t)v53, v55);
    }
    if (v3->_hasSystemTask)
    {
      v56 = objc_msgSend_systemTask(v3, v41, v42, v43);
      objc_msgSend_setSystemTask_(v7, v57, (uint64_t)v56, v58);
    }
    if (v3->_hasDiscretionarySchedulingForEntireOperation)
    {
      uint64_t v59 = objc_msgSend_discretionarySchedulingForEntireOperation(v3, v41, v42, v43);
      objc_msgSend_setDiscretionarySchedulingForEntireOperation_(v7, v60, v59, v61);
    }
    if (v3->_hasPreferAnonymousRequests)
    {
      uint64_t v62 = objc_msgSend_preferAnonymousRequests(v3, v41, v42, v43);
      objc_msgSend_setPreferAnonymousRequests_(v7, v63, v62, v64);
    }
    if (v3->_hasSourceApplicationBundleIdentifier)
    {
      v65 = objc_msgSend_sourceApplicationBundleIdentifier(v3, v41, v42, v43);
      objc_msgSend_setSourceApplicationBundleIdentifier_(v7, v66, (uint64_t)v65, v67);
    }
    if (v3->_hasSourceApplicationSecondaryIdentifier)
    {
      v68 = objc_msgSend__sourceApplicationSecondaryIdentifier(v3, v41, v42, v43);
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v7, v69, (uint64_t)v68, v70);
    }
    if (v3->_hasPrivacyProxyFailClosedOverride)
    {
      v71 = objc_msgSend_privacyProxyFailClosedOverride(v3, v41, v42, v43);
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v7, v72, (uint64_t)v71, v73);
    }
    if (v3->_hasApplicationBundleIdentifierOverrideForContainerAccess)
    {
      v74 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v3, v41, v42, v43);
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v7, v75, (uint64_t)v74, v76);
    }
    if (v3->_hasApplicationBundleIdentifierOverrideForNetworkAttribution)
    {
      v77 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v3, v41, v42, v43);
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v7, v78, (uint64_t)v77, v79);
    }
    if (v3->_hasAdditionalRequestHTTPHeaders)
    {
      v80 = objc_msgSend_additionalRequestHTTPHeaders(v3, v41, v42, v43);
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v7, v81, (uint64_t)v80, v82);
    }
    if (v3->_hasIsCloudKitSupportOperation)
    {
      uint64_t isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v3, v41, v42, v43);
      objc_msgSend_setIsCloudKitSupportOperation_(v7, v84, isCloudKitSupportOperation, v85);
    }
    if (v3->_hasCacheDeleteAvailableSpaceClass)
    {
      v86 = objc_msgSend_cacheDeleteAvailableSpaceClass(v3, v41, v42, v43);
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v7, v87, (uint64_t)v86, v88);
    }
    if (v3->_hasAssetDownloadStagingManager)
    {
      v89 = objc_msgSend_assetDownloadStagingManager(v3, v41, v42, v43);
      objc_msgSend_setAssetDownloadStagingManager_(v7, v90, (uint64_t)v89, v91);
    }
    if (v3->_hasRequestOriginator)
    {
      uint64_t v92 = objc_msgSend_requestOriginator(v3, v41, v42, v43);
      objc_msgSend_setRequestOriginator_(v7, v93, v92, v94);
    }
  }
  v95 = objc_msgSend_mTestErrorInducerBoxes(v3, v41, v42, v43);
  uint64_t v99 = objc_msgSend_mutableCopy(v95, v96, v97, v98);
  v100 = (void *)v7[23];
  v7[23] = v99;

  v104 = objc_msgSend_mTestResultOverlayBoxes(v3, v101, v102, v103);
  uint64_t v108 = objc_msgSend_mutableCopy(v104, v105, v106, v107);
  v109 = (void *)v7[24];
  v7[24] = v108;

  v113 = objc_msgSend_unitTestOverrides(v3, v110, v111, v112);
  uint64_t v117 = objc_msgSend_copy(v113, v114, v115, v116);
  v118 = (void *)v7[21];
  v7[21] = v117;

  objc_sync_exit(v3);
  return v7;
}

- (void)setRequestOriginator:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_requestOriginator = a3;
  obj->_hasRequestOriginator = 1;
  if (a3 == 2) {
    objc_msgSend_setQualityOfService_(obj, v4, 25, v5);
  }
  objc_sync_exit(obj);
}

- (void)setQualityOfService:(NSQualityOfService)qualityOfService
{
  obj = self;
  objc_sync_enter(obj);
  obj->_qualityOfService = qualityOfService;
  objc_msgSend_setHasQualityOfService_(obj, v4, 1, v5);
  objc_sync_exit(obj);
}

- (void)setHasQualityOfService:(BOOL)a3
{
  self->_hasQualityOfService = a3;
}

- (unint64_t)requestOriginator
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t requestOriginator = v2->_requestOriginator;
  objc_sync_exit(v2);

  return requestOriginator;
}

- (NSQualityOfService)qualityOfService
{
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasQualityOfService(v2, v3, v4, v5))
  {
    NSQualityOfService qualityOfService = v2->_qualityOfService;
  }
  else if (v2 {
         && v2->_hasContainer
  }
         && (objc_msgSend_container(v2, v6, v7, v8),
             uint64_t v10 = objc_claimAutoreleasedReturnValue(),
             (uint64_t v14 = v10) != 0))
  {
    v15 = objc_msgSend_options(v10, v11, v12, v13);
    NSQualityOfService qualityOfService = objc_msgSend_qualityOfService(v15, v16, v17, v18);
  }
  else
  {
    NSQualityOfService qualityOfService = NSQualityOfServiceDefault;
  }
  objc_sync_exit(v2);

  return qualityOfService;
}

- (BOOL)hasQualityOfService
{
  return self->_hasQualityOfService;
}

- (CKOperationConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKOperationConfiguration;
  v2 = [(CKOperationConfiguration *)&v8 init];
  uint64_t v6 = v2;
  if (v2) {
    objc_msgSend__commonInit(v2, v3, v4, v5);
  }
  return v6;
}

- (void)_commonInit
{
  v3 = (NSDictionary *)objc_opt_new();
  unitTestOverrides = self->_unitTestOverrides;
  self->_unitTestOverrides = v3;

  uint64_t v5 = (NSMutableArray *)objc_opt_new();
  mTestErrorInducerBoxes = self->_mTestErrorInducerBoxes;
  self->_mTestErrorInducerBoxes = v5;

  uint64_t v7 = (NSMutableArray *)objc_opt_new();
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  self->_mTestResultOverlayBoxes = v7;

  self->_unint64_t requestOriginator = 4;
}

- (NSDictionary)unitTestOverrides
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_unitTestOverrides;
  objc_sync_exit(v2);

  return v3;
}

- (NSMutableArray)mTestResultOverlayBoxes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSMutableArray)mTestErrorInducerBoxes
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (BOOL)hasDiscretionaryNetworkBehavior
{
  return self->_hasDiscretionaryNetworkBehavior;
}

- (BOOL)hasAutomaticallyRetryNetworkFailures
{
  return self->_hasAutomaticallyRetryNetworkFailures;
}

- (BOOL)hasAllowsExpensiveNetworkAccess
{
  return self->_hasAllowsExpensiveNetworkAccess;
}

- (void)setXpcActivity:(id)a3
{
}

- (void)setXPCActivity:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    uint64_t v6 = [CKXPCActivity alloc];
    v9 = objc_msgSend_initWithXPCActivity_(v6, v7, (uint64_t)v12, v8);
    objc_msgSend_setCKXPCActivity_(self, v10, (uint64_t)v9, v11);
  }
  else
  {
    objc_msgSend_setCKXPCActivity_(self, v4, 0, v5);
  }
}

- (void)setCKXPCActivity:(id)a3
{
  uint64_t v4 = (CKXPCActivity *)a3;
  obj = self;
  objc_sync_enter(obj);
  ckXPCActivity = obj->_ckXPCActivity;
  obj->_ckXPCActivity = v4;

  obj->_hasCKXPCActivity = 1;
  objc_sync_exit(obj);
}

- (CKXPCActivity)ckXPCActivity
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasCKXPCActivity) {
    v3 = v2->_ckXPCActivity;
  }
  else {
    v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

+ (CKOperationConfiguration)defaultConvenienceOperationConfiguration
{
  v2 = objc_opt_new();
  objc_msgSend_setDiscretionaryNetworkBehavior_(v2, v3, 0, v4);
  objc_msgSend_setAutomaticallyRetryNetworkFailures_(v2, v5, 0, v6);
  objc_msgSend_setAllowsCellularAccess_(v2, v7, 1, v8);
  uint64_t v9 = CKCurrentThreadQualityOfService();
  objc_msgSend_setQualityOfService_(v2, v10, v9, v11);

  return (CKOperationConfiguration *)v2;
}

- (id)resolveAgainstGenericConfiguration:(id)a3
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  uint64_t v8 = objc_msgSend_copy(self, v5, v6, v7);
  id v12 = (unsigned char *)v8;
  if (v4)
  {
    if ((v4[17] & 1) != 0 && (!v8 || (*(unsigned char *)(v8 + 17) & 1) == 0))
    {
      uint64_t v13 = objc_msgSend_container(v4, v9, v10, v11);
      objc_msgSend_setContainer_(v12, v14, (uint64_t)v13, v15);
    }
    if (objc_msgSend_hasQualityOfService(v4, v9, v10, v11)
      && (objc_msgSend_hasQualityOfService(v12, v16, v17, v18) & 1) == 0)
    {
      uint64_t v19 = objc_msgSend_qualityOfService(v4, v16, v17, v18);
      objc_msgSend_setQualityOfService_(v12, v20, v19, v21);
    }
    if ((v4[18] & 1) != 0 && (!v12 || (v12[18] & 1) == 0))
    {
      uint64_t v22 = objc_msgSend_allowsCellularAccess(v4, v16, v17, v18);
      objc_msgSend_setAllowsCellularAccess_(v12, v23, v22, v24);
    }
    if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v4, v16, v17, v18)
      && (objc_msgSend_hasAllowsExpensiveNetworkAccess(v12, v25, v26, v27) & 1) == 0)
    {
      uint64_t v28 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v25, v26, v27);
      objc_msgSend_setAllowsExpensiveNetworkAccess_(v12, v29, v28, v30);
    }
    if ((v4[20] & 1) != 0 && (!v12 || (v12[20] & 1) == 0))
    {
      uint64_t isLongLived = objc_msgSend_isLongLived(v4, v25, v26, v27);
      objc_msgSend_setLongLived_(v12, v32, isLongLived, v33);
    }
    if ((v4[21] & 1) != 0 && (!v12 || (v12[21] & 1) == 0))
    {
      objc_msgSend_timeoutIntervalForRequest(v4, v25, v26, v27);
      objc_msgSend_setTimeoutIntervalForRequest_(v12, v34, v35, v36);
    }
    if ((v4[22] & 1) != 0 && (!v12 || (v12[22] & 1) == 0))
    {
      objc_msgSend_timeoutIntervalForResource(v4, v25, v26, v27);
      objc_msgSend_setTimeoutIntervalForResource_(v12, v37, v38, v39);
    }
    if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v4, v25, v26, v27)
      && (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v12, v40, v41, v42) & 1) == 0)
    {
      uint64_t v43 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v40, v41, v42);
      objc_msgSend_setAutomaticallyRetryNetworkFailures_(v12, v44, v43, v45);
    }
    if (objc_msgSend_hasDiscretionaryNetworkBehavior(v4, v40, v41, v42)
      && (objc_msgSend_hasDiscretionaryNetworkBehavior(v12, v46, v47, v48) & 1) == 0)
    {
      uint64_t v49 = objc_msgSend_discretionaryNetworkBehavior(v4, v46, v47, v48);
      objc_msgSend_setDiscretionaryNetworkBehavior_(v12, v50, v49, v51);
    }
    if ((v4[27] & 1) != 0 && (!v12 || (v12[27] & 1) == 0))
    {
      uint64_t v52 = objc_msgSend_schedulerActivity(v4, v46, v47, v48);
      objc_msgSend_setSchedulerActivity_(v12, v53, (uint64_t)v52, v54);
    }
    if ((v4[25] & 1) != 0 && (!v12 || (v12[25] & 1) == 0))
    {
      uint64_t v55 = objc_msgSend_ckXPCActivity(v4, v46, v47, v48);
      objc_msgSend_setCKXPCActivity_(v12, v56, (uint64_t)v55, v57);
    }
    if ((v4[28] & 1) != 0 && (!v12 || (v12[28] & 1) == 0))
    {
      uint64_t v58 = objc_msgSend_systemTask(v4, v46, v47, v48);
      objc_msgSend_setSystemTask_(v12, v59, (uint64_t)v58, v60);
    }
    if ((v4[26] & 1) != 0 && (!v12 || (v12[26] & 1) == 0))
    {
      uint64_t v61 = objc_msgSend_xpcActivityAutomaticallyDefer(v4, v46, v47, v48);
      objc_msgSend_setXpcActivityAutomaticallyDefer_(v12, v62, v61, v63);
    }
    if ((v4[29] & 1) != 0 && (!v12 || (v12[29] & 1) == 0))
    {
      uint64_t v64 = objc_msgSend_discretionarySchedulingForEntireOperation(v4, v46, v47, v48);
      objc_msgSend_setDiscretionarySchedulingForEntireOperation_(v12, v65, v64, v66);
    }
    if ((v4[30] & 1) != 0 && (!v12 || (v12[30] & 1) == 0))
    {
      uint64_t v67 = objc_msgSend_preferAnonymousRequests(v4, v46, v47, v48);
      objc_msgSend_setPreferAnonymousRequests_(v12, v68, v67, v69);
    }
    if ((v4[31] & 1) != 0 && (!v12 || (v12[31] & 1) == 0))
    {
      uint64_t v70 = objc_msgSend_sourceApplicationBundleIdentifier(v4, v46, v47, v48);
      objc_msgSend_setSourceApplicationBundleIdentifier_(v12, v71, (uint64_t)v70, v72);
    }
    if ((v4[32] & 1) != 0 && (!v12 || (v12[32] & 1) == 0))
    {
      uint64_t v73 = objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v46, v47, v48);
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v12, v74, (uint64_t)v73, v75);
    }
    if ((v4[33] & 1) != 0 && (!v12 || (v12[33] & 1) == 0))
    {
      uint64_t v76 = objc_msgSend_privacyProxyFailClosedOverride(v4, v46, v47, v48);
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v12, v77, (uint64_t)v76, v78);
    }
    if ((v4[34] & 1) != 0 && (!v12 || (v12[34] & 1) == 0))
    {
      uint64_t v79 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v46, v47, v48);
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v12, v80, (uint64_t)v79, v81);
    }
    if ((v4[35] & 1) != 0 && (!v12 || (v12[35] & 1) == 0))
    {
      uint64_t v82 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v46, v47, v48);
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v12, v83, (uint64_t)v82, v84);
    }
    if ((v4[36] & 1) != 0 && (!v12 || (v12[36] & 1) == 0))
    {
      uint64_t v85 = objc_msgSend_additionalRequestHTTPHeaders(v4, v46, v47, v48);
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v12, v86, (uint64_t)v85, v87);
    }
    if ((v4[37] & 1) != 0 && (!v12 || (v12[37] & 1) == 0))
    {
      uint64_t isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v46, v47, v48);
      objc_msgSend_setIsCloudKitSupportOperation_(v12, v89, isCloudKitSupportOperation, v90);
    }
    if ((v4[38] & 1) != 0 && (!v12 || (v12[38] & 1) == 0))
    {
      uint64_t v91 = objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v46, v47, v48);
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v12, v92, (uint64_t)v91, v93);
    }
    if ((v4[39] & 1) != 0 && (!v12 || (v12[39] & 1) == 0))
    {
      uint64_t v94 = objc_msgSend_assetDownloadStagingManager(v4, v46, v47, v48);
      objc_msgSend_setAssetDownloadStagingManager_(v12, v95, (uint64_t)v94, v96);
    }
    if ((v4[40] & 1) != 0 && (!v12 || (v12[40] & 1) == 0))
    {
      uint64_t v97 = objc_msgSend_requestOriginator(v4, v46, v47, v48);
      objc_msgSend_setRequestOriginator_(v12, v98, v97, v99);
    }
    v100 = objc_msgSend_unitTestOverrides(v4, v46, v47, v48);
    uint64_t v104 = objc_msgSend_count(v100, v101, v102, v103);

    if (v104)
    {
      uint64_t v108 = objc_msgSend_unitTestOverrides(v4, v105, v106, v107);
      objc_msgSend_addUnitTestOverrides_(v12, v109, (uint64_t)v108, v110);
    }
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    uint64_t v111 = objc_msgSend_testErrorInducerBoxes(v4, v105, v106, v107);
    uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v136, (uint64_t)v141, 16);
    if (v113)
    {
      uint64_t v116 = v113;
      uint64_t v117 = *(void *)v137;
      do
      {
        uint64_t v118 = 0;
        do
        {
          if (*(void *)v137 != v117) {
            objc_enumerationMutation(v111);
          }
          objc_msgSend_addTestErrorInducerBox_(v12, v114, *(void *)(*((void *)&v136 + 1) + 8 * v118++), v115);
        }
        while (v116 != v118);
        uint64_t v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v136, (uint64_t)v141, 16);
      }
      while (v116);
    }

    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    v122 = objc_msgSend_testResultOverlayBoxes(v4, v119, v120, v121, 0);
    uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v123, (uint64_t)&v132, (uint64_t)v140, 16);
    if (v124)
    {
      uint64_t v127 = v124;
      uint64_t v128 = *(void *)v133;
      do
      {
        uint64_t v129 = 0;
        do
        {
          if (*(void *)v133 != v128) {
            objc_enumerationMutation(v122);
          }
          objc_msgSend_addTestResultOverlayBox_(v12, v125, *(void *)(*((void *)&v132 + 1) + 8 * v129++), v126);
        }
        while (v127 != v129);
        uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(v122, v125, (uint64_t)&v132, (uint64_t)v140, 16);
      }
      while (v127);
    }
  }
  v130 = v12;

  return v130;
}

- (CKContainer)container
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasContainer)
  {
    uint64_t v6 = v2->_container;
  }
  else
  {
    objc_msgSend_defaultContainer(CKContainer, v3, v4, v5);
    uint64_t v6 = (CKContainer *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;
  objc_sync_exit(v2);

  return v7;
}

- (void)setContainer:(CKContainer *)container
{
  uint64_t v4 = container;
  obj = self;
  objc_sync_enter(obj);
  uint64_t v5 = obj->_container;
  obj->_container = v4;

  obj->_hasContainer = 1;
  objc_sync_exit(obj);
}

- (BOOL)allowsCellularAccess
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2 || !v2->_hasAllowsCellularAccess || v2->_allowsCellularAccess;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAllowsCellularAccess:(BOOL)allowsCellularAccess
{
  obj = self;
  objc_sync_enter(obj);
  obj->_allowsCellularAccess = allowsCellularAccess;
  obj->_hasAllowsCellularAccess = 1;
  objc_sync_exit(obj);
}

- (BOOL)allowsExpensiveNetworkAccess
{
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v2, v3, v4, v5)) {
    char allowsExpensiveNetworkAccess = v2->_allowsExpensiveNetworkAccess;
  }
  else {
    char allowsExpensiveNetworkAccess = objc_msgSend_allowsCellularAccess(v2, v6, v7, v8);
  }
  objc_sync_exit(v2);

  return allowsExpensiveNetworkAccess;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_char allowsExpensiveNetworkAccess = a3;
  objc_msgSend_setHasAllowsExpensiveNetworkAccess_(obj, v4, 1, v5);
  objc_sync_exit(obj);
}

- (BOOL)isLongLived
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2 && v2->_hasLongLived && v2->_longLived;
  objc_sync_exit(v2);

  return v3;
}

- (void)setLongLived:(BOOL)longLived
{
  obj = self;
  objc_sync_enter(obj);
  obj->_longLived = longLived;
  obj->_hasLongLived = 1;
  objc_sync_exit(obj);
}

- (NSTimeInterval)timeoutIntervalForRequest
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasTimeoutIntervalForRequest) {
    double timeoutIntervalForRequest = v2->_timeoutIntervalForRequest;
  }
  else {
    double timeoutIntervalForRequest = 60.0;
  }
  objc_sync_exit(v2);

  return timeoutIntervalForRequest;
}

- (void)setTimeoutIntervalForRequest:(NSTimeInterval)timeoutIntervalForRequest
{
  obj = self;
  objc_sync_enter(obj);
  obj->_double timeoutIntervalForRequest = timeoutIntervalForRequest;
  obj->_hasTimeoutIntervalForRequest = 1;
  objc_sync_exit(obj);
}

- (NSTimeInterval)timeoutIntervalForResource
{
  v2 = self;
  objc_sync_enter(v2);
  double timeoutIntervalForResource = -1.0;
  if (v2 && v2->_hasTimeoutIntervalForResource) {
    double timeoutIntervalForResource = v2->_timeoutIntervalForResource;
  }
  objc_sync_exit(v2);

  return timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(NSTimeInterval)timeoutIntervalForResource
{
  obj = self;
  objc_sync_enter(obj);
  obj->_double timeoutIntervalForResource = timeoutIntervalForResource;
  obj->_hasTimeoutIntervalForResource = 1;
  objc_sync_exit(obj);
}

- (BOOL)automaticallyRetryNetworkFailures
{
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v2, v3, v4, v5))
  {
    LOBYTE(v9) = v2->_automaticallyRetryNetworkFailures;
  }
  else
  {
    uint64_t v11 = objc_msgSend_qualityOfService(v2, v6, v7, v8);
    LOBYTE(v9) = 0;
    if (v11 != 33 && v11 != 25)
    {
      if (v11 == -1) {
        int v9 = CKCurrentProcessLinkCheck92e3e8f8ec1a906754afb22d87eb36301b4f6760() ^ 1;
      }
      else {
        LOBYTE(v9) = 1;
      }
    }
  }
  objc_sync_exit(v2);

  return v9;
}

- (void)setAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_automaticallyRetryNetworkFailures = a3;
  objc_msgSend_setHasAutomaticallyRetryNetworkFailures_(obj, v4, 1, v5);
  objc_sync_exit(obj);
}

- (unint64_t)discretionaryNetworkBehavior
{
  v2 = self;
  objc_sync_enter(v2);
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v2, v3, v4, v5))
  {
    unint64_t discretionaryNetworkBehavior = v2->_discretionaryNetworkBehavior;
  }
  else
  {
    uint64_t v10 = objc_msgSend_qualityOfService(v2, v6, v7, v8);
    BOOL v11 = v10 != 33;
    if (v10 == 25) {
      BOOL v11 = 0;
    }
    if (v10 == 9) {
      unint64_t discretionaryNetworkBehavior = 2;
    }
    else {
      unint64_t discretionaryNetworkBehavior = v11;
    }
  }
  objc_sync_exit(v2);

  return discretionaryNetworkBehavior;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_unint64_t discretionaryNetworkBehavior = a3;
  objc_msgSend_setHasDiscretionaryNetworkBehavior_(obj, v4, 1, v5);
  objc_sync_exit(obj);
}

- (BOOL)hasXPCActivity
{
  uint64_t v4 = objc_msgSend_ckXPCActivity(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setXpcActivityAutomaticallyDefer:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_xpcActivityAutomaticallyDefer = a3;
  obj->_hasXPCActivityAutomaticallyDefer = 1;
  objc_sync_exit(obj);
}

- (BOOL)xpcActivityAutomaticallyDefer
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2 || !v2->_hasXPCActivityAutomaticallyDefer || v2->_xpcActivityAutomaticallyDefer;
  objc_sync_exit(v2);

  return v3;
}

- (CKSchedulerActivity)schedulerActivity
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSchedulerActivity) {
    BOOL v3 = v2->_schedulerActivity;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setSchedulerActivity:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  if (!v4)
  {
LABEL_14:
    int v9 = 0;
    goto LABEL_15;
  }
  int v9 = objc_msgSend_ckXPCActivity(v4, v6, v7, v8);
  if (!v9)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v10 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v38) = 0;
      _os_log_debug_impl(&dword_18AF10000, v10, OS_LOG_TYPE_DEBUG, "No xpc_activity on scheduler activity, so let's ask the scheduler for one", (uint8_t *)&v38, 2u);
    }
    uint64_t v14 = objc_msgSend_sharedScheduler(CKScheduler, v11, v12, v13);
    uint64_t v18 = objc_msgSend_identifier(v4, v15, v16, v17);
    uint64_t v21 = objc_msgSend_xpcActivityForActivityWithIdentifier_(v14, v19, (uint64_t)v18, v20);

    if (!v21
      || (uint64_t v22 = [CKXPCActivity alloc],
          int v9 = objc_msgSend_initWithXPCActivity_(v22, v23, (uint64_t)v21, v24),
          v21,
          !v9))
    {
      if (ck_log_initialization_predicate != -1) {
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      }
      uint64_t v25 = (id)ck_log_facility_ck;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        uint64_t v37 = objc_msgSend_identifier(v4, v26, v27, v28);
        int v38 = 138543362;
        id v39 = v37;
        _os_log_fault_impl(&dword_18AF10000, v25, OS_LOG_TYPE_FAULT, "Setting invalid activity %{public}@ on operation configuration. Activity must have been submitted", (uint8_t *)&v38, 0xCu);
      }
      goto LABEL_14;
    }
  }
LABEL_15:
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v29 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    int v38 = 138412290;
    id v39 = v4;
    _os_log_impl(&dword_18AF10000, v29, OS_LOG_TYPE_INFO, "Setting scheduler activity in operation configuration %@", (uint8_t *)&v38, 0xCu);
  }
  objc_msgSend_setCKXPCActivity_(v5, v30, (uint64_t)v9, v31);
  uint64_t v35 = objc_msgSend_copy(v4, v32, v33, v34);
  schedulerActivity = v5->_schedulerActivity;
  v5->_schedulerActivity = (CKSchedulerActivity *)v35;

  v5->_hasSchedulerActivity = 1;
  objc_sync_exit(v5);
}

- (void)setSystemTask:(id)a3
{
  self->_hasSystemTask = 1;
}

- (void)setDiscretionarySchedulingForEntireOperation:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_discretionarySchedulingForEntireOperation = a3;
  obj->_hasDiscretionarySchedulingForEntireOperation = 1;
  objc_sync_exit(obj);
}

- (BOOL)discretionarySchedulingForEntireOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2 || !v2->_hasDiscretionarySchedulingForEntireOperation || v2->_discretionarySchedulingForEntireOperation;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)preferAnonymousRequests
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2 && v2->_hasPreferAnonymousRequests && v2->_preferAnonymousRequests;
  objc_sync_exit(v2);

  return v3;
}

- (void)setPreferAnonymousRequests:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_preferAnonymousRequests = a3;
  obj->_hasPreferAnonymousRequests = 1;
  objc_sync_exit(obj);
}

- (void)setIsCloudKitSupportOperation:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_uint64_t isCloudKitSupportOperation = a3;
  obj->_hasIsCloudKitSupportOperation = 1;
  objc_sync_exit(obj);
}

- (BOOL)isCloudKitSupportOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2 && v2->_hasIsCloudKitSupportOperation && v2->_isCloudKitSupportOperation;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCacheDeleteAvailableSpaceClass:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  cacheDeleteAvailableSpaceClass = obj->_cacheDeleteAvailableSpaceClass;
  obj->_cacheDeleteAvailableSpaceClass = v4;

  obj->_hasCacheDeleteAvailableSpaceClass = 1;
  objc_sync_exit(obj);
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasCacheDeleteAvailableSpaceClass) {
    BOOL v3 = v2->_cacheDeleteAvailableSpaceClass;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setAssetDownloadStagingManager:(id)a3
{
  id v4 = (CKAssetDownloadStagingManager *)a3;
  obj = self;
  objc_sync_enter(obj);
  assetDownloadStagingManager = obj->_assetDownloadStagingManager;
  obj->_assetDownloadStagingManager = v4;

  obj->_hasAssetDownloadStagingManager = 1;
  objc_sync_exit(obj);
}

- (CKAssetDownloadStagingManager)assetDownloadStagingManager
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasAssetDownloadStagingManager) {
    BOOL v3 = v2->_assetDownloadStagingManager;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (NSString)sourceApplicationBundleIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSourceApplicationBundleIdentifier) {
    BOOL v3 = v2->_sourceApplicationBundleIdentifier;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  id v14 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v14, v5, v6, v7);
  sourceApplicationBundleIdentifier = v4->_sourceApplicationBundleIdentifier;
  v4->_sourceApplicationBundleIdentifier = (NSString *)v8;

  v4->_hasSourceApplicationBundleIdentifier = 1;
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v4, v10, (uint64_t)v14, v11);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v4, v12, (uint64_t)v14, v13);
  objc_sync_exit(v4);
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasSourceApplicationSecondaryIdentifier) {
    BOOL v3 = v2->_sourceApplicationSecondaryIdentifier;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
  sourceApplicationSecondaryIdentifier = v4->_sourceApplicationSecondaryIdentifier;
  v4->_sourceApplicationSecondaryIdentifier = (NSString *)v8;

  v4->_hasSourceApplicationSecondaryIdentifier = 1;
  objc_sync_exit(v4);
}

- (NSNumber)privacyProxyFailClosedOverride
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasPrivacyProxyFailClosedOverride) {
    BOOL v3 = v2->_privacyProxyFailClosedOverride;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_copy(v10, v5, v6, v7);
  privacyProxyFailClosedOverride = v4->_privacyProxyFailClosedOverride;
  v4->_privacyProxyFailClosedOverride = (NSNumber *)v8;

  v4->_hasPrivacyProxyFailClosedOverride = 1;
  objc_sync_exit(v4);
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasApplicationBundleIdentifierOverrideForContainerAccess) {
    BOOL v3 = v2->_applicationBundleIdentifierOverrideForContainerAccess;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setApplicationBundleIdentifierOverrideForContainerAccess:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  applicationBundleIdentifierOverrideForContainerAccess = obj->_applicationBundleIdentifierOverrideForContainerAccess;
  obj->_applicationBundleIdentifierOverrideForContainerAccess = v4;

  obj->_hasApplicationBundleIdentifierOverrideForContainerAccess = 1;
  objc_sync_exit(obj);
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasApplicationBundleIdentifierOverrideForNetworkAttribution) {
    BOOL v3 = v2->_applicationBundleIdentifierOverrideForNetworkAttribution;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
  id v4 = (NSString *)a3;
  obj = self;
  objc_sync_enter(obj);
  applicationBundleIdentifierOverrideForNetworkAttribution = obj->_applicationBundleIdentifierOverrideForNetworkAttribution;
  obj->_applicationBundleIdentifierOverrideForNetworkAttribution = v4;

  obj->_hasApplicationBundleIdentifierOverrideForNetworkAttribution = 1;
  objc_sync_exit(obj);
}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  id v9 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v4, v5, (uint64_t)v9, v6);
  objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v4, v7, (uint64_t)v9, v8);
  objc_sync_exit(v4);
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2 && v2->_hasAdditionalRequestHTTPHeaders) {
    BOOL v3 = v2->_additionalRequestHTTPHeaders;
  }
  else {
    BOOL v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)setAdditionalRequestHTTPHeaders:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  additionalRequestHTTPHeaders = v4->_additionalRequestHTTPHeaders;
  v4->_additionalRequestHTTPHeaders = (NSDictionary *)v8;

  v4->_hasAdditionalRequestHTTPHeaders = 1;
  objc_sync_exit(v4);
}

- (void)addUnitTestOverrides:(id)a3
{
  id v23 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v4->_unitTestOverrides, v5, v6, v7);
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  uint64_t v11 = v10;

  uint64_t v15 = objc_msgSend_CKDeepCopy(v23, v12, v13, v14);
  objc_msgSend_addEntriesFromDictionary_(v11, v16, (uint64_t)v15, v17);

  uint64_t v21 = objc_msgSend_copy(v11, v18, v19, v20);
  unitTestOverrides = v4->_unitTestOverrides;
  v4->_unitTestOverrides = (NSDictionary *)v21;

  objc_sync_exit(v4);
}

- (void)removeUnitTestOverride:(id)a3
{
  id v18 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_mutableCopy(v4->_unitTestOverrides, v5, v6, v7);
  id v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_opt_new();
  }
  uint64_t v11 = v10;

  objc_msgSend_setObject_forKeyedSubscript_(v11, v12, 0, (uint64_t)v18);
  uint64_t v16 = objc_msgSend_copy(v11, v13, v14, v15);
  unitTestOverrides = v4->_unitTestOverrides;
  v4->_unitTestOverrides = (NSDictionary *)v16;

  objc_sync_exit(v4);
}

- (id)testErrorInducerBoxes
{
  BOOL v3 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v3);
  uint64_t v7 = objc_msgSend_copy(self->_mTestErrorInducerBoxes, v4, v5, v6);
  objc_sync_exit(v3);

  return v7;
}

- (void)addTestErrorInducerBox:(id)a3
{
  id v7 = a3;
  id v4 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v4);
  objc_msgSend_addObject_(self->_mTestErrorInducerBoxes, v5, (uint64_t)v7, v6);
  objc_sync_exit(v4);
}

- (void)removeTestErrorInducerBoxWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_mTestErrorInducerBoxes;
  objc_sync_enter(v5);
  mTestErrorInducerBoxes = self->_mTestErrorInducerBoxes;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B1677D4;
  v16[3] = &unk_1E5465358;
  id v7 = v4;
  id v17 = v7;
  id v10 = objc_msgSend_CKFilter_(mTestErrorInducerBoxes, v8, (uint64_t)v16, v9);
  uint64_t v14 = (NSMutableArray *)objc_msgSend_mutableCopy(v10, v11, v12, v13);
  uint64_t v15 = self->_mTestErrorInducerBoxes;
  self->_mTestErrorInducerBoxes = v14;

  objc_sync_exit(v5);
}

- (id)testResultOverlayBoxes
{
  BOOL v3 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v3);
  int v9 = objc_msgSend_CKContains_(self->_mTestResultOverlayBoxes, v4, (uint64_t)&unk_1ED7EF5B8, v5);
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  if (v9)
  {
    uint64_t v11 = objc_msgSend_CKFilter_(mTestResultOverlayBoxes, v6, (uint64_t)&unk_1ED7F02B8, v8);
    objc_msgSend_setArray_(self->_mTestResultOverlayBoxes, v12, (uint64_t)v11, v13);
  }
  else
  {
    uint64_t v11 = objc_msgSend_copy(mTestResultOverlayBoxes, v6, v7, v8);
  }
  objc_sync_exit(v3);

  return v11;
}

- (void)addTestResultOverlayBox:(id)a3
{
  id v7 = a3;
  id v4 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v4);
  objc_msgSend_addObject_(self->_mTestResultOverlayBoxes, v5, (uint64_t)v7, v6);
  objc_sync_exit(v4);
}

- (void)removeTestResultOverlayBoxWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_mTestResultOverlayBoxes;
  objc_sync_enter(v5);
  mTestResultOverlayBoxes = self->_mTestResultOverlayBoxes;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B167A68;
  v16[3] = &unk_1E54653A0;
  id v7 = v4;
  id v17 = v7;
  id v10 = objc_msgSend_CKFilter_(mTestResultOverlayBoxes, v8, (uint64_t)v16, v9);
  uint64_t v14 = (NSMutableArray *)objc_msgSend_mutableCopy(v10, v11, v12, v13);
  uint64_t v15 = self->_mTestResultOverlayBoxes;
  self->_mTestResultOverlayBoxes = v14;

  objc_sync_exit(v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v67 = a3;
  id v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  uint64_t v6 = (void *)MEMORY[0x18C12ADA0](v5);
  if (objc_msgSend_hasQualityOfService(v4, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_qualityOfService(v4, v10, v11, v12);
    objc_msgSend_encodeInt64_forKey_(v67, v14, v13, @"QualityOfService");
  }
  if (v4 && v4->_hasAllowsCellularAccess)
  {
    uint64_t v15 = objc_msgSend_allowsCellularAccess(v4, v10, v11, v12);
    objc_msgSend_encodeBool_forKey_(v67, v16, v15, @"AllowsCellularAccess");
  }
  if (objc_msgSend_hasAllowsExpensiveNetworkAccess(v4, v10, v11, v12))
  {
    uint64_t v20 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v17, v18, v19);
    objc_msgSend_encodeBool_forKey_(v67, v21, v20, @"AllowsExpensiveAccess");
  }
  if (v4)
  {
    if (v4->_hasLongLived)
    {
      uint64_t isLongLived = objc_msgSend_isLongLived(v4, v17, v18, v19);
      objc_msgSend_encodeBool_forKey_(v67, v23, isLongLived, @"IsLongLived");
    }
    if (v4->_hasTimeoutIntervalForRequest)
    {
      objc_msgSend_timeoutIntervalForRequest(v4, v17, v18, v19);
      objc_msgSend_encodeDouble_forKey_(v67, v24, @"TimeoutIntervalForRequest", v25);
    }
    if (v4->_hasTimeoutIntervalForResource)
    {
      objc_msgSend_timeoutIntervalForResource(v4, v17, v18, v19);
      objc_msgSend_encodeDouble_forKey_(v67, v26, @"TimeoutIntervalForResource", v27);
    }
  }
  if (objc_msgSend_hasAutomaticallyRetryNetworkFailures(v4, v17, v18, v19))
  {
    uint64_t v31 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v28, v29, v30);
    objc_msgSend_encodeBool_forKey_(v67, v32, v31, @"AutomaticallyRetryNetworkFailures");
  }
  if (objc_msgSend_hasDiscretionaryNetworkBehavior(v4, v28, v29, v30))
  {
    uint64_t v36 = objc_msgSend_discretionaryNetworkBehavior(v4, v33, v34, v35);
    objc_msgSend_encodeInt64_forKey_(v67, v37, v36, @"DiscretionaryNetworkBehavior");
  }
  if (v4)
  {
    if (v4->_hasPreferAnonymousRequests)
    {
      uint64_t v38 = objc_msgSend_preferAnonymousRequests(v4, v33, v34, v35);
      objc_msgSend_encodeBool_forKey_(v67, v39, v38, @"PrefersAnonymousRequests");
    }
    if (v4->_hasSourceApplicationSecondaryIdentifier)
    {
      uint64_t v40 = objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(v67, v41, (uint64_t)v40, @"SourceApplicationSecondaryIdentifier");
    }
    if (v4->_hasPrivacyProxyFailClosedOverride)
    {
      uint64_t v42 = objc_msgSend_privacyProxyFailClosedOverride(v4, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(v67, v43, (uint64_t)v42, @"PrivacyProxyFailClosedOverride");
    }
    if (v4->_hasApplicationBundleIdentifierOverrideForContainerAccess)
    {
      uint64_t v44 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v33, v34, v35);
      uint64_t v45 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      objc_msgSend_encodeObject_forKey_(v67, v46, (uint64_t)v44, (uint64_t)v45);
    }
    if (v4->_hasApplicationBundleIdentifierOverrideForNetworkAttribution)
    {
      uint64_t v47 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v33, v34, v35);
      uint64_t v48 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      objc_msgSend_encodeObject_forKey_(v67, v49, (uint64_t)v47, (uint64_t)v48);
    }
    if (v4->_hasAdditionalRequestHTTPHeaders)
    {
      uint64_t v50 = objc_msgSend_additionalRequestHTTPHeaders(v4, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(v67, v51, (uint64_t)v50, @"AdditionalRequestHTTPHeaders");
    }
    if (v4->_hasIsCloudKitSupportOperation)
    {
      uint64_t isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v33, v34, v35);
      objc_msgSend_encodeBool_forKey_(v67, v53, isCloudKitSupportOperation, @"IsCloudKitSupportOperation");
    }
    if (v4->_hasCacheDeleteAvailableSpaceClass)
    {
      uint64_t v54 = objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(v67, v55, (uint64_t)v54, @"CacheDeleteAvailableSpaceClass");
    }
  }
  v56 = objc_msgSend_unitTestOverrides(v4, v33, v34, v35);
  uint64_t v60 = objc_msgSend_count(v56, v57, v58, v59);

  if (v60)
  {
    uint64_t v64 = objc_msgSend_unitTestOverrides(v4, v61, v62, v63);
    v65 = NSStringFromSelector(sel_unitTestOverrides);
    objc_msgSend_encodeObject_forKey_(v67, v66, (uint64_t)v64, (uint64_t)v65);
  }
  objc_sync_exit(v4);
}

- (CKOperationConfiguration)initWithCoder:(id)a3
{
  v132[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v130.receiver = self;
  v130.super_class = (Class)CKOperationConfiguration;
  uint64_t v5 = [(CKOperationConfiguration *)&v130 init];
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend__commonInit(v5, v6, v7, v8);
    uint64_t v11 = (void *)MEMORY[0x18C12ADA0](v10);
    if (objc_msgSend_containsValueForKey_(v4, v12, @"QualityOfService", v13))
    {
      uint64_t v16 = objc_msgSend_decodeInt64ForKey_(v4, v14, @"QualityOfService", v15);
      objc_msgSend_setQualityOfService_(v9, v17, v16, v18);
    }
    if (objc_msgSend_containsValueForKey_(v4, v14, @"AllowsCellularAccess", v15))
    {
      uint64_t v21 = objc_msgSend_decodeBoolForKey_(v4, v19, @"AllowsCellularAccess", v20);
      objc_msgSend_setAllowsCellularAccess_(v9, v22, v21, v23);
    }
    if (objc_msgSend_containsValueForKey_(v4, v19, @"AllowsExpensiveAccess", v20))
    {
      uint64_t v26 = objc_msgSend_decodeBoolForKey_(v4, v24, @"AllowsExpensiveAccess", v25);
      objc_msgSend_setAllowsExpensiveNetworkAccess_(v9, v27, v26, v28);
    }
    if (objc_msgSend_containsValueForKey_(v4, v24, @"IsLongLived", v25))
    {
      uint64_t v31 = objc_msgSend_decodeBoolForKey_(v4, v29, @"IsLongLived", v30);
      objc_msgSend_setLongLived_(v9, v32, v31, v33);
    }
    if (objc_msgSend_containsValueForKey_(v4, v29, @"TimeoutIntervalForRequest", v30))
    {
      objc_msgSend_decodeDoubleForKey_(v4, v34, @"TimeoutIntervalForRequest", v35);
      objc_msgSend_setTimeoutIntervalForRequest_(v9, v36, v37, v38);
    }
    if (objc_msgSend_containsValueForKey_(v4, v34, @"TimeoutIntervalForResource", v35))
    {
      objc_msgSend_decodeDoubleForKey_(v4, v39, @"TimeoutIntervalForResource", v40);
      objc_msgSend_setTimeoutIntervalForResource_(v9, v41, v42, v43);
    }
    if (objc_msgSend_containsValueForKey_(v4, v39, @"AutomaticallyRetryNetworkFailures", v40))
    {
      uint64_t v46 = objc_msgSend_decodeBoolForKey_(v4, v44, @"AutomaticallyRetryNetworkFailures", v45);
      objc_msgSend_setAutomaticallyRetryNetworkFailures_(v9, v47, v46, v48);
    }
    if (objc_msgSend_containsValueForKey_(v4, v44, @"DiscretionaryNetworkBehavior", v45))
    {
      uint64_t v51 = objc_msgSend_decodeInt64ForKey_(v4, v49, @"DiscretionaryNetworkBehavior", v50);
      objc_msgSend_setDiscretionaryNetworkBehavior_(v9, v52, v51, v53);
    }
    if (objc_msgSend_containsValueForKey_(v4, v49, @"PrefersAnonymousRequests", v50))
    {
      uint64_t v56 = objc_msgSend_decodeBoolForKey_(v4, v54, @"PrefersAnonymousRequests", v55);
      objc_msgSend_setPreferAnonymousRequests_(v9, v57, v56, v58);
    }
    if (objc_msgSend_containsValueForKey_(v4, v54, @"SourceApplicationSecondaryIdentifier", v55))
    {
      uint64_t v61 = objc_opt_class();
      uint64_t v63 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"SourceApplicationSecondaryIdentifier");
      objc_msgSend_set_sourceApplicationSecondaryIdentifier_(v9, v64, (uint64_t)v63, v65);
    }
    if (objc_msgSend_containsValueForKey_(v4, v59, @"PrivacyProxyFailClosedOverride", v60))
    {
      uint64_t v66 = objc_opt_class();
      v68 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v67, v66, @"PrivacyProxyFailClosedOverride");
      objc_msgSend_setPrivacyProxyFailClosedOverride_(v9, v69, (uint64_t)v68, v70);
    }
    v71 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
    int v74 = objc_msgSend_containsValueForKey_(v4, v72, (uint64_t)v71, v73);

    if (v74)
    {
      uint64_t v75 = objc_opt_class();
      uint64_t v76 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForContainerAccess);
      uint64_t v78 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v77, v75, (uint64_t)v76);
      objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(v9, v79, (uint64_t)v78, v80);
    }
    uint64_t v81 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
    int v84 = objc_msgSend_containsValueForKey_(v4, v82, (uint64_t)v81, v83);

    if (v84)
    {
      uint64_t v87 = objc_opt_class();
      uint64_t v88 = NSStringFromSelector(sel_applicationBundleIdentifierOverrideForNetworkAttribution);
      uint64_t v90 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v89, v87, (uint64_t)v88);
      objc_msgSend_setApplicationBundleIdentifierOverrideForNetworkAttribution_(v9, v91, (uint64_t)v90, v92);
    }
    if (objc_msgSend_containsValueForKey_(v4, v85, @"AdditionalRequestHTTPHeaders", v86))
    {
      v95 = (void *)MEMORY[0x1E4F1CAD0];
      v132[0] = objc_opt_class();
      v132[1] = objc_opt_class();
      uint64_t v97 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v96, (uint64_t)v132, 2);
      v100 = objc_msgSend_setWithArray_(v95, v98, (uint64_t)v97, v99);
      uint64_t v102 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v101, (uint64_t)v100, @"AdditionalRequestHTTPHeaders");
      objc_msgSend_setAdditionalRequestHTTPHeaders_(v9, v103, (uint64_t)v102, v104);
    }
    if (objc_msgSend_containsValueForKey_(v4, v93, @"IsCloudKitSupportOperation", v94))
    {
      uint64_t v107 = objc_msgSend_decodeBoolForKey_(v4, v105, @"IsCloudKitSupportOperation", v106);
      objc_msgSend_setIsCloudKitSupportOperation_(v9, v108, v107, v109);
    }
    if (objc_msgSend_containsValueForKey_(v4, v105, @"CacheDeleteAvailableSpaceClass", v106))
    {
      uint64_t v110 = objc_opt_class();
      uint64_t v112 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v111, v110, @"CacheDeleteAvailableSpaceClass");
      objc_msgSend_setCacheDeleteAvailableSpaceClass_(v9, v113, (uint64_t)v112, v114);
    }
    uint64_t v115 = NSStringFromSelector(sel_unitTestOverrides);
    int v118 = objc_msgSend_containsValueForKey_(v4, v116, (uint64_t)v115, v117);

    if (v118)
    {
      v119 = CKAcceptableValueClasses();
      v131[0] = objc_opt_class();
      v131[1] = objc_opt_class();
      uint64_t v121 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v120, (uint64_t)v131, 2);
      uint64_t v124 = objc_msgSend_setByAddingObjectsFromArray_(v119, v122, (uint64_t)v121, v123);
      v125 = NSStringFromSelector(sel_unitTestOverrides);
      uint64_t v127 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v126, (uint64_t)v124, (uint64_t)v125);
      unitTestOverrides = v9->_unitTestOverrides;
      v9->_unitTestOverrides = (NSDictionary *)v127;
    }
  }

  return v9;
}

- (id)description
{
  return (id)((uint64_t (*)(CKOperationConfiguration *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  BOOL v5 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = objc_msgSend_initWithCapacity_(v7, v8, 4, v9);
  if (v5)
  {
    unint64_t v14 = objc_msgSend_discretionaryNetworkBehavior(self, v10, v11, v12);
    if (v14)
    {
      uint64_t v18 = CKStringForDiscretionaryNetworkBehavior(v14);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v19, @"discretionary", (uint64_t)v18);
    }
    uint64_t v20 = NSNumber;
    objc_msgSend_timeoutIntervalForRequest(self, v15, v16, v17);
    uint64_t v24 = objc_msgSend_numberWithDouble_(v20, v21, v22, v23);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v25, @"timeoutForRequest", (uint64_t)v24);

    objc_msgSend_timeoutIntervalForResource(self, v26, v27, v28);
    if (v29 != -1.0)
    {
      uint64_t v30 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12);
      objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v31, @"timeoutForResource", (uint64_t)v30);
    }
  }
  uint64_t v35 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v10, v11, v12);
  if (v5)
  {
    if ((objc_msgSend_allowsCellularAccess(self, v32, v33, v34) & 1) == 0) {
      objc_msgSend_addObject_(v35, v36, @"noCellAccess", v38);
    }
    if (objc_msgSend_hasAllowsExpensiveNetworkAccess(self, v36, v37, v38))
    {
      if (objc_msgSend_allowsExpensiveNetworkAccess(self, v39, v40, v41)) {
        objc_msgSend_addObject_(v35, v42, @"expensiveAccess", v43);
      }
      else {
        objc_msgSend_addObject_(v35, v42, @"noExpensiveAccess", v43);
      }
    }
    if (objc_msgSend_isLongLived(self, v39, v40, v41)) {
      objc_msgSend_addObject_(v35, v44, @"longLived", v46);
    }
    uint64_t v47 = objc_msgSend_ckXPCActivity(self, v44, v45, v46);

    if (v47) {
      objc_msgSend_addObject_(v35, v48, @"xpcActivity", v50);
    }
    if (objc_msgSend_automaticallyRetryNetworkFailures(self, v48, v49, v50)) {
      objc_msgSend_addObject_(v35, v51, @"autoRetry", v53);
    }
    if (objc_msgSend_preferAnonymousRequests(self, v51, v52, v53)) {
      objc_msgSend_addObject_(v35, v54, @"preferAnon", v56);
    }
    if (objc_msgSend_isCloudKitSupportOperation(self, v54, v55, v56)) {
      objc_msgSend_addObject_(v35, v32, @"isCloudKitSupportOperation", v34);
    }
  }
  if (objc_msgSend_count(v35, v32, v33, v34))
  {
    uint64_t v59 = objc_msgSend_componentsJoinedByString_(v35, v57, @"|", v58);
    objc_msgSend_CKAddPropertySafelyForKey_value_(v13, v60, @"flags", (uint64_t)v59);
  }

  return v13;
}

- (void)setHasAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_hasAllowsExpensiveNetworkAccess = a3;
}

- (void)setHasAutomaticallyRetryNetworkFailures:(BOOL)a3
{
  self->_hasAutomaticallyRetryNetworkFailures = a3;
}

- (void)setHasDiscretionaryNetworkBehavior:(BOOL)a3
{
  self->_hasDiscretionaryNetworkBehavior = a3;
}

- (BGSystemTask)systemTask
{
  return self->_systemTask;
}

@end