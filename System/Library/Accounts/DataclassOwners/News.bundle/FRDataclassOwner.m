@interface FRDataclassOwner
+ (id)dataclasses;
- (BOOL)_cleanUpAppExternalFiles;
- (BOOL)_cleanUpDataContainers;
- (BOOL)_cleanUpNewsCoreData;
- (BOOL)_cleanUpWatchData;
- (BOOL)_hasLocalData;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (FCAccountActionQueue)accountActionQueue;
- (FRDataclassOwner)init;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (void)_reloadWidgets;
- (void)_unregisterDeviceToken;
- (void)setAccountActionQueue:(id)a3;
@end

@implementation FRDataclassOwner

- (FRDataclassOwner)init
{
  v8.receiver = self;
  v8.super_class = (Class)FRDataclassOwner;
  v2 = [(FRDataclassOwner *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)FCAccountActionQueue);
    v4 = FCURLForAccountActionQueue();
    v5 = (FCAccountActionQueue *)[v3 initWithFileURL:v4];
    accountActionQueue = v2->_accountActionQueue;
    v2->_accountActionQueue = v5;
  }
  return v2;
}

+ (id)dataclasses
{
  uint64_t v4 = kAccountDataclassNews;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  return [(FRDataclassOwner *)self actionsForEnablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  return [(FRDataclassOwner *)self actionsForDisablingDataclassOnAccount:a3 forDataclass:a4];
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  if ([(FRDataclassOwner *)self _hasLocalData])
  {
    uint64_t v4 = +[ACDataclassAction actionWithType:5];
    v5 = +[ACDataclassAction actionWithType:](ACDataclassAction, "actionWithType:", 0, v4);
    v8[1] = v5;
    v6 = +[NSArray arrayWithObjects:v8 count:2];
  }
  else
  {
    uint64_t v4 = +[ACDataclassAction actionWithType:1];
    v9 = v4;
    v6 = +[NSArray arrayWithObjects:&v9 count:1];
  }

  return v6;
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  if ([(FRDataclassOwner *)self _hasLocalData])
  {
    uint64_t v4 = +[ACDataclassAction destructiveActionWithType:3];
    v10[0] = v4;
    v5 = +[ACDataclassAction actionWithType:2];
    v10[1] = v5;
    v6 = +[ACDataclassAction actionWithType:0];
    v10[2] = v6;
    v7 = +[NSArray arrayWithObjects:v10 count:3];
  }
  else
  {
    uint64_t v4 = +[ACDataclassAction actionWithType:3];
    v9 = v4;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }

  return v7;
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 type] && objc_msgSend(v10, "type") != (char *)&dword_4 + 3)
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = sub_3F2C;
    v24 = sub_3F58;
    id v25 = 0;
    v15 = dispatch_semaphore_create(0);
    NSSTerminateNewsWithCompletion();
    dispatch_time_t v16 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v15, v16);
    v17 = [(FRDataclassOwner *)self accountActionQueue];
    unsigned int v14 = objc_msgSend(v17, "enqueueActionWithType:", objc_msgSend(v10, "type"));

    if ([v10 type] == (char *)&dword_0 + 3)
    {
      [(FRDataclassOwner *)self _unregisterDeviceToken];
      if (v14)
      {
        if ([(FRDataclassOwner *)self _cleanUpAppExternalFiles]
          && [(FRDataclassOwner *)self _cleanUpDataContainers]
          && [(FRDataclassOwner *)self _cleanUpNewsCoreData])
        {
          LOBYTE(v14) = [(FRDataclassOwner *)self _cleanUpWatchData];
        }
        else
        {
          LOBYTE(v14) = 0;
        }
      }
    }
    uint64_t v18 = v21[5];
    if (v18) {
      (*(void (**)(void))(v18 + 16))();
    }
    [(FRDataclassOwner *)self _reloadWidgets];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    LOBYTE(v14) = 1;
  }

  return v14;
}

- (void)_unregisterDeviceToken
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_4288;
  v23 = sub_4298;
  id v24 = 0;
  id v2 = objc_alloc((Class)FCFileCoordinatedNotificationDropbox);
  id v3 = FCURLForNotificationDropbox();
  id v4 = [v2 initWithFileURL:v3];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_42A0;
  v16[3] = &unk_83D0;
  uint64_t v18 = &v19;
  v5 = dispatch_semaphore_create(0);
  v17 = v5;
  [v4 peekWithAccessor:v16];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = [(id)v20[5] baseURLString];
  v7 = [(id)v20[5] notificationUserID];
  objc_super v8 = [(id)v20[5] deviceToken];
  v9 = [(id)v20[5] storefrontID];
  if ([v6 length]
    && [v7 length]
    && [v8 length]
    && [v9 length])
  {
    id v10 = [objc_alloc((Class)FCNotificationsEndpointConnection) initWithBaseURLString:v6];
    id v11 = &_dispatch_main_q;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_4300;
    v14[3] = &unk_83F8;
    id v12 = v5;
    v15 = v12;
    [v10 unregisterDeviceWithUserID:v7 deviceToken:v8 storefrontID:v9 deviceDigestMode:0 callbackQueue:&_dispatch_main_q completion:v14];

    dispatch_time_t v13 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v12, v13);
  }
  _Block_object_dispose(&v19, 8);
}

- (BOOL)_cleanUpAppExternalFiles
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = FCURLsForAppExternalFiles();
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    unsigned __int8 v6 = 1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        if (v6)
        {
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          v9 = +[NSFileManager defaultManager];
          unsigned __int8 v6 = [v9 removeItemAtURL:v8 error:0];
        }
        else
        {
          unsigned __int8 v6 = 0;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)_cleanUpDataContainers
{
  id v2 = objc_alloc((Class)NSSDataContainerDataDestructionItem);
  id v3 = objc_msgSend(v2, "initWithContainerClass:identifier:", 4, objc_msgSend(NSSNewsTodayWidgetBundleID, "UTF8String"));
  id v4 = objc_alloc((Class)NSSDataContainerDataDestructionItem);
  id v5 = objc_msgSend(v4, "initWithContainerClass:identifier:", NDNewsdDataContainerClass, objc_msgSend(NDNewsdDataContainerIdentifier, "UTF8String"));
  id v6 = objc_alloc((Class)NSSDataContainerDataDestructionItem);
  id v7 = objc_msgSend(v6, "initWithContainerClass:identifier:", 7, objc_msgSend(NSSStocksNewsDataContainerIdentifier, "UTF8String"));
  v11[0] = v3;
  v11[1] = v5;
  v11[2] = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:v11 count:3];
  id v9 = (id)NSSDestroyDataContainersWithItems();

  return 1;
}

- (BOOL)_cleanUpNewsCoreData
{
  id v2 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  id v3 = NewsCoreUserDefaults();
  uint64_t v4 = FCDefaultsSuiteName;
  id v5 = FCDefaultsDomainiCloudDataDestructionStickyKeys();
  id v6 = [v2 initWithUserDefaults:v3 domainName:v4 stickyKeys:v5];

  id v7 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  uint64_t v8 = NewsCoreSensitiveUserDefaults();
  uint64_t v9 = FCSensitiveDefaultsSuiteName;
  id v10 = +[NSSet set];
  id v11 = [v7 initWithUserDefaults:v8 domainName:v9 stickyKeys:v10];

  v14[0] = v6;
  v14[1] = v11;
  long long v12 = +[NSArray arrayWithObjects:v14 count:2];
  NSSDestroyUserDefaultsDataWithItems();

  return 1;
}

- (BOOL)_cleanUpWatchData
{
  id v2 = objc_alloc((Class)NSSUserDefaultsDataDestructionItem);
  id v3 = +[NSUserDefaults nanoNewsSyncDefaults];
  uint64_t v4 = +[NSSet set];
  id v5 = [v2 initWithUserDefaults:v3 domainName:@"com.apple.nanonews.sync" stickyKeys:v4];

  id v10 = v5;
  id v6 = +[NSArray arrayWithObjects:&v10 count:1];
  NSSDestroyUserDefaultsDataWithItems();

  CFBooleanRef v7 = (const __CFBoolean *)MGCopyAnswer();
  int Value = CFBooleanGetValue(v7);
  if (v7) {
    CFRelease(v7);
  }
  if (!Value)
  {
    +[NanoNewsSettingsManager resetSaved];
    +[NanoNewsSettingsManager resetSeen];
  }

  return 1;
}

- (BOOL)_hasLocalData
{
  id v2 = [(FRDataclassOwner *)self accountActionQueue];
  unsigned __int8 v3 = [v2 readLocalDataHint];

  return v3;
}

- (void)_reloadWidgets
{
  id v2 = objc_alloc((Class)CHSTimelineController);
  id v3 = [v2 initForAvocadoIdentifier:NSSNewsTodayWidgetKind inBundleIdentifier:NSSNewsTodayWidgetBundleID];
  id v4 = [v3 reloadTimeline];

  id v5 = objc_alloc((Class)CHSTimelineController);
  id v7 = [v5 initForAvocadoIdentifier:NSSNewsTagWidgetKind inBundleIdentifier:NSSNewsTagWidgetBundleID];
  id v6 = [v7 reloadTimeline];
}

- (FCAccountActionQueue)accountActionQueue
{
  return self->_accountActionQueue;
}

- (void)setAccountActionQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end