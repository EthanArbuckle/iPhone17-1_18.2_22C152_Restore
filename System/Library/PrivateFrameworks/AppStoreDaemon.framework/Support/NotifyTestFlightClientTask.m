@interface NotifyTestFlightClientTask
- (void)main;
@end

@implementation NotifyTestFlightClientTask

- (void)main
{
  v3 = [[KeepAlive alloc] initWithName:@"com.apple.appstored.NotifyTestFlightClient"];
  v4 = [TestFlightServiceHost alloc];
  v5 = dispatch_get_global_queue(17, 0);
  v6 = sub_100402D0C((id *)&v4->super.isa, v5);

  v7 = sub_10030B11C();
  if (sub_10030BBA8((id *)v7, @"testflight-extension/extension-enabled", 1))
  {
    uint64_t v8 = sub_100403378((uint64_t)v6);

    if (v8 == 1)
    {
      int64_t installPhase = self->_installPhase;
      switch(installPhase)
      {
        case -40:
          uint64_t v10 = 3;
          break;
        case -20:
          uint64_t v10 = 1;
          break;
        case -30:
          uint64_t v10 = 2;
          break;
        default:
          uint64_t v10 = 0;
          break;
      }
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      char v31 = 0;
      *(void *)buf = 0;
      v23 = buf;
      uint64_t v24 = 0x3032000000;
      v25 = sub_100018388;
      v26 = sub_100017D80;
      id v27 = 0;
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      bundle = self->_bundle;
      installError = self->_installError;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1003A5A28;
      v18[3] = &unk_10052B680;
      v20 = &v28;
      v21 = buf;
      v15 = v12;
      v19 = v15;
      sub_100403EF8((uint64_t)v6, bundle, v10, installError, v18);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      if (*((unsigned char *)v29 + 24))
      {
        [(Task *)self completeWithSuccess];
      }
      else
      {
        v16 = (void *)*((void *)v23 + 5);
        v17 = v16;
        if (!v16)
        {
          v17 = +[NSError errorWithDomain:ASDErrorDomain code:1072 userInfo:0];
        }
        [(Task *)self completeWithError:v17];
        if (!v16) {
      }
        }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v28, 8);
      goto LABEL_21;
    }
  }
  else
  {
  }
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "NotifyTestFlightClient: extension not available. Quitting.", buf, 2u);
  }

  [(Task *)self completeWithSuccess];
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installError, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end