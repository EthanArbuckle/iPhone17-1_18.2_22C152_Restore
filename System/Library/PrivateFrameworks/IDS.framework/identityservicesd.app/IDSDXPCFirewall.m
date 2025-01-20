@interface IDSDXPCFirewall
- (IDSDXPCFirewall)initWithService:(id)a3 queue:(id)a4 connection:(id)a5;
- (IMDispatchTimer)processMessageTimer;
- (NSSet)impactedServices;
- (NSString)service;
- (OS_dispatch_queue)queue;
- (id)_firewallStore;
- (unsigned)category;
- (void)addEntries:(id)a3 withCompletion:(id)a4;
- (void)currentDonatedEntries:(id)a3;
- (void)currentEntries:(id)a3;
- (void)impactedServicesForService:(id)a3 withCompletion:(id)a4;
- (void)populateMergeIDForEntries:(id)a3 withCompletion:(id)a4;
- (void)processStoredRemoteIncomingMessagesForCategoryFired;
- (void)recentlyBlockedEntries:(id)a3;
- (void)removeAllDonatedEntries:(id)a3;
- (void)removeAllEntries:(id)a3;
- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4;
- (void)removeEntries:(id)a3 withCompletion:(id)a4;
- (void)replaceEntries:(id)a3 replaceAll:(BOOL)a4 withCompletion:(id)a5;
- (void)scheduleProcessStoredRemoteIncomingMessages;
- (void)setCategory:(unsigned int)a3;
- (void)setImpactedServices:(id)a3;
- (void)setProcessMessageTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setService:(id)a3;
@end

@implementation IDSDXPCFirewall

- (IDSDXPCFirewall)initWithService:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (([v11 hasEntitlement:kIDSFirewallEntitlement] & 1) == 0)
  {
    v24 = +[IDSFoundationLog IDSFirewall];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v11;
      v25 = "Missing IDS Firewall entitlement -- failing creation of IDSDXPCFirewall collaborator {connection: %@}";
      v26 = v24;
      uint32_t v27 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
LABEL_9:

    v23 = 0;
    goto LABEL_10;
  }
  v29.receiver = self;
  v29.super_class = (Class)IDSDXPCFirewall;
  v12 = [(IDSDXPCFirewall *)&v29 init];
  self = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    processMessageTimer = self->_processMessageTimer;
    self->_processMessageTimer = 0;

    objc_storeStrong((id *)&self->_service, a3);
    v14 = +[IDSDServiceController sharedInstance];
    v15 = [v14 serviceWithName:v9];

    if (v15)
    {
      self->_category = [v15 controlCategory];
      id v16 = objc_alloc((Class)NSSet);
      v17 = +[IDSDServiceController sharedInstance];
      v18 = [v17 serviceNameToControlCategoryMap];
      v19 = +[NSNumber numberWithUnsignedInt:self->_category];
      v20 = [v18 objectForKey:v19];
      v21 = (NSSet *)[v16 initWithArray:v20];
      impactedServices = self->_impactedServices;
      self->_impactedServices = v21;

      goto LABEL_5;
    }
    v24 = +[IDSFoundationLog IDSFirewall];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid service name. Could not fetch service properties.";
      v26 = v24;
      uint32_t v27 = 2;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
LABEL_5:
  self = self;
  v23 = self;
LABEL_10:

  return v23;
}

- (id)_firewallStore
{
  return +[IDSFirewallStore sharedInstance];
}

- (void)impactedServicesForService:(id)a3 withCompletion:(id)a4
{
  id v8 = a3;
  id v9 = (void (**)(id, NSSet *, void))a4;
  if (v9)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 71, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    if (v8) {
      goto LABEL_3;
    }
  }
  v24 = +[NSAssertionHandler currentHandler];
  [v24 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 72, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

LABEL_3:
  id v10 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fetching impacted services for service {%@}", buf, 0xCu);
  }

  objc_storeStrong((id *)&self->_service, a3);
  id v11 = +[IDSDServiceController sharedInstance];
  v12 = [v11 serviceWithName:v8];

  if (v12)
  {
    self->_category = [v12 controlCategory];
    id v13 = objc_alloc((Class)NSSet);
    v14 = +[IDSDServiceController sharedInstance];
    v15 = [v14 serviceNameToControlCategoryMap];
    id v16 = +[NSNumber numberWithUnsignedInt:self->_category];
    v17 = [v15 objectForKey:v16];
    v18 = (NSSet *)[v13 initWithArray:v17];
    impactedServices = self->_impactedServices;
    self->_impactedServices = v18;

    v9[2](v9, self->_impactedServices, 0);
  }
  else
  {
    uint64_t v20 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Invalid service name. Could not fetch service properties.";
    v21 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v22 = +[NSError errorWithDomain:v20 code:1 userInfo:v21];

    ((void (**)(id, NSSet *, void *))v9)[2](v9, 0, v22);
  }
}

- (void)addEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 91, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v9 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109378;
    unsigned int v18 = category;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Update to category %u addEntries %@", buf, 0x12u);
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10013B21C;
  v14[3] = &unk_100981C10;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v11 = v8;
  id v12 = v7;
  [(IDSDXPCFirewall *)self populateMergeIDForEntries:v12 withCompletion:v14];
}

- (void)removeEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 109, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013B4C8;
  v12[3] = &unk_100981C10;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(IDSDXPCFirewall *)self populateMergeIDForEntries:v10 withCompletion:v12];
}

- (void)removeDonatedEntries:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 124, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10013B768;
  v12[3] = &unk_100981C10;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  [(IDSDXPCFirewall *)self populateMergeIDForEntries:v10 withCompletion:v12];
}

- (void)replaceEntries:(id)a3 replaceAll:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v10)
  {
    v21 = +[NSAssertionHandler currentHandler];
    [v21 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 139, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v11 = +[IDSFoundationLog IDSFirewall];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      unsigned int category = self->_category;
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = category;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Update to category %u replaceAllEntries %@", buf, 0x12u);
    }

    id v14 = [(IDSDXPCFirewall *)self _firewallStore];
    unsigned __int8 v15 = [v14 removeAllEntriesWithCategory:self->_category];
  }
  else
  {
    if (v12)
    {
      unsigned int v16 = self->_category;
      *(_DWORD *)buf = 67109378;
      unsigned int v28 = v16;
      __int16 v29 = 2112;
      id v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Update to category %u replaceEntries %@", buf, 0x12u);
    }

    id v14 = [(IDSDXPCFirewall *)self _firewallStore];
    unsigned __int8 v15 = [v14 removeEntriesWithCategory:self->_category isDonated:1];
  }
  unsigned __int8 v17 = v15;

  if (v17)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10013BBC0;
    v22[3] = &unk_100981C10;
    v22[4] = self;
    id v23 = v9;
    id v24 = v10;
    [(IDSDXPCFirewall *)self populateMergeIDForEntries:v23 withCompletion:v22];
  }
  else
  {
    uint64_t v18 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    CFStringRef v26 = @"Failed to remove entries from allow list.";
    __int16 v19 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v20 = +[NSError errorWithDomain:v18 code:4 userInfo:v19];

    (*((void (**)(id, void *))v10 + 2))(v10, v20);
  }
}

- (void)currentDonatedEntries:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 170, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching all entries for category %u", buf, 8u);
  }

  id v8 = [(IDSDXPCFirewall *)self _firewallStore];
  id v9 = [v8 getDonatedAllowedEntriesForCategory:self->_category];

  if (v9)
  {
    v5[2](v5, v9, 0);
  }
  else
  {
    uint64_t v10 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Failed to fetch donated entries from allow list";
    id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    BOOL v12 = +[NSError errorWithDomain:v10 code:4 userInfo:v11];

    ((void (**)(id, void *, void *))v5)[2](v5, 0, v12);
  }
}

- (void)currentEntries:(id)a3
{
  v5 = (void (**)(id, void *, void))a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 184, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching all entries for category %u", buf, 8u);
  }

  id v8 = [(IDSDXPCFirewall *)self _firewallStore];
  id v9 = [v8 getAllAllowedEntriesForCategory:self->_category];

  if (v9)
  {
    v5[2](v5, v9, 0);
  }
  else
  {
    uint64_t v10 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Failed to fetch entries from allow list";
    id v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    BOOL v12 = +[NSError errorWithDomain:v10 code:4 userInfo:v11];

    ((void (**)(id, void *, void *))v5)[2](v5, 0, v12);
  }
}

- (void)removeAllDonatedEntries:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 198, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Update to category %u removeAllDonatedEntries", buf, 8u);
  }

  id v8 = [(IDSDXPCFirewall *)self _firewallStore];
  unsigned __int8 v9 = [v8 removeEntriesWithCategory:self->_category isDonated:1];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Failed to remove all donated entries from allow list.";
    BOOL v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v10 = +[NSError errorWithDomain:v11 code:4 userInfo:v12];
  }
  v5[2](v5, v10);
}

- (void)removeAllEntries:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 211, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v17 = category;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Update to category %u removeAllEntries", buf, 8u);
  }

  id v8 = [(IDSDXPCFirewall *)self _firewallStore];
  unsigned __int8 v9 = [v8 removeAllEntriesWithCategory:self->_category];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Failed to remove all entries from allow list.";
    BOOL v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v10 = +[NSError errorWithDomain:v11 code:4 userInfo:v12];
  }
  v5[2](v5, v10);
}

- (void)recentlyBlockedEntries:(id)a3
{
  v5 = (void (**)(id, void *, void *))a3;
  if (!v5)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"IDSDXPCFirewall.m", 224, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  BOOL v6 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    service = self->_service;
    *(_DWORD *)buf = 138412290;
    unsigned int v17 = service;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Fetching recently blocked handles for service {%@}", buf, 0xCu);
  }

  id v8 = [(IDSDXPCFirewall *)self _firewallStore];
  unsigned __int8 v9 = [v8 blockedEntriesForCategory:self->_category];

  if (v9)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
    CFStringRef v15 = @"Failed to get recently blocked entries";
    BOOL v12 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v10 = +[NSError errorWithDomain:v11 code:4 userInfo:v12];
  }
  v5[2](v5, v9, v10);
}

- (void)scheduleProcessStoredRemoteIncomingMessages
{
  processMessageTimer = self->_processMessageTimer;
  if (processMessageTimer)
  {
    [(IMDispatchTimer *)processMessageTimer invalidate];
    v4 = self->_processMessageTimer;
    self->_processMessageTimer = 0;
  }
  v5 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109376;
    unsigned int v13 = category;
    __int16 v14 = 2048;
    uint64_t v15 = 1;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling a process message timer for category %u in: %llu", buf, 0x12u);
  }

  id v7 = objc_alloc((Class)IMDispatchTimer);
  id v8 = im_primary_queue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10013C820;
  v11[3] = &unk_100980598;
  v11[4] = self;
  unsigned __int8 v9 = (IMDispatchTimer *)[v7 initWithQueue:v8 interval:1 repeats:0 handlerBlock:v11];
  uint64_t v10 = self->_processMessageTimer;
  self->_processMessageTimer = v9;
}

- (void)processStoredRemoteIncomingMessagesForCategoryFired
{
  [(IMDispatchTimer *)self->_processMessageTimer invalidate];
  processMessageTimer = self->_processMessageTimer;
  self->_processMessageTimer = 0;

  v4 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = category;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Process message timer fired for category %u", buf, 8u);
  }

  BOOL v6 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013C94C;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_async(v6, block);
}

- (void)populateMergeIDForEntries:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v62 = a4;
  id v64 = objc_alloc_init((Class)NSMutableArray);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v74;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v74 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v73 + 1) + 8 * (void)v11);
        unsigned int v13 = [v12 mergeID];
        if (v13) {
          goto LABEL_7;
        }
        uint64_t v14 = [v12 uri];
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          unsigned int v16 = [v12 uri];
          unsigned int v17 = [v16 prefixedURI];

          if (v17)
          {
            unsigned int v13 = [v12 uri];
            [v64 addObject:v13];
LABEL_7:
          }
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v18 = [v7 countByEnumeratingWithState:&v73 objects:v88 count:16];
      id v9 = v18;
    }
    while (v18);
  }

  __int16 v19 = +[IDSFoundationLog IDSFirewall];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int category = self->_category;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v81 = category;
    *(_WORD *)&v81[4] = 2112;
    *(void *)&v81[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Update to category %u populateMergeIDForEntries %@", buf, 0x12u);
  }

  v21 = +[IDSDAccountController sharedInstance];
  v22 = +[IDSDServiceController sharedInstance];
  id v23 = [v22 serviceWithIdentifier:self->_service];
  id v24 = [v21 registeredAccountsOnService:v23];

  NSErrorUserInfoKey v25 = +[IDSQueryUtilities accountToQueryFrom:v24 fromURI:0 destinationURIs:&__NSArray0__struct allowLocalAccount:0];
  CFStringRef v26 = v25;
  if (v25)
  {
    v61 = v24;
    uint32_t v27 = [v25 primaryRegistration];
    [v27 registrationCert];
    __int16 v29 = v28 = self;

    id v30 = +[IDSQueryUtilities prefixedAliasStringToQueryFrom:v26 withPreferredFromURI:0];
    id v31 = v28;
    v32 = +[IDSURI URIWithPrefixedURI:v30 withServiceLoggingHint:v28->_service];

    v33 = +[IDSFoundationLog IDSFirewall];
    BOOL v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v32 && v29)
    {
      v58 = v29;
      v59 = v26;
      if (v34)
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v81 = v64;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Checking cache first to populate mergeIDs for handles {%@}", buf, 0xCu);
      }

      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v60 = v7;
      id obj = v7;
      id v35 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v70;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v70 != v37) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v69 + 1) + 8 * i);
            v40 = +[IDSPeerIDManager sharedInstance];
            v41 = [v39 uri];
            v42 = [v40 senderCorrelationIdentifierForURI:v41 fromURI:v32 service:v31->_service];

            if (v42)
            {
              [v39 setMergeID:v42];
              v43 = [v39 uri];
              [v64 removeObject:v43];
            }
          }
          id v36 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
        }
        while (v36);
      }

      if ([v64 count])
      {
        v44 = +[IDSFoundationLog IDSFirewall];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v81 = v64;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Still need to query handles {%@}", buf, 0xCu);
        }

        v45 = +[IDSPeerIDManager sharedInstance];
        service = v31->_service;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_10013D1A8;
        v65[3] = &unk_100983698;
        id v66 = v64;
        id v67 = obj;
        v47 = v62;
        id v68 = v62;
        LOBYTE(v57) = 0;
        __int16 v29 = v58;
        [v45 startQueryForURIs:v66 fromIdentity:v58 fromURI:v32 fromService:service forSending:0 forRefresh:1 isForced:v57 reason:@"FirewallPopulate" completionBlock:v65];

        id v7 = v60;
        id v24 = v61;
        CFStringRef v26 = v59;
      }
      else
      {
        v47 = v62;
        (*((void (**)(id, void))v62 + 2))(v62, 0);

        id v7 = v60;
        id v24 = v61;
        __int16 v29 = v58;
        CFStringRef v26 = v59;
      }
    }
    else
    {
      if (v34)
      {
        CFStringRef v52 = @"NO";
        v53 = v28->_service;
        *(void *)v81 = "-[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]";
        *(_DWORD *)buf = 136315906;
        if (v29) {
          CFStringRef v52 = @"YES";
        }
        *(_WORD *)&v81[8] = 2112;
        *(void *)&v81[10] = v53;
        __int16 v82 = 2112;
        v83 = v32;
        __int16 v84 = 2112;
        CFStringRef v85 = v52;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s: No registered account found for service %@. localURI {%@} cert {%@}", buf, 0x2Au);
      }

      uint64_t v54 = IDSFirewallErrorDomain;
      NSErrorUserInfoKey v78 = NSLocalizedDescriptionKey;
      CFStringRef v79 = @"Failed to query for merge id due to nil local uri or cert";
      v55 = +[NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
      v56 = +[NSError errorWithDomain:v54 code:6 userInfo:v55];

      v47 = v62;
      (*((void (**)(id, void *))v62 + 2))(v62, v56);

      id v24 = v61;
    }
  }
  else
  {
    v48 = +[IDSFoundationLog IDSFirewall];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = self->_service;
      *(_DWORD *)buf = 136315394;
      *(void *)v81 = "-[IDSDXPCFirewall populateMergeIDForEntries:withCompletion:]";
      *(_WORD *)&v81[8] = 2112;
      *(void *)&v81[10] = v49;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s: No account found for service %@.", buf, 0x16u);
    }

    uint64_t v50 = IDSFirewallErrorDomain;
    NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
    CFStringRef v87 = @"Failed to query for merge id as there was no account found";
    v51 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
    __int16 v29 = +[NSError errorWithDomain:v50 code:6 userInfo:v51];

    v47 = v62;
    (*((void (**)(id, void *))v62 + 2))(v62, v29);
  }
}

- (unsigned)category
{
  return self->_category;
}

- (void)setCategory:(unsigned int)a3
{
  self->_unsigned int category = a3;
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSSet)impactedServices
{
  return self->_impactedServices;
}

- (void)setImpactedServices:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (IMDispatchTimer)processMessageTimer
{
  return self->_processMessageTimer;
}

- (void)setProcessMessageTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMessageTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_impactedServices, 0);

  objc_storeStrong((id *)&self->_service, 0);
}

@end