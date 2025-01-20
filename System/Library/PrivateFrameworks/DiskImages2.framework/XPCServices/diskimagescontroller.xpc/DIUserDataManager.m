@interface DIUserDataManager
- (BOOL)embedWithError:(id *)a3;
- (BOOL)retrieveWithError:(id *)a3;
- (DIUserDataManager)initWithParams:(id)a3;
- (DIUserDataParams)userDataParams;
- (void)setUserDataParams:(id)a3;
@end

@implementation DIUserDataManager

- (DIUserDataManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIUserDataManager;
  v6 = [(DIUserDataManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_userDataParams, a3);
  }

  return v7;
}

- (BOOL)embedWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v25 = 0;
    v6 = sub_1000D848C();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v27 = 36;
    __int16 v28 = 2080;
    v29 = "-[DIUserDataManager embedWithError:]";
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
      int v27 = 36;
      __int16 v28 = 2080;
      v29 = "-[DIUserDataManager embedWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }
  *__error() = v5;
  objc_super v9 = [(DIUserDataManager *)self userDataParams];
  v10 = [v9 diskImageParamsXPC];
  unsigned __int8 v11 = [v10 lockBackendsWithError:a3];

  if ((v11 & 1) == 0) {
    return 0;
  }
  v12 = [(DIUserDataManager *)self userDataParams];
  v13 = [v12 diskImageParamsXPC];
  v14 = [(DIUserDataManager *)self userDataParams];
  v15 = [v14 shadowChain];
  id v16 = [v15 shouldValidate];
  if (v13) {
    [v13 createDiskImageWithCache:0 shadowValidation:v16];
  }
  else {
    uint64_t v25 = 0;
  }

  v18 = [(DIUserDataManager *)self userDataParams];
  v19 = [v18 userDict];
  (*(void (**)(uint64_t, void *))(*(void *)v25 + 112))(v25, v19);

  int v20 = *__error();
  if (sub_1000D850C())
  {
    v21 = sub_1000D848C();
    os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v27 = 36;
    __int16 v28 = 2080;
    v29 = "-[DIUserDataManager embedWithError:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }
  else
  {
    v23 = sub_1000D848C();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v27 = 36;
      __int16 v28 = 2080;
      v29 = "-[DIUserDataManager embedWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%.*s: User data embedding passed", buf, 0x12u);
    }
  }
  *__error() = v20;
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
  }
  return 1;
}

- (BOOL)retrieveWithError:(id *)a3
{
  int v4 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v30 = 0;
    int v5 = sub_1000D848C();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v32 = 39;
    __int16 v33 = 2080;
    v34 = "-[DIUserDataManager retrieveWithError:]";
    LODWORD(v28) = 18;
    int v27 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf(__stderrp, "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    v7 = sub_1000D848C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v32 = 39;
      __int16 v33 = 2080;
      v34 = "-[DIUserDataManager retrieveWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s: entry", buf, 0x12u);
    }
  }
  *__error() = v4;
  v8 = [(DIUserDataManager *)self userDataParams];
  objc_super v9 = [v8 diskImageParamsXPC];
  v10 = [(DIUserDataManager *)self userDataParams];
  unsigned __int8 v11 = [v10 shadowChain];
  id v12 = [v11 shouldValidate];
  if (v9) {
    [v9 createDiskImageWithCache:0 shadowValidation:v12];
  }
  else {
    uint64_t v30 = 0;
  }

  (*(void (**)(CFTypeRef *__return_ptr))(*(void *)v30 + 104))(&cf);
  v13 = (void *)cf;
  CFRetain(cf);
  v14 = [(DIUserDataManager *)self userDataParams];
  [v14 setUserDict:v13];

  int v15 = *__error();
  if (sub_1000D850C())
  {
    id v16 = sub_1000D848C();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    v17 = [(DIUserDataManager *)self userDataParams];
    v18 = [v17 userDict];
    unsigned int v19 = [v18 count];
    *(_DWORD *)buf = 68158210;
    int v32 = 39;
    __int16 v33 = 2080;
    v34 = "-[DIUserDataManager retrieveWithError:]";
    __int16 v35 = 1024;
    unsigned int v36 = v19;
    int v20 = (char *)_os_log_send_and_compose_impl();

    if (v20)
    {
      fprintf(__stderrp, "%s\n", v20);
      free(v20);
    }
  }
  else
  {
    v21 = sub_1000D848C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [(DIUserDataManager *)self userDataParams];
      v23 = [v22 userDict];
      unsigned int v24 = [v23 count];
      *(_DWORD *)buf = 68158210;
      int v32 = 39;
      __int16 v33 = 2080;
      v34 = "-[DIUserDataManager retrieveWithError:]";
      __int16 v35 = 1024;
      unsigned int v36 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%.*s: User data retrieving passed, %d value(s) found", buf, 0x18u);
    }
  }
  *__error() = v15;
  sub_10000D758(&cf);
  uint64_t v25 = v30;
  uint64_t v30 = 0;
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
  }
  return 1;
}

- (DIUserDataParams)userDataParams
{
  return self->_userDataParams;
}

- (void)setUserDataParams:(id)a3
{
}

- (void).cxx_destruct
{
}

@end