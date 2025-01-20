@interface _GEOLocationShiftRequester
- (_GEOLocationShiftRequester)init;
- (id)_validateResponse:(id)a3;
- (void)cancelRequest:(id)a3;
- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6;
@end

@implementation _GEOLocationShiftRequester

- (_GEOLocationShiftRequester)init
{
  v6.receiver = self;
  v6.super_class = (Class)_GEOLocationShiftRequester;
  v2 = [(_GEOLocationShiftRequester *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)startWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = +[_GEOLocationShiftRequestConfig standardConfig];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002791C;
  v16[3] = &unk_100071608;
  id v17 = v10;
  id v15 = v10;
  [(_GEOLocationShiftRequester *)self _startWithRequest:v13 traits:v12 auditToken:v11 config:v14 throttleToken:0 options:0 completionHandler:v16];
}

- (void)cancelRequest:(id)a3
{
}

- (id)_validateResponse:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 status];
  if (v4 == 1) {
    goto LABEL_5;
  }
  if (v4)
  {
    uint64_t v5 = +[NSError GEOErrorWithCode:-7];
    goto LABEL_7;
  }
  if ((unint64_t)[v3 parametersCount] > 8)
  {
LABEL_5:
    objc_super v6 = 0;
    goto LABEL_8;
  }
  uint64_t v5 = +[NSError GEOErrorWithCode:-11 reason:@"Response contains too few parameters"];
LABEL_7:
  objc_super v6 = (void *)v5;
LABEL_8:

  return v6;
}

@end