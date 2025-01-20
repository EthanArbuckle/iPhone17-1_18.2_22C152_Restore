@interface FACancelInvitationOperation
- (FACancelInvitationOperation)initWithNetworkService:(id)a3 email:(id)a4 familyID:(id)a5;
- (NSString)email;
- (NSString)familyID;
- (id)cancelInvitation;
- (id)cancelInvitationCompletionHandler;
- (void)setCancelInvitationCompletionHandler:(id)a3;
@end

@implementation FACancelInvitationOperation

- (FACancelInvitationOperation)initWithNetworkService:(id)a3 email:(id)a4 familyID:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FACancelInvitationOperation;
  v11 = [(FANetworkClient *)&v14 initWithNetworkService:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_email, a4);
    objc_storeStrong((id *)&v12->_familyID, a5);
  }

  return v12;
}

- (id)cancelInvitation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(FACancelInvitationOperation *)self email];
  [v3 setObject:v4 forKeyedSubscript:@"email"];

  v5 = [(FACancelInvitationOperation *)self familyID];
  [v3 setObject:v5 forKeyedSubscript:@"familyId"];

  v6 = [(FANetworkClient *)self networkService];
  v7 = [v6 standardRequestWithEndpoint:FAURLEndpointCancelInvitation method:@"POST" plistBody:v3 requestFormat:2 responseFormat:2];
  v8 = [v7 then];
  id v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_10004DCD0);

  return v9;
}

- (NSString)email
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)familyID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (id)cancelInvitationCompletionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCancelInvitationCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelInvitationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_familyID, 0);
  objc_storeStrong((id *)&self->_email, 0);
}

@end