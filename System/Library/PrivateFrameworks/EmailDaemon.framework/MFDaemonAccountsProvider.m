@interface MFDaemonAccountsProvider
- (EFCancelable)focusObservationToken;
- (EMFocus)currentFocus;
- (MFDaemonAccountsProvider)initWithFocusController:(id)a3;
- (int)accountChangeNotificationToken;
- (void)_handleAccountChange;
- (void)currentFocusChanged:(id)a3;
- (void)dealloc;
- (void)setAccountChangeNotificationToken:(int)a3;
- (void)setCurrentFocus:(id)a3;
- (void)setFocusObservationToken:(id)a3;
@end

@implementation MFDaemonAccountsProvider

- (MFDaemonAccountsProvider)initWithFocusController:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MFDaemonAccountsProvider;
  v5 = [(MFMailAccountsProvider *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 addObserver:v5 currentFocus:&v5->_currentFocus];
    focusObservationToken = v5->_focusObservationToken;
    v5->_focusObservationToken = (EFCancelable *)v6;

    v8 = +[MailAccount mailAccounts];
    id v9 = [(MFMailAccountsProvider *)v5 reloadWithMailAccounts:v8 currentFocus:v5->_currentFocus];

    v10 = +[MFMailMessageLibrary defaultInstance];
    v11 = [(MFMailAccountsProvider *)v5 mailAccounts];
    [v10 rebuildActiveAccountsClausesAndExpressionsWithAccounts:v11];

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.mobilemail.DaemonAccountsProvider", v13);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v14;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v16 = (const char *)kMFMailAccountsChangedNotification;
    v17 = v5->_queue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10005644C;
    v19[3] = &unk_10013B7D8;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v16, &v5->_accountChangeNotificationToken, v17, v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  notify_cancel(self->_accountChangeNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)MFDaemonAccountsProvider;
  [(MFDaemonAccountsProvider *)&v3 dealloc];
}

- (void)_handleAccountChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_super v3 = +[MFMailMessageLibrary defaultInstance];
  [v3 prepareToRebuildActiveAccountsClausesAndExpressions];

  +[MailAccount reloadAccounts];
  +[DeliveryAccount reloadDeliveryAccounts];
  id v4 = +[MailAccount mailAccounts];
  v5 = +[MFMailMessageLibrary defaultInstance];
  [v5 rebuildActiveAccountsClausesAndExpressionsWithAccounts:v4];

  uint64_t v6 = [(MFDaemonAccountsProvider *)self currentFocus];
  v7 = [(MFMailAccountsProvider *)self reloadWithMailAccounts:v4 currentFocus:v6];

  +[MessageBodyLoader accountsDidChange];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = [v7 first];
  id v9 = [v8 mailAccounts];

  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)v12) stopListeningForNotifications];
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v10);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v13 = objc_msgSend(v7, "second", 0);
  dispatch_queue_t v14 = [v13 mailAccounts];

  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * (void)v17) startListeningForNotifications];
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v15 = [v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v15);
  }

  v32[0] = ECMailAccountsDidChangeNotificationKeyPreviousAccountIdentifiers;
  v18 = [v7 first];
  v19 = [v18 displayedAccountsIdentifiers];
  v33[0] = v19;
  v32[1] = ECMailAccountsDidChangeNotificationKeyAccountIdentifiers;
  id v20 = [v7 second];
  v21 = [v20 displayedAccountsIdentifiers];
  v33[1] = v21;
  objc_super v22 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

  v23 = +[NSNotificationCenter defaultCenter];
  [v23 postNotificationName:ECMailAccountsDidChangeNotification object:self userInfo:v22];
}

- (void)currentFocusChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000569DC;
  v7[3] = &unk_100139C20;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (int)accountChangeNotificationToken
{
  return self->_accountChangeNotificationToken;
}

- (void)setAccountChangeNotificationToken:(int)a3
{
  self->_accountChangeNotificationToken = a3;
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

  objc_storeStrong((id *)&self->_queue, 0);
}

@end