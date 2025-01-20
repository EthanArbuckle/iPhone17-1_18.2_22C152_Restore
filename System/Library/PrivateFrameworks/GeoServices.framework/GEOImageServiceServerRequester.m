@interface GEOImageServiceServerRequester
+ (GEOImageServiceServerRequester)sharedRequester;
- (void)cancelSimpleImageServiceRequest:(id)a3;
- (void)startSimpleImageServiceRequest:(id)a3 auditToken:(id)a4 finished:(id)a5 networkActivity:(id)a6 error:(id)a7;
@end

@implementation GEOImageServiceServerRequester

+ (GEOImageServiceServerRequester)sharedRequester
{
  if (qword_1000848F0 != -1) {
    dispatch_once(&qword_1000848F0, &stru_100072F10);
  }
  v2 = (void *)qword_1000848E8;

  return (GEOImageServiceServerRequester *)v2;
}

- (void)startSimpleImageServiceRequest:(id)a3 auditToken:(id)a4 finished:(id)a5 networkActivity:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void (**)(id, uint64_t))a6;
  id v16 = a7;
  if (v15) {
    v15[2](v15, 1);
  }
  v17 = +[_GEOImageServiceRequestConfig standardConfig];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10003EAA4;
  v21[3] = &unk_100072F38;
  v22 = v15;
  id v23 = v14;
  id v24 = v16;
  id v18 = v16;
  id v19 = v14;
  v20 = v15;
  [(GEOImageServiceServerRequester *)self _startWithRequest:v12 traits:0 auditToken:v13 config:v17 throttleToken:0 options:0 completionHandler:v21];
}

- (void)cancelSimpleImageServiceRequest:(id)a3
{
}

@end