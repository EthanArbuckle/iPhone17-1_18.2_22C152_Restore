@interface FARemoveFamilyMemberOperation
- (FARemoveFamilyMemberOperation)initWithNetworkService:(id)a3 dsidOfMemberToRemove:(id)a4;
- (NSNumber)dsidOfMemberToRemove;
- (id)removeMember;
- (id)removeMemberCompletionHandler;
- (void)setRemoveMemberCompletionHandler:(id)a3;
@end

@implementation FARemoveFamilyMemberOperation

- (FARemoveFamilyMemberOperation)initWithNetworkService:(id)a3 dsidOfMemberToRemove:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FARemoveFamilyMemberOperation;
  v8 = [(FANetworkClient *)&v11 initWithNetworkService:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_dsidOfMemberToRemove, a4);
  }

  return v9;
}

- (id)removeMember
{
  v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FARemoveFamilyMemberOperation removeMember request", buf, 2u);
  }

  v4 = +[NSMutableDictionary dictionary];
  v5 = [(NSNumber *)self->_dsidOfMemberToRemove description];
  [v4 setObject:v5 forKeyedSubscript:@"member-dsid"];

  v6 = [(FANetworkClient *)self networkService];
  id v7 = [v6 standardPlistRequestWithEndpoint:@"removeFromFamily" method:@"POST" plistBody:v4];
  v8 = [v7 then];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000751C;
  v11[3] = &unk_10004D090;
  v11[4] = self;
  v9 = ((void (**)(void, void *))v8)[2](v8, v11);

  return v9;
}

- (NSNumber)dsidOfMemberToRemove
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (id)removeMemberCompletionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setRemoveMemberCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_removeMemberCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dsidOfMemberToRemove, 0);
}

@end