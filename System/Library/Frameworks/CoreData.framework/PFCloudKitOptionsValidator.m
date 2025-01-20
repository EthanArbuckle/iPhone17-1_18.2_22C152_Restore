@interface PFCloudKitOptionsValidator
- (BOOL)validateOptions:(void *)a3 andStoreOptions:(uint64_t *)a4 error:;
- (void)dealloc;
@end

@implementation PFCloudKitOptionsValidator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitOptionsValidator;
  [(PFCloudKitOptionsValidator *)&v3 dealloc];
}

- (BOOL)validateOptions:(void *)a3 andStoreOptions:(uint64_t *)a4 error:
{
  v114[1] = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v7 = (void *)MEMORY[0x18C127630]();
  if ((unint64_t)__ckLoggingOverride >= 9) {
    uint64_t v8 = 9;
  }
  else {
    uint64_t v8 = __ckLoggingOverride;
  }
  uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Validating options: %@\nstoreOptions: %@"];
  v103 = a2;
  v104 = a3;
  _NSCoreDataLog(v8, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"-[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:]");
  v16 = (void *)[a2 containerIdentifier];
  if (!v16)
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F281F8];
    uint64_t v109 = *MEMORY[0x1E4F28588];
    v110 = @"A container identifier is required for the CloudKit integration.";
    v32 = (void *)MEMORY[0x1E4F1C9E8];
    v33 = (uint64_t *)&v110;
    v34 = &v109;
    goto LABEL_21;
  }
  v17 = v16;
  if (![v16 isNSString])
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F281F8];
    uint64_t v111 = *MEMORY[0x1E4F28588];
    v35 = NSString;
    v36 = (objc_class *)objc_opt_class();
    uint64_t v112 = [v35 stringWithFormat:@"NSCloudKitMirroringDelegateOptions.containerIdentifier only accepts values of type '%@'. The following is not a valid value:\n%@", NSStringFromClass(v36), v17, v103, v104];
    v32 = (void *)MEMORY[0x1E4F1C9E8];
    v33 = &v112;
    v34 = &v111;
    goto LABEL_21;
  }
  if (![v17 length])
  {
    v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F281F8];
    uint64_t v113 = *MEMORY[0x1E4F28588];
    v114[0] = @"NSCloudKitMirroringDelegateOptions.containerIdentifier requires a value with a length greather than 0";
    v32 = (void *)MEMORY[0x1E4F1C9E8];
    v33 = v114;
    v34 = &v113;
LABEL_21:
    uint64_t v37 = objc_msgSend(v30, "errorWithDomain:code:userInfo:", v31, 134060, objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v38, v39, v40, v41, v42, v43, v44, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 87;
    goto LABEL_38;
  }
  if (![a3 objectForKey:@"NSPersistentHistoryTrackingKey"])
  {
    v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v55 = *MEMORY[0x1E4F281F8];
    uint64_t v113 = *MEMORY[0x1E4F28588];
    v114[0] = [NSString stringWithFormat:@"%@ is required for the CloudKit integration.", @"NSPersistentHistoryTrackingKey", 36, v103, v104];
    uint64_t v37 = objc_msgSend(v54, "errorWithDomain:code:userInfo:", v55, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v56 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 105;
    goto LABEL_38;
  }
  uint64_t v18 = [a2 containerOptions];
  if (v18)
  {
    uint64_t v19 = v18;
    getCloudKitCKContainerOptionsClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v64 = *MEMORY[0x1E4F281F8];
      uint64_t v113 = *MEMORY[0x1E4F28588];
      v65 = NSString;
      getCloudKitCKContainerOptionsClass();
      v66 = (objc_class *)objc_opt_class();
      v114[0] = [v65 stringWithFormat:@"NSCloudKitMirroringDelegateOptions.containerOptions only accepts values of type '%@'. The following is not a valid value:\n%@", NSStringFromClass(v66), v19, v103, v104];
      uint64_t v37 = objc_msgSend(v63, "errorWithDomain:code:userInfo:", v64, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
      if (v37) {
        goto LABEL_23;
      }
      uint64_t v67 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v67, v68, v69, v70, v71, v72, v73, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
      v45 = __pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315394;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
      __int16 v107 = 1024;
      int v108 = 132;
      goto LABEL_38;
    }
  }
  v20 = (void *)[a2 ckAssetThresholdBytes];
  if (v20)
  {
    v21 = v20;
    if ([v20 isNSNumber])
    {
      if ([v21 integerValue] > 99) {
        goto LABEL_14;
      }
      v74 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F281F8];
      uint64_t v113 = *MEMORY[0x1E4F28588];
      v114[0] = [NSString stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be at least %@ bytes. The following value is invalid: %@", objc_msgSend(NSNumber, "numberWithInteger:", 100), v21, v103, v104];
      v78 = (void *)MEMORY[0x1E4F1C9E8];
      v79 = v114;
      v80 = &v113;
    }
    else
    {
      v74 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F281F8];
      uint64_t v111 = *MEMORY[0x1E4F28588];
      v76 = NSString;
      v77 = (objc_class *)objc_opt_class();
      uint64_t v112 = [v76 stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be an instance of '%@'. The following value is invalid: %@", NSStringFromClass(v77), v21, v103, v104];
      v78 = (void *)MEMORY[0x1E4F1C9E8];
      v79 = &v112;
      v80 = &v111;
    }
    uint64_t v37 = objc_msgSend(v74, "errorWithDomain:code:userInfo:", v75, 134060, objc_msgSend(v78, "dictionaryWithObjects:forKeys:count:", v79, v80, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v85 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v85, v86, v87, v88, v89, v90, v91, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 162;
    goto LABEL_38;
  }
LABEL_14:
  v22 = (void *)[a2 operationMemoryThresholdBytes];
  if (!v22) {
    return 1;
  }
  v23 = v22;
  if ([v22 isNSNumber])
  {
    uint64_t v24 = [&unk_1ED7E2B30 longLongValue];
    if ([v23 longLongValue] < v24)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = *MEMORY[0x1E4F281F8];
      uint64_t v111 = *MEMORY[0x1E4F28588];
      uint64_t v112 = [NSString stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes' must be at least %@ bytes. The following value is invalid: %@", &unk_1ED7E2B30, v23, v103, v104];
      uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v112 forKeys:&v111 count:1];
      v28 = v25;
      uint64_t v29 = v26;
      goto LABEL_47;
    }
    uint64_t v92 = [v23 longLongValue];
    if (v92 > objc_msgSend((id)objc_msgSend(a2, "ckAssetThresholdBytes"), "longLongValue")) {
      return 1;
    }
    uint64_t v93 = [NSString stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes', %@, must be larger than the value of 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes', %@.", v23, objc_msgSend(a2, "ckAssetThresholdBytes"), a2, v104];
    v94 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v95 = *MEMORY[0x1E4F281F8];
    uint64_t v113 = *MEMORY[0x1E4F28588];
    v114[0] = v93;
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:&v113 count:1];
    v28 = v94;
    uint64_t v29 = v95;
  }
  else
  {
    v81 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v82 = *MEMORY[0x1E4F281F8];
    uint64_t v109 = *MEMORY[0x1E4F28588];
    v83 = NSString;
    v84 = (objc_class *)objc_opt_class();
    v110 = (__CFString *)[v83 stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.operationMemoryThresholdBytes' must be an instance of '%@'. The following value is invalid: %@", NSStringFromClass(v84), v23, v103, v104];
    uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v110 forKeys:&v109 count:1];
    v28 = v81;
    uint64_t v29 = v82;
  }
LABEL_47:
  uint64_t v37 = [v28 errorWithDomain:v29 code:134060 userInfo:v27];
  if (v37) {
    goto LABEL_23;
  }
  uint64_t v96 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
  _NSCoreDataLog(17, v96, v97, v98, v99, v100, v101, v102, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
  v45 = __pflogFaultLog;
  if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
    goto LABEL_23;
  }
  *(_DWORD *)buf = 136315394;
  v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
  __int16 v107 = 1024;
  int v108 = 200;
LABEL_38:
  _os_log_fault_impl(&dword_18AB82000, v45, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_23:
  if (v37)
  {
    if (a4)
    {
      result = 0;
      *a4 = v37;
      return result;
    }
  }
  else
  {
    uint64_t v46 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v46, v47, v48, v49, v50, v51, v52, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v53 = __pflogFaultLog;
    result = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 56;
    _os_log_fault_impl(&dword_18AB82000, v53, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
  }
  return 0;
}

@end