@interface DTODRResourceStatus
+ (void)registerCapabilities:(id)a3;
- (id)ODRGetBandwidth;
- (id)ODRPurgeResourcesForBundleIdentifier:(id)a3;
- (id)ODRPurgeTagID:(id)a3 forBundleIdentifier:(id)a4;
- (id)ODRSetBandwidth:(id)a3;
- (id)_uncachedValueForKey:(__CFString *)a3 atURL:(id)a4;
- (id)bundleIDForPID:(int)a3;
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)supportedAttributes;
- (void)_ODRPurgeResourcesForBundleIdentifier:(id)a3 tagID:(id)a4 finishBlock:(id)a5;
- (void)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5 completed:(id)a6;
@end

@implementation DTODRResourceStatus

+ (void)registerCapabilities:(id)a3
{
  id v4 = a3;
  [v4 publishCapability:@"com.apple.xcode.debug-gauge-data-providers.resources" withVersion:1 forClass:a1];
  [v4 publishCapability:@"com.apple.xcode.resource-control" withVersion:1 forClass:a1];
}

- (id)supportedAttributes
{
  if (qword_C920 != -1) {
    dispatch_once(&qword_C920, &stru_8230);
  }
  v2 = (void *)qword_C918;
  return v2;
}

- (id)_uncachedValueForKey:(__CFString *)a3 atURL:(id)a4
{
  CFBundleRef v5 = CFBundleCreate(0, (CFURLRef)a4);
  if (v5)
  {
    v6 = v5;
    _CFBundleFlushBundleCaches();
    v7 = CFBundleGetValueForInfoDictionaryKey(v6, a3);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)bundleIDForPID:(int)a3
{
  if (proc_pidpath(a3, buffer, 0x1000u) >= 1
    && (+[NSString stringWithUTF8String:buffer],
        (uint64_t v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    CFBundleRef v5 = (void *)v4;
    v6 = 0;
    int v7 = -101;
    while ((unint64_t)[v5 length] >= 2 && !v6)
    {
      if (__CFADD__(v7++, 1))
      {
        v6 = 0;
        break;
      }
      v9 = +[NSURL fileURLWithPath:v5];
      if (v9)
      {
        v6 = [(DTODRResourceStatus *)self _uncachedValueForKey:kCFBundleIdentifierKey atURL:v9];
      }
      else
      {
        v6 = 0;
      }
      uint64_t v10 = [v5 stringByDeletingLastPathComponent];

      CFBundleRef v5 = (void *)v10;
      if (!v10) {
        break;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)captureAttributes:(id)a3 toDictionary:(id)a4 forPID:(id)a5 completed:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (void (**)(id, id, void))a6;
  if ([a3 containsObject:@"process.resources[]"])
  {
    id v13 = [v11 intValue];
    if ((int)v13 <= 0)
    {
      v50[0] = @"ODRTag_TagNameKey";
      v50[1] = @"ODRTag_StatusStringKey";
      v51[0] = @"Test Data 1";
      v51[1] = @"Transferring";
      v50[2] = @"ODRTag_StatusKey";
      v36 = +[NSNumber numberWithLong:random() & 7];
      v51[2] = v36;
      v50[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v18 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v35 = +[NSNumber numberWithFloat:v18];
      v50[4] = @"ODRTag_SizeKey";
      v51[3] = v35;
      v51[4] = @"10 KB";
      v34 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:5];
      id v33 = [v34 mutableCopy];
      v52[0] = v33;
      v48[0] = @"ODRTag_TagNameKey";
      v48[1] = @"ODRTag_StatusStringKey";
      v49[0] = @"Test Data 2";
      v49[1] = @"In Use";
      v48[2] = @"ODRTag_StatusKey";
      v32 = +[NSNumber numberWithLong:random() & 7];
      v49[2] = v32;
      v49[3] = &off_8910;
      v48[3] = @"ODRTag_PercentageCompleteKey";
      v48[4] = @"ODRTag_SizeKey";
      v49[4] = @"412 KB";
      v31 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:5];
      id v30 = [v31 mutableCopy];
      v52[1] = v30;
      v46[0] = @"ODRTag_TagNameKey";
      v46[1] = @"ODRTag_StatusStringKey";
      v47[0] = @"Test Data 4";
      v47[1] = @"Transfering";
      v46[2] = @"ODRTag_StatusKey";
      v29 = +[NSNumber numberWithLong:random() & 7];
      v47[2] = v29;
      v46[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v19 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v28 = +[NSNumber numberWithFloat:v19];
      v46[4] = @"ODRTag_SizeKey";
      v47[3] = v28;
      v47[4] = @"35 KB";
      v20 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];
      id v21 = [v20 mutableCopy];
      v52[2] = v21;
      v44[0] = @"ODRTag_TagNameKey";
      v44[1] = @"ODRTag_StatusStringKey";
      v45[0] = @"Test Data 5";
      v45[1] = @"Transferring";
      v44[2] = @"ODRTag_StatusKey";
      v22 = +[NSNumber numberWithLong:random() & 7];
      v45[2] = v22;
      v44[3] = @"ODRTag_PercentageCompleteKey";
      *(float *)&double v23 = (float)((float)rand() * 4.6566e-10) * 100.0;
      v24 = +[NSNumber numberWithFloat:v23];
      v44[4] = @"ODRTag_SizeKey";
      v45[3] = v24;
      v45[4] = @"12 MB";
      v25 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5];
      id v26 = [v25 mutableCopy];
      v52[3] = v26;
      v27 = +[NSArray arrayWithObjects:v52 count:4];

      [v10 setObject:v27 forKeyedSubscript:@"process.resources[]"];
      v12[2](v12, v10, 0);
    }
    else
    {
      v14 = [(DTODRResourceStatus *)self bundleIDForPID:v13];
      if (v14)
      {
        v15 = sub_5410();
        v16 = [v15 remoteObjectProxyWithErrorHandler:&stru_8270];

        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = sub_55AC;
        v42[4] = sub_55BC;
        id v43 = v10;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_55C4;
        block[3] = &unk_82E0;
        id v38 = v16;
        id v39 = v14;
        v41 = v42;
        v40 = v12;
        id v17 = v16;
        dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

        _Block_object_dispose(v42, 8);
      }
    }
  }
  else
  {
    v12[2](v12, 0, 0);
  }
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSDate date];
  v9 = objc_opt_new();
  memset(v26, 0, sizeof(v26));
  if ([v7 countByEnumeratingWithState:v26 objects:v27 count:16])
  {
    uint64_t v10 = **((void **)&v26[0] + 1);
    id v11 = +[NSMutableDictionary dictionaryWithCapacity:32];
    [v11 setObject:v10 forKeyedSubscript:@"pid"];
    [v11 setObject:v8 forKeyedSubscript:@"time"];
    id v12 = objc_alloc_init((Class)DTXRemoteInvocationReceipt);
    dispatch_time_t v13 = dispatch_time(0, 10000000000);
    v14 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_5A88;
    block[3] = &unk_8308;
    id v15 = v12;
    id v25 = v15;
    dispatch_after(v13, v14, block);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_5B5C;
    v20[3] = &unk_8330;
    id v21 = v9;
    uint64_t v22 = v10;
    id v16 = v15;
    id v23 = v16;
    [(DTODRResourceStatus *)self captureAttributes:v6 toDictionary:v11 forPID:v10 completed:v20];
    id v17 = v23;
    id v18 = v16;
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (void)_ODRPurgeResourcesForBundleIdentifier:(id)a3 tagID:(id)a4 finishBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = sub_5410();
  id v11 = [v10 remoteObjectProxyWithErrorHandler:&stru_8350];

  if (v7 && !v8 && v11)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_5E54;
    v17[3] = &unk_8398;
    id v18 = v9;
    [v11 purgeAllTagsInBundleWithID:v7 replyBlock:v17];
    id v12 = v18;
  }
  else if (v7 && v8 && v11)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5E64;
    v15[3] = &unk_8398;
    id v16 = v9;
    [v11 purgeTagWithName:v8 inBundleWithID:v7 replyBlock:v15];
    id v12 = v16;
  }
  else
  {
    if (v11)
    {
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"ODR Purge API called without an TagID or BundleID.";
      dispatch_time_t v13 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v14 = -2;
    }
    else
    {
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      CFStringRef v22 = @"OnDemandD connection invalid.";
      dispatch_time_t v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v14 = -1;
    }
    id v12 = +[NSError errorWithDomain:@"com.apple.dtmobileis.assetcontrol" code:v14 userInfo:v13];

    (*((void (**)(id, void *))v9 + 2))(v9, v12);
  }
}

- (id)ODRPurgeResourcesForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)DTXRemoteInvocationReceipt);
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  id v7 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5FF0;
  block[3] = &unk_83C0;
  id v8 = v5;
  id v17 = v8;
  id v18 = v4;
  id v9 = v4;
  dispatch_after(v6, v7, block);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_60E4;
  v14[3] = &unk_83E8;
  id v10 = v8;
  id v15 = v10;
  [(DTODRResourceStatus *)self _ODRPurgeResourcesForBundleIdentifier:v9 tagID:0 finishBlock:v14];
  id v11 = v15;
  id v12 = v10;

  return v12;
}

- (id)ODRPurgeTagID:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)DTXRemoteInvocationReceipt);
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  id v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6284;
  block[3] = &unk_83C0;
  id v11 = v8;
  id v20 = v11;
  id v21 = v6;
  id v12 = v6;
  dispatch_after(v9, v10, block);

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_6378;
  v17[3] = &unk_83E8;
  id v13 = v11;
  id v18 = v13;
  [(DTODRResourceStatus *)self _ODRPurgeResourcesForBundleIdentifier:v7 tagID:v12 finishBlock:v17];

  uint64_t v14 = v18;
  id v15 = v13;

  return v15;
}

- (id)ODRGetBandwidth
{
  v2 = sub_5410();
  v3 = [v2 remoteObjectProxyWithErrorHandler:&stru_8408];

  id v4 = objc_alloc_init((Class)DTXRemoteInvocationReceipt);
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  id v6 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6520;
  block[3] = &unk_8308;
  id v7 = v4;
  id v15 = v7;
  dispatch_after(v5, v6, block);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_65F4;
  v12[3] = &unk_8450;
  id v8 = v7;
  id v13 = v8;
  [v3 getSimulatedBandwidthWithReply:v12];
  dispatch_time_t v9 = v13;
  id v10 = v8;

  return v10;
}

- (id)ODRSetBandwidth:(id)a3
{
  id v3 = a3;
  id v4 = [v3 unsignedIntegerValue];
  dispatch_time_t v5 = sub_5410();
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_8470];

  id v7 = objc_alloc_init((Class)DTXRemoteInvocationReceipt);
  dispatch_time_t v8 = dispatch_time(0, 10000000000);
  dispatch_time_t v9 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_683C;
  block[3] = &unk_83C0;
  id v10 = v7;
  id v19 = v10;
  id v20 = v3;
  id v11 = v3;
  dispatch_after(v8, v9, block);

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_6930;
  v16[3] = &unk_8450;
  id v12 = v10;
  id v17 = v12;
  [v6 setSimulatedBandwidth:v4 withReply:v16];
  id v13 = v17;
  id v14 = v12;

  return v14;
}

@end