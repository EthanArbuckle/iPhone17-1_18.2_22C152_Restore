@interface StewieCLGPSDisablementAssertion
- (StewieCLGPSDisablementAssertion)initWithQueue:(id)a3 callback:(void *)a4;
- (id).cxx_construct;
- (void)handleCLGDADict:(id)a3;
@end

@implementation StewieCLGPSDisablementAssertion

- (StewieCLGPSDisablementAssertion)initWithQueue:(id)a3 callback:(void *)a4
{
  id v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)StewieCLGPSDisablementAssertion;
  if ([(StewieCLGPSDisablementAssertion *)&v8 init])
  {
    ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)location, kCtLoggingSystemName, "stw.gda");
    operator new();
  }

  return 0;
}

- (void)handleCLGDADict:(id)a3
{
  v4 = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->fQueue);
  unsigned __int8 v10 = 0;
  if (!sub_100215578(v4, @"kCLGDA_AssertionCompleteStatusKey", &v10))
  {
    id v5 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v12 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Status missing in received dict: %@", buf, 0xCu);
    }
  }
  v6 = sub_100200FB4((id *)self->fLogger.__ptr_.__value_);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  int v8 = v10;
  if (v7)
  {
    CFStringRef v9 = @"YES";
    if (!v10) {
      CFStringRef v9 = @"NO";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#I Assertion granted: %@", buf, 0xCu);
  }

  sub_1000607A8((uint64_t)&self->fCallback, v8 != 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fAssertion, 0);
  sub_100060644(self->fCallback.__f_.__buf_.__lx);
  objc_storeStrong((id *)&self->fQueue, 0);

  sub_100119D1C((ctu::OsLogLogger **)&self->fLogger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 6) = 0;
  return self;
}

@end