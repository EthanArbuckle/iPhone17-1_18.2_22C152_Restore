@interface CKDGlobalConfigurationOperation
- (BOOL)shouldCheckAppVersion;
- (CKDServerConfiguration)configuration;
- (OS_dispatch_group)configurationFetchedGroup;
- (id)activityCreate;
- (void)main;
- (void)setConfiguration:(id)a3;
- (void)setConfigurationFetchedGroup:(id)a3;
@end

@implementation CKDGlobalConfigurationOperation

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/global-configuration", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)main
{
  v3 = [CKDGlobalConfigurationURLRequest alloc];
  v5 = objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1C4F64D40;
  v17[3] = &unk_1E64F0170;
  objc_copyWeak(&v18, &location);
  objc_copyWeak(&v19, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)v17);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5);
  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(self, v8, v9),
        v10 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v10, v11, @"StallGlobalConfigOperation"),
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v10,
        v12))
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v13 = *MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1C4CFF000, v13, OS_LOG_TYPE_INFO, "Stalling Global Config Operation, you asked for it", v16, 2u);
    }
  }
  else
  {
    v14 = objc_msgSend_container(self, v8, v9);
    objc_msgSend_performRequest_(v14, v15, (uint64_t)v5);
  }
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (CKDServerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (OS_dispatch_group)configurationFetchedGroup
{
  return self->_configurationFetchedGroup;
}

- (void)setConfigurationFetchedGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationFetchedGroup, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end