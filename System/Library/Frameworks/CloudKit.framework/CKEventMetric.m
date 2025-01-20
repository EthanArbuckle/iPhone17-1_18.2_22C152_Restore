@interface CKEventMetric
+ (BOOL)supportsSecureCoding;
- (BOOL)associateWithCompletedOperation:(id)a3;
- (BOOL)isCKInternalMetric;
- (BOOL)isPushTriggerFired;
- (CKEventMetric)initWithCoder:(id)a3;
- (CKEventMetric)initWithEventName:(id)a3;
- (CKEventMetric)initWithEventName:(id)a3 atTime:(id)a4;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSMutableDictionary)attributes;
- (NSString)eventName;
- (id)generateEventMetricInfo;
- (id)objectForKeyedSubscript:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setIsCKInternalMetric:(BOOL)a3;
- (void)setIsPushTriggerFired:(BOOL)a3;
- (void)setMetricValue:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setStartTime:(id)a3;
@end

@implementation CKEventMetric

- (CKEventMetric)initWithEventName:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  v9 = objc_msgSend_date(v4, v6, v7, v8);
  v11 = (CKEventMetric *)objc_msgSend_initWithEventName_atTime_(self, v10, (uint64_t)v5, (uint64_t)v9);

  return v11;
}

- (CKEventMetric)initWithEventName:(id)a3 atTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CKEventMetric;
  uint64_t v8 = [(CKEventMetric *)&v38 init];
  v12 = v8;
  if (v8)
  {
    v8->_hasBeenSubmitted = 0;
    uint64_t v13 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v9, v10, v11);
    metricUUID = v12->_metricUUID;
    v12->_metricUUID = (NSUUID *)v13;

    *(_DWORD *)&v12->_inferredAllowsCellular = 257;
    inferredDeviceIdentifier = v12->_inferredDeviceIdentifier;
    v12->_inferredDatabaseScope = 0;
    v12->_inferredDeviceIdentifier = 0;

    inferredApplicationBundleIdentifierOverrideForContainerAccess = v12->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
    v12->_inferredApplicationBundleIdentifierOverrideForContainerAccess = 0;

    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v12->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
    v12->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution = 0;

    inferredSourceApplicationSecondaryIdentifier = v12->_inferredSourceApplicationSecondaryIdentifier;
    v12->_inferredSourceApplicationSecondaryIdentifier = 0;

    inferredPrivacyProxyFailClosedOverride = v12->_inferredPrivacyProxyFailClosedOverride;
    v12->_inferredPrivacyProxyFailClosedOverride = 0;

    uint64_t v23 = objc_msgSend_copy(v6, v20, v21, v22);
    eventName = v12->_eventName;
    v12->_eventName = (NSString *)v23;

    uint64_t v28 = objc_msgSend_copy(v7, v25, v26, v27);
    startTime = v12->_startTime;
    v12->_startTime = (NSDate *)v28;

    endTime = v12->_endTime;
    v12->_endTime = 0;

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    attributes = v12->_attributes;
    v12->_attributes = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    associatedOperations = v12->_associatedOperations;
    v12->_associatedOperations = v33;

    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    associatedOperationGroups = v12->_associatedOperationGroups;
    v12->_associatedOperationGroups = v35;
  }
  return v12;
}

- (BOOL)associateWithCompletedOperation:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isFinished(v4, v5, v6, v7)) {
    char isFinishingOnCallbackQueue = 1;
  }
  else {
    char isFinishingOnCallbackQueue = objc_msgSend_isFinishingOnCallbackQueue(v4, v8, v9, v10);
  }
  v12 = self;
  objc_sync_enter(v12);
  if (v12) {
    BOOL hasBeenSubmitted = v12->_hasBeenSubmitted;
  }
  else {
    BOOL hasBeenSubmitted = 0;
  }
  if (!v4) {
    BOOL hasBeenSubmitted = 1;
  }
  char v17 = hasBeenSubmitted | isFinishingOnCallbackQueue ^ 1;
  if ((v17 & 1) == 0)
  {
    v18 = objc_msgSend_resolvedConfiguration(v4, v13, v14, v15);
    char v22 = objc_msgSend_allowsCellularAccess(v18, v19, v20, v21);
    if (v12)
    {
      if (v12->_inferredAllowsCellular) {
        BOOL v23 = v22;
      }
      else {
        BOOL v23 = 0;
      }
      v12->_inferredAllowsCellular = v23;
    }

    uint64_t v27 = objc_msgSend_resolvedConfiguration(v4, v24, v25, v26);
    char v31 = objc_msgSend_allowsExpensiveNetworkAccess(v27, v28, v29, v30);
    if (v12)
    {
      if (v12->_inferredAllowsExpensive) {
        BOOL v32 = v31;
      }
      else {
        BOOL v32 = 0;
      }
      v12->_inferredAllowsExpensive = v32;
    }

    v36 = objc_msgSend_resolvedConfiguration(v4, v33, v34, v35);
    char v40 = objc_msgSend_preferAnonymousRequests(v36, v37, v38, v39);
    if (v12)
    {
      if (v12->_inferredPreferAnonymousRequests) {
        char v41 = 1;
      }
      else {
        char v41 = v40;
      }
      v12->_inferredPreferAnonymousRequests = v41;

      associatedOperations = v12->_associatedOperations;
    }
    else
    {

      associatedOperations = 0;
    }
    v43 = associatedOperations;
    uint64_t v47 = objc_msgSend_count(v43, v44, v45, v46);

    if (!v47)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v51 = v4;
        uint64_t v55 = objc_msgSend_databaseScope(v51, v52, v53, v54);
        if (v12) {
          v12->_inferredDatabaseScope = v55;
        }
      }
      v56 = objc_msgSend_resolvedConfiguration(v4, v48, v49, v50);
      v60 = objc_msgSend_container(v56, v57, v58, v59);
      v64 = objc_msgSend_options(v60, v61, v62, v63);
      v68 = objc_msgSend_testDeviceReferenceProtocol(v64, v65, v66, v67);
      v73 = objc_msgSend_deviceID(v68, v69, v70, v71);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v72, v73, 64);
      }

      v77 = objc_msgSend_resolvedConfiguration(v4, v74, v75, v76);
      v82 = objc_msgSend_sourceApplicationBundleIdentifier(v77, v78, v79, v80);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v81, v82, 72);
      }

      v86 = objc_msgSend_resolvedConfiguration(v4, v83, v84, v85);
      v91 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(v86, v87, v88, v89);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v90, v91, 80);
      }

      v95 = objc_msgSend_resolvedConfiguration(v4, v92, v93, v94);
      v100 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(v95, v96, v97, v98);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v99, v100, 88);
      }

      v104 = objc_msgSend_resolvedConfiguration(v4, v101, v102, v103);
      v109 = objc_msgSend__sourceApplicationSecondaryIdentifier(v104, v105, v106, v107);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v108, v109, 104);
      }

      v113 = objc_msgSend_resolvedConfiguration(v4, v110, v111, v112);
      v118 = objc_msgSend_privacyProxyFailClosedOverride(v113, v114, v115, v116);
      if (v12) {
        objc_setProperty_nonatomic_copy(v12, v117, v118, 96);
      }
    }
    v119 = [CKEventOperationInfo alloc];
    v122 = objc_msgSend_initWithOperation_(v119, v120, (uint64_t)v4, v121);
    if (v12) {
      v123 = v12->_associatedOperations;
    }
    else {
      v123 = 0;
    }
    v124 = v123;
    v128 = objc_msgSend_operationID(v4, v125, v126, v127);
    objc_msgSend_setObject_forKeyedSubscript_(v124, v129, (uint64_t)v122, (uint64_t)v128);

    v133 = objc_msgSend_group(v4, v130, v131, v132);
    if (v133)
    {
      v134 = v12 ? v12->_associatedOperationGroups : 0;
      v135 = v134;
      v139 = objc_msgSend_group(v4, v136, v137, v138);
      v143 = objc_msgSend_operationGroupID(v139, v140, v141, v142);
      v146 = objc_msgSend_objectForKeyedSubscript_(v135, v144, (uint64_t)v143, v145);

      if (!v146)
      {
        v147 = [CKEventOperationGroupInfo alloc];
        objc_msgSend_group(v4, v148, v149, v150);
        id v151 = (id)objc_claimAutoreleasedReturnValue();
        if (v147)
        {
          v182.receiver = v147;
          v182.super_class = (Class)CKEventOperationGroupInfo;
          v147 = [(CKEventMetric *)&v182 init];
          if (v147)
          {
            v155 = objc_msgSend_operationGroupID(v151, v152, v153, v154);
            uint64_t v159 = objc_msgSend_copy(v155, v156, v157, v158);
            operationGroupID = v147->_operationGroupID;
            v147->_operationGroupID = (NSString *)v159;

            v164 = objc_msgSend_name(v151, v161, v162, v163);
            uint64_t v168 = objc_msgSend_copy(v164, v165, v166, v167);
            operationGroupName = v147->_operationGroupName;
            v147->_operationGroupName = (NSString *)v168;
          }
        }

        if (v12) {
          associatedOperationGroups = v12->_associatedOperationGroups;
        }
        else {
          associatedOperationGroups = 0;
        }
        v171 = associatedOperationGroups;
        v175 = objc_msgSend_group(v4, v172, v173, v174);
        v179 = objc_msgSend_operationGroupID(v175, v176, v177, v178);
        objc_msgSend_setObject_forKeyedSubscript_(v171, v180, (uint64_t)v147, (uint64_t)v179);
      }
    }
  }
  objc_sync_exit(v12);

  return v17 ^ 1;
}

- (NSMutableDictionary)attributes
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v6 = objc_msgSend_copy(v2->_attributes, v3, v4, v5);
  objc_sync_exit(v2);

  return (NSMutableDictionary *)v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5->_attributes, v6, (uint64_t)v4, v7);
  objc_sync_exit(v5);

  return v8;
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  objc_sync_enter(v7);
  if (v7)
  {
    BOOL hasBeenSubmitted = v7->_hasBeenSubmitted;
    if (!v6) {
      goto LABEL_5;
    }
  }
  else
  {
    BOOL hasBeenSubmitted = 0;
    if (!v6) {
      goto LABEL_5;
    }
  }
  if (!hasBeenSubmitted)
  {
    uint64_t v11 = objc_msgSend_copyWithZone_(v13, v8, 0, v9);
    objc_msgSend_setObject_forKeyedSubscript_(v7->_attributes, v12, (uint64_t)v11, (uint64_t)v6);
  }
LABEL_5:
  objc_sync_exit(v7);
}

- (void)setMetricValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v10 = (id)objc_msgSend_copyWithZone_(a3, v7, 0, v8);
  objc_msgSend_setObject_forKeyedSubscript_(self, v9, (uint64_t)v10, (uint64_t)v6);
}

- (id)generateEventMetricInfo
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2)
  {
    associatedOperations = 0;
LABEL_9:
    id v6 = associatedOperations;
    uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);

    if (v10)
    {
      if (!v2) {
        goto LABEL_15;
      }
    }
    else
    {
      if (!v2)
      {
LABEL_15:
        uint64_t v11 = [CKEventMetricInfo alloc];
        id v4 = objc_msgSend_initWithEventMetric_(v11, v12, (uint64_t)v2, v13);
        goto LABEL_16;
      }
      *(_WORD *)&v2->_inferredAllowsCellular = 0;
      v2->_inferredPreferAnonymousRequests = 1;
    }
    v2->_BOOL hasBeenSubmitted = 1;
    goto LABEL_15;
  }
  if (!v2->_hasBeenSubmitted)
  {
    associatedOperations = v2->_associatedOperations;
    goto LABEL_9;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  v3 = ck_log_facility_ck;
  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    v15[0] = 0;
    _os_log_impl(&dword_18AF10000, v3, OS_LOG_TYPE_INFO, "Repeat event metric. Cancelling.", (uint8_t *)v15, 2u);
  }
  id v4 = 0;
LABEL_16:
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v64 = a3;
  id v4 = self;
  uint64_t v5 = objc_sync_enter(v4);
  uint64_t v7 = (void *)MEMORY[0x18C12ADA0](v5);
  if (v4) {
    objc_msgSend_encodeBool_forKey_(v64, v6, v4->_hasBeenSubmitted, @"submitted");
  }
  else {
    objc_msgSend_encodeBool_forKey_(v64, v6, 0, @"submitted");
  }
  if (v4) {
    metricUUID = v4->_metricUUID;
  }
  else {
    metricUUID = 0;
  }
  uint64_t v9 = metricUUID;
  objc_msgSend_encodeObject_forKey_(v64, v10, (uint64_t)v9, @"uuid");

  uint64_t isCKInternalMetric = objc_msgSend_isCKInternalMetric(v4, v11, v12, v13);
  objc_msgSend_encodeBool_forKey_(v64, v15, isCKInternalMetric, @"ckinternal");
  if (v4) {
    objc_msgSend_encodeBool_forKey_(v64, v16, v4->_inferredAllowsCellular, @"allowsCellular");
  }
  else {
    objc_msgSend_encodeBool_forKey_(v64, v16, 0, @"allowsCellular");
  }
  if (v4) {
    objc_msgSend_encodeBool_forKey_(v64, v17, v4->_inferredAllowsExpensive, @"allowsExpensive");
  }
  else {
    objc_msgSend_encodeBool_forKey_(v64, v17, 0, @"allowsExpensive");
  }
  if (v4) {
    objc_msgSend_encodeBool_forKey_(v64, v18, v4->_inferredPreferAnonymousRequests, @"preferAnonymousRequests");
  }
  else {
    objc_msgSend_encodeBool_forKey_(v64, v18, 0, @"preferAnonymousRequests");
  }
  if (v4) {
    objc_msgSend_encodeInteger_forKey_(v64, v19, v4->_inferredDatabaseScope, @"databaseScope");
  }
  else {
    objc_msgSend_encodeInteger_forKey_(v64, v19, 0, @"databaseScope");
  }
  if (v4) {
    inferredDeviceIdentifier = v4->_inferredDeviceIdentifier;
  }
  else {
    inferredDeviceIdentifier = 0;
  }
  uint64_t v21 = inferredDeviceIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v22, (uint64_t)v21, @"deviceIdentifier");

  if (v4) {
    inferredSourceApplicationBundleIdentifier = v4->_inferredSourceApplicationBundleIdentifier;
  }
  else {
    inferredSourceApplicationBundleIdentifier = 0;
  }
  v24 = inferredSourceApplicationBundleIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v25, (uint64_t)v24, @"sourceApplicationBundleIdentifier");

  if (v4) {
    inferredApplicationBundleIdentifierOverrideForContainerAccess = v4->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
  }
  else {
    inferredApplicationBundleIdentifierOverrideForContainerAccess = 0;
  }
  uint64_t v27 = inferredApplicationBundleIdentifierOverrideForContainerAccess;
  objc_msgSend_encodeObject_forKey_(v64, v28, (uint64_t)v27, @"applicationBundleIdentifierOverrideForContainerAccess");

  if (v4) {
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v4->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  }
  else {
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = 0;
  }
  uint64_t v30 = inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
  objc_msgSend_encodeObject_forKey_(v64, v31, (uint64_t)v30, @"applicationBundleIdentifierOverrideForNetworkAttribution");

  if (v4) {
    inferredSourceApplicationSecondaryIdentifier = v4->_inferredSourceApplicationSecondaryIdentifier;
  }
  else {
    inferredSourceApplicationSecondaryIdentifier = 0;
  }
  v33 = inferredSourceApplicationSecondaryIdentifier;
  objc_msgSend_encodeObject_forKey_(v64, v34, (uint64_t)v33, @"sourceApplicationSecondaryIdentifier");

  if (v4) {
    inferredPrivacyProxyFailClosedOverride = v4->_inferredPrivacyProxyFailClosedOverride;
  }
  else {
    inferredPrivacyProxyFailClosedOverride = 0;
  }
  v36 = inferredPrivacyProxyFailClosedOverride;
  objc_msgSend_encodeObject_forKey_(v64, v37, (uint64_t)v36, @"privacyProxyFailClosedOverride");

  char v41 = objc_msgSend_eventName(v4, v38, v39, v40);
  objc_msgSend_encodeObject_forKey_(v64, v42, (uint64_t)v41, @"eventName");

  uint64_t v46 = objc_msgSend_startTime(v4, v43, v44, v45);
  objc_msgSend_encodeObject_forKey_(v64, v47, (uint64_t)v46, @"startTime");

  id v51 = objc_msgSend_endTime(v4, v48, v49, v50);
  objc_msgSend_encodeObject_forKey_(v64, v52, (uint64_t)v51, @"endTime");

  v56 = objc_msgSend_attributes(v4, v53, v54, v55);
  objc_msgSend_encodeObject_forKey_(v64, v57, (uint64_t)v56, @"attributes");

  if (v4) {
    associatedOperations = v4->_associatedOperations;
  }
  else {
    associatedOperations = 0;
  }
  uint64_t v59 = associatedOperations;
  objc_msgSend_encodeObject_forKey_(v64, v60, (uint64_t)v59, @"operations");

  if (v4) {
    associatedOperationGroups = v4->_associatedOperationGroups;
  }
  else {
    associatedOperationGroups = 0;
  }
  uint64_t v62 = associatedOperationGroups;
  objc_msgSend_encodeObject_forKey_(v64, v63, (uint64_t)v62, @"operationGroups");

  objc_sync_exit(v4);
}

- (CKEventMetric)initWithCoder:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)CKEventMetric;
  uint64_t v5 = [(CKEventMetric *)&v91 init];
  if (v5)
  {
    context = (void *)MEMORY[0x18C12ADA0]();
    v5->_BOOL hasBeenSubmitted = objc_msgSend_decodeBoolForKey_(v4, v6, @"submitted", v7);
    uint64_t v8 = objc_opt_class();
    uint64_t v10 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v9, v8, @"uuid");
    metricUUID = v5->_metricUUID;
    v5->_metricUUID = (NSUUID *)v10;

    v5->_uint64_t isCKInternalMetric = objc_msgSend_decodeBoolForKey_(v4, v12, @"ckinternal", v13);
    v5->_inferredAllowsCellular = objc_msgSend_decodeBoolForKey_(v4, v14, @"allowsCellular", v15);
    v5->_inferredAllowsExpensive = objc_msgSend_decodeBoolForKey_(v4, v16, @"allowsExpensive", v17);
    v5->_inferredPreferAnonymousRequests = objc_msgSend_decodeBoolForKey_(v4, v18, @"preferAnonymousRequests", v19);
    v5->_inferredDatabaseScope = objc_msgSend_decodeIntegerForKey_(v4, v20, @"databaseScope", v21);
    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"deviceIdentifier");
    inferredDeviceIdentifier = v5->_inferredDeviceIdentifier;
    v5->_inferredDeviceIdentifier = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"sourceApplicationBundleIdentifier");
    inferredSourceApplicationBundleIdentifier = v5->_inferredSourceApplicationBundleIdentifier;
    v5->_inferredSourceApplicationBundleIdentifier = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"applicationBundleIdentifierOverrideForContainerAccess");
    inferredApplicationBundleIdentifierOverrideForContainerAccess = v5->_inferredApplicationBundleIdentifierOverrideForContainerAccess;
    v5->_inferredApplicationBundleIdentifierOverrideForContainerAccess = (NSString *)v32;

    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"applicationBundleIdentifierOverrideForNetworkAttribution");
    inferredApplicationBundleIdentifierOverrideForNetworkAttribution = v5->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"sourceApplicationSecondaryIdentifier");
    inferredSourceApplicationSecondaryIdentifier = v5->_inferredSourceApplicationSecondaryIdentifier;
    v5->_inferredSourceApplicationSecondaryIdentifier = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"privacyProxyFailClosedOverride");
    inferredPrivacyProxyFailClosedOverride = v5->_inferredPrivacyProxyFailClosedOverride;
    v5->_inferredPrivacyProxyFailClosedOverride = (NSNumber *)v44;

    uint64_t v46 = objc_opt_class();
    uint64_t v48 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v47, v46, @"eventName");
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v48;

    uint64_t v50 = objc_opt_class();
    uint64_t v52 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v51, v50, @"startTime");
    startTime = v5->_startTime;
    v5->_startTime = (NSDate *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v56 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"endTime");
    endTime = v5->_endTime;
    v5->_endTime = (NSDate *)v56;

    uint64_t v58 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v59 = objc_opt_class();
    uint64_t v60 = objc_opt_class();
    uint64_t v61 = objc_opt_class();
    uint64_t v62 = objc_opt_class();
    v65 = objc_msgSend_setWithObjects_(v58, v63, v59, v64, v60, v61, v62, 0);
    uint64_t v67 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v65, @"attributes");
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableDictionary *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    uint64_t v75 = objc_msgSend_setWithObjects_(v69, v73, v70, v74, v71, v72, 0);
    uint64_t v77 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, @"operations");
    associatedOperations = v5->_associatedOperations;
    v5->_associatedOperations = (NSMutableDictionary *)v77;

    uint64_t v79 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v80 = objc_opt_class();
    uint64_t v81 = objc_opt_class();
    uint64_t v82 = objc_opt_class();
    uint64_t v85 = objc_msgSend_setWithObjects_(v79, v83, v80, v84, v81, v82, 0);
    uint64_t v87 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, @"operationGroups");
    associatedOperationGroups = v5->_associatedOperationGroups;
    v5->_associatedOperationGroups = (NSMutableDictionary *)v87;
  }

  return v5;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEndTime:(id)a3
{
}

- (BOOL)isPushTriggerFired
{
  return self->_isPushTriggerFired;
}

- (void)setIsPushTriggerFired:(BOOL)a3
{
  self->_isPushTriggerFired = a3;
}

- (BOOL)isCKInternalMetric
{
  return self->_isCKInternalMetric;
}

- (void)setIsCKInternalMetric:(BOOL)a3
{
  self->_uint64_t isCKInternalMetric = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedOperationGroups, 0);
  objc_storeStrong((id *)&self->_associatedOperations, 0);
  objc_storeStrong((id *)&self->_inferredSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredPrivacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_inferredApplicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_inferredApplicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_inferredSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_inferredDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_metricUUID, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end