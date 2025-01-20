@interface FADeleteFamilyOperation
- (FADeleteFamilyOperation)initWithNetworkService:(id)a3;
- (id)deleteFamily;
- (id)removeMemberCompletionHandler;
- (void)setRemoveMemberCompletionHandler:(id)a3;
@end

@implementation FADeleteFamilyOperation

- (FADeleteFamilyOperation)initWithNetworkService:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FADeleteFamilyOperation;
  return [(FANetworkClient *)&v4 initWithNetworkService:a3];
}

- (id)deleteFamily
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FADeleteFamilyOperation deleteFamily request", v11, 2u);
  }

  objc_super v4 = +[AAURLConfiguration urlConfiguration];
  v5 = [v4 urlForEndpoint:@"deleteFamily"];

  v6 = [(FANetworkClient *)self networkService];
  v7 = [v6 standardPlistRequestWithUrl:v5 method:@"POST" plistBody:0];
  v8 = [v7 then];
  v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_10004D460);

  return v9;
}

- (id)removeMemberCompletionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoveMemberCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end