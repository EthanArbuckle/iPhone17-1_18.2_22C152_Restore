@interface FAUpdateFamilyInviteStatusOperation
- (FAUpdateFamilyInviteStatusOperation)initWithNetworkService:(id)a3 inviteCode:(id)a4 inviteStatus:(int64_t)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7;
- (NSDictionary)additionalRequestParameters;
- (NSString)inviteCode;
- (id)_userActionWithInviteStatus:(int64_t)a3;
- (id)updateInviteStatus;
- (int64_t)inviteStatus;
- (int64_t)responseFormat;
@end

@implementation FAUpdateFamilyInviteStatusOperation

- (FAUpdateFamilyInviteStatusOperation)initWithNetworkService:(id)a3 inviteCode:(id)a4 inviteStatus:(int64_t)a5 responseFormat:(int64_t)a6 additionalRequestParameters:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)FAUpdateFamilyInviteStatusOperation;
  v15 = [(FANetworkClient *)&v18 initWithNetworkService:a3];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inviteCode, a4);
    v16->_inviteStatus = a5;
    objc_storeStrong((id *)&v16->_additionalRequestParameters, a7);
    v16->_responseFormat = a6;
  }

  return v16;
}

- (id)_userActionWithInviteStatus:(int64_t)a3
{
  CFStringRef v3 = @"decline";
  if (a3 != 2) {
    CFStringRef v3 = 0;
  }
  if (a3 == 1) {
    return @"accept";
  }
  else {
    return (id)v3;
  }
}

- (id)updateInviteStatus
{
  CFStringRef v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSMutableDictionary dictionary];
  v5 = [(FAUpdateFamilyInviteStatusOperation *)self inviteCode];
  [v4 setObject:v5 forKeyedSubscript:@"inviteUrl"];

  id v6 = objc_alloc((Class)NSURLComponents);
  v7 = [(FAUpdateFamilyInviteStatusOperation *)self inviteCode];
  id v8 = [v6 initWithString:v7];

  v9 = objc_msgSend(v8, "fa_queryItemsDictionary");
  v10 = [v9 objectForKeyedSubscript:@"inviteCode"];
  [v4 setObject:v10 forKeyedSubscript:@"inviteCode"];

  [v3 setObject:v4 forKeyedSubscript:@"requestParameters"];
  v11 = [(FAUpdateFamilyInviteStatusOperation *)self _userActionWithInviteStatus:[(FAUpdateFamilyInviteStatusOperation *)self inviteStatus]];
  [v3 setObject:v11 forKeyedSubscript:@"userAction"];

  [v3 addEntriesFromDictionary:self->_additionalRequestParameters];
  id v12 = objc_alloc_init((Class)FAURLConfiguration);
  id v13 = [v12 URLForEndpoint:FAURLEndpointPendingInviteActionFromMessagesV1];
  id v14 = [v13 then];
  v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  v23 = sub_100009828;
  v24 = &unk_10004D3E8;
  v25 = self;
  id v26 = v3;
  v15 = (void (*)(void *, void ***))v14[2];
  id v16 = v3;
  v17 = v15(v14, &v21);
  objc_msgSend(v17, "then", v21, v22, v23, v24, v25);
  objc_super v18 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v19 = ((void (**)(void, Block_layout *))v18)[2](v18, &stru_10004D428);

  return v19;
}

- (NSString)inviteCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int64_t)inviteStatus
{
  return self->_inviteStatus;
}

- (NSDictionary)additionalRequestParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)responseFormat
{
  return self->_responseFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRequestParameters, 0);
  objc_storeStrong((id *)&self->_inviteCode, 0);
}

@end