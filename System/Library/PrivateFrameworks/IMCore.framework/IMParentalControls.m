@interface IMParentalControls
+ (id)objectForKey:(id)a3;
+ (id)standardControls;
- (BOOL)_disableAV;
- (BOOL)_forceChatLogging;
- (BOOL)accountHasAllowlist:(id)a3;
- (BOOL)accountIsEnabled:(id)a3;
- (BOOL)active;
- (BOOL)disableAV;
- (BOOL)disableAccount:(id)a3;
- (BOOL)disableService:(id)a3;
- (BOOL)forceAllowlistForAccount:(id)a3;
- (BOOL)forceAllowlistForService:(id)a3;
- (BOOL)forceChatLogging;
- (BOOL)okToConnectAccount:(id)a3;
- (BOOL)shouldPostNotifications;
- (IMParentalControls)init;
- (NSMutableDictionary)_parentalControls;
- (id)_serviceWithName:(id)a3;
- (id)allowlistForAccount:(id)a3;
- (id)allowlistForService:(id)a3;
- (void)_updateParentalSettings;
- (void)dealloc;
- (void)setShouldPostNotifications:(BOOL)a3;
@end

@implementation IMParentalControls

- (IMParentalControls)init
{
  v18.receiver = self;
  v18.super_class = (Class)IMParentalControls;
  v2 = [(IMParentalControls *)&v18 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parentalControls = v2->_parentalControls;
    v2->_parentalControls = v3;

    objc_msgSend_setShouldPostNotifications_(v2, v5, 0, v6);
    objc_msgSend__updateParentalSettings(v2, v7, v8, v9);
    v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11, v12);
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)v2, (uint64_t)sel__managedPrefsNotification_, *MEMORY[0x1E4F1D240], *MEMORY[0x1E4F1D248]);

    objc_msgSend_setShouldPostNotifications_(v2, v15, 1, v16);
  }
  return v2;
}

- (void)setShouldPostNotifications:(BOOL)a3
{
  self->_shouldPostNotifications = a3;
}

- (BOOL)okToConnectAccount:(id)a3
{
  return ((uint64_t (*)(IMParentalControls *, char *, id))MEMORY[0x1F4181798])(self, sel_accountIsEnabled_, a3);
}

- (BOOL)accountIsEnabled:(id)a3
{
  v5 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_disableService_(self, v6, (uint64_t)v5, v7) ^ 1;

  return (char)self;
}

+ (id)standardControls
{
  if (qword_1EB3F23D0 != -1) {
    dispatch_once(&qword_1EB3F23D0, &unk_1EF8E52D8);
  }
  if (qword_1EB3F23C0 != -1) {
    dispatch_once(&qword_1EB3F23C0, &unk_1EF8E5FF8);
  }
  if (qword_1EB3F23C8 != -1) {
    dispatch_once(&qword_1EB3F23C8, &unk_1EF8E6058);
  }
  v2 = (void *)qword_1EB3F23D8;

  return v2;
}

- (void)_updateParentalSettings
{
  uint64_t v150 = *MEMORY[0x1E4F143B8];
  BOOL v139 = !self->_active;
  if (!self->_active) {
    self->_active = 1;
  }
  uint64_t v3 = objc_msgSend__serviceWithName_(self, a2, *MEMORY[0x1E4F6E190], v2);
  uint64_t v7 = objc_msgSend_sharedConnection(MEMORY[0x1E4F74230], v4, v5, v6);
  int v10 = objc_msgSend_effectiveBoolValueForSetting_(v7, v8, *MEMORY[0x1E4F741A8], v9);
  if ((v10 == 2) != objc_msgSend_disableService(v3, v11, v12, v13))
  {
    objc_msgSend_setDisableService_(v3, v14, v10 == 2, v15);
    BOOL v139 = 1;
  }

  objc_super v18 = objc_msgSend__serviceWithName_(self, v16, @"Calling", v17);

  v22 = objc_msgSend_sharedConnection(MEMORY[0x1E4F74230], v19, v20, v21);
  int v25 = objc_msgSend_effectiveBoolValueForSetting_(v22, v23, *MEMORY[0x1E4F73F50], v24);
  if ((v25 == 2) != objc_msgSend_disableService(v18, v26, v27, v28))
  {
    objc_msgSend_setDisableService_(v18, v29, v25 == 2, v30);
    BOOL v139 = 1;
  }

  v138 = objc_msgSend__serviceWithName_(self, v31, *MEMORY[0x1E4F6E1B0], v32);

  v36 = objc_msgSend_sharedConnection(MEMORY[0x1E4F74230], v33, v34, v35);
  int v39 = objc_msgSend_effectiveBoolValueForSetting_(v36, v37, *MEMORY[0x1E4F73F90], v38);
  if ((v39 == 2) != objc_msgSend_disableService(v138, v40, v41, v42))
  {
    objc_msgSend_setDisableService_(v138, v43, v39 == 2, v44);
    BOOL v139 = 1;
  }

  v48 = objc_msgSend_sharedManager(MEMORY[0x1E4F74240], v45, v46, v47);
  objc_msgSend_invalidateRestrictions(v48, v49, v50, v51);

  v55 = objc_msgSend_sharedManager(MEMORY[0x1E4F74240], v52, v53, v54);
  objc_msgSend_invalidateSettings(v55, v56, v57, v58);

  v61 = objc_msgSend_objectForKey_(IMParentalControls, v59, *MEMORY[0x1E4F6C4A0], v60);
  v65 = v61;
  if (v61) {
    int v66 = objc_msgSend_intValue(v61, v62, v63, v64);
  }
  else {
    int v66 = 0;
  }
  BOOL v67 = v66 != 0;
  if (self->_forceChatLogging != v67)
  {
    self->_forceChatLogging = v67;
    BOOL v139 = 1;
  }
  v136 = objc_msgSend_objectForKey_(IMParentalControls, v62, *MEMORY[0x1E4F6C498], v64);

  int v71 = (int)v136;
  if (v136) {
    int v71 = objc_msgSend_intValue(v136, v68, v69, v70);
  }
  BOOL v72 = v71 != 0;
  if (self->_disableAV != v72)
  {
    self->_disableAV = v72;
    BOOL v139 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    v73 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      int v77 = objc_msgSend_active(self, v74, v75, v76);
      v78 = @"NO";
      if (v77) {
        v78 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v146 = v78;
      _os_log_impl(&dword_1A4AF7000, v73, OS_LOG_TYPE_DEBUG, "Active: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v79 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
    {
      int v83 = objc_msgSend_disableAV(self, v80, v81, v82);
      v84 = @"NO";
      if (v83) {
        v84 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v146 = v84;
      _os_log_impl(&dword_1A4AF7000, v79, OS_LOG_TYPE_DEBUG, "Disable AV: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v88 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      int v92 = objc_msgSend_forceChatLogging(self, v89, v90, v91);
      v93 = @"NO";
      if (v92) {
        v93 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v146 = v93;
      _os_log_impl(&dword_1A4AF7000, v88, OS_LOG_TYPE_DEBUG, "Force Chat Logging: %@", buf, 0xCu);
    }
  }
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v94 = objc_msgSend_allValues(self->_parentalControls, v85, v86, v87, v136);
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v95, (uint64_t)&v141, (uint64_t)v149, 16);
  if (v96)
  {
    uint64_t v97 = *(void *)v142;
    do
    {
      for (uint64_t i = 0; i != v96; ++i)
      {
        if (*(void *)v142 != v97) {
          objc_enumerationMutation(v94);
        }
        v99 = *(void **)(*((void *)&v141 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          v100 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_name(v99, v101, v102, v103);
            v104 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            int v108 = objc_msgSend_disableService(v99, v105, v106, v107);
            *(_DWORD *)buf = 138412546;
            v109 = @"NO";
            if (v108) {
              v109 = @"YES";
            }
            v146 = v104;
            __int16 v147 = 2112;
            v148 = v109;
            _os_log_impl(&dword_1A4AF7000, v100, OS_LOG_TYPE_INFO, "%@ Disabled: %@", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v110 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_name(v99, v111, v112, v113);
            v114 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            int v118 = objc_msgSend_forceAllowlist(v99, v115, v116, v117);
            *(_DWORD *)buf = 138412546;
            v119 = @"NO";
            if (v118) {
              v119 = @"YES";
            }
            v146 = v114;
            __int16 v147 = 2112;
            v148 = v119;
            _os_log_impl(&dword_1A4AF7000, v110, OS_LOG_TYPE_DEBUG, "%@ Force Allowlist: %@", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v121 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_name(v99, v122, v123, v124);
            v125 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allowlist(v99, v126, v127, v128);
            v129 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v146 = v125;
            __int16 v147 = 2112;
            v148 = v129;
            _os_log_impl(&dword_1A4AF7000, v121, OS_LOG_TYPE_DEBUG, "%@ Allowlist: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v94, v120, (uint64_t)&v141, (uint64_t)v149, 16);
    }
    while (v96);
  }

  char v133 = !v139;
  if (!self->_shouldPostNotifications) {
    char v133 = 1;
  }
  if ((v133 & 1) == 0)
  {
    v134 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v130, v131, v132);
    objc_msgSend___mainThreadPostNotificationName_object_(v134, v135, @"__kIMManagedPreferencesChangedNotification", (uint64_t)self);
  }
}

- (BOOL)disableService:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if (objc_msgSend_active(self, v4, v5, v6))
    {
      uint64_t v11 = objc_msgSend_internalName(v7, v8, v9, v10);
      v14 = objc_msgSend__serviceWithName_(self, v12, (uint64_t)v11, v13);
      char v18 = objc_msgSend_disableService(v14, v15, v16, v17);
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

- (id)_serviceWithName:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    objc_msgSend_objectForKey_(self->_parentalControls, v8, (uint64_t)v4, v9);
    uint64_t v10 = (IMParentalControlsService *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      uint64_t v10 = objc_alloc_init(IMParentalControlsService);
      objc_msgSend_setName_(v10, v11, (uint64_t)v4, v12);
      objc_msgSend_setObject_forKey_(self->_parentalControls, v13, (uint64_t)v10, (uint64_t)v4);
    }
    v14 = v10;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)active
{
  return self->_active;
}

+ (id)objectForKey:(id)a3
{
  return 0;
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  v7.receiver = self;
  v7.super_class = (Class)IMParentalControls;
  [(IMParentalControls *)&v7 dealloc];
}

- (BOOL)disableAV
{
  int v5 = objc_msgSend_active(self, a2, v2, v3);
  if (v5) {
    LOBYTE(v5) = self->_disableAV;
  }
  return v5;
}

- (BOOL)forceChatLogging
{
  int v5 = objc_msgSend_active(self, a2, v2, v3);
  if (v5) {
    LOBYTE(v5) = self->_forceChatLogging;
  }
  return v5;
}

- (BOOL)disableAccount:(id)a3
{
  int v5 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_disableService_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (id)allowlistForService:(id)a3
{
  id v7 = a3;
  if (v7 && objc_msgSend_active(self, v4, v5, v6))
  {
    uint64_t v11 = objc_msgSend_internalName(v7, v8, v9, v10);
    v14 = objc_msgSend__serviceWithName_(self, v12, (uint64_t)v11, v13);
    char v18 = objc_msgSend_allowlist(v14, v15, v16, v17);

    if (objc_msgSend_count(v18, v19, v20, v21)) {
      id v22 = v18;
    }
    else {
      id v22 = 0;
    }
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (BOOL)forceAllowlistForService:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if (objc_msgSend_active(self, v4, v5, v6))
    {
      uint64_t v11 = objc_msgSend_internalName(v7, v8, v9, v10);
      v14 = objc_msgSend__serviceWithName_(self, v12, (uint64_t)v11, v13);
      char v18 = objc_msgSend_forceAllowlist(v14, v15, v16, v17);
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

- (id)allowlistForAccount:(id)a3
{
  uint64_t v5 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_allowlistForService_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (BOOL)forceAllowlistForAccount:(id)a3
{
  uint64_t v5 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_forceAllowlistForService_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (BOOL)accountHasAllowlist:(id)a3
{
  uint64_t v5 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_forceAllowlistForService_(self, v6, (uint64_t)v5, v7);

  return (char)self;
}

- (BOOL)shouldPostNotifications
{
  return self->_shouldPostNotifications;
}

- (NSMutableDictionary)_parentalControls
{
  return self->_parentalControls;
}

- (BOOL)_disableAV
{
  return self->_disableAV;
}

- (BOOL)_forceChatLogging
{
  return self->_forceChatLogging;
}

- (void).cxx_destruct
{
}

@end