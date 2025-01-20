@interface GEOTransitUpdateServerRequester
+ (GEOTransitUpdateServerRequester)sharedRequester;
- (void)cancelSimpleTransitRouteUpdateRequest:(id)a3;
- (void)startSimpleTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 completion:(id)a6;
@end

@implementation GEOTransitUpdateServerRequester

+ (GEOTransitUpdateServerRequester)sharedRequester
{
  if (qword_100084968 != -1) {
    dispatch_once(&qword_100084968, &stru_100073618);
  }
  v2 = (void *)qword_100084960;

  return (GEOTransitUpdateServerRequester *)v2;
}

- (void)startSimpleTransitRouteUpdateRequest:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t))a5;
  id v13 = a6;
  if (v12) {
    v12[2](v12, 1);
  }
  v14 = +[_GEOTransitRouteUpdateRequestConfig standardConfig];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004AC14;
  v17[3] = &unk_100073640;
  v18 = v12;
  id v19 = v13;
  id v15 = v13;
  v16 = v12;
  [(GEOTransitUpdateServerRequester *)self _startWithRequest:v10 traits:0 auditToken:v11 config:v14 throttleToken:0 options:0 completionHandler:v17];
}

- (void)cancelSimpleTransitRouteUpdateRequest:(id)a3
{
}

@end