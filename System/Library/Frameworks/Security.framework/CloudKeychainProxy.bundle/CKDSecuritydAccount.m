@interface CKDSecuritydAccount
+ (id)securitydAccount;
- (BOOL)ensurePeerRegistration:(id *)a3;
- (id)keysChanged:(id)a3 error:(id *)a4;
- (id)syncWithPeers:(id)a3 backups:(id)a4 error:(id *)a5;
- (int)syncWithAllPeers:(id *)a3;
@end

@implementation CKDSecuritydAccount

- (int)syncWithAllPeers:(id *)a3
{
  return SOSCCProcessSyncWithAllPeers();
}

- (id)syncWithPeers:(id)a3 backups:(id)a4 error:(id *)a5
{
  v5 = (void *)SOSCCProcessSyncWithPeers();

  return v5;
}

- (BOOL)ensurePeerRegistration:(id *)a3
{
  return SOSCCProcessEnsurePeerRegistration();
}

- (id)keysChanged:(id)a3 error:(id *)a4
{
  updated = (void *)_SecKeychainSyncUpdateMessage();
  if (a4) {
    *a4 = 0;
  }
  v6 = +[NSSet setWithArray:updated];

  return v6;
}

+ (id)securitydAccount
{
  v2 = objc_alloc_init(CKDSecuritydAccount);

  return v2;
}

@end