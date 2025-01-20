@interface PrivacyProxyClientWrapper
- (OS_dispatch_queue)queue;
- (PrivacyProxyClientWrapper)initWithDispatchQueue:(id)a3 didUpdate:(id)a4 error:(id *)a5;
- (int)notificationToken;
- (void)dealloc;
- (void)getEffectiveTierWithCompletion:(id)a3;
- (void)setNotificationToken:(int)a3;
- (void)setQueue:(id)a3;
@end

@implementation PrivacyProxyClientWrapper

- (PrivacyProxyClientWrapper)initWithDispatchQueue:(id)a3 didUpdate:(id)a4 error:(id *)a5
{
  v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)PrivacyProxyClientWrapper;
    v10 = [(PrivacyProxyClientWrapper *)&v24 init];
    self = v10;
    if (v10) {
      [(PrivacyProxyClientWrapper *)v10 setQueue:v8];
    }
    objc_initWeak(&location, self);
    v11 = (const char *)[@"com.apple.networkserviceproxy.privacy-proxy-configuration-changed" UTF8String];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_1000337C4;
    v20 = &unk_1001F9C70;
    objc_copyWeak(&v22, &location);
    id v21 = v9;
    uint64_t v12 = notify_register_dispatch(v11, &self->_notificationToken, v8, &v17);
    if (v12)
    {
      if (a5)
      {
        CFStringRef v25 = @"status";
        v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12, v17, v18, v19, v20);
        v26 = v13;
        v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        *a5 = +[NSError errorWithDomain:@"PrivacyProxyUserTierErrorDomain" code:3 userInfo:v14];
      }
      v15 = 0;
    }
    else
    {
      v15 = self;
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"PrivacyProxyUserTierErrorDomain" code:2 userInfo:0];
    v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  notify_cancel(self->_notificationToken);
  v3.receiver = self;
  v3.super_class = (Class)PrivacyProxyClientWrapper;
  [(PrivacyProxyClientWrapper *)&v3 dealloc];
}

- (void)getEffectiveTierWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(PrivacyProxyClientWrapper *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003392C;
  v7[3] = &unk_1001F9C98;
  id v8 = v4;
  id v6 = v4;
  +[PrivacyProxyClient getEffectiveUserTier:v5 completionHandler:v7];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (void).cxx_destruct
{
}

@end