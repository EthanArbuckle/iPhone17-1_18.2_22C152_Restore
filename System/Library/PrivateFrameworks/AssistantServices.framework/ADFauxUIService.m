@interface ADFauxUIService
- (ADFauxUIService)init;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (void)_appPunchOutHandler:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)_unhandledCommand:(id)a3 error:(id)a4 forDomain:(id)a5 completion:(id)a6;
- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADFauxUIService

- (void).cxx_destruct
{
}

- (void)_unhandledCommand:(id)a3 error:(id)a4 forDomain:(id)a5 completion:(id)a6
{
  if (a6)
  {
    id v8 = a6;
    id v9 = a4;
    id v10 = [objc_alloc((Class)SACommandFailed) initWithReason:@"Command not supported "];
    (*((void (**)(id, id, id))a6 + 2))(v8, v10, v9);
  }
}

- (void)_unhandledCommand:(id)a3 forDomain:(id)a4 completion:(id)a5
{
}

- (void)_appPunchOutHandler:(id)a3 forDomain:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id, void))a5;
  id v19 = v8;
  v11 = [v19 punchOutUri];
  v12 = [v11 absoluteString];
  id v13 = [v12 length];

  if (!v13) {
    goto LABEL_10;
  }
  id v14 = [objc_alloc((Class)TUDialRequest) initWithURL:v11];
  if (([v14 isValid] & 1) == 0)
  {

LABEL_10:
    goto LABEL_11;
  }

  if (!v14)
  {
LABEL_11:
    [(ADFauxUIService *)self _unhandledCommand:v19 forDomain:v9 completion:v10];
    id v14 = 0;
    goto LABEL_12;
  }
  v15 = [v14 URL];
  unsigned int v16 = sub_1001FC3D8(v15);

  v17 = (Class *)SACommandSucceeded_ptr;
  if (!v16) {
    v17 = (Class *)SACommandFailed_ptr;
  }
  id v18 = objc_alloc_init(*v17);
  if (v10) {
    v10[2](v10, v18, 0);
  }

LABEL_12:
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    unsigned int v16 = [v10 encodedClassName];
    v17 = [v10 groupIdentifier];
    *(_DWORD *)buf = 136315650;
    v30 = "-[ADFauxUIService handleCommand:forDomain:executionContext:reply:]";
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s Dispatching command (%@) for domain (%@)", buf, 0x20u);
  }
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002AE8D0;
  block[3] = &unk_10050D3F0;
  id v24 = v10;
  v25 = self;
  id v27 = v12;
  id v28 = v13;
  id v26 = v11;
  id v19 = v12;
  id v20 = v13;
  id v21 = v11;
  id v22 = v10;
  dispatch_async(serialQueue, block);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  return 1;
}

- (id)commandsForDomain:(id)a3
{
  uint64_t v3 = SAUIGroupIdentifier;
  if ([a3 isEqualToString:SAUIGroupIdentifier])
  {
    uint64_t v6 = v3;
    v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)domains
{
  uint64_t v4 = SAUIGroupIdentifier;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (ADFauxUIService)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADFauxUIService;
  v2 = [(ADFauxUIService *)&v9 init];
  if (v2)
  {
    uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Faux UI Service Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(ADService *)v2 setIdentifier:v7];
  }
  return v2;
}

@end