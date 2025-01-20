@interface IDSInvitationStore
- (BOOL)isEmpty;
- (IDSInvitationStore)init;
- (IDSPersistentMap)persistentMap;
- (id)persistedPendingInvitationsForService:(id)a3;
- (id)persistedReceivedInvitationsForService:(id)a3;
- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5;
- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5;
- (void)removePendingInvitation:(id)a3 forService:(id)a4;
- (void)removeReceivedInvitation:(id)a3 forService:(id)a4;
- (void)setPersistentMap:(id)a3;
@end

@implementation IDSInvitationStore

- (IDSInvitationStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)IDSInvitationStore;
  v2 = [(IDSInvitationStore *)&v9 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(), 0);
    v6 = [[IDSPersistentMap alloc] initWithIdentifier:@"com.apple.identityservicesd.invitation.store" versionNumber:1 decodableClasses:v5 migrationBlock:0];
    persistentMap = v2->_persistentMap;
    v2->_persistentMap = v6;
  }
  return v2;
}

- (BOOL)isEmpty
{
  v2 = [(IDSInvitationStore *)self persistentMap];
  uint64_t v3 = [v2 allKeys];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

- (id)persistedPendingInvitationsForService:(id)a3
{
  BOOL v4 = +[NSString stringWithFormat:@"%@-sentInvitations", a3];
  v5 = [(IDSPersistentMap *)self->_persistentMap objectForKey:v4];

  return v5;
}

- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(IDSInvitationStore *)self persistedPendingInvitationsForService:v9];
  id v17 = v11;
  if (v11) {
    id v12 = [v11 mutableCopy];
  }
  else {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v13 = v12;
  [v12 setObject:v10 forKey:v8];

  v14 = +[NSString stringWithFormat:@"%@-sentInvitations", v9];

  persistentMap = self->_persistentMap;
  id v16 = [v13 copy];
  [(IDSPersistentMap *)persistentMap setObject:v16 forKey:v14];
}

- (void)removePendingInvitation:(id)a3 forService:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(IDSInvitationStore *)self persistedPendingInvitationsForService:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    [v9 removeObjectsForKeys:v13];
    id v10 = +[NSString stringWithFormat:@"%@-sentInvitations", v6];
    persistentMap = self->_persistentMap;
    id v12 = [v9 copy];
    [(IDSPersistentMap *)persistentMap setObject:v12 forKey:v10];
  }
}

- (id)persistedReceivedInvitationsForService:(id)a3
{
  BOOL v4 = +[NSString stringWithFormat:@"%@-receivedInvitation", a3];
  v5 = [(IDSPersistentMap *)self->_persistentMap objectForKey:v4];

  return v5;
}

- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(IDSInvitationStore *)self persistedReceivedInvitationsForService:v9];
  id v17 = v11;
  if (v11) {
    id v12 = [v11 mutableCopy];
  }
  else {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v13 = v12;
  [v12 setObject:v10 forKey:v8];

  v14 = +[NSString stringWithFormat:@"%@-receivedInvitation", v9];

  persistentMap = self->_persistentMap;
  id v16 = [v13 copy];
  [(IDSPersistentMap *)persistentMap setObject:v16 forKey:v14];
}

- (void)removeReceivedInvitation:(id)a3 forService:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  v7 = [(IDSInvitationStore *)self persistedReceivedInvitationsForService:v6];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 mutableCopy];
    [v9 removeObjectsForKeys:v13];
    id v10 = +[NSString stringWithFormat:@"%@-receivedInvitation", v6];
    persistentMap = self->_persistentMap;
    id v12 = [v9 copy];
    [(IDSPersistentMap *)persistentMap setObject:v12 forKey:v10];
  }
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end