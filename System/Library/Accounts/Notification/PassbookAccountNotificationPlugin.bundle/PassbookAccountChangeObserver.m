@interface PassbookAccountChangeObserver
- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation PassbookAccountChangeObserver

- (BOOL)account:(id)a3 willChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver willChangeWithType called with account %@, oldAccount %@, changeType %u", (uint8_t *)&v16, 0x1Cu);
  }

  v13 = (void *)[objc_alloc(MEMORY[0x263F5BCD0]) initWithChangeType:v8 event:1 newAccount:v9 oldAccount:v11];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v13;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver detected %{public}@.", (uint8_t *)&v16, 0xCu);
  }

  if (v8 == 3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver notifying pass library.", (uint8_t *)&v16, 2u);
    }

    v14 = [MEMORY[0x263F5BF80] sharedInstance];
    [v14 noteACAccountChanged:v13];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver did notify pass library.", (uint8_t *)&v16, 2u);
    }
  }
  return 0;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v11;
    __int16 v20 = 1024;
    int v21 = v8;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver didChangeWithType called with account %@, oldAccount %@, changeType %u", (uint8_t *)&v16, 0x1Cu);
  }

  v13 = (void *)[objc_alloc(MEMORY[0x263F5BCD0]) initWithChangeType:v8 event:2 newAccount:v9 oldAccount:v11];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v13;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver detected %{public}@.", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v14 = [v13 type];
  if (v14 == 1)
  {
    if ((v8 & 0xFFFFFFFE) != 2) {
      goto LABEL_20;
    }
  }
  else if (v14 {
         || v8 != 1
  }
         && v8 != 3
         && (v8 != 2
          || ([v13 enablementOfRelevantDataclassesChanged] & 1) == 0
          && ([v13 accountManagedStateChanged] & 1) == 0
          && ![v13 accountOrderChanged]))
  {
    goto LABEL_20;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver notifying pass library.", (uint8_t *)&v16, 2u);
  }

  v15 = [MEMORY[0x263F5BF80] sharedInstance];
  [v15 noteACAccountChanged:v13];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2405D5000, v12, OS_LOG_TYPE_DEFAULT, "PassbookAccountChangeObserver did notify pass library.", (uint8_t *)&v16, 2u);
  }

LABEL_20:
}

@end