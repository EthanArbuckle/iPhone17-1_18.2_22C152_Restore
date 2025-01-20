@interface AppleProxNotificationTTR
+ (id)notBefore;
+ (id)sharedInstance;
+ (void)cancelNotificationTTR;
+ (void)sendNotificationTTR;
+ (void)setNotBefore:(id)a3;
- (AppleProxNotificationTTR)init;
- (OS_dispatch_queue)ttrQueue;
- (__CFRunLoopSource)source;
- (__CFUserNotification)notification;
- (void)cancelNotification;
- (void)processNotificationResponse:(unint64_t)a3;
- (void)releaseNotification;
- (void)sendNotification;
- (void)setNotification:(__CFUserNotification *)a3;
- (void)setSource:(__CFRunLoopSource *)a3;
- (void)setTtrQueue:(id)a3;
@end

@implementation AppleProxNotificationTTR

+ (id)sharedInstance
{
  if (qword_19C18 != -1) {
    dispatch_once(&qword_19C18, &stru_14690);
  }
  v2 = (void *)qword_19C10;

  return v2;
}

+ (void)sendNotificationTTR
{
  id v2 = [a1 sharedInstance];
  [v2 sendNotification];
}

+ (void)cancelNotificationTTR
{
  id v2 = [a1 sharedInstance];
  [v2 cancelNotification];
}

+ (id)notBefore
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 dictionaryForKey:v4];

  v6 = [v5 objectForKeyedSubscript:@"NotBefore"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
  }
  else
  {
    id v7 = +[NSDate distantPast];
  }
  v8 = v7;

  return v8;
}

+ (void)setNotBefore:(id)a3
{
  id v3 = a3;
  v4 = +[NSUserDefaults standardUserDefaults];
  CFStringRef v8 = @"NotBefore";
  id v9 = v3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v4 setObject:v5 forKey:v7];
}

- (AppleProxNotificationTTR)init
{
  v15.receiver = self;
  v15.super_class = (Class)AppleProxNotificationTTR;
  id v2 = [(AppleProxNotificationTTR *)&v15 init];
  if (!v2)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.hid.AppleProxSupport.TTR", 0);
  ttrQueue = v2->_ttrQueue;
  v2->_ttrQueue = (OS_dispatch_queue *)v3;

  if (!v2->_ttrQueue)
  {
    v6 = LoggingProx();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_D478(v6, v7, v8, v9, v10, v11, v12, v13);
    }

    goto LABEL_7;
  }
  v5 = v2;
LABEL_8:

  return v5;
}

- (void)sendNotification
{
  if (MGGetBoolAnswer())
  {
    dispatch_queue_t v3 = [(id)objc_opt_class() notBefore];
    v4 = +[NSDate now];
    v5 = (char *)[v3 compare:v4];

    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      v6 = LoggingProx();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_D4B0((uint64_t)v3, v6);
      }
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
      [v7 setNotBefore:v8];

      if (![(AppleProxNotificationTTR *)self notification])
      {
        v16 = LoggingProx();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Sending UserNotification for TTR", buf, 2u);
        }

        ttrQueue = self->_ttrQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_57DC;
        block[3] = &unk_146B8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)ttrQueue, block);
        goto LABEL_9;
      }
      v6 = LoggingProx();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_D528(v6, v9, v10, v11, v12, v13, v14, v15);
      }
    }

LABEL_9:
  }
}

- (void)cancelNotification
{
  dispatch_queue_t v3 = LoggingProx();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Cancel UserNotification for TTR", buf, 2u);
  }

  ttrQueue = self->_ttrQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5B54;
  block[3] = &unk_146B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)ttrQueue, block);
}

- (void)releaseNotification
{
  if (self->_source)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_source, kCFRunLoopCommonModes);
    CFRelease(self->_source);
    self->_source = 0;
  }
  notification = self->_notification;
  if (notification)
  {
    CFRelease(notification);
    self->_notification = 0;
  }
}

- (void)processNotificationResponse:(unint64_t)a3
{
  v5 = LoggingProx();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Processing UserNotification for TTR (%d)", buf, 8u);
  }

  ttrQueue = self->_ttrQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5D00;
  v7[3] = &unk_146E0;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async((dispatch_queue_t)ttrQueue, v7);
}

- (OS_dispatch_queue)ttrQueue
{
  return self->_ttrQueue;
}

- (void)setTtrQueue:(id)a3
{
}

- (__CFUserNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(__CFUserNotification *)a3
{
  self->_notification = a3;
}

- (__CFRunLoopSource)source
{
  return self->_source;
}

- (void)setSource:(__CFRunLoopSource *)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
}

@end