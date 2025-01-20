@interface DIController2ClientDelegate
- (DIDeviceHandle)deviceHandle;
- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4;
- (void)setDeviceHandle:(id)a3;
@end

@implementation DIController2ClientDelegate

- (void)attachCompletedWithHandle:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  int v8 = *__error();
  if (sub_1000D850C())
  {
    v18[1] = 0;
    v9 = sub_1000D848C();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v20 = 63;
    __int16 v21 = 2080;
    v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
    __int16 v23 = 2114;
    id v24 = v6;
    LODWORD(v17) = 28;
    v16 = buf;
    v10 = (char *)_os_log_send_and_compose_impl();

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000D848C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v20 = 63;
      __int16 v21 = 2080;
      v22 = "-[DIController2ClientDelegate attachCompletedWithHandle:reply:]";
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Received: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v8;
  v12 = [v6 xpcEndpoint];

  if (v12)
  {
    v18[0] = 0;
    unsigned __int8 v13 = [v6 addToRefCountWithError:v18];
    id v14 = v18[0];
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      v7[2](v7, v14);

      goto LABEL_12;
    }
  }
  -[DIController2ClientDelegate setDeviceHandle:](self, "setDeviceHandle:", v6, v16, v17);
  v7[2](v7, 0);
LABEL_12:
}

- (DIDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (void)setDeviceHandle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end