void sub_10000385C(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;
  uint64_t vars8;

  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = dispatch_queue_create("com.apple.AppConduit.ACXRemoteSystemAppList", v3);
  v2 = (void *)qword_1000A54C8;
  qword_1000A54C8 = (uint64_t)v1;
}

void sub_100003C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003C30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003C40(uint64_t a1)
{
}

uint64_t sub_100003C48(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) copy];

  return _objc_release_x1();
}

void sub_100003EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003ED4(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_appIsInstallable:givenLocallyAvailableApps:", v8, *(void *)(a1 + 40), (void)v11))objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "addObject:", v8); {
        }
          }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
}

void sub_100004294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000042BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v9)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v16 = [v15 bundleIdentifier];
          unsigned int v17 = [v16 isEqualToString:*(void *)(a1 + 40)];

          if (v17)
          {
            if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_appIsInstallable:givenLocallyAvailableApps:", v15, *(void *)(a1 + 48)))
            {
              id v19 = [v15 copy];
              uint64_t v20 = *(void *)(a1 + 64);
            }
            else
            {
              sub_100007710((uint64_t)"-[ACXRemoteSystemAppList installableSystemAppWithBundleID:error:]_block_invoke", 227, @"ACXErrorDomain", 13, 0, 0, @"Found available deletable system app %@ but it's not installable on this device.", v18, *(void *)(a1 + 40));
              id v19 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v20 = *(void *)(a1 + 56);
            }
            uint64_t v26 = *(void *)(v20 + 8);
            v27 = *(void **)(v26 + 40);
            *(void *)(v26 + 40) = v19;

            goto LABEL_18;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)
      && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v29 = sub_100007710((uint64_t)"-[ACXRemoteSystemAppList installableSystemAppWithBundleID:error:]_block_invoke", 234, @"ACXErrorDomain", 19, 0, 0, @"No available system app found with bundle ID %@ for this device.", v28, *(void *)(a1 + 40));
      uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
      v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;
    }
  }
  else
  {
    uint64_t v21 = sub_100007710((uint64_t)"-[ACXRemoteSystemAppList installableSystemAppWithBundleID:error:]_block_invoke", 219, @"ACXErrorDomain", 43, 0, 0, @"No installable system apps are available for this device", a8, v32);
    uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 8);
    v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    uint64_t v24 = *(void *)(*(void *)(a1 + 64) + 8);
    v25 = *(void **)(v24 + 40);
    *(void *)(v24 + 40) = 0;
  }
}

void sub_100004750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100004778(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];

  if (v2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 8);
    id v5 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v10 = [v9 bundleIdentifier];
          unsigned int v11 = [v10 isEqualToString:*(void *)(a1 + 40)];

          if (v11)
          {
            if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_appIsInstallable:givenLocallyAvailableApps:", v9, *(void *)(a1 + 48)))
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
            }
            else
            {
              uint64_t v16 = sub_100007710((uint64_t)"-[ACXRemoteSystemAppList systemAppIsInstallableWithBundleID:error:]_block_invoke", 267, @"ACXErrorDomain", 13, 0, 0, @"Found available deletable system app %@ but it's not installable on this device.", v12, *(void *)(a1 + 40));
              uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
              uint64_t v18 = *(void **)(v17 + 40);
              *(void *)(v17 + 40) = v16;
            }
            goto LABEL_15;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
      && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v20 = sub_100007710((uint64_t)"-[ACXRemoteSystemAppList systemAppIsInstallableWithBundleID:error:]_block_invoke", 274, @"ACXErrorDomain", 19, 0, 0, @"No available system app found with bundle ID %@ for this device.", v19, *(void *)(a1 + 40));
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = v20;
    }
  }
  else
  {
    uint64_t v13 = sub_100007710((uint64_t)"-[ACXRemoteSystemAppList systemAppIsInstallableWithBundleID:error:]_block_invoke", 259, @"ACXErrorDomain", 43, 0, 0, @"No installable system apps are available for this device", v3, v23);
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void sub_100004C98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = +[NSSet setWithArray:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setBundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:v5];
  id v6 = [*(id *)(a1 + 56) copy];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v6;

  uint64_t v9 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = *(id *)(a1 + 40);
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v14) bundleIdentifier];
        [v9 addObject:v15];

        uint64_t v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }

  uint64_t v16 = qword_1000A5608;
  if ((!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    && (uint64_t v17 = *(void **)(a1 + 56), v18 = v9, MOLogWrite(), (v16 = qword_1000A5608) == 0)
    || *(int *)(v16 + 44) >= 5)
  {
    uint64_t v17 = v5;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_callWaitersForInstallableSystemAppsWithLocallyAvailableApps:", *(void *)(a1 + 64), v17, v18, (void)v19);
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
}

void sub_100004FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004FB8(uint64_t a1)
{
}

void sub_1000050E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000050FC(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v7), "bundleIdentifier", (void)v12);
          [v8 addObject:v9];

          uint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

void sub_1000053BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000053D4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_bundleIDsOfInstallableSystemAppsForLocallyAvailableApps:", *(void *)(a1 + 40));

  return _objc_release_x1();
}

void sub_1000056C8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    id v3 = +[NSSet setWithArray:*(void *)(a1 + 40)];
    id v2 = [*(id *)(a1 + 32) bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];
    if (!v2 || ([v3 isEqualToSet:v2] & 1) == 0)
    {
      [*(id *)(a1 + 32) setBundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability:v3];
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_callWaitersForInstallableSystemAppsWithLocallyAvailableApps:", *(void *)(a1 + 48));
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_100005930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005948(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];

  if (v2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v3 = *(id *)(*(void *)(a1 + 32) + 8);
    id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v9 = [v8 bundleIdentifier];
          if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_appIsInstallable:givenLocallyAvailableApps:", v8, *(void *)(a1 + 40))&& objc_msgSend(v8, "applicationMode") != (id)3)
          {
            uint64_t v10 = [v8 counterpartIdentifiers];
            id v11 = v10;
            if (v10)
            {
              long long v20 = 0u;
              long long v21 = 0u;
              long long v18 = 0u;
              long long v19 = 0u;
              id v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
              if (v12)
              {
                id v13 = v12;
                uint64_t v14 = *(void *)v19;
                do
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v19 != v14) {
                      objc_enumerationMutation(v11);
                    }
                    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:*(void *)(*((void *)&v18 + 1) + 8 * (void)j) forKeyedSubscript:v9];
                  }
                  id v13 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
                }
                while (v13);
              }
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

void sub_100005CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005CC8(void *a1)
{
  id v2 = *(id *)(a1[4] + 16);
  if (!v2 || ([v2 isEqualToString:a1[5]] & 1) == 0)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([*(id *)(a1[4] + 8) count]) {
    goto LABEL_11;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
LABEL_9:
  }
    MOLogWrite();
LABEL_10:
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
LABEL_11:

  return _objc_release_x1();
}

void sub_100005EB0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_onQueue_bundleIDsOfInstallableSystemAppsForLocallyAvailableApps:", *(void *)(a1 + 40));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v5 = [v3 waitersForInstallableList];
    id v4 = objc_retainBlock(*(id *)(a1 + 48));
    [v5 addObject:v4];
  }
}

uint64_t sub_100006174()
{
  qword_1000A54D0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100006488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000064A4(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if (v6)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v5 = [*(id *)(a1 + 32) UUIDString];
      MOLogWrite();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2 ^ 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100006648(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) UUIDString];
    v9 = uint64_t v8 = v2;
    MOLogWrite();
  }
  id v3 = +[ACXDeviceManager sharedManager];
  id v10 = [v3 deviceForPairingID:*(void *)(a1 + 40)];

  id v4 = v10;
  if (v10)
  {
    [v10 setSyncingIsRestricted:0];
    id v5 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
    id v6 = [v5 connectionForDevice:v10];

    uint64_t v7 = +[NSString stringWithFormat:@"syncDidComplete for %@ was called", *(void *)(a1 + 32)];
    [v6 processPendingStateWithReason:v7];

LABEL_9:
    id v4 = v10;
    goto LABEL_10;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v6 = [*(id *)(a1 + 40) UUIDString];
    MOLogWrite();
    goto LABEL_9;
  }
LABEL_10:
}

void sub_100006AB8(void *a1, void *a2, void *a3, void *a4)
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100006C84;
  v11[3] = &unk_10008CC78;
  id v12 = a1;
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v7 = v15;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  sub_100006BB8(&_dispatch_main_q, v11);
}

void sub_100006BB8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008314;
  v7[3] = &unk_10008CCC8;
  id v8 = (id)os_transaction_create();
  id v9 = v3;
  id v5 = v8;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100006C84(uint64_t a1)
{
  CFOptionFlags v20 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"File A Bug", @"No Thanks", 0, &v20);
  if (!v20)
  {
    uint64_t v2 = *(void **)(a1 + 56);
    id v3 = *(id *)(a1 + 48);
    id v4 = v2;
    id v5 = objc_alloc_init((Class)NSURLComponents);
    [v5 setScheme:@"tap-to-radar"];
    [v5 setHost:@"new"];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"AppConduit"];
    [v6 addObject:v7];

    id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"all"];
    [v6 addObject:v8];

    id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"660691"];
    [v6 addObject:v9];

    id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Serious Bug"];
    [v6 addObject:v10];

    id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v6 addObject:v11];

    id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"phone,watch"];
    [v6 addObject:v12];

    if (v3 && [v3 length])
    {
      id v13 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v3];
      [v6 addObject:v13];
    }
    if (v4)
    {
      if ([v4 length])
      {
        id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:v4];
        [v6 addObject:v14];
      }
    }
    [v5 setQueryItems:v6];
    id v15 = [v5 URL];

    uint64_t v16 = +[LSApplicationWorkspace defaultWorkspace];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006F9C;
    v18[3] = &unk_10008CC50;
    id v19 = v15;
    id v17 = v15;
    [v16 openURL:v17 configuration:0 completionHandler:v18];
  }
}

void sub_100006F9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (v4 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
    MOLogWrite();
  }
}

id sub_10000702C(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = v1;
    }
    else
    {
      id v2 = +[NSString stringWithFormat:@"%@", v1];
    }
    id v3 = v2;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_1000070BC(void *a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  id v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      id v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

id sub_1000071C8(void *a1, id a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    a2 = [v3 BOOLValue];
  }

  return a2;
}

id sub_100007220(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (sub_1000070BC(v1))
      {
        id v2 = v1;
LABEL_7:
        id v3 = v2;
        goto LABEL_12;
      }
    }
    else
    {
      if (objc_opt_isKindOfClass())
      {
        id v2 = +[NSArray arrayWithObject:v1];
        goto LABEL_7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [v1 allObjects];
        if (sub_1000070BC(v4)) {
          id v3 = v4;
        }
        else {
          id v3 = 0;
        }

        goto LABEL_12;
      }
    }
  }
  id v3 = 0;
LABEL_12:

  return v3;
}

BOOL sub_10000731C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 1;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007414;
    v9[3] = &unk_10008CCA0;
    v9[4] = &v10;
    v9[5] = a2;
    v9[6] = a3;
    [v5 enumerateKeysAndObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void sub_1000073FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007414(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  id v7 = a3;
  if (a1[5] && (objc_opt_isKindOfClass() & 1) == 0 || a1[6] && (objc_opt_isKindOfClass() & 1) == 0)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *a4 = 1;
  }
}

id sub_1000074B0(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  do
  {
    if (!v2) {
      break;
    }
    id v3 = [v2 domain];
    unsigned __int8 v4 = [v3 isEqualToString:NSPOSIXErrorDomain];

    if (v4) {
      break;
    }
    id v5 = [v2 userInfo];
    uint64_t v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v2 = (void *)v6;
  }
  while (v6);

  return v2;
}

id sub_100007574(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a5;
  id v14 = a3;
  if (v13)
  {
    id v15 = [objc_alloc((Class)NSString) initWithFormat:v13 arguments:&a9];
  }
  else
  {
    id v15 = +[NSString stringWithUTF8String:strerror(a4)];
  }
  uint64_t v16 = v15;
  id v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1, &a9);
  v22[0] = NSLocalizedDescriptionKey;
  v22[1] = @"FunctionName";
  v23[0] = v16;
  v23[1] = v17;
  v22[2] = @"SourceFileLine";
  long long v18 = +[NSNumber numberWithInt:a2];
  v23[2] = v18;
  id v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

  CFOptionFlags v20 = +[NSError errorWithDomain:a3 code:a4 userInfo:v19];

  return v20;
}

id sub_100007710(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  long long v9 = sub_100007750(a1, a2, a3, a4, a5, a6, a7, (uint64_t)&a9);

  return v9;
}

id sub_100007750(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  CFOptionFlags v20 = v19;
  if (v18)
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:a8];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];
    if (v16)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_13;
      }
      id v27 = v21;
      id v28 = v16;
      uint64_t v26 = a2;
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_13;
      }
      uint64_t v26 = a2;
      id v27 = v21;
    }
    MOLogWrite();
LABEL_13:
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  long long v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1, v26, v27, v28);
  [v20 setObject:v22 forKeyedSubscript:@"FunctionName"];

  long long v23 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:@"SourceFileLine"];

  long long v24 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

NSURL *sub_100007950()
{
  return +[NSURL fileURLWithPath:@"/private/var/tmp/com.apple.AppConduit.staging" isDirectory:1];
}

id sub_100007968(void *a1)
{
  id v2 = +[NSURL fileURLWithPath:@"/private/var/tmp/com.apple.AppConduit.staging" isDirectory:1];
  id v3 = +[NSFileManager defaultManager];
  id v8 = 0;
  unsigned __int8 v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v5 = v8;

  if ((v4 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v7 = [v2 path];
      MOLogWrite();
    }
    id v2 = 0;
    if (a1) {
      *a1 = v5;
    }
  }

  return v2;
}

id sub_100007A88()
{
  v0 = +[NSFileManager defaultManager];
  id v1 = [v0 URLsForDirectory:5 inDomains:1];

  id v2 = [v1 objectAtIndexedSubscript:0];
  id v3 = [v2 URLByAppendingPathComponent:@"Logs/AppConduit" isDirectory:1];

  unsigned __int8 v4 = +[NSFileManager defaultManager];
  id v8 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtURL:v3 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
    MOLogWrite();
  }

  return v3;
}

void sub_100007BA0()
{
  sub_100007A88();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v2 URLByAppendingPathComponent:@"AppConduit.log" isDirectory:0];
  qword_1000A5608 = MOLogOpen();
  if (!qword_1000A5608) {
    syslog(3, "Failed to set up rotating logs at path %s", (const char *)[v0 fileSystemRepresentation]);
  }
  if (qword_1000A54E8 != -1) {
    dispatch_once(&qword_1000A54E8, &stru_10008CCE8);
  }
  id v1 = v0;
  [v1 fileSystemRepresentation];
  MOLogEnableDiskLogging();
}

uint64_t sub_100007CA8()
{
  if (qword_1000A54E8 != -1) {
    dispatch_once(&qword_1000A54E8, &stru_10008CCE8);
  }
  return byte_1000A54E0;
}

id sub_100007CEC()
{
  v0 = +[NSFileManager defaultManager];
  id v1 = [v0 URLsForDirectory:5 inDomains:1];

  id v2 = [v1 objectAtIndexedSubscript:0];
  id v3 = [v2 URLByAppendingPathComponent:@"AppConduit" isDirectory:1];

  return v3;
}

id sub_100007D84(void *a1)
{
  if (!a1)
  {
    id v1 = 0;
    goto LABEL_12;
  }
  id v1 = [a1 URLByAppendingPathComponent:@"AppConduit" isDirectory:1];
  id v2 = +[NSFileManager defaultManager];
  id v9 = 0;
  unsigned __int8 v3 = [v2 createDirectoryAtURL:v1 withIntermediateDirectories:0 attributes:0 error:&v9];
  id v4 = v9;

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v5 = [v4 domain];
    if ([v5 isEqualToString:NSCocoaErrorDomain])
    {
      id v6 = [v4 code];

      if (v6 == (id)516) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v8 = [v1 path];
      MOLogWrite();
    }
  }
LABEL_11:

LABEL_12:

  return v1;
}

id sub_100007EC0(void *a1, void *a2)
{
  unsigned __int8 v3 = strdup((const char *)[a1 fileSystemRepresentation]);
  if (mkdtemp(v3))
  {
    id v4 = +[NSURL fileURLWithFileSystemRepresentation:v3 isDirectory:1 relativeToURL:0];
    id v5 = 0;
  }
  else
  {
    id v6 = __error();
    uint64_t v10 = *v6;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      strerror(*v6);
      MOLogWrite();
    }
    long long v11 = sub_100007574((uint64_t)"ACXRandomDirWithTemplateURL", 374, NSPOSIXErrorDomain, v10, @"mkdtemp failed for %s", v7, v8, v9, (uint64_t)v3);
    id v5 = v11;
    if (a2)
    {
      id v5 = v11;
      id v4 = 0;
      *a2 = v5;
    }
    else
    {
      id v4 = 0;
    }
  }
  free(v3);

  return v4;
}

id sub_100007FEC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  pthread_mutex_lock(&stru_1000A4E80);
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    id v6 = Unique;
    if (v4)
    {
      uint64_t FilteredInfoPlist = _CFBundleCreateFilteredInfoPlist();
      if (FilteredInfoPlist)
      {
        uint64_t v8 = (const void *)FilteredInfoPlist;
        CFTypeID TypeID = CFDictionaryGetTypeID();
        if (TypeID == CFGetTypeID(v8))
        {
          uint64_t v10 = +[NSMutableDictionary dictionaryWithDictionary:v8];
          CFRelease(v8);
          long long v11 = +[NSLocale currentLocale];
          [v11 localeIdentifier];
          FilteredLocalizedInfoPlist = (const void *)_CFBundleCreateFilteredLocalizedInfoPlist();

          if (FilteredLocalizedInfoPlist)
          {
            CFTypeID v13 = CFDictionaryGetTypeID();
            if (v13 == CFGetTypeID(FilteredLocalizedInfoPlist))
            {
              [v10 addEntriesFromDictionary:FilteredLocalizedInfoPlist];
            }
            else
            {
              CFTypeID v19 = CFGetTypeID(FilteredLocalizedInfoPlist);
              CFStringRef v20 = CFCopyTypeIDDescription(v19);
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
                MOLogWrite();
              }
              if (v20) {
                CFRelease(v20);
              }
            }
            CFRelease(FilteredLocalizedInfoPlist);
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            MOLogWrite();
          }
          goto LABEL_28;
        }
        CFTypeID v16 = CFGetTypeID(v8);
        CFStringRef v17 = CFCopyTypeIDDescription(v16);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
          MOLogWrite();
        }
        if (v17) {
          CFRelease(v17);
        }
        CFRelease(v8);
LABEL_27:
        uint64_t v10 = 0;
LABEL_28:
        CFRelease(v6);
        goto LABEL_29;
      }
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_27;
      }
    }
    else
    {
      CFDictionaryRef InfoDictionary = CFBundleGetInfoDictionary(Unique);
      if (InfoDictionary)
      {
        id v15 = +[NSMutableDictionary dictionaryWithDictionary:InfoDictionary];
        uint64_t v10 = v15;
        if (v15) {
          [v15 removeObjectForKey:@"CFBundleInfoPlistURL"];
        }
        goto LABEL_28;
      }
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_27;
      }
    }
    MOLogWrite();
    goto LABEL_27;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v10 = 0;
LABEL_29:
  pthread_mutex_unlock(&stru_1000A4E80);

  return v10;
}

uint64_t sub_100008300(int a1)
{
  if (a1) {
    return 89;
  }
  else {
    return 78;
  }
}

void sub_100008314(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100008360(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorUntrustedAppTitle");
  id v13 = 0;
  uint64_t v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    uint64_t v9 = sub_1000084E0(@"ACXErrorUntrustedAppMessage");
    id v12 = 0;
    uint64_t v10 = +[NSString stringWithValidatedFormat:v9, @"%@ %@", &v12, v5, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

id sub_1000084E0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/AppConduit.framework"];
  id v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 firstObject];
  id v5 = v1;
  id v6 = v2;
  id v7 = v4;
  CFTypeID v19 = v3;
  if (![v5 length] || !objc_msgSend(@"Localizable", "length") || !objc_msgSend(v7, "length"))
  {
    id v13 = 0;
    id v11 = 0;
    CFArrayRef v10 = 0;
    CFArrayRef v9 = 0;
    CFArrayRef v8 = 0;
LABEL_9:
    id v12 = 0;
LABEL_10:
    id v14 = [v6 localizedStringForKey:v5 value:&stru_10008F348 table:@"Localizable"];
    goto LABEL_11;
  }
  CFArrayRef v8 = [v6 localizations];
  CFArrayRef v9 = +[NSArray arrayWithObject:v7];
  CFArrayRef v10 = CFBundleCopyLocalizationsForPreferences(v8, v9);
  if (![(__CFArray *)v10 count])
  {
    id v13 = 0;
    id v11 = 0;
    goto LABEL_9;
  }
  id v11 = [(__CFArray *)v10 objectAtIndex:0];
  id v12 = [v6 pathForResource:@"Localizable" ofType:@"strings" inDirectory:0 forLocalization:v11];
  if (!v12)
  {
    id v13 = 0;
    goto LABEL_10;
  }
  id v13 = +[NSDictionary dictionaryWithContentsOfFile:v12];
  id v14 = [v13 objectForKey:v5];
  if (!v14) {
    goto LABEL_10;
  }
LABEL_11:

  id v15 = v14;
  if (!v14)
  {
    if (!qword_1000A5608 || (id v15 = v5, *(int *)(qword_1000A5608 + 44) >= 3))
    {
      CFTypeID v16 = +[NSFileManager defaultManager];
      [v16 fileExistsAtPath:@"/System/Library/PrivateFrameworks/AppConduit.framework"];
      MOLogWrite();

      id v15 = v5;
    }
  }
  id v17 = v15;

  return v17;
}

void sub_10000877C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorCannotDownloadTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = sub_1000084E0(@"ACXErrorCannotDownloadMessage");
    id v12 = 0;
    CFArrayRef v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void *sub_1000088FC(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    sub_1000084E0(@"ACXErrorInstallationUnavailableTitle");
    result = (id)objc_claimAutoreleasedReturnValue();
    *id v3 = result;
  }
  if (a2)
  {
    sub_1000084E0(@"ACXErrorInstallationUnavailableMessage");
    result = (id)objc_claimAutoreleasedReturnValue();
    *a2 = result;
  }
  return result;
}

void sub_100008958(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorApplicationNotCompatibleTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = sub_1000084E0(@"ACXErrorApplicationNotCompatibleMessage");
    id v12 = 0;
    CFArrayRef v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_100008AD8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorApplicationNotAllowedTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = sub_1000084E0(@"ACXErrorApplicationNotAllowedMessage");
    id v12 = 0;
    CFArrayRef v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_100008C58(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorApplicationRuntimeNotSupportedTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = sub_1000084E0(@"ACXErrorApplicationRuntimeNotSupportedMessage");
    id v12 = 0;
    CFArrayRef v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_100008DD8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorArchitectureNotSupportedTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    CFArrayRef v9 = sub_1000084E0(@"ACXErrorArchitectureNotSupportedMessage");
    id v12 = 0;
    CFArrayRef v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_100008F58(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2) {
    goto LABEL_4;
  }
  id v6 = sub_1000084E0(@"ACXCannotInstallGenericTitle");
  id v10 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v10, v5 validFormatSpecifiers error];
  id v8 = v10;
  if (v7)
  {
    id v9 = v7;
    *a2 = v9;

LABEL_4:
    sub_100009040(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10005B63C();
  }

LABEL_8:
}

void sub_100009040(void *a1)
{
  if (a1)
  {
    int v2 = MGGetBoolAnswer();
    CFStringRef v3 = @"WIFI";
    if (v2) {
      CFStringRef v3 = @"WLAN";
    }
    id v4 = +[NSString stringWithFormat:@"%@_ACXDeviceNotReachableMessage", v3];
    id v5 = sub_1000084E0(v4);

    id v6 = v5;
    *a1 = v6;
  }
}

void sub_1000090E8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2) {
    goto LABEL_4;
  }
  id v6 = sub_1000084E0(@"ACXCannotUninstallGenericTitle");
  id v10 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v10, v5 validFormatSpecifiers error];
  id v8 = v10;
  if (v7)
  {
    id v9 = v7;
    *a2 = v9;

LABEL_4:
    sub_100009040(a3);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10005B63C();
  }

LABEL_8:
}

void sub_1000091D0(void *a1, void *a2)
{
  if (a1)
  {
    sub_1000084E0(@"ACXDeviceNotReachableMessageGenericTitle");
    *a1 = (id)objc_claimAutoreleasedReturnValue();
  }

  sub_100009040(a2);
}

void sub_100009224(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorInstallRestrictedTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = sub_1000084E0(@"ACXErrorInstallRestrictedMessage");
    id v12 = 0;
    id v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_1000093A4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorRemovalRestrictedTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = sub_1000084E0(@"ACXErrorRemovalRestrictedMessage");
    id v12 = 0;
    id v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_100009524(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  if (!a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  id v6 = sub_1000084E0(@"ACXErrorNotEligibleForWatchAppInstallTitle");
  id v13 = 0;
  id v7 = +[NSString stringWithValidatedFormat:v6, @"%@", &v13, v5 validFormatSpecifiers error];
  id v8 = v13;
  if (v7)
  {
    *a2 = v7;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_10005B63C();
  }

  if (a3 && v7)
  {
LABEL_10:
    id v9 = sub_1000084E0(@"ACXErrorNotEligibleForWatchAppInstallMessage");
    id v12 = 0;
    id v10 = +[NSString stringWithValidatedFormat:v9, @"%@", &v12, v5 validFormatSpecifiers error];
    id v11 = v12;
    if (v10)
    {
      *a3 = v10;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_10005B63C();
    }
  }
LABEL_15:
}

void sub_1000096A4(id a1)
{
  byte_1000A54E0 = MGGetBoolAnswer();
}

id sub_1000096CC(void *a1)
{
  id v1 = a1;
  int v2 = MobileInstallationCopyAppMetadata();
  id v3 = 0;
  if (v2)
  {
    id v4 = [v2 watchKitAppExecutableHash];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v4 = 0;
  }

  return v4;
}

BOOL sub_100009790(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  BOOL v6 = !(v3 | v4) || v3 && v4 && ([(id)v3 isEqual:v4] & 1) != 0;

  return v6;
}

BOOL sub_100009800(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  BOOL v6 = (v3 == 0) == (v4 != 0) || v3 && v4 && ![v3 isEqual:v4];

  return v6;
}

id sub_100009880()
{
  v0 = sub_100007CEC();
  id v1 = [v0 URLByAppendingPathComponent:@"TestingModeEnabled" isDirectory:0];

  return v1;
}

id sub_1000098D8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 bundleIdentifier];
  id v5 = [v3 correspondingApplicationRecord];

  id v10 = 0;
  id v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v4, objc_msgSend(v5, "isPlaceholder"), &v10);
  id v7 = v10;
  id v8 = v7;
  if (a2 && !v6) {
    *a2 = v7;
  }

  return v6;
}

id sub_1000099AC(void *a1)
{
  id v1 = a1;
  unsigned int outCount = 0;
  int v2 = objc_copyClassList(&outCount);
  uint64_t v3 = outCount;
  id v4 = v1;
  id v5 = +[NSHashTable hashTableWithOptions:770];
  id v6 = objc_opt_new();
  if (v3)
  {
    id v7 = (id *)v2;
    while (1)
    {
      if (!*v7) {
        break;
      }
      ClassName = object_getClassName(*v7);
      id v10 = sub_100009D00(ClassName);
      if (([v4 containsObject:v10] & 1) == 0)
      {
        if (NSHashGet(v5, ClassName)) {
          [v6 addObject:v10];
        }
        else {
          NSHashInsertKnownAbsent(v5, ClassName);
        }
      }

      ++v7;
      if (!--v3) {
        goto LABEL_11;
      }
    }
  }
LABEL_11:
  id v11 = [v6 copy];

  if ([v11 count])
  {
    id v12 = objc_opt_new();
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        id v14 = v2[i];
        if (!v14) {
          break;
        }
        id v15 = object_getClassName(v2[i]);
        CFTypeID v16 = sub_100009D00(v15);
        if ([v11 containsObject:v16])
        {
          id v17 = +[NSString stringWithFormat:@"%p: %s", v14, class_getImageName(v14)];
          id v18 = [v12 objectForKeyedSubscript:v16];
          if (v18)
          {
            CFTypeID v19 = v18;
            [v18 addObject:v17];
          }
          else
          {
            CFTypeID v19 = objc_opt_new();
            [v19 addObject:v17];
            [v12 setObject:v19 forKeyedSubscript:v16];
          }
        }
      }
    }
    uint64_t v30 = v2;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    CFStringRef v20 = [v12 allKeys];
    id v21 = [v20 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v32;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
          uint64_t v26 = [v12 objectForKeyedSubscript:v25];
          id v27 = [v26 copy];
          [v12 setObject:v27 forKeyedSubscript:v25];
        }
        id v22 = [v20 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v22);
    }

    id v28 = [v12 copy];
    int v2 = v30;
  }
  else
  {
    id v28 = &__NSDictionary0__struct;
  }
  free(v2);

  return v28;
}

id sub_100009D00(const char *a1)
{
  id v1 = [objc_alloc((Class)NSString) initWithBytesNoCopy:a1 length:strlen(a1) encoding:4 freeWhenDone:0];

  return v1;
}

void sub_100009D78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_100009DE8(id a1)
{
  qword_1000A54F0 = objc_alloc_init(ACXAvailableApplicationManager);

  _objc_release_x1();
}

void sub_100009F18(uint64_t a1)
{
  int v2 = sub_100007CEC();
  uint64_t v3 = [v2 URLByAppendingPathComponent:@"AvailableApps.plist" isDirectory:0];
  id v76 = 0;
  id v4 = +[NSMutableDictionary ACX_dictionaryWithContentsOfURL:v3 options:0 error:&v76];
  id v5 = v76;
  id v6 = v5;
  if (v4)
  {
    id v7 = [v4 objectForKeyedSubscript:@"Version"];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = (__CFString *)v8;
    }
    else {
      uint64_t v9 = 0;
    }

    if (v9 && [(__CFString *)v9 unsignedLongLongValue] == (id)16)
    {
      id v12 = [v4 objectForKeyedSubscript:@"AppList"];
      objc_opt_class();
      id v13 = v12;
      if (objc_opt_isKindOfClass()) {
        id v14 = v13;
      }
      else {
        id v14 = 0;
      }

      v70 = v3;
      v71 = v2;
      v68 = v14;
      v69 = v6;
      if (v14)
      {
        CFTypeID v16 = objc_opt_new();
        [*(id *)(a1 + 32) setAppList:v16];

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v17 = v14;
        id v18 = [v17 countByEnumeratingWithState:&v72 objects:v77 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v73;
          v66 = v9;
          while (2)
          {
            for (unint64_t i = 0; i != v19; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v73 != v20) {
                objc_enumerationMutation(v17);
              }
              id v22 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              objc_opt_class();
              uint64_t v23 = v22;
              if (objc_opt_isKindOfClass()) {
                long long v24 = v23;
              }
              else {
                long long v24 = 0;
              }

              if (!v24)
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
                  MOLogWrite();
                }
                [*(id *)(a1 + 32) setAppList:0];
                char v30 = 0;
                goto LABEL_50;
              }
              uint64_t v25 = [v17 objectForKeyedSubscript:v23];
              if (!v25) {
                sub_10005B6AC();
              }
              uint64_t v26 = (void *)v25;
              id v27 = [objc_alloc((Class)ACXApplication) initWithSerializedDictionary:v25 reevaluatingTrust:1];
              if (!v27)
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
                {
                  CFStringRef v64 = v23;
                  MOLogWrite();
                }

                char v30 = 1;
LABEL_50:
                uint64_t v9 = v66;
                goto LABEL_51;
              }
              id v28 = v27;
              uint64_t v29 = [*(id *)(a1 + 32) appList];
              [v29 setObject:v28 forKeyedSubscript:v23];
            }
            id v19 = [v17 countByEnumeratingWithState:&v72 objects:v77 count:16];
            char v30 = 0;
            uint64_t v9 = v66;
            if (v19) {
              continue;
            }
            break;
          }
        }
        else
        {
          char v30 = 0;
        }
LABEL_51:
      }
      else
      {
        char v30 = 0;
      }
      long long v31 = objc_msgSend(v4, "objectForKeyedSubscript:", @"LSUUID", v64);
      objc_opt_class();
      id v32 = v31;
      if (objc_opt_isKindOfClass()) {
        id v33 = v32;
      }
      else {
        id v33 = 0;
      }

      if (v33)
      {
        id v34 = [objc_alloc((Class)NSUUID) initWithUUIDString:v33];
        [*(id *)(a1 + 32) setLastLSUUID:v34];
      }
      long long v35 = [v4 objectForKeyedSubscript:@"OurDBUUID"];
      objc_opt_class();
      id v36 = v35;
      if (objc_opt_isKindOfClass()) {
        id v37 = v36;
      }
      else {
        id v37 = 0;
      }

      id v67 = v37;
      if (v37
        && (id v38 = [objc_alloc((Class)NSUUID) initWithUUIDString:v37],
            [*(id *)(a1 + 32) setOurDBUUID:v38],
            v38,
            [*(id *)(a1 + 32) ourDBUUID],
            v39 = objc_claimAutoreleasedReturnValue(),
            v39,
            v39))
      {
        v40 = [v4 objectForKeyedSubscript:@"LastSequenceNumber"];
        objc_opt_class();
        id v41 = v40;
        if (objc_opt_isKindOfClass()) {
          id v42 = v41;
        }
        else {
          id v42 = 0;
        }

        objc_msgSend(*(id *)(a1 + 32), "setLastSequenceNumber:", objc_msgSend(v42, "unsignedIntegerValue"));
        if ([*(id *)(a1 + 32) lastSequenceNumber]) {
          char v43 = v30;
        }
        else {
          char v43 = 1;
        }
      }
      else
      {
        char v43 = 1;
      }
      v44 = [v4 objectForKeyedSubscript:@"CompanionToWKBundleIDMap"];
      id v45 = [v44 mutableCopy];
      [*(id *)(a1 + 32) setCompanionToWatchAppsBundleIDMap:v45];

      if ((v43 & 1) == 0)
      {
        uint64_t v46 = [*(id *)(a1 + 32) companionToWatchAppsBundleIDMap];
        if (v46)
        {
          v47 = (void *)v46;
          uint64_t v48 = [*(id *)(a1 + 32) lastLSUUID];
          if (v48)
          {
            v49 = (void *)v48;
            v50 = [*(id *)(a1 + 32) appList];

            if (v50)
            {
              unsigned int v51 = [*(id *)(a1 + 32) _verifyInternalDataStructures];
LABEL_76:
              v52 = [v4 objectForKeyedSubscript:@"OurDBUUID"];
              objc_opt_class();
              id v53 = v52;
              if (objc_opt_isKindOfClass()) {
                id v54 = v53;
              }
              else {
                id v54 = 0;
              }

              if (v54)
              {
                v55 = v67;
                id v56 = [objc_alloc((Class)NSUUID) initWithUUIDString:v67];
                [*(id *)(a1 + 32) setOurDBUUID:v56];

                v57 = [*(id *)(a1 + 32) ourDBUUID];

                if (v57) {
                  int v58 = v51;
                }
                else {
                  int v58 = 1;
                }
              }
              else
              {
                int v58 = 1;
                v55 = v67;
              }
              v59 = [v4 objectForKeyedSubscript:@"LastSequenceNumber"];
              objc_opt_class();
              id v60 = v59;
              if (objc_opt_isKindOfClass()) {
                id v61 = v60;
              }
              else {
                id v61 = 0;
              }

              if (v61) {
                int v62 = v58;
              }
              else {
                int v62 = 1;
              }
              objc_msgSend(*(id *)(a1 + 32), "setLastSequenceNumber:", objc_msgSend(v61, "unsignedIntegerValue"));
              if (v62 == 1)
              {
                if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
                  MOLogWrite();
                }
                [*(id *)(a1 + 32) setLastLSUUID:0];
                [*(id *)(a1 + 32) setOurDBUUID:0];
                [*(id *)(a1 + 32) setLastSequenceNumber:0];
                [*(id *)(a1 + 32) setCompanionToWatchAppsBundleIDMap:0];
                [*(id *)(a1 + 32) setAppList:0];
              }

              uint64_t v3 = v70;
              int v2 = v71;
              id v6 = v69;
              goto LABEL_96;
            }
          }
          else
          {
          }
        }
      }
      unsigned int v51 = 1;
      goto LABEL_76;
    }
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
    {
LABEL_96:

      goto LABEL_97;
    }
    CFStringRef v15 = @"0";
    if (v9) {
      CFStringRef v15 = v9;
    }
    CFStringRef v64 = v15;
LABEL_23:
    MOLogWrite();
    goto LABEL_96;
  }
  id v10 = [v5 domain];
  if ([v10 isEqualToString:NSCocoaErrorDomain])
  {
    id v11 = [v6 code];

    if (v11 == (id)260)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      goto LABEL_97;
    }
  }
  else
  {
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v9 = [v3 path];
    CFStringRef v64 = v9;
    v65 = v6;
    goto LABEL_23;
  }
LABEL_97:
  v63 = +[LSApplicationWorkspace defaultWorkspace];
  [v63 addObserver:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSyncWithLS");
}

void sub_10000A930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000A948(uint64_t a1, uint64_t a2, void *a3)
{
  id result = [a3 count];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10000B8CC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 applicationMode] == (id)2 && objc_msgSend(v3, "applicationMode") != (id)2)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_11;
    }
LABEL_10:
    id v7 = [v4 bundleIdentifier];
    MOLogWrite();

LABEL_11:
    uint64_t v6 = 1;
    goto LABEL_12;
  }
  unsigned int v5 = [v4 isProfileValidated];
  if (v5 != [v3 isProfileValidated])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

void sub_10000B9F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  unsigned int v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (!v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

id sub_10000BC24(uint64_t a1)
{
  unsigned __int8 v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_infoMatchesCurrentLSDatabaseWithUUID:", 0);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 applicationsInstalledWithCompanionIdentifiers:v4];
  }
  else
  {
    return objc_msgSend(v3, "_onQueue_reSyncWithLS");
  }
}

void sub_10000C4EC(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_infoMatchesCurrentLSDatabaseWithUUID:", 0))
  {
    unsigned __int8 v2 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = *(id *)(a1 + 40);
    id v3 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v36;
      id v6 = &ASDLocalizedTextForUserPresentableError_ptr;
      uint64_t v25 = *(void *)v36;
      do
      {
        id v7 = 0;
        id v26 = v4;
        do
        {
          if (*(void *)v36 != v5) {
            objc_enumerationMutation(obj);
          }
          id v8 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * (void)v7), "bundleIdentifier", v24);
          id v9 = [objc_alloc((Class)v6[221]) initWithBundleIdentifier:v8 allowPlaceholder:1 error:0];
          id v10 = v9;
          if (!v9 || [v9 isPlaceholder])
          {
            id v11 = [*(id *)(a1 + 32) companionToWatchAppsBundleIDMap];
            id v12 = [v11 objectForKeyedSubscript:v8];

            if (v12)
            {
              uint64_t v29 = v10;
              char v30 = v8;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              id v28 = v12;
              id v13 = v12;
              id v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
              if (v14)
              {
                id v15 = v14;
                uint64_t v16 = *(void *)v32;
                do
                {
                  id v17 = 0;
                  do
                  {
                    if (*(void *)v32 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    uint64_t v18 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v17);
                    id v19 = [*(id *)(a1 + 32) appList];
                    uint64_t v20 = [v19 objectForKeyedSubscript:v18];

                    id v21 = [*(id *)(a1 + 32) appList];
                    [v21 removeObjectForKey:v18];

                    [v2 addObject:v20];
                    id v17 = (char *)v17 + 1;
                  }
                  while (v15 != v17);
                  id v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
                }
                while (v15);
              }

              id v22 = [*(id *)(a1 + 32) companionToWatchAppsBundleIDMap];
              id v8 = v30;
              [v22 setObject:0 forKeyedSubscript:v30];

              uint64_t v5 = v25;
              id v4 = v26;
              id v6 = &ASDLocalizedTextForUserPresentableError_ptr;
              id v12 = v28;
              id v10 = v29;
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              long long v24 = v8;
              MOLogWrite();
            }
          }
          id v7 = (char *)v7 + 1;
        }
        while (v7 != v4);
        id v4 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v4);
    }

    if ([v2 count])
    {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_noteNewApps:updatedApps:removedApps:transitioningAppBundleIDs:", 0, 0, v2, 0);
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeAppListToDisk");
    }
  }
  else
  {
    uint64_t v23 = *(void **)(a1 + 32);
    objc_msgSend(v23, "_onQueue_reSyncWithLS");
  }
}

void sub_10000C8D0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) trustChangeEvaluationPending])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      MOLogWrite();
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [*(id *)(a1 + 32) setTrustChangeEvaluationPending:1];
    dispatch_time_t v2 = dispatch_time(0, 1000000000);
    id v3 = [*(id *)(a1 + 32) stateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CA1C;
    block[3] = &unk_10008CD30;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v2, v3, block);
  }
}

void sub_10000CA1C(uint64_t a1)
{
  dispatch_time_t v2 = objc_opt_new();
  id v3 = objc_opt_new();
  [*(id *)(a1 + 32) setTrustChangeEvaluationPending:0];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v4 = objc_opt_new();
  uint64_t v5 = [*(id *)(a1 + 32) appList];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000CBAC;
  v10[3] = &unk_10008CDA8;
  id v6 = v3;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  id v8 = v2;
  id v13 = v8;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  if ([v7 count])
  {
    id v9 = [*(id *)(a1 + 32) appList];
    [v9 addEntriesFromDictionary:v7];

    objc_msgSend(*(id *)(a1 + 32), "_onQueue_noteTrustObtainedForApps:trustRemovedForApps:", v8, v6);
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_writeAppListToDisk");
  }
}

uint64_t sub_10000CBAC(void *a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  if ([v13 isProfileValidated])
  {
    unsigned int v4 = [v13 isTrusted];
    uint64_t v5 = [v13 appWithReevaluatedTrust];
    id v6 = v5;
    if (!v5)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_19;
      }
      id v9 = [v13 bundleIdentifier];
      MOLogWrite();
      goto LABEL_18;
    }
    unsigned int v7 = [v5 isTrusted];
    if (v4)
    {
      if ((v7 & 1) == 0)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v12 = [v6 bundleIdentifier];
          MOLogWrite();
        }
        id v8 = (void *)a1[4];
LABEL_17:
        objc_msgSend(v8, "addObject:", v6, v12);
        id v10 = (void *)a1[5];
        id v9 = [v6 bundleIdentifier];
        [v10 setObject:v6 forKeyedSubscript:v9];
LABEL_18:
      }
    }
    else if (v7)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v12 = [v6 bundleIdentifier];
        MOLogWrite();
      }
      id v8 = (void *)a1[6];
      goto LABEL_17;
    }
LABEL_19:
  }

  return _objc_release_x1();
}

void sub_10000CE64(id *a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v6);
        id v8 = objc_msgSend(a1[5], "appList", (void)v11);
        id v9 = [v8 objectForKeyedSubscript:v7];
        id v10 = [v9 copy];

        if (v10) {
          [a1[6] setObject:v10 forKeyedSubscript:v7];
        }

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_10000D0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D0EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D0FC(uint64_t a1)
{
}

void sub_10000D104(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) appList];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000D264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D27C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) appList];
  id v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

void sub_10000D3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D408(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) appList];
  id v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10000D584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D59C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appList];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D62C;
  v3[3] = &unk_10008CDD0;
  v3[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10000D62C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (([a3 isSystemApp] & 1) == 0) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

void sub_10000DA14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DA2C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) companionToWatchAppsBundleIDMap];
  id v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000DBA4(id *a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = a1[4];
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(a1[5], "companionToWatchAppsBundleIDMap", v10);
        id v9 = [v8 objectForKeyedSubscript:v7];

        if (v9 && [v9 count])
        {
          [a1[6] addObjectsFromArray:v9];
        }
        else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v10 = v7;
          MOLogWrite();
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_10000DE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DE68(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) companionToWatchAppsBundleIDMap];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v9 = [v3 firstObject];

  if (v9)
  {
    id v4 = [*(id *)(a1 + 32) appList];
    uint64_t v5 = [v4 objectForKeyedSubscript:v9];
    id v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_10000E0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E110(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v17 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 applicationState];
      unsigned int v10 = [v9 isInstalled];

      if (v10)
      {
        id v11 = objc_alloc((Class)ACXApplication);
        uint64_t v12 = *(void *)(a1 + 32);
        long long v13 = +[NSUUID UUID];
        id v14 = [v11 initWithApplicationRecord:v8 gizmoBundleIdentifier:v12 databaseUUID:v13 sequenceNumber:1];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        *a4 = 1;
      }
    }
  }
}

void sub_10000E3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E3D4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]
    && [*(id *)(a1 + 40) applicationIsInstalled:v7])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_10000E624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E63C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)]
    && [*(id *)(a1 + 40) applicationIsInstalled:v8])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_10000E7C8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) applicationIsInstalled:a2]) {
    [*(id *)(a1 + 40) unionSet:v5];
  }
}

void sub_10000E9E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) applicationIsInstalled:a2]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10000EB50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) applicationIsInstalled:v5])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, *(void *)(*((void *)&v12 + 1) + 8 * (void)v11), (void)v12);
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void sub_10000ED9C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) applicationIsInstalled:v6]) {
    [*(id *)(a1 + 40) setObject:v6 forKeyedSubscript:v5];
  }
}

void sub_10000EF14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EF2C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
  else
  {
    long long v24 = objc_opt_new();
    id v3 = [*(id *)(a1 + 32) _alwaysIgnoredSystemAppBundleIDs];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = +[LSApplicationRecord systemPlaceholderEnumerator];
    id v4 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v33;
      uint64_t v25 = *(void *)v33;
      do
      {
        id v7 = 0;
        id v26 = v5;
        do
        {
          if (*(void *)v33 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v7);
          id v9 = [v8 counterpartIdentifiers];
          uint64_t v10 = v9;
          if (v9 && [v9 count])
          {
            id v11 = objc_opt_new();
            long long v28 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            id v12 = v10;
            id v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v29;
              do
              {
                for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
                {
                  if (*(void *)v29 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
                  if (([v3 containsObject:v17] & 1) == 0) {
                    [v11 addObject:v17];
                  }
                }
                id v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
              }
              while (v14);
            }

            if ([v11 count])
            {
              uint64_t v18 = [v8 bundleIdentifier];
              id v19 = [v11 copy];
              [v24 setObject:v19 forKeyedSubscript:v18];
            }
            uint64_t v6 = v25;
            id v5 = v26;
          }

          id v7 = (char *)v7 + 1;
        }
        while (v7 != v5);
        id v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v5);
    }

    id v20 = [v24 copy];
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(v21 + 16);
    *(void *)(v21 + 16) = v20;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_1000100DC(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.AppConduit.ACXRemoteRemovabilityManager", v3);
  id v2 = (void *)qword_1000A5508;
  qword_1000A5508 = (uint64_t)v1;
}

id sub_1000101C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDelegate:0];
}

void sub_100010350(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_hasRemoteChangeClockUpdatedForUUID:sequenceNumber:", *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    id v2 = [*(id *)(a1 + 32) delegateQueue];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000103F0;
    v3[3] = &unk_10008CD30;
    v3[4] = *(void *)(a1 + 32);
    sub_100006BB8(v2, v3);
  }
}

void sub_1000103F0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 fetchRemovabilityForRemoteApps];
}

void sub_100010520(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_hasRemoteChangeClockUpdatedForUUID:sequenceNumber:", *(void *)(a1 + 40), *(void *)(a1 + 56)))
  {
    id v2 = [*(id *)(a1 + 32) currentClockUUID];
    id v3 = v2;
    if (v2 && ([v2 isEqual:*(void *)(a1 + 40)] & 1) == 0)
    {
      uint64_t v6 = [*(id *)(a1 + 32) delegateQueue];
      id v7 = v6;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000108A4;
      void v22[3] = &unk_10008CD30;
      v22[4] = *(void *)(a1 + 32);
      id v8 = v22;
    }
    else
    {
      id v4 = [*(id *)(a1 + 32) lastSequenceNumber];
      unint64_t v5 = *(void *)(a1 + 56);
      if (v5 < (unint64_t)v4)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 4) {
          MOLogWrite();
        }
        goto LABEL_25;
      }
      if (v5 - (unint64_t)v4 < 2)
      {
        id v9 = [*(id *)(a1 + 32) appRemovabilityMap];
        id v7 = [v9 mutableCopy];

        if (*(void *)(a1 + 64) == 1)
        {
          [v7 removeObjectForKey:*(void *)(a1 + 48)];
        }
        else
        {
          uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
          [v7 setObject:v10 forKeyedSubscript:*(void *)(a1 + 48)];
        }
        id v11 = [v7 copy];
        [*(id *)(a1 + 32) setAppRemovabilityMap:v11];

        [*(id *)(a1 + 32) setLastSequenceNumber:*(void *)(a1 + 56)];
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
        id v12 = [*(id *)(a1 + 32) delegateQueue];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10001092C;
        v18[3] = &unk_10008CEB8;
        void v18[4] = *(void *)(a1 + 32);
        id v13 = *(id *)(a1 + 48);
        uint64_t v14 = *(void *)(a1 + 64);
        id v19 = v13;
        uint64_t v20 = v14;
        sub_100006BB8(v12, v18);

        goto LABEL_24;
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        unint64_t v15 = v5 - (void)v4;
        MOLogWrite();
      }
      uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "delegateQueue", v15);
      id v7 = v6;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000108E8;
      v21[3] = &unk_10008CD30;
      v21[4] = *(void *)(a1 + 32);
      id v8 = v21;
    }
    sub_100006BB8(v6, v8);
LABEL_24:

LABEL_25:
    return;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 4)
  {
    id v17 = [*(id *)(a1 + 32) appRemovabilityMap];
    uint64_t v16 = [v17 objectForKeyedSubscript:*(void *)(a1 + 48)];
    MOLogWrite();
  }
}

void sub_1000108A4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 fetchRemovabilityForRemoteApps];
}

void sub_1000108E8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 fetchRemovabilityForRemoteApps];
}

void sub_10001092C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 40);
  id v4 = +[NSNumber numberWithUnsignedInteger:v3];
  id v7 = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v2 applicationsRemovabilityUpdated:v5];
}

void sub_100010AD4(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_hasRemoteChangeClockUpdatedForUUID:sequenceNumber:", *(void *)(a1 + 40), *(void *)(a1 + 56)))
  {
    id v2 = [*(id *)(a1 + 32) lastSequenceNumber];
    if ([*(id *)(a1 + 40) isEqual:*(void *)(*(void *)(a1 + 32) + 16)]
      && *(void *)(a1 + 56) < (unint64_t)v2)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 4)
      {
        uint64_t v18 = [*(id *)(a1 + 32) appRemovabilityMap];
        MOLogWrite();
      }
    }
    else
    {
      uint64_t v3 = objc_opt_new();
      id v4 = [*(id *)(a1 + 32) appRemovabilityMap];
      id v5 = [v4 mutableCopy];
      uint64_t v6 = *(void **)(a1 + 48);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100010E60;
      v25[3] = &unk_10008CF08;
      id v7 = v4;
      id v26 = v7;
      id v8 = v3;
      id v27 = v8;
      id v9 = v5;
      id v28 = v9;
      [v6 enumerateKeysAndObjectsUsingBlock:v25];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v9;
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v22;
        do
        {
          for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v22 != v13) {
              objc_enumerationMutation(v10);
            }
            [v8 setObject:&off_1000975A0 forKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          }
          id v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v12);
      }

      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v17 = v8;
        MOLogWrite();
      }
      objc_msgSend(*(id *)(a1 + 32), "setAppRemovabilityMap:", *(void *)(a1 + 48), v17);
      [*(id *)(a1 + 32) setLastSequenceNumber:v2];
      [*(id *)(a1 + 32) setCurrentClockUUID:*(void *)(a1 + 40)];
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
      unint64_t v15 = [*(id *)(a1 + 32) delegateQueue];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100010F18;
      v19[3] = &unk_10008CC28;
      v19[4] = *(void *)(a1 + 32);
      id v20 = v8;
      id v16 = v8;
      sub_100006BB8(v15, v19);
    }
  }
}

void sub_100010E60(id *a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [a1[4] objectForKeyedSubscript:v8];
  id v7 = v6;
  if (v6)
  {
    if (([v6 isEqualToNumber:v5] & 1) == 0) {
      [a1[5] setObject:v5 forKeyedSubscript:v8];
    }
    [a1[6] removeObjectForKey:v8];
  }
  else
  {
    [a1[5] setObject:v5 forKeyedSubscript:v8];
  }
}

void sub_100010F18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 applicationsRemovabilityUpdated:*(void *)(a1 + 40)];
}

void sub_1000114E4(void *a1)
{
  id v11 = a1;
  id v1 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v2 = [v1 applicationIsInstalled:@"com.apple.TestFlight"];

  if (v2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    if (v11)
    {
      uint64_t v3 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:200 options:0 error:0];
      id v4 = v3;
      if (v3)
      {
        id v5 = [v3 base64EncodedStringWithOptions:0];
        if (v5)
        {
          if (qword_1000A5528 != -1) {
            dispatch_once(&qword_1000A5528, &stru_10008CFD8);
          }
          uint64_t v6 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:qword_1000A5520];
          id v7 = +[NSString stringWithFormat:@"itms-beta-action://?action=profilesChanged&changes=%@", v6];
          id v8 = +[NSURL URLWithString:v7];
        }
        else
        {
          id v8 = 0;
        }
      }
      else
      {
        id v8 = 0;
      }

      if (!v8) {
        goto LABEL_18;
      }
    }
    else
    {
      id v8 = +[NSURL URLWithString:@"itms-beta-action://?action=profilesChanged"];
      if (!v8) {
        goto LABEL_18;
      }
    }
    id v9 = +[FBSSystemService sharedService];
    id v10 = sub_1000116E4(v8);
    [v9 openApplication:@"com.apple.TestFlight" options:v10 withResult:&stru_10008CF78];

LABEL_18:
  }
}

id sub_1000116E4(void *a1)
{
  id v1 = a1;
  v12[0] = FBSOpenApplicationOptionKeyActivateSuspended;
  v12[1] = FBSOpenApplicationOptionKeyPayloadURL;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = v1;
  unsigned int v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v11 = 0;
  id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.TestFlight" allowPlaceholder:0 error:&v11];
  id v4 = v11;
  if (v3)
  {
    id v5 = [v2 mutableCopy];
    uint64_t v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 sequenceNumber]);
    [v5 setObject:v6 forKeyedSubscript:FBSOpenApplicationOptionKeyLSSequenceNumber];

    id v7 = [v3 databaseUUID];
    id v8 = [v7 UUIDString];
    [v5 setObject:v8 forKeyedSubscript:FBSOpenApplicationOptionKeyLSCacheGUID];

    id v9 = [v5 copy];
    unsigned int v2 = v9;
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }

  return v2;
}

void sub_1000118D4(id a1, NSError *a2)
{
  if (a2 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
    MOLogWrite();
  }

  _objc_release_x1();
}

uint64_t sub_1000119E8()
{
  qword_1000A5510 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100011AE4(id a1, NSArray *a2)
{
  unsigned int v2 = a2;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (unint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
          MOLogWrite();
        }
      }
      id v4 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100011CE8(id *a1)
{
  unsigned __int8 v2 = objc_msgSend(a1[4], "isCompatibleWithCPUType:subtype:", objc_msgSend(a1[5], "cpuType"), objc_msgSend(a1[5], "cpuSubtype"));
  if ([a1[4] isBetaApp])
  {
    id v3 = [a1[6] list];
    id v4 = [a1[4] bundleIdentifier];
    unsigned int v5 = [v3 addIdentifierIfNotPresent:v4];

    if (v5)
    {
      id v6 = a1[4];
      long long v7 = +[LSApplicationWorkspace defaultWorkspace];
      unsigned int v8 = [v7 applicationIsInstalled:@"com.apple.TestFlight"];

      if (v8)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v19 = [v6 bundleIdentifier];
          MOLogWrite();
        }
        long long v9 = objc_msgSend(v6, "companionAppBundleID", v19);
        long long v10 = [v6 bundleIdentifier];
        id v11 = [v6 watchKitAppExtensionBundleID];
        id v12 = +[NSString stringWithFormat:@"itms-beta-action://?action=profiles&hostBundleID=%@&WKAppBundleID=%@&WKExtensionBundleID=%@", v9, v10, v11];

        if ((v2 & 1) == 0)
        {
          uint64_t v13 = [v12 stringByAppendingString:@"&needsUpdate=YES"];

          id v12 = (void *)v13;
        }
        uint64_t v14 = +[NSURL URLWithString:v12];
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x2020000000;
        char v25 = 0;
        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        id v16 = +[FBSSystemService sharedService];
        id v17 = sub_1000116E4(v14);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000122F4;
        v21[3] = &unk_10008D000;
        long long v23 = v24;
        uint64_t v18 = v15;
        long long v22 = v18;
        [v16 openApplication:@"com.apple.TestFlight" options:v17 withResult:v21];

        dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
        _Block_object_dispose(v24, 8);
      }
      return;
    }
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      return;
    }
  }
  else if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
  {
    return;
  }
  id v20 = [a1[4] bundleIdentifier];
  MOLogWrite();
}

void sub_100012068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001218C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) list];
  unsigned int v3 = [v2 removeIdentifier:*(void *)(a1 + 40)];

  if (v3 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)) {
    MOLogWrite();
  }
}

void sub_100012270(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableCharacterSet);
  unsigned __int8 v2 = (void *)qword_1000A5520;
  qword_1000A5520 = (uint64_t)v1;

  unsigned int v3 = (void *)qword_1000A5520;
  id v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  unsigned int v5 = (void *)qword_1000A5520;

  [v5 removeCharactersInString:@"="];
}

void sub_1000122F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100012508(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 removability]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = *(void **)(a1 + 32);
  long long v7 = [v5 bundleID];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

id sub_10001289C(uint64_t a1)
{
  return [*(id *)(a1 + 32) noteRemovabilityUpdated:*(void *)(a1 + 40) forApp:*(void *)(a1 + 48) dataStoreUUID:*(void *)(a1 + 56) sequenceNumber:*(void *)(a1 + 64)];
}

id sub_100012964(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleRemovabilityChangedNotification:", *(void *)(a1 + 40));
}

void sub_100012B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
}

uint64_t sub_100012B94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012BA4(uint64_t a1)
{
}

void sub_100012BAC(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRemovabilityInfoAndReturnRemovabilityMap");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5))
  {
    id v5 = [*(id *)(a1 + 32) removabilityChangeClock];
    MOLogWrite();
  }
}

void sub_100012CD4(id a1)
{
  qword_1000A5530 = objc_alloc_init(ACXLocalAppRemovabilityManager);

  _objc_release_x1();
}

void sub_100012E10(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRemovabilityInfoAndReturnRemovabilityMap");
  if (v2)
  {
    id v5 = v2;
    if (*(void *)(a1 + 40))
    {
      uint64_t v3 = [*(id *)(a1 + 32) removabilityChangeClock];
      **(void **)(a1 + 40) = [v3 guid];

      uint64_t v2 = v5;
    }
    if (*(void *)(a1 + 48))
    {
      id v4 = [*(id *)(a1 + 32) removabilityChangeClock];
      **(void **)(a1 + 48) = [v4 sequenceNumber];

      uint64_t v2 = v5;
    }
  }
}

void sub_100012FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012FEC(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updateRemovabilityInfoAndReturnRemovabilityMap");
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    if (*(void *)(a1 + 48))
    {
      id v5 = [*(id *)(a1 + 32) removabilityChangeClock];
      **(void **)(a1 + 48) = [v5 guid];
    }
    if (*(void *)(a1 + 56))
    {
      id v6 = [*(id *)(a1 + 32) removabilityChangeClock];
      **(void **)(a1 + 56) = [v6 sequenceNumber];
    }
  }
}

void sub_100013170(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[2])
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(a1 + 32);
  }
  id v6 = [v2 observers];
  [v6 addObject:*(void *)(a1 + 40)];
}

void sub_1000132A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) observers];
    id v5 = [v4 count];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) observers];
      [v6 removeObject:*(void *)(a1 + 40)];
    }
  }
}

BOOL sub_1000134F8(uint64_t a1)
{
  return a1 == 1 || a1 == 4;
}

uint64_t sub_100013508(unint64_t a1)
{
  return (a1 < 8) & (0xE1u >> a1);
}

id sub_100013CBC(void *a1)
{
  id v1 = a1;
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v2 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v3 = [v2 stringValue];
  uint64_t v4 = +[NSString stringWithFormat:@"%@/%@", v1, v3];

  id v5 = v4;
  id v6 = (const char *)[v5 UTF8String];
  CC_LONG v7 = strlen(v6);
  CC_MD5(v6, v7, md);
  id v8 = +[NSMutableString stringWithCapacity:32];
  for (uint64_t i = 0; i != 16; ++i)
    objc_msgSend(v8, "appendFormat:", @"%02hhx", md[i]);

  return v8;
}

uint64_t sub_1000145B4()
{
  qword_1000A5540 = (uint64_t)[objc_alloc((Class)objc_opt_class()) _initWithDelegate:0 queue:0 serviceName:@"com.apple.private.alloy.appconduit"];

  return _objc_release_x1();
}

uint64_t sub_1000146A4()
{
  qword_1000A5550 = (uint64_t)[objc_alloc((Class)objc_opt_class()) _initWithDelegate:0 queue:0 serviceName:@"com.apple.private.alloy.appconduit.v2"];

  return _objc_release_x1();
}

uint64_t sub_100014A2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100014B5C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_disarmSocketShutdownTimer");
  uint64_t v2 = [*(id *)(a1 + 32) socket];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) socket];
    id v14 = 0;
    unsigned __int8 v4 = [v3 writePingWithError:&v14];
    id v5 = v14;

    if ((v4 & 1) == 0)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v8 = v5;
        MOLogWrite();
      }
      objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", 0, v8);
    }
  }
  id v6 = [*(id *)(a1 + 32) socket];

  CC_LONG v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_beginUsingSocketAsDelegate:onQueue:tryWiFi:completion:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014CF4;
    v9[3] = &unk_10008D130;
    v9[4] = v7;
    id v10 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 48);
    char v13 = *(unsigned char *)(a1 + 64);
    objc_msgSend(v7, "_onInternalQueue_initiateConnectionWithCompletionBlock:", v9);
  }
}

void sub_100014CF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) _doneUsingSocket];
    unsigned __int8 v4 = *(void **)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100014DFC;
    v5[3] = &unk_10008CCC8;
    id v7 = *(id *)(a1 + 56);
    id v6 = v3;
    sub_100006BB8(v4, v5);
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_beginUsingSocketAsDelegate:onQueue:tryWiFi:completion:", *(void *)(a1 + 48), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56));
  }
}

uint64_t sub_100014DFC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_100014EA0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) socket];
  [v2 suspendReadSource];

  [*(id *)(a1 + 32) setDelegate:0];
  [*(id *)(a1 + 32) setQueue:0];
  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_onInternalQueue_armSocketShutdownTimer");
}

void sub_100014F8C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) socket];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) socket];
    id v7 = 0;
    unsigned __int8 v4 = [v3 writeShutdownMessageWithError:&v7];
    id v5 = v7;

    if ((v4 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
    {
      id v6 = v5;
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", 0, v6);
  }
}

void sub_10001512C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015144(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) socket];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = 0;
  unsigned __int8 v5 = [v2 writeBytes:v3 length:v4 error:&v7];
  id v6 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", v6);
    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = v6;
    }
  }
}

void sub_1000152E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000152F8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) socket];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  unsigned __int8 v4 = [v2 writeData:v3 error:&v6];
  id v5 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", v5);
    if (*(void *)(a1 + 56)) {
      **(void **)(a1 + 56) = v5;
    }
  }
}

void sub_100015494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000154AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) socket];
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  unsigned __int8 v4 = [v2 writeDictionary:v3 error:&v6];
  id v5 = v6;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", v5);
    if (*(void *)(a1 + 56)) {
      **(void **)(a1 + 56) = v5;
    }
  }
}

id sub_100015734(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v8 = 60;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v8);
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005B8BC();
  }
  [*(id *)(a1 + 32) queue];
  if (objc_claimAutoreleasedReturnValue()) {
    sub_10005B890();
  }
  uint64_t v2 = [*(id *)(a1 + 32) socket];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) socket];
    id v10 = 0;
    unsigned __int8 v4 = [v3 writeShutdownMessageWithError:&v10];
    id v5 = v10;

    if ((v4 & 1) == 0 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
    {
      id v9 = v5;
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", 0, v9);
  }
  id result = [*(id *)(a1 + 32) wiFiAsserted];
  if (result)
  {
    id v7 = [*(id *)(a1 + 32) service];
    [v7 setPreferInfraWiFi:0];

    return [*(id *)(a1 + 32) setWiFiAsserted:0];
  }
  return result;
}

id sub_100015AB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onInternalQueue_resetSocketBecauseOfError:", *(void *)(a1 + 40));
}

void sub_100015ABC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 receivedDictionaryOrData:*(void *)(a1 + 40)];
}

void sub_100016068(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 socketDidCloseWithError:*(void *)(a1 + 40)];
}

void sub_1000161E4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSocketSetupTimer");
  sub_100007710((uint64_t)"-[ACXIDSSocketManager _onQueue_startSocketSetupTimer]_block_invoke", 472, @"ACXErrorDomain", 18, 0, 0, @"Didn't receive reply to IDS setup request after %llu seconds.", v2, 130);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [*(id *)(a1 + 32) initiateCB];

  if (v3)
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) initiateCB];
    ((void (**)(void, id))v4)[2](v4, v5);

    [*(id *)(a1 + 32) setInitiateCB:0];
  }
}

uint64_t sub_100016618(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016628(uint64_t a1)
{
}

void sub_100016630(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    id v6 = +[NSDate date];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v19 = *(void *)(a1 + 32);
      MOLogWrite();
    }
    id v7 = sub_100016818(a2);

    if (v7)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) close];
    }
    else
    {
      id v11 = *(void **)(a1 + 40);
      id v12 = sub_100007574((uint64_t)"-[ACXIDSSocketManager handleIDSRelayConnection:fromID:UUID:context:]_block_invoke", 728, @"ACXErrorDomain", 4, @"Force-closing socket", v8, v9, v10, v19);
      objc_msgSend(v11, "_onInternalQueue_resetSocketBecauseOfError:", v12);

      char v13 = [ACXSocket alloc];
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100016958;
      v20[3] = &unk_10008D1D0;
      uint64_t v16 = *(void *)(a1 + 32);
      v20[4] = *(void *)(a1 + 40);
      id v17 = [(ACXSocket *)v13 initWithIDSDeviceConnection:v15 boostingMessageContext:v14 streamName:v16 creationTime:v6 readEventHandler:v20];
      [*(id *)(a1 + 40) setSocket:v17];

      uint64_t v18 = [*(id *)(a1 + 40) socket];
      [v18 resumeReadSource];
    }
  }
}

id sub_100016818(int a1)
{
  int v2 = fcntl(a1, 3);
  if (v2 == -1)
  {
    unsigned __int8 v4 = __error();
    uint64_t v9 = sub_100007574((uint64_t)"_RemoveNonBlockFromFD", 498, NSPOSIXErrorDomain, *v4, 0, v5, v6, v7, 0);
    uint64_t v10 = @"Failed to get socket flags";
    uint64_t v11 = 498;
  }
  else
  {
    uint64_t v17 = v2 & 0xFFFFFFFB;
    if (fcntl(a1, 4) != -1)
    {
      uint64_t v3 = 0;
      goto LABEL_7;
    }
    id v12 = __error();
    uint64_t v9 = sub_100007574((uint64_t)"_RemoveNonBlockFromFD", 502, NSPOSIXErrorDomain, *v12, 0, v13, v14, v15, v17);
    uint64_t v10 = @"Failed to remove nonblock from flags";
    uint64_t v11 = 502;
  }
  uint64_t v3 = sub_100007710((uint64_t)"_RemoveNonBlockFromFD", v11, @"ACXErrorDomain", 1, v9, 0, v10, v8, v18);

LABEL_7:

  return v3;
}

id sub_100016958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _readSourceReturnedDictionaryOrData:a2 error:a3];
}

void sub_100016CD0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v17 = v5;
      MOLogWrite();
    }
    uint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "initiateCB", v17);

    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 32) initiateCB];
      ((void (**)(void, id))v7)[2](v7, v5);

      [*(id *)(a1 + 32) setInitiateCB:0];
    }
  }
  else
  {
    uint64_t v8 = +[NSDate date];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v17 = *(id *)(a1 + 40);
      MOLogWrite();
    }
    uint64_t v9 = sub_100016818(a2);
    if (v9)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) close];
    }
    else
    {
      [*(id *)(a1 + 32) socket];
      if (objc_claimAutoreleasedReturnValue()) {
        sub_10005B8E8();
      }
      uint64_t v10 = [ACXSocket alloc];
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100016F00;
      v18[3] = &unk_10008D1D0;
      uint64_t v13 = *(void *)(a1 + 40);
      void v18[4] = *(void *)(a1 + 32);
      uint64_t v14 = [(ACXSocket *)v10 initWithIDSDeviceConnection:v12 boostingMessageContext:v11 streamName:v13 creationTime:v8 readEventHandler:v18];
      [*(id *)(a1 + 32) setSocket:v14];
    }
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "initiateCB", v17);

    if (v15)
    {
      uint64_t v16 = [*(id *)(a1 + 32) initiateCB];
      ((void (**)(void, void *))v16)[2](v16, v9);

      [*(id *)(a1 + 32) setInitiateCB:0];
    }
  }
}

id sub_100016F00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _readSourceReturnedDictionaryOrData:a2 error:a3];
}

uint64_t sub_1000175E4()
{
  qword_1000A5560 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100017920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017938(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017948(uint64_t a1)
{
}

void sub_100017950(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) connectionMap];
  uint64_t v3 = [*(id *)(a1 + 40) idsDeviceIdentifier];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v7 = [[ACXCompanionSyncConnection alloc] initWithDevice:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v10)
    {
      uint64_t v11 = [*(id *)(a1 + 32) connectionMap];
      uint64_t v12 = [*(id *)(a1 + 40) idsDeviceIdentifier];
      [v11 setObject:v10 forKeyedSubscript:v12];

      uint64_t v13 = [*(id *)(a1 + 32) connectionMap];
      id v14 = [v13 count];

      if (v14 == (id)1)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
          MOLogWrite();
        }
        uint64_t v15 = (const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String];
        notify_post(v15);
      }
    }
  }
}

void sub_100018614(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007710((uint64_t)"-[ACXIDSReplyContext initWithTimeout:queue:logDescription:sentID:replyHandler:completion:]_block_invoke", 73, @"ACXErrorDomain", 26, 0, 0, @"Timed out waiting for a reply to %@ message with ID %@", a8, *(void *)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) runReplyHandlerWithMessage:0 error:v9];
}

uint64_t sub_100018964(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018974(uint64_t a1)
{
}

void sub_10001897C(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.appconduit.MessagerRegistration", v1);
  uint64_t v3 = (void *)qword_1000A5570;
  qword_1000A5570 = (uint64_t)v2;

  qword_1000A5578 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000189F8(uint64_t a1)
{
  uint64_t v2 = [(id)qword_1000A5578 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [objc_alloc((Class)objc_opt_class()) initWithServiceName:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v8 = (void *)qword_1000A5578;
      objc_msgSend(v8, "setObject:forKeyedSubscript:");
    }
  }
}

void sub_100018D2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) service];
  if (!v2) {
    sub_10005B914();
  }

  if (!*(void *)(a1 + 40)) {
    sub_10005B940();
  }
  if (!*(void *)(a1 + 48)) {
    sub_10005B96C();
  }
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:");
  [*(id *)(a1 + 32) setDeviceManager:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) service];
  id v10 = [v3 devices];

  if (v10)
  {
    if ([v10 count])
    {
      [*(id *)(a1 + 40) updatedIDSDevices:v10 forMessager:*(void *)(a1 + 32)];
      goto LABEL_13;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      goto LABEL_12;
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
LABEL_12:
    uint64_t v4 = [*(id *)(a1 + 32) service];
    [*(id *)(a1 + 32) serviceName];
    v9 = uint64_t v8 = v4;
    MOLogWrite();
  }
LABEL_13:
  if ((objc_msgSend(*(id *)(a1 + 32), "serviceDelegateSet", v8, v9) & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) service];
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 internalQueue];
    [v5 addDelegate:v6 queue:v7];

    [*(id *)(a1 + 32) setServiceDelegateSet:1];
  }
}

void sub_100019084(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = [v3 idsDeviceIdentifier];
    id v5 = +[NSSet setWithObject:v4];
  }
  else
  {
    id v5 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  }
  v32[0] = IDSSendMessageOptionTimeoutKey;
  uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 72)];
  v33[0] = v6;
  v33[1] = &__kCFBooleanTrue;
  v32[1] = IDSSendMessageOptionForceLocalDeliveryKey;
  v32[2] = IDSSendMessageOptionExpectsPeerResponseKey;
  uint64_t v7 = +[NSNumber numberWithBool:v2 != 0];
  v33[2] = v7;
  v33[3] = &__kCFBooleanTrue;
  v32[3] = IDSSendMessageOptionBypassDuetKey;
  v32[4] = IDSSendMessageOptionNonWakingKey;
  v33[4] = &__kCFBooleanFalse;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:5];

  id v9 = [*(id *)(a1 + 40) service];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 80);
  id v30 = 0;
  id v31 = 0;
  unsigned int v12 = [v9 sendMessage:v10 toDestinations:v5 priority:v11 options:v8 identifier:&v31 error:&v30];
  id v13 = v31;
  id v14 = v30;

  if (v12)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v26 = [*(id *)(a1 + 40) serviceName];
      MOLogWrite();
    }
    if (v2)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10001947C;
      v28[3] = &unk_10008CC28;
      v28[4] = *(void *)(a1 + 40);
      id v15 = v13;
      id v29 = v15;
      uint64_t v16 = objc_retainBlock(v28);
      id v17 = [ACXIDSReplyContext alloc];
      double v18 = *(double *)(a1 + 72) + 30.0;
      uint64_t v19 = [*(id *)(a1 + 40) internalQueue];
      id v20 = [(ACXIDSReplyContext *)v17 initWithTimeout:v19 queue:*(void *)(a1 + 56) logDescription:v15 sentID:*(void *)(a1 + 64) replyHandler:v16 completion:v18];

      long long v21 = [*(id *)(a1 + 40) pendingReplies];
      [v21 setObject:v20 forKeyedSubscript:v15];

      long long v22 = [*(id *)(a1 + 40) pendingReplies];
      id v23 = [v22 count];

      if (v23 == (id)1)
      {
        long long v24 = (void *)os_transaction_create();
        [*(id *)(a1 + 40) setTransaction:v24];
      }
    }
  }
  else
  {
    uint64_t v25 = *(void *)(a1 + 64);
    if (v25)
    {
      (*(void (**)(uint64_t, void, id))(v25 + 16))(v25, 0, v14);
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v27 = [*(id *)(a1 + 40) serviceName];
      MOLogWrite();
    }
  }
}

void sub_10001947C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingReplies];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) pendingReplies];
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 setTransaction:0];
  }
}

void sub_1000196AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fromID];
  uint64_t v3 = +[NSSet setWithObject:v2];

  id v4 = [*(id *)(a1 + 32) idsContext];
  id v5 = [v4 outgoingResponseIdentifier];

  if (v5)
  {
    v22[0] = IDSSendMessageOptionTimeoutKey;
    uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(a1 + 64)];
    v23[0] = v6;
    v23[1] = &__kCFBooleanTrue;
    v22[1] = IDSSendMessageOptionForceLocalDeliveryKey;
    v22[2] = IDSSendMessageOptionPeerResponseIdentifierKey;
    void v22[3] = IDSSendMessageOptionNonWakingKey;
    v23[2] = v5;
    void v23[3] = &__kCFBooleanFalse;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

    uint64_t v8 = [*(id *)(a1 + 48) service];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 72);
    id v20 = 0;
    id v21 = 0;
    unsigned __int8 v11 = [v8 sendMessage:v9 toDestinations:v3 priority:v10 options:v7 identifier:&v21 error:&v20];
    id v12 = v21;
    id v13 = v20;

    if (v11)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_14;
      }
      id v14 = [*(id *)(a1 + 48) serviceName];
      MOLogWrite();
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_14;
      }
      id v14 = [*(id *)(a1 + 48) serviceName];
      id v17 = [*(id *)(a1 + 32) idsContext];
      uint64_t v19 = [v17 incomingResponseIdentifier];
      MOLogWrite();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v15 = [*(id *)(a1 + 32) idsContext];
    uint64_t v16 = [v15 incomingResponseIdentifier];
    double v18 = [*(id *)(a1 + 48) serviceName];
    MOLogWrite();
  }
  id v12 = 0;
  id v13 = 0;
LABEL_15:
}

void sub_10001A2F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v6 = v3;
    MOLogWrite();
  }
  id v4 = objc_msgSend(*(id *)(a1 + 32), "queue", v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A3E0;
  v7[3] = &unk_10008CC28;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  sub_100006BB8(v4, v7);
}

void sub_10001A3E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  id v6 = [v2 remoteAppList];

  if (v6)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 queue];
    [v6 addObserver:v3 queue:v4];

    [v6 startDatabaseSyncIfNeeded];
    id v5 = [*(id *)(a1 + 40) mutableCopy];
    [*(id *)(a1 + 32) setAppsPendingInstallOnGizmo:v5];

    [*(id *)(a1 + 32) setWaitingForInstallList:0];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_checkIfPendingInstallAppsAreInstalledInRemoteAppList:", v6);
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_completeSyncIfDone");
  }
}

void sub_10001A4F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) queue];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A5CC;
  v11[3] = &unk_10008CA40;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  sub_100006BB8(v7, v11);
}

id sub_10001A5CC(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v5 = *(void **)(a1 + 32);
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 40), "setAppsPendingInstallOnGizmo:", 0, v5);
  }
  else
  {
    id v2 = [*(id *)(a1 + 48) mutableCopy];
    [*(id *)(a1 + 40) setAppsPendingInstallOnGizmo:v2];

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v5 = [*(id *)(a1 + 40) appsPendingInstallOnGizmo];
      MOLogWrite();
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setWaitingForInstallList:", 0, v5);
  id v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_onQueue_completeSyncIfDone");
}

id sub_10001A78C(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  id v2 = objc_msgSend(*(id *)(a1 + 40), "appsPendingInstallOnGizmo", v5);
  [v2 removeObject:*(void *)(a1 + 32)];

  id v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_onQueue_completeSyncIfDone");
}

id sub_10001AB3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_applicationsChanged");
}

uint64_t start(uint64_t a1, id *a2)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v4 = dispatch_queue_create("com.apple.appconduitd.xpc_event", v3);

  uint64_t v5 = (void *)os_transaction_create();
  sub_100007BA0();
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v29 = *a2;
    id v30 = "Nov 10 2024";
    MOLogWrite();
  }
  signal(15, (void (__cdecl *)(int))1);
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);
  dispatch_source_set_event_handler(v6, &stru_10008D428);
  dispatch_activate(v6);
  uint64_t v7 = +[NSFileManager defaultManager];
  uint64_t v8 = sub_100009880();
  id v9 = [v8 path];
  unsigned int v10 = [v7 fileExistsAtPath:v9];

  if (v10)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_23;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v36 = 0;
  int v11 = MobileInstallationWaitForSystemAppMigrationToComplete();
  id v12 = 0;
  if (v11)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_19;
    }
  }
  else
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_19;
    }
    id v29 = v12;
  }
  MOLogWrite();
LABEL_19:
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  uint64_t v13 = +[NRPairedDeviceRegistry sharedInstance];
  id v14 = [v13 waitForActivePairedOrAltAccountDevice];

LABEL_23:
  sub_100007CEC();
  id v15 = objc_claimAutoreleasedReturnValue();
  if (mkdir((const char *)[v15 fileSystemRepresentation], 0x1EDu)
    && *__error() != 17
    && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3))
  {
    id v16 = [v15 fileSystemRepresentation];
    id v17 = __error();
    id v29 = v16;
    id v30 = strerror(*v17);
    MOLogWrite();
  }
  double v18 = +[ACXAvailableApplicationManager sharedApplicationManager];
  uint64_t v19 = +[ACXLaunchServicesWatcher sharedWatcher];
  id v20 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001BB8C;
  handler[3] = &unk_10008D450;
  id v35 = v18;
  id v21 = v18;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, handler);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v4, &stru_10008D490);
  signal(30, (void (__cdecl *)(int))1);
  long long v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, v4);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10001BC6C;
  v32[3] = &unk_10008CD30;
  id v33 = v20;
  id v23 = v20;
  dispatch_source_set_event_handler(v22, v32);
  dispatch_resume(v22);
  signal(31, (void (__cdecl *)(int))1);
  long long v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1FuLL, 0, v4);
  dispatch_source_set_event_handler(v24, &stru_10008D4B0);
  dispatch_resume(v24);
  +[ACXDeviceConnectionClient configureService];
  id v25 = +[ACXPairedSyncAppStateDelegate sharedAppStateSyncDelegate];
  id v26 = +[ACXPairedSyncDelegate sharedSyncDelegate];

  id v27 = +[NSRunLoop mainRunLoop];
  [v27 run];

  return 0;
}

void sub_10001BB44(id a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
  exit(0);
}

uint64_t sub_10001BB8C(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  uint64_t result = strcmp(string, "com.apple.pairedsync.syncDidComplete");
  if (result)
  {
    if (!strcmp(string, "MISUPPTrustSet") || (uint64_t result = strcmp(string, "MISUPPTrustRevoked"), !result))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      return (uint64_t)[v5 profileTrustChanged];
    }
  }
  return result;
}

void sub_10001BC6C(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v2 = [*(id *)(a1 + 32) connectionForActivePairedDevice];
  [v2 performReunionSyncWithReason:@"signaled with USR1"];
}

void sub_10001BCF8(id a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v1 = +[ACXGizmoStateManager sharedStateManager];
  id v2 = [v1 stateForActivePairedDevice];

  [v2 dumpCurrentStateToLog];
}

uint64_t sub_10001BE30()
{
  qword_1000A5588 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10001C064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C07C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001C08C(uint64_t a1)
{
}

void sub_10001C094(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateMap];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    id v6 = [[ACXGizmoState alloc] initWithDevice:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) stateMap];
      [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
}

void sub_10001C784(uint64_t a1)
{
  id v2 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  id v3 = [v2 connectionForDevice:*(void *)(a1 + 32)];

  [v3 processPendingStateWithReason:@"apps changed"];
}

void sub_10001C8FC(uint64_t a1)
{
  id v2 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  id v3 = [v2 connectionForDevice:*(void *)(a1 + 32)];

  [v3 processPendingStateWithReason:@"trust changed"];
}

void sub_10001CC98(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  if (!v2) {
    sub_10005B998();
  }
  id v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 32) companionAppBundleID];
  if (!v4) {
    sub_10005B9C4();
  }
  uint64_t v5 = (void *)v4;
  char v20 = 0;
  id v6 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_queueElementForApp:isCurrentInstall:", v3, &v20);
  if (v6)
  {
    if (!v20)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_countPending");
        MOLogWrite();
      }
      goto LABEL_27;
    }
    uint64_t v7 = [*(id *)(a1 + 40) currentInstallCoordinator];
    if (v7)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v16 = [v6 installID];
        MOLogWrite();
      }
      if (!*(unsigned char *)(a1 + 56)) {
        goto LABEL_26;
      }
      id v19 = 0;
      unsigned __int8 v8 = [v7 prioritizeWithError:&v19];
      id v9 = v19;
      if ((v8 & 1) != 0 || qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_25;
      }
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_26;
      }
      id v9 = [v6 installID];
    }
    MOLogWrite();
LABEL_25:

LABEL_26:
LABEL_27:
    qos_class_t v13 = qos_class_self();
    id v14 = dispatch_get_global_queue(v13, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001D020;
    v17[3] = &unk_10008D108;
    double v18 = (ACXLocalAppStoreInstallQueueElement *)*(id *)(a1 + 48);
    sub_100006BB8(v14, v17);

    id v10 = v18;
    goto LABEL_36;
  }
  id v10 = [[ACXLocalAppStoreInstallQueueElement alloc] initWithApp:*(void *)(a1 + 32) isUserInitiated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
  int v11 = [*(id *)(a1 + 40) installQueue];
  [v11 addObject:v10];

  id v12 = [*(id *)(a1 + 40) currentInstall];

  if (v12)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_countPending");
LABEL_34:
      MOLogWrite();
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v15 = v3;
      MOLogWrite();
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "isSuspended", v15) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_startQueue");
      goto LABEL_36;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      goto LABEL_34;
    }
  }
LABEL_36:
}

uint64_t sub_10001D020(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001D0BC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) device];
  unsigned int v3 = [v2 isReachable];

  unsigned int v4 = [*(id *)(a1 + 32) isSuspended];
  if (v3)
  {
    if (v4)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v5 = [*(id *)(a1 + 32) device];
        id v10 = [v5 idsDeviceIdentifier];
        MOLogWrite();
      }
      objc_msgSend(*(id *)(a1 + 32), "setIsSuspended:", 0, v10);
      if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_countPending"))
      {
        id v6 = [*(id *)(a1 + 32) currentInstall];

        if (!v6)
        {
          uint64_t v7 = *(void **)(a1 + 32);
          objc_msgSend(v7, "_onQueue_startQueue");
        }
      }
    }
  }
  else if ((v4 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      unsigned __int8 v8 = [*(id *)(a1 + 32) device];
      int v11 = [v8 idsDeviceIdentifier];
      MOLogWrite();
    }
    id v9 = *(void **)(a1 + 32);
    [v9 setIsSuspended:1];
  }
}

uint64_t sub_10001D7EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001D800(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001D924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001D93C(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_reportExternalInstallFailureForWatchAppBundleID:failureReason:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10001D9FC(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v8 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_countPending");
    MOLogWrite();
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "currentInstall", v8);

  if (v2)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    unsigned int v4 = [v3 currentInstall];
    uint64_t v5 = [v4 app];
    id v6 = [v5 bundleIdentifier];
    [v3 cancelInstallForWatchAppBundleID:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 32) installQueue];
  [v7 enumerateObjectsUsingBlock:&stru_10008D540];

  id v9 = [*(id *)(a1 + 32) installQueue];
  [v9 removeAllObjects];
}

void sub_10001DB1C(id a1, ACXLocalAppStoreInstallQueueElement *a2, unint64_t a3, BOOL *a4)
{
  unsigned int v4 = [(ACXLocalAppStoreInstallQueueElement *)a2 completion];
  qos_class_t v5 = qos_class_self();
  id v6 = dispatch_get_global_queue(v5, 0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001DBD4;
  v8[3] = &unk_10008D108;
  id v9 = v4;
  id v7 = v4;
  sub_100006BB8(v6, v8);
}

void sub_10001DBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  sub_100007574((uint64_t)"-[ACXLocalAppStoreInstallQueue cancelAllPendingInstalls]_block_invoke_3", 229, @"ACXErrorDomain", 6, @"Cancelled", a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
}

void sub_10001E2C8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [a1[5] internalQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  void v12[2] = sub_10001E3CC;
  v12[3] = &unk_10008C9C8;
  id v13 = v6;
  id v8 = a1[6];
  id v9 = a1[5];
  id v14 = v8;
  id v15 = v9;
  id v16 = v5;
  id v17 = a1[7];
  id v10 = v5;
  id v11 = v6;
  sub_100006BB8(v7, v12);
}

void sub_10001E3CC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      id v16 = *(id *)(a1 + 32);
      MOLogWrite();
      uint64_t v2 = *(void **)(a1 + 32);
    }
    id v3 = v2;
  }
  else
  {
    if (![*(id *)(a1 + 48) cancelCurrentOperation])
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v23 = 0;
      id v7 = +[IXGizmoInstallingAppInstallCoordinator existingCoordinatorForAppWithBundleID:v11 error:&v23];
      id v12 = v23;
      id v3 = 0;
      if (!v7)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v15 = *(void *)(a1 + 40);
          id v16 = v12;
          MOLogWrite();
        }
        id v3 = v12;
      }

      if (v3) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v15 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    sub_100007574((uint64_t)"-[ACXLocalAppStoreInstallQueue _onQueue_deQueueNextOperation]_block_invoke_2", 341, @"ACXErrorDomain", 6, @"Operation cancelled.", v4, v5, v6, v15);
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) _cancelCoordinatorForInstallWithWatchBundleID:*(void *)(a1 + 40) withReason:v3];
  }
  id v7 = 0;
  if (v3)
  {
LABEL_12:
    objc_msgSend(*(id *)(a1 + 48), "currentCompletionBlock", v15, v16);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      [*(id *)(a1 + 48) setCurrentCompletionBlock:0];
      qos_class_t v9 = qos_class_self();
      id v10 = dispatch_get_global_queue(v9, 0);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001E730;
      v20[3] = &unk_10008CCC8;
      id v22 = v8;
      id v21 = v3;
      sub_100006BB8(v10, v20);
    }
    objc_msgSend(*(id *)(a1 + 48), "_onQueue_deQueueNextOperation");
    goto LABEL_26;
  }
LABEL_21:
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = *(id *)(a1 + 56);
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 64), "setInstallID:", *(void *)(a1 + 56), v15, v16);
  [v7 setObserver:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) setCurrentInstallCoordinator:v7];
  id v8 = [*(id *)(a1 + 48) currentCompletionBlock];
  if (v8)
  {
    [*(id *)(a1 + 48) setCurrentCompletionBlock:0];
    qos_class_t v13 = qos_class_self();
    id v14 = dispatch_get_global_queue(v13, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001E744;
    v17[3] = &unk_10008CCC8;
    id v8 = v8;
    id v18 = 0;
    id v19 = v8;
    sub_100006BB8(v14, v17);
  }
LABEL_26:
}

uint64_t sub_10001E730(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001E744(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001E758(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001EDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001EDF8(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_installIsPendingForWatchApp:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_10001EEE4(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "currentInstall", v9);
  id v3 = v2;
  uint64_t v11 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 app];
    uint64_t v5 = [v4 bundleIdentifier];
    unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    id v3 = v11;
    if (v6)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v10 = *(void *)(a1 + 32);
        MOLogWrite();
      }
      id v7 = objc_msgSend(*(id *)(a1 + 40), "_onQueue_deQueueNextOperation", v10);
      goto LABEL_13;
    }
  }
  id v7 = (id)qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v7 = (id)MOLogWrite();
LABEL_13:
    id v3 = v11;
  }

  return _objc_release_x1(v7, v3);
}

void sub_10001F114(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentInstallCoordinator];
  id v3 = [v2 uniqueIdentifier];
  uint64_t v4 = [*(id *)(a1 + 40) uniqueIdentifier];
  unsigned __int8 v5 = [v3 isEqual:v4];

  if (v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v9 = IXStringForClientID();
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v8 = v6;
      MOLogWrite();
    }
    id v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "bundleID", v8, v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_onQueue_reportExternalInstallFailureForWatchAppBundleID:failureReason:", v11, *(void *)(a1 + 48));
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    MOLogWrite();
  }
}

id sub_10001F684(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_configureRemoteRemovabilityManagerAndFetchRemoteRemovabilityStatus");
}

id sub_10001F68C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginReunionSync");
}

id sub_10001F9F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_fetchAvailableSystemApps");
}

id sub_10001FCF8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_configureRemoteAppListsAndFetchSystemAppsIfNeeded");
  uint64_t v2 = [*(id *)(a1 + 32) remoteAppList];
  [v2 remoteDeviceConnected];

  id v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_onQueue_configureRemoteRemovabilityManagerAndFetchRemoteRemovabilityStatus");
}

void sub_10001FD4C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteAppList];
  [v1 remoteDeviceDisconnected];
}

void sub_10001FE18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applicationManager];
  id v3 = [v2 allAvailableApps];

  uint64_t v4 = [*(id *)(a1 + 32) device];
  unsigned __int8 v5 = [v4 osVersion];

  uint64_t v6 = [*(id *)(a1 + 32) device];
  unint64_t v7 = (unint64_t)[v6 cpuType];

  uint64_t v21 = a1;
  uint64_t v8 = [*(id *)(a1 + 32) device];
  id v9 = [v8 cpuSubtype];

  id v23 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    unsigned int v22 = v7;
    do
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v16 = [v10 objectForKeyedSubscript:v15];
        if ([v16 isTrusted]
          && ([v16 isSystemApp] & 1) == 0
          && [v16 isCompatibleWithOSVersion:v5]
          && [v16 isRuntimeCompatibleWithOSVersion:v5]
          && [v16 isCompatibleWithCPUType:v7 subtype:v9]
          && [v16 isEligibleForWatchAppInstall])
        {
          id v17 = [v16 companionAppBundleID];
          id v18 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v17];
          [v23 setObject:v18 forKeyedSubscript:v15];

          unint64_t v7 = v22;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v12);
  }

  id v19 = [*(id *)(v21 + 32) gizmoState];
  unsigned int v20 = [v19 setInstallStatusForApps:v23 sendNotification:1 withUpdatePredicate:&stru_10008D5A8];

  if (v20) {
    objc_msgSend(*(id *)(v21 + 32), "_onQueue_processPendingGizmoState");
  }
}

ACXGizmoApplicationInstallStatusItem *__cdecl sub_1000200A4(id a1, NSString *a2, NSString *a3, ACXGizmoApplicationInstallStatusItem *a4, ACXGizmoApplicationInstallStatusItem *a5)
{
  uint64_t v6 = a4;
  unint64_t v7 = a5;
  if ((char *)[(ACXGizmoApplicationInstallStatusItem *)v6 installStatus] - 1 >= (char *)2) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = v6;
  }
  id v9 = v8;

  return v9;
}

void sub_100020224(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) applicationManager];
  uint64_t v2 = [v1 allAvailableApps];

  id v3 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v4 objectForKeyedSubscript:v9];
        if (([v10 isSystemApp] & 1) == 0)
        {
          id v11 = [v10 companionAppBundleID];
          id v12 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:5 companionBundleID:v11];
          [v3 setObject:v12 forKeyedSubscript:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v13 = [*(id *)(a1 + 32) gizmoState];
  unsigned int v14 = [v13 setInstallStatusForApps:v3 sendNotification:1 withUpdatePredicate:0];

  if (v14) {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_processPendingGizmoState");
  }
}

void sub_10002047C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) installQueue];
  [v2 cancelAllPendingInstalls];

  id v3 = [*(id *)(a1 + 32) appStoreLocalQueue];
  [v3 cancelAllPendingInstalls];

  id v4 = [*(id *)(a1 + 32) gizmoState];
  [v4 clearPendingInstallations];
}

void sub_100020D4C(void *a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  uint64_t v3 = a1[4];
  uint64_t v2 = (void *)a1[5];
  id v4 = (id)objc_opt_new();
  objc_msgSend(v2, "_onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:appsWithStoreMetadata:isUserInitiated:exclusiveInstall:withCompletion:", v3, v4, 0, 1, a1[6]);
}

void sub_100020F2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applicationManager];
  uint64_t v3 = [v2 gizmoAppWithBundleID:*(void *)(a1 + 40)];

  unsigned int v5 = [v3 isBetaApp];
  if (v5)
  {
    id v6 = +[ACXTestFlightInstallQueue sharedInstaller];
    [v6 removePendingInstallForApp:v3];

    if (v3)
    {
      if (([v3 isTrusted] & 1) == 0)
      {
        uint64_t v7 = [*(id *)(a1 + 32) gizmoState];
        uint64_t v8 = *(void *)(a1 + 40);
        uint64_t v9 = [v3 companionAppBundleID];
        [v7 setInstallStatus:4 forApp:v8 companionBundleID:v9];

        goto LABEL_18;
      }
      goto LABEL_7;
    }
    long long v27 = [*(id *)(a1 + 32) gizmoState];
    uint64_t v28 = *(void *)(a1 + 40);
    id v29 = [0 companionAppBundleID];
    [v27 setInstallStatus:4 forApp:v28 companionBundleID:v29];

LABEL_21:
    uint64_t v30 = *(void *)(a1 + 56);
    if (!v30) {
      goto LABEL_30;
    }
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 543, @"ACXErrorDomain", 19, 0, 0, @"No WatchKit app is installed with the identifier %@", v4, *(void *)(a1 + 40));
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v30 + 16))(v30, 0, v31);
    goto LABEL_23;
  }
  if (!v3) {
    goto LABEL_21;
  }
  if (([v3 isTrusted] & 1) == 0)
  {
LABEL_18:
    if (*(void *)(a1 + 56))
    {
      unsigned int v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 552, @"ACXErrorDomain", 22, 0, 0, @"App %@ is not trusted so it cannot be installed.", v10, *(void *)(a1 + 40));
      long long v25 = [v3 applicationName];
      uint64_t v26 = 1;
LABEL_28:
      v40 = sub_100051464(v26, v14, v25, (void *)1);

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_29:

      goto LABEL_30;
    }
    goto LABEL_30;
  }
LABEL_7:
  id v11 = [*(id *)(a1 + 32) device];
  id v12 = [v11 osVersion];
  unsigned __int8 v13 = [v3 isRuntimeCompatibleWithOSVersion:v12];

  if (v13)
  {
    if ([v3 isEmbeddedPlaceholder])
    {
      unsigned int v14 = [v3 companionAppBundleID];
      uint64_t v15 = [*(id *)(a1 + 32) gizmoState];
      [v15 setInstallStatus:1 forApp:*(void *)(a1 + 40) companionBundleID:v14];

      uint64_t v16 = *(void *)(a1 + 64);
      if (v16) {
        (*(void (**)(void))(v16 + 16))();
      }
      long long v17 = [*(id *)(a1 + 32) device];
      unsigned int v18 = [v17 supportsStandaloneApps];

      if (v18)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v66 = *(void *)(a1 + 40);
          MOLogWrite();
        }
        uint64_t v19 = objc_msgSend(v3, "storeMetadata", v66);
        uint64_t v21 = (void *)v19;
        if (v19)
        {
          unsigned int v22 = *(void **)(a1 + 32);
          uint64_t v74 = *(void *)(a1 + 40);
          uint64_t v75 = v19;
          id v23 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
          objc_msgSend(v22, "_onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:appsWithStoreMetadata:isUserInitiated:exclusiveInstall:withCompletion:", &__NSArray0__struct, v23, 1, 0, 0);

          uint64_t v24 = *(void *)(a1 + 56);
          if (v24) {
            (*(void (**)(uint64_t, uint64_t, void))(v24 + 16))(v24, 1, 0);
          }
        }
        else
        {
          id v60 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 590, @"ACXErrorDomain", 51, 0, 0, @"Failed to load metadata for app %@", v20, *(void *)(a1 + 40));
          id v61 = *(void **)(a1 + 32);
          uint64_t v62 = *(void *)(a1 + 40);
          v63 = [v3 applicationName];
          id v73 = 0;
          objc_msgSend(v61, "_onQueue_installFailedForWatchAppBundleID:companionBundleID:withError:appName:userInitiated:userPresentableError:", v62, v14, v60, v63, 1, &v73);
          id v64 = v73;

          uint64_t v65 = *(void *)(a1 + 56);
          if (v65) {
            (*(void (**)(uint64_t, void, id))(v65 + 16))(v65, 0, v64);
          }
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_triggerLocalAppStoreInstallForWatchApp:userInitiated:completion:", v3, 1, *(void *)(a1 + 56));
      }
      goto LABEL_29;
    }
    id v41 = [*(id *)(a1 + 32) device];
    id v42 = [v41 cpuType];
    char v43 = [*(id *)(a1 + 32) device];
    LOBYTE(v42) = objc_msgSend(v3, "isCompatibleWithCPUType:subtype:", v42, objc_msgSend(v43, "cpuSubtype"));

    if ((v42 & 1) == 0)
    {
      if (v5)
      {
        id v54 = [*(id *)(a1 + 32) gizmoState];
        uint64_t v55 = *(void *)(a1 + 40);
        id v56 = [v3 companionAppBundleID];
        [v54 setInstallStatus:4 forApp:v55 companionBundleID:v56];
      }
      if (*(void *)(a1 + 56))
      {
        unsigned int v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 612, @"ACXErrorDomain", 38, 0, 0, @"App %@ does not have an architecture slice that is supported on this watch.", v44, *(void *)(a1 + 40));
        long long v25 = [v3 applicationName];
        uint64_t v26 = 7;
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    if (([v3 isEligibleForWatchAppInstall] & 1) == 0)
    {
      if (v5)
      {
        v57 = [*(id *)(a1 + 32) gizmoState];
        uint64_t v58 = *(void *)(a1 + 40);
        v59 = [v3 companionAppBundleID];
        [v57 setInstallStatus:4 forApp:v58 companionBundleID:v59];
      }
      if (*(void *)(a1 + 56))
      {
        unsigned int v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 623, @"ACXErrorDomain", 59, 0, 0, @"App %@ is not eligible for watch so it cannot be installed.", v45, *(void *)(a1 + 40));
        long long v25 = [v3 applicationName];
        uint64_t v26 = 12;
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    uint64_t v46 = [v3 companionAppBundleID];
    v47 = [*(id *)(a1 + 32) gizmoState];
    [v47 setInstallStatus:1 forApp:*(void *)(a1 + 40) companionBundleID:v46];

    uint64_t v48 = *(void *)(a1 + 64);
    if (v48) {
      (*(void (**)(void))(v48 + 16))();
    }
    v49 = [*(id *)(a1 + 32) installQueue];
    v50 = [*(id *)(a1 + 32) gizmoState];
    unsigned int v51 = [v50 preferencesForApplicationWithIdentifier:*(void *)(a1 + 40)];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_10002179C;
    v68[3] = &unk_10008D5D0;
    v52 = *(void **)(a1 + 40);
    uint64_t v53 = *(void *)(a1 + 48);
    v68[4] = *(void *)(a1 + 32);
    id v69 = v52;
    id v70 = v46;
    id v71 = v3;
    id v72 = *(id *)(a1 + 56);
    id v31 = v46;
    [v49 installWatchApp:v71 withPriority:2 appSettings:v51 provisioningProfileInfo:v53 isUserInitiated:1 completion:v68];

LABEL_23:
    goto LABEL_30;
  }
  if (v5)
  {
    long long v32 = [*(id *)(a1 + 32) gizmoState];
    uint64_t v33 = *(void *)(a1 + 40);
    long long v34 = [v3 companionAppBundleID];
    [v32 setInstallStatus:4 forApp:v33 companionBundleID:v34];
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v35 = *(void *)(a1 + 40);
    uint64_t v36 = [v3 watchKitVersion];
    long long v37 = [*(id *)(a1 + 32) gizmoState];
    long long v38 = [v37 device];
    id v67 = [v38 osVersion];
    unsigned int v14 = sub_100007710((uint64_t)"-[ACXCompanionSyncConnection _installWatchAppWithBundleID:withProvisioningProfileInfo:installationPendingBlock:completionWithError:]_block_invoke", 563, @"ACXErrorDomain", 37, 0, 0, @"App %@ is using WatchKit version %@ which is not supported on watchOS %@.", v39, v35);

    long long v25 = [v3 applicationName];
    uint64_t v26 = 6;
    goto LABEL_28;
  }
LABEL_30:
}

void sub_10002179C(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v6 = (void *)a1[7];
  id v7 = a2;
  id v8 = [v6 applicationName];
  [v3 _installQueuedOrCompletedForWatchBundleID:v4 companionAppBundleID:v5 withName:v8 userInitiated:1 withError:v7 withCompletion:a1[8]];
}

BOOL sub_100021A1C(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v7 = [(NSURL *)v4 path];
    MOLogWrite();
  }
  return 1;
}

id sub_100022400(void *a1)
{
  id v1 = a1;
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10002245C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _installQueuedOrCompletedForWatchBundleID:*(void *)(a1 + 40) companionAppBundleID:*(void *)(a1 + 48) withName:*(void *)(a1 + 56) userInitiated:*(unsigned __int8 *)(a1 + 72) withError:a2 withCompletion:*(void *)(a1 + 64)];
}

void sub_1000225E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) installQueue];
  [v2 acknowledgeInstallationForWatchApp:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 48) domain];
  if ([v3 isEqualToString:@"ACXErrorDomain"])
  {
    id v4 = [*(id *)(a1 + 48) code];

    if (v4 == (id)6)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      uint64_t v5 = [*(id *)(a1 + 32) gizmoState];
      [v5 setInstallStatus:4 forApp:*(void *)(a1 + 40) companionBundleID:*(void *)(a1 + 56)];

      id v6 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      id v7 = +[NSArray arrayWithObjects:&v20 count:1];
      objc_msgSend(v6, "_onQueue_sendRemoveMessageForBundleIDs:isUserInitiated:withCompletion:", v7, 1, 0);

      uint64_t v8 = *(void *)(a1 + 72);
      if (v8) {
        (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 10, *(void *)(a1 + 48));
      }
      return;
    }
  }
  else
  {
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    MOLogWrite();
  }
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 80);
  id v19 = 0;
  objc_msgSend(v9, "_onQueue_installFailedForWatchAppBundleID:companionBundleID:withError:appName:userInitiated:userPresentableError:", v10, v11, v12, v13, v14, &v19, v17, v18);
  id v15 = v19;
  uint64_t v16 = *(void *)(a1 + 72);
  if (v16) {
    (*(void (**)(uint64_t, void, id))(v16 + 16))(v16, 0, v15);
  }
}

void sub_100022938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100022960(uint64_t a1)
{
}

void sub_100022968(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) remoteAppList];
  uint64_t v2 = [v5 applicationForBundleID:*(void *)(a1 + 40) error:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100022AB0(id *a1)
{
  uint64_t v2 = [a1[4] bundleIdentifier];
  uint64_t v3 = [a1[5] installQueue];
  unsigned int v4 = [v3 cancelInstallForWatchAppBundleID:v2];

  if (v4
    || ([a1[5] appStoreLocalQueue],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 cancelInstallForWatchAppBundleID:v2],
        v5,
        v6))
  {
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v7 = [a1[4] companionAppBundleID];
    uint64_t v8 = [a1[5] gizmoState];
    [v8 cancelUpdatePendingForCompanionApp:v7];

    uint64_t v9 = [a1[5] gizmoState];
    [v9 setInstallStatus:4 forApp:v2 companionBundleID:v7];

    id v10 = a1[5];
    uint64_t v16 = v2;
    uint64_t v11 = +[NSArray arrayWithObjects:&v16 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_100022C98;
    v12[3] = &unk_10008D6B0;
    id v13 = v2;
    id v14 = a1[4];
    id v15 = a1[6];
    objc_msgSend(v10, "_onQueue_sendRemoveMessageForBundleIDs:isUserInitiated:withCompletion:", v11, 1, v12);
  }
}

void sub_100022C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (!v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_15;
  }
  unsigned int v4 = [v3 domain];
  if (![v4 isEqualToString:@"ACXErrorDomain"])
  {

LABEL_10:
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = v11;
      MOLogWrite();
    }
    unsigned int v6 = objc_msgSend(*(id *)(a1 + 40), "applicationName", v9, v10);
    uint64_t v7 = 8;
    goto LABEL_14;
  }
  id v5 = [v11 code];

  if (v5 != (id)58) {
    goto LABEL_10;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v11;
    MOLogWrite();
  }
  unsigned int v6 = objc_msgSend(*(id *)(a1 + 40), "applicationName", v9, v10);
  uint64_t v7 = 11;
LABEL_14:
  uint64_t v8 = sub_100051464(v7, v11, v6, (void *)2);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:
}

void sub_10002302C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v7 = [*(id *)(a1 + 32) device];
      uint64_t v16 = [v7 idsDeviceIdentifier];
      id v17 = v6;
      MOLogWrite();
    }
    if (*(void *)(a1 + 40) > 4uLL)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      id v15 = objc_msgSend(*(id *)(a1 + 32), "internalQueue", v16, v17);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000232FC;
      v20[3] = &unk_10008CD30;
      void v20[4] = *(void *)(a1 + 32);
      dispatch_sync(v15, v20);
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      uint64_t v8 = (void *)os_transaction_create();
      dispatch_time_t v9 = dispatch_time(0, 5000000000);
      id v10 = [*(id *)(a1 + 32) internalQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000232E8;
      block[3] = &unk_10008CEB8;
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      id v22 = v8;
      uint64_t v23 = v12;
      block[4] = v11;
      id v13 = v8;
      dispatch_after(v9, v10, block);
    }
  }
  else
  {
    id v14 = [*(id *)(a1 + 32) internalQueue];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100023308;
    v18[3] = &unk_10008CC28;
    void v18[4] = *(void *)(a1 + 32);
    id v19 = v5;
    sub_100006BB8(v14, v18);
  }
}

id sub_1000232E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_fetchRemovabilityForRemoteAppsWithRetryCount:", *(void *)(a1 + 48) + 1);
}

id sub_1000232FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRemoteRemovabilityFetchRunning:0];
}

id sub_100023308(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleRemoteRemovabilityFetchResponse:", *(void *)(a1 + 40));
}

void sub_1000238D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 setAvailableSystemAppFetchRunning:0];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v8 = [*(id *)(a1 + 32) device];
      uint64_t v16 = [v8 idsDeviceIdentifier];
      MOLogWrite();
    }
    if (*(void *)(a1 + 40) > 9uLL)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      dispatch_time_t v9 = (void *)os_transaction_create();
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      uint64_t v11 = [*(id *)(a1 + 32) internalQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100023B34;
      block[3] = &unk_10008CEB8;
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v20 = v9;
      uint64_t v21 = v13;
      block[4] = v12;
      id v14 = v9;
      dispatch_after(v10, v11, block);
    }
  }
  else
  {
    id v15 = [v7 internalQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100023B48;
    v17[3] = &unk_10008CC28;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = v5;
    sub_100006BB8(v15, v17);
  }
}

id sub_100023B34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_fetchAvailableSystemAppsWithRetryCount:", *(void *)(a1 + 48) + 1);
}

id sub_100023B48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleSADAppInfoResponse:", *(void *)(a1 + 40));
}

void sub_100025E2C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v9] & 1) == 0
    && ([v5 isSystemApp] & 1) == 0)
  {
    if ([v5 isTrusted]
      && [v5 isCompatibleWithOSVersion:*(void *)(a1 + 40)]
      && [v5 isRuntimeCompatibleWithOSVersion:*(void *)(a1 + 40)]
      && [v5 isCompatibleWithCPUType:*(unsigned int *)(a1 + 64) subtype:*(unsigned int *)(a1 + 68)]&& objc_msgSend(v5, "isEligibleForWatchAppInstall"))
    {
      [*(id *)(a1 + 48) addObject:v9];
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v8 = v9;
        MOLogWrite();
      }
      id v6 = objc_msgSend(v5, "companionAppBundleID", v8);
      uint64_t v7 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:5 companionBundleID:v6];
      [*(id *)(a1 + 56) setObject:v7 forKeyedSubscript:v9];
    }
  }
}

void sub_100025F80(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    uint64_t v3 = 40;
    if (!*(unsigned char *)(a1 + 56)) {
      uint64_t v3 = 48;
    }
    [*(id *)(a1 + v3) addObject:v4];
  }
}

uint64_t sub_100025FF4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if ([*(id *)(a1 + 32) containsObject:v8])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v15 = v7;
      id v16 = v8;
LABEL_16:
      MOLogWrite();
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 112) && [*(id *)(a1 + 40) containsObject:v7])
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
      goto LABEL_11;
    }
    id v15 = v7;
    id v16 = v8;
    goto LABEL_10;
  }
  id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v7];

  if (!v9)
  {
    if ([*(id *)(a1 + 56) containsObject:v7]) {
      goto LABEL_29;
    }
    uint64_t v11 = [*(id *)(a1 + 64) objectForKeyedSubscript:v7];

    uint64_t v12 = [*(id *)(a1 + 72) objectForKeyedSubscript:v7];
    uint64_t v13 = v12;
    if (v12)
    {
      char v14 = [v12 isSystemApp] ^ 1;
      if (v11) {
        goto LABEL_28;
      }
    }
    else
    {
      char v14 = 0;
      if (v11)
      {
LABEL_28:

LABEL_29:
        if (a4 == 4)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            id v15 = v7;
            MOLogWrite();
          }
          a4 = 4;
          goto LABEL_17;
        }
        if ([*(id *)(a1 + 80) containsObject:v7])
        {
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
            goto LABEL_11;
          }
          id v15 = v7;
        }
        else if ([*(id *)(a1 + 88) containsObject:v7])
        {
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
            goto LABEL_11;
          }
          id v15 = v7;
        }
        else
        {
          if (a4 != 1)
          {
            if (([*(id *)(a1 + 56) containsObject:v7] & 1) == 0)
            {
              if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
              {
                a4 = 5;
                goto LABEL_17;
              }
              id v15 = v7;
              a4 = 5;
              goto LABEL_16;
            }
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              id v15 = v7;
              MOLogWrite();
            }
            a4 = 2;
            goto LABEL_17;
          }
          if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5)
          {
LABEL_11:
            a4 = 1;
            goto LABEL_17;
          }
          id v15 = v7;
        }
LABEL_10:
        MOLogWrite();
        goto LABEL_11;
      }
    }
    if ((v14 & 1) == 0)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v15 = v7;
        MOLogWrite();
      }

      a4 = 0;
      goto LABEL_17;
    }
    goto LABEL_28;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v15 = v7;
    goto LABEL_16;
  }
LABEL_17:
  objc_msgSend(*(id *)(a1 + 80), "removeObject:", v7, v15, v16);
  [*(id *)(a1 + 88) removeObject:v7];
  [*(id *)(a1 + 96) removeObject:v7];
  [*(id *)(a1 + 104) removeObject:v7];
  [*(id *)(a1 + 40) removeObject:v7];

  return a4;
}

id sub_1000263B8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v67 objects:v75 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v68 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            v49 = v8;
            uint64_t v50 = v7;
            MOLogWrite();
          }
          id v9 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", 1, v8, v49, v50);
          [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v7];
        }
        id v4 = [v2 countByEnumeratingWithState:&v67 objects:v75 count:16];
      }
      while (v4);
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v10 = *(id *)(a1 + 56);
  id v11 = [v10 countByEnumeratingWithState:&v63 objects:v74 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v64;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v64 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v63 + 1) + 8 * (void)j);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v49 = *(void **)(*((void *)&v63 + 1) + 8 * (void)j);
          MOLogWrite();
        }
        id v16 = objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v15, v49);
        id v17 = [v16 companionAppBundleID];

        if (!v17)
        {
          id v17 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
        }
        id v18 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v17];
        [*(id *)(a1 + 48) setObject:v18 forKeyedSubscript:v15];
      }
      id v12 = [v10 countByEnumeratingWithState:&v63 objects:v74 count:16];
    }
    while (v12);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v19 = *(id *)(a1 + 72);
  id v20 = [v19 countByEnumeratingWithState:&v59 objects:v73 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v60;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(void *)v60 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v59 + 1) + 8 * (void)k);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v49 = *(void **)(*((void *)&v59 + 1) + 8 * (void)k);
          MOLogWrite();
        }
        long long v25 = objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v24, v49);
        uint64_t v26 = [v25 companionAppBundleID];

        if (!v26)
        {
          uint64_t v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:v24];
        }
        long long v27 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v26];
        [*(id *)(a1 + 48) setObject:v27 forKeyedSubscript:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v59 objects:v73 count:16];
    }
    while (v21);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v28 = *(id *)(a1 + 80);
  id v29 = [v28 countByEnumeratingWithState:&v55 objects:v72 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v55 + 1) + 8 * (void)m);
        long long v34 = [*(id *)(a1 + 64) objectForKeyedSubscript:v33];
        uint64_t v35 = [v34 companionAppBundleID];

        if (!v35)
        {
          uint64_t v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:v33];
        }
        if (*(unsigned char *)(a1 + 97))
        {
          if (!qword_1000A5608)
          {
            uint64_t v36 = 1;
LABEL_53:
            v49 = v33;
            MOLogWrite();
            goto LABEL_54;
          }
          uint64_t v36 = 1;
          if (*(int *)(qword_1000A5608 + 44) > 4) {
            goto LABEL_53;
          }
        }
        else
        {
          if (!qword_1000A5608)
          {
            uint64_t v36 = 5;
            goto LABEL_53;
          }
          uint64_t v36 = 5;
          if (*(int *)(qword_1000A5608 + 44) >= 5) {
            goto LABEL_53;
          }
        }
LABEL_54:
        long long v37 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:companionBundleID:](ACXGizmoApplicationInstallStatusItem, "itemWithStatus:companionBundleID:", v36, v35, v49);
        [*(id *)(a1 + 48) setObject:v37 forKeyedSubscript:v33];
      }
      id v30 = [v28 countByEnumeratingWithState:&v55 objects:v72 count:16];
    }
    while (v30);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v38 = *(id *)(a1 + 88);
  id v39 = [v38 countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v52;
    do
    {
      for (n = 0; n != v40; n = (char *)n + 1)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(v38);
        }
        uint64_t v43 = *(void *)(*((void *)&v51 + 1) + 8 * (void)n);
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          v49 = *(void **)(*((void *)&v51 + 1) + 8 * (void)n);
          MOLogWrite();
        }
        uint64_t v44 = objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v43, v49);
        uint64_t v45 = [v44 companionAppBundleID];

        if (!v45)
        {
          uint64_t v45 = [*(id *)(a1 + 40) objectForKeyedSubscript:v43];
        }
        uint64_t v46 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:2 companionBundleID:v45];
        [*(id *)(a1 + 48) setObject:v46 forKeyedSubscript:v43];
      }
      id v40 = [v38 countByEnumeratingWithState:&v51 objects:v71 count:16];
    }
    while (v40);
  }

  v47 = *(void **)(a1 + 48);

  return v47;
}

void sub_100026FBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 setReunionSyncRunning:0];
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v8 = [*(id *)(a1 + 32) device];
      id v16 = [v8 idsDeviceIdentifier];
      MOLogWrite();
    }
    if (*(void *)(a1 + 40) > 9uLL)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      id v9 = (void *)os_transaction_create();
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      id v11 = [*(id *)(a1 + 32) internalQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100027218;
      block[3] = &unk_10008CEB8;
      uint64_t v12 = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      id v20 = v9;
      uint64_t v21 = v13;
      block[4] = v12;
      id v14 = v9;
      dispatch_after(v10, v11, block);
    }
  }
  else
  {
    uint64_t v15 = [v7 internalQueue];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10002722C;
    v17[3] = &unk_10008CC28;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = v5;
    sub_100006BB8(v15, v17);
  }
}

id sub_100027218(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_beginReunionSyncWithRetryCount:", *(void *)(a1 + 48) + 1);
}

id sub_10002722C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_processReunionSyncMessage:", *(void *)(a1 + 40));
}

void sub_100027518(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_10002758C(uint64_t a1, void *a2, void *a3)
{
  id v21 = a2;
  id v5 = a3;
  id v6 = v21;
  if (!v5)
  {
    uint64_t v7 = [v21 message];
    id v8 = [v7 objectForKeyedSubscript:@"E"];
    objc_opt_class();
    id v9 = v8;
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      id v11 = [v10 integerValue];
      sub_100007574((uint64_t)"-[ACXCompanionSyncConnection _onQueue_sendInstallOnGizmoMessageForSystemAppBundleIDs:appsWithStoreMetadata:isUserInitiated:exclusiveInstall:withCompletion:]_block_invoke", 1753, @"ACXErrorDomain", (uint64_t)v11, @"Gizmo side indicated error occurred", v12, v13, v14, v20);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }

    id v6 = v21;
  }
  uint64_t v15 = [v6 message];
  id v16 = [v15 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v17 = v16;
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  id v19 = +[NSSet setWithArray:v18];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027918(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = [a2 message];
  id v6 = v10;
  if (!v10)
  {
    id v6 = [v5 objectForKeyedSubscript:@"EO"];

    if (v6)
    {
      id v6 = sub_100027A74(v5);
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        uint64_t v7 = [v5 objectForKey:@"BL"];
        objc_opt_class();
        id v8 = v7;
        if (objc_opt_isKindOfClass()) {
          id v9 = v8;
        }
        else {
          id v9 = 0;
        }

        MOLogWrite();
      }
    }
  }
  (*(void (**)(void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

id sub_100027A74(void *a1)
{
  id v1 = a1;
  id v2 = [v1 objectForKeyedSubscript:@"EO"];
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  if (v4 && [v4 length])
  {
    id v24 = 0;
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v24];
    id v6 = v24;
    if (v5)
    {
      id v7 = v5;
      goto LABEL_40;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v23 = v6;
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v23 = [v1 objectForKeyedSubscript:@"T"];
    MOLogWrite();
  }
  id v8 = objc_msgSend(v1, "objectForKeyedSubscript:", @"ED", v23);
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v6 = v9;
  }
  else {
    id v6 = 0;
  }

  id v10 = [v1 objectForKeyedSubscript:@"E"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = [v1 objectForKeyedSubscript:@"EM"];
  objc_opt_class();
  id v14 = v13;
  if (objc_opt_isKindOfClass()) {
    uint64_t v15 = (__CFString *)v14;
  }
  else {
    uint64_t v15 = 0;
  }

  id v16 = [v1 objectForKeyedSubscript:@"T"];
  objc_opt_class();
  id v17 = v16;
  if (objc_opt_isKindOfClass()) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  [v18 unsignedCharValue];
  if (!v6)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  if (v12)
  {
    if (!v15) {
      uint64_t v15 = @"No error description.";
    }
    id v19 = [v12 integerValue];
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    uint64_t v26 = v15;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v21 = +[NSError errorWithDomain:v6 code:v19 userInfo:v20];

    id v7 = v21;
    goto LABEL_39;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
LABEL_37:
  }
    MOLogWrite();
LABEL_38:
  id v7 = 0;
LABEL_39:

LABEL_40:

  return v7;
}

id sub_1000280D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _installQueuedOrCompletedForWatchBundleID:*(void *)(a1 + 40) companionAppBundleID:*(void *)(a1 + 48) withName:*(void *)(a1 + 56) userInitiated:*(unsigned __int8 *)(a1 + 72) withError:a2 withCompletion:*(void *)(a1 + 64)];
}

void sub_1000291A0(id a1)
{
  id v1 = objc_alloc_init((Class)ATConnection);
  [v1 requestKeybagSyncToPairedDevice];
}

id sub_1000291E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _installQueuedOrCompletedForWatchBundleID:*(void *)(a1 + 40) companionAppBundleID:*(void *)(a1 + 48) withName:*(void *)(a1 + 56) userInitiated:*(unsigned __int8 *)(a1 + 64) withError:a2 withCompletion:0];
}

ACXGizmoApplicationInstallStatusItem *__cdecl sub_1000296BC(id a1, NSString *a2, NSString *a3, ACXGizmoApplicationInstallStatusItem *a4, ACXGizmoApplicationInstallStatusItem *a5)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(ACXGizmoApplicationInstallStatusItem *)v8 installStatus];
  id v11 = v9;
  if (v10 == (id)4)
  {
    if (!qword_1000A5608 || (id v11 = v8, *(int *)(qword_1000A5608 + 44) >= 5))
    {
      MOLogWrite();
      id v11 = v8;
    }
  }
  id v12 = v11;

  return v12;
}

void sub_100029F68(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  v6[0] = @"T";
  v6[1] = @"B";
  uint64_t v2 = *(void *)(a1 + 32);
  v7[0] = &off_100097690;
  v7[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2, v5);
  id v4 = [*(id *)(a1 + 40) messager];
  [v4 sendResponse:v3 toMessage:*(void *)(a1 + 48) withPriority:200 timeout:@"gizmo installation request recorded" logDescription:120.0];
}

void sub_10002A2DC(_Unwind_Exception *a1)
{
}

void sub_10002A3E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 isCompatibleWithOSVersion:*(void *)(a1 + 32)])
  {
    id v4 = [v5 watchKitAppExtensionBundleID];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v4];
  }
}

id sub_10002B5F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleAppInstallMessage:", *(void *)(a1 + 40));
}

id sub_10002B5FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleAppDeleteMessage:", *(void *)(a1 + 40));
}

void sub_10002B608(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) device];
  unsigned int v3 = [v2 syncingIsRestricted];

  if (v3)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    id v6 = [*(id *)(a1 + 32) gizmoState];
    [v6 setNeedsReunionSync:1];
  }
  else if ([*(id *)(a1 + 32) reunionSyncRunning])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
    }
  }
  else
  {
    [*(id *)(a1 + 32) setReunionSyncRunning:1];
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    objc_msgSend(v4, "_onQueue_processReunionSyncMessage:", v5);
  }
}

void sub_10002B760(id a1)
{
}

id sub_10002B768(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleInstallAppMessage:", *(void *)(a1 + 40));
}

id sub_10002B774(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleCompatibleWatchAppsOnCompanionMessage:", *(void *)(a1 + 40));
}

id sub_10002B780(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleIconForWatchAppMessage:", *(void *)(a1 + 40));
}

void sub_10002B78C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) messager];
  sub_10004CA74(v1, v2);
}

void sub_10002B7E0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) messager];
  sub_10004CF34(v1, v2);
}

void sub_10002B834(uint64_t a1)
{
}

void sub_10002B83C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) messager];
  sub_10004D348(v1, v2);
}

id sub_10002B890(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleSADAppInfoResponse:", *(void *)(a1 + 40));
}

id sub_10002B89C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleAppInstallFailureMessage:", *(void *)(a1 + 40));
}

id sub_10002B8A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_handleAppRemovabilityUpdatedMessage:", *(void *)(a1 + 40));
}

id sub_10002B968(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "_onQueue_processPendingGizmoState");
}

id sub_10002BA94(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  id v2 = objc_msgSend(*(id *)(a1 + 40), "gizmoState", v5);
  [v2 setNeedsReunionSync:1];

  unsigned int v3 = *(void **)(a1 + 40);

  return objc_msgSend(v3, "_onQueue_beginReunionSync");
}

void sub_10002BC00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appStoreLocalQueue];
  [v2 reportExternalInstallFailureForWatchAppBundleID:*(void *)(a1 + 40) failureReason:*(void *)(a1 + 48)];
}

void sub_10002BD90(uint64_t a1)
{
  v8[0] = @"T";
  v8[1] = @"PD";
  uint64_t v2 = *(void *)(a1 + 32);
  v9[0] = &off_1000976D8;
  v9[1] = v2;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v4 = [*(id *)(a1 + 40) messager];
  uint64_t v5 = [*(id *)(a1 + 40) device];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002BEDC;
  v6[3] = &unk_10008D7C8;
  id v7 = *(id *)(a1 + 48);
  [v4 sendMessage:v3 toDevice:v5 withPriority:300 timeout:@"install profile" logDescription:v6 handleReply:120.0];
}

void sub_10002BEDC(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  id v6 = [v28 message];
  id v7 = [v6 objectForKeyedSubscript:@"T"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 unsignedCharValue] == 7)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_9;
    }
    id v14 = [v28 message];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"E"];
    objc_opt_class();
    id v16 = v15;
    if (objc_opt_isKindOfClass()) {
      id v13 = v16;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      id v17 = [v28 message];
      id v18 = [v17 objectForKeyedSubscript:@"MISE"];
      objc_opt_class();
      id v19 = v18;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }

      id v21 = [v20 intValue];
      uint64_t v22 = (void *)MISCopyErrorStringForErrorCode();
      id v23 = [v13 integerValue];
      long long v27 = sub_100007574((uint64_t)"-[ACXCompanionSyncConnection installProvisioningProfileWithData:completion:]_block_invoke", 2547, @"ACXErrorDomain", (uint64_t)v23, @"Gizmo side indicated error occurred during profile installation (MIS error 0x%x : %@)", v24, v25, v26, (uint64_t)v21);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = [v9 unsignedCharValue];
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection installProvisioningProfileWithData:completion:]_block_invoke", 2529, @"ACXErrorDomain", 1, 0, 0, @"Received reply to profile install message with unknown type: %hhu", v12, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v13);
  }

LABEL_9:
}

void sub_10002C27C(uint64_t a1)
{
  v8[0] = @"T";
  v8[1] = @"PI";
  uint64_t v2 = *(void *)(a1 + 32);
  v9[0] = &off_1000976F0;
  v9[1] = v2;
  unsigned int v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v4 = [*(id *)(a1 + 40) messager];
  id v5 = [*(id *)(a1 + 40) device];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002C3C8;
  v6[3] = &unk_10008D7C8;
  id v7 = *(id *)(a1 + 48);
  [v4 sendMessage:v3 toDevice:v5 withPriority:300 timeout:@"remove profile" logDescription:v6 handleReply:120.0];
}

void sub_10002C3C8(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  id v6 = [v28 message];
  id v7 = [v6 objectForKeyedSubscript:@"T"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 unsignedCharValue] == 13)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_9;
    }
    id v14 = [v28 message];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"E"];
    objc_opt_class();
    id v16 = v15;
    if (objc_opt_isKindOfClass()) {
      id v13 = v16;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      id v17 = [v28 message];
      id v18 = [v17 objectForKeyedSubscript:@"MISE"];
      objc_opt_class();
      id v19 = v18;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }

      id v21 = [v20 intValue];
      uint64_t v22 = (void *)MISCopyErrorStringForErrorCode();
      id v23 = [v13 integerValue];
      long long v27 = sub_100007574((uint64_t)"-[ACXCompanionSyncConnection removeProvisioningProfileWithID:completion:]_block_invoke", 2583, @"ACXErrorDomain", (uint64_t)v23, @"Gizmo side indicated error occurred during profile removal (MIS error 0x%x : %@)", v24, v25, v26, (uint64_t)v21);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = [v9 unsignedCharValue];
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection removeProvisioningProfileWithID:completion:]_block_invoke", 2565, @"ACXErrorDomain", 1, 0, 0, @"Received reply to profile remove message with unknown type: %hhu", v12, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v13);
  }

LABEL_9:
}

void sub_10002C774(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    v8[0] = @"T";
    v8[1] = @"BI";
    v9[0] = &off_100097708;
    v9[1] = v2;
    unsigned int v3 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  else
  {
    unsigned int v3 = &off_100097AA8;
  }
  id v4 = [*(id *)(a1 + 40) messager];
  id v5 = [*(id *)(a1 + 40) device];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10002C8D0;
  v6[3] = &unk_10008D7C8;
  id v7 = *(id *)(a1 + 48);
  [v4 sendMessage:v3 toDevice:v5 withPriority:300 timeout:@"get profile list" logDescription:v6 handleReply:120.0];
}

void sub_10002C8D0(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  id v6 = [v27 message];
  id v7 = [v6 objectForKeyedSubscript:@"T"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 unsignedCharValue] == 9)
  {
    uint64_t v10 = [v27 message];
    unsigned int v11 = [v10 objectForKeyedSubscript:@"PX"];
    objc_opt_class();
    id v12 = v11;
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if (v5)
    {
      (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v5);
    }
    else
    {
      id v17 = [v27 message];
      id v18 = [v17 objectForKeyedSubscript:@"MISE"];
      objc_opt_class();
      id v19 = v18;
      if (objc_opt_isKindOfClass()) {
        id v20 = v19;
      }
      else {
        id v20 = 0;
      }

      if (v20)
      {
        id v21 = [v20 intValue];
        uint64_t v26 = (void *)MISCopyErrorStringForErrorCode();
        uint64_t v25 = sub_100007574((uint64_t)"-[ACXCompanionSyncConnection fetchProvisioningProfilesForApplicationWithBundleID:completion:]_block_invoke", 2630, @"ACXErrorDomain", 1, @"Gizmo side indicated error occurred getting profile list (MIS error 0x%x : %@)", v22, v23, v24, (uint64_t)v21);
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 32);
    unsigned int v15 = [v9 unsignedCharValue];
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection fetchProvisioningProfilesForApplicationWithBundleID:completion:]_block_invoke", 2611, @"ACXErrorDomain", 1, 0, 0, @"Received reply to profile list message with unknown type: %hhu", v16, v15);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v13);
  }
}

void sub_10002CD64(uint64_t a1)
{
  v11[0] = @"T";
  v11[1] = @"BI";
  uint64_t v2 = *(void *)(a1 + 32);
  v12[0] = &off_100097720;
  v12[1] = v2;
  v11[2] = @"PL";
  unsigned int v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  void v12[2] = v3;
  v11[3] = @"PO";
  id v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  void v11[4] = @"PF";
  uint64_t v5 = *(void *)(a1 + 40);
  v12[3] = v4;
  void v12[4] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];

  id v7 = [*(id *)(a1 + 48) messager];
  id v8 = [*(id *)(a1 + 48) device];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_10002CF14;
  v9[3] = &unk_10008D7C8;
  id v10 = *(id *)(a1 + 56);
  [v7 sendMessage:v6 toDevice:v8 withPriority:300 timeout:@"update preferences" logDescription:v9 handleReply:120.0];
}

void sub_10002CF14(uint64_t a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  id v6 = [v23 message];
  id v7 = [v6 objectForKeyedSubscript:@"T"];
  objc_opt_class();
  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 unsignedCharValue] == 11)
  {
    if (v5)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_9;
    }
    uint64_t v14 = [v23 message];
    unsigned int v15 = [v14 objectForKeyedSubscript:@"E"];
    objc_opt_class();
    id v16 = v15;
    if (objc_opt_isKindOfClass()) {
      id v13 = v16;
    }
    else {
      id v13 = 0;
    }

    if (v13)
    {
      id v17 = [v13 integerValue];
      id v21 = sub_100007574((uint64_t)"-[ACXCompanionSyncConnection updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:options:completion:]_block_invoke", 2674, @"ACXErrorDomain", (uint64_t)v17, @"Gizmo side indicated error occurred during prefs update", v18, v19, v20, v22);
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    unsigned int v11 = [v9 unsignedCharValue];
    sub_100007710((uint64_t)"-[ACXCompanionSyncConnection updatePreferencesForApplicationWithIdentifier:preferences:writingToPreferencesLocation:options:completion:]_block_invoke", 2665, @"ACXErrorDomain", 1, 0, 0, @"Received reply to prefs update message with unknown type: %hhu", v12, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v13);
  }

LABEL_9:
}

void sub_10002D75C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v6)
  {
    v20[0] = v6;
    v19[0] = @"BundleIDs";
    v19[1] = @"PairingID";
    id v9 = [v7 UUIDString];
    v20[1] = v9;
    uint64_t v10 = (void **)v20;
    unsigned int v11 = (const __CFString **)v19;
    uint64_t v12 = 2;
  }
  else
  {
    CFStringRef v17 = @"PairingID";
    id v9 = [v7 UUIDString];
    uint64_t v18 = v9;
    uint64_t v10 = &v18;
    unsigned int v11 = &v17;
    uint64_t v12 = 1;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:v12];

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v15 = v5;
    id v16 = v13;
    MOLogWrite();
  }
  uint64_t v14 = +[NSDistributedNotificationCenter defaultCenter];
  [v14 postNotificationName:v5 object:0 userInfo:v13 deliverImmediately:1];
}

void sub_10002E124(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v10);
        uint64_t v12 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:4 companionBundleID:v5];
        [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v11];

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

id sub_10002E260(uint64_t a1)
{
  return [*(id *)(a1 + 32) processPendingStateWithReason:@"system apps changed"];
}

void sub_10002E798(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 40), "messager", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  unsigned int v3 = [*(id *)(a1 + 40) device];
  [v5 sendMessage:v2 toDevice:v3 withPriority:200 timeout:@"companion install notification" logDescription:0 handleReply:120.0];
}

void sub_10002E85C(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 40), "messager", v4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 48);
  unsigned int v3 = [*(id *)(a1 + 40) device];
  [v5 sendMessage:v2 toDevice:v3 withPriority:200 timeout:@"companion uninstall notification" logDescription:0 handleReply:120.0];
}

id sub_10002EC4C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  unsigned int v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZZZ"];
  uint64_t v4 = [v2 stringFromDate:v1];

  return v4;
}

void sub_10002F46C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = 0;
  unsigned int v3 = [v2 readDataOrDictionaryWithError:&v6];
  id v4 = v6;
  if (([*(id *)(a1 + 32) invalidated] & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) eventHandler];
    ((void (**)(void, void *, id))v5)[2](v5, v3, v4);
  }
}

void sub_10002F4FC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) deviceConnection];

  unsigned int v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 deviceConnection];
    [v4 close];

    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = 0;
  }
  else
  {
    close((int)[v3 socketFD]);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 12) = -1;
}

uint64_t sub_10002F640(void *a1, char *a2, char *a3, char **a4)
{
  id v7 = a1;
  unsigned int v8 = [v7 socketFD];
  if (a3)
  {
    int v9 = v8;
    while (1)
    {
      ssize_t v10 = send(v9, a2, (size_t)a3, 0);
      if (v10 < 0) {
        break;
      }
      ssize_t v11 = v10;
      if (!v10 && (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)) {
        MOLogWrite();
      }
      a2 += v11;
      a3 -= v11;
      if (!a3) {
        goto LABEL_9;
      }
    }
    int v13 = *__error();
    CFStringRef v17 = sub_100007574((uint64_t)"_WriteBytes", 172, NSPOSIXErrorDomain, v13, 0, v14, v15, v16, v21);
    uint64_t v18 = [v7 errorInfoDict];
    strerror(v13);
    sub_100007710((uint64_t)"_WriteBytes", 172, @"ACXErrorDomain", 2, v17, v18, @"Failed to send %zu bytes: %s", v19, (uint64_t)a3);
    a3 = (char *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      a3 = a3;
      uint64_t v12 = 0;
      *a4 = a3;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = 1;
  }

  return v12;
}

void *sub_1000300D8(void *a1, char *a2, void *a3)
{
  id v5 = a1;
  int v6 = [v5 socketFD];
  id v7 = (char *)malloc_type_calloc(1uLL, (size_t)a2, 0x9D636D58uLL);
  unsigned int v8 = v7;
  if (!v7)
  {
    int v12 = *__error();
    uint64_t v16 = sub_100007574((uint64_t)"_ReadData", 303, NSPOSIXErrorDomain, v12, 0, v13, v14, v15, v28);
    CFStringRef v17 = [v5 errorInfoDict];
    uint64_t v18 = strerror(v12);
    sub_100007710((uint64_t)"_ReadData", 303, @"ACXErrorDomain", 1, v16, v17, @"Could not allocate memory: %s", v19, (uint64_t)v18);
    a2 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    ssize_t v11 = 0;
    if (a3)
    {
LABEL_13:
      if (!v11)
      {
        *a3 = a2;
        goto LABEL_16;
      }
    }
LABEL_15:
    if (v11)
    {
LABEL_17:
      unsigned int v8 = v11;
      goto LABEL_18;
    }
LABEL_16:
    free(v8);
    goto LABEL_17;
  }
  if (a2)
  {
    int v9 = v7;
    do
    {
      ssize_t v10 = recv(v6, v9, (size_t)a2, 0);
      if (v10 < 0)
      {
        int v20 = *__error();
        uint64_t v16 = sub_100007574((uint64_t)"_ReadData", 313, NSPOSIXErrorDomain, v20, 0, v21, v22, v23, v28);
        uint64_t v24 = [v5 errorInfoDict];
        strerror(v20);
        sub_100007710((uint64_t)"_ReadData", 313, @"ACXErrorDomain", 3, v16, v24, @"recv returned an error when reading %zu bytes: %s", v25, (uint64_t)a2);
        a2 = (char *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      if (!v10)
      {
        uint64_t v16 = [v5 errorInfoDict];
        sub_100007710((uint64_t)"_ReadData", 317, @"ACXErrorDomain", 4, 0, v16, @"Socket closed with %zu bytes remaining to read", v26, (uint64_t)a2);
        a2 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v9 += v10;
      a2 -= v10;
    }
    while (a2);
    ssize_t v11 = v8;
    if (a3) {
      goto LABEL_13;
    }
    goto LABEL_15;
  }
LABEL_18:

  return v8;
}

void sub_100030D38(uint64_t a1)
{
  unsigned int v2 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable");
  if (!*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setIsConnected:0];
    [*(id *)(a1 + 32) setIsActivePairedDevice:0];
    [*(id *)(a1 + 32) setIsTombstone:1];
LABEL_19:
    if (v2 != objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable"))
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v9 = a1;
      ssize_t v10 = [*(id *)(a1 + 32) observers];
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * i);
            if (objc_opt_respondsToSelector())
            {
              qos_class_t v16 = qos_class_self();
              CFStringRef v17 = dispatch_get_global_queue(v16, 0);
              v22[0] = _NSConcreteStackBlock;
              v22[1] = 3221225472;
              v22[2] = sub_100031120;
              void v22[3] = &unk_10008CC28;
              uint64_t v18 = *(void *)(v9 + 32);
              void v22[4] = v15;
              void v22[5] = v18;
              sub_100006BB8(v17, v22);
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }
    }
    return;
  }
  id v21 = (id)IDSCopyIDForDevice();
  unsigned int v3 = [*(id *)(a1 + 32) idsDeviceIdentifier];
  unsigned __int8 v4 = [v21 isEqualToString:v3];

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsConnected:", objc_msgSend(*(id *)(a1 + 40), "isConnected"));
    if ([*(id *)(a1 + 40) isActive]) {
      id v5 = [*(id *)(a1 + 40) isLocallyPaired];
    }
    else {
      id v5 = 0;
    }
    [*(id *)(a1 + 32) setIsActivePairedDevice:v5];
    [*(id *)(a1 + 32) setIsTombstone:0];
    int v6 = +[NRPairedDeviceRegistry sharedInstance];
    id v7 = [v6 deviceForIDSDevice:*(void *)(a1 + 40)];

    if (v7)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v7);
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v19 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "setSupportsStandaloneApps:", (unint64_t)objc_msgSend(*(id *)(a1 + 40), "serviceMinCompatibilityVersion", v19) > 7);
    unsigned int v8 = [*(id *)(a1 + 40) productVersion];
    *(unsigned char *)(*(void *)(a1 + 32) + 12) = (unint64_t)[@"10.3" compare:v8 options:64]+ 1 < 2;

    [*(id *)(a1 + 32) setMessager:*(void *)(a1 + 48)];
    goto LABEL_19;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    int v20 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    MOLogWrite();
  }
}

id sub_100031120(uint64_t a1)
{
  return [*(id *)(a1 + 32) reachabilityChangedForDevice:*(void *)(a1 + 40)];
}

void sub_1000311E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_1000312E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void sub_100031514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003152C(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_isReachable");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100031C20(id a1)
{
  id v1 = objc_alloc_init(ACXLaunchServicesWatcher);
  uint64_t v2 = qword_1000A5598;
  qword_1000A5598 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100031D50(uint64_t a1)
{
  long long v56 = sub_100007CEC();
  long long v57 = [v56 URLByAppendingPathComponent:@"AvailableCompanionApps.plist" isDirectory:0];
  id v70 = 0;
  long long v58 = +[NSMutableDictionary ACX_dictionaryWithContentsOfURL:v57 options:0 error:&v70];
  id v2 = v70;
  long long v54 = v2;
  if (v58)
  {
    unsigned int v3 = [v58 objectForKeyedSubscript:@"Version"];
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      long long v55 = (__CFString *)v4;
    }
    else {
      long long v55 = 0;
    }

    if (!v55 || [(__CFString *)v55 unsignedLongLongValue] != (id)12)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        CFStringRef v9 = @"0";
        if (v55) {
          CFStringRef v9 = v55;
        }
        uint64_t v45 = (void *)v9;
        MOLogWrite();
      }
      goto LABEL_93;
    }
    uint64_t v66 = 0;
    long long v67 = &v66;
    uint64_t v68 = 0x2020000000;
    char v69 = 0;
    id v7 = [v58 objectForKeyedSubscript:@"AppList"];
    objc_opt_class();
    id v8 = v7;
    if (objc_opt_isKindOfClass()) {
      id v50 = v8;
    }
    else {
      id v50 = 0;
    }

    if (v50 && (v10 = objc_opt_class(), uint64_t v11 = objc_opt_class(), sub_10000731C(v50, v10, v11)))
    {
      +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v50 count]);
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_1000327AC;
      v63[3] = &unk_10008D910;
      long long v65 = &v66;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v64 = v12;
      [v50 enumerateKeysAndObjectsUsingBlock:v63];
      [*(id *)(a1 + 32) setAppList:v12];
    }
    else
    {
      *((unsigned char *)v67 + 24) = 1;
    }
    uint64_t v13 = [v58 objectForKeyedSubscript:@"LSUUID"];
    objc_opt_class();
    id v14 = v13;
    if (objc_opt_isKindOfClass()) {
      id v53 = v14;
    }
    else {
      id v53 = 0;
    }

    if (!v53
      || (id v15 = [objc_alloc((Class)NSUUID) initWithUUIDString:v53],
          [*(id *)(a1 + 32) setLastLSUUID:v15],
          v15,
          [*(id *)(a1 + 32) lastLSUUID],
          qos_class_t v16 = objc_claimAutoreleasedReturnValue(),
          BOOL v17 = v16 == 0,
          v16,
          v17))
    {
      *((unsigned char *)v67 + 24) = 1;
    }
    uint64_t v18 = [v58 objectForKeyedSubscript:@"OurDBUUID"];
    objc_opt_class();
    id v19 = v18;
    if (objc_opt_isKindOfClass()) {
      id v52 = v19;
    }
    else {
      id v52 = 0;
    }

    if (!v52
      || (id v20 = [objc_alloc((Class)NSUUID) initWithUUIDString:v52],
          [*(id *)(a1 + 32) setOurDBUUID:v20],
          v20,
          [*(id *)(a1 + 32) ourDBUUID],
          id v21 = objc_claimAutoreleasedReturnValue(),
          BOOL v22 = v21 == 0,
          v21,
          v22))
    {
      *((unsigned char *)v67 + 24) = 1;
    }
    long long v23 = [v58 objectForKeyedSubscript:@"LastSequenceNumber"];
    objc_opt_class();
    id v24 = v23;
    if (objc_opt_isKindOfClass()) {
      id v49 = v24;
    }
    else {
      id v49 = 0;
    }

    if (!v49) {
      *((unsigned char *)v67 + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "setLastSequenceNumber:", objc_msgSend(v49, "unsignedIntegerValue"));
    long long v25 = [v58 objectForKeyedSubscript:@"AppEvents"];
    objc_opt_class();
    id v26 = v25;
    if (objc_opt_isKindOfClass()) {
      id v51 = v26;
    }
    else {
      id v51 = 0;
    }

    if (!v51)
    {
      *((unsigned char *)v67 + 24) = 1;
      goto LABEL_76;
    }
    id v27 = objc_opt_new();
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v28 = v51;
    id v29 = 0;
    id v30 = [v28 countByEnumeratingWithState:&v59 objects:v71 count:16];
    if (!v30) {
      goto LABEL_72;
    }
    uint64_t v31 = *(void *)v60;
LABEL_51:
    uint64_t v32 = 0;
    while (1)
    {
      if (*(void *)v60 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void **)(*((void *)&v59 + 1) + 8 * v32);
      objc_opt_class();
      id v34 = v33;
      id v35 = (objc_opt_isKindOfClass() & 1) != 0 ? v34 : 0;

      if (!v35) {
        break;
      }
      uint64_t v36 = [[ACXAppEventRecord alloc] initWithDictionaryRepresentation:v34];
      if (!v36)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v45 = v34;
          MOLogWrite();
        }
LABEL_71:
        *((unsigned char *)v67 + 24) = 1;
        goto LABEL_72;
      }
      if ([v27 count] == (id)15)
      {
        [v27 removeObjectAtIndex:0];
        ++v29;
      }
      [v27 addObject:v36];

      if (v30 == (id)++v32)
      {
        id v30 = [v28 countByEnumeratingWithState:&v59 objects:v71 count:16];
        if (v30) {
          goto LABEL_51;
        }
LABEL_72:

        [*(id *)(a1 + 32) setEventQueue:v27];
        if (v29)
        {
          long long v37 = [*(id *)(a1 + 32) eventQueue];
          id v38 = [v37 objectAtIndexedSubscript:0];
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 sequenceNumber]);
          id v39 = (id)objc_claimAutoreleasedReturnValue();

          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            uint64_t v45 = v29;
            id v47 = v39;
            MOLogWrite();
          }
LABEL_80:
          if (!v39) {
            *((unsigned char *)v67 + 24) = 1;
          }
          id v42 = (char *)objc_msgSend(v39, "unsignedIntegerValue", v45, v47);
          uint64_t v43 = (char *)[*(id *)(a1 + 32) lastSequenceNumber] + 1;
          if (v42 <= v43)
          {
            uint64_t v43 = v42;
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            uint64_t v46 = v42;
            uint64_t v48 = v43;
            MOLogWrite();
          }
          objc_msgSend(*(id *)(a1 + 32), "setEventQueueStartSequenceNumber:", v43, v46, v48);
          if (*((unsigned char *)v67 + 24))
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
              MOLogWrite();
            }
            [*(id *)(a1 + 32) setLastLSUUID:0];
            [*(id *)(a1 + 32) setAppList:0];
            [*(id *)(a1 + 32) setOurDBUUID:0];
            [*(id *)(a1 + 32) setLastSequenceNumber:0];
            [*(id *)(a1 + 32) setEventQueue:0];
            [*(id *)(a1 + 32) setEventQueueStartSequenceNumber:0];
          }

          _Block_object_dispose(&v66, 8);
LABEL_93:

          goto LABEL_94;
        }
LABEL_76:
        id v40 = objc_msgSend(v58, "objectForKeyedSubscript:", @"AppEventsStartSequenceNumber", v45);
        objc_opt_class();
        id v41 = v40;
        if (objc_opt_isKindOfClass()) {
          id v39 = v41;
        }
        else {
          id v39 = 0;
        }

        goto LABEL_80;
      }
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    goto LABEL_71;
  }
  id v5 = [v2 domain];
  if ([v5 isEqualToString:NSCocoaErrorDomain])
  {
    BOOL v6 = [v54 code] == (id)260;

    if (v6)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      goto LABEL_94;
    }
  }
  else
  {
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v45 = [v57 path];
    id v47 = v54;
    MOLogWrite();
  }
LABEL_94:
  uint64_t v44 = +[LSApplicationWorkspace defaultWorkspace];
  [v44 addObserver:*(void *)(a1 + 32)];

  objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSyncWithLS");
}

void sub_100032754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_1000327AC(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v13 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v13;
  }
  else {
    id v9 = 0;
  }

  objc_opt_class();
  id v10 = v8;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  if (v9 && v11)
  {
    id v12 = [[ACXLaunchServicesWatcherSequenceRecord alloc] initWithDictionaryRepresentation:v11];
    if (v12)
    {
      [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v9];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_100032D00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 dictionaryRepresentation];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_10003332C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100033360(uint64_t a1)
{
}

void sub_100033368(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = objc_msgSend(v2, "_onQueue_applicationForAppRecord:error:", v3, &v9);
  id v5 = v9;
  id v6 = v9;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    **(void **)(a1 + 64) = [*(id *)(a1 + 32) lastSequenceNumber];
  }
  else {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  }
}

void sub_10003359C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000335B4(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v3)
  {

LABEL_14:
    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = [*(id *)(a1 + 40) lastSequenceNumber];
    }
    if (*(void *)(a1 + 72))
    {
      [*(id *)(a1 + 40) ourDBUUID];
      id v5 = 0;
      **(void **)(a1 + 72) = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
    goto LABEL_19;
  }
  id v4 = v3;
  id v5 = 0;
  uint64_t v6 = *(void *)v15;
  while (2)
  {
    uint64_t v7 = 0;
    id v8 = v5;
    do
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v7);
      id v10 = *(void **)(a1 + 40);
      id v13 = v8;
      uint64_t v11 = objc_msgSend(v10, "_onQueue_applicationForAppRecord:error:", v9, &v13);
      id v12 = v13;
      id v5 = v13;

      if (!v11)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v12);
        goto LABEL_11;
      }
      [*(id *)(a1 + 48) addObject:v11];

      uint64_t v7 = (char *)v7 + 1;
      id v8 = v5;
    }
    while (v4 != v7);
    id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4) {
      continue;
    }
    break;
  }
LABEL_11:

  if (!v5) {
    goto LABEL_14;
  }
LABEL_19:
}

void sub_100033C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 168), 8);
  _Block_object_dispose((const void *)(v26 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100033C50(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v11 = 0;
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_enumerateApplicationsForBundleIDs:error:enumerator:", v3, &v11, v4);
  id v6 = v11;
  id v7 = v11;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v8 = [*(id *)(a1 + 32) ourDBUUID];
    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 32) lastSequenceNumber];
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
  }
}

void sub_100034374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100034398(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[8];
  id v8 = 0;
  unsigned __int8 v5 = objc_msgSend(v2, "_onQueue_clearApplicationEventsForDBUUID:endingSequenceNumber:error:", v3, v4, &v8);
  id v6 = v8;
  id v7 = v8;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
  if (!*(unsigned char *)(*(void *)(a1[6] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), v6);
  }
}

void sub_100034584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_1000345A8(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "eventQueue", 0);
  uint64_t v3 = (char *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = (char *)[v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v7 = [*(id *)(a1 + 32) ourDBUUID];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id result = [*(id *)(a1 + 32) eventQueueStartSequenceNumber];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void sub_100034810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_100034834(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) ourDBUUID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) lastSequenceNumber];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100034A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100034A60(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appList];
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) ourDBUUID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id result = [*(id *)(a1 + 32) lastSequenceNumber];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void sub_10003556C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void **)(a1 + 32);
  id v57 = 0;
  unsigned __int8 v3 = objc_msgSend(v2, "_onQueue_infoMatchesCurrentLSDatabaseWithUUID:", &v57);
  id v4 = v57;
  if (v3)
  {
    uint64_t v45 = objc_opt_new();
    uint64_t v46 = objc_opt_new();
    id v47 = objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v5 = *(id *)(v1 + 40);
    id v6 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v6)
    {
      id v7 = v6;
      char v8 = 0;
      uint64_t v9 = &qword_1000A5608;
      uint64_t v10 = *(void *)v54;
      uint64_t v49 = v1;
      uint64_t v50 = *(void *)v54;
      id v51 = v5;
      id v48 = v4;
      while (1)
      {
        uint64_t v11 = 0;
        id v52 = v7;
        do
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v11);
          uint64_t v13 = objc_msgSend(v12, "bundleIdentifier", v44);
          if (![v12 isPlaceholder])
          {
            if (!objc_msgSend(v12, "ACX_shouldBeTrackedByLaunchServicesWatcher")) {
              goto LABEL_39;
            }
            uint64_t v14 = v9;
            uint64_t v15 = [v12 databaseUUID];
            unsigned __int8 v16 = [v15 isEqual:v4];

            v8 |= v16 ^ 1;
            long long v17 = [v12 applicationState];
            unsigned int v18 = [v17 isInstalled];

            if (v18)
            {
              objc_msgSend(*(id *)(v1 + 32), "setLastSequenceNumber:", (char *)objc_msgSend(*(id *)(v1 + 32), "lastSequenceNumber") + 1);
              id v19 = [*(id *)(v1 + 32) lastSequenceNumber];
              id v20 = [ACXCompanionApplication alloc];
              id v21 = [*(id *)(v1 + 32) ourDBUUID];
              uint64_t v22 = v1;
              long long v23 = [(ACXCompanionApplication *)v20 initWithApplicationRecord:v12 databaseUUID:v21 sequenceNumber:v19];

              if (v23)
              {
                id v24 = [*(id *)(v22 + 32) appList];
                long long v25 = [v24 objectForKeyedSubscript:v13];

                uint64_t v26 = *v14;
                if (v25)
                {
                  if (v26)
                  {
                    CFStringRef v27 = @"Updating entry for app %@";
                    id v28 = v46;
                    if (*(int *)(v26 + 44) <= 4) {
                      goto LABEL_36;
                    }
                  }
                  else
                  {
                    id v28 = v46;
                  }
                  goto LABEL_35;
                }
                if (!v26)
                {
                  id v28 = v45;
                  goto LABEL_35;
                }
                CFStringRef v27 = @"Adding app %@";
                id v28 = v45;
                if (*(int *)(v26 + 44) >= 5)
                {
LABEL_35:
                  uint64_t v44 = v13;
                  MOLogWrite();
                }
LABEL_36:
                objc_msgSend(v28, "addObject:", v23, v27, v44);
                id v35 = [[ACXAppEventRecord alloc] initWithRecordType:0 bundleID:v13 sequenceNumber:v19];
                objc_msgSend(*(id *)(v49 + 32), "_onQueue_addAppEvent:", v35);
                uint64_t v36 = [ACXLaunchServicesWatcherSequenceRecord alloc];
                id v37 = [v12 sequenceNumber];
                id v38 = [(ACXCompanionApplication *)v23 counterpartIdentifiers];
                id v39 = [(ACXLaunchServicesWatcherSequenceRecord *)v36 initWithLSSequenceNumber:v37 acxSequenceNumber:v19 counterpartIdentifiers:v38];
                id v40 = [*(id *)(v49 + 32) appList];
                [v40 setObject:v39 forKeyedSubscript:v13];

                uint64_t v9 = v14;
              }
              else
              {
                uint64_t v9 = v14;
                if (!*v14 || *(int *)(*v14 + 44) >= 3)
                {
                  uint64_t v44 = v13;
                  MOLogWrite();
                }
              }

              id v4 = v48;
              uint64_t v1 = v49;
              uint64_t v10 = v50;
            }
            else
            {
              uint64_t v9 = v14;
              if (!*v14 || *(int *)(*v14 + 44) >= 3)
              {
                uint64_t v44 = v13;
                MOLogWrite();
              }
              id v29 = objc_msgSend(*(id *)(v1 + 32), "appList", v44);
              id v30 = [v29 objectForKeyedSubscript:v13];

              uint64_t v10 = v50;
              if (v30)
              {
                uint64_t v31 = [*(id *)(v1 + 32) appList];
                [v31 removeObjectForKey:v13];

                uint64_t v32 = [v30 counterpartIdentifiers];
                if (v32) {
                  uint64_t v33 = (void *)v32;
                }
                else {
                  uint64_t v33 = &__NSArray0__struct;
                }
                [v47 setObject:v33 forKeyedSubscript:v13];
                objc_msgSend(*(id *)(v1 + 32), "setLastSequenceNumber:", (char *)objc_msgSend(*(id *)(v1 + 32), "lastSequenceNumber") + 1);
                id v34 = -[ACXAppEventRecord initWithRecordType:bundleID:sequenceNumber:]([ACXAppEventRecord alloc], "initWithRecordType:bundleID:sequenceNumber:", 1, v13, [*(id *)(v1 + 32) lastSequenceNumber]);
                objc_msgSend(*(id *)(v1 + 32), "_onQueue_addAppEvent:", v34);
              }
            }
            id v5 = v51;
            id v7 = v52;
            goto LABEL_39;
          }
          if (*v9 && *(int *)(*v9 + 44) >= 7)
          {
            uint64_t v44 = v13;
            MOLogWrite();
          }
LABEL_39:

          uint64_t v11 = (char *)v11 + 1;
        }
        while (v7 != v11);
        id v7 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (!v7) {
          goto LABEL_44;
        }
      }
    }
    char v8 = 0;
LABEL_44:

    if ([v45 count] || objc_msgSend(v46, "count") || objc_msgSend(v47, "count"))
    {
      id v41 = *(void **)(v1 + 32);
      id v42 = objc_msgSend(v41, "ourDBUUID", v44);
      objc_msgSend(v41, "_onQueue_noteNewApps:updatedApps:removedApps:forDBUUID:endingSequenceNumber:", v45, v46, v47, v42, objc_msgSend(*(id *)(v1 + 32), "lastSequenceNumber"));

      uint64_t v43 = *(void **)(v1 + 32);
      if (v8) {
        objc_msgSend(v43, "_onQueue_reSyncWithLS");
      }
      else {
        objc_msgSend(v43, "_onQueue_writeAppListToDisk");
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(v1 + 32), "_onQueue_reSyncWithLS");
  }
}

void sub_100035C20(uint64_t a1)
{
  unsigned __int8 v24 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_infoMatchesCurrentLSDatabaseWithUUID:", 0);
  uint64_t v2 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v26 = a1;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v28;
    id v7 = &ASDLocalizedTextForUserPresentableError_ptr;
    id v25 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "bundleIdentifier", v23);
        id v11 = [objc_alloc((Class)v7[221]) initWithBundleIdentifier:v10 allowPlaceholder:1 error:0];
        uint64_t v12 = v11;
        if ((!v11 || [v11 isPlaceholder])
          && objc_msgSend(v9, "ACX_shouldBeTrackedByLaunchServicesWatcher"))
        {
          uint64_t v13 = [*(id *)(v26 + 32) appList];
          uint64_t v14 = [v13 objectForKeyedSubscript:v10];

          if (v14)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              long long v23 = v10;
              MOLogWrite();
            }
            uint64_t v15 = objc_msgSend(*(id *)(v26 + 32), "appList", v23);
            [v15 removeObjectForKey:v10];

            uint64_t v16 = [v14 counterpartIdentifiers];
            if (v16) {
              long long v17 = (void *)v16;
            }
            else {
              long long v17 = &__NSArray0__struct;
            }
            [v2 setObject:v17 forKeyedSubscript:v10];
            unsigned int v18 = v2;
            objc_msgSend(*(id *)(v26 + 32), "setLastSequenceNumber:", (char *)objc_msgSend(*(id *)(v26 + 32), "lastSequenceNumber") + 1);
            id v19 = -[ACXAppEventRecord initWithRecordType:bundleID:sequenceNumber:]([ACXAppEventRecord alloc], "initWithRecordType:bundleID:sequenceNumber:", 1, v10, [*(id *)(v26 + 32) lastSequenceNumber]);
            objc_msgSend(*(id *)(v26 + 32), "_onQueue_addAppEvent:", v19);

            uint64_t v2 = v18;
            id v3 = v25;
            id v7 = &ASDLocalizedTextForUserPresentableError_ptr;
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            long long v23 = v10;
            MOLogWrite();
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v5);
  }

  if ([v2 count])
  {
    id v20 = *(void **)(v26 + 32);
    id v21 = [v20 ourDBUUID];
    objc_msgSend(v20, "_onQueue_noteNewApps:updatedApps:removedApps:forDBUUID:endingSequenceNumber:", 0, 0, v2, v21, objc_msgSend(*(id *)(v26 + 32), "lastSequenceNumber"));

    uint64_t v22 = *(void **)(v26 + 32);
    if (v24) {
      objc_msgSend(v22, "_onQueue_writeAppListToDisk");
    }
    else {
      objc_msgSend(v22, "_onQueue_reSyncWithLS");
    }
  }
}

void sub_10003674C(id a1, NSArray *a2)
{
  uint64_t v2 = a2;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
          MOLogWrite();
        }
      }
      id v4 = (char *)[(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100036A18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) bundleIdentifier];
  if (!v2) {
    sub_10005BBB4();
  }
  id v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 32) companionAppBundleID];
  if (!v4) {
    sub_10005BBE0();
  }
  uint64_t v5 = (void *)v4;
  if (!objc_msgSend(*(id *)(a1 + 40), "_onQueue_installIsPendingForWatchApp:", v3))
  {
    long long v8 = [ACXInstallQueueElement alloc];
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v13 = [*(id *)(a1 + 32) requiredCapabilities];
    uint64_t v14 = [(ACXInstallQueueElement *)v8 initWithWatchBundleID:v3 companionBundleID:v5 priority:v9 appPrefs:v10 provisioningProfileInfo:v11 isUserInitiated:v12 requiredCapabilities:v13];

    uint64_t v15 = [*(id *)(a1 + 40) placeholderInstallQueue];
    [v15 addObject:v14];

    id v16 = [*(id *)(a1 + 64) copy];
    id v17 = objc_retainBlock(v16);
    unsigned int v18 = [*(id *)(a1 + 40) completions];
    [v18 setObject:v17 forKeyedSubscript:v3];

    id v19 = [*(id *)(a1 + 40) currentInstallOperation];

    if (v19)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_20;
      }
      objc_msgSend(*(id *)(a1 + 40), "_onQueue_countPending");
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v20 = v3;
        MOLogWrite();
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "isSuspended", v20) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_onQueue_startQueue");
        goto LABEL_20;
      }
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_20;
      }
    }
    MOLogWrite();
LABEL_20:

    goto LABEL_21;
  }
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  qos_class_t v6 = qos_class_self();
  long long v7 = dispatch_get_global_queue(v6, 0);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100036CE8;
  v21[3] = &unk_10008D108;
  id v22 = *(id *)(a1 + 64);
  sub_100006BB8(v7, v21);

LABEL_21:
}

uint64_t sub_100036CE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100036E94(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2) {
    sub_10005BC0C();
  }
  id v3 = v2;
  id v4 = *(id *)(a1 + 40);
  if (!v4) {
    sub_10005BC38();
  }
  uint64_t v5 = v4;
  if (!objc_msgSend(*(id *)(a1 + 48), "_onQueue_installIsPendingForWatchApp:", v3))
  {
    long long v8 = [ACXInstallQueueElement alloc];
    LOBYTE(v19) = *(unsigned char *)(a1 + 105);
    LOBYTE(v16) = *(unsigned char *)(a1 + 104);
    uint64_t v9 = [(ACXInstallQueueElement *)v8 initWithURL:*(void *)(a1 + 56) watchBundleID:v3 companionBundleID:v5 priority:*(void *)(a1 + 88) appPrefs:*(void *)(a1 + 64) provisioningProfileInfo:0 isUserInitiated:v16 requiredCapabilities:*(void *)(a1 + 72) isPlaceholder:v19 size:*(void *)(a1 + 96)];
    uint64_t v10 = *(void **)(a1 + 48);
    if (*(unsigned char *)(a1 + 105)) {
      [v10 placeholderInstallQueue];
    }
    else {
    uint64_t v11 = [v10 _queueForPriority:*(void *)(a1 + 88)];
    }
    [v11 addObject:v9];

    id v12 = [*(id *)(a1 + 80) copy];
    id v13 = objc_retainBlock(v12);
    uint64_t v14 = [*(id *)(a1 + 48) completions];
    [v14 setObject:v13 forKeyedSubscript:v3];

    uint64_t v15 = [*(id *)(a1 + 48) currentInstallOperation];

    if (v15)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_23;
      }
      objc_msgSend(*(id *)(a1 + 48), "_onQueue_countPending");
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v17 = v3;
        uint64_t v18 = *(void *)(a1 + 56);
        MOLogWrite();
      }
      if ((objc_msgSend(*(id *)(a1 + 48), "isSuspended", v17, v18) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "_onQueue_startQueue");
        goto LABEL_23;
      }
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_23;
      }
    }
    MOLogWrite();
LABEL_23:

    goto LABEL_24;
  }
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  qos_class_t v6 = qos_class_self();
  long long v7 = dispatch_get_global_queue(v6, 0);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_100037164;
  v20[3] = &unk_10008D108;
  id v21 = *(id *)(a1 + 80);
  sub_100006BB8(v7, v20);

LABEL_24:
}

uint64_t sub_100037164(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100037200(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) device];
  unsigned int v3 = [v2 isReachable];

  unsigned int v4 = [*(id *)(a1 + 32) isSuspended];
  if (v3)
  {
    if (v4)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v5 = [*(id *)(a1 + 32) device];
        uint64_t v10 = [v5 idsDeviceIdentifier];
        MOLogWrite();
      }
      objc_msgSend(*(id *)(a1 + 32), "setIsSuspended:", 0, v10);
      if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_countPending"))
      {
        qos_class_t v6 = [*(id *)(a1 + 32) currentInstallOperation];

        if (!v6)
        {
          long long v7 = *(void **)(a1 + 32);
          objc_msgSend(v7, "_onQueue_startQueue");
        }
      }
    }
  }
  else if ((v4 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      long long v8 = [*(id *)(a1 + 32) device];
      uint64_t v11 = [v8 idsDeviceIdentifier];
      MOLogWrite();
    }
    uint64_t v9 = *(void **)(a1 + 32);
    [v9 setIsSuspended:1];
  }
}

void sub_10003748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000374A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentInstallOperation];
  if (!v2) {
    goto LABEL_7;
  }
  unsigned int v3 = (void *)v2;
  unsigned int v4 = [*(id *)(a1 + 32) currentInstallOperation];
  uint64_t v5 = [v4 watchAppBundleID];
  unsigned int v6 = [v5 isEqualToString:*(void *)(a1 + 40)];

  if (v6)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v26 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    long long v7 = objc_msgSend(*(id *)(a1 + 32), "currentInstallOperation", v26);
    [v7 cancel];

    [*(id *)(a1 + 32) setCancelCurrentOperation:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
LABEL_7:
    long long v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = [v8 placeholderInstallQueue];
    LOBYTE(v8) = objc_msgSend(v8, "_onQueue_removeInstallOperationWithWatchBundleID:fromQueue:", v9, v10);

    if (v8) {
      goto LABEL_11;
    }
    uint64_t v11 = *(void **)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = [v11 highPriorityUpdateQueue];
    LOBYTE(v11) = objc_msgSend(v11, "_onQueue_removeInstallOperationWithWatchBundleID:fromQueue:", v12, v13);

    if (v11) {
      goto LABEL_11;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = [v14 normalPriorityUpdateQueue];
    LOBYTE(v14) = objc_msgSend(v14, "_onQueue_removeInstallOperationWithWatchBundleID:fromQueue:", v15, v16);

    if ((v14 & 1) != 0
      || (id v17 = *(void **)(a1 + 32),
          uint64_t v18 = *(void *)(a1 + 40),
          [v17 normalPriorityNewAppUpdateQueue],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v17) = objc_msgSend(v17, "_onQueue_removeInstallOperationWithWatchBundleID:fromQueue:", v18, v19), v19, v17))
    {
LABEL_11:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v26 = *(void *)(a1 + 40);
        MOLogWrite();
      }
      id v20 = objc_msgSend(*(id *)(a1 + 32), "completions", v26);
      id v21 = [v20 objectForKeyedSubscript:*(void *)(a1 + 40)];

      qos_class_t v22 = qos_class_self();
      long long v23 = dispatch_get_global_queue(v22, 0);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10003777C;
      v27[3] = &unk_10008D108;
      id v28 = v21;
      id v24 = v21;
      sub_100006BB8(v23, v27);

      id v25 = [*(id *)(a1 + 32) completions];
      [v25 removeObjectForKey:*(void *)(a1 + 40)];
    }
  }
}

void sub_10003777C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  sub_100007574((uint64_t)"-[ACXInstallQueue cancelInstallForWatchAppBundleID:]_block_invoke_2", 210, @"ACXErrorDomain", 6, @"Cancelled", a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
}

void sub_10003794C(id a1, NSString *a2, id a3)
{
  id v3 = a3;
  qos_class_t v4 = qos_class_self();
  uint64_t v5 = dispatch_get_global_queue(v4, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  void v7[2] = sub_1000379FC;
  v7[3] = &unk_10008D108;
  id v8 = v3;
  id v6 = v3;
  sub_100006BB8(v5, v7);
}

void sub_1000379FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  sub_100007574((uint64_t)"-[ACXInstallQueue _onQueue_cancelAllPendingInstalls]_block_invoke_2", 233, @"ACXErrorDomain", 6, @"Cancelled", a6, a7, a8, v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
}

id sub_100037B04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_cancelAllPendingInstalls");
}

void sub_1000383AC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1000383C8(uint64_t a1, uint64_t a2, double a3)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    double v12 = a3;
    uint64_t v10 = a2;
    MOLogWrite();
  }
  id v6 = objc_msgSend(*(id *)(a1 + 32), "bundleID", v10, *(void *)&v12);
  +[ACXDeviceConnectionClient messageAllObserversWithInstallProgressForApplication:v6 progress:a2 phase:a3];

  if (a2 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v13 = WeakRetained;
      if (a3 == 0.0)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v11 = [*(id *)(a1 + 32) bundleID];
          MOLogWrite();

          id WeakRetained = v13;
        }
        uint64_t v8 = objc_msgSend(WeakRetained, "recentlyCompletedWatchAppInstalls", v11);
        uint64_t v9 = [*(id *)(a1 + 32) bundleID];
        [v8 addIdentifierIfNotPresent:v9];
      }
      else
      {
        uint64_t v8 = [WeakRetained recentlyCompletedWatchAppInstalls];
        uint64_t v9 = [*(id *)(a1 + 32) bundleID];
        [v8 updateTimeOnIdentifier:v9];
      }

      id WeakRetained = v13;
    }
  }
}

void sub_100038574(uint64_t a1, void *a2)
{
  id v3 = a2;
  qos_class_t v4 = [*(id *)(a1 + 32) internalQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100038658;
  v8[3] = &unk_10008DB28;
  char v13 = *(unsigned char *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  sub_100006BB8(v4, v8);
}

id sub_100038658(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 64)
    || *(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) cancelCurrentOperation] & 1) != 0
    || ([*(id *)(a1 + 40) currentInstallOperation],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        id v3 = [v2 installType],
        v2,
        v3))
  {
    id v4 = *(id *)(a1 + 32);
    if ([*(id *)(a1 + 40) cancelCurrentOperation]) {
      BOOL v8 = v4 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      sub_100007574((uint64_t)"-[ACXInstallQueue _onQueue_deQueueNextOperation]_block_invoke_3", 394, @"ACXErrorDomain", 6, @"Install canceled", v5, v6, v7, (uint64_t)v18);
      id v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (v4)
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
        goto LABEL_19;
      }
      id v9 = [*(id *)(a1 + 48) bundleID];
      sub_100008300(*(unsigned __int8 *)(a1 + 64));
      sub_100008300((int)[*(id *)(a1 + 48) isUserInitiated]);
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 5) {
        goto LABEL_19;
      }
      id v9 = [*(id *)(a1 + 48) bundleID];
    }
    MOLogWrite();

LABEL_19:
    qos_class_t v10 = qos_class_self();
    id v11 = dispatch_get_global_queue(v10, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_100038930;
    v19[3] = &unk_10008CCC8;
    id v12 = *(id *)(a1 + 56);
    id v20 = v4;
    id v21 = v12;
    id v13 = v4;
    sub_100006BB8(v11, v19);

    goto LABEL_20;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v18 = [*(id *)(a1 + 48) bundleID];
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 40), "_queueForPriority:", objc_msgSend(*(id *)(a1 + 48), "priority", v18));
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 addObject:*(void *)(a1 + 48)];
  id v15 = objc_retainBlock(*(id *)(a1 + 56));
  uint64_t v16 = [*(id *)(a1 + 40) completions];
  id v17 = [*(id *)(a1 + 48) bundleID];
  [v16 setObject:v15 forKeyedSubscript:v17];

LABEL_20:
  return objc_msgSend(*(id *)(a1 + 40), "_onQueue_deQueueNextOperation");
}

uint64_t sub_100038930(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100038FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100038FC0(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_installIsPendingForWatchApp:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10003926C(id a1)
{
  uint64_t v1 = +[NSFileManager defaultManager];
  uint64_t v2 = sub_100007950();
  [v1 removeItemAtURL:v2 error:0];

  if (mach_timebase_info((mach_timebase_info_t)&qword_1000A55B0))
  {
    syslog(3, "Failed to get timebase info\n");
    qword_1000A55B0 = (uint64_t)&_mh_execute_header;
  }
}

id sub_100039940(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_prepForTransferAndInstall");
}

id sub_1000399D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCancelled:1];
}

void sub_100039B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v9 = *(void **)(a1 + 32);
  sub_100007574((uint64_t)"-[ACXServerInstallOperation _onQueue_armWatchdog]_block_invoke", 187, @"ACXErrorDomain", 26, @"Didn't get reply from gizmo after %llu seconds.", a6, a7, a8, 900);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_onQueue_callCompletion:", v10);
}

void sub_10003A764(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    sub_100007710((uint64_t)"-[ACXServerInstallOperation _onQueue_prepForTransferAndInstall]_block_invoke", 370, @"ACXErrorDomain", 8, a2, 0, @"Failed to create socket", a8, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_callCompletion:", v11);
  }
  else
  {
    [*(id *)(a1 + 32) setAcquiredSocket:1];
    id v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "_onQueue_doTransferAndInstall");
  }
}

void sub_10003BC04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 128));
  _Unwind_Resume(a1);
}

id sub_10003BC6C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained && [WeakRetained cancelled])
  {
    id v13 = sub_100007574((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]_block_invoke", 507, NSPOSIXErrorDomain, 89, 0, v10, v11, v12, v19);
    uint64_t v14 = [v9 watchAppBundleID];
    sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]_block_invoke", 507, @"ACXErrorDomain", 6, v13, 0, @"Operation cancelled for %@.", v15, (uint64_t)v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      id v16 = v16;
      id v17 = 0;
      *a4 = v16;
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v16 = [*(id *)(a1 + 32) socketManager];
    id v17 = [v16 writeBytes:a2 length:a3 error:a4];
  }

  return v17;
}

void sub_10003BDA4(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_callProgressBlockWithPhase:percent:", 1, a2);
    id WeakRetained = v4;
  }
}

void sub_10003BDFC(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setGotStreamingZipComplete:1];
    if (v10)
    {
      uint64_t v5 = [v10 domain];
      unsigned int v6 = [v5 isEqualToString:@"ACXErrorDomain"];

      if (v6)
      {
        objc_msgSend(v4, "_onQueue_callCompletion:", v10);
      }
      else
      {
        BOOL v8 = sub_100007710((uint64_t)"-[ACXServerInstallOperation receivedDictionaryOrData:]_block_invoke_3", 540, @"ACXErrorDomain", 9, v10, 0, @"Transfer failed", v7, v9);
        objc_msgSend(v4, "_onQueue_callCompletion:", v8);
      }
    }
    else if ([v4 gotTransferDone])
    {
      objc_msgSend(v4, "_onQueue_startInstall");
    }
    else
    {
      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
        MOLogWrite();
      }
      objc_msgSend(v4, "_onQueue_armWatchdog");
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_10003C2D0(id a1)
{
  uint64_t v1 = objc_alloc_init(ACXDeviceManager);
  uint64_t v2 = qword_1000A55B8;
  qword_1000A55B8 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_10003C47C(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 48);
  id v3 = (id *)(*(void *)(a1 + 32) + 48);

  objc_storeStrong(v3, v2);
}

void sub_10003C610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10003C628(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003C638(uint64_t a1)
{
}

uint64_t sub_10003C640(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activePairedDevice];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_10003C808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003C820(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) devices];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10003CA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003CA1C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) devices];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003CAC0;
  v5[3] = &unk_10008DC90;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_10003CAC0(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  uint64_t v7 = [v8 pairingID];
  if ([v7 isEqual:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
}

void sub_10003CD14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003CD2C(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) devices];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10003CE6C(id *a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  id v47 = objc_opt_new();
  uint64_t v2 = objc_opt_new();
  uint64_t v46 = objc_opt_new();
  uint64_t v43 = objc_opt_new();
  uint64_t v45 = objc_opt_new();
  uint64_t v44 = objc_opt_new();
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = a1[4];
  id v52 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v52; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        id v5 = (void *)IDSCopyIDForDevice();
        id v6 = [v4 productVersion];
        id v7 = [v6 compare:@"8.0" options:64];

        id v8 = [a1[5] serviceName];
        unsigned int v9 = [v8 isEqualToString:@"com.apple.private.alloy.appsyncconduit.v2"];

        if (v9 && v7 == (id)-1)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            id v10 = [v4 productVersion];
            id v41 = v5;
            CFStringRef v42 = @"com.apple.private.alloy.appsyncconduit.v2";
            id v40 = v10;
            goto LABEL_19;
          }
          goto LABEL_20;
        }
        uint64_t v11 = [a1[5] serviceName];
        unsigned int v12 = [v11 isEqualToString:@"com.apple.private.alloy.appsyncconduit"];

        if (v12 && v7 != (id)-1)
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
          {
            id v10 = [v4 productVersion];
            id v41 = v5;
            CFStringRef v42 = @"com.apple.private.alloy.appsyncconduit";
            id v40 = v10;
LABEL_19:
            MOLogWrite();
          }
LABEL_20:
          objc_msgSend(v2, "addObject:", v5, v40, v41, v42);
          goto LABEL_48;
        }
        [v47 addObject:v5];
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v49 = [a1[5] serviceName];
          int v48 = sub_100008300((int)[v4 isActive]);
          sub_100008300((int)[v4 isLocallyPaired]);
          sub_100008300((int)[v4 isConnected]);
          sub_100008300((int)[v4 isNearby]);
          [v4 serviceMinCompatibilityVersion];
          [v4 minCompatibilityVersion];
          [v4 maxCompatibilityVersion];
          CFStringRef v42 = (const __CFString *)v48;
          id v40 = v49;
          id v41 = v5;
          MOLogWrite();
        }
        id v13 = objc_msgSend(a1[6], "devices", v40);
        uint64_t v14 = [v13 objectForKeyedSubscript:v5];

        if (v14)
        {
          id v15 = a1[5];
          id v16 = [a1[6] legacyMessagingService];
          if (v15 == v16)
          {
            uint64_t v19 = [(ACXDevice *)v14 messager];
            id v20 = [a1[6] currentMessagingService];

            if (v19 == v20)
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
                MOLogWrite();
              }
              goto LABEL_47;
            }
          }
          else
          {
          }
          unsigned int v21 = [(ACXDevice *)v14 isTombstone];
          unsigned int v22 = [(ACXDevice *)v14 isConnected];
          unsigned int v23 = [v4 isConnected];
          [(ACXDevice *)v14 updateIDSDevice:v4 forMessager:a1[5]];
          if (v21)
          {
            uint64_t v18 = v46;
            goto LABEL_36;
          }
          if ((v23 ^ 1 | v22))
          {
            if (((v23 | v22 ^ 1) & 1) == 0)
            {
              uint64_t v18 = v44;
              goto LABEL_36;
            }
          }
          else
          {
            uint64_t v18 = (void *)v45;
LABEL_36:
            [v18 addObject:v14];
          }
          if ([(ACXDevice *)v14 isActivePairedDevice])
          {
            uint64_t v24 = [a1[6] activePairedDevice];
            if (!v24
              || (id v25 = (void *)v24,
                  [a1[6] activePairedDevice],
                  uint64_t v26 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v27 = [v26 isEqual:v14],
                  v26,
                  v25,
                  (v27 & 1) == 0))
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                id v28 = [a1[6] activePairedDevice];
                long long v29 = [v28 idsDeviceIdentifier];
                [(ACXDevice *)v14 idsDeviceIdentifier];
                id v41 = v40 = v29;
                MOLogWrite();
              }
              objc_msgSend(a1[6], "setActivePairedDevice:", v14, v40);
            }
          }
          goto LABEL_47;
        }
        uint64_t v14 = [[ACXDevice alloc] initWithIDSDevice:v4 messager:a1[5]];
        if (v14)
        {
          id v17 = [a1[6] devices];
          [v17 setObject:v14 forKeyedSubscript:v5];

          uint64_t v18 = v46;
          goto LABEL_36;
        }
LABEL_47:

LABEL_48:
      }
      id v52 = [obj countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v52);
  }

  long long v30 = [a1[6] activePairedDevice];
  uint64_t v31 = [v30 idsDeviceIdentifier];

  uint64_t v32 = [a1[6] activePairedDevice];
  if (v32 && ([v47 containsObject:v31] & 1) == 0)
  {
    unsigned __int8 v39 = [v2 containsObject:v31];

    uint64_t v33 = (void *)v45;
    if ((v39 & 1) == 0)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v40 = v31;
        MOLogWrite();
      }
      objc_msgSend(a1[6], "setActivePairedDevice:", 0, v40);
    }
  }
  else
  {

    uint64_t v33 = (void *)v45;
  }
  id v34 = [a1[6] devices];
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_10003D6AC;
  v53[3] = &unk_10008DCB8;
  id v35 = v47;
  id v54 = v35;
  id v36 = v2;
  id v55 = v36;
  id v37 = v43;
  id v56 = v37;
  id v57 = a1[5];
  [v34 enumerateKeysAndObjectsUsingBlock:v53];

  id v38 = [a1[6] delegate];
  if ([v46 count] || objc_msgSend(v37, "count")) {
    [v38 newDevices:v46 removedDevices:v37];
  }
  if ([v33 count]) {
    [v38 devicesAreNowConnected:v33];
  }
  if ([v44 count]) {
    [v38 devicesAreNoLongerConnected:v44];
  }
}

void sub_10003D6AC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0
    && ([*(id *)(a1 + 40) containsObject:v6] & 1) == 0
    && ([v5 isTombstone] & 1) == 0)
  {
    [*(id *)(a1 + 48) addObject:v5];
    [v5 updateIDSDevice:0 forMessager:*(void *)(a1 + 56)];
  }
}

id sub_10003DEE0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
}

void sub_10003E6BC(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.AppConduit.ACXRemoteAppList", v3);
  uint64_t v2 = (void *)qword_1000A55D0;
  qword_1000A55D0 = (uint64_t)v1;
}

uint64_t sub_10003EF30()
{
  uint64_t result = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    return MOLogWrite();
  }
  return result;
}

id sub_10003EF8C(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 40), "_onQueue_stopSyncTimer", v4);
  uint64_t v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "_onQueue_reSync");
}

uint64_t sub_10003F328()
{
  uint64_t result = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    return MOLogWrite();
  }
  return result;
}

id sub_10003F384(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  uint64_t v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "_onQueue_reSync");
}

void sub_10003F6B0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 fetchBundleIDList];
}

id sub_10003F7CC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSyncTimer");
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_startResyncThrottleTimer");
}

void sub_10003FCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003FD04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_fetchRemainingBundleIDs");
    id WeakRetained = v2;
  }
}

void sub_10003FD48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fetchAppInfoForBundleIDs:*(void *)(a1 + 40)];
}

void sub_1000401FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100040220(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_fetchAppsForAppInstallRecords");
    id WeakRetained = v2;
  }
}

void sub_100040264(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 fetchAppInfoForBundleIDs:*(void *)(a1 + 40)];
}

void sub_1000404FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100040518(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_fetchOutstandingAppEvents");
    id WeakRetained = v2;
  }
}

void sub_10004055C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 fetchOutstandingAppEvents];
}

void sub_1000407C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000407DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_onQueue_acknowledgeAppEvents");
    id WeakRetained = v2;
  }
}

void sub_100040820(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 acknowledgeAppEventsForDBUUID:*(void *)(a1 + 40) throughSequenceNumber:*(void *)(a1 + 48)];
}

void sub_100040A5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 applicationsAdded:*(void *)(a1 + 40)];
}

void sub_100040C98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 applicationsUpdated:*(void *)(a1 + 40)];
}

void sub_100040ED4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observer];
  [v2 applicationsRemoved:*(void *)(a1 + 40)];
}

void sub_1000410E8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) observer];
  [v1 resyncCompleted];
}

void sub_100041204(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 96))
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 96);
    *(void *)(v3 + 96) = v2;
  }
  id v6 = [[ACXRemoteAppListObserver alloc] initWithObserver:*(void *)(a1 + 40) queue:*(void *)(a1 + 48)];
  id v5 = [*(id *)(a1 + 32) observers];
  [v5 addObject:v6];
}

void sub_100041374(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) observers];
  if (!v2) {
    return;
  }
  uint64_t v3 = (void *)v2;
  uint64_t v4 = [*(id *)(a1 + 32) observers];
  id v5 = [v4 count];

  if (!v5) {
    return;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7) {
    goto LABEL_16;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v19;
LABEL_5:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v19 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
    unsigned int v12 = [v11 observer];
    id v13 = v12;
    if (v12 == *(void **)(a1 + 40)) {
      break;
    }

LABEL_11:
    if (v8 == (id)++v10)
    {
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        goto LABEL_5;
      }
      goto LABEL_16;
    }
  }
  uint64_t v14 = [v11 queue];
  id v15 = *(void **)(a1 + 48);

  if (v14 != v15) {
    goto LABEL_11;
  }
  id v16 = v11;

  if (!v16) {
    return;
  }
  id v17 = [*(id *)(a1 + 32) observers];
  [v17 removeObject:v16];

  id v6 = v16;
LABEL_16:
}

id sub_1000415B0(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  [*(id *)(a1 + 32) setRemoteIsConnected:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_onQueue_stopResyncThrottleTimer");
}

uint64_t sub_1000416AC(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  [*(id *)(a1 + 32) setRemoteIsConnected:1];
  uint64_t v5 = [*(id *)(a1 + 32) resumeOnReconnect];
  id v2 = [*(id *)(a1 + 32) setResumeOnReconnect:0];
  uint64_t v3 = v5;
  if (v5)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      MOLogWrite();
      uint64_t v3 = v5;
    }
    id v2 = (id)(*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
    uint64_t v3 = v5;
  }

  return _objc_release_x1(v2, v3);
}

id sub_100041848(uint64_t a1)
{
  if ([*(id *)(a1 + 32) performingResync])
  {
    id result = (id)qword_1000A5608;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      return (id)MOLogWrite();
    }
    return result;
  }
  uint64_t v3 = [*(id *)(a1 + 32) currentDBUUID];
  unsigned __int8 v4 = [v3 isEqual:*(void *)(a1 + 40)];

  if ((v4 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v6 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) currentDBUUID];
      v9 = id v8 = v6;
      MOLogWrite();
    }
    goto LABEL_17;
  }
  if ((unint64_t)[*(id *)(a1 + 32) lastSequenceNumber] < *(void *)(a1 + 48))
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      [*(id *)(a1 + 32) lastSequenceNumber];
      MOLogWrite();
    }
    uint64_t v5 = *(void **)(a1 + 32);
    return objc_msgSend(v5, "_onQueue_fetchOutstandingAppEvents");
  }
  id result = [*(id *)(a1 + 32) lastSequenceNumber];
  if ((unint64_t)result > *(void *)(a1 + 48))
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v8 = [*(id *)(a1 + 32) lastSequenceNumber];
      uint64_t v9 = *(void **)(a1 + 48);
      MOLogWrite();
    }
LABEL_17:
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDBUUID:", *(void *)(a1 + 40), v8, v9);
    [*(id *)(a1 + 32) setLastSequenceNumber:0];
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSyncTimer");
    id v7 = *(void **)(a1 + 32);
    return objc_msgSend(v7, "_onQueue_reSync");
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    return (id)MOLogWrite();
  }
  return result;
}

id sub_100041B8C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSyncTimer");
  [*(id *)(a1 + 32) setCurrentDBUUID:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _resetLastSequenceNumberTo:*(void *)(a1 + 56)];
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v2 = [*(id *)(a1 + 48) count];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 56);
    id v6 = v2;
    MOLogWrite();
  }
  id v3 = objc_msgSend(*(id *)(a1 + 48), "copy", v6, v7, v8);
  [*(id *)(a1 + 32) setBundleIDsToFetch:v3];

  [*(id *)(a1 + 32) setAppInstallRecordsToFetch:0];
  unsigned __int8 v4 = *(void **)(a1 + 32);

  return objc_msgSend(v4, "_onQueue_fetchRemainingBundleIDs");
}

void sub_100041D34(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSyncTimer");
  id v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) currentDBUUID];
  unsigned __int8 v4 = [v2 isEqual:v3];

  if ((v4 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v47 = *(void **)(a1 + 32);
    objc_msgSend(v47, "_onQueue_reSync");
    return;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v56 = (uint64_t)[*(id *)(a1 + 48) count];
    MOLogWrite();
  }
  long long v61 = objc_opt_new();
  long long v62 = objc_opt_new();
  uint64_t v5 = [*(id *)(a1 + 32) appList];
  id v68 = [v5 mutableCopy];

  id v6 = [*(id *)(a1 + 32) appInstallRecordsToFetch];
  id v7 = [v6 mutableCopy];

  uint64_t v8 = [*(id *)(a1 + 32) bundleIDsToFetch];
  id v66 = [v8 mutableCopy];

  BOOL v60 = v7 == 0;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = *(id *)(a1 + 48);
  id v64 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
  unint64_t v9 = 0;
  if (!v64)
  {
LABEL_48:

    if ((unint64_t)[*(id *)(a1 + 32) lastSequenceNumber] < v9) {
      [*(id *)(a1 + 32) setLastSequenceNumber:v9];
    }
    id obj = (id)objc_opt_new();
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v29 = [*(id *)(a1 + 32) attemptsPerBundleID];
    long long v30 = [v29 allKeys];

    id v31 = [v30 countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (!v31)
    {
LABEL_64:

      uint64_t v43 = v61;
      CFStringRef v42 = v62;
      uint64_t v44 = v66;
      if ([obj count])
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v56 = 3;
          id v58 = obj;
          MOLogWrite();
        }
        uint64_t v45 = objc_msgSend(*(id *)(a1 + 32), "attemptsPerBundleID", v56, v58);
        [v45 removeObjectsForKeys:obj];
      }
      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_acknowledgeAppEvents");
        if ([v7 count])
        {
          id v46 = [v7 copy];
          [*(id *)(a1 + 32) setAppInstallRecordsToFetch:v46];
        }
        else
        {
          [*(id *)(a1 + 32) setAppInstallRecordsToFetch:0];
        }
      }
      if (objc_msgSend(v66, "count", v56))
      {
        id v48 = [v66 copy];
        [*(id *)(a1 + 32) setBundleIDsToFetch:v48];
      }
      else
      {
        [*(id *)(a1 + 32) setBundleIDsToFetch:0];
      }
      id v49 = [v68 copy];
      [*(id *)(a1 + 32) setAppList:v49];

      if ([v61 count]) {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_appsAdded:", v61);
      }
      if ([v62 count]) {
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_appsUpdated:", v62);
      }
      uint64_t v50 = [*(id *)(a1 + 32) bundleIDsToFetch];
      id v51 = [v50 count];

      id v52 = *(void **)(a1 + 32);
      if (v51)
      {
        objc_msgSend(v52, "_onQueue_fetchRemainingBundleIDs");
      }
      else if (v60)
      {
        objc_msgSend(v52, "_onQueue_fetchOutstandingAppEvents");
      }
      else
      {
        long long v53 = [v52 appInstallRecordsToFetch];
        id v54 = [v53 count];

        if (v54)
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_fetchAppsForAppInstallRecords");
        }
        else
        {
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
            MOLogWrite();
          }
          id v55 = [*(id *)(a1 + 32) attemptsPerBundleID];
          [v55 removeAllObjects];

          if ([*(id *)(a1 + 32) performingResync])
          {
            [*(id *)(a1 + 32) setPerformingResync:0];
            objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseResynced");
          }
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveData");
        }
      }
      goto LABEL_107;
    }
    id v32 = v31;
    uint64_t v33 = *(void *)v70;
LABEL_52:
    uint64_t v34 = 0;
    while (1)
    {
      if (*(void *)v70 != v33) {
        objc_enumerationMutation(v30);
      }
      uint64_t v35 = *(void *)(*((void *)&v69 + 1) + 8 * v34);
      id v36 = objc_msgSend(*(id *)(a1 + 32), "attemptsPerBundleID", v56);
      id v37 = [v36 objectForKeyedSubscript:v35];

      if (v37)
      {
        unsigned int v38 = [v37 unsignedIntValue];
        uint64_t v39 = v38 + 1;
        if (v38 >= 2)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v78 = v35;
            __int16 v79 = 2048;
            uint64_t v80 = v39;
            _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to query app info for %@ after %lu attempts - attempting to proceed with the sync gracefully", buf, 0x16u);
          }
          [v7 removeObjectForKey:v35];
          [v66 removeObject:v35];
          [v68 removeObjectForKey:v35];
          [obj addObject:v35];
          goto LABEL_62;
        }
      }
      else
      {
        uint64_t v39 = 1;
      }
      id v40 = +[NSNumber numberWithUnsignedInteger:v39];
      id v41 = [*(id *)(a1 + 32) attemptsPerBundleID];
      [v41 setObject:v40 forKeyedSubscript:v35];

LABEL_62:
      if (v32 == (id)++v34)
      {
        id v32 = [v30 countByEnumeratingWithState:&v69 objects:v81 count:16];
        if (!v32) {
          goto LABEL_64;
        }
        goto LABEL_52;
      }
    }
  }
  uint64_t v63 = *(void *)v74;
LABEL_7:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v74 != v63) {
      objc_enumerationMutation(obj);
    }
    uint64_t v11 = *(void **)(*((void *)&v73 + 1) + 8 * v10);
    id v13 = v11;
    uint64_t v14 = [v13 bundleIdentifier];
    if (v7) {
      break;
    }
    [v66 removeObject:v14];
    unsigned int v22 = [*(id *)(a1 + 32) attemptsPerBundleID];
    [v22 removeObjectForKey:v14];

    id v16 = [v68 objectForKeyedSubscript:v14];
    if (v16)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v56 = objc_msgSend(v13, "bundleIdentifier", v56);
        id v58 = [v13 sequenceNumber];
        MOLogWrite();
      }
      id v23 = objc_msgSend(v13, "copy", v56);
      uint64_t v24 = v62;
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        uint64_t v56 = objc_msgSend(v13, "bundleIdentifier", v56);
        id v58 = [v13 sequenceNumber];
        MOLogWrite();
      }
      id v23 = objc_msgSend(v13, "copy", v56);
      uint64_t v24 = v61;
    }
    [v24 addObject:v23];

    [v68 setObject:v13 forKeyedSubscript:v14];
LABEL_44:

    id v28 = [v13 sequenceNumber];
    if ((unint64_t)v28 > v9) {
      unint64_t v9 = (unint64_t)v28;
    }

    if (v64 == (id)++v10)
    {
      id v64 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
      if (!v64) {
        goto LABEL_48;
      }
      goto LABEL_7;
    }
  }
  id v15 = [v7 objectForKeyedSubscript:v14];
  if (v15)
  {
    id v16 = v15;
    long long v65 = v12;
    id v17 = [v15 sequenceNumber];
    id v18 = [v13 sequenceNumber];
    long long v19 = [v68 objectForKeyedSubscript:v14];
    long long v20 = v19;
    if (v17 <= v18)
    {
      if (v17 < v18)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v58 = v14;
          id v59 = v17;
          uint64_t v56 = (uint64_t)v18;
          MOLogWrite();
        }
        BOOL v60 = 1;
      }
    }
    else
    {
      if (!v19 || [v19 sequenceNumber] != v17)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v58 = v14;
          id v59 = v17;
          uint64_t v56 = (uint64_t)v18;
          MOLogWrite();
        }
        objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSync", v56, v58, v59);

        uint64_t v43 = v61;
        CFStringRef v42 = v62;
        uint64_t v44 = v66;
        unsigned int v12 = v65;
        goto LABEL_86;
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        uint64_t v56 = (uint64_t)v17;
        id v58 = v14;
        MOLogWrite();
      }
      id v21 = v20;

      id v13 = v21;
    }
    objc_msgSend(v7, "removeObjectForKey:", v14, v56, v58, v59);
    id v25 = [*(id *)(a1 + 32) attemptsPerBundleID];
    [v25 removeObjectForKey:v14];

    [v68 setObject:v13 forKeyedSubscript:v14];
    if (v20)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v57 = [v13 bundleIdentifier];
        id v58 = [v13 sequenceNumber];
        MOLogWrite();
      }
      id v26 = objc_msgSend(v13, "copy", v57);
      unsigned __int8 v27 = v62;
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v57 = [v13 bundleIdentifier];
        id v58 = [v13 sequenceNumber];
        MOLogWrite();
      }
      id v26 = objc_msgSend(v13, "copy", v57);
      unsigned __int8 v27 = v61;
    }
    [v27 addObject:v26];

    unsigned int v12 = v65;
    goto LABEL_44;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    uint64_t v56 = (uint64_t)v14;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_reSync", v56);
  uint64_t v43 = v61;
  CFStringRef v42 = v62;
  uint64_t v44 = v66;
LABEL_86:

LABEL_107:
}

void sub_1000428E4(uint64_t a1)
{
  uint64_t v1 = a1;
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_stopSyncTimer");
  id v2 = *(void **)(v1 + 40);
  id v3 = [*(id *)(v1 + 32) currentDBUUID];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unint64_t v4 = *(void *)(v1 + 56);
  if (v4 > (unint64_t)[*(id *)(v1 + 32) lastSequenceNumber] + 1)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_9;
    }
    id v30 = *(id *)(v1 + 56);
    id v32 = [*(id *)(v1 + 32) lastSequenceNumber];
LABEL_8:
    MOLogWrite();
LABEL_9:
    objc_msgSend(*(id *)(v1 + 32), "_onQueue_reSync", v30, v32);
    uint64_t v5 = 0;
    id v6 = 0;
    id v7 = 0;
    goto LABEL_10;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v8 = [*(id *)(v1 + 48) count];
    id v32 = *(id *)(v1 + 40);
    uint64_t v34 = *(void *)(v1 + 56);
    id v30 = v8;
    MOLogWrite();
  }
  if (objc_msgSend(*(id *)(v1 + 48), "count", v30, v32, v34))
  {
    unint64_t v9 = [*(id *)(v1 + 32) appList];
    id v10 = [v9 mutableCopy];

    id v11 = [*(id *)(v1 + 32) lastSequenceNumber];
    id v37 = objc_opt_new();
    unsigned int v12 = [*(id *)(v1 + 32) appInstallRecordsToFetch];
    id v13 = [v12 mutableCopy];

    if (!v13) {
      id v13 = (id)objc_opt_new();
    }
    unsigned int v38 = v13;
    uint64_t v39 = v10;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v36 = v1;
    id v14 = *(id *)(v1 + 48);
    id v15 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v15)
    {
      id v16 = v15;
      char v40 = 0;
      uint64_t v17 = *(void *)v42;
      id v18 = v11;
      while (1)
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unsigned int v22 = [v20 bundleID];
          id v23 = [v20 sequenceNumber];
          id v24 = [v20 eventType];
          if (v24 == (id)1)
          {
            if (v23 <= v11)
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                id v33 = v23;
                id v35 = v11;
                id v31 = v22;
                goto LABEL_47;
              }
            }
            else
            {
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
              {
                id v31 = v22;
                id v33 = v23;
                MOLogWrite();
              }
              if (!(v40 & 1 | (v23 <= v18))) {
                id v18 = v23;
              }
              id v25 = objc_msgSend(v39, "objectForKeyedSubscript:", v22, v31, v33);
              if (v25)
              {
                [v39 removeObjectForKey:v22];
                [v37 addObject:v25];
              }
            }
          }
          else if (v24)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              id v33 = v22;
              id v35 = v23;
              id v31 = v24;
LABEL_47:
              MOLogWrite();
            }
          }
          else if (v23 <= v11)
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              id v33 = v23;
              id v35 = v11;
              id v31 = v22;
              goto LABEL_47;
            }
          }
          else
          {
            if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
            {
              id v31 = v22;
              id v33 = v23;
              MOLogWrite();
            }
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v20, v22, v31, v33, v35);
            char v40 = 1;
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (!v16) {
          goto LABEL_53;
        }
      }
    }
    id v18 = v11;
LABEL_53:

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    uint64_t v1 = v36;
    objc_msgSend(*(id *)(v36 + 32), "setLastSequenceNumber:", v18, v31, v33);
    id v7 = v38;
    id v26 = [v38 copy];
    [*(id *)(v36 + 32) setAppInstallRecordsToFetch:v26];

    uint64_t v5 = v39;
    id v27 = [v39 copy];
    [*(id *)(v36 + 32) setAppList:v27];

    id v6 = v37;
    if ([v37 count]) {
      objc_msgSend(*(id *)(v36 + 32), "_onQueue_appsRemoved:", v37);
    }
    objc_msgSend(*(id *)(v36 + 32), "_onQueue_acknowledgeAppEvents");
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = 0;
    id v7 = 0;
  }
  id v28 = [*(id *)(v1 + 32) appInstallRecordsToFetch];
  id v29 = [v28 count];

  if (v29)
  {
    objc_msgSend(*(id *)(v1 + 32), "_onQueue_fetchAppsForAppInstallRecords");
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    if ([*(id *)(v1 + 32) performingResync])
    {
      [*(id *)(v1 + 32) setPerformingResync:0];
      objc_msgSend(*(id *)(v1 + 32), "_onQueue_saveData");
      objc_msgSend(*(id *)(v1 + 32), "_onQueue_databaseResynced");
    }
  }
LABEL_10:
}

void sub_100042F6C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) performingResync])
  {
    id v2 = objc_opt_new();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v3 = *(id *)(a1 + 40);
    id v4 = [v3 countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v46 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = [*(id *)(*((void *)&v45 + 1) + 8 * i) bundleIdentifier];
          [v2 addObject:v8];
        }
        id v5 = [v3 countByEnumeratingWithState:&v45 objects:v50 count:16];
      }
      while (v5);
    }

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }

    return;
  }
  unint64_t v9 = *(void **)(a1 + 48);
  id v10 = [*(id *)(a1 + 32) currentDBUUID];
  LOBYTE(v9) = [v9 isEqual:v10];

  if ((v9 & 1) == 0)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v31 = *(void **)(a1 + 32);
    objc_msgSend(v31, "_onQueue_reSync");
    return;
  }
  uint64_t v38 = objc_opt_new();
  uint64_t v37 = objc_opt_new();
  id v11 = [*(id *)(a1 + 32) appList];
  id v12 = [v11 mutableCopy];

  id v13 = (char *)[*(id *)(a1 + 32) lastSequenceNumber];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v36 = a1;
  id obj = *(id *)(a1 + 40);
  id v14 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
  uint64_t v39 = v12;
  if (!v14) {
    goto LABEL_37;
  }
  id v15 = v14;
  uint64_t v16 = *(void *)v42;
  while (2)
  {
    for (j = 0; j != v15; j = (char *)j + 1)
    {
      if (*(void *)v42 != v16) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
      long long v20 = [v18 bundleIdentifier];
      id v21 = (char *)[v18 sequenceNumber];
      unsigned int v22 = [v12 objectForKeyedSubscript:v20];
      id v23 = v22;
      if (!v22)
      {
        id v24 = v13 + 1;
        if (v13 + 1 != v21) {
          goto LABEL_45;
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v34 = objc_msgSend(v18, "counterpartIdentifiers", v33);
          id v35 = v21;
          id v33 = v20;
          MOLogWrite();

          id v12 = v39;
        }
        id v25 = objc_msgSend(v18, "copy", v33, v34, v35);
        id v26 = (void *)v38;
LABEL_34:
        [v26 addObject:v25];

        [v12 setObject:v18 forKeyedSubscript:v20];
        id v13 = v21;
        goto LABEL_35;
      }
      if ([v22 sequenceNumber] != v21)
      {
        id v24 = v13 + 1;
        if (v13 + 1 != v21)
        {
LABEL_45:
          uint64_t v27 = v36;
          id v30 = (void *)v37;
          if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            uint64_t v34 = v21;
            id v35 = v24;
            id v33 = v20;
            MOLogWrite();
          }

          id v29 = (void *)v38;
          goto LABEL_53;
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          uint64_t v34 = objc_msgSend(v18, "counterpartIdentifiers", v33);
          id v35 = v21;
          id v33 = v20;
          MOLogWrite();

          id v12 = v39;
        }
        id v25 = objc_msgSend(v18, "copy", v33);
        id v26 = (void *)v37;
        goto LABEL_34;
      }
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
      {
        id v33 = v20;
        uint64_t v34 = v21;
        MOLogWrite();
      }
LABEL_35:
    }
    id v15 = [obj countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_37:

  uint64_t v27 = v36;
  if (v13 == *(char **)(v36 + 56))
  {
    id v28 = [v12 copy];
    [*(id *)(v36 + 32) setAppList:v28];

    [*(id *)(v36 + 32) setLastSequenceNumber:v13];
    objc_msgSend(*(id *)(v36 + 32), "_onQueue_acknowledgeAppEvents");
    id v30 = (void *)v37;
    id v29 = (void *)v38;
  }
  else
  {
    id v29 = (void *)v38;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      id v33 = *(void **)(v36 + 56);
      uint64_t v34 = v13;
      MOLogWrite();
    }
    id v30 = (void *)v37;
LABEL_53:
    id v32 = objc_msgSend(v12, "copy", v33, v34, v35);
    [*(id *)(v27 + 32) setAppList:v32];

    [*(id *)(v27 + 32) setLastSequenceNumber:v13];
    objc_msgSend(*(id *)(v27 + 32), "_onQueue_acknowledgeAppEvents");
    objc_msgSend(*(id *)(v27 + 32), "_onQueue_fetchOutstandingAppEvents");
  }
  objc_msgSend(*(id *)(v27 + 32), "_onQueue_saveData", v33);
  if ([v29 count]) {
    objc_msgSend(*(id *)(v27 + 32), "_onQueue_appsAdded:", v29);
  }
  if ([v30 count]) {
    objc_msgSend(*(id *)(v27 + 32), "_onQueue_appsUpdated:", v30);
  }
}

void sub_100043654(uint64_t a1)
{
  if ([*(id *)(a1 + 32) performingResync])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
  }
  else
  {
    id v2 = *(void **)(a1 + 48);
    id v3 = [*(id *)(a1 + 32) currentDBUUID];
    LOBYTE(v2) = [v2 isEqual:v3];

    if (v2)
    {
      id v21 = objc_opt_new();
      id v4 = [*(id *)(a1 + 32) appList];
      id v5 = [v4 mutableCopy];

      uint64_t v6 = (char *)[*(id *)(a1 + 32) lastSequenceNumber];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v20 = a1;
      id v7 = *(id *)(a1 + 40);
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            id v14 = [v5 objectForKeyedSubscript:v12];
            if (v14)
            {
              ++v6;
              if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
              {
                uint64_t v18 = v12;
                long long v19 = v6;
                MOLogWrite();
              }
              objc_msgSend(v5, "removeObjectForKey:", v12, v18, v19);
              [v21 addObject:v14];
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              uint64_t v18 = v12;
              MOLogWrite();
            }
          }
          id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v9);
      }

      id v15 = [v5 copy];
      [*(id *)(v20 + 32) setAppList:v15];

      if (v6 == *(char **)(v20 + 56))
      {
        [*(id *)(v20 + 32) setLastSequenceNumber:v6];
        objc_msgSend(*(id *)(v20 + 32), "_onQueue_acknowledgeAppEvents");
        uint64_t v16 = v21;
      }
      else
      {
        uint64_t v16 = v21;
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          uint64_t v18 = *(void *)(v20 + 56);
          long long v19 = v6;
          MOLogWrite();
        }
        objc_msgSend(*(id *)(v20 + 32), "_onQueue_fetchOutstandingAppEvents", v18, v19);
      }
      objc_msgSend(*(id *)(v20 + 32), "_onQueue_saveData", v18);
      if ([v16 count]) {
        objc_msgSend(*(id *)(v20 + 32), "_onQueue_appsRemoved:", v16);
      }
    }
    else
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      uint64_t v17 = *(void **)(a1 + 32);
      objc_msgSend(v17, "_onQueue_reSync");
    }
  }
}

void sub_100043AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100043AC0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced") ^ 1;
  id v4 = [*(id *)(a1 + 32) appList];
  if ([v4 count])
  {
  }
  else
  {
    unsigned __int8 v2 = [*(id *)(a1 + 32) performingResync];

    if ((v2 & 1) == 0)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      id v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "_onQueue_reSync");
    }
  }
}

void sub_100043CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100043CD8(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100043E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100043EAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100043EBC(uint64_t a1)
{
}

uint64_t sub_100043EC4(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    id v11 = [*(id *)(a1 + 32) appList];
    uint64_t v3 = [v11 allKeys];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    id v7 = v11;
  }
  else
  {
    uint64_t v6 = sub_100007710((uint64_t)"-[ACXRemoteAppList bundleIDsTrackedWithError:]_block_invoke", 1278, @"ACXErrorDomain", 43, 0, 0, @"App database is out of sync.", v2, v10);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v6;
  }

  return _objc_release_x1(v6, v7);
}

void sub_100044128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10004414C(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appList];
    uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    id v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
      return;
    }
    uint64_t v11 = sub_100007574((uint64_t)"-[ACXRemoteAppList applicationForBundleID:error:]_block_invoke", 1300, @"ACXErrorDomain", 19, @"App not found with bundle ID %@", v8, v9, v10, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v11 = sub_100007710((uint64_t)"-[ACXRemoteAppList applicationForBundleID:error:]_block_invoke", 1295, @"ACXErrorDomain", 43, 0, 0, @"Could not fetch app for bundle ID %@: App database is out of sync.", v2, *(void *)(a1 + 40));
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void *)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  _objc_release_x1(v11, v13);
}

void sub_1000443F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100044418(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appList];
    uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4 != 0;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      return;
    }
    uint64_t v8 = sub_100007574((uint64_t)"-[ACXRemoteAppList applicationIsInstalledWithBundleID:error:]_block_invoke", 1321, @"ACXErrorDomain", 19, @"App not found with bundle ID %@", v5, v6, v7, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v8 = sub_100007710((uint64_t)"-[ACXRemoteAppList applicationIsInstalledWithBundleID:error:]_block_invoke", 1316, @"ACXErrorDomain", 43, 0, 0, @"Could not check if app is installed with bundle ID %@: App database is out of sync.", v2, *(void *)(a1 + 40));
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void *)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  _objc_release_x1(v8, v10);
}

void sub_1000446E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100044704(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appList];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100044878;
    v15[3] = &unk_10008DD78;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    id v16 = v4;
    uint64_t v17 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v15];

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v9 = sub_100007574((uint64_t)"-[ACXRemoteAppList applicationWithCounterpartBundleID:error:]_block_invoke", 1347, @"ACXErrorDomain", 19, @"App not found with counterpart bundle ID %@", v6, v7, v8, *(void *)(a1 + 40));
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    uint64_t v12 = sub_100007710((uint64_t)"-[ACXRemoteAppList applicationWithCounterpartBundleID:error:]_block_invoke", 1337, @"ACXErrorDomain", 43, 0, 0, @"Could not get application with counterpart bundle ID %@: App database is out of sync.", v2, *(void *)(a1 + 40));
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    _objc_release_x1(v12, v14);
  }
}

void sub_100044878(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  uint64_t v6 = [v11 counterpartIdentifiers];
  unsigned int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = [v11 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

void sub_100044A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100044AA4(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appList];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100044C18;
    v15[3] = &unk_10008DD78;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    id v16 = v4;
    uint64_t v17 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v15];

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      uint64_t v9 = sub_100007574((uint64_t)"-[ACXRemoteAppList applicationIsInstalledWithCounterpartBundleID:error:]_block_invoke", 1373, @"ACXErrorDomain", 19, @"App not found with counterpart bundle ID %@", v6, v7, v8, *(void *)(a1 + 40));
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    uint64_t v12 = sub_100007710((uint64_t)"-[ACXRemoteAppList applicationIsInstalledWithCounterpartBundleID:error:]_block_invoke", 1363, @"ACXErrorDomain", 43, 0, 0, @"Could not get application with counterpart bundle ID %@: App database is out of sync.", v2, *(void *)(a1 + 40));
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    _objc_release_x1(v12, v14);
  }
}

void sub_100044C18(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v8 = a3;
  uint64_t v6 = [v8 counterpartIdentifiers];
  unsigned int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 isEligibleForWatchAppInstall];
    *a4 = 1;
  }
}

void sub_100044E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100044E70(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_databaseIsSynced"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) appList];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100044FE4;
    v15[3] = &unk_10008DD78;
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    id v16 = v4;
    uint64_t v17 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v15];

    if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      uint64_t v9 = sub_100007574((uint64_t)"-[ACXRemoteAppList appBundleIDForCounterpartBundleID:error:]_block_invoke", 1399, @"ACXErrorDomain", 19, @"App not found with counterpart bundle ID %@", v6, v7, v8, *(void *)(a1 + 40));
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      id v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
  else
  {
    uint64_t v12 = sub_100007710((uint64_t)"-[ACXRemoteAppList appBundleIDForCounterpartBundleID:error:]_block_invoke", 1389, @"ACXErrorDomain", 43, 0, 0, @"Could not get application with counterpart bundle ID %@: App database is out of sync.", v2, *(void *)(a1 + 40));
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void *)(v13 + 40);
    *(void *)(v13 + 40) = v12;
    _objc_release_x1(v12, v14);
  }
}

void sub_100044FE4(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v11 = a3;
  uint64_t v6 = [v11 counterpartIdentifiers];
  unsigned int v7 = [v6 containsObject:*(void *)(a1 + 32)];

  if (v7)
  {
    uint64_t v8 = [v11 bundleIdentifier];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
}

void sub_1000451B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_1000451D4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentDBUUID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id result = [*(id *)(a1 + 32) lastSequenceNumber];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void sub_100046144(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = 0;
  id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v11];

  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = [[ACXGizmoAppState alloc] initWithCoder:v7];
    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) appStates];
      [v10 setObject:v9 forKeyedSubscript:v5];
    }
    else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      MOLogWrite();
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_10004628C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 unsignedIntegerValue] == (id)6) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void sub_1000462F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v9 = [[ACXGizmoAppState alloc] initWithWatchBundleID:v6 companionBundleID:0];
  id v7 = [v5 unsignedIntegerValue];

  [(ACXGizmoAppState *)v9 setInstallStatus:v7];
  id v8 = [*(id *)(a1 + 32) appStates];
  [v8 setObject:v9 forKeyedSubscript:v6];
}

id sub_1000463A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
}

id sub_1000463B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUpPendingUpdateStateTimer");
}

void sub_10004662C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v5 encodeWithCoder:v6];
  id v7 = [v6 encodedData];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
}

void sub_100046764(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:1];
  [v6 encodeWithCoder:v3];
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 encodedData];
  [v4 addObject:v5];
}

void sub_100046A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046A34(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t sub_100046AE0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) npsDomain];
  [v2 setBool:*(unsigned __int8 *)(a1 + 40) forKey:@"NeedsReunionSync"];

  id v3 = [*(id *)(a1 + 32) npsDomain];
  uint64_t v7 = [v3 synchronize];

  uint64_t v5 = v7;
  if (v7)
  {
    uint64_t v4 = qword_1000A5608;
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      uint64_t v4 = MOLogWrite();
      uint64_t v5 = v7;
    }
  }

  return _objc_release_x1(v4, v5);
}

void sub_100046C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046CB0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  id v6 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v6;
  if (v6)
  {
    id v4 = [v6 installStatus];
    id v3 = v6;
  }
  else
  {
    id v4 = 0;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;

  return _objc_release_x1(v4, v3);
}

void sub_100046E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100046E78(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100046E88(uint64_t a1)
{
}

void sub_100046E90(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v3 = v7;
  if (v7)
  {
    uint64_t v4 = [v7 uniqueInstallID];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v7;
  }
}

void sub_100047044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004705C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) appStates];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = [v2 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10004715C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) appStates];
  [v1 enumerateKeysAndObjectsUsingBlock:&stru_10008DE80];
}

void sub_1000471A8(id a1, NSString *a2, ACXGizmoAppState *a3, BOOL *a4)
{
}

void sub_100047294(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    if ((id)[(ACXGizmoAppState *)v3 installStatus] == *(id *)(a1 + 56)) {
      goto LABEL_14;
    }
    -[ACXGizmoAppState setInstallStatus:](v3, "setInstallStatus:");
    if (*(void *)(a1 + 48)) {
      -[ACXGizmoAppState setCompanionAppBundleID:](v3, "setCompanionAppBundleID:");
    }
  }
  else
  {
    id v3 = [[ACXGizmoAppState alloc] initWithWatchBundleID:*(void *)(a1 + 40) companionBundleID:*(void *)(a1 + 48)];
    [(ACXGizmoAppState *)v3 setInstallStatus:*(void *)(a1 + 56)];
    uint64_t v4 = [*(id *)(a1 + 32) appStates];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState", v8, v10);
  if ([*(id *)(a1 + 32) gizmoIsActivePairedDevice])
  {
    id v5 = [*(id *)(a1 + 32) exportedAppStateForDeviceState:*(void *)(a1 + 56)];
    uint64_t v11 = *(void *)(a1 + 40);
    id v6 = +[NSNumber numberWithInteger:v5];
    uint64_t v12 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    +[ACXDeviceConnectionClient messageAllObserversWithInstallStateUpdate:v7];

    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      MOLogWrite();
    }
    notify_post((const char *)objc_msgSend(@"com.apple.sockpuppet.applications.updated", "UTF8String", v9));
  }
LABEL_14:
}

void sub_100047658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047670(uint64_t a1, void *a2, void *a3)
{
  id v27 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) appStates];
  id v7 = [v6 objectForKeyedSubscript:v27];

  if (v7) {
    id v8 = [v7 installStatus];
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = v5;
  if (*(void *)(a1 + 48))
  {
    id v10 = [v7 installStatus];
    uint64_t v11 = [v7 companionAppBundleID];
    uint64_t v12 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:v10 companionBundleID:v11];

    uint64_t v13 = [v7 watchKitAppExecutableHash];
    [v12 setWatchAppExecutableHash:v13];

    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = [v5 companionBundleID];
    uint64_t v9 = (*(void (**)(uint64_t, id, void *, void *, id))(v14 + 16))(v14, v27, v15, v12, v5);
  }
  id v16 = [v9 installStatus];
  if (v8 == v16)
  {
    uint64_t v17 = [v9 watchAppExecutableHash];
    uint64_t v18 = [v7 watchKitAppExecutableHash];
    if (v7 && sub_100009800(v17, v18))
    {
      [v7 setWatchKitAppExecutableHash:v17];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }

    goto LABEL_25;
  }
  uint64_t v19 = (uint64_t)v16;
  if (v16)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
      MOLogWrite();
    }
    if (v7)
    {
      [v7 setInstallStatus:v19];
      uint64_t v20 = [v9 watchAppExecutableHash];
      [v7 setWatchKitAppExecutableHash:v20];

      id v21 = [v9 companionBundleID];
      if (v21) {
        [v7 setCompanionAppBundleID:v21];
      }
    }
    else
    {
      long long v22 = [ACXGizmoAppState alloc];
      long long v23 = [v9 companionBundleID];
      id v21 = [(ACXGizmoAppState *)v22 initWithWatchBundleID:v27 companionBundleID:v23];

      [(ACXGizmoAppState *)v21 setInstallStatus:v19];
      long long v24 = [v9 watchAppExecutableHash];
      [(ACXGizmoAppState *)v21 setWatchKitAppExecutableHash:v24];

      long long v25 = [*(id *)(a1 + 32) appStates];
      [v25 setObject:v21 forKeyedSubscript:v27];
    }
  }
  else
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      id v26 = v27;
      MOLogWrite();
    }
    objc_msgSend(*(id *)(a1 + 32), "appStates", v26);
    id v21 = (ACXGizmoAppState *)objc_claimAutoreleasedReturnValue();
    [(ACXGizmoAppState *)v21 removeObjectForKey:v27];
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (!sub_1000134F8(v19))
  {
    uint64_t v17 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) exportedAppStateForDeviceState:v19]);
    [*(id *)(a1 + 40) setObject:v17 forKeyedSubscript:v27];
LABEL_25:
  }
}

void sub_100047B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100047B4C(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 48));
  if (result)
  {
    id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return result;
}

void sub_100047CA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100047CC0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 8);
  if (*(unsigned char *)(v2 + 8)) {
    *(unsigned char *)(v2 + 8) = 0;
  }
  uint64_t v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 32) appStates];
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  uint64_t v13 = sub_100047E04;
  uint64_t v14 = &unk_10008DEF8;
  id v16 = *(id *)(a1 + 40);
  id v6 = v4;
  id v15 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v11];

  id v10 = (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, v8, v9);
  objc_msgSend(v6, "addEntriesFromDictionary:", v10, v11, v12, v13, v14);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v6, 1, 0);
  if (v3 || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
  }
}

void sub_100047E04(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v5 installStatus];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v5 companionAppBundleID];
  uint64_t v9 = (*(uint64_t (**)(uint64_t, id, void *, id))(v7 + 16))(v7, v12, v8, v6);

  if (v6 != (id)v9)
  {
    id v10 = [v5 companionAppBundleID];
    uint64_t v11 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:v9 companionBundleID:v10];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v12];
  }
}

void sub_100047F80(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  int v3 = [*(id *)(a1 + 32) appStates];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004805C;
  v5[3] = &unk_10008DDF0;
  id v4 = v2;
  id v6 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v4, 1, 0))objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState"); {
}
  }

void sub_10004805C(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 installStatus] == (id)1)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
    {
      id v8 = v9;
      MOLogWrite();
    }
    id v6 = objc_msgSend(v5, "companionAppBundleID", v8);
    uint64_t v7 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:5 companionBundleID:v6];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v9];
  }
}

void sub_1000481D0(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  int v3 = [*(id *)(a1 + 32) appStates];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000482AC;
  v5[3] = &unk_10008DDF0;
  id v4 = v2;
  id v6 = v4;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];

  if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v4, 0, 0))objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState"); {
}
  }

void sub_1000482AC(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if ([v5 installStatus] == (id)2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v8 = v9;
      MOLogWrite();
    }
    id v6 = objc_msgSend(v5, "companionAppBundleID", v8);
    uint64_t v7 = +[ACXGizmoApplicationInstallStatusItem itemWithStatus:1 companionBundleID:v6];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v9];
  }
}

id sub_100048454(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];

  int v3 = *(void **)(a1 + 32);

  return objc_msgSend(v3, "_onQueue_saveState");
}

void sub_100048580(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100048620;
  v3[3] = &unk_10008DDF0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100048620(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (sub_1000134F8((uint64_t)[v5 installStatus]))
  {
    id v6 = [v5 copy];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }
}

void sub_100048A2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cleanUpPendingUpdateStateTimer];

  if (v2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_cleanUpExpiredPendingUpdateStates")) {
      objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
    }
    int v3 = [*(id *)(a1 + 32) pendingAppUpdateStates];
    id v4 = [v3 count];

    if (!v4)
    {
      id v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "_onQueue_cancelPendingUpdateStateTimer");
    }
  }
}

void sub_100048C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100048C50(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePendingForCompanionApp:", *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100048E38(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_setUpdatePendingForCompanionApp:", *(void *)(a1 + 40));
}

id sub_100049014(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_cancelUpdatePendingForCompanionApp:", *(void *)(a1 + 40));
}

void sub_1000493AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000493C4(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) appStates];
  uint64_t v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 watchKitAppExecutableHash];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100049518(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) appStates];
  uint64_t v3 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v3 setWatchKitAppExecutableHash:v2];
}

void sub_10004967C(uint64_t a1)
{
  uint64_t v2 = qword_1000A5608;
  if ((!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    && (![*(id *)(a1 + 32) alwaysInstallApps] ? (uint64_t v3 = "No") : (uint64_t v3 = "Yes"),
        id v5 = v3,
        MOLogWrite(),
        (uint64_t v2 = qword_1000A5608) == 0)
    || *(int *)(v2 + 44) >= 5)
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
      id v4 = "Yes";
    }
    else {
      id v4 = "No";
    }
    id v5 = v4;
    MOLogWrite();
  }
  objc_msgSend(*(id *)(a1 + 32), "appStates", v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 enumerateKeysAndObjectsUsingBlock:&stru_10008DF40];
}

void sub_100049784(id a1, NSString *a2, ACXGizmoAppState *a3, BOOL *a4)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [(ACXGizmoAppState *)v5 installStatus];
    MOLogWrite();
  }
}

void sub_1000498FC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appStates];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10004999C;
  v3[3] = &unk_10008DDF0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_10004999C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 installStatus] == (id)2) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void sub_10004AAE4(uint64_t a1)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  unsigned int v2 = [*(id *)(a1 + 32) gizmoIsActivePairedDevice];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004AD44;
  v15[3] = &unk_10008DF68;
  void v15[4] = v3;
  v15[5] = &v16;
  unsigned int v5 = objc_msgSend(v3, "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v4, 0, v15);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004AE8C;
  v14[3] = &unk_10008DF90;
  v14[4] = v6;
  unsigned int v8 = objc_msgSend(v6, "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v7, 0, v14);
  unsigned int v9 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", *(void *)(a1 + 56), 0, 0);
  if (*((unsigned char *)v17 + 24))
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  else if ((v9 | v8 | v5) != 1)
  {
    goto LABEL_7;
  }
  if ((v2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
LABEL_7:
  if (v2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
  }
  if (*(void *)(a1 + 64))
  {
    qos_class_t v10 = qos_class_self();
    uint64_t v11 = dispatch_get_global_queue(v10, 0);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_10004AFCC;
    v12[3] = &unk_10008D108;
    id v13 = *(id *)(a1 + 64);
    sub_100006BB8(v11, v12);
  }
  _Block_object_dispose(&v16, 8);
}

void sub_10004AD24(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_10004AD44(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 installStatus];
  id v12 = [v9 installStatus];
  unsigned __int8 v13 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_pendingInstallStateShouldBeIgnoredForApp:existingState:newState:", v8, v9, v10);
  uint64_t v14 = v9;
  if ((v13 & 1) == 0)
  {
    if (v12 && v11 == (id)5)
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_12;
    }
    uint64_t v14 = v10;
    if (v12 == (id)5)
    {
      if (!qword_1000A5608 || (uint64_t v14 = v9, *(int *)(qword_1000A5608 + 44) >= 5))
      {
        MOLogWrite();
LABEL_12:
        uint64_t v14 = v9;
      }
    }
  }
  id v15 = v14;

  return v15;
}

id sub_10004AE8C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v12 installStatus];
  id v14 = [v11 installStatus];
  unsigned __int8 v15 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_pendingInstallStateShouldBeIgnoredForApp:existingState:newState:", v9, v11, v12);
  uint64_t v16 = v11;
  if ((v15 & 1) == 0)
  {
    uint64_t v16 = v12;
    if (v13 == (id)1)
    {
      uint64_t v16 = v12;
      if (v14 != (id)2)
      {
        if (objc_msgSend(*(id *)(a1 + 32), "_onQueue_updatePendingForCompanionApp:", v10))
        {
          objc_msgSend(*(id *)(a1 + 32), "_onQueue_cancelUpdatePendingForCompanionApp:", v10);
          uint64_t v16 = v12;
        }
        else if (!qword_1000A5608 || (uint64_t v16 = v11, *(int *)(qword_1000A5608 + 44) >= 5))
        {
          MOLogWrite();
          uint64_t v16 = v11;
        }
      }
    }
  }
  id v17 = v16;

  return v17;
}

uint64_t sub_10004AFCC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004B6B4(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_10004B80C;
  v8[3] = &unk_10008DF90;
  void v8[4] = v2;
  if (objc_msgSend(v2, "_onQueue_setInstallStatusForApps:sendNotification:withUpdatePredicate:", v3, 0, v8))objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState"); {
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  }
    MOLogWrite();
  notify_post((const char *)[@"com.apple.sockpuppet.applications.updated" UTF8String]);
  qos_class_t v4 = qos_class_self();
  unsigned int v5 = dispatch_get_global_queue(v4, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10004B924;
  v6[3] = &unk_10008D108;
  id v7 = *(id *)(a1 + 48);
  sub_100006BB8(v5, v6);
}

id sub_10004B80C(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = (unint64_t)[v9 installStatus];
  id v12 = [v10 installStatus];
  unsigned __int8 v13 = objc_msgSend(*(id *)(a1 + 32), "_onQueue_pendingInstallStateShouldBeIgnoredForApp:existingState:newState:", v8, v9, v10);
  id v14 = v9;
  if ((v13 & 1) == 0)
  {
    id v14 = v10;
    if (v12 == (id)5)
    {
      id v14 = v10;
      if (v11 <= 4)
      {
        id v14 = v10;
        if (((1 << v11) & 0x16) != 0)
        {
          if (!qword_1000A5608 || (id v14 = v9, *(int *)(qword_1000A5608 + 44) >= 5))
          {
            MOLogWrite();
            id v14 = v9;
          }
        }
      }
    }
  }
  id v15 = v14;

  return v15;
}

uint64_t sub_10004B924(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10004BCA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004BCC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  id v22 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v22;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    objc_opt_class();
    id v8 = v6;
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    if (v9)
    {
      id v10 = [v8 objectForKeyedSubscript:@"s"];
      objc_opt_class();
      id v11 = v10;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
      {
        id v18 = v22;
        id v20 = v12;
        MOLogWrite();
      }
      unint64_t v13 = (unint64_t)objc_msgSend(v12, "integerValue", v18, v20);
      if (v13 - 1 > 1)
      {
        if ((v13 & 0xFFFFFFFFFFFFFFFELL) != 4)
        {
LABEL_32:
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

          goto LABEL_33;
        }
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v19 = v22;
          uint64_t v21 = 5;
          MOLogWrite();
        }
        id v14 = [[ACXGizmoAppState alloc] initWithWatchBundleID:v22 companionBundleID:0];
        id v15 = v14;
        uint64_t v16 = 5;
      }
      else
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          id v19 = v22;
          uint64_t v21 = 2;
          MOLogWrite();
        }
        id v14 = [[ACXGizmoAppState alloc] initWithWatchBundleID:v22 companionBundleID:0];
        id v15 = v14;
        uint64_t v16 = 2;
      }
      -[ACXGizmoAppState setInstallStatus:](v14, "setInstallStatus:", v16, v19, v21);
      id v17 = [*(id *)(a1 + 32) appStates];
      [v17 setObject:v15 forKeyedSubscript:v22];

      goto LABEL_32;
    }
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
LABEL_16:
    }
      MOLogWrite();
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    goto LABEL_16;
  }
LABEL_33:
}

id sub_10004BFC8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onQueue_saveState");
}

void sub_10004CA74(void *a1, void *a2)
{
  id v3 = a1;
  id v23 = a2;
  qos_class_t v4 = [v3 message];
  id v5 = objc_opt_new();
  uint64_t v28 = 0;
  id v6 = [v4 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v7 = v6;
  id v8 = 0;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }

  if (v8 && (objc_opt_class(), (sub_1000070BC(v8) & 1) != 0))
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v21 = [v8 count];
      MOLogWrite();
    }
    id v9 = +[ACXLaunchServicesWatcher sharedWatcher];
    id v26 = 0;
    id v27 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10004CE74;
    void v24[3] = &unk_10008E008;
    id v22 = v5;
    id v10 = v5;
    id v25 = v10;
    unsigned int v11 = [v9 enumerateApplicationsForBundleIDs:v8 currentDBUUID:&v27 currentLastSequenceNumber:&v28 error:&v26 enumerator:v24];
    id v12 = v27;
    id v13 = v26;

    uint64_t v14 = v11 ^ 1;
    if (v13)
    {
      id v15 = [v13 domain];
      unsigned int v16 = [v15 isEqualToString:@"ACXErrorDomain"];

      if (v16) {
        uint64_t v14 = (uint64_t)[v13 code];
      }
    }
    id v5 = v22;
    if (!v14)
    {
      v29[0] = @"T";
      v29[1] = @"IL";
      v30[0] = &off_100097888;
      v30[1] = v10;
      v29[2] = @"DBU";
      id v17 = [v12 UUIDString];
      v30[2] = v17;
      v29[3] = @"DBS";
      id v18 = +[NSNumber numberWithUnsignedInteger:v28];
      v30[3] = v18;
      id v19 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];

      goto LABEL_20;
    }
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v12 = 0;
    id v13 = 0;
    uint64_t v14 = 20;
  }
  v31[0] = @"T";
  v31[1] = @"E";
  v32[0] = &off_100097888;
  id v20 = +[NSNumber numberWithInteger:v14];
  v32[1] = v20;
  id v19 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v21 = v19;
    MOLogWrite();
  }
LABEL_20:
  objc_msgSend(v23, "sendResponse:toMessage:withPriority:timeout:logDescription:", v19, v3, 200, @"app info reply", 120.0, v21);
}

void sub_10004CE74(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    id v6 = [v3 bundleIdentifier];
    MOLogWrite();

    id v3 = v7;
  }
  qos_class_t v4 = *(void **)(a1 + 32);
  id v5 = objc_msgSend(v3, "serializeAsRemoteApplication", v6);
  [v4 addObject:v5];
}

void sub_10004CF34(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_opt_new();
  uint64_t v18 = 0;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v6 = +[ACXLaunchServicesWatcher sharedWatcher];
  id v16 = v5;
  id v17 = 0;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_10004D154;
  id v15 = &unk_10008E030;
  id v7 = v5;
  [v6 enumerateApplicationEventsReturningDBUUID:&v17 startingSequenceNumber:&v18 withBlock:&v12];
  id v8 = v17;

  v19[0] = @"T";
  v19[1] = @"AE";
  v20[0] = &off_1000978A0;
  v20[1] = v7;
  void v19[2] = @"DBU";
  id v9 = objc_msgSend(v8, "UUIDString", v12, v13, v14, v15);
  void v20[2] = v9;
  v19[3] = @"DBS";
  id v10 = +[NSNumber numberWithUnsignedInteger:v18];
  v20[3] = v10;
  unsigned int v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];

  [v3 sendResponse:v11 toMessage:v4 withPriority:200 timeout:@"app event reply" logDescription:120.0];
}

void sub_10004D154(uint64_t a1, void *a2)
{
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = [a2 dictionaryRepresentation];
  [v2 addObject:v3];
}

void sub_10004D1AC(void *a1)
{
  id v9 = [a1 message];
  uint64_t v1 = [v9 objectForKeyedSubscript:@"DBU"];
  objc_opt_class();
  id v2 = v1;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (v3) {
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:v3];
  }
  else {
    id v4 = 0;
  }
  id v5 = [v9 objectForKeyedSubscript:@"DBS"];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v4 && v7)
  {
    id v8 = +[ACXLaunchServicesWatcher sharedWatcher];
    objc_msgSend(v8, "clearApplicationEventsForDBUUID:endingSequenceNumber:error:", v4, objc_msgSend(v7, "unsignedIntegerValue"), 0);
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_10004D348(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v12 = 0;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  id v5 = +[ACXLaunchServicesWatcher sharedWatcher];
  id v11 = 0;
  id v6 = [v5 allInstalledBundleIDsInDatabaseWithUUID:&v11 lastSequenceNumber:&v12];
  id v7 = v11;

  v13[0] = @"T";
  v13[1] = @"BL";
  v14[0] = &off_1000978B8;
  v14[1] = v6;
  void v13[2] = @"DBU";
  id v8 = [v7 UUIDString];
  v14[2] = v8;
  v13[3] = @"DBS";
  id v9 = +[NSNumber numberWithUnsignedInteger:v12];
  v14[3] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];

  [v4 sendResponse:v10 toMessage:v3 withPriority:200 timeout:@"bundle ID list reply" logDescription:120.0];
}

void sub_10004D500(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 message];
  id v9 = 0;
  uint64_t v10 = 0;
  id v8 = 0;
  int v5 = sub_10004D5AC(v4, &v9, &v8, &v10);
  id v6 = v9;
  id v7 = v8;
  if (v5) {
    [v3 appsAdded:v6 currentRemoteDBUUID:v7 lastSequenceNumber:v10];
  }
}

uint64_t sub_10004D5AC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = [v7 objectForKeyedSubscript:@"IL"];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  id v11 = [v7 objectForKeyedSubscript:@"DBU"];
  objc_opt_class();
  id v12 = v11;
  if (objc_opt_isKindOfClass()) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  uint64_t v14 = [v7 objectForKeyedSubscript:@"DBS"];
  objc_opt_class();
  id v15 = v14;
  if (objc_opt_isKindOfClass()) {
    id v16 = v15;
  }
  else {
    id v16 = 0;
  }

  id v17 = objc_opt_new();
  if (v10) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = a2 == 0;
  }
  if (!v18 || !v13 || !v16)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (a2)
  {
    id v29 = v16;
    id v30 = a2;
    id v31 = a4;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = v10;
    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v21; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = [objc_alloc((Class)ACXRemoteApplication) initWithSerializedDictionary:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v24)
          {
            [v17 addObject:v24];
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            MOLogWrite();
          }
        }
        id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v21);
    }

    *id v30 = [v17 copy];
    a4 = v31;
    id v16 = v29;
  }
  id v25 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
  if (!v25)
  {
    if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) < 3) {
      goto LABEL_39;
    }
LABEL_38:
    MOLogWrite();
LABEL_39:
    uint64_t v27 = 0;
    goto LABEL_40;
  }
  id v26 = v25;
  *a3 = v26;
  *a4 = [v16 unsignedIntegerValue];

  uint64_t v27 = 1;
LABEL_40:

  return v27;
}

void sub_10004D930(void *a1, void *a2)
{
  id v9 = a2;
  id v3 = [a1 message];
  id v4 = [v3 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6 && (objc_opt_class(), (sub_1000070BC(v6) & 1) != 0))
  {
    id v10 = 0;
    uint64_t v11 = 0;
    int v7 = sub_10004D5AC(v3, 0, &v10, &v11);
    id v8 = v10;
    if (v7) {
      [v9 appsRemoved:v6 currentRemoteDBUUID:v8 lastSequenceNumber:v11];
    }
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_10004DA84(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  id v13 = a1;
  dispatch_assert_queue_V2(v12);
  id v14 = [v13 allObjects];

  sub_10004DB4C(v14, v12, v11, v10, v9, 0);
}

void sub_10004DB4C(void *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v29[0] = @"T";
  v29[1] = @"BL";
  v30[0] = &off_1000978E8;
  v30[1] = v11;
  id v16 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10004E1F4;
  void v22[3] = &unk_10008E080;
  id v23 = v14;
  id v24 = v12;
  id v25 = v11;
  id v26 = v13;
  id v27 = v15;
  uint64_t v28 = a6;
  id v17 = v15;
  id v18 = v13;
  id v19 = v11;
  id v20 = v12;
  id v21 = v14;
  [v18 sendMessage:v16 toDevice:v21 withPriority:200 timeout:@"fetch app info" logDescription:v22 handleReply:120.0];
}

void sub_10004DD10(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  dispatch_assert_queue_V2(v10);
  sub_10004DDA4(v10, v9, v8, v7, 0);
}

void sub_10004DDA4(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  dispatch_assert_queue_V2(v9);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004E638;
  v17[3] = &unk_10008E0D0;
  id v21 = v12;
  uint64_t v22 = a5;
  id v18 = v11;
  id v19 = v9;
  id v20 = v10;
  id v13 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  [v14 sendMessage:&off_100097B20 toDevice:v16 withPriority:200 timeout:@"fetch bundle ID list" logDescription:v17 handleReply:120.0];
}

void sub_10004DEDC(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id v10 = a1;
  dispatch_assert_queue_V2(v10);
  sub_10004DF70(v10, v9, v8, v7, 0);
}

void sub_10004DF70(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  dispatch_assert_queue_V2(v9);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004EB18;
  v17[3] = &unk_10008E0D0;
  id v21 = v12;
  uint64_t v22 = a5;
  id v18 = v11;
  id v19 = v9;
  id v20 = v10;
  id v13 = v12;
  id v14 = v10;
  id v15 = v9;
  id v16 = v11;
  [v14 sendMessage:&off_100097B48 toDevice:v16 withPriority:200 timeout:@"fetch app events" logDescription:v17 handleReply:120.0];
}

void sub_10004E0A8(void *a1, uint64_t a2, NSObject *a3, void *a4, void *a5)
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a1;
  dispatch_assert_queue_V2(a3);
  v16[0] = &off_1000978D0;
  v15[0] = @"T";
  v15[1] = @"DBU";
  id v12 = [v11 UUIDString];

  v16[1] = v12;
  v15[2] = @"DBS";
  id v13 = +[NSNumber numberWithUnsignedInteger:a2];
  v16[2] = v13;
  id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  [v10 sendMessage:v14 toDevice:v9 withPriority:200 timeout:@"ack app events" logDescription:0 handleReply:120.0];
}

void sub_10004E1F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v14 = [v5 message];
    id v15 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004E4A4;
    v17[3] = &unk_10008CC28;
    id v18 = v14;
    id v19 = *(id *)(a1 + 64);
    id v12 = v14;
    sub_100006BB8(v15, v17);

    id v13 = v18;
LABEL_11:

    goto LABEL_15;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v16 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    MOLogWrite();
  }
  if (*(void *)(a1 + 72) <= 9uLL)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v7 = (void *)os_transaction_create();
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E488;
    block[3] = &unk_10008E058;
    id v9 = *(NSObject **)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 40);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 64);
    uint64_t v11 = *(void *)(a1 + 72);
    id v26 = v7;
    uint64_t v27 = v11;
    id v25 = v10;
    id v12 = v7;
    dispatch_after(v8, v9, block);

    id v13 = v21;
    goto LABEL_11;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
LABEL_15:
}

uint64_t sub_10004E488(void *a1)
{
  return sub_10004DB4C(a1[4], a1[5], a1[6], a1[7], a1[8], a1[10] + 1);
}

void sub_10004E4A4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  id v3 = v1;
  id v4 = [v2 objectForKeyedSubscript:@"E"];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
    {
      [v6 unsignedLongValue];
      MOLogWrite();
    }
  }
  else
  {
    id v12 = 0;
    id v13 = 0;
    char v7 = sub_10004D5AC(v2, &v13, &v12, &v14);
    id v8 = v13;
    id v10 = v12;
    if (v7)
    {
      [v3 updateAppInfoWithRecords:v8 currentRemoteDBUUID:v10];
    }
    else
    {
      uint64_t v11 = sub_100007710((uint64_t)"_ProcessBundleIDInfoMessage", 242, @"ACXErrorDomain", 1, 0, 0, @"Failed to extract app list from message %@, attempting to retry Remote App List sync...", v9, (uint64_t)v2);
      [v3 reportTotalSyncFailureForError:v11];
    }
  }
}

void sub_10004E638(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v14 = [v5 message];
    id v15 = *(void **)(a1 + 40);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004E8D4;
    v17[3] = &unk_10008CC28;
    id v18 = v14;
    id v19 = *(id *)(a1 + 56);
    id v12 = v14;
    sub_100006BB8(v15, v17);

    dispatch_queue_t v13 = v18;
LABEL_11:

    goto LABEL_15;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v16 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    MOLogWrite();
  }
  if (*(void *)(a1 + 64) <= 9uLL)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    char v7 = (void *)os_transaction_create();
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    uint64_t v9 = *(void **)(a1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004E8BC;
    block[3] = &unk_10008E0A8;
    dispatch_queue_t v21 = v9;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v25 = v7;
    uint64_t v26 = v11;
    id v24 = v10;
    id v12 = v7;
    dispatch_after(v8, v21, block);

    dispatch_queue_t v13 = v21;
    goto LABEL_11;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
LABEL_15:
}

uint64_t sub_10004E8BC(void *a1)
{
  return sub_10004DDA4(a1[4], a1[5], a1[6], a1[7], a1[9] + 1);
}

void sub_10004E8D4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v2 = v1;
  id v3 = [v15 objectForKeyedSubscript:@"BL"];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  id v6 = [v15 objectForKeyedSubscript:@"DBU"];
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:v8];
  }
  else {
    id v9 = 0;
  }
  id v10 = [v15 objectForKeyedSubscript:@"DBS"];
  objc_opt_class();
  id v11 = v10;
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v5 && v9 && v12 && (objc_opt_class(), (sub_1000070BC(v5) & 1) != 0))
  {
    uint64_t v14 = +[NSSet setWithArray:v5];
    objc_msgSend(v2, "updateBundleIDList:currentRemoteDBUUID:lastSequenceNumber:", v14, v9, objc_msgSend(v12, "unsignedIntegerValue"));
  }
  else
  {
    uint64_t v14 = sub_100007710((uint64_t)"_ProcessBundleIDListMessage", 298, @"ACXErrorDomain", 1, 0, 0, @"Not all required information was present in bundle ID list response: %@", v13, (uint64_t)v15);
    [v2 reportTotalSyncFailureForError:v14];
  }
}

void sub_10004EB18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    [v5 message];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10004EDC4;
    id v17 = v16[3] = &unk_10008CA40;
    uint64_t v14 = *(void **)(a1 + 40);
    id v18 = v14;
    id v19 = *(id *)(a1 + 56);
    id v12 = v17;
    sub_100006BB8(v14, v16);

    dispatch_queue_t v13 = v17;
LABEL_11:

    goto LABEL_15;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v15 = [*(id *)(a1 + 32) idsDeviceIdentifier];
    MOLogWrite();
  }
  if (*(void *)(a1 + 64) <= 9uLL)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
      MOLogWrite();
    }
    id v7 = (void *)os_transaction_create();
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    id v9 = *(void **)(a1 + 40);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EDAC;
    block[3] = &unk_10008E0A8;
    dispatch_queue_t v21 = v9;
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 32);
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    id v25 = v7;
    uint64_t v26 = v11;
    id v24 = v10;
    id v12 = v7;
    dispatch_after(v8, v21, block);

    dispatch_queue_t v13 = v21;
    goto LABEL_11;
  }
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
    MOLogWrite();
  }
LABEL_15:
}

uint64_t sub_10004EDAC(void *a1)
{
  return sub_10004DF70(a1[4], a1[5], a1[6], a1[7], a1[9] + 1);
}

void sub_10004EDC4(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  id v4 = v2;
  dispatch_assert_queue_V2(v1);
  id v5 = [v3 objectForKeyedSubscript:@"AE"];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  dispatch_time_t v8 = [v3 objectForKeyedSubscript:@"DBU"];
  objc_opt_class();
  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10) {
    id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:v10];
  }
  else {
    id v11 = 0;
  }
  id v12 = [v3 objectForKeyedSubscript:@"DBS"];
  objc_opt_class();
  id v13 = v12;
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  if (v7 && v11 && v14)
  {
    id v28 = v11;
    id v30 = v4;
    id v31 = v3;
    id v16 = objc_opt_new();
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v7;
    id v17 = v7;
    id v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          objc_opt_class();
          id v23 = v22;
          if (objc_opt_isKindOfClass()) {
            id v24 = v23;
          }
          else {
            id v24 = 0;
          }

          if (v24)
          {
            id v25 = [[ACXAppEventRecord alloc] initWithDictionaryRepresentation:v23];
            if (v25)
            {
              [v16 addObject:v25];
            }
            else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
            {
              MOLogWrite();
            }
          }
          else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
          {
            MOLogWrite();
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    id v26 = [v16 copy];
    id v4 = v30;
    id v11 = v28;
    objc_msgSend(v30, "reportAppEvents:forDBUUID:startingSequenceNumber:", v26, v28, objc_msgSend(v14, "unsignedIntegerValue"));

    id v3 = v31;
    id v7 = v29;
  }
  else
  {
    uint64_t v27 = sub_100007710((uint64_t)"_ProcessAppEventMessage", 354, @"ACXErrorDomain", 1, 0, 0, @"Not all required information was present in event message response: %@", v15, (uint64_t)v3);
    [v4 reportTotalSyncFailureForError:v27];
  }
}

uint64_t sub_100050058()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v1 = qword_1000A55D8;
  qword_1000A55D8 = (uint64_t)v0;

  return _objc_release_x1(v0, v1);
}

id sub_10005030C(id *a1)
{
  id v2 = [a1[4] syncSessionType];
  if (v2)
  {
    if (v2 != (id)1)
    {
      if (v2 != (id)2)
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
        {
          [a1[4] syncSessionType];
          [a1[4] syncSessionType];
          id v9 = NSStringfromPSYSyncSessionType();
          MOLogWrite();
        }
        goto LABEL_28;
      }
      [a1[5] regenerateAllUniqueInstallIDs];
    }
    [a1[5] setNeedsReunionSync:1];
LABEL_28:
    id v7 = a1[7];
    return objc_msgSend(v7, "_onQueue_triggerSyncSessionCompleteAndRemoveObserver");
  }
  id v3 = [a1[6] remoteAppList];
  if (v3)
  {
    [a1[7] setRemoteAppList:v3];
    id v4 = a1[7];
    id v5 = [v4 queue];
    [v3 addObserver:v4 queue:v5];

    char v6 = [v3 startDatabaseSyncIfNeeded] ^ 1;
  }
  else
  {
    char v6 = 1;
  }
  if ([a1[5] hasCompletedInitialPairedSync])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [a1[5] dumpCurrentStateToLog];
    [a1[5] markInstalledAsPending];
    [a1[5] regenerateAllUniqueInstallIDs];
  }
  else
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    [a1[5] dumpCurrentStateToLog];
    if ([a1[5] initiallyInstallAllApps])
    {
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
        MOLogWrite();
      }
      [a1[6] installAllApplications];
    }
    else
    {
      [a1[6] markAllApplicationsAsRemoved];
    }
    [a1[5] initialPairedSyncComplete];
  }

  if (v6) {
    goto LABEL_28;
  }
  id result = (id)qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    return (id)MOLogWrite();
  }
  return result;
}

void sub_100050910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100050928(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) list];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    char v4 = 0;
  }
  else
  {
    id v5 = +[NSDate date];
    char v6 = [*(id *)(a1 + 32) list];
    [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    id v7 = [*(id *)(a1 + 32) list];
    id v8 = [v7 count];

    if (v8 == (id)1)
    {
      [*(id *)(a1 + 32) sweepTimer];
      if (objc_claimAutoreleasedReturnValue()) {
        sub_10005BE1C();
      }
      id v9 = [*(id *)(a1 + 32) queue];
      id v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v9);

      [*(id *)(a1 + 32) timeoutInSeconds];
      dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
      [*(id *)(a1 + 32) timeoutInSeconds];
      dispatch_source_set_timer(v10, v12, (unint64_t)(v13 * 1000000000.0), 0x3B9ACA00uLL);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100050B0C;
      handler[3] = &unk_10008CD30;
      void handler[4] = *(void *)(a1 + 32);
      dispatch_source_set_event_handler(v10, handler);
      [*(id *)(a1 + 32) setSweepTimer:v10];
      id v14 = [*(id *)(a1 + 32) sweepTimer];
      dispatch_resume(v14);
    }
    char v4 = 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
}

void sub_100050B0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sweepTimer];
  if (!v2) {
    sub_10005BE48();
  }

  id v3 = objc_opt_new();
  char v4 = +[NSDate date];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = objc_msgSend(*(id *)(a1 + 32), "list", 0);
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v9);
        double v11 = [*(id *)(a1 + 32) list];
        dispatch_time_t v12 = [v11 objectForKeyedSubscript:v10];

        [v4 timeIntervalSinceDate:v12];
        double v14 = v13;
        [*(id *)(a1 + 32) timeoutInSeconds];
        if (v14 >= v15) {
          [v3 addObject:v10];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);
  }

  id v16 = [*(id *)(a1 + 32) list];
  [v16 removeObjectsForKeys:v3];

  id v17 = [*(id *)(a1 + 32) timeoutHandler];

  if (v17)
  {
    id v18 = [*(id *)(a1 + 32) timeoutHandler];
    ((void (**)(void, void *))v18)[2](v18, v3);
  }
  id v19 = [*(id *)(a1 + 32) list];
  id v20 = [v19 count];

  if (!v20)
  {
    dispatch_queue_t v21 = [*(id *)(a1 + 32) sweepTimer];
    dispatch_source_cancel(v21);

    [*(id *)(a1 + 32) setSweepTimer:0];
  }
}

void sub_100050DFC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) list];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v5 = +[NSDate date];
    char v4 = [*(id *)(a1 + 32) list];
    [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_100050F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100050FB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) list];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    char v4 = [*(id *)(a1 + 32) list];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    id v5 = [*(id *)(a1 + 32) list];
    id v6 = [v5 count];

    if (!v6)
    {
      id v7 = [*(id *)(a1 + 32) sweepTimer];
      if (!v7) {
        sub_10005BE74();
      }

      uint64_t v8 = [*(id *)(a1 + 32) sweepTimer];
      dispatch_source_cancel(v8);

      [*(id *)(a1 + 32) setSweepTimer:0];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100051178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051190(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) list];
  id v2 = [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

id sub_100051298(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = [v5 domain];
  if ([v7 isEqualToString:@"ACXErrorDomain"])
  {
    id v8 = [v5 code];

    if (v8 == (id)13)
    {
      uint64_t v9 = 3;
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v10 = [v5 domain];
  if ([v10 isEqualToString:@"ACXErrorDomain"])
  {
    id v11 = [v5 code];

    if (v11 == (id)12) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  dispatch_time_t v12 = [v5 domain];
  if ([v12 isEqualToString:IXUserPresentableErrorDomain])
  {
    id v13 = [v5 code];

    if (v13 == (id)11)
    {
LABEL_11:
      uint64_t v9 = 2;
      goto LABEL_22;
    }
  }
  else
  {
  }
  double v14 = [v5 domain];
  if ([v14 isEqualToString:@"ACXErrorDomain"])
  {
    id v15 = [v5 code];

    if (v15 == (id)29)
    {
      uint64_t v9 = 4;
      goto LABEL_22;
    }
  }
  else
  {
  }
  id v16 = [v5 domain];
  if ([v16 isEqualToString:@"ACXErrorDomain"])
  {
    id v17 = [v5 code];

    if (v17 == (id)31)
    {
      uint64_t v9 = 5;
      goto LABEL_22;
    }
  }
  else
  {
  }
  uint64_t v9 = 9;
LABEL_22:
  id v18 = sub_100051464(v9, v5, v6, a3);

  return v18;
}

id sub_100051464(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = v8;
  switch(a1)
  {
    case 0:
    case 13:
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3) {
        MOLogWrite();
      }
      id v10 = 0;
      id v11 = 0;
      dispatch_time_t v12 = 0;
      goto LABEL_39;
    case 1:
      id v58 = 0;
      id v59 = 0;
      sub_100008360(v8, &v59, &v58);
      id v10 = v59;
      id v13 = v58;
      goto LABEL_33;
    case 2:
      uint64_t v56 = 0;
      id v57 = 0;
      sub_10000877C(v8, &v57, &v56);
      id v10 = v57;
      id v13 = v56;
      goto LABEL_33;
    case 3:
      id v55 = 0;
      id v54 = 0;
      sub_1000088FC(&v55, &v54);
      id v10 = v55;
      id v13 = v54;
      goto LABEL_33;
    case 4:
      id v52 = 0;
      id v53 = 0;
      sub_100008958(v8, &v53, &v52);
      id v10 = v53;
      id v13 = v52;
      goto LABEL_33;
    case 5:
      uint64_t v50 = 0;
      id v51 = 0;
      sub_100008AD8(v8, &v51, &v50);
      id v10 = v51;
      id v13 = v50;
      goto LABEL_33;
    case 6:
      long long v48 = 0;
      id v49 = 0;
      sub_100008C58(v8, &v49, &v48);
      id v10 = v49;
      id v13 = v48;
      goto LABEL_33;
    case 7:
      long long v46 = 0;
      id v47 = 0;
      sub_100008DD8(v8, &v47, &v46);
      id v10 = v47;
      id v13 = v46;
      goto LABEL_33;
    case 8:
      if (a4 == (void *)2)
      {
        long long v42 = 0;
        id v43 = 0;
        sub_1000090E8(v8, &v43, &v42);
        id v10 = v43;
        id v13 = v42;
      }
      else if (a4 == (void *)1)
      {
        long long v44 = 0;
        id v45 = 0;
        sub_100008F58(v8, &v45, &v44);
        id v10 = v45;
        id v13 = v44;
      }
      else
      {
        if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
        {
          id v32 = a4;
          uint64_t v33 = 8;
          MOLogWrite();
        }
        char v40 = 0;
        id v41 = 0;
        sub_1000091D0(&v41, &v40);
        id v10 = v41;
        id v13 = v40;
      }
      goto LABEL_33;
    case 10:
      uint64_t v38 = 0;
      id v39 = 0;
      sub_100009224(v8, &v39, &v38);
      id v10 = v39;
      id v13 = v38;
      goto LABEL_33;
    case 11:
      uint64_t v36 = 0;
      id v37 = 0;
      sub_1000093A4(v8, &v37, &v36);
      id v10 = v37;
      id v13 = v36;
      goto LABEL_33;
    case 12:
      long long v34 = 0;
      id v35 = 0;
      sub_100009524(v8, &v35, &v34);
      id v10 = v35;
      id v13 = v34;
LABEL_33:
      id v11 = v13;
      goto LABEL_34;
    default:
      double v14 = [v7 domain];
      unsigned int v15 = [v14 isEqualToString:IXUserPresentableErrorDomain];

      if (v15)
      {
        id v16 = v7;
        id v17 = [v16 userInfo];
        id v10 = [v17 objectForKeyedSubscript:NSLocalizedDescriptionKey];

        id v18 = [v16 userInfo];
        id v11 = [v18 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];
      }
      else
      {
        id v19 = [v7 domain];
        unsigned int v20 = [v19 isEqualToString:ASDUserPresentableErrorDomain];

        if (!v20)
        {
          id v10 = 0;
          id v16 = 0;
          id v11 = 0;
          goto LABEL_43;
        }
        [v7 code];
        uint64_t v62 = ASDOptionsKeyAppName;
        uint64_t v63 = v9;
        dispatch_queue_t v21 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        long long v22 = ASDLocalizedTextForUserPresentableError();

        id v10 = [v22 objectForKeyedSubscript:ASDLocalizedTitleKey];
        id v11 = [v22 objectForKeyedSubscript:ASDLocalizedMessageKey];

        id v16 = 0;
      }
      if (v10) {
        BOOL v23 = v11 == 0;
      }
      else {
        BOOL v23 = 1;
      }
      if (!v23) {
        goto LABEL_47;
      }
LABEL_43:
      if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
      {
        id v32 = v7;
        MOLogWrite();
      }
      uint64_t v27 = IXCreateUserPresentableError();

      id v28 = [v27 userInfo];
      uint64_t v29 = [v28 objectForKeyedSubscript:NSLocalizedDescriptionKey];

      id v30 = [v27 userInfo];
      uint64_t v31 = [v30 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey];

      id v11 = (id)v31;
      id v16 = v27;
      id v10 = (id)v29;
LABEL_47:

LABEL_34:
      dispatch_time_t v12 = 0;
      if (v10 && v11)
      {
        v60[0] = NSLocalizedFailureReasonErrorKey;
        v60[1] = NSLocalizedDescriptionKey;
        v61[0] = v10;
        v61[1] = v11;
        long long v24 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
        long long v25 = +[NSMutableDictionary dictionaryWithDictionary:v24];

        if (v7) {
          [v25 setObject:v7 forKeyedSubscript:NSUnderlyingErrorKey];
        }
        dispatch_time_t v12 = +[NSError errorWithDomain:@"ACXUserPresentableErrorDomain", a1, v25, v32, v33 code userInfo];
      }
LABEL_39:

      return v12;
  }
}

BOOL sub_100051AF8(void *a1)
{
  id v1 = a1;
  id v2 = +[MCProfileConnection sharedConnection];
  unsigned int v3 = [v2 effectiveBoolValueForWatchSetting:MCFeatureAppInstallationAllowed pairedDevice:v1];

  return v3 == 2;
}

void sub_100051DA0(id a1)
{
  uint64_t v1 = +[NSHashTable weakObjectsHashTable];
  id v2 = (void *)qword_1000A55E8;
  qword_1000A55E8 = v1;

  unsigned int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.appconduitd.DeviceConnectionClient.delegates", v3);
  id v5 = (void *)qword_1000A55F0;
  qword_1000A55F0 = (uint64_t)v4;

  id v8 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.appconduitd.device-connection"];
  uint64_t v6 = objc_opt_new();
  id v7 = (void *)qword_1000A55F8;
  qword_1000A55F8 = v6;

  [v8 setDelegate:qword_1000A55F8];
  [v8 resume];
}

void sub_100051F14(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "xpcConnection", v10);
        id v8 = v7;
        if (v7)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_1000520DC;
          v11[3] = &unk_10008DBD0;
          id v12 = v7;
          uint64_t v9 = [v12 remoteObjectProxyWithErrorHandler:v11];
          [v9 updatedInstallStateForApplicationsWithInfo:*(void *)(a1 + 32)];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t sub_1000520DC(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_100052210(double *a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    uint64_t v12 = *((void *)a1 + 6);
    uint64_t v11 = *((void *)a1 + 5);
    uint64_t v10 = *((void *)a1 + 4);
    MOLogWrite();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "xpcConnection", v10, v11, v12);
        id v8 = v7;
        if (v7)
        {
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          void v13[2] = sub_1000523F0;
          v13[3] = &unk_10008DBD0;
          id v14 = v7;
          uint64_t v9 = [v14 remoteObjectProxyWithErrorHandler:v13];
          [v9 updateInstallProgressForApplication:*((void *)a1 + 4) progress:*((void *)a1 + 6) phase:a1[5]];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

uint64_t sub_1000523F0(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_100052534(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    MOLogWrite();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v6), "xpcConnection", v10, v11);
        id v8 = v7;
        if (v7)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          void v12[2] = sub_100052708;
          v12[3] = &unk_10008DBD0;
          id v13 = v7;
          uint64_t v9 = [v13 remoteObjectProxyWithErrorHandler:v12];
          [v9 applicationsInstalled:*(void *)(a1 + 32) onDeviceWithPairingID:*(void *)(a1 + 40)];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t sub_100052708(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_10005284C(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    MOLogWrite();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v6), "xpcConnection", v10, v11);
        id v8 = v7;
        if (v7)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          void v12[2] = sub_100052A20;
          v12[3] = &unk_10008DBD0;
          id v13 = v7;
          uint64_t v9 = [v13 remoteObjectProxyWithErrorHandler:v12];
          [v9 applicationsUpdated:*(void *)(a1 + 32) onDeviceWithPairingID:*(void *)(a1 + 40)];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t sub_100052A20(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_100052B64(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    MOLogWrite();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v6), "xpcConnection", v10, v11);
        id v8 = v7;
        if (v7)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          void v12[2] = sub_100052D38;
          v12[3] = &unk_10008DBD0;
          id v13 = v7;
          uint64_t v9 = [v13 remoteObjectProxyWithErrorHandler:v12];
          [v9 applicationsUninstalled:*(void *)(a1 + 32) onDeviceWithPairingID:*(void *)(a1 + 40)];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t sub_100052D38(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_100052E54(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "xpcConnection", v10);
        id v8 = v7;
        if (v7)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_10005301C;
          v11[3] = &unk_10008DBD0;
          id v12 = v7;
          uint64_t v9 = [v12 remoteObjectProxyWithErrorHandler:v11];
          [v9 applicationDatabaseResyncedForDeviceWithPairingID:*(void *)(a1 + 32)];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

uint64_t sub_10005301C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

void sub_100053160(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7)
  {
    id v10 = [*(id *)(a1 + 32) count];
    uint64_t v11 = *(void *)(a1 + 40);
    MOLogWrite();
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = (id)qword_1000A55E8;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)v6), "xpcConnection", v10, v11);
        id v8 = v7;
        if (v7)
        {
          v12[0] = _NSConcreteStackBlock;
          v12[1] = 3221225472;
          void v12[2] = sub_100053334;
          v12[3] = &unk_10008DBD0;
          id v13 = v7;
          uint64_t v9 = [v13 remoteObjectProxyWithErrorHandler:v12];
          [v9 removabilityDidChangeForApplications:*(void *)(a1 + 32) onDeviceWithPairingID:*(void *)(a1 + 40)];
        }
        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

uint64_t sub_100053334(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

__CFString *sub_100053458()
{
  int v0 = __chkstk_darwin();
  int v1 = proc_pidpath(v0, buffer, 0x1000u);
  if (v1 < 1)
  {
    uint64_t v3 = @"Unknown Process Name";
  }
  else
  {
    id v2 = [objc_alloc((Class)NSString) initWithBytes:buffer length:v1 encoding:4];
    uint64_t v3 = [v2 lastPathComponent];
  }

  return v3;
}

void sub_100053B80(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  objc_msgSend((id)qword_1000A55E8, "addObject:", *(void *)(a1 + 32), v5);
  id v2 = [*(id *)(a1 + 32) clientName];
  uint64_t v3 = +[NSString stringWithFormat:@"com.apple.appconduitd.observerActive_%@", v2];

  id v6 = v3;
  [v6 UTF8String];
  id v4 = (void *)os_transaction_create();
  [*(id *)(a1 + 32) setObserverTransaction:v4];
}

void sub_100053C70(uint64_t a1)
{
  if (qword_1000A5608 && *(int *)(qword_1000A5608 + 44) >= 7) {
    MOLogWrite();
  }
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100053D50;
    v5[3] = &unk_10008DBD0;
    id v6 = v2;
    id v4 = [v6 remoteObjectProxyWithErrorHandler:v5];
    [v4 observerRegistrationSuccessful];
  }
}

uint64_t sub_100053D50(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = qword_1000A5608;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    id v5 = v2;
    uint64_t v3 = MOLogWrite();
    id v2 = v5;
  }

  return _objc_release_x1(v3, v2);
}

id sub_100053E4C(uint64_t a1)
{
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    MOLogWrite();
  }
  objc_msgSend((id)qword_1000A55E8, "removeObject:", *(void *)(a1 + 32), v4);
  id v2 = *(void **)(a1 + 32);

  return [v2 setObserverTransaction:0];
}

void sub_100055FB4(id a1)
{
  id v1 = objc_alloc_init((Class)ATConnection);
  [v1 requestKeybagSyncToPairedDevice];
}

void sub_1000564D8(id a1)
{
  id v1 = objc_alloc_init((Class)ATConnection);
  [v1 requestKeybagSyncToPairedDevice];
}

void sub_10005ADE8(uint64_t a1)
{
  v24[0] = kSZArchiverOptionCompressionOptions;
  v24[1] = kSZArchiverOptionCompressionMethod;
  v25[0] = kSZArchiverCompressionOptionTryRecompress;
  v25[1] = kSZArchiverCompressionMethodLZFSE;
  v24[2] = kSZArchiverOptionNoCache;
  void v24[3] = kSZArchiverOptionNoSeekOutput;
  v25[2] = &__kCFBooleanTrue;
  v25[3] = &__kCFBooleanTrue;
  void v24[4] = kSZArchiverOptionNoCentralDirectory;
  void v25[4] = &__kCFBooleanTrue;
  id v2 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  uint64_t v23 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v17 = 0u;
  uint64_t v19 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v22 = 0;
  long long v18 = sub_10005B054;
  uint64_t v3 = *(void **)(a1 + 32);
  *((void *)&v20 + 1) = j__objc_msgSend_bytesOutput;
  *(void *)&long long v21 = v3;
  *((void *)&v16 + 1) = sub_10005B22C;
  *(void *)&long long v17 = v3;
  *((void *)&v15 + 1) = sub_10005B340;
  *(void *)&long long v16 = v3;
  id v4 = [v3 url];
  [v4 fileSystemRepresentation];
  char StreamableZip = SZArchiverCreateStreamableZip();

  if ((StreamableZip & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) error];

    if (!v6)
    {
      id v10 = sub_100007574((uint64_t)"-[ACXStreamingZipSocketSender beginSendingWithCompletionBlock:]_block_invoke", 141, @"ACXErrorDomain", 5, @"SZArchiver returned failure but we don't know why. Reason is likely in syslog.", v7, v8, v9, v13[0]);
      [*(id *)(a1 + 32) setError:v10];
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) clientQueue];
  v13[0] = (uint64_t)_NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = (uint64_t)sub_10005B3F4;
  v13[3] = (uint64_t)&unk_10008CCC8;
  id v12 = *(id *)(a1 + 40);
  void v13[4] = *(void *)(a1 + 32);
  id v14 = v12;
  sub_100006BB8(v11, v13);
}

uint64_t sub_10005B054(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  int v24 = 0;
  id v5 = a1;
  if ([v5 stopWriting])
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
      MOLogWrite();
    }
    uint64_t v9 = sub_100007574((uint64_t)"_WriteOutput", 62, @"ACXErrorDomain", 6, @"Client cancelled the operation", v6, v7, v8, v14);
    [v5 setError:v9];

    v26[3] = -1;
  }
  else
  {
    id v10 = [v5 clientQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005B540;
    block[3] = &unk_10008E1C0;
    uint64_t v19 = a2;
    uint64_t v20 = a3;
    id v16 = v5;
    long long v17 = &v21;
    long long v18 = &v25;
    dispatch_sync(v10, block);
  }
  int v11 = *((_DWORD *)v22 + 6);
  if (v11) {
    *__error() = v11;
  }
  uint64_t v12 = v26[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v12;
}

void sub_10005B204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10005B22C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a1 == 2)
  {
    uint64_t v19 = v8;
    uint64_t v20 = v7;
    uint64_t v21 = v5;
    uint64_t v22 = v6;
    id v10 = a5;
    objc_msgSend(v10, "setCompletedBytes:", (char *)objc_msgSend(v10, "completedBytes") + a3);
    id v11 = [v10 completedBytes];
    id v12 = [v10 totalBytes];
    id v13 = [v10 progressBlock];
    if (v13)
    {
      double v14 = (double)(uint64_t)v11 / (double)(uint64_t)v12;
      long long v15 = [v10 clientQueue];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10005B624;
      void v16[3] = &unk_10008E1E8;
      id v17 = v13;
      double v18 = v14;
      dispatch_sync(v15, v16);
    }
  }
}

void sub_10005B340(void *a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [a1 objectForKeyedSubscript:kSZArchiverPreflightTotalFileSize];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v5, "setTotalBytes:", objc_msgSend(v3, "longLongValue"));
  }
  else if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 3)
  {
    MOLogWrite();
  }
}

void sub_10005B3F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10005B540(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) writerBlock];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v9 = 0;
  char v5 = ((uint64_t (**)(void, uint64_t, uint64_t, id *))v2)[2](v2, v3, v4, &v9);
  id v6 = v9;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBytesOutput:", (char *)objc_msgSend(*(id *)(a1 + 32), "bytesOutput") + *(void *)(a1 + 64));
    uint64_t v7 = *(void *)(a1 + 64);
  }
  else
  {
    [*(id *)(a1 + 32) setStopWriting:1];
    [*(id *)(a1 + 32) setError:v6];
    uint64_t v8 = sub_1000074B0(v6);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 code];

    uint64_t v7 = -1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;
}

uint64_t sub_10005B624(uint64_t a1)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40));
}

void sub_10005B63C()
{
  sub_100009D60();
  sub_100009D78((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to validate %@ : %@", v1, v2, v3, v4, v5);
}

void sub_10005B6AC()
{
}

void sub_10005B6D8()
{
}

void sub_10005B704()
{
}

void sub_10005B730()
{
}

void sub_10005B75C()
{
}

void sub_10005B788()
{
}

void sub_10005B7B4()
{
}

void sub_10005B7E0()
{
}

void sub_10005B80C()
{
  __assert_rtn("-[ACXIDSSocketManager _waitForSocket]", "ACXIDSSocketManager.m", 331, "1 == newSemCount");
}

void sub_10005B838()
{
  __assert_rtn("-[ACXIDSSocketManager _doneUsingSocket]", "ACXIDSSocketManager.m", 338, "0 == newSemCount");
}

void sub_10005B864()
{
  __assert_rtn("-[ACXIDSSocketManager _onInternalQueue_armSocketShutdownTimer]", "ACXIDSSocketManager.m", 345, "nil == self.socketTeardownTimer");
}

void sub_10005B890()
{
  __assert_rtn("-[ACXIDSSocketManager _onInternalQueue_armSocketShutdownTimer]_block_invoke", "ACXIDSSocketManager.m", 352, "nil == self.queue");
}

void sub_10005B8BC()
{
  __assert_rtn("-[ACXIDSSocketManager _onInternalQueue_armSocketShutdownTimer]_block_invoke", "ACXIDSSocketManager.m", 351, "nil == self.delegate");
}

void sub_10005B8E8()
{
  __assert_rtn("-[ACXIDSSocketManager handleIDSRelayConnectionResponseWithContext:]_block_invoke", "ACXIDSSocketManager.m", 864, "nil == self.socket");
}

void sub_10005B914()
{
}

void sub_10005B940()
{
}

void sub_10005B96C()
{
}

void sub_10005B998()
{
}

void sub_10005B9C4()
{
}

void sub_10005B9F0()
{
  __assert_rtn("-[ACXLocalAppStoreInstallQueue _onQueue_startQueue]", "ACXLocalAppStoreInstallQueue.m", 250, "NO == self.isSuspended");
}

void sub_10005BA1C()
{
  __assert_rtn("-[ACXLocalAppStoreInstallQueue _onQueue_startQueue]", "ACXLocalAppStoreInstallQueue.m", 251, "nil == self.activeTransaction");
}

void sub_10005BA48()
{
}

void sub_10005BA74()
{
}

void sub_10005BAA0()
{
  __assert_rtn("-[ACXLocalAppStoreInstallQueue _onQueue_deQueueNextOperation]", "ACXLocalAppStoreInstallQueue.m", 287, "0 == self.installQueue.count");
}

void sub_10005BACC()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Falling back to locally available system app state because we unexpectedly don't have watch state", v0, 2u);
}

void sub_10005BB14()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Falling back to locally available system apps because we unexpectedly don't have watch state", v0, 2u);
}

void sub_10005BB5C()
{
  __assert_rtn("-[ACXSocket resumeReadSource]", "ACXSocket.m", 92, "NO == self.readSourceIsRunning");
}

void sub_10005BB88()
{
  __assert_rtn("-[ACXSocket suspendReadSource]", "ACXSocket.m", 100, "YES == self.readSourceIsRunning");
}

void sub_10005BBB4()
{
}

void sub_10005BBE0()
{
}

void sub_10005BC0C()
{
}

void sub_10005BC38()
{
}

void sub_10005BC64()
{
  __assert_rtn("-[ACXInstallQueue _onQueue_startQueue]", "ACXInstallQueue.m", 253, "NO == self.isSuspended");
}

void sub_10005BC90()
{
  __assert_rtn("-[ACXInstallQueue _onQueue_startQueue]", "ACXInstallQueue.m", 254, "nil == self.activeTransaction");
}

void sub_10005BCBC()
{
}

void sub_10005BCE8()
{
}

void sub_10005BD14()
{
  __assert_rtn("-[ACXInstallQueue _onQueue_deQueueNextOperation]", "ACXInstallQueue.m", 303, "0 == self.completions.count");
}

void sub_10005BD40()
{
  __assert_rtn("-[ACXServerInstallOperation _onQueue_armWatchdog]", "ACXServerInstallOperation.m", 182, "nil == self.operationWatchdog");
}

void sub_10005BD6C()
{
  __assert_rtn("-[ACXServerInstallOperation _onQueue_callProgressBlockWithPhase:percent:]", "ACXServerInstallOperation.m", 202, "phase >= self.lastPhase");
}

void sub_10005BD98()
{
  __assert_rtn("-[ACXServerInstallOperation _onQueue_callProgressBlockWithPhase:percent:]", "ACXServerInstallOperation.m", 204, "percent >= self.lastPercentComplete");
}

void sub_10005BDC4()
{
}

void sub_10005BDF0()
{
}

void sub_10005BE1C()
{
  __assert_rtn("-[ACXTimedIdentifierList addIdentifierIfNotPresent:]_block_invoke", "ACXTimedIdentifierList.m", 49, "nil == self.sweepTimer");
}

void sub_10005BE48()
{
}

void sub_10005BE74()
{
}

uint64_t ASDLocalizedTextForUserPresentableError()
{
  return _ASDLocalizedTextForUserPresentableError();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_MD5(data, len, md);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return _CFBundleCopyLocalizationsForPreferences(locArray, prefArray);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return _CFBundleGetInfoDictionary(bundle);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return _CFCopyTypeIDDescription(type_id);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IXCreateUserPresentableError()
{
  return _IXCreateUserPresentableError();
}

uint64_t IXStringForClientID()
{
  return _IXStringForClientID();
}

uint64_t LICreateIconForBundle()
{
  return _LICreateIconForBundle();
}

uint64_t LICreateUncompressedBitmapDataFromImage()
{
  return _LICreateUncompressedBitmapDataFromImage();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MISCopyErrorStringForErrorCode()
{
  return _MISCopyErrorStringForErrorCode();
}

uint64_t MIUpdateSinfWithData()
{
  return _MIUpdateSinfWithData();
}

uint64_t MOLogEnableDiskLogging()
{
  return _MOLogEnableDiskLogging();
}

uint64_t MOLogOpen()
{
  return _MOLogOpen();
}

uint64_t MOLogWrite()
{
  return _MOLogWrite();
}

uint64_t MobileInstallationCopyAppMetadata()
{
  return _MobileInstallationCopyAppMetadata();
}

uint64_t MobileInstallationWaitForSystemAppMigrationToComplete()
{
  return _MobileInstallationWaitForSystemAppMigrationToComplete();
}

uint64_t MobileInstallationWatchKitInstallerSnapshotWKApp()
{
  return _MobileInstallationWatchKitInstallerSnapshotWKApp();
}

uint64_t NRDeviceSizeForProductType()
{
  return _NRDeviceSizeForProductType();
}

void *__cdecl NSHashGet(NSHashTable *table, const void *pointer)
{
  return _NSHashGet(table, pointer);
}

void NSHashInsertKnownAbsent(NSHashTable *table, const void *pointer)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringfromPSYSyncSessionType()
{
  return _NSStringfromPSYSyncSessionType();
}

uint64_t SZArchiverCreateStreamableZip()
{
  return _SZArchiverCreateStreamableZip();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateFilteredInfoPlist()
{
  return __CFBundleCreateFilteredInfoPlist();
}

uint64_t _CFBundleCreateFilteredLocalizedInfoPlist()
{
  return __CFBundleCreateFilteredLocalizedInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

const char *__cdecl class_getImageName(Class cls)
{
  return _class_getImageName(cls);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

gid_t getgid(void)
{
  return _getgid();
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return _objc_copyClassList(outCount);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int shutdown(int a1, int a2)
{
  return _shutdown(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void syslog(int a1, const char *a2, ...)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__alwaysIgnoredSystemAppBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 _alwaysIgnoredSystemAppBundleIDs];
}

id objc_msgSend__bundleIDsOfLocallyAvailableSystemApps(void *a1, const char *a2, ...)
{
  return [a1 _bundleIDsOfLocallyAvailableSystemApps];
}

id objc_msgSend__createInstallationSentinel(void *a1, const char *a2, ...)
{
  return [a1 _createInstallationSentinel];
}

id objc_msgSend__doneUsingSocket(void *a1, const char *a2, ...)
{
  return [a1 _doneUsingSocket];
}

id objc_msgSend__initCommonReliabilityState(void *a1, const char *a2, ...)
{
  return [a1 _initCommonReliabilityState];
}

id objc_msgSend__installationSentinelFileURL(void *a1, const char *a2, ...)
{
  return [a1 _installationSentinelFileURL];
}

id objc_msgSend__registerForAppsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 _registerForAppsChangedNotification];
}

id objc_msgSend__removeInstallationSentinel(void *a1, const char *a2, ...)
{
  return [a1 _removeInstallationSentinel];
}

id objc_msgSend__removeSockPuppetSettings(void *a1, const char *a2, ...)
{
  return [a1 _removeSockPuppetSettings];
}

id objc_msgSend__serializeToDisk(void *a1, const char *a2, ...)
{
  return [a1 _serializeToDisk];
}

id objc_msgSend__setUpSocketReadSource(void *a1, const char *a2, ...)
{
  return [a1 _setUpSocketReadSource];
}

id objc_msgSend__supplementalSystemAppBundleIDMappingForPreWatchOSSix(void *a1, const char *a2, ...)
{
  return [a1 _supplementalSystemAppBundleIDMappingForPreWatchOSSix];
}

id objc_msgSend__supplementalSystemAppBundleIDMappingForWatchOSSixAndLater(void *a1, const char *a2, ...)
{
  return [a1 _supplementalSystemAppBundleIDMappingForWatchOSSixAndLater];
}

id objc_msgSend__systemAppBundleIDMappingForPreWatchOSSix(void *a1, const char *a2, ...)
{
  return [a1 _systemAppBundleIDMappingForPreWatchOSSix];
}

id objc_msgSend__unregisterForAppsChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 _unregisterForAppsChangedNotification];
}

id objc_msgSend__verifyInternalDataStructures(void *a1, const char *a2, ...)
{
  return [a1 _verifyInternalDataStructures];
}

id objc_msgSend__waitForSocket(void *a1, const char *a2, ...)
{
  return [a1 _waitForSocket];
}

id objc_msgSend_acquiredSocket(void *a1, const char *a2, ...)
{
  return [a1 acquiredSocket];
}

id objc_msgSend_activePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairedDevice];
}

id objc_msgSend_activeTransaction(void *a1, const char *a2, ...)
{
  return [a1 activeTransaction];
}

id objc_msgSend_acxSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 acxSequenceNumber];
}

id objc_msgSend_allAvailableApps(void *a1, const char *a2, ...)
{
  return [a1 allAvailableApps];
}

id objc_msgSend_allAvailablePlaceholders(void *a1, const char *a2, ...)
{
  return [a1 allAvailablePlaceholders];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return [a1 allDevices];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_alwaysInstallApps(void *a1, const char *a2, ...)
{
  return [a1 alwaysInstallApps];
}

id objc_msgSend_app(void *a1, const char *a2, ...)
{
  return [a1 app];
}

id objc_msgSend_appInstallRecordsToFetch(void *a1, const char *a2, ...)
{
  return [a1 appInstallRecordsToFetch];
}

id objc_msgSend_appInstaller(void *a1, const char *a2, ...)
{
  return [a1 appInstaller];
}

id objc_msgSend_appList(void *a1, const char *a2, ...)
{
  return [a1 appList];
}

id objc_msgSend_appPreferences(void *a1, const char *a2, ...)
{
  return [a1 appPreferences];
}

id objc_msgSend_appRemovabilityMap(void *a1, const char *a2, ...)
{
  return [a1 appRemovabilityMap];
}

id objc_msgSend_appSettingsDict(void *a1, const char *a2, ...)
{
  return [a1 appSettingsDict];
}

id objc_msgSend_appSize(void *a1, const char *a2, ...)
{
  return [a1 appSize];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appStates(void *a1, const char *a2, ...)
{
  return [a1 appStates];
}

id objc_msgSend_appStoreLocalQueue(void *a1, const char *a2, ...)
{
  return [a1 appStoreLocalQueue];
}

id objc_msgSend_appTags(void *a1, const char *a2, ...)
{
  return [a1 appTags];
}

id objc_msgSend_appURL(void *a1, const char *a2, ...)
{
  return [a1 appURL];
}

id objc_msgSend_appWithReevaluatedTrust(void *a1, const char *a2, ...)
{
  return [a1 appWithReevaluatedTrust];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_applicationManager(void *a1, const char *a2, ...)
{
  return [a1 applicationManager];
}

id objc_msgSend_applicationMode(void *a1, const char *a2, ...)
{
  return [a1 applicationMode];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_appsPendingInstallOnGizmo(void *a1, const char *a2, ...)
{
  return [a1 appsPendingInstallOnGizmo];
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return [a1 assertion];
}

id objc_msgSend_attemptsPerBundleID(void *a1, const char *a2, ...)
{
  return [a1 attemptsPerBundleID];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autoInstallOverride(void *a1, const char *a2, ...)
{
  return [a1 autoInstallOverride];
}

id objc_msgSend_availableSystemAppFetchRunning(void *a1, const char *a2, ...)
{
  return [a1 availableSystemAppFetchRunning];
}

id objc_msgSend_availableSystemAppList(void *a1, const char *a2, ...)
{
  return [a1 availableSystemAppList];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDsOfAllInstalledApps(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfAllInstalledApps];
}

id objc_msgSend_bundleIDsOfAvailableAppsExcludingSystemApps(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfAvailableAppsExcludingSystemApps];
}

id objc_msgSend_bundleIDsOfInstallableSystemApps(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfInstallableSystemApps];
}

id objc_msgSend_bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfInstallableSystemAppsIgnoringCounterpartAvailability];
}

id objc_msgSend_bundleIDsOfLocallyAvailableSystemApps(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfLocallyAvailableSystemApps];
}

id objc_msgSend_bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsOfLocallyAvailableSystemAppsForPreWatchOSSix];
}

id objc_msgSend_bundleIDsToFetch(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsToFetch];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleShortVersion];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesOutput(void *a1, const char *a2, ...)
{
  return [a1 bytesOutput];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllPendingInstalls(void *a1, const char *a2, ...)
{
  return [a1 cancelAllPendingInstalls];
}

id objc_msgSend_cancelCurrentOperation(void *a1, const char *a2, ...)
{
  return [a1 cancelCurrentOperation];
}

id objc_msgSend_cancelPendingInstallations(void *a1, const char *a2, ...)
{
  return [a1 cancelPendingInstallations];
}

id objc_msgSend_cancelSending(void *a1, const char *a2, ...)
{
  return [a1 cancelSending];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_cleanUpPendingUpdateStateTimer(void *a1, const char *a2, ...)
{
  return [a1 cleanUpPendingUpdateStateTimer];
}

id objc_msgSend_clearPendingInstallations(void *a1, const char *a2, ...)
{
  return [a1 clearPendingInstallations];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return [a1 clientQueue];
}

id objc_msgSend_clientSigningIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientSigningIdentifier];
}

id objc_msgSend_clockFaceExtensionPaths(void *a1, const char *a2, ...)
{
  return [a1 clockFaceExtensionPaths];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 companionAppBundleID];
}

id objc_msgSend_companionAppName(void *a1, const char *a2, ...)
{
  return [a1 companionAppName];
}

id objc_msgSend_companionBundleID(void *a1, const char *a2, ...)
{
  return [a1 companionBundleID];
}

id objc_msgSend_companionSyncConnectionManager(void *a1, const char *a2, ...)
{
  return [a1 companionSyncConnectionManager];
}

id objc_msgSend_companionToWatchAppsBundleIDMap(void *a1, const char *a2, ...)
{
  return [a1 companionToWatchAppsBundleIDMap];
}

id objc_msgSend_completedBytes(void *a1, const char *a2, ...)
{
  return [a1 completedBytes];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completions(void *a1, const char *a2, ...)
{
  return [a1 completions];
}

id objc_msgSend_complicationPrincipalClass(void *a1, const char *a2, ...)
{
  return [a1 complicationPrincipalClass];
}

id objc_msgSend_configureService(void *a1, const char *a2, ...)
{
  return [a1 configureService];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionForActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 connectionForActivePairedDevice];
}

id objc_msgSend_connectionMap(void *a1, const char *a2, ...)
{
  return [a1 connectionMap];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyKeyList(void *a1, const char *a2, ...)
{
  return [a1 copyKeyList];
}

id objc_msgSend_correspondingApplicationRecord(void *a1, const char *a2, ...)
{
  return [a1 correspondingApplicationRecord];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counterpartIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 counterpartIdentifiers];
}

id objc_msgSend_cpuSubtype(void *a1, const char *a2, ...)
{
  return [a1 cpuSubtype];
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return [a1 cpuType];
}

id objc_msgSend_creationTime(void *a1, const char *a2, ...)
{
  return [a1 creationTime];
}

id objc_msgSend_currentActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 currentActivePairedDevice];
}

id objc_msgSend_currentClockUUID(void *a1, const char *a2, ...)
{
  return [a1 currentClockUUID];
}

id objc_msgSend_currentCompletionBlock(void *a1, const char *a2, ...)
{
  return [a1 currentCompletionBlock];
}

id objc_msgSend_currentConnectionUUID(void *a1, const char *a2, ...)
{
  return [a1 currentConnectionUUID];
}

id objc_msgSend_currentDBUUID(void *a1, const char *a2, ...)
{
  return [a1 currentDBUUID];
}

id objc_msgSend_currentInstall(void *a1, const char *a2, ...)
{
  return [a1 currentInstall];
}

id objc_msgSend_currentInstallCoordinator(void *a1, const char *a2, ...)
{
  return [a1 currentInstallCoordinator];
}

id objc_msgSend_currentInstallOperation(void *a1, const char *a2, ...)
{
  return [a1 currentInstallOperation];
}

id objc_msgSend_currentInstallOperationWatchBundleID(void *a1, const char *a2, ...)
{
  return [a1 currentInstallOperationWatchBundleID];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMessagingService(void *a1, const char *a2, ...)
{
  return [a1 currentMessagingService];
}

id objc_msgSend_currentSetupMessageUUID(void *a1, const char *a2, ...)
{
  return [a1 currentSetupMessageUUID];
}

id objc_msgSend_databaseUUID(void *a1, const char *a2, ...)
{
  return [a1 databaseUUID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_defaultsToPrivateAlwaysOnDisplayTreatment(void *a1, const char *a2, ...)
{
  return [a1 defaultsToPrivateAlwaysOnDisplayTreatment];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateQueue];
}

id objc_msgSend_deletableSystemAppStateIsMirrored(void *a1, const char *a2, ...)
{
  return [a1 deletableSystemAppStateIsMirrored];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceConnection(void *a1, const char *a2, ...)
{
  return [a1 deviceConnection];
}

id objc_msgSend_deviceManager(void *a1, const char *a2, ...)
{
  return [a1 deviceManager];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpCurrentStateToLog(void *a1, const char *a2, ...)
{
  return [a1 dumpCurrentStateToLog];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_endUsingSocket(void *a1, const char *a2, ...)
{
  return [a1 endUsingSocket];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorInfoDict(void *a1, const char *a2, ...)
{
  return [a1 errorInfoDict];
}

id objc_msgSend_eventHandler(void *a1, const char *a2, ...)
{
  return [a1 eventHandler];
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return [a1 eventQueue];
}

id objc_msgSend_eventQueueStartSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 eventQueueStartSequenceNumber];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_expectsPeerResponse(void *a1, const char *a2, ...)
{
  return [a1 expectsPeerResponse];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_fetchBundleIDList(void *a1, const char *a2, ...)
{
  return [a1 fetchBundleIDList];
}

id objc_msgSend_fetchOutstandingAppEvents(void *a1, const char *a2, ...)
{
  return [a1 fetchOutstandingAppEvents];
}

id objc_msgSend_fetchRemovabilityForRemoteApps(void *a1, const char *a2, ...)
{
  return [a1 fetchRemovabilityForRemoteApps];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return [a1 fromID];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_gizmoIsActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 gizmoIsActivePairedDevice];
}

id objc_msgSend_gizmoState(void *a1, const char *a2, ...)
{
  return [a1 gizmoState];
}

id objc_msgSend_gizmoSupportsRemoteAppList(void *a1, const char *a2, ...)
{
  return [a1 gizmoSupportsRemoteAppList];
}

id objc_msgSend_gotStreamingZipComplete(void *a1, const char *a2, ...)
{
  return [a1 gotStreamingZipComplete];
}

id objc_msgSend_gotTransferDone(void *a1, const char *a2, ...)
{
  return [a1 gotTransferDone];
}

id objc_msgSend_guid(void *a1, const char *a2, ...)
{
  return [a1 guid];
}

id objc_msgSend_hasCompletedInitialPairedSync(void *a1, const char *a2, ...)
{
  return [a1 hasCompletedInitialPairedSync];
}

id objc_msgSend_hasComplication(void *a1, const char *a2, ...)
{
  return [a1 hasComplication];
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return [a1 hasExpired];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_highPriorityUpdateQueue(void *a1, const char *a2, ...)
{
  return [a1 highPriorityUpdateQueue];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_idsContext(void *a1, const char *a2, ...)
{
  return [a1 idsContext];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialPairedSyncComplete(void *a1, const char *a2, ...)
{
  return [a1 initialPairedSyncComplete];
}

id objc_msgSend_initiallyInstallAllApps(void *a1, const char *a2, ...)
{
  return [a1 initiallyInstallAllApps];
}

id objc_msgSend_initiateCB(void *a1, const char *a2, ...)
{
  return [a1 initiateCB];
}

id objc_msgSend_installAllApplications(void *a1, const char *a2, ...)
{
  return [a1 installAllApplications];
}

id objc_msgSend_installID(void *a1, const char *a2, ...)
{
  return [a1 installID];
}

id objc_msgSend_installPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 installPlaceholder];
}

id objc_msgSend_installQueue(void *a1, const char *a2, ...)
{
  return [a1 installQueue];
}

id objc_msgSend_installStatus(void *a1, const char *a2, ...)
{
  return [a1 installStatus];
}

id objc_msgSend_installTargetType(void *a1, const char *a2, ...)
{
  return [a1 installTargetType];
}

id objc_msgSend_installType(void *a1, const char *a2, ...)
{
  return [a1 installType];
}

id objc_msgSend_installableSystemAppToCompanionAppIdentifierMap(void *a1, const char *a2, ...)
{
  return [a1 installableSystemAppToCompanionAppIdentifierMap];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intentsRestrictedWhileLocked(void *a1, const char *a2, ...)
{
  return [a1 intentsRestrictedWhileLocked];
}

id objc_msgSend_intentsSupported(void *a1, const char *a2, ...)
{
  return [a1 intentsSupported];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return [a1 invalidated];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isActivePairedDevice];
}

id objc_msgSend_isBetaApp(void *a1, const char *a2, ...)
{
  return [a1 isBetaApp];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isDowngraded(void *a1, const char *a2, ...)
{
  return [a1 isDowngraded];
}

id objc_msgSend_isEligibleForWatchAppInstall(void *a1, const char *a2, ...)
{
  return [a1 isEligibleForWatchAppInstall];
}

id objc_msgSend_isEmbeddedPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isEmbeddedPlaceholder];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return [a1 isLocallyPaired];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return [a1 isProfileValidated];
}

id objc_msgSend_isReachable(void *a1, const char *a2, ...)
{
  return [a1 isReachable];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return [a1 isSuspended];
}

id objc_msgSend_isSystemApp(void *a1, const char *a2, ...)
{
  return [a1 isSystemApp];
}

id objc_msgSend_isSystemPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isSystemPlaceholder];
}

id objc_msgSend_isTombstone(void *a1, const char *a2, ...)
{
  return [a1 isTombstone];
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return [a1 isTrusted];
}

id objc_msgSend_isUserInitiated(void *a1, const char *a2, ...)
{
  return [a1 isUserInitiated];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_lastLSUUID(void *a1, const char *a2, ...)
{
  return [a1 lastLSUUID];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastPercentComplete(void *a1, const char *a2, ...)
{
  return [a1 lastPercentComplete];
}

id objc_msgSend_lastPhase(void *a1, const char *a2, ...)
{
  return [a1 lastPhase];
}

id objc_msgSend_lastSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 lastSequenceNumber];
}

id objc_msgSend_legacyMessagingService(void *a1, const char *a2, ...)
{
  return [a1 legacyMessagingService];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_list(void *a1, const char *a2, ...)
{
  return [a1 list];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_locallyAvailableSystemAppBundleIDToCompanionBundleIDMapping(void *a1, const char *a2, ...)
{
  return [a1 locallyAvailableSystemAppBundleIDToCompanionBundleIDMapping];
}

id objc_msgSend_locallyAvailableSystemAppBundleIDToCompanionBundleIDMappingForPreWatchOSSix(void *a1, const char *a2, ...)
{
  return [a1 locallyAvailableSystemAppBundleIDToCompanionBundleIDMappingForPreWatchOSSix];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lsSequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 lsSequenceNumber];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_markAllApplicationsAsRemoved(void *a1, const char *a2, ...)
{
  return [a1 markAllApplicationsAsRemoved];
}

id objc_msgSend_markInstalledAsPending(void *a1, const char *a2, ...)
{
  return [a1 markInstalledAsPending];
}

id objc_msgSend_maxCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 maxCompatibilityVersion];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messager(void *a1, const char *a2, ...)
{
  return [a1 messager];
}

id objc_msgSend_minCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 minCompatibilityVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsAvailableSystemAppFetch(void *a1, const char *a2, ...)
{
  return [a1 needsAvailableSystemAppFetch];
}

id objc_msgSend_needsReunionSync(void *a1, const char *a2, ...)
{
  return [a1 needsReunionSync];
}

id objc_msgSend_nextMessageType(void *a1, const char *a2, ...)
{
  return [a1 nextMessageType];
}

id objc_msgSend_normalPriorityNewAppUpdateQueue(void *a1, const char *a2, ...)
{
  return [a1 normalPriorityNewAppUpdateQueue];
}

id objc_msgSend_normalPriorityUpdateQueue(void *a1, const char *a2, ...)
{
  return [a1 normalPriorityUpdateQueue];
}

id objc_msgSend_noteCompanionAppDatabaseRebuild(void *a1, const char *a2, ...)
{
  return [a1 noteCompanionAppDatabaseRebuild];
}

id objc_msgSend_noteDatabaseRebuild(void *a1, const char *a2, ...)
{
  return [a1 noteDatabaseRebuild];
}

id objc_msgSend_npsDomain(void *a1, const char *a2, ...)
{
  return [a1 npsDomain];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_observer(void *a1, const char *a2, ...)
{
  return [a1 observer];
}

id objc_msgSend_observerQueue(void *a1, const char *a2, ...)
{
  return [a1 observerQueue];
}

id objc_msgSend_observerRegistrationSuccessful(void *a1, const char *a2, ...)
{
  return [a1 observerRegistrationSuccessful];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return [a1 observers];
}

id objc_msgSend_operationWatchdog(void *a1, const char *a2, ...)
{
  return [a1 operationWatchdog];
}

id objc_msgSend_osBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 osBuildVersion];
}

id objc_msgSend_osVersion(void *a1, const char *a2, ...)
{
  return [a1 osVersion];
}

id objc_msgSend_ourDBUUID(void *a1, const char *a2, ...)
{
  return [a1 ourDBUUID];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return [a1 pairedDevice];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_pairingStoreURL(void *a1, const char *a2, ...)
{
  return [a1 pairingStoreURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingAppUpdateStates(void *a1, const char *a2, ...)
{
  return [a1 pendingAppUpdateStates];
}

id objc_msgSend_pendingApps(void *a1, const char *a2, ...)
{
  return [a1 pendingApps];
}

id objc_msgSend_pendingReplies(void *a1, const char *a2, ...)
{
  return [a1 pendingReplies];
}

id objc_msgSend_performingResync(void *a1, const char *a2, ...)
{
  return [a1 performingResync];
}

id objc_msgSend_placeholderInstallQueue(void *a1, const char *a2, ...)
{
  return [a1 placeholderInstallQueue];
}

id objc_msgSend_possibleCompanionDeletableSystemAppToWatchCounterpartsMap(void *a1, const char *a2, ...)
{
  return [a1 possibleCompanionDeletableSystemAppToWatchCounterpartsMap];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return [a1 productVersion];
}

id objc_msgSend_progressBlock(void *a1, const char *a2, ...)
{
  return [a1 progressBlock];
}

id objc_msgSend_provisioningProfileInfo(void *a1, const char *a2, ...)
{
  return [a1 provisioningProfileInfo];
}

id objc_msgSend_provisioningProfiles(void *a1, const char *a2, ...)
{
  return [a1 provisioningProfiles];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readSourceIsRunning(void *a1, const char *a2, ...)
{
  return [a1 readSourceIsRunning];
}

id objc_msgSend_recentlyCompletedWatchAppInstalls(void *a1, const char *a2, ...)
{
  return [a1 recentlyCompletedWatchAppInstalls];
}

id objc_msgSend_regenerateAllUniqueInstallIDs(void *a1, const char *a2, ...)
{
  return [a1 regenerateAllUniqueInstallIDs];
}

id objc_msgSend_remoteAppList(void *a1, const char *a2, ...)
{
  return [a1 remoteAppList];
}

id objc_msgSend_remoteDeviceConnected(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceConnected];
}

id objc_msgSend_remoteDeviceDisconnected(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceDisconnected];
}

id objc_msgSend_remoteIsConnected(void *a1, const char *a2, ...)
{
  return [a1 remoteIsConnected];
}

id objc_msgSend_remoteRemovabilityFetchRunning(void *a1, const char *a2, ...)
{
  return [a1 remoteRemovabilityFetchRunning];
}

id objc_msgSend_remoteRemovabilityManager(void *a1, const char *a2, ...)
{
  return [a1 remoteRemovabilityManager];
}

id objc_msgSend_removability(void *a1, const char *a2, ...)
{
  return [a1 removability];
}

id objc_msgSend_removabilityChangeClock(void *a1, const char *a2, ...)
{
  return [a1 removabilityChangeClock];
}

id objc_msgSend_removabilityForRemoteApps(void *a1, const char *a2, ...)
{
  return [a1 removabilityForRemoteApps];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return [a1 replyBlock];
}

id objc_msgSend_requestKeybagSyncToPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 requestKeybagSyncToPairedDevice];
}

id objc_msgSend_requiredCapabilities(void *a1, const char *a2, ...)
{
  return [a1 requiredCapabilities];
}

id objc_msgSend_requiredDeviceCapabilities(void *a1, const char *a2, ...)
{
  return [a1 requiredDeviceCapabilities];
}

id objc_msgSend_resetSocket(void *a1, const char *a2, ...)
{
  return [a1 resetSocket];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeOnReconnect(void *a1, const char *a2, ...)
{
  return [a1 resumeOnReconnect];
}

id objc_msgSend_resumeReadSource(void *a1, const char *a2, ...)
{
  return [a1 resumeReadSource];
}

id objc_msgSend_resyncAttempts(void *a1, const char *a2, ...)
{
  return [a1 resyncAttempts];
}

id objc_msgSend_resyncCompleted(void *a1, const char *a2, ...)
{
  return [a1 resyncCompleted];
}

id objc_msgSend_resyncThrottleTimer(void *a1, const char *a2, ...)
{
  return [a1 resyncThrottleTimer];
}

id objc_msgSend_reunionSyncRunning(void *a1, const char *a2, ...)
{
  return [a1 reunionSyncRunning];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sequenceNumber(void *a1, const char *a2, ...)
{
  return [a1 sequenceNumber];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return [a1 serialize];
}

id objc_msgSend_serializeAsRemoteApplication(void *a1, const char *a2, ...)
{
  return [a1 serializeAsRemoteApplication];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceDelegateSet(void *a1, const char *a2, ...)
{
  return [a1 serviceDelegateSet];
}

id objc_msgSend_serviceMinCompatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 serviceMinCompatibilityVersion];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedAppStateSyncDelegate(void *a1, const char *a2, ...)
{
  return [a1 sharedAppStateSyncDelegate];
}

id objc_msgSend_sharedApplicationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedApplicationManager];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedConnectionManager(void *a1, const char *a2, ...)
{
  return [a1 sharedConnectionManager];
}

id objc_msgSend_sharedInstaller(void *a1, const char *a2, ...)
{
  return [a1 sharedInstaller];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharedStateManager(void *a1, const char *a2, ...)
{
  return [a1 sharedStateManager];
}

id objc_msgSend_sharedSyncDelegate(void *a1, const char *a2, ...)
{
  return [a1 sharedSyncDelegate];
}

id objc_msgSend_sharedV1SocketManager(void *a1, const char *a2, ...)
{
  return [a1 sharedV1SocketManager];
}

id objc_msgSend_sharedV2SocketManager(void *a1, const char *a2, ...)
{
  return [a1 sharedV2SocketManager];
}

id objc_msgSend_sharedWatcher(void *a1, const char *a2, ...)
{
  return [a1 sharedWatcher];
}

id objc_msgSend_sinfData(void *a1, const char *a2, ...)
{
  return [a1 sinfData];
}

id objc_msgSend_socket(void *a1, const char *a2, ...)
{
  return [a1 socket];
}

id objc_msgSend_socketFD(void *a1, const char *a2, ...)
{
  return [a1 socketFD];
}

id objc_msgSend_socketInUse(void *a1, const char *a2, ...)
{
  return [a1 socketInUse];
}

id objc_msgSend_socketManager(void *a1, const char *a2, ...)
{
  return [a1 socketManager];
}

id objc_msgSend_socketQueue(void *a1, const char *a2, ...)
{
  return [a1 socketQueue];
}

id objc_msgSend_socketReadSource(void *a1, const char *a2, ...)
{
  return [a1 socketReadSource];
}

id objc_msgSend_socketSetupTimer(void *a1, const char *a2, ...)
{
  return [a1 socketSetupTimer];
}

id objc_msgSend_socketTeardownTimer(void *a1, const char *a2, ...)
{
  return [a1 socketTeardownTimer];
}

id objc_msgSend_sourceAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sourceAppIdentifier];
}

id objc_msgSend_startDatabaseSyncIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 startDatabaseSyncIfNeeded];
}

id objc_msgSend_stateForActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 stateForActivePairedDevice];
}

id objc_msgSend_stateMap(void *a1, const char *a2, ...)
{
  return [a1 stateMap];
}

id objc_msgSend_stateObserver(void *a1, const char *a2, ...)
{
  return [a1 stateObserver];
}

id objc_msgSend_stateQueue(void *a1, const char *a2, ...)
{
  return [a1 stateQueue];
}

id objc_msgSend_stopWriting(void *a1, const char *a2, ...)
{
  return [a1 stopWriting];
}

id objc_msgSend_storageBaseURL(void *a1, const char *a2, ...)
{
  return [a1 storageBaseURL];
}

id objc_msgSend_storeMetadata(void *a1, const char *a2, ...)
{
  return [a1 storeMetadata];
}

id objc_msgSend_streamName(void *a1, const char *a2, ...)
{
  return [a1 streamName];
}

id objc_msgSend_streamingZipSender(void *a1, const char *a2, ...)
{
  return [a1 streamingZipSender];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedComplicationFamilies(void *a1, const char *a2, ...)
{
  return [a1 supportedComplicationFamilies];
}

id objc_msgSend_supportsAlwaysOnDisplay(void *a1, const char *a2, ...)
{
  return [a1 supportsAlwaysOnDisplay];
}

id objc_msgSend_supportsRemoteAppList(void *a1, const char *a2, ...)
{
  return [a1 supportsRemoteAppList];
}

id objc_msgSend_supportsStandaloneApps(void *a1, const char *a2, ...)
{
  return [a1 supportsStandaloneApps];
}

id objc_msgSend_supportsTrackingAppRemovability(void *a1, const char *a2, ...)
{
  return [a1 supportsTrackingAppRemovability];
}

id objc_msgSend_suspendReadSource(void *a1, const char *a2, ...)
{
  return [a1 suspendReadSource];
}

id objc_msgSend_sweepTimer(void *a1, const char *a2, ...)
{
  return [a1 sweepTimer];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncPending(void *a1, const char *a2, ...)
{
  return [a1 syncPending];
}

id objc_msgSend_syncSession(void *a1, const char *a2, ...)
{
  return [a1 syncSession];
}

id objc_msgSend_syncSessionType(void *a1, const char *a2, ...)
{
  return [a1 syncSessionType];
}

id objc_msgSend_syncTimeout(void *a1, const char *a2, ...)
{
  return [a1 syncTimeout];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_syncingIsRestricted(void *a1, const char *a2, ...)
{
  return [a1 syncingIsRestricted];
}

id objc_msgSend_systemPlaceholderEnumerator(void *a1, const char *a2, ...)
{
  return [a1 systemPlaceholderEnumerator];
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return [a1 teamID];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_tempDir(void *a1, const char *a2, ...)
{
  return [a1 tempDir];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutHandler(void *a1, const char *a2, ...)
{
  return [a1 timeoutHandler];
}

id objc_msgSend_timeoutInSeconds(void *a1, const char *a2, ...)
{
  return [a1 timeoutInSeconds];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_totalBytes(void *a1, const char *a2, ...)
{
  return [a1 totalBytes];
}

id objc_msgSend_trackedOSBuildNumber(void *a1, const char *a2, ...)
{
  return [a1 trackedOSBuildNumber];
}

id objc_msgSend_transferStartTime(void *a1, const char *a2, ...)
{
  return [a1 transferStartTime];
}

id objc_msgSend_trustChangeEvaluationPending(void *a1, const char *a2, ...)
{
  return [a1 trustChangeEvaluationPending];
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return [a1 typeForInstallMachinery];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uniqueInstallID(void *a1, const char *a2, ...)
{
  return [a1 uniqueInstallID];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userActivityTypes(void *a1, const char *a2, ...)
{
  return [a1 userActivityTypes];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_usesLegacySocketService(void *a1, const char *a2, ...)
{
  return [a1 usesLegacySocketService];
}

id objc_msgSend_versionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 versionIdentifier];
}

id objc_msgSend_waitForActivePairedOrAltAccountDevice(void *a1, const char *a2, ...)
{
  return [a1 waitForActivePairedOrAltAccountDevice];
}

id objc_msgSend_waitersForInstallableList(void *a1, const char *a2, ...)
{
  return [a1 waitersForInstallableList];
}

id objc_msgSend_waitingForInstallList(void *a1, const char *a2, ...)
{
  return [a1 waitingForInstallList];
}

id objc_msgSend_watchAppBundleID(void *a1, const char *a2, ...)
{
  return [a1 watchAppBundleID];
}

id objc_msgSend_watchAppExecutableHash(void *a1, const char *a2, ...)
{
  return [a1 watchAppExecutableHash];
}

id objc_msgSend_watchAppURL(void *a1, const char *a2, ...)
{
  return [a1 watchAppURL];
}

id objc_msgSend_watchKitAppExecutableHash(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppExecutableHash];
}

id objc_msgSend_watchKitAppExtensionBundleID(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppExtensionBundleID];
}

id objc_msgSend_watchKitVersion(void *a1, const char *a2, ...)
{
  return [a1 watchKitVersion];
}

id objc_msgSend_watchSize(void *a1, const char *a2, ...)
{
  return [a1 watchSize];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_wiFiAsserted(void *a1, const char *a2, ...)
{
  return [a1 wiFiAsserted];
}

id objc_msgSend_wifiAsserted(void *a1, const char *a2, ...)
{
  return [a1 wifiAsserted];
}

id objc_msgSend_writerBlock(void *a1, const char *a2, ...)
{
  return [a1 writerBlock];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}