@interface _GEOExperimentServiceRequester
+ (id)sharedInstance;
- (void)cancelRequest:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5;
@end

@implementation _GEOExperimentServiceRequester

+ (id)sharedInstance
{
  if (qword_100084738 != -1) {
    dispatch_once(&qword_100084738, &stru_1000715E0);
  }
  v2 = (void *)qword_100084740;

  return v2;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = GEOGreenTeaGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO) && [v8 hasGreenTeaWithValue:1]) {
    GEOGreenTeaLog();
  }

  v12 = +[GEOApplicationAuditToken currentProcessAuditToken];
  v13 = +[_GEOExperimentServiceRequestConfig standardConfig];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100010228;
  v15[3] = &unk_100071608;
  id v16 = v9;
  id v14 = v9;
  [(_GEOExperimentServiceRequester *)self _startWithRequest:v8 traits:v10 auditToken:v12 config:v13 throttleToken:0 options:0 completionHandler:v15];
}

- (void)cancelRequest:(id)a3
{
}

@end