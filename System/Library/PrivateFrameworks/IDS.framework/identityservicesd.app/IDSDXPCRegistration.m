@interface IDSDXPCRegistration
- (BOOL)onlyAllowReads;
- (IDSCTAdapter)ctAdapter;
- (IDSDAccountController)accountController;
- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4;
- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4 userStore:(id)a5 accountController:(id)a6 ctAdapter:(id)a7;
- (IDSUserStore)userStore;
- (OS_dispatch_queue)queue;
- (void)constructRAResponseDictionaryForServices:(id)a3 completionHandler:(id)a4;
- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4;
- (void)requestSelectedSubscriptionsWithCompletion:(id)a3;
- (void)requestUnselectedTemporaryPhoneAliasesWithCompletion:(id)a3;
- (void)selectSubscription:(id)a3 withCompletion:(id)a4;
- (void)setAccountController:(id)a3;
- (void)setCtAdapter:(id)a3;
- (void)setOnlyAllowReads:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4;
- (void)setUserStore:(id)a3;
- (void)unselectSubscription:(id)a3 withCompletion:(id)a4;
@end

@implementation IDSDXPCRegistration

- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4 userStore:(id)a5 accountController:(id)a6 ctAdapter:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v28.receiver = self;
  v28.super_class = (Class)IDSDXPCRegistration;
  v18 = [(IDSDXPCRegistration *)&v28 init];
  if (!v18)
  {
LABEL_12:
    v22 = v18;
    goto LABEL_13;
  }
  id v27 = v15;
  unsigned __int8 v19 = [v14 hasEntitlement:kIDSPhoneNumberAuthenticationEntitlement];
  unsigned __int8 v20 = [v14 hasEntitlement:@"com.apple.private.imcore.spi.database-access"];
  if (v19 & 1) != 0 || (v20)
  {
    id v26 = v13;
    char v23 = v19 | v20 ^ 1;
    if ((v23 & 1) == 0)
    {
      v24 = +[IMRGLog sms];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v14;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Allowing bypass entitlement to read from IDSXPCRegistration {connection: %@}", buf, 0xCu);
      }
    }
    objc_storeStrong((id *)&v18->_queue, a3);
    v18->_onlyAllowReads = v23 ^ 1;
    objc_storeStrong((id *)&v18->_userStore, a5);
    objc_storeStrong((id *)&v18->_accountController, a6);
    objc_storeStrong((id *)&v18->_ctAdapter, a7);
    id v13 = v26;
    id v15 = v27;
    goto LABEL_12;
  }
  v21 = +[IMRGLog sms];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v14;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing creation of IDSDXPCRegistration collaborator {connection: %@}", buf, 0xCu);
  }

  v22 = 0;
  id v15 = v27;
LABEL_13:

  return v22;
}

- (IDSDXPCRegistration)initWithQueue:(id)a3 connection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[IDSDaemon sharedInstance];
  v9 = [v8 registrationConductor];
  v10 = [v9 userStore];
  v11 = +[IDSDAccountController sharedInstance];
  v12 = +[IDSCTAdapter sharedInstance];
  id v13 = [(IDSDXPCRegistration *)self initWithQueue:v7 connection:v6 userStore:v10 accountController:v11 ctAdapter:v12];

  return v13;
}

- (void)requestSelectedSubscriptionsWithCompletion:(id)a3
{
  v3 = (void (**)(id, void, uint64_t))a3;
  v4 = +[FTUserConfiguration sharedInstance];
  v5 = [v4 selectedPhoneNumberRegistrationSubscriptionLabels];

  id v6 = +[IDSCTAdapter sharedInstance];
  id v14 = 0;
  id v7 = [v6 currentSIMsWithError:&v14];
  id v8 = v14;

  if (v8)
  {
    v9 = +[IMRGLog sms];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Unable to fetch sims -- returning nil {simFetchError: %@}", buf, 0xCu);
    }

    uint64_t v10 = IDSPhoneSubscriptionSelectorErrorDomain;
    NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
    id v22 = v8;
    v11 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    uint64_t v12 = +[NSError errorWithDomain:v10 code:100 userInfo:v11];
    v3[2](v3, 0, v12);

    v3 = (void (**)(id, void, uint64_t))v12;
  }
  else
  {
    v11 = sub_100349D18(v7, v5);
    id v13 = +[IMRGLog sms];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      unsigned __int8 v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Client requested selected subscriptions {subscriptions: %@, selectedLabelIDs: %@, SIMs: %@}", buf, 0x20u);
    }

    ((void (**)(id, void *, uint64_t))v3)[2](v3, v11, 0);
  }
}

- (void)requestUnselectedTemporaryPhoneAliasesWithCompletion:(id)a3
{
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(IDSDXPCRegistration *)self accountController];
  unsigned int v6 = [v5 hasiCloudAccount];

  id v7 = [(IDSDXPCRegistration *)self ctAdapter];
  if ([v7 isAnySIMInserted])
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = [(IDSDXPCRegistration *)self userStore];
    uint64_t v10 = [v9 usersWithRealm:0];
    BOOL v8 = [v10 count] != 0;
  }
  if (v6 & v8)
  {
    v11 = [(IDSDXPCRegistration *)self userStore];
    uint64_t v12 = [v11 usersWithRealm:2];
    objc_msgSend(v12, "__imArrayByFilteringWithBlock:", &stru_100989A38);
    id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10034A224;
    v19[3] = &unk_100989A60;
    v19[4] = self;
    id v14 = [(__CFString *)v13 __imArrayByApplyingBlock:v19];
    id v15 = +[IMRGLog sms];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v14;
      __int16 v22 = 2112;
      CFStringRef v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Client requested unselected temporary phone aliases {descriptions: %@, users: %@}", buf, 0x16u);
    }

    v4[2](v4, v14, 0);
  }
  else
  {
    id v16 = +[IMRGLog sms];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v17 = @"NO";
      if (v6) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      if (v8) {
        CFStringRef v17 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v18;
      __int16 v22 = 2112;
      CFStringRef v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Client requested unselected temporary phone aliases, but not in state where home number is allowed {isiCloudSignedIn: %@, allowHomeNumber: %@}", buf, 0x16u);
    }

    v4[2](v4, &__NSArray0__struct, 0);
  }
}

- (void)selectSubscription:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![(IDSDXPCRegistration *)self onlyAllowReads])
  {
    uint64_t v10 = +[IDSCTAdapter sharedInstance];
    id v27 = 0;
    v11 = [v10 currentSIMsWithError:&v27];
    id v9 = v27;

    if (v9)
    {
      uint64_t v12 = +[IMRGLog sms];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to fetch sims -- returning nil {simFetchError: %@}", buf, 0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v28 = NSUnderlyingErrorKey;
      id v29 = v9;
      id v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v15 = +[NSError errorWithDomain:v13 code:100 userInfo:v14];
      v7[2](v7, 0, v15);
      goto LABEL_14;
    }
    id v14 = sub_10034A6C0(v11, v6);
    id v16 = objc_alloc((Class)NSMutableSet);
    CFStringRef v17 = +[FTUserConfiguration sharedInstance];
    CFStringRef v18 = [v17 selectedPhoneNumberRegistrationSubscriptionLabels];
    id v15 = [v16 initWithArray:v18];

    [v15 addObject:v14];
    __int16 v19 = +[FTUserConfiguration sharedInstance];
    if (([v19 isDeviceInDualPhoneIdentityMode] & 1) == 0)
    {
      unsigned __int8 v20 = +[FTUserConfiguration sharedInstance];
      unsigned int v21 = [v20 isDeviceInManualPhoneSelectionMode];

      if (!v21)
      {
LABEL_13:
        __int16 v22 = +[IDSRegistrationReasonTracker sharedInstance];
        [v22 setPNRReason:5 forUserUniqueIdentifier:v14];

        CFStringRef v23 = +[FTUserConfiguration sharedInstance];
        v24 = [v15 allObjects];
        [v23 setSelectedPhoneNumberRegistrationSubscriptionLabels:v24];

        v25 = [v15 allObjects];
        id v26 = sub_100349D18(v11, v25);

        ((void (**)(id, void *, id))v7)[2](v7, v26, 0);
LABEL_14:

        goto LABEL_15;
      }
      __int16 v19 = +[FTUserConfiguration sharedInstance];
      [v19 setIsDeviceInManualPhoneSelectionMode:0];
    }

    goto LABEL_13;
  }
  BOOL v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
  }

  id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
  v7[2](v7, 0, v9);
LABEL_15:
}

- (void)unselectSubscription:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if (![(IDSDXPCRegistration *)self onlyAllowReads])
  {
    uint64_t v10 = +[IDSCTAdapter sharedInstance];
    id v26 = 0;
    v11 = [v10 currentSIMsWithError:&v26];
    id v9 = v26;

    if (v9)
    {
      uint64_t v12 = +[IMRGLog sms];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to fetch sims -- returning nil {simFetchError: %@}", buf, 0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v27 = NSUnderlyingErrorKey;
      id v28 = v9;
      id v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      id v15 = +[NSError errorWithDomain:v13 code:100 userInfo:v14];
      v7[2](v7, 0, v15);
      goto LABEL_14;
    }
    id v14 = sub_10034A6C0(v11, v6);
    id v16 = objc_alloc((Class)NSMutableSet);
    CFStringRef v17 = +[FTUserConfiguration sharedInstance];
    CFStringRef v18 = [v17 selectedPhoneNumberRegistrationSubscriptionLabels];
    id v15 = [v16 initWithArray:v18];

    [v15 removeObject:v14];
    __int16 v19 = +[FTUserConfiguration sharedInstance];
    if (([v19 isDeviceInDualPhoneIdentityMode] & 1) == 0)
    {
      unsigned __int8 v20 = +[FTUserConfiguration sharedInstance];
      unsigned __int8 v21 = [v20 isDeviceInManualPhoneSelectionMode];

      if (v21)
      {
LABEL_13:
        __int16 v22 = +[FTUserConfiguration sharedInstance];
        CFStringRef v23 = [v15 allObjects];
        [v22 setSelectedPhoneNumberRegistrationSubscriptionLabels:v23];

        v24 = [v15 allObjects];
        v25 = sub_100349D18(v11, v24);

        ((void (**)(id, void *, id))v7)[2](v7, v25, 0);
LABEL_14:

        goto LABEL_15;
      }
      __int16 v19 = +[FTUserConfiguration sharedInstance];
      [v19 setIsDeviceInManualPhoneSelectionMode:1];
    }

    goto LABEL_13;
  }
  BOOL v8 = +[IMRGLog sms];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
  }

  id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
  v7[2](v7, 0, v9);
LABEL_15:
}

- (void)setSelectedSubscriptions:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(IDSDXPCRegistration *)self onlyAllowReads])
  {
    BOOL v8 = +[IMRGLog sms];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
    v7[2](v7, 0, v9);
  }
  else
  {
    uint64_t v10 = +[IDSCTAdapter sharedInstance];
    id v39 = 0;
    v11 = [v10 currentSIMsWithError:&v39];
    id v9 = v39;

    if (v9)
    {
      uint64_t v12 = +[IMRGLog sms];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to fetch sims -- returning nil {simFetchError: %@}", buf, 0xCu);
      }

      uint64_t v13 = IDSPhoneSubscriptionSelectorErrorDomain;
      NSErrorUserInfoKey v41 = NSUnderlyingErrorKey;
      id v42 = v9;
      id v14 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      id v15 = +[NSError errorWithDomain:v13 code:100 userInfo:v14];
      v7[2](v7, 0, v15);
    }
    else
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10034AF94;
      v37[3] = &unk_100989A88;
      id v16 = v11;
      id v38 = v16;
      CFStringRef v17 = objc_msgSend(v6, "__imArrayByApplyingBlock:", v37);
      CFStringRef v18 = v17;
      if (v17 && (id v19 = [v17 count], v19 == objc_msgSend(v6, "count")))
      {
        id v31 = v16;
        v32 = v18;
        unsigned __int8 v20 = objc_msgSend(v18, "__imSetFromArray");
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v21 = [v20 countByEnumeratingWithState:&v33 objects:v40 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v34;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              id v26 = +[IDSRegistrationReasonTracker sharedInstance];
              [v26 setPNRReason:5 forUserUniqueIdentifier:v25];
            }
            id v22 = [v20 countByEnumeratingWithState:&v33 objects:v40 count:16];
          }
          while (v22);
        }
        NSErrorUserInfoKey v27 = +[FTUserConfiguration sharedInstance];
        id v28 = [v20 allObjects];
        [v27 setSelectedPhoneNumberRegistrationSubscriptionLabels:v28];

        id v29 = [v20 allObjects];
        id v30 = sub_100349D18(v31, v29);

        ((void (**)(id, void *, id))v7)[2](v7, v30, 0);
        CFStringRef v18 = v32;
      }
      else
      {
        unsigned __int8 v20 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:200 userInfo:0];
        v7[2](v7, 0, v20);
      }

      id v14 = v38;
    }
  }
}

- (void)removeTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(IDSDXPCRegistration *)self onlyAllowReads])
  {
    BOOL v8 = +[IMRGLog sms];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
    v7[2](v7, 0, v9);
    goto LABEL_22;
  }
  uint64_t v23 = v7;
  uint64_t v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Told to remove temporary URI { uri: %@ }", buf, 0xCu);
  }

  v11 = [(IDSDXPCRegistration *)self userStore];
  uint64_t v12 = [v11 usersWithRealm:2];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_20:
    id v18 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:200 userInfo:0];
    id v7 = v23;
    v23[2](v23, 0, v18);
    goto LABEL_21;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v25;
LABEL_9:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v25 != v15) {
      objc_enumerationMutation(v9);
    }
    CFStringRef v17 = *(void **)(*((void *)&v24 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = [v18 phoneNumber];
    unsigned __int8 v20 = [v6 unprefixedURI];
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if (v21) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_20;
  }
  id v22 = [(IDSDXPCRegistration *)self userStore];
  [v22 forceRemoveUser:v18 silently:1];

  id v7 = v23;
  v23[2](v23, 1, 0);
LABEL_21:

LABEL_22:
}

- (void)disableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(IDSDXPCRegistration *)self onlyAllowReads])
  {
    BOOL v8 = +[IMRGLog sms];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
    v7[2](v7, 0, v9);
    goto LABEL_25;
  }
  id v29 = v7;
  uint64_t v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Told to disable temporary URI { uri: %@ }", buf, 0xCu);
  }

  v11 = [(IDSDXPCRegistration *)self userStore];
  uint64_t v12 = [v11 usersWithRealm:2];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_21:
    id v18 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:200 userInfo:0];
    id v7 = v29;
    v29[2](v29, 0, v18);
    goto LABEL_24;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v31;
LABEL_9:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(v9);
    }
    CFStringRef v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = [v18 phoneNumber];
    unsigned __int8 v20 = [v6 unprefixedURI];
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if (v21) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_21;
  }
  id v22 = [(IDSDXPCRegistration *)self userStore];
  uint64_t v23 = [v22 propertiesForUser:v18];
  long long v24 = v23;
  id v7 = v29;
  if (v23) {
    long long v25 = v23;
  }
  else {
    long long v25 = objc_alloc_init(IDSUserProperties);
  }
  long long v26 = v25;

  long long v27 = [(IDSUserProperties *)v26 propsByupdatingDisableRegistration:1];

  id v28 = [(IDSDXPCRegistration *)self userStore];
  [v28 setProperties:v27 forUser:v18];

  v29[2](v29, 1, 0);
LABEL_24:

LABEL_25:
}

- (void)enableTemporaryPhoneAlias:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  if ([(IDSDXPCRegistration *)self onlyAllowReads])
  {
    BOOL v8 = +[IMRGLog sms];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
    }

    id v9 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:400 userInfo:0];
    v7[2](v7, 0, v9);
    goto LABEL_25;
  }
  id v29 = v7;
  uint64_t v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Told to enable temporary URI { uri: %@ }", buf, 0xCu);
  }

  v11 = [(IDSDXPCRegistration *)self userStore];
  uint64_t v12 = [v11 usersWithRealm:2];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = v12;
  id v13 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v13)
  {
LABEL_17:

LABEL_21:
    id v18 = +[NSError errorWithDomain:IDSPhoneSubscriptionSelectorErrorDomain code:200 userInfo:0];
    id v7 = v29;
    v29[2](v29, 0, v18);
    goto LABEL_24;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v31;
LABEL_9:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v31 != v15) {
      objc_enumerationMutation(v9);
    }
    CFStringRef v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
    if ([v17 realm] != (id)2) {
      goto LABEL_15;
    }
    id v18 = v17;
    id v19 = [v18 phoneNumber];
    unsigned __int8 v20 = [v6 unprefixedURI];
    unsigned __int8 v21 = [v19 isEqualToString:v20];

    if (v21) {
      break;
    }

LABEL_15:
    if (v14 == (id)++v16)
    {
      id v14 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }

  if (!v18) {
    goto LABEL_21;
  }
  id v22 = [(IDSDXPCRegistration *)self userStore];
  uint64_t v23 = [v22 propertiesForUser:v18];
  long long v24 = v23;
  id v7 = v29;
  if (v23) {
    long long v25 = v23;
  }
  else {
    long long v25 = objc_alloc_init(IDSUserProperties);
  }
  long long v26 = v25;

  long long v27 = [(IDSUserProperties *)v26 propsByupdatingDisableRegistration:0];

  id v28 = [(IDSDXPCRegistration *)self userStore];
  [v28 setProperties:v27 forUser:v18];

  v29[2](v29, 1, 0);
LABEL_24:

LABEL_25:
}

- (void)constructRAResponseDictionaryForServices:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, id))a4;
  id v6 = a3;
  id v7 = +[IDSAccountSync sharedInstance];
  id v8 = [v7 constructRAResponseDictionary:v6];

  v5[2](v5, v8);
}

- (BOOL)onlyAllowReads
{
  return self->_onlyAllowReads;
}

- (void)setOnlyAllowReads:(BOOL)a3
{
  self->_onlyAllowReads = a3;
}

- (IDSUserStore)userStore
{
  return self->_userStore;
}

- (void)setUserStore:(id)a3
{
}

- (IDSDAccountController)accountController
{
  return self->_accountController;
}

- (void)setAccountController:(id)a3
{
}

- (IDSCTAdapter)ctAdapter
{
  return self->_ctAdapter;
}

- (void)setCtAdapter:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_ctAdapter, 0);
  objc_storeStrong((id *)&self->_accountController, 0);

  objc_storeStrong((id *)&self->_userStore, 0);
}

@end