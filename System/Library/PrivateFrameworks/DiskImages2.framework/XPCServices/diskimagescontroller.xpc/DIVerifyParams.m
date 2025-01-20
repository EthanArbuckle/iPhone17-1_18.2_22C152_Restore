@interface DIVerifyParams
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldValidateShadows;
- (BOOL)verifyWithError:(id *)a3;
- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4;
- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5;
- (void)setShouldValidateShadows:(BOOL)a3;
@end

@implementation DIVerifyParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIVerifyParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSArray array];
  v8 = [(DIVerifyParams *)self initWithURL:v6 shadowURLs:v7 error:a4];

  return v8;
}

- (DIVerifyParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)DIVerifyParams;
  v9 = [(DIBaseParams *)&v15 initWithURL:a3 error:a5];
  v10 = v9;
  if (!v9
    || [(DIBaseParams *)v9 openExistingImageWithFlags:0 error:a5]
    && ([(DIBaseParams *)v10 shadowChain],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v11 addShadowURLs:v8 error:a5],
        v11,
        v12))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)shouldValidateShadows
{
  v2 = [(DIBaseParams *)self shadowChain];
  unsigned __int8 v3 = [v2 shouldValidate];

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DIBaseParams *)self shadowChain];
  [v4 setShouldValidate:v3];
}

- (BOOL)verifyWithError:(id *)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_10009F624;
  v17 = sub_10009F634;
  v18 = objc_alloc_init(DIClient2Controller_XPCHandler);
  int v5 = *__error();
  if (sub_1000D850C())
  {
    v12[5] = 0;
    id v6 = sub_1000D848C();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    int v20 = 34;
    __int16 v21 = 2080;
    v22 = "-[DIVerifyParams verifyWithError:]";
    __int16 v23 = 2114;
    v24 = self;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    id v8 = sub_1000D848C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      int v20 = 34;
      __int16 v21 = 2080;
      v22 = "-[DIVerifyParams verifyWithError:]";
      __int16 v23 = 2114;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v5;
  if (([(id)v14[5] connectWithError:a3] & 1) != 0
    && [(DIBaseParams *)self prepareImageWithXpcHandler:v14[5] fileMode:2 error:a3])
  {
    v9 = [(id)v14[5] remoteProxy];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10009F63C;
    v12[3] = &unk_1001A1BD8;
    v12[4] = &v13;
    [v9 verifyWithParams:self reply:v12];

    unsigned __int8 v10 = [(id)v14[5] completeCommandWithError:a3];
  }
  else
  {
    unsigned __int8 v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

@end