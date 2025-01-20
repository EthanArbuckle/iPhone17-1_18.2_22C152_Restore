@interface ICSCarPlayServicesController
- (BOOL)allowsBanners;
- (CRSInCallAssertion)assertion;
- (void)acquireAssertionWithActivation:(BOOL)a3;
- (void)invalidateAssertion;
- (void)setAllowsBanners:(BOOL)a3;
- (void)setAssertion:(id)a3;
@end

@implementation ICSCarPlayServicesController

- (void)acquireAssertionWithActivation:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(ICSCarPlayServicesController *)self assertion];
  if (v5) {
    int v6 = v3;
  }
  else {
    int v6 = 1;
  }

  v7 = [(ICSCarPlayServicesController *)self assertion];

  if (!v7)
  {
    v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Acquiring and activating CarPlay assertion", (uint8_t *)&v13, 2u);
    }

    id v9 = [objc_alloc((Class)CRSInCallAssertion) initWithReason:@"incoming call"];
    [(ICSCarPlayServicesController *)self setAssertion:v9];
  }
  v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(ICSCarPlayServicesController *)self assertion];
    int v13 = 138412290;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v13, 0xCu);
  }
  if (v6)
  {
    v12 = [(ICSCarPlayServicesController *)self assertion];
    [v12 activate];
  }
}

- (void)invalidateAssertion
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(ICSCarPlayServicesController *)self assertion];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating CarPlay assertion: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(ICSCarPlayServicesController *)self assertion];
  [v5 invalidate];

  [(ICSCarPlayServicesController *)self setAssertion:0];
}

- (void)setAllowsBanners:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting banners allowed %d on CarPlay assertion", (uint8_t *)v7, 8u);
  }

  int v6 = [(ICSCarPlayServicesController *)self assertion];
  [v6 setAllowsBanners:v3];
}

- (BOOL)allowsBanners
{
  return self->_allowsBanners;
}

- (CRSInCallAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end