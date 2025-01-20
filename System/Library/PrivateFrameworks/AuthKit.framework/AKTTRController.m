@interface AKTTRController
+ (id)generateRadarRequestFor:(unint64_t)a3;
+ (id)sharedController;
- (AKTTRController)init;
- (BOOL)shouldSuppressPushMessage:(id)a3;
- (void)_performSilentTTRForRequest:(id)a3 completion:(id)a4;
- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4;
- (void)processPushMessage:(id)a3;
- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 completion:(id)a9;
- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 keywords:(id)a5 completion:(id)a6;
- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8;
- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 keywords:(id)a5;
@end

@implementation AKTTRController

+ (id)sharedController
{
  if (qword_100272718[0] != -1) {
    dispatch_once(qword_100272718, &stru_10022B6A8);
  }
  v2 = (void *)qword_100272710;

  return v2;
}

- (AKTTRController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKTTRController;
  return [(AKTTRController *)&v3 init];
}

- (BOOL)shouldSuppressPushMessage:(id)a3
{
  if ([a3 command] != (id)1700) {
    return 0;
  }
  objc_super v3 = +[AKDevice currentDevice];
  unsigned __int8 v4 = [v3 isInternalBuild];

  if (v4) {
    return 0;
  }
  v6 = _AKLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100194D4C();
  }

  return 1;
}

- (void)processPushMessage:(id)a3
{
  id v4 = a3;
  if ([v4 command] == (id)1700)
  {
    v5 = [v4 userInfo];
    v6 = [v5 objectForKeyedSubscript:@"ttrinfo"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v6 objectForKeyedSubscript:@"m"];
      v8 = [v6 objectForKeyedSubscript:@"cn"];
      v9 = [v6 objectForKeyedSubscript:@"cv"];
      v10 = [v6 objectForKeyedSubscript:@"cid"];
      v18 = [v6 objectForKeyedSubscript:@"d"];
      uint64_t v17 = +[NSString stringWithFormat:@"IDMS has triggered TTR for a failure in %@ | %@ (%@) \n Title: %@ \n Message: %@", v8, v9, v10, v7, v18];
      objc_opt_class();
      id v11 = [v6 objectForKeyedSubscript:@"k"];
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      if (v12 && [v12 count])
      {
        v13 = [v12 componentsJoinedByString:@","];
      }
      else
      {
        v13 = &stru_100233250;
      }
      v14 = _AKLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100194DF8((uint64_t)v7, v14);
      }

      if (v7 && v8 && v9 && v10)
      {
        v15 = (void *)v17;
        [(AKTTRController *)self requestTapToRadarWithTitle:v7 message:v17 componentName:v8 componentVersion:v9 componentID:v10 keywords:v13];
      }
      else if (v7)
      {
        v15 = (void *)v17;
        [(AKTTRController *)self requestTapToRadarWithTitle:v7 message:v17 keywords:v13];
      }
      else
      {
        v16 = _AKLogSystem();
        v15 = (void *)v17;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100194D80(v17, v16);
        }
      }
    }
  }
}

- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 keywords:(id)a5
{
}

- (void)requestTapToRadarWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = +[AKDevice currentDevice];
  unsigned __int8 v20 = [v19 isInternalBuild];

  if (v20)
  {
    v21 = objc_alloc_init((Class)NSURLComponents);
    [v21 setScheme:@"tap-to-radar"];
    [v21 setHost:@"new"];
    v22 = +[NSMutableArray array];
    id v23 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:v15];
    [v22 addObject:v23];

    id v24 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:v16];
    [v22 addObject:v24];

    id v25 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:v17];
    [v22 addObject:v25];

    id v26 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Serious Bug"];
    [v22 addObject:v26];

    id v27 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v22 addObject:v27];

    id v28 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"phone"];
    [v22 addObject:v28];

    id v29 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v13];
    [v22 addObject:v29];

    id v30 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:v14];
    [v22 addObject:v30];

    if ([v18 length])
    {
      id v31 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Keywords" value:v18];
      [v22 addObject:v31];
    }
    [v21 setQueryItems:v22];
    v32 = +[LSApplicationWorkspace defaultWorkspace];
    v33 = [v21 URL];
    [v32 openURL:v33 configuration:0 completionHandler:&stru_10022B6C8];
  }
  else
  {
    v21 = _AKLogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100194E70();
    }
  }
}

+ (id)generateRadarRequestFor:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_super v3 = objc_opt_new();
    [v3 setRadarTitle:@"Silent authentication issue detected"];
    [v3 setRadarDescription:@"An issue was encountered while performing silent authentication for your device. Filing this radar will help determine what went wrong."];
    [v3 setComponentName:@"AuthKit"];
    [v3 setComponentID:@"621449"];
    [v3 setComponentVersion:@"All"];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (void)performSilentTTRFor:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = +[AKDevice currentDevice];
  unsigned __int8 v8 = [v7 isInternalBuild];

  if (v8)
  {
    v9 = +[AKTTRController generateRadarRequestFor:a3];
    [(AKTTRController *)self _performSilentTTRForRequest:v9 completion:v6];
  }
  else
  {
    v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100194E70();
    }

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    }
  }
}

- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 keywords:(id)a5 completion:(id)a6
{
}

- (void)requestSilentTTRWithTitle:(id)a3 message:(id)a4 componentName:(id)a5 componentVersion:(id)a6 componentID:(id)a7 keywords:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v22 = +[AKDevice currentDevice];
  unsigned __int8 v23 = [v22 isInternalBuild];

  if (v23)
  {
    id v24 = objc_opt_new();
    [v24 setRadarTitle:v15];
    [v24 setRadarDescription:v16];
    [v24 setComponentName:v17];
    [v24 setComponentID:v19];
    [v24 setComponentVersion:v18];
    [v24 setKeywords:v20];
    [(AKTTRController *)self _performSilentTTRForRequest:v24 completion:v21];
  }
  else
  {
    id v25 = _AKLogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100194E70();
    }

    if (v21) {
      (*((void (**)(id, void, void))v21 + 2))(v21, 0, 0);
    }
  }
}

- (void)_performSilentTTRForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void (**)(void, void, void))v6;
  if (v5)
  {
    unsigned __int8 v8 = objc_opt_new();
    if (objc_opt_respondsToSelector())
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000D120C;
      v10[3] = &unk_100228DD8;
      id v11 = v7;
      [v8 silentTapToRadarWithRequest:v5 completion:v10];
    }
    else if (v7)
    {
      v9 = +[NSError errorWithDomain:AKSilentTTRErrorDomain code:4 userInfo:0];
      ((void (**)(void, void, void *))v7)[2](v7, 0, v9);
    }
    goto LABEL_8;
  }
  if (v6)
  {
    unsigned __int8 v8 = +[NSError errorWithDomain:AKSilentTTRErrorDomain code:3 userInfo:0];
    ((void (**)(void, void, void *))v7)[2](v7, 0, v8);
LABEL_8:
  }
}

@end