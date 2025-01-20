@interface IDSDXPCFeatureToggler
- (IDSDXPCFeatureToggler)initWithService:(id)a3 queue:(id)a4 connection:(id)a5;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (id)_accountToUse;
- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4;
@end

@implementation IDSDXPCFeatureToggler

- (IDSDXPCFeatureToggler)initWithService:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v11 valueForEntitlement:kIDSRegistrationEntitlement];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v12 isEqualToString:v9]) {
        goto LABEL_19;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && ([v12 BOOLValue]) {
        goto LABEL_19;
      }
    }
LABEL_23:
    v23 = +[IDSFoundationLog FeatureToggler];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Missing IDS Registration entitlement -- failing creation of IDSXPCFeatureToggler collaborator {connection: %@}", buf, 0xCu);
    }

    v22 = 0;
    goto LABEL_26;
  }
  id v28 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v12;
  id v14 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (!v14)
  {

    goto LABEL_23;
  }
  id v15 = v14;
  id v25 = v7;
  v26 = self;
  id v27 = v10;
  char v16 = 0;
  uint64_t v17 = *(void *)v31;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v31 != v17) {
        objc_enumerationMutation(v13);
      }
      v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v19 isEqualToString:v9]) {
        char v16 = 1;
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v15);

  self = v26;
  id v7 = v25;
  a4 = v28;
  if ((v16 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_19:
  v29.receiver = self;
  v29.super_class = (Class)IDSDXPCFeatureToggler;
  v20 = [(IDSDXPCFeatureToggler *)&v29 init];
  p_isa = (id *)&v20->super.isa;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_queue, a4);
    objc_storeStrong(p_isa + 2, v7);
  }
  self = p_isa;
  v22 = self;
LABEL_26:

  return v22;
}

- (id)_accountToUse
{
  v3 = +[IDSDServiceController sharedInstance];
  v4 = [(IDSDXPCFeatureToggler *)self service];
  v5 = [v3 serviceWithIdentifier:v4];

  v6 = +[IDSDAccountController sharedInstance];
  id v7 = [v6 appleIDAccountOnService:v5];

  if (!v7
    || ([v7 primaryRegistration],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 registrationCert],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        !v9))
  {

    id v10 = +[IDSDAccountController sharedInstance];
    id v11 = [v10 registeredAccountsOnService:v5];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v11;
    id v7 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v13 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v12);
          }
          id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          char v16 = objc_msgSend(v15, "primaryRegistration", (void)v19);
          uint64_t v17 = [v16 registrationCert];

          if (v17)
          {
            id v7 = v15;
            goto LABEL_13;
          }
        }
        id v7 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }

  return v7;
}

- (void)retrieveFeatureToggleStateForOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (v6 && ([v6 featureID], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      id v9 = [(IDSDXPCFeatureToggler *)self _accountToUse];
      if (!v9)
      {
        id v10 = +[IDSFeatureToggleRetrievalResult resultWithError:4];
        v7[2](v7, v10);
      }
      [v9 retrieveFeatureToggleStateForOptions:v6 completionBlock:v7];
    }
    else
    {
      id v11 = +[IDSFoundationLog FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100713038();
      }

      id v9 = +[IDSFeatureToggleRetrievalResult resultWithError:1];
      v7[2](v7, v9);
    }
  }
  else
  {
    id v9 = +[IDSFoundationLog FeatureToggler];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100712FF8();
    }
  }
}

- (void)updateFeatureToggleStateWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (v7)
  {
    if (v6 && ([v6 featureID], v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      if ([v6 state] == (id)1 || objc_msgSend(v6, "state") == (id)2)
      {
        id v9 = [(IDSDXPCFeatureToggler *)self _accountToUse];
        if (!v9)
        {
          id v10 = +[IDSFeatureToggleUpdateResult resultWithError:4];
          v7[2](v7, v10);
        }
        [v9 updateFeatureToggleStateWithOptions:v6 completionBlock:v7];
        goto LABEL_14;
      }
      id v11 = +[IDSFoundationLog FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1007130F8(v6, v11);
      }
    }
    else
    {
      id v11 = +[IDSFoundationLog FeatureToggler];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1007130B8();
      }
    }

    id v9 = +[IDSFeatureToggleUpdateResult resultWithError:1];
    v7[2](v7, v9);
    goto LABEL_14;
  }
  id v9 = +[IDSFoundationLog FeatureToggler];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    sub_100713078();
  }
LABEL_14:
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end