@interface CLSSettingsVisibilityController
+ (id)shared;
- (BOOL)settingsUIVisible;
- (CLSSettingsVisibilityController)init;
- (id)cachedCurrentUserAppleID;
- (id)currentUser;
- (void)currentUserDidChange:(id)a3;
- (void)dealloc;
- (void)lock;
- (void)unlock;
@end

@implementation CLSSettingsVisibilityController

+ (id)shared
{
  if (qword_1EB5D4C50 != -1) {
    dispatch_once(&qword_1EB5D4C50, &unk_1F37A1770);
  }
  v2 = (void *)qword_1EB5D4C48;

  return v2;
}

- (CLSSettingsVisibilityController)init
{
  v11.receiver = self;
  v11.super_class = (Class)CLSSettingsVisibilityController;
  v4 = [(CLSSettingsVisibilityController *)&v11 init];
  if (v4)
  {
    if (!objc_msgSend_isInternalProcess(CLSEntitlements, v2, v3))
    {
      v9 = 0;
      goto LABEL_6;
    }
    v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6);
    objc_msgSend_addObserver_selector_name_object_(v7, v8, (uint64_t)v4, sel_currentUserDidChange_, @"CLSCurrentUserDidChangeNotificationName", 0);

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  v9 = v4;
LABEL_6:

  return v9;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void)dealloc
{
  v4 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2);
  objc_msgSend_removeObserver_(v4, v5, (uint64_t)self);

  v6.receiver = self;
  v6.super_class = (Class)CLSSettingsVisibilityController;
  [(CLSSettingsVisibilityController *)&v6 dealloc];
}

- (void)currentUserDidChange:(id)a3
{
  id v4 = a3;
  objc_msgSend_lock(self, v5, v6);
  v9 = objc_msgSend_userInfo(v4, v7, v8);

  objc_msgSend_objectForKey_(v9, v10, @"CLSCurrentUserInfoKey");
  objc_super v11 = (CLSCurrentUser *)objc_claimAutoreleasedReturnValue();
  currentUser = self->_currentUser;
  self->_currentUser = v11;

  objc_msgSend_unlock(self, v13, v14);
  v15 = MEMORY[0x1E4F14428];

  dispatch_async(v15, &unk_1F37A0FD0);
}

- (id)cachedCurrentUserAppleID
{
  uint64_t v3 = objc_msgSend_person(self->_currentUser, a2, v2);
  uint64_t v6 = objc_msgSend_appleID(v3, v4, v5);

  return v6;
}

- (id)currentUser
{
  objc_msgSend_lock(self, a2, v2);
  id v4 = self->_currentUser;
  objc_msgSend_unlock(self, v5, v6);
  if (qword_1EB5D46B8 != -1) {
    dispatch_once(&qword_1EB5D46B8, &unk_1F37A0C10);
  }

  return v4;
}

- (BOOL)settingsUIVisible
{
  uint64_t v3 = objc_msgSend_currentUser(self, a2, v2);
  if (objc_msgSend_isInstructor(v3, v4, v5)) {
    char isStudent = 1;
  }
  else {
    char isStudent = objc_msgSend_isStudent(v3, v6, v7);
  }

  return isStudent;
}

- (void).cxx_destruct
{
}

@end