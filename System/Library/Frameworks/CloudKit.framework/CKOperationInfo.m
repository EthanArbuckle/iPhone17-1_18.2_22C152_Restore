@interface CKOperationInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)automaticallyRetryNetworkFailures;
- (BOOL)clientHasValidatedEntitlements;
- (BOOL)isCloudKitSupportOperation;
- (BOOL)isLongLived;
- (BOOL)isOutstandingOperation;
- (BOOL)preferAnonymousRequests;
- (BOOL)usesAssetDownloadStagingManager;
- (BOOL)wantsDaemonOperationCallbacks;
- (BOOL)wantsDaemonRequestCallbacks;
- (BOOL)wantsRequestStatistics;
- (CKDOperation)parentOperation;
- (CKOperationCallbackProxyEndpoint)callbackProxyEndpoint;
- (CKOperationConfiguration)resolvedConfiguration;
- (CKOperationGroup)group;
- (CKOperationInfo)init;
- (CKOperationInfo)initWithCoder:(id)a3;
- (CKOperationMMCSRequestOptions)MMCSRequestOptions;
- (NSDictionary)additionalRequestHTTPHeaders;
- (NSNumber)cacheDeleteAvailableSpaceClass;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)authPromptReason;
- (NSString)ckOperationClassName;
- (NSString)operationID;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSString)xpcActivityIdentifier;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)clientQueuePriority;
- (int64_t)qualityOfService;
- (unint64_t)discretionaryNetworkBehavior;
- (unint64_t)discretionaryWhenBackgroundedState;
- (unint64_t)duetPreClearedMode;
- (unint64_t)requestOriginator;
- (unint64_t)systemScheduler;
- (void)encodeWithCoder:(id)a3;
- (void)setCallbackProxyEndpoint:(id)a3;
- (void)setCkOperationClassName:(id)a3;
- (void)setClientHasValidatedEntitlements:(BOOL)a3;
- (void)setClientQueuePriority:(int64_t)a3;
- (void)setDiscretionaryWhenBackgroundedState:(unint64_t)a3;
- (void)setDuetPreClearedMode:(unint64_t)a3;
- (void)setGroup:(id)a3;
- (void)setMMCSRequestOptions:(id)a3;
- (void)setOperationID:(id)a3;
- (void)setParentOperation:(id)a3;
- (void)setRequestOriginator:(unint64_t)a3;
- (void)setResolvedConfiguration:(id)a3;
- (void)setSystemScheduler:(unint64_t)a3;
- (void)setUsesAssetDownloadStagingManager:(BOOL)a3;
- (void)setWantsDaemonOperationCallbacks:(BOOL)a3;
- (void)setWantsDaemonRequestCallbacks:(BOOL)a3;
- (void)setXpcActivityIdentifier:(id)a3;
- (void)takeValuesFrom:(id)a3;
- (void)takeValuesFromParentOperationInfo:(id)a3;
@end

@implementation CKOperationInfo

- (CKOperationInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKOperationInfo;
  v2 = [(CKOperationInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CKShortRandomID();
    operationID = v2->_operationID;
    v2->_operationID = (NSString *)v3;

    if (!byte_1E9124EF0) {
      v2->_clientHasValidatedEntitlements = 1;
    }
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v8 = objc_msgSend_operationID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  v13 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v12;

  *((void *)v4 + 11) = objc_msgSend_clientQueuePriority(self, v14, v15, v16);
  *((void *)v4 + 12) = objc_msgSend_duetPreClearedMode(self, v17, v18, v19);
  *((void *)v4 + 13) = objc_msgSend_discretionaryWhenBackgroundedState(self, v20, v21, v22);
  *((void *)v4 + 14) = objc_msgSend_systemScheduler(self, v23, v24, v25);
  v29 = objc_msgSend_xpcActivityIdentifier(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_copy(v29, v30, v31, v32);
  v34 = (void *)*((void *)v4 + 15);
  *((void *)v4 + 15) = v33;

  v38 = objc_msgSend_ckOperationClassName(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_copy(v38, v39, v40, v41);
  v43 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v42;

  v47 = objc_msgSend_callbackProxyEndpoint(self, v44, v45, v46);
  uint64_t v51 = objc_msgSend_copy(v47, v48, v49, v50);
  v52 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v51;

  *((unsigned char *)v4 + 8) = objc_msgSend_isOutstandingOperation(self, v53, v54, v55);
  if (self) {
    name = self->_name;
  }
  else {
    name = 0;
  }
  v57 = name;
  uint64_t v61 = objc_msgSend_copy(v57, v58, v59, v60);
  v62 = (void *)*((void *)v4 + 16);
  *((void *)v4 + 16) = v61;

  uint64_t v66 = objc_msgSend_MMCSRequestOptions(self, v63, v64, v65);
  v67 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v66;

  v71 = objc_msgSend_resolvedConfiguration(self, v68, v69, v70);
  uint64_t v75 = objc_msgSend_copy(v71, v72, v73, v74);
  v76 = (void *)*((void *)v4 + 8);
  *((void *)v4 + 8) = v75;

  uint64_t v80 = objc_msgSend_group(self, v77, v78, v79);
  v81 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v80;

  *((unsigned char *)v4 + 9) = objc_msgSend_clientHasValidatedEntitlements(self, v82, v83, v84);
  v88 = objc_msgSend_parentOperation(self, v85, v86, v87);
  objc_storeWeak((id *)v4 + 9, v88);

  *((unsigned char *)v4 + 11) = objc_msgSend_wantsRequestStatistics(self, v89, v90, v91);
  *((unsigned char *)v4 + 10) = objc_msgSend_usesAssetDownloadStagingManager(self, v92, v93, v94);
  *((unsigned char *)v4 + 12) = objc_msgSend_wantsDaemonOperationCallbacks(self, v95, v96, v97);
  *((unsigned char *)v4 + 13) = objc_msgSend_wantsDaemonRequestCallbacks(self, v98, v99, v100);
  *((void *)v4 + 10) = objc_msgSend_requestOriginator(self, v101, v102, v103);
  return v4;
}

- (BOOL)isLongLived
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char isLongLived = objc_msgSend_isLongLived(v4, v5, v6, v7);

  return isLongLived;
}

- (BOOL)allowsCellularAccess
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char v8 = objc_msgSend_allowsCellularAccess(v4, v5, v6, v7);

  return v8;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char v8 = objc_msgSend_allowsExpensiveNetworkAccess(v4, v5, v6, v7);

  return v8;
}

- (int64_t)qualityOfService
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_qualityOfService(v4, v5, v6, v7);

  return v8;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  int64_t v8 = objc_msgSend__sourceApplicationSecondaryIdentifier(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_privacyProxyFailClosedOverride(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (BOOL)preferAnonymousRequests
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char v8 = objc_msgSend_preferAnonymousRequests(v4, v5, v6, v7);

  return v8;
}

- (double)timeoutIntervalForRequest
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  objc_msgSend_timeoutIntervalForRequest(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (double)timeoutIntervalForResource
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  objc_msgSend_timeoutIntervalForResource(v4, v5, v6, v7);
  double v9 = v8;

  return v9;
}

- (NSDictionary)additionalRequestHTTPHeaders
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  double v8 = objc_msgSend_additionalRequestHTTPHeaders(v4, v5, v6, v7);

  return (NSDictionary *)v8;
}

- (BOOL)isCloudKitSupportOperation
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char isCloudKitSupportOperation = objc_msgSend_isCloudKitSupportOperation(v4, v5, v6, v7);

  return isCloudKitSupportOperation;
}

- (NSNumber)cacheDeleteAvailableSpaceClass
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  double v8 = objc_msgSend_cacheDeleteAvailableSpaceClass(v4, v5, v6, v7);

  return (NSNumber *)v8;
}

- (NSString)authPromptReason
{
  id v4 = objc_msgSend_group(self, a2, v2, v3);
  double v8 = objc_msgSend_authPromptReason(v4, v5, v6, v7);

  return (NSString *)v8;
}

- (unint64_t)discretionaryNetworkBehavior
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_discretionaryNetworkBehavior(v4, v5, v6, v7);

  return v8;
}

- (BOOL)automaticallyRetryNetworkFailures
{
  id v4 = objc_msgSend_resolvedConfiguration(self, a2, v2, v3);
  char v8 = objc_msgSend_automaticallyRetryNetworkFailures(v4, v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v99 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  char v8 = objc_msgSend_operationID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v99, v9, (uint64_t)v8, @"OperationID");

  uint64_t v13 = objc_msgSend_clientQueuePriority(self, v10, v11, v12);
  objc_msgSend_encodeInt64_forKey_(v99, v14, v13, @"QueuePriority");
  uint64_t v18 = objc_msgSend_duetPreClearedMode(self, v15, v16, v17);
  objc_msgSend_encodeInt64_forKey_(v99, v19, v18, @"DuetPreClearedMode");
  uint64_t v23 = objc_msgSend_discretionaryWhenBackgroundedState(self, v20, v21, v22);
  objc_msgSend_encodeInt64_forKey_(v99, v24, v23, @"DiscretionaryWhenBackgroundedState");
  uint64_t v28 = objc_msgSend_systemScheduler(self, v25, v26, v27);
  objc_msgSend_encodeInt64_forKey_(v99, v29, v28, @"SystemScheduler");
  uint64_t v33 = objc_msgSend_xpcActivityIdentifier(self, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v99, v34, (uint64_t)v33, @"XPCActivityIdentifier");

  v38 = objc_msgSend_ckOperationClassName(self, v35, v36, v37);
  v39 = NSStringFromSelector(sel_ckOperationClassName);
  objc_msgSend_encodeObject_forKey_(v99, v40, (uint64_t)v38, (uint64_t)v39);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v44 = objc_msgSend_callbackProxyEndpoint(self, v41, v42, v43);
    uint64_t v45 = NSStringFromSelector(sel_callbackProxyEndpoint);
    objc_msgSend_encodeObject_forKey_(v99, v46, (uint64_t)v44, (uint64_t)v45);
  }
  uint64_t isOutstandingOperation = objc_msgSend_isOutstandingOperation(self, v41, v42, v43);
  objc_msgSend_encodeBool_forKey_(v99, v48, isOutstandingOperation, @"IsOutstanding");
  if (self) {
    objc_msgSend_encodeObject_forKey_(v99, v49, (uint64_t)self->_name, @"OperationName");
  }
  else {
    objc_msgSend_encodeObject_forKey_(v99, v49, 0, @"OperationName");
  }
  v53 = objc_msgSend_MMCSRequestOptions(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v99, v54, (uint64_t)v53, @"MMCSRequestOptions");

  v58 = objc_msgSend_resolvedConfiguration(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v99, v59, (uint64_t)v58, @"ResolvedConfiguration");

  v63 = objc_msgSend_group(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v99, v64, (uint64_t)v63, @"Group");

  uint64_t HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(self, v65, v66, v67);
  uint64_t v69 = NSStringFromSelector(sel_clientHasValidatedEntitlements);
  objc_msgSend_encodeBool_forKey_(v99, v70, HasValidatedEntitlements, (uint64_t)v69);

  uint64_t v74 = objc_msgSend_requestOriginator(self, v71, v72, v73);
  uint64_t v75 = NSStringFromSelector(sel_requestOriginator);
  objc_msgSend_encodeInteger_forKey_(v99, v76, v74, (uint64_t)v75);

  uint64_t v80 = objc_msgSend_wantsRequestStatistics(self, v77, v78, v79);
  objc_msgSend_encodeBool_forKey_(v99, v81, v80, @"WantsRequestStatistics");
  uint64_t v85 = objc_msgSend_usesAssetDownloadStagingManager(self, v82, v83, v84);
  objc_msgSend_encodeBool_forKey_(v99, v86, v85, @"UsesAssetDownloadStagingManager");
  uint64_t v90 = objc_msgSend_wantsDaemonOperationCallbacks(self, v87, v88, v89);
  uint64_t v91 = NSStringFromSelector(sel_wantsDaemonOperationCallbacks);
  objc_msgSend_encodeBool_forKey_(v99, v92, v90, (uint64_t)v91);

  uint64_t v96 = objc_msgSend_wantsDaemonRequestCallbacks(self, v93, v94, v95);
  uint64_t v97 = NSStringFromSelector(sel_wantsDaemonRequestCallbacks);
  objc_msgSend_encodeBool_forKey_(v99, v98, v96, (uint64_t)v97);
}

- (CKOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)CKOperationInfo;
  v5 = [(CKOperationInfo *)&v68 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"OperationID");
    operationID = v5->_operationID;
    v5->_operationID = (NSString *)v9;

    v5->_clientQueuePriority = objc_msgSend_decodeInt64ForKey_(v4, v11, @"QueuePriority", v12);
    v5->_duetPreClearedMode = objc_msgSend_decodeInt64ForKey_(v4, v13, @"DuetPreClearedMode", v14);
    v5->_discretionaryWhenBackgroundedState = objc_msgSend_decodeInt64ForKey_(v4, v15, @"DiscretionaryWhenBackgroundedState", v16);
    v5->_systemScheduler = objc_msgSend_decodeInt64ForKey_(v4, v17, @"SystemScheduler", v18);
    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"XPCActivityIdentifier");
    xpcActivityIdentifier = v5->_xpcActivityIdentifier;
    v5->_xpcActivityIdentifier = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v24 = NSStringFromSelector(sel_ckOperationClassName);
    uint64_t v26 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24);
    ckOperationClassName = v5->_ckOperationClassName;
    v5->_ckOperationClassName = (NSString *)v26;

    uint64_t v28 = objc_opt_class();
    v29 = NSStringFromSelector(sel_callbackProxyEndpoint);
    uint64_t v31 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v30, v28, (uint64_t)v29);
    callbackProxyEndpoint = v5->_callbackProxyEndpoint;
    v5->_callbackProxyEndpoint = (CKOperationCallbackProxyEndpoint *)v31;

    v5->_uint64_t isOutstandingOperation = objc_msgSend_decodeBoolForKey_(v4, v33, @"IsOutstanding", v34);
    uint64_t v35 = objc_opt_class();
    uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v36, v35, @"OperationName");
    name = v5->_name;
    v5->_name = (NSString *)v37;

    uint64_t v39 = objc_opt_class();
    uint64_t v41 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v40, v39, @"MMCSRequestOptions");
    MMCSRequestOptions = v5->_MMCSRequestOptions;
    v5->_MMCSRequestOptions = (CKOperationMMCSRequestOptions *)v41;

    uint64_t v43 = objc_opt_class();
    uint64_t v45 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v44, v43, @"ResolvedConfiguration");
    resolvedConfiguration = v5->_resolvedConfiguration;
    v5->_resolvedConfiguration = (CKOperationConfiguration *)v45;

    uint64_t v47 = objc_opt_class();
    uint64_t v49 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v48, v47, @"Group");
    group = v5->_group;
    v5->_group = (CKOperationGroup *)v49;

    uint64_t v51 = NSStringFromSelector(sel_clientHasValidatedEntitlements);
    v5->_clientuint64_t HasValidatedEntitlements = objc_msgSend_decodeBoolForKey_(v4, v52, (uint64_t)v51, v53);

    uint64_t v54 = NSStringFromSelector(sel_requestOriginator);
    v5->_requestOriginator = objc_msgSend_decodeIntegerForKey_(v4, v55, (uint64_t)v54, v56);

    v5->_wantsRequestStatistics = objc_msgSend_decodeBoolForKey_(v4, v57, @"WantsRequestStatistics", v58);
    v5->_usesAssetDownloadStagingManager = objc_msgSend_decodeBoolForKey_(v4, v59, @"UsesAssetDownloadStagingManager", v60);
    uint64_t v61 = NSStringFromSelector(sel_wantsDaemonOperationCallbacks);
    v5->_wantsDaemonOperationCallbacks = objc_msgSend_decodeBoolForKey_(v4, v62, (uint64_t)v61, v63);

    uint64_t v64 = NSStringFromSelector(sel_wantsDaemonRequestCallbacks);
    v5->_wantsDaemonRequestCallbacks = objc_msgSend_decodeBoolForKey_(v4, v65, (uint64_t)v64, v66);
  }

  return v5;
}

- (void)takeValuesFrom:(id)a3
{
  uint64_t v40 = a3;
  uint64_t v7 = objc_msgSend_operationID(v40, v4, v5, v6);
  objc_msgSend_setOperationID_(self, v8, (uint64_t)v7, v9);

  uint64_t v13 = objc_msgSend_ckOperationClassName(v40, v10, v11, v12);
  objc_msgSend_setCkOperationClassName_(self, v14, (uint64_t)v13, v15);

  uint64_t v19 = objc_msgSend_callbackProxyEndpoint(v40, v16, v17, v18);
  objc_msgSend_setCallbackProxyEndpoint_(self, v20, (uint64_t)v19, v21);

  char isOutstandingOperation = objc_msgSend_isOutstandingOperation(v40, v22, v23, v24);
  if (self) {
    self->_char isOutstandingOperation = isOutstandingOperation;
  }
  if (v40)
  {
    uint64_t v28 = (void *)v40[16];
    if (self)
    {
LABEL_5:
      objc_setProperty_nonatomic_copy(self, v26, v28, 128);
      self->_wantsRequestStatistics = objc_msgSend_wantsRequestStatistics(v40, v29, v30, v31);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if (self) {
      goto LABEL_5;
    }
  }
  objc_msgSend_wantsRequestStatistics(v40, v26, (uint64_t)v28, v27);
LABEL_6:
  uint64_t v35 = objc_msgSend_requestOriginator(v40, v32, v33, v34);
  objc_msgSend_setRequestOriginator_(self, v36, v35, v37);
  objc_msgSend_takeValuesFromParentOperationInfo_(self, v38, (uint64_t)v40, v39);
}

- (void)takeValuesFromParentOperationInfo:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_clientQueuePriority(v4, v5, v6, v7);
  objc_msgSend_setClientQueuePriority_(self, v9, v8, v10);
  uint64_t v14 = objc_msgSend_duetPreClearedMode(v4, v11, v12, v13);
  objc_msgSend_setDuetPreClearedMode_(self, v15, v14, v16);
  uint64_t v20 = objc_msgSend_discretionaryWhenBackgroundedState(v4, v17, v18, v19);
  objc_msgSend_setDiscretionaryWhenBackgroundedState_(self, v21, v20, v22);
  uint64_t v26 = objc_msgSend_systemScheduler(v4, v23, v24, v25);
  objc_msgSend_setSystemScheduler_(self, v27, v26, v28);
  uint64_t v32 = objc_msgSend_xpcActivityIdentifier(v4, v29, v30, v31);
  objc_msgSend_setXpcActivityIdentifier_(self, v33, (uint64_t)v32, v34);

  v38 = objc_msgSend_MMCSRequestOptions(v4, v35, v36, v37);
  objc_msgSend_setMMCSRequestOptions_(self, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_resolvedConfiguration(v4, v41, v42, v43);
  objc_msgSend_setResolvedConfiguration_(self, v45, (uint64_t)v44, v46);

  uint64_t v50 = objc_msgSend_group(v4, v47, v48, v49);
  objc_msgSend_setGroup_(self, v51, (uint64_t)v50, v52);

  uint64_t HasValidatedEntitlements = objc_msgSend_clientHasValidatedEntitlements(v4, v53, v54, v55);
  objc_msgSend_setClientHasValidatedEntitlements_(self, v57, HasValidatedEntitlements, v58);
  uint64_t v62 = objc_msgSend_usesAssetDownloadStagingManager(v4, v59, v60, v61);
  objc_msgSend_setUsesAssetDownloadStagingManager_(self, v63, v62, v64);
  uint64_t v68 = objc_msgSend_wantsDaemonOperationCallbacks(v4, v65, v66, v67);
  objc_msgSend_setWantsDaemonOperationCallbacks_(self, v69, v68, v70);
  uint64_t v74 = objc_msgSend_wantsDaemonRequestCallbacks(v4, v71, v72, v73);

  MEMORY[0x1F4181798](self, sel_setWantsDaemonRequestCallbacks_, v74, v75);
}

- (NSString)operationID
{
  return self->_operationID;
}

- (void)setOperationID:(id)a3
{
}

- (BOOL)isOutstandingOperation
{
  return self->_isOutstandingOperation;
}

- (NSString)ckOperationClassName
{
  return self->_ckOperationClassName;
}

- (void)setCkOperationClassName:(id)a3
{
}

- (CKOperationCallbackProxyEndpoint)callbackProxyEndpoint
{
  return self->_callbackProxyEndpoint;
}

- (void)setCallbackProxyEndpoint:(id)a3
{
}

- (CKOperationMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
}

- (CKOperationGroup)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (CKOperationConfiguration)resolvedConfiguration
{
  return self->_resolvedConfiguration;
}

- (void)setResolvedConfiguration:(id)a3
{
}

- (BOOL)clientHasValidatedEntitlements
{
  return self->_clientHasValidatedEntitlements;
}

- (void)setClientHasValidatedEntitlements:(BOOL)a3
{
  self->_clientuint64_t HasValidatedEntitlements = a3;
}

- (CKDOperation)parentOperation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentOperation);

  return (CKDOperation *)WeakRetained;
}

- (void)setParentOperation:(id)a3
{
}

- (unint64_t)requestOriginator
{
  return self->_requestOriginator;
}

- (void)setRequestOriginator:(unint64_t)a3
{
  self->_requestOriginator = a3;
}

- (BOOL)usesAssetDownloadStagingManager
{
  return self->_usesAssetDownloadStagingManager;
}

- (void)setUsesAssetDownloadStagingManager:(BOOL)a3
{
  self->_usesAssetDownloadStagingManager = a3;
}

- (BOOL)wantsRequestStatistics
{
  return self->_wantsRequestStatistics;
}

- (int64_t)clientQueuePriority
{
  return self->_clientQueuePriority;
}

- (void)setClientQueuePriority:(int64_t)a3
{
  self->_clientQueuePriority = a3;
}

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (unint64_t)discretionaryWhenBackgroundedState
{
  return self->_discretionaryWhenBackgroundedState;
}

- (void)setDiscretionaryWhenBackgroundedState:(unint64_t)a3
{
  self->_discretionaryWhenBackgroundedState = a3;
}

- (unint64_t)systemScheduler
{
  return self->_systemScheduler;
}

- (void)setSystemScheduler:(unint64_t)a3
{
  self->_systemScheduler = a3;
}

- (NSString)xpcActivityIdentifier
{
  return self->_xpcActivityIdentifier;
}

- (void)setXpcActivityIdentifier:(id)a3
{
}

- (BOOL)wantsDaemonOperationCallbacks
{
  return self->_wantsDaemonOperationCallbacks;
}

- (void)setWantsDaemonOperationCallbacks:(BOOL)a3
{
  self->_wantsDaemonOperationCallbacks = a3;
}

- (BOOL)wantsDaemonRequestCallbacks
{
  return self->_wantsDaemonRequestCallbacks;
}

- (void)setWantsDaemonRequestCallbacks:(BOOL)a3
{
  self->_wantsDaemonRequestCallbacks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_xpcActivityIdentifier, 0);
  objc_destroyWeak((id *)&self->_parentOperation);
  objc_storeStrong((id *)&self->_resolvedConfiguration, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_callbackProxyEndpoint, 0);
  objc_storeStrong((id *)&self->_ckOperationClassName, 0);

  objc_storeStrong((id *)&self->_operationID, 0);
}

@end