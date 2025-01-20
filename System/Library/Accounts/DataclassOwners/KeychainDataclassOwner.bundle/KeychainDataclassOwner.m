uint64_t SecDeleteItemsOnSignOut()
{
  return _SecDeleteItemsOnSignOut();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}
 NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;

  if ([a3 type] == (char *)&dword_0 + 3)
  {
    if (SecDeleteItemsOnSignOut())
    {
      v7 = secLogObjForScope();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Deleted items on sign out", buf, 2u);
      }
    }
    else
    {
      v7 = 0;
      v8 = secLogObjForScope();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "ItemDelete: Failed to delete items on sign out: %@", buf, 0xCu);
      }
    }
  }
  return 1;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return [(KeychainDataclassOwner *)self actionsForDeletingAccount:a3 forDataclass:a4];
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  if ([a4 isEqual:kAccountDataclassKeychainSync])
  {
    v4 = +[ACDataclassAction actionWithType:0];
    v5 = +[ACDataclassAction actionWithType:3];
    v6 = +[ACDataclassAction actionWithType:2];
    v9[0] = v4;
    v9[1] = v5;
    v9[2] = v6;
    v7 = +[NSArray arrayWithObjects:v9 count:3];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end