@interface _GCRacingWheelManager
- (_GCRacingWheelManager)init;
- (id)connectedRacingWheels;
@end

@implementation _GCRacingWheelManager

- (_GCRacingWheelManager)init
{
  v33.receiver = self;
  v33.super_class = (Class)_GCRacingWheelManager;
  id v2 = [(_GCRacingWheelManager *)&v33 init];
  dispatch_queue_t v3 = dispatch_queue_create("_GCRacingWheelManager", 0);
  v4 = (void *)*((void *)v2 + 1);
  *((void *)v2 + 1) = v3;

  v5 = IONotificationPortCreate(kIOMainPortDefault);
  *((void *)v2 + 2) = v5;
  if (v5)
  {
    IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v2 + 1));
    callBacks.version = 0;
    memset(&callBacks.copyDescription, 0, 24);
    callBacks.retain = (CFSetRetainCallBack)_IOObjectCFRetain;
    callBacks.release = (CFSetReleaseCallBack)_IOObjectCFRelease;
    CFMutableSetRef v6 = CFSetCreateMutable(kCFAllocatorDefault, 0, &callBacks);
    *((void *)v2 + 4) = CFSetCreateMutable(kCFAllocatorDefault, 0, &callBacks);
    id v7 = objc_alloc_init((Class)&off_26D2B4CF0);
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = __29___GCRacingWheelManager_init__block_invoke;
    v29[3] = &unk_26D22C790;
    v9 = v2;
    id v30 = v9;
    CFMutableSetRef v31 = v6;
    v10 = (void (**)(void, void))MEMORY[0x223C6E420](v29);
    if (gc_isInternalBuild())
    {
      v25 = v6;
      v26 = getGCLogger();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_220998000, v26, OS_LOG_TYPE_INFO, "Starting racing wheel support...", buf, 2u);
      }

      CFMutableSetRef v6 = v25;
    }
    CFSetRef v27 = v6;
    v40[0] = @"VendorID";
    v11 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG923VID];
    v41[0] = v11;
    v40[1] = @"ProductID";
    v12 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG923PID_HIDpp];
    v40[2] = @"PrimaryUsage";
    v41[1] = v12;
    v41[2] = &unk_26D2868A0;
    v13 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    ((void (**)(void, void *))v10)[2](v10, v13);

    v38[0] = @"VendorID";
    v14 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG923VID];
    v39[0] = v14;
    v38[1] = @"ProductID";
    v15 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG923PID_Classic];
    v38[2] = @"PrimaryUsage";
    v39[1] = v15;
    v39[2] = &unk_26D2868A0;
    v16 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
    ((void (**)(void, void *))v10)[2](v10, v16);

    v36[0] = @"VendorID";
    v17 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG920VID];
    v37[0] = v17;
    v36[1] = @"ProductID";
    v18 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG920PID];
    v36[2] = @"PrimaryUsage";
    v37[1] = v18;
    v37[2] = &unk_26D2868A0;
    v19 = +[NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    ((void (**)(void, void *))v10)[2](v10, v19);

    v34[0] = @"VendorID";
    v20 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG29VID];
    v35[0] = v20;
    v34[1] = @"ProductID";
    v21 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)GCLogitechG29PID];
    v35[1] = v21;
    v35[2] = &unk_26D2868B8;
    v34[2] = @"PrimaryUsagePage";
    v34[3] = @"PrimaryUsage";
    v35[3] = &unk_26D2868A0;
    v22 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    ((void (**)(void, void *))v10)[2](v10, v22);

    v9[3] = CFSetCreateCopy(kCFAllocatorDefault, v27);
    CFRelease(v27);
    v23 = v9;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)connectedRacingWheels
{
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    id v2 = [v1[5] allValues];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectedWheels, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end