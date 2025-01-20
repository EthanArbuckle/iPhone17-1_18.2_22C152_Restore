@interface FindMyDeviceUserNotificationsXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)addNotificationRequest:(id)a3 completion:(id)a4;
- (void)removeNotificationWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation FindMyDeviceUserNotificationsXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = sub_100003894();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received new XPC connection %@", buf, 0xCu);
  }

  uint64_t v7 = objc_opt_class();
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FindMyDeviceUserNotificationsXPCInterface];
  [v9 setClasses:v8 forSelector:"addNotificationRequest:completion:" argumentIndex:0 ofReply:1];
  [v5 setExportedInterface:v9];
  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (void)addNotificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100003894();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[FindMyDeviceUserNotificationsXPCServer addNotificationRequest:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", (uint8_t *)&buf, 0xCu);
  }

  v9 = +[NSXPCConnection currentConnection];
  v10 = [v9 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceUserNotificationsXPCService.access"];

  if (v10 && ([&__kCFBooleanTrue isEqual:v10] & 1) != 0)
  {
    v11 = [v6 locationTitle];

    if (v11)
    {
      id v12 = objc_alloc((Class)CLLocation);
      [v6 latitude];
      double v14 = v13;
      [v6 longitude];
      id v16 = [v12 initWithLatitude:v14 longitude:v15];
      id v17 = objc_alloc_init((Class)CLGeocoder);
      v18 = dispatch_group_create();
      dispatch_group_enter(v18);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v50 = 0x3032000000;
      v51 = sub_100002DC4;
      v52 = sub_100002DD4;
      id v53 = 0;
      v19 = sub_100003894();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v45 = 138412290;
        id v46 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "geocoding for location = %@", v45, 0xCu);
      }

      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100002DDC;
      v42[3] = &unk_100008C00;
      p_long long buf = &buf;
      v20 = v18;
      v43 = v20;
      [v17 reverseGeocodeLocation:v16 completionHandler:v42];
      dispatch_time_t v21 = dispatch_time(0, 10000000000);
      intptr_t v22 = dispatch_group_wait(v20, v21);
      if (v22 || !*(void *)(*((void *)&buf + 1) + 40))
      {
        v23 = sub_100003894();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v45 = 138412546;
          id v46 = v16;
          __int16 v47 = 2048;
          intptr_t v48 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "unable to get placemark for %@ %ld", v45, 0x16u);
        }
      }
      else
      {
        v31 = sub_100003894();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(void **)(*((void *)&buf + 1) + 40);
          v33 = [v32 name];
          *(_DWORD *)v45 = 138412546;
          id v46 = v32;
          __int16 v47 = 2112;
          intptr_t v48 = (intptr_t)v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "reverseGeocodeLocation successful %@ %@", v45, 0x16u);
        }
        v34 = [v6 locationTitle];
        v35 = [*(id *)(*((void *)&buf + 1) + 40) name];
        v36 = [v34 stringByReplacingOccurrencesOfString:@"<location>" withString:v35];
        [v6 setTitle:v36];

        v23 = [v6 locationMessage];
        v37 = [*(id *)(*((void *)&buf + 1) + 40) name];
        v38 = [v23 stringByReplacingOccurrencesOfString:@"<location>" withString:v37];
        [v6 setBody:v38];
      }
      _Block_object_dispose(&buf, 8);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002FE4;
    block[3] = &unk_100008C50;
    v40 = (__CFString *)v6;
    id v41 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    v25 = v40;
  }
  else
  {
    v24 = NSStringFromSelector(a2);
    v25 = +[NSString stringWithFormat:@"Entitlement not found for %@", v24];

    id v26 = objc_alloc((Class)NSError);
    if (v25) {
      CFStringRef v27 = v25;
    }
    else {
      CFStringRef v27 = &stru_10000B588;
    }
    NSErrorUserInfoKey v54 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v55 = v27;
    v28 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    id v29 = [v26 initWithDomain:@"com.apple.icloud.findmydeviced.usernotificationsxpcserver" code:6 userInfo:v28];

    v30 = sub_100003894();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1000049C8((uint64_t)v25, v30);
    }

    if (v7) {
      (*((void (**)(id, id))v7 + 2))(v7, v29);
    }
  }
}

- (void)removeNotificationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  v8 = sub_100003894();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v23 = "-[FindMyDeviceUserNotificationsXPCServer removeNotificationWithIdentifier:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FRAMEWORK API: %s", buf, 0xCu);
  }

  v9 = +[NSXPCConnection currentConnection];
  v10 = [v9 valueForEntitlement:@"com.apple.icloud.FindMyDevice.FindMyDeviceUserNotificationsXPCService.access"];

  if (v10 && ([&__kCFBooleanTrue isEqual:v10] & 1) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000036F0;
    block[3] = &unk_100008C78;
    v19 = (__CFString *)v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v11 = v19;
  }
  else
  {
    id v12 = NSStringFromSelector(a2);
    v11 = +[NSString stringWithFormat:@"Entitlement not found for %@", v12];

    id v13 = objc_alloc((Class)NSError);
    if (v11) {
      CFStringRef v14 = v11;
    }
    else {
      CFStringRef v14 = &stru_10000B588;
    }
    NSErrorUserInfoKey v20 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v21 = v14;
    double v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v16 = [v13 initWithDomain:@"com.apple.icloud.findmydeviced.usernotificationsxpcserver" code:6 userInfo:v15];

    id v17 = sub_100003894();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000049C8((uint64_t)v11, v17);
    }

    if (v7) {
      v7[2](v7, v16);
    }
  }
}

@end