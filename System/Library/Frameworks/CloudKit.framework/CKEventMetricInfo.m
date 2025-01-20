@interface CKEventMetricInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellularAccess;
- (BOOL)allowsExpensiveNetworkAccess;
- (BOOL)isCKInternalMetric;
- (BOOL)isPushTriggerFired;
- (BOOL)preferAnonymousRequests;
- (CKEventMetricInfo)initWithCoder:(id)a3;
- (CKEventMetricInfo)initWithEventMetric:(id)a3;
- (NSDate)endTime;
- (NSDate)startTime;
- (NSDictionary)associatedOperationGroups;
- (NSDictionary)associatedOperations;
- (NSDictionary)attributes;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSString)applicationBundleIdentifierOverrideForContainerAccess;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (NSString)deviceIdentifier;
- (NSString)eventName;
- (NSString)sourceApplicationBundleIdentifier;
- (NSString)sourceApplicationSecondaryIdentifier;
- (NSUUID)metricUUID;
- (int64_t)databaseScope;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKEventMetricInfo

- (CKEventMetricInfo)initWithEventMetric:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CKEventMetricInfo;
  v5 = [(CKEventMetricInfo *)&v67 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      v7 = (void *)*((void *)v4 + 6);
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_metricUUID, v7);
    v6->_isCKInternalMetric = objc_msgSend_isCKInternalMetric(v4, v8, v9, v10);
    char isPushTriggerFired = objc_msgSend_isPushTriggerFired(v4, v11, v12, v13);
    v6->_char isPushTriggerFired = isPushTriggerFired;
    if (v4)
    {
      if (*((unsigned char *)v4 + 10)) {
        char v15 = 1;
      }
      else {
        char v15 = isPushTriggerFired;
      }
      v6->_allowsCellularAccess = v15;
      if (*((unsigned char *)v4 + 11)) {
        char v16 = 1;
      }
      else {
        char v16 = isPushTriggerFired;
      }
      v6->_allowsExpensiveNetworkAccess = v16;
      v6->_preferAnonymousRequests = *((unsigned char *)v4 + 12);
      v17 = (void *)*((void *)v4 + 8);
    }
    else
    {
      v17 = 0;
      v6->_allowsCellularAccess = isPushTriggerFired;
      v6->_allowsExpensiveNetworkAccess = isPushTriggerFired;
      v6->_preferAnonymousRequests = 0;
    }
    objc_storeStrong((id *)&v6->_deviceIdentifier, v17);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_sourceApplicationBundleIdentifier, *((id *)v4 + 9));
      v18 = (void *)*((void *)v4 + 10);
    }
    else
    {
      sourceApplicationBundleIdentifier = v6->_sourceApplicationBundleIdentifier;
      v6->_sourceApplicationBundleIdentifier = 0;

      v18 = 0;
    }
    objc_storeStrong((id *)&v6->_applicationBundleIdentifierOverrideForContainerAccess, v18);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_applicationBundleIdentifierOverrideForNetworkAttribution, *((id *)v4 + 11));
      v19 = (void *)*((void *)v4 + 13);
    }
    else
    {
      applicationBundleIdentifierOverrideForNetworkAttribution = v6->_applicationBundleIdentifierOverrideForNetworkAttribution;
      v6->_applicationBundleIdentifierOverrideForNetworkAttribution = 0;

      v19 = 0;
    }
    objc_storeStrong((id *)&v6->_sourceApplicationSecondaryIdentifier, v19);
    if (v4)
    {
      objc_storeStrong((id *)&v6->_privacyProxyFailClosedOverride, *((id *)v4 + 12));
      int64_t v23 = *((void *)v4 + 7);
    }
    else
    {
      privacyProxyFailClosedOverride = v6->_privacyProxyFailClosedOverride;
      v6->_privacyProxyFailClosedOverride = 0;

      int64_t v23 = 0;
    }
    v6->_databaseScope = v23;
    uint64_t v24 = objc_msgSend_eventName(v4, v20, v21, v22);
    eventName = v6->_eventName;
    v6->_eventName = (NSString *)v24;

    uint64_t v29 = objc_msgSend_startTime(v4, v26, v27, v28);
    startTime = v6->_startTime;
    v6->_startTime = (NSDate *)v29;

    uint64_t v34 = objc_msgSend_endTime(v4, v31, v32, v33);
    endTime = v6->_endTime;
    v6->_endTime = (NSDate *)v34;

    v39 = objc_msgSend_attributes(v4, v36, v37, v38);
    uint64_t v43 = objc_msgSend_copy(v39, v40, v41, v42);
    attributes = v6->_attributes;
    v6->_attributes = (NSDictionary *)v43;

    if (v4)
    {
      id v48 = *((id *)v4 + 14);
      uint64_t v52 = objc_msgSend_copy(v48, v49, v50, v51);
      associatedOperations = v6->_associatedOperations;
      v6->_associatedOperations = (NSDictionary *)v52;

      v54 = (void *)*((void *)v4 + 15);
    }
    else
    {
      uint64_t v65 = objc_msgSend_copy(0, v45, v46, v47);
      v66 = v6->_associatedOperations;
      v6->_associatedOperations = (NSDictionary *)v65;

      v54 = 0;
    }
    id v55 = v54;
    uint64_t v59 = objc_msgSend_copy(v55, v56, v57, v58);
    associatedOperationGroups = v6->_associatedOperationGroups;
    v6->_associatedOperationGroups = (NSDictionary *)v59;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v100 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_metricUUID(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v100, v9, (uint64_t)v8, @"uuid");

  uint64_t isCKInternalMetric = objc_msgSend_isCKInternalMetric(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v100, v14, isCKInternalMetric, @"ckinternal");
  uint64_t isPushTriggerFired = objc_msgSend_isPushTriggerFired(self, v15, v16, v17);
  objc_msgSend_encodeBool_forKey_(v100, v19, isPushTriggerFired, @"pushFired");
  uint64_t v23 = objc_msgSend_allowsCellularAccess(self, v20, v21, v22);
  objc_msgSend_encodeBool_forKey_(v100, v24, v23, @"allowsCellular");
  uint64_t v28 = objc_msgSend_allowsExpensiveNetworkAccess(self, v25, v26, v27);
  objc_msgSend_encodeBool_forKey_(v100, v29, v28, @"allowsExpensive");
  uint64_t v33 = objc_msgSend_preferAnonymousRequests(self, v30, v31, v32);
  objc_msgSend_encodeBool_forKey_(v100, v34, v33, @"preferAnonymousRequests");
  uint64_t v38 = objc_msgSend_databaseScope(self, v35, v36, v37);
  objc_msgSend_encodeInteger_forKey_(v100, v39, v38, @"databaseScope");
  uint64_t v43 = objc_msgSend_deviceIdentifier(self, v40, v41, v42);
  objc_msgSend_encodeObject_forKey_(v100, v44, (uint64_t)v43, @"deviceIdentifier");

  id v48 = objc_msgSend_sourceApplicationBundleIdentifier(self, v45, v46, v47);
  objc_msgSend_encodeObject_forKey_(v100, v49, (uint64_t)v48, @"sourceApplicationBundleIdentifier");

  v53 = objc_msgSend_applicationBundleIdentifierOverrideForContainerAccess(self, v50, v51, v52);
  objc_msgSend_encodeObject_forKey_(v100, v54, (uint64_t)v53, @"applicationBundleIdentifierOverrideForContainerAccess");

  uint64_t v58 = objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(self, v55, v56, v57);
  objc_msgSend_encodeObject_forKey_(v100, v59, (uint64_t)v58, @"applicationBundleIdentifierOverrideForNetworkAttribution");

  v63 = objc_msgSend_sourceApplicationSecondaryIdentifier(self, v60, v61, v62);
  objc_msgSend_encodeObject_forKey_(v100, v64, (uint64_t)v63, @"sourceApplicationSecondaryIdentifier");

  v68 = objc_msgSend_privacyProxyFailClosedOverride(self, v65, v66, v67);
  objc_msgSend_encodeObject_forKey_(v100, v69, (uint64_t)v68, @"privacyProxyFailClosedOverride");

  v73 = objc_msgSend_eventName(self, v70, v71, v72);
  objc_msgSend_encodeObject_forKey_(v100, v74, (uint64_t)v73, @"eventName");

  v78 = objc_msgSend_startTime(self, v75, v76, v77);
  objc_msgSend_encodeObject_forKey_(v100, v79, (uint64_t)v78, @"startTime");

  v83 = objc_msgSend_endTime(self, v80, v81, v82);
  objc_msgSend_encodeObject_forKey_(v100, v84, (uint64_t)v83, @"endTime");

  v88 = objc_msgSend_attributes(self, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v100, v89, (uint64_t)v88, @"attributes");

  v93 = objc_msgSend_associatedOperations(self, v90, v91, v92);
  objc_msgSend_encodeObject_forKey_(v100, v94, (uint64_t)v93, @"operations");

  v98 = objc_msgSend_associatedOperationGroups(self, v95, v96, v97);
  objc_msgSend_encodeObject_forKey_(v100, v99, (uint64_t)v98, @"operationGroups");
}

- (CKEventMetricInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v91.receiver = self;
  v91.super_class = (Class)CKEventMetricInfo;
  v5 = [(CKEventMetricInfo *)&v91 init];
  if (v5)
  {
    context = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"uuid");
    metricUUID = v5->_metricUUID;
    v5->_metricUUID = (NSUUID *)v8;

    v5->_uint64_t isCKInternalMetric = objc_msgSend_decodeBoolForKey_(v4, v10, @"ckinternal", v11);
    v5->_uint64_t isPushTriggerFired = objc_msgSend_decodeBoolForKey_(v4, v12, @"pushFired", v13);
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v14, @"allowsCellular", v15);
    v5->_allowsExpensiveNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v16, @"allowsExpensive", v17);
    v5->_preferAnonymousRequests = objc_msgSend_decodeBoolForKey_(v4, v18, @"preferAnonymousRequests", v19);
    v5->_databaseScope = objc_msgSend_decodeIntegerForKey_(v4, v20, @"databaseScope", v21);
    uint64_t v22 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v22, @"deviceIdentifier");
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v24;

    uint64_t v26 = objc_opt_class();
    uint64_t v28 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v27, v26, @"sourceApplicationBundleIdentifier");
    sourceApplicationBundleIdentifier = v5->_sourceApplicationBundleIdentifier;
    v5->_sourceApplicationBundleIdentifier = (NSString *)v28;

    uint64_t v30 = objc_opt_class();
    uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, @"applicationBundleIdentifierOverrideForContainerAccess");
    applicationBundleIdentifierOverrideForContainerAccess = v5->_applicationBundleIdentifierOverrideForContainerAccess;
    v5->_applicationBundleIdentifierOverrideForContainerAccess = (NSString *)v32;

    uint64_t v34 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v35, v34, @"applicationBundleIdentifierOverrideForNetworkAttribution");
    applicationBundleIdentifierOverrideForNetworkAttribution = v5->_applicationBundleIdentifierOverrideForNetworkAttribution;
    v5->_applicationBundleIdentifierOverrideForNetworkAttribution = (NSString *)v36;

    uint64_t v38 = objc_opt_class();
    uint64_t v40 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v39, v38, @"sourceApplicationSecondaryIdentifier");
    sourceApplicationSecondaryIdentifier = v5->_sourceApplicationSecondaryIdentifier;
    v5->_sourceApplicationSecondaryIdentifier = (NSString *)v40;

    uint64_t v42 = objc_opt_class();
    uint64_t v44 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v43, v42, @"privacyProxyFailClosedOverride");
    privacyProxyFailClosedOverride = v5->_privacyProxyFailClosedOverride;
    v5->_privacyProxyFailClosedOverride = (NSNumber *)v44;

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
    uint64_t v65 = objc_msgSend_setWithObjects_(v58, v63, v59, v64, v60, v61, v62, 0);
    uint64_t v67 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v66, (uint64_t)v65, @"attributes");
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v67;

    v69 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v70 = objc_opt_class();
    uint64_t v71 = objc_opt_class();
    uint64_t v72 = objc_opt_class();
    v75 = objc_msgSend_setWithObjects_(v69, v73, v70, v74, v71, v72, 0);
    uint64_t v77 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v76, (uint64_t)v75, @"operations");
    associatedOperations = v5->_associatedOperations;
    v5->_associatedOperations = (NSDictionary *)v77;

    v79 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v80 = objc_opt_class();
    uint64_t v81 = objc_opt_class();
    uint64_t v82 = objc_opt_class();
    v85 = objc_msgSend_setWithObjects_(v79, v83, v80, v84, v81, v82, 0);
    uint64_t v87 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v86, (uint64_t)v85, @"operationGroups");
    associatedOperationGroups = v5->_associatedOperationGroups;
    v5->_associatedOperationGroups = (NSDictionary *)v87;
  }

  return v5;
}

- (NSUUID)metricUUID
{
  return self->_metricUUID;
}

- (BOOL)isCKInternalMetric
{
  return self->_isCKInternalMetric;
}

- (BOOL)isPushTriggerFired
{
  return self->_isPushTriggerFired;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)preferAnonymousRequests
{
  return self->_preferAnonymousRequests;
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (NSString)sourceApplicationSecondaryIdentifier
{
  return self->_sourceApplicationSecondaryIdentifier;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

- (NSString)applicationBundleIdentifierOverrideForContainerAccess
{
  return self->_applicationBundleIdentifierOverrideForContainerAccess;
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return self->_applicationBundleIdentifierOverrideForNetworkAttribution;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSDictionary)associatedOperations
{
  return self->_associatedOperations;
}

- (NSDictionary)associatedOperationGroups
{
  return self->_associatedOperationGroups;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedOperationGroups, 0);
  objc_storeStrong((id *)&self->_associatedOperations, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForNetworkAttribution, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverrideForContainerAccess, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->_sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_metricUUID, 0);
}

@end