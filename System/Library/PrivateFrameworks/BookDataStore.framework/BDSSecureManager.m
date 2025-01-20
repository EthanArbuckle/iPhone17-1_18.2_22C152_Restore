@interface BDSSecureManager
+ (id)sharedManager;
- (BCCloudSecureUserDataManager)userDataManager;
- (BDSSecureEngagementManaging)engagementManager;
- (BDSSecureManager)init;
- (_TtC13BookDataStore23CloudSecureManagerProxy)secureManager;
- (void)handleRemoteCKNotification:(id)a3;
- (void)handleRemoteNotification:(id)a3;
- (void)setEnableCloudSync:(BOOL)a3;
- (void)setSecureManager:(id)a3;
@end

@implementation BDSSecureManager

+ (id)sharedManager
{
  if (qword_26AD77650 != -1) {
    dispatch_once(&qword_26AD77650, &unk_26E971DD0);
  }
  v2 = (void *)qword_26AD775C8;
  return v2;
}

- (BDSSecureManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)BDSSecureManager;
  v9 = [(BDSSecureManager *)&v13 init];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_sharedManager(_TtC13BookDataStore23CloudSecureManagerProxy, v2, v3, v4, v5, v6, v7, v8);
    secureManager = v9->_secureManager;
    v9->_secureManager = (_TtC13BookDataStore23CloudSecureManagerProxy *)v10;
  }
  return v9;
}

- (BDSSecureEngagementManaging)engagementManager
{
  return (BDSSecureEngagementManaging *)((uint64_t (*)(_TtC13BookDataStore23CloudSecureManagerProxy *, char *))MEMORY[0x270F9A6D0])(self->_secureManager, sel_engagementManager);
}

- (BCCloudSecureUserDataManager)userDataManager
{
  return (BCCloudSecureUserDataManager *)((uint64_t (*)(_TtC13BookDataStore23CloudSecureManagerProxy *, char *))MEMORY[0x270F9A6D0])(self->_secureManager, sel_userDataManager);
}

- (void)handleRemoteNotification:(id)a3
{
}

- (void)handleRemoteCKNotification:(id)a3
{
  objc_msgSend_handleRemoteCKNotification_(self->_secureManager, a2, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)setEnableCloudSync:(BOOL)a3
{
  objc_msgSend_setEnableCloudSync_(self->_secureManager, a2, a3, v3, v4, v5, v6, v7);
}

- (_TtC13BookDataStore23CloudSecureManagerProxy)secureManager
{
  return self->_secureManager;
}

- (void)setSecureManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end