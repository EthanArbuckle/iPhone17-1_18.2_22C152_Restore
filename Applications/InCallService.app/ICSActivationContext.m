@interface ICSActivationContext
- (ICSActivationContext)initWithReason:(id)a3 userInfo:(id)a4;
- (ICSActivationContext)initWithVideoMessageURL:(id)a3;
- (NSDictionary)userInfo;
- (NSString)reason;
- (NSURL)videoMessageURL;
- (TUFilteredRequest)pendingRestrictedScreenTimeRequest;
- (id)description;
@end

@implementation ICSActivationContext

- (ICSActivationContext)initWithReason:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSActivationContext;
  v9 = [(ICSActivationContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_reason, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (ICSActivationContext)initWithVideoMessageURL:(id)a3
{
  id v5 = a3;
  v6 = [(ICSActivationContext *)self initWithReason:@"ICSSceneActivationReasonVideoMessagePlayback" userInfo:0];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_videoMessageURL, a3);
  }

  return v7;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(ICSActivationContext *)self reason];
  id v5 = [(ICSActivationContext *)self userInfo];
  v6 = +[NSString stringWithFormat:@"<%@ %p reason=%@ userInfo=%@>", v3, self, v4, v5];

  return v6;
}

- (TUFilteredRequest)pendingRestrictedScreenTimeRequest
{
  uint64_t v3 = [(ICSActivationContext *)self reason];
  v4 = (void *)SOSRemoteAlertActivationReasonActivatingForScreenTime;

  if (v3 == v4)
  {
    v6 = [(ICSActivationContext *)self userInfo];
    id v7 = [v6 objectForKeyedSubscript:SOSRemoteAlertActivationContextUserInfoRequestURLStringKey];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = +[NSURL URLWithString:v7];
      if (v8)
      {
        id v5 = [objc_alloc((Class)TUDialRequest) initWithURL:v8];
        if (!v5)
        {
          id v9 = [objc_alloc((Class)TUJoinConversationRequest) initWithURL:v8];
          v10 = +[TUCallCenter sharedInstance];
          v11 = [v10 conversationManager];
          objc_super v12 = [v9 remoteMembers];
          v13 = [v9 conversationLink];
          v14 = [v11 activeConversationWithRemoteMembers:v12 andLink:v13];

          v15 = [v14 activeRemoteParticipants];
          if ([v15 count]) {
            v16 = v14;
          }
          else {
            v16 = v9;
          }
          id v5 = v16;
        }
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return (TUFilteredRequest *)v5;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSURL)videoMessageURL
{
  return self->_videoMessageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoMessageURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end