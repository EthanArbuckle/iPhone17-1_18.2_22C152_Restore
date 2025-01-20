@interface ADService
- (ADServiceDelegate)delegate;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (BOOL)isSystemService;
- (BOOL)requiresBootMaintenance;
- (BOOL)usesManagedStorageForDomain:(id)a3;
- (NSArray)controlCenterLockRestrictedCommands;
- (NSArray)firstUnlockRestrictedCommands;
- (NSSet)managedStorageDomains;
- (NSString)description;
- (NSString)identifier;
- (id)commandsForDomain:(id)a3;
- (id)customVocabSyncInfo;
- (id)domains;
- (id)handle;
- (id)lockRestrictedCommands;
- (id)syncKeys;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4;
- (void)getInfoWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)setControlCenterLockRestrictedCommands:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstUnlockRestrictedCommands:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setManagedStorageDomains:(id)a3;
- (void)setRequiresBootMaintenance:(BOOL)a3;
@end

@implementation ADService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_controlCenterLockRestrictedCommands, 0);
  objc_storeStrong((id *)&self->_firstUnlockRestrictedCommands, 0);
  objc_storeStrong((id *)&self->_managedStorageDomains, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setDelegate:(id)a3
{
}

- (ADServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADServiceDelegate *)WeakRetained;
}

- (void)setRequiresBootMaintenance:(BOOL)a3
{
  self->_requiresBootMaintenance = a3;
}

- (BOOL)requiresBootMaintenance
{
  return self->_requiresBootMaintenance;
}

- (void)setControlCenterLockRestrictedCommands:(id)a3
{
}

- (NSArray)controlCenterLockRestrictedCommands
{
  return self->_controlCenterLockRestrictedCommands;
}

- (void)setFirstUnlockRestrictedCommands:(id)a3
{
}

- (NSArray)firstUnlockRestrictedCommands
{
  return self->_firstUnlockRestrictedCommands;
}

- (void)setManagedStorageDomains:(id)a3
{
}

- (NSSet)managedStorageDomains
{
  return self->_managedStorageDomains;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isSystemService
{
  return 0;
}

- (void)getInfoWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    v12 = v4;
    v5 = +[NSMutableDictionary dictionary];
    v6 = [(ADService *)self domains];
    if (v6) {
      [v5 setObject:v6 forKey:@"Domains"];
    }
    v7 = [(ADService *)self firstUnlockRestrictedCommands];

    if (v7) {
      [v5 setObject:v7 forKey:@"First Unlock Restricted Commands"];
    }
    v8 = [(ADService *)self controlCenterLockRestrictedCommands];

    if (v8) {
      [v5 setObject:v8 forKey:@"Control Center Lock Restricted Commands"];
    }
    v9 = [(NSSet *)self->_managedStorageDomains allObjects];

    if (v9) {
      [v5 setObject:v9 forKey:@"Managed Storage Domains"];
    }
    v10 = [(ADService *)self syncKeys];

    if (v10) {
      [v5 setObject:v10 forKey:@"Sync Keys"];
    }
    v11 = [(ADService *)self lockRestrictedCommands];

    if (v11) {
      [v5 setObject:v11 forKey:@"Lock Restricted Commands"];
    }
    v12[2](v12, v5);

    v4 = v12;
  }
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
}

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, void, void, void))a4 + 2))(a4, 0, 0, 0);
  }
}

- (void)handleResponse:(id)a3 toCommand:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  if (a6)
  {
    id v7 = a6;
    id v8 = +[NSError errorWithDomain:@"ADServiceError" code:-1 userInfo:0];
    (*((void (**)(id, void, id))a6 + 2))(v7, 0, v8);
  }
}

- (id)lockRestrictedCommands
{
  return 0;
}

- (id)customVocabSyncInfo
{
  return 0;
}

- (id)syncKeys
{
  return 0;
}

- (BOOL)usesManagedStorageForDomain:(id)a3
{
  return [(NSSet *)self->_managedStorageDomains containsObject:a3];
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 0;
}

- (id)commandsForDomain:(id)a3
{
  return 0;
}

- (id)domains
{
  return 0;
}

- (id)handle
{
  return 0;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)ADService;
  v3 = [(ADService *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" %@", self->_identifier];

  return (NSString *)v4;
}

@end