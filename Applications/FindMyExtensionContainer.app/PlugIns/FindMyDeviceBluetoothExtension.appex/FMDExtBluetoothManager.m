@interface FMDExtBluetoothManager
+ (BTAccessoryManagerImpl)getAccessoryManager;
+ (id)bluetoothManagerDelegateQueue;
+ (id)currentInstance;
+ (id)pairedAccessoryWithID:(id)a3;
+ (id)pairedAppleAccessories;
+ (id)serialQueue;
@end

@implementation FMDExtBluetoothManager

+ (BTAccessoryManagerImpl)getAccessoryManager
{
  v2 = +[FMDExtBluetoothManager currentInstance];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = *(BTAccessoryManagerImpl **)&v2[OBJC_IVAR___BluetoothManager__accessoryManager];
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)currentInstance
{
  v2 = [a1 bluetoothManagerDelegateQueue];
  v3 = +[FMDBluetoothFrameworkBTManagingFactory bluetoothManagerWithQueue:v2 delegate:0];

  int v4 = 0;
  while (([v3 available] & 1) == 0)
  {
    +[NSThread sleepForTimeInterval:0.01];
    if (++v4 == 100) {
      goto LABEL_8;
    }
  }
  v5 = sub_1000069F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    double v8 = (double)v4 * 0.01;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BluetoothManager available after %f", (uint8_t *)&v7, 0xCu);
  }

LABEL_8:

  return v3;
}

+ (id)bluetoothManagerDelegateQueue
{
  if (qword_10002D698 != -1) {
    dispatch_once(&qword_10002D698, &stru_100021008);
  }
  v2 = (void *)qword_10002D6A0;

  return v2;
}

+ (id)serialQueue
{
  if (qword_10002D6A8 != -1) {
    dispatch_once(&qword_10002D6A8, &stru_100021028);
  }
  v2 = (void *)qword_10002D6B0;

  return v2;
}

+ (id)pairedAppleAccessories
{
  v2 = +[FMDExtBluetoothManager currentInstance];
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_1000051B0;
  v26 = sub_1000051C0;
  id v27 = 0;
  int v4 = +[FMDExtBluetoothManager serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051C8;
  block[3] = &unk_100021050;
  v21 = &v22;
  id v5 = v2;
  id v19 = v5;
  v6 = v3;
  v20 = v6;
  dispatch_async(v4, block);

  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = (id)v23[5];
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "vendorId", (void)v14) == 76
          && ([v12 isTemporaryPaired] & 1) == 0)
        {
          [v7 addObject:v12];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v28 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v22, 8);

  return v7;
}

+ (id)pairedAccessoryWithID:(id)a3
{
  id v3 = a3;
  +[FMDExtBluetoothManager pairedAppleAccessories];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [v8 address:v12];
        uint64_t v10 = +[FMDExtHelper deviceIDFromAddress:v9];

        if ([v10 isEqualToString:v3])
        {
          id v5 = v8;

          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

@end