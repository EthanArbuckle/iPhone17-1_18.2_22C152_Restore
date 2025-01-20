@interface DIVerifyManager
- (BOOL)runWithError:(id *)a3;
- (DIVerifyManager)initWithParams:(id)a3;
- (DIVerifyParams)verifyParams;
- (void)setVerifyParams:(id)a3;
@end

@implementation DIVerifyManager

- (DIVerifyManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIVerifyManager;
  v6 = [(DIVerifyManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_verifyParams, a3);
  }

  return v7;
}

- (BOOL)runWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000D850C())
  {
    __p = 0;
    v6 = sub_1000D848C();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 32;
    __int16 v25 = 2080;
    v26 = "-[DIVerifyManager runWithError:]";
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    v8 = sub_1000D848C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 32;
      __int16 v25 = 2080;
      v26 = "-[DIVerifyManager runWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }
  *__error() = v5;
  objc_super v9 = [(DIVerifyManager *)self verifyParams];
  v10 = [v9 diskImageParamsXPC];
  v11 = [(DIVerifyManager *)self verifyParams];
  v12 = [v11 shadowChain];
  id v13 = [v12 shouldValidate];
  if (v10) {
    [v10 createDiskImageWithCache:0 shadowValidation:v13];
  }
  else {
    uint64_t v19 = 0;
  }

  sub_100004890(&__p, "DI Verify Queue");
  sub_100055B5C(buf);
  if (v23 < 0) {
    operator delete(__p);
  }
  char v14 = (*(uint64_t (**)(uint64_t, uint8_t *, void))(*(void *)v19 + 56))(v19, buf, 0);
  if (v14)
  {
    int v15 = *__error();
    if (sub_1000D850C())
    {
      uint64_t v16 = sub_1000D848C();
      os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT);
      __p = (void *)0x2004100202;
      __int16 v21 = 2080;
      v22 = "-[DIVerifyManager runWithError:]";
      v17 = (char *)_os_log_send_and_compose_impl();

      if (v17)
      {
        fprintf(__stderrp, "%s\n", v17);
        free(v17);
      }
    }
    else
    {
      uint64_t v16 = sub_1000D848C();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
      {
        __p = (void *)0x2004100202;
        __int16 v21 = 2080;
        v22 = "-[DIVerifyManager runWithError:]";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "%.*s: Verify passed", (uint8_t *)&__p, 0x12u);
      }
    }
    *__error() = v15;
  }
  else
  {
    LOBYTE(v16) = +[DIError failWithEnumValue:152 description:@"Disk image verification failed" error:a3];
  }
  __p = &v28;
  sub_10000F9FC((void ***)&__p);
  if (v27 < 0) {
    operator delete(*(void **)buf);
  }
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
  }
  return (v14 | v16) & 1;
}

- (DIVerifyParams)verifyParams
{
  return self->_verifyParams;
}

- (void)setVerifyParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end