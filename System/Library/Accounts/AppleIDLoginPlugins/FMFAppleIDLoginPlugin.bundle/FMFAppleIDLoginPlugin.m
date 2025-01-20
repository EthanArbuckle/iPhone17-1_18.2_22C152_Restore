uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return [a1 _accountStore];
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return [a1 credential];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}
 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = (_UNKNOWN **)objc_alloc_init((Class)NSMutableDictionary);
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:@"account-exists"];
    v7 = [v3 username];

    if (v7)
    {
      v8 = [v3 username];
      [v6 setObject:v8 forKeyedSubscript:@"apple-id"];
    }
    v9 = objc_msgSend(v3, "aa_personID");

    if (v9)
    {
      v10 = objc_msgSend(v3, "aa_personID");
      [v6 setObject:v10 forKeyedSubscript:@"dsid"];
    }
    v11 = [v5 credential];
    v12 = [v11 credentialItemForKey:ACFindMyFriendsTokenKey];

    if (v12) {
      [v6 setObject:v12 forKeyedSubscript:@"auth-token"];
    }
  }
  else
  {
    v6 = &off_4150;
  }

  return v6;
}

- (id)parametersForLoginRequest
{
  return 0;
}

- (void)handleLoginResponse:(id)a3 completion:(id)a4
{
}

- (id)_accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    v4 = +[ACAccountStore defaultStore];
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (void).cxx_destruct
{
}

@end