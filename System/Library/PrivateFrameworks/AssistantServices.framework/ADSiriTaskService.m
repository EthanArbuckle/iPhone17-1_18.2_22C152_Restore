@interface ADSiriTaskService
- (ADSiriTaskService)initWithCommandType:(id)a3 requestTransformer:(id)a4 responseTransformer:(id)a5 requestHandler:(id)a6;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)requestCommandAceType;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
@end

@implementation ADSiriTaskService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_responseTransformer, 0);
  objc_storeStrong((id *)&self->_requestTransformer, 0);
  objc_storeStrong((id *)&self->_commandType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)requestCommandAceType
{
  return self->_commandType;
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = AFSiriLogContextService;
  if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[ADSiriTaskService handleCommand:forDomain:executionContext:reply:]";
    __int16 v23 = 2112;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s %@ handling %@", buf, 0x20u);
  }
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100270F4C;
  v17[3] = &unk_10050E228;
  v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  id v20 = v11;
  id v14 = v10;
  id v15 = v11;
  id v16 = v9;
  dispatch_async(queue, v17);
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  id v6 = a3;
  commandType = self->_commandType;
  id v8 = a4;
  id v9 = [(ADServiceCommandType *)commandType domainName];
  LODWORD(commandType) = [v8 isEqualToString:v9];

  if (commandType)
  {
    id v10 = [(ADServiceCommandType *)self->_commandType className];
    unsigned __int8 v11 = [v6 isEqualToString:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (id)commandsForDomain:(id)a3
{
  commandType = self->_commandType;
  id v5 = a3;
  id v6 = [(ADServiceCommandType *)commandType domainName];
  unsigned int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    id v8 = [(ADServiceCommandType *)self->_commandType className];
    unsigned __int8 v11 = v8;
    id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    id v9 = &__NSArray0__struct;
  }
  return v9;
}

- (id)domains
{
  v2 = [(ADServiceCommandType *)self->_commandType domainName];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4
{
  id v5 = a3;
  id v6 = [a4 launchId];
  [v5 willProcessAppLaunchWithBundleIdentifier:v6];
  objc_initWeak(&location, v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002718BC;
  v10[3] = &unk_10050AF18;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v7 = v6;
  id v8 = objc_retainBlock(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

- (ADSiriTaskService)initWithCommandType:(id)a3 requestTransformer:(id)a4 responseTransformer:(id)a5 requestHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)ADSiriTaskService;
  id v15 = [(ADSiriTaskService *)&v31 init];
  if (v15)
  {
    id v16 = objc_alloc((Class)NSString);
    [v11 qualifiedCommandName];
    v17 = id v30 = v12;
    id v18 = [v16 initWithFormat:@"SiriTaskService-%@", v17];

    id v19 = v18;
    id v20 = (const char *)[v19 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v29 = v11;
    id v21 = v14;
    __int16 v23 = v22 = v13;
    dispatch_queue_t v24 = dispatch_queue_create(v20, v23);

    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v15->_commandType, a3);
    objc_storeStrong((id *)&v15->_requestTransformer, a4);
    objc_storeStrong((id *)&v15->_responseTransformer, a5);
    objc_storeStrong((id *)&v15->_requestHandler, a6);
    id v26 = [(ADServiceCommandType *)v15->_commandType qualifiedCommandName];
    v27 = [@"SiriTaskService-" stringByAppendingString:v26];
    [(ADService *)v15 setIdentifier:v27];

    id v13 = v22;
    id v14 = v21;
    id v11 = v29;

    id v12 = v30;
  }

  return v15;
}

@end