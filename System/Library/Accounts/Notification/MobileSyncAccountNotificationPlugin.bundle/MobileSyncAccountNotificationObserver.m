@interface MobileSyncAccountNotificationObserver
- (MobileSyncAccountNotificationObserver)init;
- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6;
@end

@implementation MobileSyncAccountNotificationObserver

- (MobileSyncAccountNotificationObserver)init
{
  v10.receiver = self;
  v10.super_class = (Class)MobileSyncAccountNotificationObserver;
  v2 = [(MobileSyncAccountNotificationObserver *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create(Name, v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)account:(id)a3 didChangeWithType:(int)a4 inStore:(id)a5 oldAccount:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  objc_super v10 = v9;
  if (v8) {
    v11 = v8;
  }
  else {
    v11 = v9;
  }
  id v12 = v11;
  v13 = [v12 accountType];
  v14 = [v13 supportedDataclasses];
  uint64_t v44 = *MEMORY[0x263EFB3E0];
  if (objc_msgSend(v14, "containsObject:"))
  {
    int v15 = 1;
  }
  else
  {
    id v42 = v8;
    int v16 = a4;
    v17 = v10;
    v18 = [v12 accountType];
    v19 = [v18 supportedDataclasses];
    if ([v19 containsObject:*MEMORY[0x263EFB3F0]])
    {
      int v15 = 1;
    }
    else
    {
      v20 = [v12 accountType];
      v21 = [v20 supportedDataclasses];
      int v15 = [v21 containsObject:*MEMORY[0x263EFB3C0]];
    }
    objc_super v10 = v17;
    a4 = v16;
    id v8 = v42;
  }

  if (qword_26AFC70C8 != -1) {
    dispatch_once(&qword_26AFC70C8, &unk_26F4B3128);
  }
  v22 = [v12 accountType];
  v23 = [v22 identifier];

  v24 = [v12 parentAccount];

  if (v24)
  {
    v25 = [v12 parentAccount];
    v26 = [v25 accountType];
    uint64_t v27 = [v26 identifier];

    v23 = (void *)v27;
  }
  if ((v15 & [(id)qword_26AFC70C0 containsObject:v23]) == 1)
  {
    v28 = [v12 parentAccount];

    if (!v28)
    {
      if ((a4 - 1) > 1)
      {
        char v43 = 0;
        uint64_t v41 = 0;
        char v40 = 0;
      }
      else
      {
        char v43 = [v8 isEnabledForDataclass:v44];
        BYTE4(v41) = [v8 isEnabledForDataclass:*MEMORY[0x263EFB3C0]];
        LOBYTE(v41) = [v8 isEnabledForDataclass:*MEMORY[0x263EFB3F0]];
        char v40 = [v8 isEnabledForDataclass:*MEMORY[0x263EFB460]];
      }
      if (a4 == 3)
      {
        v32 = v10;
        char v29 = 1;
        char v30 = 1;
        char v31 = 1;
        char v33 = 1;
      }
      else if (a4 == 2)
      {
        char v29 = [v10 isEnabledForDataclass:v44];
        char v30 = [v10 isEnabledForDataclass:*MEMORY[0x263EFB3C0]];
        char v31 = [v10 isEnabledForDataclass:*MEMORY[0x263EFB3F0]];
        v32 = v10;
        char v33 = [v10 isEnabledForDataclass:*MEMORY[0x263EFB460]];
      }
      else
      {
        v32 = v10;
        char v29 = 0;
        char v30 = 0;
        char v31 = 0;
        char v33 = 0;
      }
      v34 = [v12 accountType];
      v35 = [v34 accountTypeDescription];

      v36 = [v12 accountDescription];
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_2405C1574;
      block[3] = &unk_2650C4CF0;
      char v49 = v43;
      char v50 = v29;
      id v47 = v35;
      id v48 = v36;
      char v51 = BYTE4(v41);
      char v52 = v30;
      char v53 = v41;
      char v54 = v31;
      char v55 = v40;
      char v56 = v33;
      id v38 = v36;
      id v39 = v35;
      dispatch_async(serialQueue, block);

      objc_super v10 = v32;
    }
  }
}

- (void).cxx_destruct
{
}

@end