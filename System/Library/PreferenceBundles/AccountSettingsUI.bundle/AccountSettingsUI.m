id sub_47B4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", @"FETCH_NEW_DATA", 1, a1, a1);
}

id *sub_48EC(id *result)
{
  if ((*((unsigned char *)result[4] + 288) & 1) != 1) {
    return (id *)[result[4] reloadSpecifiers];
  }
  *((unsigned char *)result[4] + 288) = 0;
  return result;
}

uint64_t sub_4EF4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

id sub_4F64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleURL:withCompletion:", *(void *)(a1 + 40), *(void *)(a1 + 48), a1, a1);
}

void sub_561C(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v5);

  id v2 = [location[0] copy];
  v3 = (void **)(a1[4] + 192);
  v4 = *v3;
  *v3 = v2;

  if (a1[5]) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(location, 0);
}

uint64_t sub_5D40(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  unsigned __int8 v6 = 0;
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = [location[0] hasPrefix:*(void *)(a1[4] + 280)];
  }
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t sub_5E1C(void *a1, void *a2, unsigned char *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  unsigned __int8 v6 = 0;
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v6 = [location[0] hasPrefix:*(void *)(a1[4] + 280)];
  }
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

NSComparisonResult sub_5EF8(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [location[0] accountType];
    v13[0] = [v4 identifier];

    id v5 = [v14 accountType];
    id v12 = [v5 identifier];

    id v11 = [a1[4] indexOfObject:v13[0]];
    id v10 = [a1[4] indexOfObject:v12];
    v7 = +[NSNumber numberWithInteger:v11];
    unsigned __int8 v6 = +[NSNumber numberWithInteger:v10];
    NSComparisonResult v16 = -[NSNumber compare:](v7, "compare:");

    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    NSComparisonResult v16 = NSOrderedSame;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

uint64_t sub_6110(uint64_t result)
{
  if (*(void *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 40) + 16))();
  }
  return result;
}

uint64_t sub_62EC(uint64_t result, uint64_t a2, int a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  return result;
}

void sub_6340(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[1] = a1;
  if ([a1[4] _isAccountList:location[0] identicalToAccountList:*((void *)a1[4] + 24)])
  {
    v14[0] = (id)_ACUILogSystem();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_62EC((uint64_t)v16, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 374);
      _os_log_impl(&dword_0, (os_log_t)v14[0], v13, "%s (%d) \"ACUISettingsController will ignore monitored account delegate call because the account list has not changed.\"", v16, 0x12u);
    }
    objc_storeStrong(v14, 0);
    int v12 = 1;
  }
  else
  {
    objc_storeStrong((id *)a1[4] + 24, location[0]);
    id v11 = [*((id *)a1[4] + 25) copy];
    id v2 = a1[4];
    id v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_659C;
    v8 = &unk_10428;
    id v9 = v11;
    id v10 = a1[4];
    [v2 _specifiersForAccountsGroupWithCompletion:&v4];
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
    int v12 = 0;
  }
  objc_storeStrong(location, 0);
}

void sub_659C(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v23[1] = (os_log_t)a1;
  if ([*(id *)(a1 + 32) count])
  {
    if ([location[0] count])
    {
      os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
      os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        sub_62EC((uint64_t)v29, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 390);
        _os_log_debug_impl(&dword_0, oslog, v18, "%s (%d) \"ACUISettingsController _accountStoreDidChange: BEGIN UPDATES!\"", v29, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      [*(id *)(a1 + 40) beginUpdates];
      os_log_t v17 = (os_log_t)(id)_ACUILogSystem();
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        sub_4EF4((uint64_t)v28, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 393, *(void *)(a1 + 32));
        _os_log_debug_impl(&dword_0, v17, v16, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\"", v28, 0x1Cu);
      }
      objc_storeStrong((id *)&v17, 0);
      memset(__b, 0, sizeof(__b));
      id obj = [*(id *)(a1 + 32) reverseObjectEnumerator];
      id v9 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)__b[2];
        uint64_t v6 = 0;
        id v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)__b[2] != v5) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(id *)(__b[1] + 8 * v6);
          id v2 = *(void **)(a1 + 40);
          id v3 = [v15 identifier];
          objc_msgSend(v2, "removeSpecifierID:");

          ++v6;
          if (v4 + 1 >= (unint64_t)v7)
          {
            uint64_t v6 = 0;
            id v7 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
            if (!v7) {
              break;
            }
          }
        }
      }

      os_log_t v13 = (os_log_t)(id)_ACUILogSystem();
      os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        sub_6C00((uint64_t)v26, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 398, (uint64_t)location[0], *(void *)(*(void *)(a1 + 40) + 208));
        _os_log_debug_impl(&dword_0, v13, v12, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\"", v26, 0x26u);
      }
      objc_storeStrong((id *)&v13, 0);
      [*(id *)(a1 + 40) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(*(void *)(a1 + 40) + 208)];
      os_log_t v11 = (os_log_t)(id)_ACUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        sub_62EC((uint64_t)v25, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 401);
        _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController _accountStoreDidChange: END UPDATES!\"", v25, 0x12u);
      }
      objc_storeStrong((id *)&v11, 0);
      [*(id *)(a1 + 40) endUpdates];
    }
    else
    {
      id v21 = (id)_ACUILogSystem();
      os_log_type_t v20 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
      {
        sub_4EF4((uint64_t)v30, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 386, *(void *)(a1 + 32));
        _os_log_debug_impl(&dword_0, (os_log_t)v21, v20, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\"", v30, 0x1Cu);
      }
      objc_storeStrong(&v21, 0);
      [*(id *)(a1 + 40) removeContiguousSpecifiers:*(void *)(a1 + 32) animated:0];
    }
  }
  else
  {
    v23[0] = (os_log_t)(id)_ACUILogSystem();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v23[0], OS_LOG_TYPE_DEBUG))
    {
      sub_6C00((uint64_t)v31, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 383, (uint64_t)location[0], *(void *)(*(void *)(a1 + 40) + 208));
      _os_log_debug_impl(&dword_0, v23[0], type, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\"", v31, 0x26u);
    }
    objc_storeStrong((id *)v23, 0);
    [*(id *)(a1 + 40) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(*(void *)(a1 + 40) + 208)];
  }
  objc_storeStrong(location, 0);
}

uint64_t sub_6C00(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 64;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_7E54(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  if (*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) insertContiguousSpecifiers:location[0] afterSpecifier:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) removeSpecifier:*(void *)(a1 + 40)];
    if (*(void *)(*(void *)(a1 + 32) + 296))
    {
      dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 296));
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 296), 0);
    }
  }
  else
  {
    [*(id *)(a1 + 48) addObjectsFromArray:location[0]];
  }
  objc_storeStrong(location, 0);
}

void sub_81E4(id a1)
{
  if (_os_feature_enabled_impl()) {
    byte_14D18 = 1;
  }
}

void sub_8238(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v51[1] = (id)a1;
  v51[0] = objc_alloc_init((Class)NSMutableArray);
  id v50 = objc_alloc_init((Class)NSMutableDictionary);
  [*(id *)(a1 + 32) _filterAccounts:location[0] toTopLevel:v51[0] grouped:v50 ignoringGroups:0];
  id v49 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id obj = v51[0];
  id v31 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
  if (v31)
  {
    uint64_t v26 = *(void *)__b[2];
    uint64_t v27 = 0;
    id v28 = v31;
    while (1)
    {
      uint64_t v25 = v27;
      if (*(void *)__b[2] != v26) {
        objc_enumerationMutation(obj);
      }
      id v48 = *(id *)(__b[1] + 8 * v27);
      id v46 = [*(id *)(a1 + 32) _specifierForAccount:v48];
      if (v46)
      {
        if ((byte_14D18 & 1) == 0)
        {
          char v45 = 0;
          id v22 = [v48 accountType];
          id v23 = [v22 identifier];
          LOBYTE(v24) = 0;
          if ([v23 isEqualToString:ACAccountTypeIdentifierGmail]) {
            unsigned int v24 = [v48 isAuthenticated] ^ 1;
          }

          char v45 = v24 & 1;
          char v44 = 0;
          id v19 = [v48 accountType];
          id v20 = [v19 identifier];
          unsigned __int8 v2 = [v20 isEqualToString:ACAccountTypeIdentifierExchange];
          char v42 = 0;
          char v40 = 0;
          unsigned __int8 v21 = 1;
          if ((v2 & 1) == 0)
          {
            id v43 = [v48 accountType];
            char v42 = 1;
            id v41 = [v43 identifier];
            char v40 = 1;
            unsigned __int8 v21 = [v41 isEqualToString:ACAccountTypeIdentifierHotmail];
          }
          if (v40) {

          }
          if (v42) {
          char v44 = v21 & 1;
          }
          id v17 = v46;
          char v18 = 1;
          if ((*(unsigned char *)(a1 + 48) & 1) == 0)
          {
            char v18 = 1;
            if ((v45 & 1) == 0) {
              char v18 = v44;
            }
          }
          os_log_type_t v16 = +[NSNumber numberWithInt:v18 & 1];
          objc_msgSend(v17, "setProperty:forKey:");
        }
        id v13 = [v48 accountType];
        id v14 = [v13 identifier];
        unsigned __int8 v3 = [v14 isEqualToString:ACAccountTypeIdentifierAppleAccount];
        char v38 = 0;
        unsigned __int8 v15 = 0;
        if (v3)
        {
          id v39 = [v48 objectForKeyedSubscript:@"primaryAccount"];
          char v38 = 1;
          unsigned __int8 v15 = [v39 BOOLValue];
        }
        if (v38) {

        }
        if (v15)
        {
          os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            sub_4EF4((uint64_t)v54, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]_block_invoke_2", 573, (uint64_t)v48);
            _os_log_impl(&dword_0, log, type, "%s (%d) \"Hit our primary account, lets ensure this is at the top - %@\"", v54, 0x1Cu);
          }
          objc_storeStrong((id *)&oslog, 0);
          [v49 insertObject:v46 atIndex:0];
        }
        else
        {
          [v49 addObject:v46];
        }
      }
      objc_storeStrong(&v46, 0);
      ++v27;
      if (v25 + 1 >= (unint64_t)v28)
      {
        uint64_t v27 = 0;
        id v28 = [obj countByEnumeratingWithState:__b objects:v55 count:16];
        if (!v28) {
          break;
        }
      }
    }
  }

  memset(v34, 0, sizeof(v34));
  id v10 = [v50 allKeys];
  id v11 = [v10 countByEnumeratingWithState:v34 objects:v53 count:16];
  if (v11)
  {
    uint64_t v7 = *(void *)v34[2];
    uint64_t v8 = 0;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)v34[2] != v7) {
        objc_enumerationMutation(v10);
      }
      uint64_t v35 = *(void *)(v34[1] + 8 * v8);
      id v33 = [v50 objectForKey:v35];
      id v32 = [*(id *)(a1 + 32) _specifierForCollectionCellLinkingToAccounts:v33 withGroupIdentifier:v35 underParentGroup:0];
      if (v32)
      {
        if ((byte_14D18 & 1) == 0)
        {
          id v4 = v32;
          uint64_t v5 = +[NSNumber numberWithBool:*(unsigned char *)(a1 + 48) & 1];
          objc_msgSend(v4, "setProperty:forKey:");
        }
        [v49 addObject:v32];
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0;
        id v9 = [v10 countByEnumeratingWithState:v34 objects:v53 count:16];
        if (!v9) {
          break;
        }
      }
    }
  }

  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 200), v49);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong(location, 0);
}

void sub_9B64(id a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = @"/System/Library/PreferenceBundles/ScheduleSettings.bundle";
  v1 = +[NSBundle bundleWithPath:v3[0]];
  unsigned __int8 v2 = (void *)qword_14D20;
  qword_14D20 = (uint64_t)v1;

  objc_storeStrong(v3, 0);
}

void sub_9EFC(id *a1)
{
  v19[2] = a1;
  v19[1] = a1;
  id v4 = a1[4];
  id v6 = [v4 _settingsPluginManager];
  id v5 = [v6 contactsSettingsPlugin];
  v19[0] = objc_msgSend(v4, "_specifiersForSettingsProvidedByPlugin:");

  id v7 = a1[4];
  id v9 = [v7 _settingsPluginManager];
  id v8 = [v9 calendarSettingsPlugin];
  id v18 = objc_msgSend(v7, "_specifiersForSettingsProvidedByPlugin:");

  id v1 = [v19[0] arrayByAddingObjectsFromArray:v18];
  unsigned __int8 v2 = (void **)((char *)a1[4] + 232);
  unsigned __int8 v3 = *v2;
  *unsigned __int8 v2 = v1;

  dispatch_queue_t queue = &_dispatch_main_q;
  os_log_type_t v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  unsigned __int8 v15 = sub_A108;
  os_log_type_t v16 = &unk_102F8;
  id v17 = a1[4];
  dispatch_async(queue, &v12);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

void sub_A108(NSObject *a1)
{
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)(id)_ACUILogSystem();
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    sub_4EF4((uint64_t)v31, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke_2", 775, *((void *)a1[4].isa + 28));
    _os_log_debug_impl(&dword_0, oslog[0], type, "%s (%d) \"ACUISettingsController is removing loading-in-progress specifiers: %@\"", v31, 0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  [(objc_class *)a1[4].isa removeContiguousSpecifiers:*((void *)a1[4].isa + 28)];
  id v25 = +[NSMutableArray array];
  id location = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)a1[4].isa
                                                                   + OBJC_IVAR___PSListController__specifiers), "lastObject"));
  memset(__b, 0, sizeof(__b));
  id obj = *((id *)a1[4].isa + 29);
  id v15 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(char **)(__b[1] + 8 * v12);
      BOOL v1 = *(void *)&v23[OBJC_IVAR___PSSpecifier_cellType] != 0;
      char v20 = 0;
      BOOL v9 = 0;
      if (!v1)
      {
        id v8 = v23;
        id v21 = [*((id *)a1[4].isa + 29) objectAtIndexedSubscript:0];
        char v20 = 1;
        BOOL v9 = v8 != v21;
      }
      if (v20) {

      }
      if (v9)
      {
        os_log_t v19 = (os_log_t)(id)_ACUILogSystem();
        os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          id v7 = v19;
          sub_6C00((uint64_t)v29, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 783, (uint64_t)v25, (uint64_t)location);
          _os_log_debug_impl(&dword_0, v7, v18, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\"", v29, 0x26u);
        }
        objc_storeStrong((id *)&v19, 0);
        [(objc_class *)a1[4].isa insertContiguousSpecifiers:v25 afterSpecifier:location animated:0];
        id v2 = [v25 lastObject];
        id v3 = location;
        id location = v2;

        [v25 removeAllObjects];
      }
      [v25 addObject:v23];
      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0;
        id v13 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  if ([v25 count])
  {
    os_log_t v17 = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      sub_6C00((uint64_t)v28, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 793, (uint64_t)v25, (uint64_t)location);
      _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\"", v28, 0x26u);
    }
    objc_storeStrong((id *)&v17, 0);
    [(objc_class *)a1[4].isa insertContiguousSpecifiers:v25 afterSpecifier:location animated:0];
  }
  objc_msgSend(*(id *)((char *)a1[4].isa + OBJC_IVAR___PSListController__table), "contentOffset", &OBJC_IVAR___PSListController__table);
  objc_msgSend(*(id *)((char *)a1[4].isa + *v6), "setContentOffset:animated:", 0, v4, v5);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
}

uint64_t sub_B264()
{
  uint64_t v3 = sub_C268();
  if (!v3)
  {
    id v2 = +[NSAssertionHandler currentHandler];
    BOOL v1 = +[NSString stringWithUTF8String:"void *iCloudMailUnifiedSettingsLibrary(void)"];
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0xB35CLL);
  }
  return v3;
}

id sub_B39C()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_14D38;
  uint64_t v13 = qword_14D38;
  if (!qword_14D38)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    double v5 = sub_C3C0;
    id v6 = &unk_10540;
    id v7 = &v9;
    sub_C3C0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t sub_B4D0()
{
  uint64_t v3 = sub_C51C();
  if (!v3)
  {
    id v2 = +[NSAssertionHandler currentHandler];
    id v1 = +[NSString stringWithUTF8String:"void *iCloudCalendarUnifiedSettingsLibrary(void)"];
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v2, "handleFailureInFunction:file:lineNumber:description:", 0);

    __break(1u);
    JUMPOUT(0xB5C8);
  }
  return v3;
}

id sub_B608()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_14D48;
  uint64_t v13 = qword_14D48;
  if (!qword_14D48)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    double v5 = sub_C674;
    id v6 = &unk_10540;
    id v7 = &v9;
    sub_C674((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t sub_C268()
{
  if (!qword_14D30) {
    sub_C328();
  }
  return qword_14D30;
}

uint64_t sub_C328()
{
  uint64_t result = _sl_dlopen();
  qword_14D30 = result;
  return result;
}

uint64_t sub_C3C0(uint64_t a1)
{
  sub_B264();
  Class Class = objc_getClass("iCloudMailUnifiedSettingsProviderObjc");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v4 = +[NSAssertionHandler currentHandler];
    int v3 = +[NSString stringWithUTF8String:"Class getiCloudMailUnifiedSettingsProviderObjcClass(void)_block_invoke"];
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v4, "handleFailureInFunction:file:lineNumber:description:", "iCloudMailUnifiedSettingsProviderObjc");

    __break(1u);
    JUMPOUT(0xC4ECLL);
  }
  qword_14D38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_C51C()
{
  if (!qword_14D40) {
    sub_C5DC();
  }
  return qword_14D40;
}

uint64_t sub_C5DC()
{
  uint64_t result = _sl_dlopen();
  qword_14D40 = result;
  return result;
}

uint64_t sub_C674(uint64_t a1)
{
  sub_B4D0();
  Class Class = objc_getClass("iCloudCalendarUnifiedSettingsProviderObjc");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    int v4 = +[NSAssertionHandler currentHandler];
    int v3 = +[NSString stringWithUTF8String:"Class getiCloudCalendarUnifiedSettingsProviderObjcClass(void)_block_invoke"];
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v4, "handleFailureInFunction:file:lineNumber:description:", "iCloudCalendarUnifiedSettingsProviderObjc");

    __break(1u);
    JUMPOUT(0xC7A0);
  }
  qword_14D48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ACUIFetchSettingTitle()
{
  return _ACUIFetchSettingTitle();
}

uint64_t ACUIIsSharedIPadMode()
{
  return _ACUIIsSharedIPadMode();
}

uint64_t ACUISortedAccountTypes()
{
  return _ACUISortedAccountTypes();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PCSettingsGetClassPollInterval()
{
  return _PCSettingsGetClassPollInterval();
}

uint64_t PCSettingsGetClassPushEnabled()
{
  return _PCSettingsGetClassPushEnabled();
}

uint64_t _ACUILogSystem()
{
  return __ACUILogSystem();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return [a1 _accountStore];
}

id objc_msgSend__accountStoreDidChange(void *a1, const char *a2, ...)
{
  return [a1 _accountStoreDidChange];
}

id objc_msgSend__addAccountSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _addAccountSpecifier];
}

id objc_msgSend__isAccountModificationDisabledByRestrictions(void *a1, const char *a2, ...)
{
  return [a1 _isAccountModificationDisabledByRestrictions];
}

id objc_msgSend__settingsPluginManager(void *a1, const char *a2, ...)
{
  return [a1 _settingsPluginManager];
}

id objc_msgSend__specifierForScheduleSettings(void *a1, const char *a2, ...)
{
  return [a1 _specifierForScheduleSettings];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_acuiAccountStore(void *a1, const char *a2, ...)
{
  return [a1 acuiAccountStore];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_calendarSettingsPlugin(void *a1, const char *a2, ...)
{
  return [a1 calendarSettingsPlugin];
}

id objc_msgSend_contactsSettingsPlugin(void *a1, const char *a2, ...)
{
  return [a1 contactsSettingsPlugin];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return [a1 enabledDataclasses];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_footerText(void *a1, const char *a2, ...)
{
  return [a1 footerText];
}

id objc_msgSend_headerText(void *a1, const char *a2, ...)
{
  return [a1 headerText];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isShowDataclassDetailFromAppsEnabled(void *a1, const char *a2, ...)
{
  return [a1 isShowDataclassDetailFromAppsEnabled];
}

id objc_msgSend_isVisible(void *a1, const char *a2, ...)
{
  return [a1 isVisible];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_monitoredAccounts(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccounts];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_parentViewControllerWillDisappear(void *a1, const char *a2, ...)
{
  return [a1 parentViewControllerWillDisappear];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_supportedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 supportedDataclasses];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}