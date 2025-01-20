@interface CHManagedConfigurations
+ (id)managedConfigurations;
- (BOOL)isPersonalizedHandwritingResultsAllowed;
- (CHManagedConfigurations)init;
- (void)_profileSettingsChanged:(id)a3;
- (void)_updateSettings;
@end

@implementation CHManagedConfigurations

+ (id)managedConfigurations
{
  v2 = objc_alloc_init(CHManagedConfigurations);
  return v2;
}

- (CHManagedConfigurations)init
{
  v16.receiver = self;
  v16.super_class = (Class)CHManagedConfigurations;
  v7 = [(CHManagedConfigurations *)&v16 init];
  if (v7)
  {
    v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v2, v3, v4, v5, v6);
    objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)v7, (uint64_t)sel__profileSettingsChanged_, *MEMORY[0x1E4F73EC0], 0);

    objc_msgSend__updateSettings(v7, v10, v11, v12, v13, v14);
  }
  return v7;
}

- (void)_updateSettings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v7 = objc_msgSend_sharedConnection(MEMORY[0x1E4F74230], a2, v2, v3, v4, v5);
  self->_isPersonalizedHandwritingResultsAllowed = objc_msgSend_isPersonalizedHandwritingResultsAllowed(v7, v8, v9, v10, v11, v12);

  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v13 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    if (self->_isPersonalizedHandwritingResultsAllowed) {
      uint64_t v14 = @"YES";
    }
    else {
      uint64_t v14 = @"NO";
    }
    int v15 = 138412290;
    objc_super v16 = v14;
    _os_log_impl(&dword_1C492D000, v13, OS_LOG_TYPE_DEBUG, "CHManagedConfigurations updated value for _isPersonalizedHandwritingResultsAllowed: %@", (uint8_t *)&v15, 0xCu);
  }
}

- (void)_profileSettingsChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v5 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1C492D000, v5, OS_LOG_TYPE_DEBUG, "CHManagedConfigurations received notification: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A6E1EC;
  block[3] = &unk_1E64E16D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)isPersonalizedHandwritingResultsAllowed
{
  return self->_isPersonalizedHandwritingResultsAllowed;
}

@end