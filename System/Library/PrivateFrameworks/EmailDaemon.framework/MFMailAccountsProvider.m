@interface MFMailAccountsProvider
- (BOOL)hasActiveAccounts;
- (BOOL)isDisplayingMultipleAccounts;
- (MFMailAccountsProvider)init;
- (NSArray)mailAccounts;
- (NSArray)orderedAccounts;
- (NSArray)receivingAddresses;
- (NSSet)autofetchAccounts;
- (NSSet)displayedAccounts;
- (NSSet)focusedAccounts;
- (id)_activeNonLocalAccountsWithMailAccounts:(id)a3;
- (id)_displayedAccountsIdentifiers;
- (id)_executeChange:(id)a3;
- (id)_focusedAccountsIdentifiers;
- (id)legacyMailAccountForObjectID:(id)a3;
- (id)reloadWithMailAccounts:(id)a3 currentFocus:(id)a4;
- (unint64_t)numberOfActiveAccounts;
- (unint64_t)numberOfInactiveAccounts;
- (void)_accountsOrderDidChange:(id)a3;
- (void)setDisplayedAccounts:(id)a3;
- (void)setFocusedAccounts:(id)a3;
- (void)setMailAccounts:(id)a3;
- (void)setNumberOfActiveAccounts:(unint64_t)a3;
- (void)setNumberOfInactiveAccounts:(unint64_t)a3;
- (void)setOrderedAccounts:(id)a3;
@end

@implementation MFMailAccountsProvider

- (MFMailAccountsProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)MFMailAccountsProvider;
  v2 = [(MFMailAccountsProvider *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MFMailAccountsProvider *)v2 _registerNotifications];
  }
  return v3;
}

- (BOOL)hasActiveAccounts
{
  v2 = [(MFMailAccountsProvider *)self displayedAccounts];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSArray)receivingAddresses
{
  v2 = [(MFMailAccountsProvider *)self mailAccounts];
  BOOL v3 = objc_msgSend(v2, "ef_map:", &stru_10013C4C8);
  v4 = objc_msgSend(v3, "ef_flatten");
  objc_super v5 = objc_msgSend(v4, "ef_filter:", EFIsNotNull);

  return (NSArray *)v5;
}

- (id)reloadWithMailAccounts:(id)a3 currentFocus:(id)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100071E88;
  v9[3] = &unk_10013ABC8;
  v10 = self;
  id v11 = a3;
  id v12 = a4;
  id v5 = v12;
  id v6 = v11;
  v7 = [(MFMailAccountsProvider *)v10 _executeChange:v9];

  return v7;
}

- (id)legacyMailAccountForObjectID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 representedObjectID];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(MFMailAccountsProvider *)self mailAccounts];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100072220;
    v9[3] = &unk_10013B2C0;
    id v10 = v5;
    v7 = objc_msgSend(v6, "ef_firstObjectPassingTest:", v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_accountsOrderDidChange:(id)a3
{
}

- (id)_executeChange:(id)a3
{
  id v5 = (void (**)(void))a3;
  if (!v5)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2, self, @"MFMailAccountsProvider.m", 122, @"Invalid parameter not satisfying: %@", @"changeBlock" object file lineNumber description];
  }
  id v6 = [[MFMailAccountsProviderState alloc] initFromProvider:self];
  v5[2](v5);
  id v7 = [[MFMailAccountsProviderState alloc] initFromProvider:self];
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = [v7 numberOfActiveAccounts];
    id v10 = (char *)[v7 numberOfActiveAccounts];
    id v11 = [v7 numberOfInactiveAccounts];
    id v12 = [v6 numberOfActiveAccounts];
    v13 = (char *)[v6 numberOfActiveAccounts];
    *(_DWORD *)buf = 134218752;
    id v18 = v9;
    __int16 v19 = 2048;
    v20 = &v10[(void)v11];
    __int16 v21 = 2048;
    id v22 = v12;
    __int16 v23 = 2048;
    v24 = &v13[(void)[v6 numberOfInactiveAccounts]];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "After reloading accounts: %lu/%lu active mail accounts (previously %lu/%lu)", buf, 0x2Au);
  }

  v14 = +[EFPair pairWithFirst:v6 second:v7];

  return v14;
}

- (id)_activeNonLocalAccountsWithMailAccounts:(id)a3
{
  id v13 = a3;
  id v4 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v13;
  uint64_t v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = kAccountDataclassMail;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([v11 isEnabledForDataclass:v9]) {
            [v4 addObject:v11];
          }
          else {
            ++v6;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  -[MFMailAccountsProvider setNumberOfActiveAccounts:](self, "setNumberOfActiveAccounts:", [v4 count]);
  [(MFMailAccountsProvider *)self setNumberOfInactiveAccounts:v6];

  return v4;
}

- (id)_displayedAccountsIdentifiers
{
  v2 = [(MFMailAccountsProvider *)self displayedAccounts];
  BOOL v3 = objc_msgSend(v2, "ef_compactMap:", &stru_10013C508);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSSet set];
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_focusedAccountsIdentifiers
{
  v2 = [(MFMailAccountsProvider *)self focusedAccounts];
  BOOL v3 = objc_msgSend(v2, "ef_compactMap:", &stru_10013C528);

  return v3;
}

- (BOOL)isDisplayingMultipleAccounts
{
  v2 = [(MFMailAccountsProvider *)self displayedAccounts];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSArray)orderedAccounts
{
  if (pthread_main_np() != 1)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MFMailAccountsProvider.m" lineNumber:175 description:@"Current thread must be main"];
  }
  orderedAccounts = self->_orderedAccounts;
  if (!orderedAccounts)
  {
    id v5 = objc_alloc((Class)NSMutableArray);
    uint64_t v6 = [(MFMailAccountsProvider *)self displayedAccounts];
    id v7 = [v6 allObjects];
    id v8 = [v5 initWithArray:v7];

    uint64_t v9 = (NSArray *)[v8 copy];
    id v10 = self->_orderedAccounts;
    self->_orderedAccounts = v9;

    orderedAccounts = self->_orderedAccounts;
  }

  return orderedAccounts;
}

- (NSSet)autofetchAccounts
{
  v2 = [(MFMailAccountsProvider *)self displayedAccounts];
  BOOL v3 = objc_msgSend(v2, "ef_filter:", &stru_10013C548);

  return (NSSet *)v3;
}

- (NSArray)mailAccounts
{
  return self->_mailAccounts;
}

- (void)setMailAccounts:(id)a3
{
}

- (NSSet)displayedAccounts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDisplayedAccounts:(id)a3
{
}

- (void)setOrderedAccounts:(id)a3
{
}

- (NSSet)focusedAccounts
{
  return self->_focusedAccounts;
}

- (void)setFocusedAccounts:(id)a3
{
}

- (unint64_t)numberOfActiveAccounts
{
  return self->_numberOfActiveAccounts;
}

- (void)setNumberOfActiveAccounts:(unint64_t)a3
{
  self->_numberOfActiveAccounts = a3;
}

- (unint64_t)numberOfInactiveAccounts
{
  return self->_numberOfInactiveAccounts;
}

- (void)setNumberOfInactiveAccounts:(unint64_t)a3
{
  self->_numberOfInactiveAccounts = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedAccounts, 0);
  objc_storeStrong((id *)&self->_orderedAccounts, 0);
  objc_storeStrong((id *)&self->_displayedAccounts, 0);

  objc_storeStrong((id *)&self->_mailAccounts, 0);
}

@end