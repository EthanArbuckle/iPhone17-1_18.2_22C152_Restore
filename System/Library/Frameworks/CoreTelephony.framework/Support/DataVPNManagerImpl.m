@interface DataVPNManagerImpl
+ (BOOL)connectedState:(unint64_t)a3;
- (DataVPNManagerImpl)initWithCallback:(function<void)(BOOL;
- (NEVPNConnectivityManager)_vpnConnectivityManager;
- (id).cxx_construct;
- (void)connectivityManagerDidChange:(id)a3;
- (void)set_vpnConnectivityManager:(id)a3;
@end

@implementation DataVPNManagerImpl

- (DataVPNManagerImpl)initWithCallback:(function<void)(BOOL
{
  v9.receiver = self;
  v9.super_class = (Class)DataVPNManagerImpl;
  v4 = [(DataVPNManagerImpl *)&v9 init];
  if (v4)
  {
    sub_100323990((uint64_t)buf, (uint64_t)a3);
    p_callback = &v4->_callback;
    if (buf != (uint8_t *)&v4->_callback)
    {
      v6 = v11;
      f = (function<void (BOOL, BOOL)> *)v4->_callback.__f_.__f_;
      if (v11 == buf)
      {
        if (f == p_callback)
        {
          memset(v12, 0, sizeof(v12));
          (*(void (**)(uint8_t *, void *))(*(void *)buf + 24))(buf, v12);
          (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
          v11 = 0;
          (*(void (**)(void *, uint8_t *))(*(void *)v4->_callback.__f_.__f_ + 24))(v4->_callback.__f_.__f_, buf);
          (*(void (**)(void *))(*(void *)v4->_callback.__f_.__f_ + 32))(v4->_callback.__f_.__f_);
          v4->_callback.__f_.__f_ = 0;
          v11 = buf;
          (*(void (**)(void *, function<void (BOOL, BOOL)> *))(v12[0] + 24))(v12, &v4->_callback);
          (*(void (**)(void *))(v12[0] + 32))(v12);
        }
        else
        {
          (*(void (**)(uint8_t *, function<void (BOOL, BOOL)> *))(*(void *)buf + 24))(buf, &v4->_callback);
          (*(void (**)(uint8_t *))(*(void *)v11 + 32))(v11);
          v11 = (uint8_t *)v4->_callback.__f_.__f_;
        }
        v4->_callback.__f_.__f_ = p_callback;
      }
      else if (f == p_callback)
      {
        (*(void (**)(function<void (BOOL, BOOL)> *, uint8_t *))(*(void *)p_callback->__f_.__buf_.__lx + 24))(&v4->_callback, buf);
        (*(void (**)(void *))(*(void *)v4->_callback.__f_.__f_ + 32))(v4->_callback.__f_.__f_);
        v4->_callback.__f_.__f_ = v11;
        v11 = buf;
      }
      else
      {
        v11 = (uint8_t *)v4->_callback.__f_.__f_;
        v4->_callback.__f_.__f_ = v6;
      }
    }
    sub_1000605C0(buf);
    operator new();
  }
  return 0;
}

+ (BOOL)connectedState:(unint64_t)a3
{
  return a3 - 1 < 2;
}

- (void)connectivityManagerDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 connectivityState];
  unsigned __int8 v6 = [v4 usesPolicyBasedRouting];
  unsigned __int8 v7 = +[DataVPNManagerImpl connectedState:v5];
  v8 = *(NSObject **)self->_logger.__ptr_.__value_;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = asStringBool(v7);
    __int16 v11 = 1024;
    int v12 = (int)v5;
    __int16 v13 = 2080;
    uint64_t v14 = asStringBool(v6);
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#I VPN connectivity: %s (%d), usesPolicyBasedRouting: %s", (uint8_t *)&v9, 0x1Cu);
  }
  sub_10006074C((uint64_t)&self->_callback, v7, v6);
}

- (NEVPNConnectivityManager)_vpnConnectivityManager
{
  return self->__vpnConnectivityManager;
}

- (void)set_vpnConnectivityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__vpnConnectivityManager, 0);
  sub_1000605C0(self->_callback.__f_.__buf_.__lx);

  sub_100119D1C((ctu::OsLogLogger **)&self->_logger, 0);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end