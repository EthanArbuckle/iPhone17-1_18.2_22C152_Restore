@interface IDSDXPCEventReporting
- (IDSDXPCEventReporting)initWithQueue:(id)a3 connection:(id)a4;
- (OS_dispatch_queue)queue;
- (void)reportClientEvent:(id)a3 withCompletion:(id)a4;
- (void)setQueue:(id)a3;
@end

@implementation IDSDXPCEventReporting

- (IDSDXPCEventReporting)initWithQueue:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 hasEntitlement:kIDSEventReportingEntitlement])
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSDXPCEventReporting;
    v9 = [(IDSDXPCEventReporting *)&v14 init];
    v10 = v9;
    if (v9) {
      objc_storeStrong((id *)&v9->_queue, a3);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = +[IMRGLog registration];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Missing Event Reporting entitlement -- failing creation of IDSDXPCRegistration collaborator {connection: %@}", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (void)reportClientEvent:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void, void *))a4;
  id v7 = +[IMRGLog registration];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 reportType];
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reporting client event with type %@", buf, 0xCu);
  }
  v9 = +[IDSDAccountController sharedInstance];
  v10 = +[IDSDServiceController sharedInstance];
  v11 = [v10 serviceWithIdentifier:IDSiMessageKeyTransparencyService];
  v12 = [v9 appleIDAccountOnService:v11];

  if (v12)
  {
    if ((int)[v12 registrationStatus] >= 3)
    {
      v13 = [v12 primaryRegistration];
      objc_super v14 = [v13 registrationCert];

      if (v14) {
        goto LABEL_7;
      }
    }
  }
  v15 = +[IDSDAccountController sharedInstance];
  id v16 = +[IDSDServiceController sharedInstance];
  v17 = [v16 serviceWithIdentifier:IDSMultiplex1KeyTransparencyService];
  uint64_t v18 = [v15 appleIDAccountOnService:v17];

  v12 = (void *)v18;
  if (v18)
  {
LABEL_7:
    v19 = +[IMRGLog registration];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found account! %@", buf, 0xCu);
    }

    [v12 reportClientEvent:v5 completionBlock:v6];
  }
  else
  {
    v20 = +[IMRGLog registration];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to find a usable account", buf, 2u);
    }

    uint64_t v21 = IDSEventReportingManagerErrorDomain;
    NSErrorUserInfoKey v23 = NSDebugDescriptionErrorKey;
    CFStringRef v24 = @"No usable account signed in!";
    v22 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    v12 = +[NSError errorWithDomain:v21 code:100 userInfo:v22];

    v6[2](v6, 0, v12);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end