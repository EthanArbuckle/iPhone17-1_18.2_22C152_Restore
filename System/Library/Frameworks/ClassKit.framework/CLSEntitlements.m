@interface CLSEntitlements
+ (BOOL)isDashboardAppProcess;
+ (BOOL)isInternalProcess;
+ (BOOL)isPrivateSearchEnabledProcess;
+ (BOOL)isSearchEnabledProcess;
+ (id)allowedEntitlements;
+ (id)entitlementsForCurrentTaskWithError:(id *)a3;
+ (id)entitlementsForNonAppCurrentTaskWithError:(id *)a3;
+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4;
+ (id)entitlementsWithSecTask:(__SecTask *)a3 overrides:(id)a4 error:(id *)a5;
- (BOOL)BOOLValueForEntitlement:(id)a3 error:(id *)a4;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)isDashboardAPIEnabled;
- (BOOL)isInDevelopmentEnvironment;
- (BOOL)isInternal;
- (BOOL)isPrivateSearchAPIEnabled;
- (BOOL)isPublicClassKitAPIEnabled;
- (BOOL)isRegisterDashboardEnabled;
- (BOOL)isSearchAPIEnabled;
- (CLSEntitlements)init;
- (CLSEntitlements)initWithEntitlements:(id)a3;
- (NSDictionary)entitlements;
- (NSString)applicationBundleIdentifier;
- (NSString)classKitEnvironment;
- (id)stringValueForEntitlement:(id)a3 error:(id *)a4;
@end

@implementation CLSEntitlements

+ (id)entitlementsForCurrentTaskWithError:(id *)a3
{
  v5 = objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E4F223F8], a2, (uint64_t)a3);
  char v6 = CLSExecutableLinkedOnOrAfter_iOS17_5_macOS_14_5();
  if (v5 && (v6 & 1) != 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    v10 = objc_msgSend_entitlements(v5, v8, v9);
    v13 = objc_msgSend_allowedEntitlements(a1, v11, v12);
    v15 = objc_msgSend_dictionaryOfObjectsForKeys_(v10, v14, (uint64_t)v13);

    id v16 = objc_alloc((Class)a1);
    v18 = objc_msgSend_initWithEntitlements_(v16, v17, (uint64_t)v15);
  }
  else
  {
    v18 = objc_msgSend_entitlementsForNonAppCurrentTaskWithError_(a1, v7, (uint64_t)a3);
  }

  return v18;
}

+ (id)entitlementsForNonAppCurrentTaskWithError:(id *)a3
{
  SecTaskRef v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    SecTaskRef v7 = v5;
    v8 = (void *)MEMORY[0x1E01A0360]();
    v11 = objc_msgSend_cls_appExtensionContainerBundleRecordForCurrentTask(MEMORY[0x1E4F223F8], v9, v10);
    v14 = objc_msgSend_entitlements(v11, v12, v13);

    v17 = objc_msgSend_allowedEntitlements(a1, v15, v16);
    v19 = objc_msgSend_dictionaryOfObjectsForKeys_(v14, v18, (uint64_t)v17);

    v21 = objc_msgSend_entitlementsWithSecTask_overrides_error_(a1, v20, (uint64_t)v7, v19, a3);
    CFRelease(v7);
  }
  else
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E4F28C58], v6, (uint64_t)a3, 100, @"Unable to retrieve current task for entitlement lookup.");
    v21 = 0;
  }

  return v21;
}

+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v9 = v6;
  if (v6) {
    objc_msgSend_auditToken(v6, v7, v8);
  }
  else {
    memset(&v29, 0, sizeof(v29));
  }
  SecTaskRef v10 = SecTaskCreateWithAuditToken(0, &v29);
  if (v10)
  {
    SecTaskRef v14 = v10;
    v15 = (void *)MEMORY[0x1E01A0360](v10, v11, v12, v13);
    v17 = objc_msgSend_cls_appExtensionContainerBundleRecordForConnection_(MEMORY[0x1E4F223F8], v16, (uint64_t)v9);
    v20 = objc_msgSend_entitlements(v17, v18, v19);

    v23 = objc_msgSend_allowedEntitlements(a1, v21, v22);
    v25 = objc_msgSend_dictionaryOfObjectsForKeys_(v20, v24, (uint64_t)v23);

    v27 = objc_msgSend_entitlementsWithSecTask_overrides_error_(a1, v26, (uint64_t)v14, v25, a4);
    CFRelease(v14);
  }
  else
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E4F28C58], v11, (uint64_t)a4, 100, @"Unable to retrieve connection task for entitlement lookup.");
    v27 = 0;
  }

  return v27;
}

+ (id)entitlementsWithSecTask:(__SecTask *)a3 overrides:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  CFErrorRef error = 0;
  v11 = objc_msgSend_allowedEntitlements(a1, v9, v10);
  objc_msgSend_allObjects(v11, v12, v13);
  CFArrayRef v14 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  CFDictionaryRef v15 = SecTaskCopyValuesForEntitlements(a3, v14, &error);
  v18 = objc_msgSend_mutableCopy(v15, v16, v17);

  CFErrorRef v20 = error;
  if (v18)
  {
    CFErrorRef v35 = error;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    CFArrayRef v21 = v14;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v36, v41, 16);
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v21);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v30 = objc_msgSend_objectForKeyedSubscript_(v8, v24, v28);
          if (v30) {
            objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v30, v28);
          }
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v36, v41, 16);
      }
      while (v25);
    }

    id v31 = objc_alloc((Class)a1);
    v33 = objc_msgSend_initWithEntitlements_(v31, v32, (uint64_t)v18);
    CFErrorRef v20 = v35;
  }
  else
  {
    objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E4F28C58], v19, (uint64_t)a5, error);
    v33 = 0;
  }

  return v33;
}

+ (id)allowedEntitlements
{
  v7[8] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v7[0] = @"com.apple.private.ClassKit.register-dashboard";
  v7[1] = @"com.apple.private.ClassKit.dashboard";
  v7[2] = @"com.apple.private.ClassKit.search";
  v7[3] = @"com.apple.private.contacts";
  v7[4] = @"com.apple.private.contactsui";
  v7[5] = @"application-identifier";
  v7[6] = @"com.apple.private.ClassKit.internal";
  v7[7] = @"com.apple.developer.ClassKit-environment";
  v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], a2, (uint64_t)v7, 8);
  SecTaskRef v5 = objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);

  return v5;
}

+ (BOOL)isDashboardAppProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC648898;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4A20 != -1) {
    dispatch_once(&qword_1EB5D4A20, block);
  }
  return byte_1EB5D4A18;
}

+ (BOOL)isInternalProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC648A70;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4A28 != -1) {
    dispatch_once(&qword_1EB5D4A28, block);
  }
  return byte_1EB5D4A19;
}

+ (BOOL)isSearchEnabledProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC648C4C;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4A30 != -1) {
    dispatch_once(&qword_1EB5D4A30, block);
  }
  return byte_1EB5D4A1A;
}

+ (BOOL)isPrivateSearchEnabledProcess
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC648E7C;
  block[3] = &unk_1E6C95AC0;
  block[4] = a1;
  if (qword_1EB5D4A38 != -1) {
    dispatch_once(&qword_1EB5D4A38, block);
  }
  return byte_1EB5D4A1B;
}

- (CLSEntitlements)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  SecTaskRef v5 = NSString;
  uint64_t v6 = objc_opt_class();
  SecTaskRef v7 = NSStringFromSelector(a2);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v8, @"The method -[%@ %@] is not available.", v6, v7);
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSEntitlements)initWithEntitlements:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEntitlements;
  SecTaskRef v5 = [(CLSEntitlements *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    SecTaskRef v7 = objc_opt_class();
    uint64_t v10 = objc_msgSend_allowedEntitlements(v7, v8, v9);
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v28, 16);
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v4, v13, v17);
          if (v19) {
            objc_msgSend_setObject_forKeyedSubscript_(v6, v18, (uint64_t)v19, v17);
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v23, v28, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&v5->_entitlements, v6);
    CFArrayRef v21 = objc_msgSend_objectForKeyedSubscript_(v4, v20, @"application-identifier");
    if (v21) {
      CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
    }
  }
  return v5;
}

- (NSString)classKitEnvironment
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v13 = 0;
  v2 = objc_msgSend_stringValueForEntitlement_error_(self, a2, @"com.apple.developer.ClassKit-environment", &v13);
  id v4 = v13;
  if (v4)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    SecTaskRef v5 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = @"com.apple.developer.ClassKit-environment";
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl(&dword_1DC60F000, v5, OS_LOG_TYPE_INFO, "Failed to read %@ entitelment: %{public}@", buf, 0x16u);
    }
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v14[0] = @"development";
  v14[1] = @"production";
  SecTaskRef v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v3, (uint64_t)v14, 2);
  uint64_t v9 = objc_msgSend_setWithArray_(v6, v8, (uint64_t)v7);

  if (v2 && objc_msgSend_containsObject_(v9, v10, (uint64_t)v2)) {
    id v11 = v2;
  }
  else {
    id v11 = 0;
  }

  return (NSString *)v11;
}

- (BOOL)isPublicClassKitAPIEnabled
{
  v3 = objc_msgSend_classKitEnvironment(self, a2, v2);
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isInternal
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, @"com.apple.private.ClassKit.internal", &v6);
  id v3 = v6;
  if (v3)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    BOOL v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = @"com.apple.private.ClassKit.internal";
      _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isDashboardAPIEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, @"com.apple.private.ClassKit.dashboard", &v6);
  id v3 = v6;
  if (v3)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    BOOL v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = @"com.apple.private.ClassKit.dashboard";
      _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isRegisterDashboardEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, @"com.apple.private.ClassKit.register-dashboard", &v6);
  id v3 = v6;
  if (v3)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    BOOL v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = @"com.apple.private.ClassKit.register-dashboard";
      _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isSearchAPIEnabled
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isPrivateSearchAPIEnabled(self, a2, v2)) {
    return 1;
  }
  id v14 = 0;
  char v6 = objc_msgSend_BOOLValueForEntitlement_error_(self, v4, @"com.apple.private.contacts", &v14);
  id v7 = v14;
  uint64_t v9 = v7;
  if (v6)
  {
    char v5 = 1;
    if (!v7) {
      return v5;
    }
  }
  else
  {
    id v13 = v7;
    char v5 = objc_msgSend_BOOLValueForEntitlement_error_(self, v8, @"com.apple.private.contactsui", &v13);
    id v10 = v13;

    uint64_t v9 = v10;
    if (!v10) {
      return v5;
    }
  }
  if (qword_1EB5D4D10 != -1) {
    dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
  }
  id v11 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = @"searchAPI";
    _os_log_impl(&dword_1DC60F000, v11, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
  }

  return v5;
}

- (BOOL)isPrivateSearchAPIEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = 0;
  char v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, @"com.apple.private.ClassKit.search", &v6);
  id v3 = v6;
  if (v3)
  {
    if (qword_1EB5D4D10 != -1) {
      dispatch_once(&qword_1EB5D4D10, &unk_1F37A1810);
    }
    BOOL v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = @"searchAPI";
      _os_log_impl(&dword_1DC60F000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    uint64_t v9 = objc_msgSend_entitlements(self, v7, v8);
    id v11 = objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4);
    BOOL v12 = v11 != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)isInDevelopmentEnvironment
{
  uint64_t v6 = objc_msgSend_classKitEnvironment(self, a2, v2);
  if (v6)
  {
    id v7 = objc_msgSend_classKitEnvironment(self, v4, v5);
    char isEqualToString = objc_msgSend_isEqualToString_(@"development", v8, (uint64_t)v7);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (BOOL)BOOLValueForEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_hasEntitlement_(self, v7, (uint64_t)v6))
  {
    id v10 = objc_msgSend_entitlements(self, v8, v9);
    BOOL v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v15 = objc_msgSend_BOOLValue(v12, v13, v14);
    }
    else
    {
      objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E4F28C58], v13, (uint64_t)a4, 4, @"Expected a BOOL value for entitlement: %@", v6);
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)stringValueForEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend_hasEntitlement_(self, v7, (uint64_t)v6))
  {
    id v10 = objc_msgSend_entitlements(self, v8, v9);
    BOOL v12 = objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
    }
    else
    {
      objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E4F28C58], v13, (uint64_t)a4, 4, @"Expected a string value for entitlement: %@", v6);
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);

  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end