@interface CKThrottle
+ (BOOL)supportsSecureCoding;
- (BOOL)appliesToCriteria:(id)a3;
- (BOOL)canTestInClientProcess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpired;
- (BOOL)isServerJSONThrottle;
- (BOOL)isServerProtobufThrottle;
- (BOOL)isServerThrottle;
- (CKThrottle)init;
- (CKThrottle)initWithCoder:(id)a3;
- (NSDate)expirationDate;
- (NSDate)throttleStartDate;
- (NSNumber)allowedRequestCount;
- (NSNumber)currentRequestWindowIndex;
- (NSNumber)databaseScope;
- (NSNumber)errorCode;
- (NSNumber)intervalLengthSeconds;
- (NSNumber)operationType;
- (NSNumber)repeatEverySeconds;
- (NSNumber)sentRequestCount;
- (NSNumber)throttleID;
- (NSString)bundleID;
- (NSString)containerIdentifier;
- (NSString)description;
- (NSString)functionName;
- (NSString)label;
- (NSString)operationGroupNamePrefix;
- (NSString)serviceName;
- (NSString)zoneName;
- (double)delayUntilNextOperationAllowed;
- (id)CKDeepCopy;
- (id)CKDeepCopyWithLeafNodeCopyBlock:(id)a3;
- (id)copy;
- (id)throttleBlockingUntilNextRequestWindow;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)incrementSentRequestCount;
- (void)setAllowedRequestCount:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setCurrentRequestWindowIndex:(id)a3;
- (void)setDatabaseScope:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFlag:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setFunctionName:(id)a3;
- (void)setIntervalLengthSeconds:(id)a3;
- (void)setLabel:(id)a3;
- (void)setOperationGroupNamePrefix:(id)a3;
- (void)setOperationType:(id)a3;
- (void)setRepeatEverySeconds:(id)a3;
- (void)setSentRequestCount:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setThrottleID:(id)a3;
- (void)setThrottleStartDate:(id)a3;
- (void)setZoneName:(id)a3;
@end

@implementation CKThrottle

- (CKThrottle)init
{
  v17.receiver = self;
  v17.super_class = (Class)CKThrottle;
  v5 = [(CKThrottle *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v2, v3, v4);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    uint64_t v11 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v8, v9, v10);
    throttleStartDate = v5->_throttleStartDate;
    v5->_throttleStartDate = (NSDate *)v11;

    sentRequestCount = v5->_sentRequestCount;
    v5->_sentRequestCount = (NSNumber *)&unk_1ED846930;

    currentRequestWindowIndex = v5->_currentRequestWindowIndex;
    v5->_currentRequestWindowIndex = (NSNumber *)&unk_1ED846930;

    errorCode = v5->_errorCode;
    v5->_errorCode = (NSNumber *)&unk_1ED846948;
  }
  return v5;
}

- (id)copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v7 = objc_msgSend_copy(self->_throttleID, v4, v5, v6);
  v8 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v7;

  uint64_t v12 = objc_msgSend_copy(self->_label, v9, v10, v11);
  v13 = (void *)*((void *)v3 + 4);
  *((void *)v3 + 4) = v12;

  uint64_t v17 = objc_msgSend_copy(self->_containerIdentifier, v14, v15, v16);
  v18 = (void *)*((void *)v3 + 5);
  *((void *)v3 + 5) = v17;

  uint64_t v22 = objc_msgSend_copy(self->_databaseScope, v19, v20, v21);
  v23 = (void *)*((void *)v3 + 6);
  *((void *)v3 + 6) = v22;

  uint64_t v27 = objc_msgSend_copy(self->_zoneName, v24, v25, v26);
  v28 = (void *)*((void *)v3 + 7);
  *((void *)v3 + 7) = v27;

  objc_storeStrong((id *)v3 + 8, self->_operationType);
  uint64_t v32 = objc_msgSend_copy(self->_serviceName, v29, v30, v31);
  v33 = (void *)*((void *)v3 + 9);
  *((void *)v3 + 9) = v32;

  uint64_t v37 = objc_msgSend_copy(self->_functionName, v34, v35, v36);
  v38 = (void *)*((void *)v3 + 10);
  *((void *)v3 + 10) = v37;

  uint64_t v42 = objc_msgSend_copy(self->_bundleID, v39, v40, v41);
  v43 = (void *)*((void *)v3 + 11);
  *((void *)v3 + 11) = v42;

  uint64_t v47 = objc_msgSend_copy(self->_operationGroupNamePrefix, v44, v45, v46);
  v48 = (void *)*((void *)v3 + 12);
  *((void *)v3 + 12) = v47;

  uint64_t v52 = objc_msgSend_copy(self->_intervalLengthSeconds, v49, v50, v51);
  v53 = (void *)*((void *)v3 + 14);
  *((void *)v3 + 14) = v52;

  uint64_t v57 = objc_msgSend_copy(self->_repeatEverySeconds, v54, v55, v56);
  v58 = (void *)*((void *)v3 + 15);
  *((void *)v3 + 15) = v57;

  uint64_t v62 = objc_msgSend_copy(self->_allowedRequestCount, v59, v60, v61);
  v63 = (void *)*((void *)v3 + 16);
  *((void *)v3 + 16) = v62;

  uint64_t v67 = objc_msgSend_copy(self->_throttleStartDate, v64, v65, v66);
  v68 = (void *)*((void *)v3 + 13);
  *((void *)v3 + 13) = v67;

  uint64_t v72 = objc_msgSend_copy(self->_expirationDate, v69, v70, v71);
  v73 = (void *)*((void *)v3 + 17);
  *((void *)v3 + 17) = v72;

  uint64_t v77 = objc_msgSend_copy(self->_errorCode, v74, v75, v76);
  v78 = (void *)*((void *)v3 + 18);
  *((void *)v3 + 18) = v77;

  *((void *)v3 + 19) = self->_flags;
  uint64_t v82 = objc_msgSend_sentRequestCount(self, v79, v80, v81);
  v83 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v82;

  uint64_t v87 = objc_msgSend_currentRequestWindowIndex(self, v84, v85, v86);
  v88 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v87;

  return v3;
}

- (id)CKDeepCopy
{
  uint64_t v4 = objc_msgSend_copy(self, a2, v2, v3);

  return v4;
}

- (id)CKDeepCopyWithLeafNodeCopyBlock:(id)a3
{
  id result = a3;
  __break(1u);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  objc_msgSend_encodeEntry_withCoder_(CKThrottleTable, v5, (uint64_t)v4, (uint64_t)v6);
  objc_sync_exit(v4);
}

- (CKThrottle)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKThrottle;
  id v6 = [(CKThrottle *)&v8 init];
  if (v6) {
    objc_msgSend_decodeEntry_withCoder_(CKThrottleTable, v5, (uint64_t)v6, (uint64_t)v4);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKThrottle *)a3;
  if (v4 == self)
  {
    char HaveEqualProperties_other_includePrimaryKeys = 1;
  }
  else
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    char HaveEqualProperties_other_includePrimaryKeys = objc_msgSend_entriesHaveEqualProperties_other_includePrimaryKeys_(CKThrottleTable, v6, (uint64_t)v5, (uint64_t)v4, 0);
    objc_sync_exit(v5);
  }
  return HaveEqualProperties_other_includePrimaryKeys;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_throttleID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = objc_msgSend_hash(self->_label, v10, v11, v12) ^ v9;

  return v13;
}

- (NSString)description
{
  return (NSString *)objc_msgSend_descriptionOfEntry_(CKThrottleTable, a2, (uint64_t)self, v2);
}

- (void)setFlag:(unint64_t)a3
{
  self->_flags |= a3;
}

- (BOOL)isServerThrottle
{
  return (self->_flags & 3) != 0;
}

- (BOOL)isServerJSONThrottle
{
  return self->_flags & 1;
}

- (BOOL)isServerProtobufThrottle
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (id)throttleBlockingUntilNextRequestWindow
{
  uint64_t v5 = objc_msgSend_copy(self, a2, v2, v3);
  objc_msgSend_setAllowedRequestCount_(v5, v6, 0, v7);
  throttleStartDate = self->_throttleStartDate;
  objc_msgSend_delayUntilNextOperationAllowed(self, v9, v10, v11);
  uint64_t v15 = objc_msgSend_dateByAddingTimeInterval_(throttleStartDate, v12, v13, v14);
  objc_msgSend_setExpirationDate_(v5, v16, (uint64_t)v15, v17);

  return v5;
}

- (BOOL)canTestInClientProcess
{
  return self->_operationType == 0;
}

- (BOOL)isExpired
{
  expirationDate = self->_expirationDate;
  if (!expirationDate) {
    return 1;
  }
  objc_msgSend_timeIntervalSinceNow(expirationDate, a2, v2, v3);
  return v5 < 0.0;
}

- (BOOL)appliesToCriteria:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_timeIntervalSinceNow(self->_throttleStartDate, v5, v6, v7);
  if (v11 > 0.0) {
    goto LABEL_6;
  }
  if (!self->_containerIdentifier)
  {
    int isEqualToString = 1;
    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = objc_msgSend_containerID(v4, v8, v9, v10);
    uint64_t v16 = v12;
    if (v12)
    {
      uint64_t v17 = objc_msgSend_containerIdentifier(v12, v13, v14, v15);
      int isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)self->_containerIdentifier, v19);
    }
    else
    {
      int isEqualToString = 1;
    }
  }
  else
  {
LABEL_6:
    int isEqualToString = 0;
  }
LABEL_10:
  uint64_t v21 = objc_msgSend_integerValue(self->_databaseScope, v8, v9, v10);
  if (isEqualToString && (uint64_t v22 = v21) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v26 = objc_msgSend_databaseScope(v4, v23, v24, v25);
    if (v26)
    {
      if (v22 != v26) {
        goto LABEL_48;
      }
    }
  }
  else if (!isEqualToString)
  {
    goto LABEL_48;
  }
  if (self->_zoneName)
  {
    if (objc_opt_respondsToSelector())
    {
      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v30 = objc_msgSend_relevantZoneIDs(v4, v27, v28, v29, 0);
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v32)
      {
        uint64_t v36 = v32;
        uint64_t v37 = *(void *)v82;
LABEL_21:
        uint64_t v38 = 0;
        while (1)
        {
          if (*(void *)v82 != v37) {
            objc_enumerationMutation(v30);
          }
          v39 = objc_msgSend_zoneName(*(void **)(*((void *)&v81 + 1) + 8 * v38), v33, v34, v35);
          char v42 = objc_msgSend_isEqualToString_(v39, v40, (uint64_t)self->_zoneName, v41);

          if (v42) {
            break;
          }
          if (v36 == ++v38)
          {
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v81, (uint64_t)v85, 16);
            if (v36) {
              goto LABEL_21;
            }
            char hasPrefix = 0;
            goto LABEL_52;
          }
        }
      }

      goto LABEL_29;
    }
LABEL_48:
    char hasPrefix = 0;
    goto LABEL_49;
  }
LABEL_29:
  if (self->_operationType)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v47 = objc_msgSend_intValue(self->_operationType, v44, v45, v46);
    if (!objc_msgSend_isOperationType_(v4, v48, v47, v49)) {
      goto LABEL_48;
    }
  }
  if (self->_serviceName)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v53 = objc_msgSend_serviceName(v4, v50, v51, v52);
    if (v53)
    {
      uint64_t v56 = (void *)v53;
      int v57 = objc_msgSend_isEqualToString_(self->_serviceName, v54, v53, v55);

      if (!v57) {
        goto LABEL_48;
      }
    }
  }
  if (self->_functionName)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v61 = objc_msgSend_functionName(v4, v58, v59, v60);
    if (v61)
    {
      v64 = (void *)v61;
      int v65 = objc_msgSend_isEqualToString_(self->_functionName, v62, v61, v63);

      if (!v65) {
        goto LABEL_48;
      }
    }
  }
  if (self->_bundleID)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_48;
    }
    uint64_t v69 = objc_msgSend_applicationBundleIdentifierForContainerAccess(v4, v66, v67, v68);
    if (v69)
    {
      uint64_t v72 = (void *)v69;
      int v73 = objc_msgSend_isEqualToString_(self->_bundleID, v70, v69, v71);

      if (!v73) {
        goto LABEL_48;
      }
    }
  }
  if (!self->_operationGroupNamePrefix)
  {
    char hasPrefix = 1;
    goto LABEL_49;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_48;
  }
  uint64_t v77 = objc_msgSend_operationGroupName(v4, v74, v75, v76);
  uint64_t v30 = v77;
  if (v77) {
    char hasPrefix = objc_msgSend_hasPrefix_(v77, v78, (uint64_t)self->_operationGroupNamePrefix, v79);
  }
  else {
    char hasPrefix = 1;
  }
LABEL_52:

LABEL_49:
  return hasPrefix;
}

- (double)delayUntilNextOperationAllowed
{
  objc_msgSend_timeIntervalSinceNow(self->_expirationDate, a2, v2, v3);
  double v6 = v5;
  int v10 = objc_msgSend_unsignedIntValue(self->_allowedRequestCount, v7, v8, v9);
  unsigned int v14 = objc_msgSend_unsignedIntValue(self->_repeatEverySeconds, v11, v12, v13);
  unsigned int v18 = objc_msgSend_unsignedIntValue(self->_intervalLengthSeconds, v15, v16, v17);
  if (v10) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = v14 > v18;
  }
  if (v19)
  {
    unsigned int v20 = v18;
    uint64_t v21 = self;
    objc_sync_enter(v21);
    unsigned int v25 = objc_msgSend_unsignedIntValue(v21->_sentRequestCount, v22, v23, v24);
    double v32 = 0.0;
    if (v25 >= objc_msgSend_unsignedIntValue(self->_allowedRequestCount, v26, v27, v28))
    {
      v33 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v29, v30, v31);
      uint64_t v36 = v33;
      if (v14 <= v20) {
        unsigned int v14 = v20;
      }
      objc_msgSend_timeIntervalSinceDate_(v33, v34, (uint64_t)v21->_throttleStartDate, v35);
      double v38 = v37;
      int v42 = objc_msgSend_unsignedIntValue(v21->_currentRequestWindowIndex, v39, v40, v41);
      double v46 = (double)v14;
      float v47 = v38 / (double)v14;
      uint64_t v48 = vcvtms_u32_f32(v47);
      if (v48 != v42)
      {
        sentRequestCount = v21->_sentRequestCount;
        v21->_sentRequestCount = (NSNumber *)&unk_1ED846930;

        uint64_t v52 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v50, v48, v51);
        currentRequestWindowIndex = v21->_currentRequestWindowIndex;
        v21->_currentRequestWindowIndex = (NSNumber *)v52;

        if (v10) {
          double v6 = 0.0;
        }
      }
      float v54 = (double)v20
          + v46 * (double)objc_msgSend_unsignedIntValue(v21->_currentRequestWindowIndex, v43, v44, v45);
      double v55 = v54 - v38;
      if (v55 < 0.0) {
        double v55 = 0.0;
      }
      if (v55 >= v6) {
        double v32 = v6;
      }
      else {
        double v32 = v55;
      }
    }
    objc_sync_exit(v21);

    return v32;
  }
  return v6;
}

- (NSNumber)sentRequestCount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_sentRequestCount;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSentRequestCount:(id)a3
{
  id v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  sentRequestCount = obj->_sentRequestCount;
  obj->_sentRequestCount = v4;

  objc_sync_exit(obj);
}

- (void)incrementSentRequestCount
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v2 = NSNumber;
  int v6 = objc_msgSend_intValue(obj->_sentRequestCount, v3, v4, v5);
  uint64_t v9 = objc_msgSend_numberWithInt_(v2, v7, (v6 + 1), v8);
  sentRequestCount = obj->_sentRequestCount;
  obj->_sentRequestCount = (NSNumber *)v9;

  objc_sync_exit(obj);
}

- (NSNumber)currentRequestWindowIndex
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_currentRequestWindowIndex;
  objc_sync_exit(v2);

  return v3;
}

- (void)setCurrentRequestWindowIndex:(id)a3
{
  uint64_t v4 = (NSNumber *)a3;
  obj = self;
  objc_sync_enter(obj);
  currentRequestWindowIndex = obj->_currentRequestWindowIndex;
  obj->_currentRequestWindowIndex = v4;

  objc_sync_exit(obj);
}

- (NSNumber)throttleID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThrottleID:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSNumber)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (NSNumber)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (NSString)functionName
{
  return self->_functionName;
}

- (void)setFunctionName:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)operationGroupNamePrefix
{
  return self->_operationGroupNamePrefix;
}

- (void)setOperationGroupNamePrefix:(id)a3
{
}

- (NSDate)throttleStartDate
{
  return self->_throttleStartDate;
}

- (void)setThrottleStartDate:(id)a3
{
}

- (NSNumber)intervalLengthSeconds
{
  return self->_intervalLengthSeconds;
}

- (void)setIntervalLengthSeconds:(id)a3
{
}

- (NSNumber)repeatEverySeconds
{
  return self->_repeatEverySeconds;
}

- (void)setRepeatEverySeconds:(id)a3
{
}

- (NSNumber)allowedRequestCount
{
  return self->_allowedRequestCount;
}

- (void)setAllowedRequestCount:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSNumber)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_allowedRequestCount, 0);
  objc_storeStrong((id *)&self->_repeatEverySeconds, 0);
  objc_storeStrong((id *)&self->_intervalLengthSeconds, 0);
  objc_storeStrong((id *)&self->_throttleStartDate, 0);
  objc_storeStrong((id *)&self->_operationGroupNamePrefix, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_databaseScope, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_throttleID, 0);
  objc_storeStrong((id *)&self->_currentRequestWindowIndex, 0);

  objc_storeStrong((id *)&self->_sentRequestCount, 0);
}

@end