@interface IMCoreAccountsMonitor
+ (IMCoreAccountsMonitor)sharedInstance;
- (BOOL)isSignedIntoiCloud;
- (IMCoreAccountsMonitor)init;
- (id)_cachedPrimaryAppleAccount;
- (void)accountStoreDidChange:(id)a3;
@end

@implementation IMCoreAccountsMonitor

- (IMCoreAccountsMonitor)init
{
  v13.receiver = self;
  v13.super_class = (Class)IMCoreAccountsMonitor;
  v2 = [(IMCoreAccountsMonitor *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("IMCoreAccountsMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    uint64_t v9 = *MEMORY[0x1E4F178D8];
    v10 = sub_1A4C3951C();
    objc_msgSend_addObserver_selector_name_object_(v8, v11, (uint64_t)v2, (uint64_t)sel_accountStoreDidChange_, v9, v10);
  }
  return v2;
}

+ (IMCoreAccountsMonitor)sharedInstance
{
  if (qword_1E965E790 != -1) {
    dispatch_once(&qword_1E965E790, &unk_1EF8E56F8);
  }
  v2 = (void *)qword_1E965EA80;

  return (IMCoreAccountsMonitor *)v2;
}

- (BOOL)isSignedIntoiCloud
{
  v4 = objc_msgSend__cachedPrimaryAppleAccount(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_cachedPrimaryAppleAccount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1A4B3459C;
  v10 = sub_1A4B343B4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4C39724;
  v5[3] = &unk_1E5B7BE20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)accountStoreDidChange:(id)a3
{
  BOOL v5 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v5, v6, *MEMORY[0x1E4F17810], v7);
  int isEqualToString = objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x1E4F17750], v10);

  if (isEqualToString)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4C39988;
    block[3] = &unk_1E5B7ACD0;
    block[4] = self;
    dispatch_sync(queue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPrimaryAppleAccount, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end