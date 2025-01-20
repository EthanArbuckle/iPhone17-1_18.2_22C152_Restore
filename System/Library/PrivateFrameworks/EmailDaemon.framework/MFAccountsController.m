@interface MFAccountsController
+ (id)log;
- (EFCancelable)focusObservationToken;
- (EFScheduler)scheduler;
- (EMFocus)currentFocus;
- (MFAccountsController)initWithFocusController:(id)a3;
- (MFMailAccountsProvider)accountsProvider;
- (MFMailboxProvider)mailboxProvider;
- (void)_gatherStatisticsWithAccounts:(id)a3;
- (void)_resetAccounts;
- (void)currentFocusChanged:(id)a3;
- (void)resetAccounts;
- (void)resetAccountsSynchronouslyOnMainThread;
- (void)setCurrentFocus:(id)a3;
- (void)setFocusObservationToken:(id)a3;
- (void)setScheduler:(id)a3;
@end

@implementation MFAccountsController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FE58;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016BA00 != -1) {
    dispatch_once(&qword_10016BA00, block);
  }
  v2 = (void *)qword_10016B9F8;

  return v2;
}

- (MFAccountsController)initWithFocusController:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MFAccountsController;
  v5 = [(MFAccountsController *)&v17 init];
  if (v5)
  {
    v6 = objc_alloc_init(MFMailAccountsProvider);
    accountsProvider = v5->_accountsProvider;
    v5->_accountsProvider = v6;

    v8 = (MFMailboxProvider *)[objc_alloc((Class)MFMailboxProvider) initWithAccountsProvider:v5->_accountsProvider];
    mailboxProvider = v5->_mailboxProvider;
    v5->_mailboxProvider = v8;

    v5->_currentFocusLock._os_unfair_lock_opaque = 0;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = +[EFScheduler serialDispatchQueueSchedulerWithName:v11 qualityOfService:25];
    scheduler = v5->_scheduler;
    v5->_scheduler = (EFScheduler *)v12;

    uint64_t v14 = [v4 addObserver:v5 currentFocus:&v5->_currentFocus];
    focusObservationToken = v5->_focusObservationToken;
    v5->_focusObservationToken = (EFCancelable *)v14;
  }
  return v5;
}

- (void)resetAccountsSynchronouslyOnMainThread
{
}

- (void)resetAccounts
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000500CC;
  v3[3] = &unk_100139C48;
  v3[4] = self;
  v2 = +[EFScheduler mainThreadScheduler];
  [v2 performBlock:v3];
}

- (void)_resetAccounts
{
  v3 = self;
  if (pthread_main_np() != 1)
  {
    v41 = +[NSAssertionHandler currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"MFAccountsController.m" lineNumber:91 description:@"Current thread must be main"];

    v3 = self;
  }
  id v4 = [(MFAccountsController *)v3 mailboxProvider];
  [v4 invalidateMailboxes];

  v5 = +[MFAccountsController log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reloading accounts", buf, 2u);
  }

  +[MailAccount reloadAccounts];
  +[DeliveryAccount reloadDeliveryAccounts];
  v46 = [(MFAccountsController *)self accountsProvider];
  os_unfair_lock_lock(&self->_currentFocusLock);
  v6 = self->_currentFocus;
  os_unfair_lock_unlock(&self->_currentFocusLock);
  v44 = v6;
  v7 = +[MailAccount mailAccounts];
  v47 = [v46 reloadWithMailAccounts:v7 currentFocus:v6];

  v8 = [v47 first];
  v45 = [v8 mailAccounts];

  if (v45)
  {
    v9 = [v46 mailAccounts];
    id v42 = v45;
    id v43 = v9;
    v10 = objc_msgSend(v42, "ef_mapSelector:", "uniqueID");
    v51 = +[NSSet setWithArray:v10];

    v11 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v43 count]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = v43;
    id v12 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v61;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v61 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v16 = [v15 uniqueID];
          [v11 setObject:v15 forKey:v16];
        }
        id v12 = [obj countByEnumeratingWithState:&v60 objects:buf count:16];
      }
      while (v12);
    }

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v49 = v42;
    id v17 = [v49 countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v57;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v57 != v18) {
            objc_enumerationMutation(v49);
          }
          v20 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
          v21 = [v20 uniqueID];
          v22 = [v11 objectForKey:v21];

          v23 = +[MFInvocationQueue sharedInvocationQueue];
          if (v22) {
            +[MFMonitoredInvocation mf_invocationWithSelector:"transferNotificationSessionToAccount:" target:v20 object:v22];
          }
          else {
          v24 = +[MFMonitoredInvocation mf_invocationWithSelector:"stopListeningForNotifications" target:v20];
          }
          [v23 addInvocation:v24];
        }
        id v17 = [v49 countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v17);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v25 = obj;
    id v26 = [v25 countByEnumeratingWithState:&v52 objects:v66 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v53;
      do
      {
        for (k = 0; k != v26; k = (char *)k + 1)
        {
          if (*(void *)v53 != v27) {
            objc_enumerationMutation(v25);
          }
          v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
          v30 = [v29 uniqueID];
          if (([v51 containsObject:v30] & 1) == 0)
          {
            unsigned int v31 = [v29 canFetch];

            if (!v31) {
              continue;
            }
            v30 = +[MFInvocationQueue sharedInvocationQueue];
            v32 = +[MFMonitoredInvocation mf_invocationWithSelector:"startListeningForNotifications" target:v29];
            [v30 addInvocation:v32];
          }
        }
        id v26 = [v25 countByEnumeratingWithState:&v52 objects:v66 count:16];
      }
      while (v26);
    }
  }
  v33 = [v46 mailAccounts];
  [(MFAccountsController *)self _gatherStatisticsWithAccounts:v33];

  v64[0] = ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers;
  v34 = [v47 first];
  v35 = [v34 displayedAccountsIdentifiers];
  v65[0] = v35;
  v64[1] = ECMailAccountsDidChangeNotificationKeyAccountIdentifiers;
  v36 = [v47 second];
  v37 = [v36 displayedAccountsIdentifiers];
  v65[1] = v37;
  v38 = +[NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:2];

  v39 = +[NSNotificationCenter defaultCenter];
  [v39 postNotificationName:ECMailAccountsDidChangeNotification object:self userInfo:v38];

  v40 = +[NSNotificationCenter defaultCenter];
  [v40 postNotificationName:MFMailComposeControllerShouldReloadAccounts object:self];
}

- (void)_gatherStatisticsWithAccounts:(id)a3
{
  id v3 = a3;
  id v4 = +[EFScheduler globalAsyncScheduler];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100050A10;
  v6[3] = &unk_100139C48;
  id v5 = v3;
  id v7 = v5;
  [v4 performBlock:v6];
}

- (void)currentFocusChanged:(id)a3
{
  id v5 = a3;
  v6 = +[MFAccountsController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_msgSend(v5, "ef_publicDescription");
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current focus has changed %{public}@", buf, 0xCu);
  }
  os_unfair_lock_lock(&self->_currentFocusLock);
  v8 = self->_currentFocus;
  objc_storeStrong((id *)&self->_currentFocus, a3);
  os_unfair_lock_unlock(&self->_currentFocusLock);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100050FCC;
  v12[3] = &unk_10013ABC8;
  v9 = v8;
  uint64_t v13 = v9;
  id v10 = v5;
  id v14 = v10;
  v15 = self;
  v11 = +[EFScheduler mainThreadScheduler];
  [v11 performBlock:v12];
}

- (MFMailAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (MFMailboxProvider)mailboxProvider
{
  return self->_mailboxProvider;
}

- (EFScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_mailboxProvider, 0);

  objc_storeStrong((id *)&self->_accountsProvider, 0);
}

@end