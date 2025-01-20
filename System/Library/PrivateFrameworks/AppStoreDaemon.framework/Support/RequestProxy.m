@interface RequestProxy
- (RequestProxy)init;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)cancelWithErrorHandler:(id)a3;
- (void)startWithErrorHandler:(id)a3;
@end

@implementation RequestProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_broker);
}

- (void)startWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = (id)objc_opt_class();
    id v5 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Starting ... ", buf, 0xCu);
  }
  if (self) {
    request = self->_request;
  }
  else {
    request = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F0B0;
  v8[3] = &unk_100521898;
  id v9 = v4;
  id v7 = v4;
  [(RequestController *)request startUsingProxy:self withErrorHandler:v8];
}

- (RequestProxy)init
{
  return (RequestProxy *)sub_10000F9B8((id *)&self->super.isa, 0, 0, 0);
}

- (void)cancelWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = (id)objc_opt_class();
    id v5 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[%@]: Cancelling ... ", buf, 0xCu);
  }
  if (self) {
    request = self->_request;
  }
  else {
    request = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100262B6C;
  v8[3] = &unk_100521898;
  id v9 = v4;
  id v7 = v4;
  [(RequestController *)request cancelUsingProxy:self withErrorHandler:v8];
}

- (id)remoteObjectProxy
{
  return +[NSNull null];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return +[NSNull null];
}

@end