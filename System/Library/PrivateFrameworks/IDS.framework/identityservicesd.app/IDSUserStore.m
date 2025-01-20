@interface IDSUserStore
- (IDSPersistentMap)persistentMap;
- (IDSRegistrationKeychainManager)registrationKeychainManager;
- (IDSUserStore)initWithQueue:(id)a3;
- (IDSUserStore)initWithQueue:(id)a3 persister:(id)a4 registrationKeychainManager:(id)a5;
- (NSDictionary)dataProviderByRealm;
- (NSMapTable)realmByListener;
- (OS_dispatch_queue)queue;
- (id)_stringRepresentationOfUserRealm:(int64_t)a3;
- (id)authenticationCertificateForUser:(id)a3;
- (id)credentialForUser:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)propertiesForUser:(id)a3;
- (id)userWithUniqueIdentifier:(id)a3;
- (id)usersWithRealm:(int64_t)a3;
- (id)usersWithRealms:(id)a3;
- (void)_addUser:(id)a3;
- (void)_iterateByRealm:(int64_t)a3 block:(id)a4;
- (void)_removeUser:(id)a3;
- (void)_updateUsersForCurrentUsers:(id)a3 updatedUsers:(id)a4;
- (void)addActionListener:(id)a3;
- (void)addActionListener:(id)a3 forRealm:(int64_t)a4;
- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4;
- (void)persistUsersImmediately;
- (void)reloadUsers;
- (void)reloadUsersForRealm:(int64_t)a3;
- (void)removeActionListener:(id)a3;
- (void)setAuthenticationCertificate:(id)a3 forUser:(id)a4;
- (void)setCredential:(id)a3 forUser:(id)a4;
- (void)setDataProvider:(id)a3 forRealm:(int64_t)a4;
- (void)setDataProviderByRealm:(id)a3;
- (void)setPersistentMap:(id)a3;
- (void)setProperties:(id)a3 forUser:(id)a4;
- (void)setQueue:(id)a3;
- (void)setRealmByListener:(id)a3;
- (void)setRegistrationKeychainManager:(id)a3;
- (void)silentlySetAuthenticationCertificate:(id)a3 forUser:(id)a4;
- (void)updateUser:(id)a3;
@end

@implementation IDSUserStore

- (IDSUserStore)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = +[IDSPersistentMap defaultPersisterForIdentifier:@"com.apple.identityservices.userStore" dataProtectionClass:2];
  v6 = +[IDSRegistrationKeychainManager sharedInstance];
  v7 = [(IDSUserStore *)self initWithQueue:v4 persister:v5 registrationKeychainManager:v6];

  return v7;
}

- (IDSUserStore)initWithQueue:(id)a3 persister:(id)a4 registrationKeychainManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v28.receiver = self;
    v28.super_class = (Class)IDSUserStore;
    v12 = [(IDSUserStore *)&v28 init];
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_queue, a3);
      v27 = [[IDSPersistentMapMergePolicy alloc] initWithPolicyBlock:&stru_100986758];
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = objc_opt_class();
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, v16, v17, v26, objc_opt_class(), 0);
      LOBYTE(v25) = 1;
      v19 = [[IDSPersistentMap alloc] initWithIdentifier:@"com.apple.identityservices.userStore" versionNumber:2 decodableClasses:v18 mergePolicy:v27 writeCoalescingDelay:v10 writeCoalescingLeeway:&stru_100986778 persister:5.0 migrationBlock:1.0 allowBackup:v25];
      persistentMap = v13->_persistentMap;
      v13->_persistentMap = v19;

      objc_storeStrong((id *)&v13->_registrationKeychainManager, a5);
      uint64_t v21 = +[NSMapTable weakToStrongObjectsMapTable];
      realmByListener = v13->_realmByListener;
      v13->_realmByListener = (NSMapTable *)v21;
    }
    self = v13;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)setDataProvider:(id)a3 forRealm:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSNumber numberWithInteger:a4];
  uint64_t v14 = v7;
  id v15 = v6;
  v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];

  dataProviderByRealm = self->_dataProviderByRealm;
  if (dataProviderByRealm)
  {
    id v10 = (NSDictionary *)[(NSDictionary *)dataProviderByRealm mutableCopy];
    [(NSDictionary *)v10 addEntriesFromDictionary:v8];
    id v11 = (NSDictionary *)[(NSDictionary *)v10 copy];
    v12 = self->_dataProviderByRealm;
    self->_dataProviderByRealm = v11;
  }
  else
  {
    v13 = v8;
    id v10 = self->_dataProviderByRealm;
    self->_dataProviderByRealm = v13;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: %p, dataProviderByRealm: %@, persistentMap: %@>", objc_opt_class(), self, self->_dataProviderByRealm, self->_persistentMap];
}

- (id)debugDescription
{
  uint64_t v3 = objc_opt_class();
  dataProviderByRealm = self->_dataProviderByRealm;
  v5 = [(IDSPersistentMap *)self->_persistentMap debugDescription];
  id v6 = +[NSString stringWithFormat:@"<%@: %p, dataProviderByRealm: %@, persistentMap: %@>", v3, self, dataProviderByRealm, v5];

  return v6;
}

- (id)usersWithRealm:(int64_t)a3
{
  id v4 = [(IDSPersistentMap *)self->_persistentMap allValues];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100225C7C;
  v7[3] = &unk_100986798;
  v7[4] = a3;
  v5 = objc_msgSend(v4, "__imArrayByApplyingBlock:", v7);

  return v5;
}

- (id)usersWithRealms:(id)a3
{
  id v4 = a3;
  v5 = [(IDSPersistentMap *)self->_persistentMap allValues];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100225DCC;
  v9[3] = &unk_1009867C0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "__imArrayByApplyingBlock:", v9);

  return v7;
}

- (id)userWithUniqueIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[IDSPersistentMap objectForKey:](self->_persistentMap, "objectForKey:");
    id v4 = [v3 user];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)persistUsersImmediately
{
}

- (void)reloadUsers
{
  [(IDSUserStore *)self reloadUsersForRealm:0];

  [(IDSUserStore *)self reloadUsersForRealm:1];
}

- (void)reloadUsersForRealm:(int64_t)a3
{
  v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(IDSUserStore *)self _stringRepresentationOfUserRealm:a3];
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "UserStore reloading {realm: %@}", (uint8_t *)&v14, 0xCu);
  }
  dataProviderByRealm = self->_dataProviderByRealm;
  v8 = +[NSNumber numberWithInteger:a3];
  id v9 = [(NSDictionary *)dataProviderByRealm objectForKeyedSubscript:v8];

  if (v9)
  {
    id v10 = [(IDSUserStore *)self usersWithRealm:a3];
    id v11 = +[NSSet setWithArray:v10];

    v12 = [v9 updatedUserSetForRealm:a3 currentUsers:v11];
    v13 = +[IMRGLog registration];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Provider created change set {current: %@, updated: %@, provider: %@}", (uint8_t *)&v14, 0x20u);
    }

    [(IDSUserStore *)self _updateUsersForCurrentUsers:v11 updatedUsers:v12];
  }
}

- (void)forceRemoveUser:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    dataProviderByRealm = self->_dataProviderByRealm;
    id v10 = v6;
    v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 realm]);
    id v9 = [(NSDictionary *)dataProviderByRealm objectForKeyedSubscript:v8];

    if (v9) {
      [v9 forceRemoveUser:v10 silently:v4];
    }

    id v6 = v10;
  }
}

- (void)updateUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating user {user: %@}", buf, 0xCu);
    }

    persistentMap = self->_persistentMap;
    v7 = [v4 uniqueIdentifier];
    v8 = [(IDSPersistentMap *)persistentMap objectForKey:v7];

    if (v8)
    {
      id v9 = self->_persistentMap;
      id v10 = [IDSUserDescription alloc];
      id v11 = [v8 properties];
      v12 = [(IDSUserDescription *)v10 initWithUser:v4 properties:v11];
      v13 = [v4 uniqueIdentifier];
      [(IDSPersistentMap *)v9 setObject:v12 forKey:v13];

      int v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Broadcasting update user {user: %@}", buf, 0xCu);
      }

      id v15 = [v4 realm];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10022642C;
      v17[3] = &unk_1009867E8;
      v17[4] = self;
      id v18 = v4;
      [(IDSUserStore *)self _iterateByRealm:v15 block:v17];
    }
    else
    {
      __int16 v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "User is not present -- not updating {user: %@}", buf, 0xCu);
      }
    }
  }
}

- (void)_updateUsersForCurrentUsers:(id)a3 updatedUsers:(id)a4
{
  id v35 = a3;
  id v6 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        persistentMap = self->_persistentMap;
        v13 = [v11 uniqueIdentifier];
        int v14 = [(IDSPersistentMap *)persistentMap objectForKey:v13];

        if (v14)
        {
          id v15 = [v14 user];
          unsigned __int8 v16 = [v11 isIdenticalToUser:v15];

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = +[IMRGLog registration];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v51 = v11;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Silently updating user {user: %@}", buf, 0xCu);
            }

            id v18 = self->_persistentMap;
            v19 = [IDSUserDescription alloc];
            id v20 = [v14 properties];
            uint64_t v21 = [(IDSUserDescription *)v19 initWithUser:v11 properties:v20];
            v22 = [v11 uniqueIdentifier];
            [(IDSPersistentMap *)v18 setObject:v21 forKey:v22];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v8);
  }
  if (([v35 isEqualToSet:v6] & 1) == 0)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v23 = v35;
    id v24 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * (void)j);
          if (([v6 containsObject:v28] & 1) == 0) {
            [(IDSUserStore *)self _removeUser:v28];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v25);
    }

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v29 = v6;
    id v30 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v37;
      do
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v37 != v32) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void *)(*((void *)&v36 + 1) + 8 * (void)k);
          if (([v23 containsObject:v34] & 1) == 0) {
            [(IDSUserStore *)self _addUser:v34];
          }
        }
        id v31 = [v29 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v31);
    }
  }
}

- (void)_addUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding user {user: %@}", buf, 0xCu);
    }

    persistentMap = self->_persistentMap;
    id v7 = [v4 uniqueIdentifier];
    id v8 = [(IDSPersistentMap *)persistentMap objectForKey:v7];

    uint64_t v9 = [IDSUserDescription alloc];
    id v10 = [v8 properties];
    id v11 = [(IDSUserDescription *)v9 initWithUser:v4 properties:v10];

    v12 = self->_persistentMap;
    v13 = [v4 uniqueIdentifier];
    [(IDSPersistentMap *)v12 setObject:v11 forKey:v13];

    if (!v8)
    {
      int v14 = +[IMRGLog registration];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v4;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Broadcasting new user {user: %@}", buf, 0xCu);
      }

      id v15 = [v4 realm];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1002269EC;
      v16[3] = &unk_1009867E8;
      v16[4] = self;
      id v17 = v4;
      [(IDSUserStore *)self _iterateByRealm:v15 block:v16];
    }
  }
}

- (void)_removeUser:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[IMRGLog registration];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing user {user: %@}", buf, 0xCu);
    }

    [(IDSUserStore *)self setCredential:0 forUser:v4];
    id v6 = [(IDSUserStore *)self authenticationCertificateForUser:v4];
    if (![v4 realm])
    {
      id v7 = +[IDSPACStateTracker sharedInstance];
      [v7 notePhoneAuthCertLost:9];
    }
    [(IDSUserStore *)self silentlySetAuthenticationCertificate:0 forUser:v4];
    persistentMap = self->_persistentMap;
    uint64_t v9 = [v4 uniqueIdentifier];
    [(IDSPersistentMap *)persistentMap removeObjectForKey:v9];

    id v10 = [v4 realm];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100226BD0;
    v12[3] = &unk_100986810;
    v12[4] = self;
    id v13 = v4;
    id v14 = v6;
    id v11 = v6;
    [(IDSUserStore *)self _iterateByRealm:v10 block:v12];
  }
}

- (id)_stringRepresentationOfUserRealm:(int64_t)a3
{
  CFStringRef v3 = @"p";
  if (a3 == 1) {
    CFStringRef v3 = @"aid";
  }
  if (a3 == 2) {
    return @"tp";
  }
  else {
    return (id)v3;
  }
}

- (id)credentialForUser:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 realm];
    if (v6 == (id)2)
    {
      registrationKeychainManager = self->_registrationKeychainManager;
      id v14 = v5;
      id v15 = [v14 phoneNumber];
      id v10 = [(IDSRegistrationKeychainManager *)registrationKeychainManager tempPhoneCredentialForID:v15];

      id v16 = [IDSTemporaryPhoneUserCredential alloc];
      v12 = [(IDSTemporaryPhoneUserCredential *)v16 initWithDataRepresentation:v10];
      goto LABEL_7;
    }
    if (v6 == (id)1)
    {
      id v18 = +[IMRGLog registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_10071A6DC((uint64_t)v5, v18);
      }
    }
    else if (!v6)
    {
      id v7 = self->_registrationKeychainManager;
      id v8 = v5;
      uint64_t v9 = [v8 phoneNumber];
      id v10 = [(IDSRegistrationKeychainManager *)v7 smsSignatureForID:v9];

      id v11 = [IDSPhoneUserCredential alloc];
      v12 = [(IDSPhoneUserCredential *)v11 initWithSMSSignature:v10];
LABEL_7:
      id v17 = v12;

      goto LABEL_12;
    }
  }
  id v17 = 0;
LABEL_12:

  return v17;
}

- (void)setCredential:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_16;
  }
  if (v6)
  {
    id v8 = [v6 realm];
    if (v8 != [v7 realm])
    {
      id v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        sub_10071A754((uint64_t)v6, (uint64_t)v7, v16);
      }
      goto LABEL_15;
    }
  }
  id v9 = [v7 realm];
  if (v9 == (id)2)
  {
    registrationKeychainManager = self->_registrationKeychainManager;
    id v18 = v6;
    id v19 = v7;
    id v20 = [v18 dataRepresentation];
    uint64_t v21 = [v19 phoneNumber];
    [(IDSRegistrationKeychainManager *)registrationKeychainManager setTempPhoneCredential:v20 forID:v21];

    goto LABEL_16;
  }
  if (v9 == (id)1)
  {
    id v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      sub_10071A6DC((uint64_t)v7, v16);
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v9)
  {
    id v10 = v7;
    id v11 = v6;
    v12 = [v10 phoneNumber];

    if (v12)
    {
      id v13 = self->_registrationKeychainManager;
      id v14 = [v11 smsSignature];
      id v15 = [v10 phoneNumber];
      [(IDSRegistrationKeychainManager *)v13 setSMSSignature:v14 mainID:v15];
    }
  }
LABEL_16:
}

- (id)authenticationCertificateForUser:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = [v4 storageIdentifier];

    if (v6)
    {
      registrationKeychainManager = self->_registrationKeychainManager;
      id v8 = [v5 storageIdentifier];
      id v9 = [(IDSRegistrationKeychainManager *)registrationKeychainManager authenticationCertForID:v8];

      if (v9) {
        id v6 = [objc_alloc((Class)IDSAuthenticationCertificate) initWithDataRepresentation:v9];
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setAuthenticationCertificate:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IDSUserStore *)self silentlySetAuthenticationCertificate:v6 forUser:v7];
  id v8 = [v7 realm];
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100227144;
    v12[3] = &unk_100986810;
    v12[4] = self;
    id v9 = &v13;
    id v13 = v6;
    id v14 = v7;
    id v10 = v7;
    [(IDSUserStore *)self _iterateByRealm:v8 block:v12];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100227138;
    v15[3] = &unk_1009867E8;
    id v9 = &v16;
    v15[4] = self;
    id v16 = v7;
    id v11 = v7;
    [(IDSUserStore *)self _iterateByRealm:v8 block:v15];
  }
}

- (void)silentlySetAuthenticationCertificate:(id)a3 forUser:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 storageIdentifier];

  if (v7)
  {
    registrationKeychainManager = self->_registrationKeychainManager;
    id v9 = [v11 dataRepresentation];
    id v10 = [v6 storageIdentifier];
    [(IDSRegistrationKeychainManager *)registrationKeychainManager setAuthenticationCert:v9 forID:v10];
  }
}

- (id)propertiesForUser:(id)a3
{
  if (a3)
  {
    persistentMap = self->_persistentMap;
    id v4 = [a3 uniqueIdentifier];
    v5 = [(IDSPersistentMap *)persistentMap objectForKey:v4];
    id v6 = [v5 properties];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setProperties:(id)a3 forUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    id v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v8;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating user properties {user: %@, props: %@}", buf, 0x16u);
    }

    persistentMap = self->_persistentMap;
    id v11 = [v8 uniqueIdentifier];
    v12 = [(IDSPersistentMap *)persistentMap objectForKey:v11];

    if (v12)
    {
      id v13 = self->_persistentMap;
      id v14 = [[IDSUserDescription alloc] initWithUser:v8 properties:v6];
      id v15 = [v8 uniqueIdentifier];
      [(IDSPersistentMap *)v13 setObject:v14 forKey:v15];

      id v16 = +[IMRGLog registration];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Broadcasting update user props {user: %@}", buf, 0xCu);
      }

      id v17 = [v8 realm];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100227510;
      v19[3] = &unk_1009867E8;
      v19[4] = self;
      id v20 = v8;
      [(IDSUserStore *)self _iterateByRealm:v17 block:v19];
    }
    else
    {
      id v18 = +[IMRGLog registration];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User is not present -- not updating props {user: %@}", buf, 0xCu);
      }
    }
  }
}

- (void)_iterateByRealm:(int64_t)a3 block:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->_realmByListener;
  id v7 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(NSMapTable *)self->_realmByListener objectForKey:v11];
        id v13 = [v12 integerValue];

        if (v13 == (id)a3 || v13 == (id)-42) {
          v6[2](v6, v11);
        }
      }
      id v8 = [(NSMapTable *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)addActionListener:(id)a3
{
}

- (void)addActionListener:(id)a3 forRealm:(int64_t)a4
{
  realmByListener = self->_realmByListener;
  id v6 = a3;
  id v7 = +[NSNumber numberWithInteger:a4];
  [(NSMapTable *)realmByListener setObject:v7 forKey:v6];
}

- (void)removeActionListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IDSPersistentMap)persistentMap
{
  return self->_persistentMap;
}

- (void)setPersistentMap:(id)a3
{
}

- (IDSRegistrationKeychainManager)registrationKeychainManager
{
  return self->_registrationKeychainManager;
}

- (void)setRegistrationKeychainManager:(id)a3
{
}

- (NSMapTable)realmByListener
{
  return self->_realmByListener;
}

- (void)setRealmByListener:(id)a3
{
}

- (NSDictionary)dataProviderByRealm
{
  return self->_dataProviderByRealm;
}

- (void)setDataProviderByRealm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataProviderByRealm, 0);
  objc_storeStrong((id *)&self->_realmByListener, 0);
  objc_storeStrong((id *)&self->_registrationKeychainManager, 0);
  objc_storeStrong((id *)&self->_persistentMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end