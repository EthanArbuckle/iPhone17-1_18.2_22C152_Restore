uint64_t sub_220C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t sub_27FC(uint64_t result, uint64_t a2, int a3, int a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 4;
  *(_DWORD *)(result + 20) = a4;
  return result;
}

uint64_t sub_2C04(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

uint64_t sub_2C84(uint64_t result, uint64_t a2, int a3)
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

void sub_3828(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location)
{
  *(void *)(v15 - 248) = a1;
  *(_DWORD *)(v15 - 252) = a2;
  objc_destroyWeak((id *)(v15 - 240));
  _Unwind_Resume(*(_Unwind_Exception **)(v15 - 248));
}

uint64_t sub_3884(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 64;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_3908(uint64_t a1, void *a2, void *a3)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = (id)a1;
  v6[0] = objc_loadWeakRetained((id *)(a1 + 40));
  [v6[0] setReloading:0];
  if (v7)
  {
    +[ACUIRemoteAccountsAnalytics reportAccountActionErrorForAccount:0 action:2 error:v7];
  }
  else
  {
    id v3 = +[ACUIUtils sortedAccountsFromAccounts:location[0]];
    objc_msgSend(v6[0], "setAccounts:");

    [v6[0] _notifyAccountsChanged];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void sub_3EAC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
  *(void *)(v17 - 168) = a1;
  *(_DWORD *)(v17 - 172) = a2;
  objc_destroyWeak((id *)(v17 - 160));
  _Unwind_Resume(*(_Unwind_Exception **)(v17 - 168));
}

uint64_t sub_3F08(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
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
  *(unsigned char *)(result + 28) = 66;
  *(unsigned char *)(result + 29) = 8;
  *(void *)(result + 30) = a5;
  return result;
}

void sub_3F8C(uint64_t a1, char a2, id obj)
{
  uint64_t v15 = a1;
  char v14 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v12[1] = (id)a1;
  v12[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v14)
  {
    char v11 = ([v12[0] _isExisitingAccount:*(void *)(a1 + 32)] ^ 1) & 1;
    id v9 = [v12[0] accounts];
    id v8 = [v9 arrayByAddingObject:*(void *)(a1 + 32)];
    id v7 = +[ACUIUtils sortedAccountsFromAccounts:](ACUIUtils, "sortedAccountsFromAccounts:");
    objc_msgSend(v12[0], "setAccounts:");

    if (v11) {
      [v12[0] _notifyAccountsInvalidated];
    }
    else {
      [v12[0] _notifyAccountsChanged];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v3 = 0;
    if ((v11 & 1) == 0) {
      uint64_t v3 = 3;
    }
    uint64_t v5 = v3;
    id v6 = [v12[0] topLevelAccounts];
    +[ACUIRemoteAccountsAnalytics reportAccountActionForAccount:action:numberOfAccounts:](ACUIRemoteAccountsAnalytics, "reportAccountActionForAccount:action:numberOfAccounts:", v4, v5, [v6 count]);
  }
  else
  {
    +[ACUIRemoteAccountsAnalytics reportAccountActionErrorForAccount:*(void *)(a1 + 32) action:0 error:location];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(v12, 0);
  objc_storeStrong(&location, 0);
}

void sub_4610(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
  *(void *)(v17 - 168) = a1;
  *(_DWORD *)(v17 - 172) = a2;
  objc_destroyWeak((id *)(v17 - 160));
  _Unwind_Resume(*(_Unwind_Exception **)(v17 - 168));
}

void sub_466C(uint64_t a1, char a2, id obj)
{
  uint64_t v7 = a1;
  char v6 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v4[1] = (id)a1;
  v4[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v6) {
    [v4[0] _notifyAccountsInvalidated];
  }
  else {
    +[ACUIRemoteAccountsAnalytics reportAccountActionErrorForAccount:*(void *)(a1 + 32) action:3 error:location];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(v4, 0);
  objc_storeStrong(&location, 0);
}

void sub_4BB0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id *location)
{
  *(void *)(v17 - 168) = a1;
  *(_DWORD *)(v17 - 172) = a2;
  objc_destroyWeak((id *)(v17 - 160));
  _Unwind_Resume(*(_Unwind_Exception **)(v17 - 168));
}

void sub_4C0C(uint64_t a1, char a2, id obj)
{
  uint64_t v12 = a1;
  char v11 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v9[1] = (id)a1;
  v9[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if (v11)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v5 = [v9[0] accounts];
    id v4 = objc_msgSend(v9[0], "_removeAccount:fromArray:", v3);
    objc_msgSend(v9[0], "setAccounts:");

    [v9[0] _notifyAccountsChanged];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [v9[0] topLevelAccounts];
    +[ACUIRemoteAccountsAnalytics reportAccountActionForAccount:action:numberOfAccounts:](ACUIRemoteAccountsAnalytics, "reportAccountActionForAccount:action:numberOfAccounts:", v6, 1, [v7 count]);
  }
  else
  {
    +[ACUIRemoteAccountsAnalytics reportAccountActionErrorForAccount:*(void *)(a1 + 32) action:1 error:location];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_storeStrong(v9, 0);
  objc_storeStrong(&location, 0);
}

void sub_4EB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_5014(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_5124(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(a1 + 32) observers];
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      [v9 syncControllerAccountsChanged:*(void *)(a1 + 32)];
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

void sub_5384(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(a1 + 32) observers];
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      [v9 syncControllerAccountsInvalidated:*(void *)(a1 + 32)];
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

void sub_55E4(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = [*(id *)(a1 + 32) observers];
  id v7 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
  if (v7)
  {
    uint64_t v2 = *(void *)__b[2];
    uint64_t v3 = 0;
    id v4 = v7;
    while (1)
    {
      uint64_t v1 = v3;
      if (*(void *)__b[2] != v2) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(id *)(__b[1] + 8 * v3);
      [v9 syncControllerStateChanged:*(void *)(a1 + 32)];
      ++v3;
      if (v1 + 1 >= (unint64_t)v4)
      {
        uint64_t v3 = 0;
        id v4 = [obj countByEnumeratingWithState:__b objects:v12 count:16];
        if (!v4) {
          break;
        }
      }
    }
  }
}

id sub_6894()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB28;
  uint64_t v13 = qword_1EB28;
  if (!qword_1EB28)
  {
    uint64_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = sub_8344;
    uint64_t v6 = &unk_18458;
    id v7 = &v9;
    sub_8344((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

id sub_69C8()
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB38;
  uint64_t v13 = qword_1EB38;
  if (!qword_1EB38)
  {
    uint64_t v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = sub_85EC;
    uint64_t v6 = &unk_18458;
    id v7 = &v9;
    sub_85EC((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

void sub_77EC(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  *(void *)(v10 - 32) = a1;
  *(_DWORD *)(v10 - 36) = a2;
  objc_destroyWeak((id *)(v10 - 24));
  _Unwind_Resume(*(_Unwind_Exception **)(v10 - 32));
}

void sub_782C(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v13 = 0;
  objc_storeStrong(&v13, a3);
  v12[1] = a1;
  v12[0] = objc_loadWeakRetained(a1 + 4);
  if (v13)
  {
    dispatch_queue_t queue = &_dispatch_main_q;
    uint64_t v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    uint64_t v9 = sub_7968;
    uint64_t v10 = &unk_18408;
    id v11 = v12[0];
    dispatch_async(queue, &v6);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void sub_7968(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  int v4 = -[NSBundle localizedStringForKey:value:table:](v5, "localizedStringForKey:value:table:", @"FAILED_TO_LOAD_ACCOUNTS");
  int v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v2 = [(NSBundle *)v3 localizedStringForKey:@"PLEASE_TRY_AGAIN" value:&stru_187E8 table:@"Localizable"];
  objc_msgSend(v1, "_displayAlertWithTitle:message:", v4);
}

id sub_7E20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers", a1, a1);
}

id sub_7F48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers", a1, a1);
}

uint64_t sub_8344(uint64_t a1)
{
  sub_83F8();
  Class Class = objc_getClass("NMCUICloudNotificationAccountDataSource");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_83F8()
{
  uint64_t v1 = sub_8494();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t sub_8494()
{
  if (!qword_1EB30) {
    sub_8554();
  }
  return qword_1EB30;
}

uint64_t sub_8554()
{
  uint64_t result = _sl_dlopen();
  qword_1EB30 = result;
  return result;
}

uint64_t sub_85EC(uint64_t a1)
{
  sub_83F8();
  Class Class = objc_getClass("NMCUISpecifierController");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_9610(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
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

id sub_9690(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dismissAndNotifyParent];
}

uint64_t sub_96D0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
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

uint64_t sub_AA48(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 0;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  return result;
}

uint64_t sub_B414(uint64_t result, uint64_t a2, int a3, uint64_t a4, int a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 32;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 4;
  *(_DWORD *)(result + 14) = a3;
  *(unsigned char *)(result + 18) = 66;
  *(unsigned char *)(result + 19) = 8;
  *(void *)(result + 20) = a4;
  *(unsigned char *)(result + 28) = 0;
  *(unsigned char *)(result + 29) = 4;
  *(_DWORD *)(result + 30) = a5;
  return result;
}

void sub_C1D8()
{
  _Unwind_Resume(v0);
}

void sub_C1E8(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3[0]) {
    [v3[0] reloadSpecifier:*(void *)(a1 + 32) animated:1];
  }
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void sub_C280(uint64_t a1, char a2, id obj)
{
  uint64_t v25 = a1;
  char v24 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v22[1] = (id)a1;
  v22[0] = (id)_ACUILogSystem();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_2C84((uint64_t)v28, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateDidChange:withSpecifier:]_block_invoke", 282);
    _os_log_impl(&def_10DA8, (os_log_t)v22[0], v21, "%s (%d) \"Finished updating account on remote device\"", v28, 0x12u);
  }
  objc_storeStrong(v22, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v24)
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 32) account];
      id v4 = [v5 identifier];
      sub_220C((uint64_t)v26, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateDidChange:withSpecifier:]_block_invoke_2", 290, (uint64_t)v4);
      _os_log_impl(&def_10DA8, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Successfully updated account: %{public}@\"", v26, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v3 = [*(id *)(a1 + 32) account];
    objc_msgSend(v3, "setEnabled:forDataclass:", (unint64_t)objc_msgSend(*(id *)(a1 + 40), "BOOLValue") & 1, *(void *)(a1 + 48));

    [*(id *)(a1 + 32) setDidModifyAccount:1];
  }
  else
  {
    id v19 = (id)_ACUILogSystem();
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      id v7 = location;
      id v9 = [*(id *)(a1 + 32) account];
      id v8 = [v9 identifier];
      sub_3884((uint64_t)v27, (uint64_t)"-[ACUIRemoteAccountDataclassViewController dataclassSwitchStateDidChange:withSpecifier:]_block_invoke", 285, (uint64_t)v7, (uint64_t)v8);
      _os_log_error_impl(&def_10DA8, (os_log_t)v19, v18, "%s (%d) \"Failed to update account to device, Error: %{public}@, Account: %@\"", v27, 0x26u);
    }
    objc_storeStrong(&v19, 0);
    dispatch_queue_t queue = &_dispatch_main_q;
    int v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    uint64_t v15 = sub_C6A8;
    v16 = &unk_18408;
    id v17 = WeakRetained;
    dispatch_async(queue, &v12);

    objc_storeStrong(&v17, 0);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 56));
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(&location, 0);
}

id sub_C6A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayFailedToSaveAlertShouldDismiss:", 0, a1, a1);
}

void sub_CB00(uint64_t a1, int a2)
{
  *(void *)(v2 - 128) = a1;
  *(_DWORD *)(v2 - 132) = a2;
  objc_destroyWeak((id *)(v2 - 80));
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 128));
}

void sub_CB2C(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v15[1] = a1;
  v15[0] = objc_loadWeakRetained(a1 + 4);
  id v14 = (id)_ACUILogSystem();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v15[0] account];
    id v4 = [v5 identifier];
    sub_220C((uint64_t)v17, (uint64_t)"-[ACUIRemoteAccountDataclassViewController deleteButtonTapped:]_block_invoke", 308, (uint64_t)v4);
    _os_log_impl(&def_10DA8, (os_log_t)v14, v13, "%s (%d) \"Beginning deletion request for account: %{public}@\"", v17, 0x1Cu);
  }
  objc_storeStrong(&v14, 0);
  [v15[0] setDeleting:1];
  id v3 = [v15[0] syncController];
  id v2 = [v15[0] account];
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  uint64_t v10 = sub_CD80;
  id v11 = &unk_18550;
  id v12 = v15[0];
  [v3 removeRemoteAccount:v2 completion:&v7];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(v15, 0);
  objc_storeStrong(location, 0);
}

void sub_CD80(id *a1, char a2, id obj)
{
  v32 = a1;
  char v31 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v29[1] = a1;
  v29[0] = (id)_ACUILogSystem();
  os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29[0], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [a1[4] account];
    id v9 = [v10 identifier];
    sub_220C((uint64_t)v35, (uint64_t)"-[ACUIRemoteAccountDataclassViewController deleteButtonTapped:]_block_invoke", 311, (uint64_t)v9);
    _os_log_impl(&def_10DA8, (os_log_t)v29[0], v28, "%s (%d) \"Finished deletion request for account: %{public}@\"", v35, 0x1Cu);
  }
  objc_storeStrong(v29, 0);
  [a1[4] setDeleting:0];
  if (v31)
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [a1[4] account];
      id v4 = [v5 identifier];
      sub_2C04((uint64_t)v33, (uint64_t)"-[ACUIRemoteAccountDataclassViewController deleteButtonTapped:]_block_invoke_2", 319, (uint64_t)v4, (uint64_t)location);
      _os_log_impl(&def_10DA8, oslog, v18, "%s (%d) \"Successfully removed account from device, account: %{public}@, error: %{public}@\"", v33, 0x26u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [a1[4] setDidDeleteAccount:1];
    dispatch_queue_t v3 = &_dispatch_main_q;
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    uint64_t v15 = sub_D260;
    v16 = &unk_18408;
    id v17 = a1[4];
    dispatch_async(v3, &v12);

    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v27 = (id)_ACUILogSystem();
    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
    {
      id v8 = [a1[4] account];
      id v7 = [v8 identifier];
      sub_2C04((uint64_t)v34, (uint64_t)"-[ACUIRemoteAccountDataclassViewController deleteButtonTapped:]_block_invoke", 314, (uint64_t)v7, (uint64_t)location);
      _os_log_error_impl(&def_10DA8, (os_log_t)v27, v26, "%s (%d) \"Failed to remove account from device, account: %{public}@, error: %{public}@\"", v34, 0x26u);
    }
    objc_storeStrong(&v27, 0);
    dispatch_queue_t queue = &_dispatch_main_q;
    v20 = _NSConcreteStackBlock;
    int v21 = -1073741824;
    int v22 = 0;
    v23 = sub_D22C;
    char v24 = &unk_18408;
    id v25 = a1[4];
    dispatch_async(queue, &v20);

    objc_storeStrong(&v25, 0);
  }
  objc_storeStrong(&location, 0);
}

id sub_D22C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayFailedToDeleteAlert", a1, a1);
}

id sub_D260(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismiss", a1, a1);
}

id sub_D44C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers", a1, a1);
}

id sub_D5A0(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  id v7 = [a1[4] cancelButton];
  objc_msgSend(v7, "setEnabled:", (objc_msgSend(a1[4], "isSaving") ^ 1) & 1);

  if ([a1[4] isSaving])
  {
    v10[0] = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    id v1 = objc_alloc((Class)UIBarButtonItem);
    id v9 = [v1 initWithCustomView:v10[0]];
    [v10[0] startAnimating];
    id v5 = v9;
    id v6 = [a1[4] navigationItem];
    [v6 setRightBarButtonItem:v5];

    objc_storeStrong(&v9, 0);
    objc_storeStrong(v10, 0);
  }
  else
  {
    id v4 = [a1[4] doneButton];
    id v3 = [a1[4] navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
  return [a1[4] reloadSpecifiers];
}

void sub_DB40(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  *(void *)(v14 - 104) = a1;
  *(_DWORD *)(v14 - 108) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 96));
  JUMPOUT(0xDB84);
}

void sub_DB7C()
{
  _Unwind_Resume(v0);
}

void sub_DB8C(id *a1, char a2, id obj)
{
  v36 = a1;
  char v35 = a2 & 1;
  id location = 0;
  objc_storeStrong(&location, obj);
  v33[1] = a1;
  v33[0] = objc_loadWeakRetained(a1 + 5);
  id v32 = (id)_ACUILogSystem();
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v33[0] account];
    id v10 = [v11 identifier];
    sub_220C((uint64_t)v39, (uint64_t)"-[ACUIRemoteAccountDataclassViewController doneButtonTapped:]_block_invoke", 388, (uint64_t)v10);
    _os_log_impl(&def_10DA8, (os_log_t)v32, v31, "%s (%d) \"Finished saving to remote device for account: %{public}@\"", v39, 0x1Cu);
  }
  objc_storeStrong(&v32, 0);
  [v33[0] setSaving:0];
  if (v35)
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [v33[0] account];
      id v4 = [v5 identifier];
      sub_220C((uint64_t)v37, (uint64_t)"-[ACUIRemoteAccountDataclassViewController doneButtonTapped:]_block_invoke_2", 396, (uint64_t)v4);
      _os_log_impl(&def_10DA8, oslog, v21, "%s (%d) \"Successfully savd to remote device for account: %{public}@\"", v37, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    dispatch_queue_t v3 = &_dispatch_main_q;
    int v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_E0B0;
    id v17 = &unk_185C8;
    objc_copyWeak(&v20, a1 + 5);
    id v18 = a1[4];
    id v19 = v33[0];
    dispatch_async(v3, &v13);

    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_destroyWeak(&v20);
  }
  else
  {
    id v30 = (id)_ACUILogSystem();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      id v7 = location;
      id v9 = [v33[0] account];
      id v8 = [v9 identifier];
      sub_2C04((uint64_t)v38, (uint64_t)"-[ACUIRemoteAccountDataclassViewController doneButtonTapped:]_block_invoke", 391, (uint64_t)v7, (uint64_t)v8);
      _os_log_error_impl(&def_10DA8, (os_log_t)v30, v29, "%s (%d) \"Failed to save account to device, Error: %{public}@, Account: %{public}@\"", v38, 0x26u);
    }
    objc_storeStrong(&v30, 0);
    dispatch_queue_t queue = &_dispatch_main_q;
    v23 = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    os_log_type_t v26 = sub_E074;
    id v27 = &unk_18408;
    id v28 = v33[0];
    dispatch_async(queue, &v23);

    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(v33, 0);
  objc_storeStrong(&location, 0);
}

id sub_E074(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_displayFailedToSaveAlertShouldDismiss:", 1, a1, a1);
}

void sub_E0B0(id *a1)
{
  v21[2] = a1;
  v21[1] = a1;
  int v14 = _NSConcreteStackBlock;
  int v15 = -1073741824;
  int v16 = 0;
  id v17 = sub_E3F0;
  id v18 = &unk_185A0;
  objc_copyWeak(&v20, a1 + 6);
  id v19 = a1[4];
  v21[0] = objc_retainBlock(&v14);
  id v10 = objc_alloc((Class)sub_E4F0());
  id v9 = [ACUICloudNotificationAccountDataSource alloc];
  id v7 = [a1[5] syncController];
  id v8 = -[ACUICloudNotificationAccountDataSource initWithAccountDataSource:](v9, "initWithAccountDataSource:");
  id v13 = [v10 initWithAccountDataSource:v8];

  [v13 setShowsAlerts:1];
  id v6 = [a1[5] account];
  id v4 = [v6 nmcuiAccount];
  unsigned __int8 v5 = objc_msgSend(v13, "shouldPromptToEnableNotifications:");

  if (v5)
  {
    id v3 = objc_alloc((Class)sub_E624());
    id v2 = [a1[5] account];
    id v1 = [v2 nmcuiAccount];
    id location = objc_msgSend(v3, "initWithAccount:dataSource:completion:");

    [a1[5] presentViewController:location animated:1 completion:0];
    objc_storeStrong(&location, 0);
  }
  else
  {
    (*((void (**)(void))v21[0] + 2))();
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(v21, 0);
  objc_storeStrong(&v19, 0);
  objc_destroyWeak(&v20);
}

void sub_E3F0(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 5);
  id v4 = [location[0] rootController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v2 = [a1[4] rootController];
    id v1 = [a1[4] account];
    objc_msgSend(v2, "controller:didFinishSettingUpAccount:", location[0]);
  }
  else
  {
    [location[0] _dismiss];
  }
  objc_storeStrong(location, 0);
}

id sub_E4F0()
{
  uint64_t v9 = 0;
  id v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB40;
  uint64_t v13 = qword_1EB40;
  if (!qword_1EB40)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    char v5 = sub_F8E0;
    id v6 = &unk_18458;
    id v7 = &v9;
    sub_F8E0((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

id sub_E624()
{
  uint64_t v9 = 0;
  id v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB50;
  uint64_t v13 = qword_1EB50;
  if (!qword_1EB50)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    char v5 = sub_FB88;
    id v6 = &unk_18458;
    id v7 = &v9;
    sub_FB88((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

void sub_EFA0()
{
  _Unwind_Resume(v0);
}

void sub_EFB0(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v11 = a1;
  int v3 = *(void **)(a1 + 32);
  int v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_F0BC;
  uint64_t v8 = &unk_18618;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  char v10 = *(unsigned char *)(a1 + 48) & 1;
  [v3 dismissViewControllerAnimated:1 completion:&v4];
  objc_destroyWeak(&v9);
  objc_storeStrong(location, 0);
}

void sub_F098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, _Unwind_Exception *exception_object, char a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
}

void sub_F0BC(uint64_t a1)
{
  id location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40)) {
    [location[0] _dismiss];
  }
  objc_storeStrong(location, 0);
}

uint64_t sub_F8E0(uint64_t a1)
{
  sub_F994();
  Class Class = objc_getClass("NMCUICloudNotificationAccountDataSource");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_F994()
{
  uint64_t v1 = sub_FA30();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t sub_FA30()
{
  if (!qword_1EB48) {
    sub_FAF0();
  }
  return qword_1EB48;
}

uint64_t sub_FAF0()
{
  uint64_t result = _sl_dlopen();
  qword_1EB48 = result;
  return result;
}

uint64_t sub_FB88(uint64_t a1)
{
  sub_F994();
  Class Class = objc_getClass("NMCUICloudNotificationOnboardingViewController");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_FE8C(id a1, ACAccount *a2, unint64_t a3, BOOL *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v4 = objc_alloc((Class)sub_FF24());
  id v6 = [v4 initWithACAccount:location[0]];
  objc_storeStrong(location, 0);

  return v6;
}

id sub_FF24()
{
  uint64_t v9 = 0;
  char v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB58;
  uint64_t v13 = qword_1EB58;
  if (!qword_1EB58)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    int v5 = sub_10478;
    id v6 = &unk_18458;
    id v7 = &v9;
    sub_10478((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t sub_10478(uint64_t a1)
{
  sub_1052C();
  Class Class = objc_getClass("NMCUIAccount");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1052C()
{
  uint64_t v1 = sub_105C8();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t sub_105C8()
{
  if (!qword_1EB60) {
    sub_10688();
  }
  return qword_1EB60;
}

uint64_t sub_10688()
{
  uint64_t result = _sl_dlopen();
  qword_1EB60 = result;
  return result;
}

NSDictionary *sub_108A8(uint64_t a1)
{
  v6[0] = @"account_type";
  v7[0] = *(void *)(a1 + 32);
  v6[1] = @"action_type";
  id v5 = [*(id *)(a1 + 40) _descriptionForAction:*(void *)(a1 + 48)];
  v7[1] = v5;
  id v6[2] = @"account_number";
  int v3 = +[NSNumber numberWithInteger:*(void *)(a1 + 56)];
  v7[2] = v3;
  int v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

NSDictionary *sub_10BA0(uint64_t a1)
{
  v8[0] = @"account_type";
  v9[0] = *(void *)(a1 + 32);
  v8[1] = @"action_type";
  id v6 = [*(id *)(a1 + 48) _descriptionForAction:*(void *)(a1 + 56)];
  v9[1] = v6;
  v8[2] = @"error_domain";
  id v7 = (__CFString *)[*(id *)(a1 + 40) domain];
  if (v7) {
    CFStringRef v4 = v7;
  }
  else {
    CFStringRef v4 = &stru_187E8;
  }
  id v9[2] = v4;
  v8[3] = @"error_code";
  id v2 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) code]);
  v9[3] = v2;
  int v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v3;
}

id sub_10E88()
{
  uint64_t v9 = 0;
  char v10 = &v9;
  int v11 = 1342177280;
  int v12 = 32;
  uint64_t v8 = qword_1EB68;
  uint64_t v13 = qword_1EB68;
  if (!qword_1EB68)
  {
    id v2 = _NSConcreteStackBlock;
    int v3 = -1073741824;
    int v4 = 0;
    id v5 = sub_10FBC;
    id v6 = &unk_18458;
    id v7 = &v9;
    sub_10FBC((uint64_t)&v2);
  }
  id v1 = (id)v10[3];
  _Block_object_dispose(&v9, 8);

  return v1;
}

uint64_t sub_10FBC(uint64_t a1)
{
  sub_11070();
  Class Class = objc_getClass("NMCUIAccount");
  uint64_t result = a1;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = Class;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    uint64_t result = abort_report_np();
  }
  qword_1EB68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_11070()
{
  uint64_t v1 = sub_1110C();
  if (!v1) {
    abort_report_np();
  }
  return v1;
}

uint64_t sub_1110C()
{
  if (!qword_1EB70) {
    sub_111CC();
  }
  return qword_1EB70;
}

uint64_t sub_111CC()
{
  uint64_t result = _sl_dlopen();
  qword_1EB70 = result;
  return result;
}

uint64_t ACUIFetchSettingFromNumber()
{
  return _ACUIFetchSettingFromNumber();
}

uint64_t ACUIFetchSettingTitle()
{
  return _ACUIFetchSettingTitle();
}

uint64_t ACUIOrderedDataClassList()
{
  return _ACUIOrderedDataClassList();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
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

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__defaultAccountTypes(void *a1, const char *a2, ...)
{
  return [a1 _defaultAccountTypes];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__dismissAndNotifyParent(void *a1, const char *a2, ...)
{
  return [a1 _dismissAndNotifyParent];
}

id objc_msgSend__displayFailedToDeleteAlert(void *a1, const char *a2, ...)
{
  return [a1 _displayFailedToDeleteAlert];
}

id objc_msgSend__isPresentedAsModalSheet(void *a1, const char *a2, ...)
{
  return [a1 _isPresentedAsModalSheet];
}

id objc_msgSend__navigationTitle(void *a1, const char *a2, ...)
{
  return [a1 _navigationTitle];
}

id objc_msgSend__notifyAccountsChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyAccountsChanged];
}

id objc_msgSend__notifyAccountsInvalidated(void *a1, const char *a2, ...)
{
  return [a1 _notifyAccountsInvalidated];
}

id objc_msgSend__notifyStateChanged(void *a1, const char *a2, ...)
{
  return [a1 _notifyStateChanged];
}

id objc_msgSend__options(void *a1, const char *a2, ...)
{
  return [a1 _options];
}

id objc_msgSend__refreshAccounts(void *a1, const char *a2, ...)
{
  return [a1 _refreshAccounts];
}

id objc_msgSend__switchSpinnerTimer(void *a1, const char *a2, ...)
{
  return [a1 _switchSpinnerTimer];
}

id objc_msgSend_acAccount(void *a1, const char *a2, ...)
{
  return [a1 acAccount];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accountTypeDescription(void *a1, const char *a2, ...)
{
  return [a1 accountTypeDescription];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bluetoothIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_didDeleteAccount(void *a1, const char *a2, ...)
{
  return [a1 didDeleteAccount];
}

id objc_msgSend_didModifyAccount(void *a1, const char *a2, ...)
{
  return [a1 didModifyAccount];
}

id objc_msgSend_displayUsername(void *a1, const char *a2, ...)
{
  return [a1 displayUsername];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_fetchSetting(void *a1, const char *a2, ...)
{
  return [a1 fetchSetting];
}

id objc_msgSend_fetchSettingSet(void *a1, const char *a2, ...)
{
  return [a1 fetchSettingSet];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isDeleting(void *a1, const char *a2, ...)
{
  return [a1 isDeleting];
}

id objc_msgSend_isFirstTimeSetup(void *a1, const char *a2, ...)
{
  return [a1 isFirstTimeSetup];
}

id objc_msgSend_isSaving(void *a1, const char *a2, ...)
{
  return [a1 isSaving];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_nmcuiAccount(void *a1, const char *a2, ...)
{
  return [a1 nmcuiAccount];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return [a1 parentAccount];
}

id objc_msgSend_parentAccountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 parentAccountIdentifier];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return [a1 parentController];
}

id objc_msgSend_pollInterval(void *a1, const char *a2, ...)
{
  return [a1 pollInterval];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return [a1 provisionedDataclasses];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_reloading(void *a1, const char *a2, ...)
{
  return [a1 reloading];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return [a1 rootController];
}

id objc_msgSend_setDefaultPollIntervalIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 setDefaultPollIntervalIfNeeded];
}

id objc_msgSend_settingsController(void *a1, const char *a2, ...)
{
  return [a1 settingsController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_showDeleteButton(void *a1, const char *a2, ...)
{
  return [a1 showDeleteButton];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierController(void *a1, const char *a2, ...)
{
  return [a1 specifierController];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_supportsPush(void *a1, const char *a2, ...)
{
  return [a1 supportsPush];
}

id objc_msgSend_syncController(void *a1, const char *a2, ...)
{
  return [a1 syncController];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_topLevelAccounts(void *a1, const char *a2, ...)
{
  return [a1 topLevelAccounts];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}