@interface IDSPinnedIdentityController
+ (IDSPinnedIdentityController)sharedInstance;
- (BOOL)foundPersistedIdentityForEndpoint:(id)a3 forService:(id)a4;
- (IDSPersistentMap)identityPersister;
- (IDSPinnedIdentityController)init;
- (IDSPinnedIdentityController)initWithPersister:(id)a3;
- (NSData)identity;
- (id)pushHandler;
- (id)registrationKeyManager;
- (id)serviceController;
- (id)systemMonitor;
- (void)_persistIdentity:(id)a3;
- (void)clearAllPinnedIdentities;
- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3;
- (void)fetchIdentityForPinningWithCompletion:(id)a3;
- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4;
- (void)setIdentity:(id)a3;
- (void)setIdentityPersister:(id)a3;
@end

@implementation IDSPinnedIdentityController

+ (IDSPinnedIdentityController)sharedInstance
{
  if (qword_100A4C8F8 != -1) {
    dispatch_once(&qword_100A4C8F8, &stru_10098B3D8);
  }
  v2 = (void *)qword_100A4C900;

  return (IDSPinnedIdentityController *)v2;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (id)pushHandler
{
  return +[IDSPushHandler sharedInstance];
}

- (id)registrationKeyManager
{
  return +[IDSRegistrationKeyManager sharedInstance];
}

- (id)systemMonitor
{
  return +[IMSystemMonitor sharedInstance];
}

- (IDSPinnedIdentityController)init
{
  v3 = [IDSPersistentMap alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  v8 = [(IDSPersistentMap *)v3 initWithIdentifier:@"com.apple.identityservicesd.pinned-identity" versionNumber:0 decodableClasses:v7 migrationBlock:0];
  v9 = [(IDSPinnedIdentityController *)self initWithPersister:v8];

  return v9;
}

- (IDSPinnedIdentityController)initWithPersister:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSPinnedIdentityController;
  uint64_t v6 = [(IDSPinnedIdentityController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identityPersister, a3);
  }

  return v7;
}

- (void)fetchIdentityForPinningWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void, id))a3;
  id v5 = [(IDSPinnedIdentityController *)self systemMonitor];
  unsigned int v6 = [v5 isUnderFirstDataProtectionLock];

  if (!v6)
  {
    objc_super v9 = [(IDSPinnedIdentityController *)self serviceController];
    v8 = [v9 allPinningEnforcedServices];

    v10 = [(IDSPinnedIdentityController *)self pushHandler];
    v11 = [v10 pushToken];

    v12 = [(IDSPinnedIdentityController *)self registrationKeyManager];
    id v45 = 0;
    v13 = [v12 publicMessageProtectionIdentityDataToRegisterWithError:&v45];
    id v14 = v45;

    if (v14)
    {
      v15 = +[IDSFoundationLog IDSPinnedIdentity];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100720714();
      }

      if (v4) {
        v4[2](v4, 0, v14);
      }
      goto LABEL_44;
    }
    v16 = [v13 publicNGMIdentityData];
    if (!v16)
    {
      v34 = +[IDSFoundationLog IDSPinnedIdentity];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        sub_1007205D4();
      }

      if (!v4) {
        goto LABEL_43;
      }
      id v17 = +[NSError errorWithDomain:@"IDSPinnedIdentityError" code:1 userInfo:0];
      v4[2](v4, 0, v17);
LABEL_42:

LABEL_43:
LABEL_44:

      goto LABEL_45;
    }
    v37 = v13;
    v39 = v11;
    id v17 = objc_alloc_init((Class)NSMutableArray);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v38 = v8;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v42;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v42 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          id v24 = objc_alloc_init((Class)IDSPinnedIdentityMetadata);
          v25 = [v23 identifier];
          [v24 setService:v25];

          [v24 setIdentity:v16];
          [v17 addObject:v24];
        }
        id v20 = [v18 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v20);
    }

    id v26 = objc_alloc_init((Class)IDSPinnedIdentities);
    v11 = v39;
    [v26 setPushToken:v39];
    [v26 setPinnedIdentityMetadatas:v17];
    uint64_t v27 = [v26 pushToken];
    if (v27
      && (v28 = (void *)v27,
          [v26 pinnedIdentityMetadatas],
          v29 = objc_claimAutoreleasedReturnValue(),
          v29,
          v28,
          v29))
    {
      id v40 = 0;
      v30 = +[NSKeyedArchiver archivedDataWithRootObject:v26 requiringSecureCoding:1 error:&v40];
      id v31 = v40;
      if (v31)
      {
        v32 = +[IDSFoundationLog IDSPinnedIdentity];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_1007206AC();
        }

        v8 = v38;
        v11 = v39;
        id v14 = 0;
        v13 = v37;
        if (v4) {
          v4[2](v4, 0, v31);
        }
      }
      else
      {
        id v35 = [objc_alloc((Class)IDSPinnedIdentity) initWithIdentityBlob:v30];
        v36 = +[IDSFoundationLog IDSPinnedIdentity];
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v35;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Successfully created identity to pin. { pinnedIdentity: %@ }", buf, 0xCu);
        }

        v8 = v38;
        id v14 = 0;
        if (v4) {
          ((void (**)(id, id, id))v4)[2](v4, v35, 0);
        }

        v11 = v39;
        v13 = v37;
      }
    }
    else
    {
      v33 = +[IDSFoundationLog IDSPinnedIdentity];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100720608(v26);
      }

      v13 = v37;
      v8 = v38;
      id v14 = 0;
      if (!v4) {
        goto LABEL_41;
      }
      id v31 = +[NSError errorWithDomain:@"IDSPinnedIdentityError" code:1 userInfo:0];
      v4[2](v4, 0, v31);
    }

LABEL_41:
    goto LABEL_42;
  }
  v7 = +[IDSFoundationLog IDSPinnedIdentity];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1007205A0();
  }

  if (v4)
  {
    v8 = +[NSError errorWithDomain:@"IDSPinnedIdentityError" code:5 userInfo:0];
    v4[2](v4, 0, v8);
LABEL_45:
  }
}

- (void)pinIdentityBlob:(id)a3 withCompletion:(id)a4
{
  unsigned int v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v19 = 0;
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v19];

  id v9 = v19;
  if (v9)
  {
    v10 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1007207E4();
    }

    if (v6) {
      v6[2](v6, v9);
    }
    goto LABEL_25;
  }
  if (!v8)
  {
    v15 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100720748();
    }

    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v16 = 2;
LABEL_24:
    id v18 = +[NSError errorWithDomain:@"IDSPinnedIdentityError" code:v16 userInfo:0];
    v6[2](v6, v18);

    goto LABEL_25;
  }
  v11 = [v8 pushToken];

  if (!v11)
  {
    id v17 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10072077C();
    }

    if (!v6) {
      goto LABEL_25;
    }
    uint64_t v16 = 3;
    goto LABEL_24;
  }
  v12 = [v8 pinnedIdentityMetadatas];

  v13 = +[IDSFoundationLog IDSPinnedIdentity];
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Identities to pin: %@", buf, 0xCu);
    }

    [(IDSPinnedIdentityController *)self _persistIdentity:v8];
    v6[2](v6, 0);
    goto LABEL_25;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1007207B0();
  }

  if (v6)
  {
    uint64_t v16 = 4;
    goto LABEL_24;
  }
LABEL_25:
}

- (void)_persistIdentity:(id)a3
{
  identityPersister = self->_identityPersister;
  id v4 = a3;
  id v6 = [v4 pinnedIdentityMetadatas];
  id v5 = [v4 pushToken];

  [(IDSPersistentMap *)identityPersister setObject:v6 forKey:v5];
}

- (BOOL)foundPersistedIdentityForEndpoint:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 pushToken];
  id v9 = [(IDSPersistentMap *)self->_identityPersister objectForKey:v8];
  v10 = v9;
  if (v9)
  {
    v38 = v8;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v40;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v39 + 1) + 8 * v15);
        id v17 = [v16 service];
        unsigned __int8 v18 = [v17 isEqualToString:v7];

        if (v18) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v39 objects:v47 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v19 = v16;

      if (!v19) {
        goto LABEL_19;
      }
      id v20 = [v6 publicDeviceIdentityContainer];
      uint64_t v21 = [v20 ngmPublicDeviceIdentity];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v23 = [v6 publicDeviceIdentityContainer];
        id v24 = [v23 ngmPublicDeviceIdentity];
        v25 = [v19 identity];
        unsigned __int8 v26 = [v24 isIdenticalIdentityTo:v25];

        if ((v26 & 1) == 0) {
          goto LABEL_14;
        }
      }
      else
      {
        v32 = [v6 serializedNGMDeviceIdentity];
        v33 = [v19 identity];
        unsigned __int8 v34 = [v32 isEqualToData:v33];

        if ((v34 & 1) == 0)
        {
LABEL_14:
          uint64_t v27 = +[IDSFoundationLog IDSPinnedIdentity];
          v8 = v38;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_100720938(v19, v6);
          }

          if ((_os_feature_enabled_impl() & 1) == 0)
          {
            v28 = +[IDSFoundationLog IDSPinnedIdentity];
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Hit failure, but enforcement FF is disabled. Returning YES.", buf, 2u);
            }
            goto LABEL_37;
          }
          goto LABEL_23;
        }
      }
      v28 = +[IDSFoundationLog IDSPinnedIdentity];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v35 = [v19 identity];
        v36 = [v6 serializedNGMDeviceIdentity];
        *(_DWORD *)buf = 138412546;
        long long v44 = v35;
        __int16 v45 = 2112;
        v46 = v36;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Pinned identity matches endpoint identity. { pinnedIdentity: %@, endointIdentity: %@ }", buf, 0x16u);
      }
      v8 = v38;
      goto LABEL_37;
    }
LABEL_10:

LABEL_19:
    v29 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_1007208D0();
    }

    v8 = v38;
    if (_os_feature_enabled_impl())
    {
      id v19 = 0;
LABEL_23:
      BOOL v30 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v28 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Hit failure, but enforcement FF is disabled. Returning YES.", buf, 2u);
    }
    id v19 = 0;
LABEL_37:

LABEL_38:
    BOOL v30 = 1;
    goto LABEL_39;
  }
  id v31 = +[IDSFoundationLog IDSPinnedIdentity];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_10072084C();
  }

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v19 = +[IDSFoundationLog IDSPinnedIdentity];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Hit failure, but enforcement FF is disabled. Returning YES.", buf, 2u);
    }
    goto LABEL_38;
  }
  BOOL v30 = 0;
LABEL_40:

  return v30;
}

- (void)fetchAllPinnedIdentitiesWithCompletion:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(IDSPersistentMap *)self->_identityPersister allKeys];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        id v12 = objc_alloc_init((Class)IDSPinnedIdentities);
        [v12 setPushToken:v11];
        id v13 = [(IDSPersistentMap *)self->_identityPersister objectForKey:v11];
        [v12 setPinnedIdentityMetadatas:v13];

        [v5 addObject:v12];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v4[2](v4, v5, 0);
}

- (void)clearAllPinnedIdentities
{
}

- (NSData)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (IDSPersistentMap)identityPersister
{
  return self->_identityPersister;
}

- (void)setIdentityPersister:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityPersister, 0);

  objc_storeStrong((id *)&self->_identity, 0);
}

@end