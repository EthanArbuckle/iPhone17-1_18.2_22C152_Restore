@interface CKSchedulerActivity
+ (id)defaultRelatedApplicationBundleIdentifiersForContainer:(id)a3;
- (BOOL)overrideRateLimiting;
- (BOOL)shouldDefer;
- (BOOL)userRequestedBackupTask;
- (CKContainer)container;
- (CKContainer)nullableContainer;
- (CKContainerID)containerID;
- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 containerID:(id)a5 priority:(int64_t)a6;
- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 priority:(int64_t)a5;
- (CKSchedulerActivity)initWithIdentifier:(id)a3 containerID:(id)a4 priority:(int64_t)a5;
- (CKXPCActivity)ckXPCActivity;
- (NSArray)relatedApplicationBundleIdentifiers;
- (NSDate)earliestStartDate;
- (NSDictionary)additionalXPCActivityCriteria;
- (NSString)description;
- (NSString)identifier;
- (OS_xpc_object)xpcActivityCriteriaOverrides;
- (id)copyWithZone:(_NSZone *)a3;
- (id)redactedDescription;
- (int64_t)priority;
- (unint64_t)expectedTransferSizeBytes;
- (void)CKDescribePropertiesUsing:(id)a3;
- (void)setAdditionalXPCActivityCriteria:(id)a3;
- (void)setCkXPCActivity:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setEarliestStartDate:(id)a3;
- (void)setExpectedTransferSizeBytes:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setOverrideRateLimiting:(BOOL)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRelatedApplicationBundleIdentifiers:(id)a3;
- (void)setShouldDefer:(BOOL)a3;
- (void)setUserRequestedBackupTask:(BOOL)a3;
- (void)setXpcActivityCriteriaOverrides:(id)a3;
@end

@implementation CKSchedulerActivity

- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 containerID:(id)a5 priority:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v54 = 0;
  char v13 = _CKCheckArgument((uint64_t)"identifier", v10, 0, 0, 0, &v54);
  id v14 = v54;
  if ((v13 & 1) == 0
    || (v14,
        id v53 = 0,
        char v15 = _CKCheckArgument((uint64_t)"containerID", v12, 0, 0, 0, &v53),
        id v14 = v53,
        (v15 & 1) == 0))
  {
    v40 = v14;
    v41 = [CKException alloc];
    uint64_t v45 = objc_msgSend_code(v40, v42, v43, v44);
    v49 = objc_msgSend_localizedDescription(v40, v46, v47, v48);
    id v51 = (id)objc_msgSend_initWithCode_format_(v41, v50, v45, @"%@", v49);

    objc_exception_throw(v51);
  }

  v52.receiver = self;
  v52.super_class = (Class)CKSchedulerActivity;
  v19 = [(CKSchedulerActivity *)&v52 init];
  if (v19)
  {
    uint64_t v20 = objc_msgSend_copy(v10, v16, v17, v18);
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v25 = objc_msgSend_copy(v12, v22, v23, v24);
    containerID = v19->_containerID;
    v19->_containerID = (CKContainerID *)v25;

    objc_storeStrong((id *)&v19->_nullableContainer, a4);
    v19->_priority = a6;
    v27 = objc_opt_class();
    uint64_t v30 = objc_msgSend_defaultRelatedApplicationBundleIdentifiersForContainer_(v27, v28, (uint64_t)v11, v29);
    relatedApplicationBundleIdentifiers = v19->_relatedApplicationBundleIdentifiers;
    v19->_relatedApplicationBundleIdentifiers = (NSArray *)v30;

    v35 = objc_msgSend_sharedOptions(CKBehaviorOptions, v32, v33, v34);
    v19->_overrideRateLimiting = objc_msgSend_isDASRateLimitingDisabled(v35, v36, v37, v38);
  }
  return v19;
}

+ (id)defaultRelatedApplicationBundleIdentifiersForContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  v8 = objc_msgSend_options(v3, v5, v6, v7);
  id v12 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v8, v9, v10, v11);

  if (v12)
  {
    v16 = objc_msgSend_options(v3, v13, v14, v15);
    uint64_t v20 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v16, v17, v18, v19);
    objc_msgSend_addObject_(v4, v21, (uint64_t)v20, v22);
  }
  uint64_t v23 = objc_msgSend_options(v3, v13, v14, v15);
  v27 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v23, v24, v25, v26);

  if (v27)
  {
    v31 = objc_msgSend_options(v3, v28, v29, v30);
    v35 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v31, v32, v33, v34);
    objc_msgSend_addObject_(v4, v36, (uint64_t)v35, v37);
  }
  uint64_t v38 = objc_msgSend_options(v3, v28, v29, v30);
  v42 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v38, v39, v40, v41);

  if (v42)
  {
    v46 = objc_msgSend_options(v3, v43, v44, v45);
    v50 = objc_msgSend_applicationBundleIdentifierOverrideForTCC(v46, v47, v48, v49);
    objc_msgSend_addObject_(v4, v51, (uint64_t)v50, v52);
  }
  id v53 = objc_msgSend_options(v3, v43, v44, v45);
  v57 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v53, v54, v55, v56);

  if (v57)
  {
    v61 = objc_msgSend_options(v3, v58, v59, v60);
    v65 = objc_msgSend_applicationBundleIdentifierOverrideForPushTopicGeneration(v61, v62, v63, v64);
    objc_msgSend_addObject_(v4, v66, (uint64_t)v65, v67);
  }
  v68 = objc_msgSend_sharedManager(CKProcessScopedStateManager, v58, v59, v60);
  v72 = objc_msgSend_untrustedEntitlements(v68, v69, v70, v71);
  v76 = objc_msgSend_applicationBundleID(v72, v73, v74, v75);

  if (v76) {
    objc_msgSend_addObject_(v4, v77, (uint64_t)v76, v79);
  }
  v80 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v77, v78, v79);
  v84 = objc_msgSend_bundleIdentifier(v80, v81, v82, v83);

  if (v84) {
    objc_msgSend_addObject_(v4, v85, (uint64_t)v84, v87);
  }
  v88 = objc_msgSend_array(v4, v85, v86, v87);

  return v88;
}

- (CKSchedulerActivity)initWithIdentifier:(id)a3 containerID:(id)a4 priority:(int64_t)a5
{
  return (CKSchedulerActivity *)objc_msgSend_initWithIdentifier_container_containerID_priority_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (CKSchedulerActivity)initWithIdentifier:(id)a3 container:(id)a4 priority:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  char v13 = objc_msgSend_containerID(v8, v10, v11, v12);
  uint64_t v15 = (CKSchedulerActivity *)objc_msgSend_initWithIdentifier_container_containerID_priority_(self, v14, (uint64_t)v9, (uint64_t)v8, v13, a5);

  return v15;
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_identifier(self, v5, v6, v7);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, @"identifier", (uint64_t)v8, 0);

  uint64_t v10 = NSNumber;
  uint64_t v14 = objc_msgSend_priority(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_numberWithInteger_(v10, v15, v14, v16);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v18, @"priority", (uint64_t)v17, 0);

  uint64_t v25 = objc_msgSend_earliestStartDate(self, v19, v20, v21);
  if (v25) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v22, @"earliestStartDate", (uint64_t)v25, 0);
  }
  uint64_t v26 = objc_msgSend_containerID(self, v22, v23, v24);
  objc_msgSend_addProperty_value_shouldRedact_(v4, v27, @"container", (uint64_t)v26, 0);

  uint64_t v31 = objc_msgSend_expectedTransferSizeBytes(self, v28, v29, v30);
  if (v31)
  {
    v35 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v32, v31, v34);
    objc_msgSend_addProperty_value_shouldRedact_(v4, v36, @"expectedTransferSizeBytes", (uint64_t)v35, 0);
  }
  if (objc_msgSend_userRequestedBackupTask(self, v32, v33, v34)) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v37, @"userRequestedBackupTask", MEMORY[0x1E4F1CC38], 0);
  }
  uint64_t v40 = objc_msgSend_relatedApplicationBundleIdentifiers(self, v37, v38, v39);
  if (objc_msgSend_count(v40, v41, v42, v43)) {
    objc_msgSend_addProperty_value_shouldRedact_(v4, v44, @"relatedApplications", (uint64_t)v40, 0);
  }
  v50 = objc_msgSend_xpcActivityCriteriaOverrides(self, v44, v45, v46);
  if (v50)
  {
    id v51 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v47, v48, v49);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_18B0BFDA4;
    applier[3] = &unk_1E5463CF8;
    id v55 = v51;
    id v52 = v51;
    xpc_dictionary_apply(v50, applier);
    objc_msgSend_addProperty_value_shouldRedact_(v4, v53, @"xpcActivityCriteriaOverrides", (uint64_t)v52, 0);
  }
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSchedulerActivity *, char *))MEMORY[0x1F4181798])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSchedulerActivity *, char *))MEMORY[0x1F4181798])(self, sel_CKRedactedDescription);
}

- (CKContainer)container
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_nullableContainer)
  {
    id v3 = [CKContainer alloc];
    uint64_t v7 = objc_msgSend_containerID(v2, v4, v5, v6);
    uint64_t v10 = objc_msgSend_initWithContainerID_(v3, v8, (uint64_t)v7, v9);
    nullableContainer = v2->_nullableContainer;
    v2->_nullableContainer = (CKContainer *)v10;
  }
  objc_sync_exit(v2);

  uint64_t v12 = v2->_nullableContainer;

  return v12;
}

- (void)setContainer:(id)a3
{
  id v4 = (CKContainer *)a3;
  obj = self;
  objc_sync_enter(obj);
  nullableContainer = obj->_nullableContainer;
  obj->_nullableContainer = v4;

  objc_sync_exit(obj);
}

- (BOOL)userRequestedBackupTask
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL userRequestedBackupTask = v2->_userRequestedBackupTask;
  objc_sync_exit(v2);

  return userRequestedBackupTask;
}

- (void)setUserRequestedBackupTask:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL userRequestedBackupTask = a3;
  objc_sync_exit(obj);
}

- (NSArray)relatedApplicationBundleIdentifiers
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_relatedApplicationBundleIdentifiers;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRelatedApplicationBundleIdentifiers:(id)a3
{
  id v10 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v8 = objc_msgSend_CKDeepCopy(v10, v5, v6, v7);
  relatedApplicationBundleIdentifiers = v4->_relatedApplicationBundleIdentifiers;
  v4->_relatedApplicationBundleIdentifiers = (NSArray *)v8;

  objc_sync_exit(v4);
}

- (void)setAdditionalXPCActivityCriteria:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    xpc_object_t empty = xpc_dictionary_create_empty();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_18B0C017C;
    v10[3] = &unk_1E5463D20;
    id v7 = empty;
    id v11 = v7;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v5, v8, (uint64_t)v10, v9);
  }
  else
  {
    id v7 = 0;
  }
  objc_msgSend_setXpcActivityCriteriaOverrides_(self, a2, (uint64_t)v7, v3);
}

- (NSDictionary)additionalXPCActivityCriteria
{
  id v7 = objc_msgSend_xpcActivityCriteriaOverrides(self, a2, v2, v3);
  if (v7)
  {
    uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v4, v5, v6);
    applier[0] = MEMORY[0x1E4F143A8];
    applier[1] = 3221225472;
    applier[2] = sub_18B0C02B8;
    applier[3] = &unk_1E5463CF8;
    id v9 = v8;
    id v12 = v9;
    xpc_dictionary_apply(v7, applier);
  }
  else
  {
    id v9 = 0;
  }

  return (NSDictionary *)v9;
}

- (void)setXpcActivityCriteriaOverrides:(id)a3
{
  id object = a3;
  id v4 = self;
  objc_sync_enter(v4);
  if (object)
  {
    Class = object_getClass(object);
    if (Class != (const _xpc_type_s *)MEMORY[0x1E4F14590])
    {
      uint64_t v8 = [CKException alloc];
      name = xpc_type_get_name(MEMORY[0x1E4F14590]);
      id v10 = xpc_type_get_name(Class);
      id v12 = (id)objc_msgSend_initWithName_format_(v8, v11, *MEMORY[0x1E4F1C3C8], @"Tried to set invalid object for xpcActivityCriteriaOverrides. Expected %s, but received %s.", name, v10);
      objc_exception_throw(v12);
    }
    uint64_t v6 = (OS_xpc_object *)xpc_copy(object);
    xpcActivityCriteriaOverrides = v4->_xpcActivityCriteriaOverrides;
    v4->_xpcActivityCriteriaOverrides = v6;
  }
  else
  {
    xpcActivityCriteriaOverrides = v4->_xpcActivityCriteriaOverrides;
    v4->_xpcActivityCriteriaOverrides = 0;
  }

  objc_sync_exit(v4);
}

- (OS_xpc_object)xpcActivityCriteriaOverrides
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  xpcActivityCriteriaOverrides = v2->_xpcActivityCriteriaOverrides;
  if (xpcActivityCriteriaOverrides) {
    xpc_object_t v4 = xpc_copy(xpcActivityCriteriaOverrides);
  }
  else {
    xpc_object_t v4 = 0;
  }
  objc_sync_exit(v2);

  return (OS_xpc_object *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  xpc_object_t v4 = [CKSchedulerActivity alloc];
  uint64_t v8 = objc_msgSend_identifier(self, v5, v6, v7);
  id v12 = objc_msgSend_containerID(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_priority(self, v13, v14, v15);
  uint64_t v18 = objc_msgSend_initWithIdentifier_containerID_priority_(v4, v17, (uint64_t)v8, (uint64_t)v12, v16);

  *(void *)(v18 + 48) = objc_msgSend_expectedTransferSizeBytes(self, v19, v20, v21);
  uint64_t v25 = objc_msgSend_earliestStartDate(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_copy(v25, v26, v27, v28);
  uint64_t v30 = *(void **)(v18 + 56);
  *(void *)(v18 + 56) = v29;

  uint64_t v34 = objc_msgSend_xpcActivityCriteriaOverrides(self, v31, v32, v33);
  uint64_t v38 = v34;
  if (v34)
  {
    xpc_object_t v39 = xpc_copy(v34);
    uint64_t v40 = *(void **)(v18 + 16);
    *(void *)(v18 + 16) = v39;
  }
  *(unsigned char *)(v18 + 9) = objc_msgSend_shouldDefer(self, v35, v36, v37);
  uint64_t v44 = objc_msgSend_ckXPCActivity(self, v41, v42, v43);
  uint64_t v45 = *(void **)(v18 + 80);
  *(void *)(v18 + 80) = v44;

  *(unsigned char *)(v18 + 8) = objc_msgSend_userRequestedBackupTask(self, v46, v47, v48);
  id v52 = objc_msgSend_relatedApplicationBundleIdentifiers(self, v49, v50, v51);
  uint64_t v56 = objc_msgSend_CKDeepCopy(v52, v53, v54, v55);
  v57 = *(void **)(v18 + 24);
  *(void *)(v18 + 24) = v56;

  return (id)v18;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)shouldDefer
{
  return self->_shouldDefer;
}

- (void)setShouldDefer:(BOOL)a3
{
  self->_shouldDefer = a3;
}

- (unint64_t)expectedTransferSizeBytes
{
  return self->_expectedTransferSizeBytes;
}

- (void)setExpectedTransferSizeBytes:(unint64_t)a3
{
  self->_expectedTransferSizeBytes = a3;
}

- (NSDate)earliestStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEarliestStartDate:(id)a3
{
}

- (CKContainerID)containerID
{
  return self->_containerID;
}

- (void)setContainerID:(id)a3
{
}

- (CKContainer)nullableContainer
{
  return self->_nullableContainer;
}

- (CKXPCActivity)ckXPCActivity
{
  return (CKXPCActivity *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCkXPCActivity:(id)a3
{
}

- (BOOL)overrideRateLimiting
{
  return self->_overrideRateLimiting;
}

- (void)setOverrideRateLimiting:(BOOL)a3
{
  self->_overrideRateLimiting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckXPCActivity, 0);
  objc_storeStrong((id *)&self->_nullableContainer, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_earliestStartDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relatedApplicationBundleIdentifiers, 0);

  objc_storeStrong((id *)&self->_xpcActivityCriteriaOverrides, 0);
}

@end