@interface HMXPCClientConnectionProxy
- (HMXPCClientConnectionProxy)initWithUserInfo:(id)a3 refreshHandler:(id)a4;
- (NSDictionary)userInfo;
- (id)refreshHandler;
- (void)handleMessage:(id)a3;
- (void)handleMessage:(id)a3 responseHandler:(id)a4;
- (void)sendMessage:(id)a3 completionHandler:(id)a4;
@end

@implementation HMXPCClientConnectionProxy

- (void)handleMessage:(id)a3
{
  id v8 = a3;
  v4 = [v8 name];
  int v5 = [v4 isEqualToString:@"HMXPCClientInitiateRefreshConfigMessage"];

  if (v5)
  {
    v6 = [(HMXPCClientConnectionProxy *)self refreshHandler];

    if (!v6) {
      goto LABEL_6;
    }
    v7 = [(HMXPCClientConnectionProxy *)self refreshHandler];
    v7[2]();
  }
  else
  {
    v7 = [(HMFMessageTransport *)self delegate];
    [v7 messageTransport:self didReceiveMessage:v8];
  }

LABEL_6:
}

- (id)refreshHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (HMXPCClientConnectionProxy)initWithUserInfo:(id)a3 refreshHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMXPCClientConnectionProxy;
  id v8 = [(HMXPCClientConnectionProxy *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    userInfo = v8->_userInfo;
    v8->_userInfo = (NSDictionary *)v9;

    v11 = _Block_copy(v7);
    id refreshHandler = v8->_refreshHandler;
    v8->_id refreshHandler = v11;
  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_refreshHandler, 0);

  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)handleMessage:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)[a3 mutableCopy];
  [v7 setResponseHandler:v6];

  id v9 = (id)[v7 copy];
  id v8 = [(HMFMessageTransport *)self delegate];
  [v8 messageTransport:self didReceiveMessage:v9];
}

- (void)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [v6 responseHandler];
  [(HMXPCClientConnectionProxy *)self handleMessage:v6 responseHandler:v7];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    id v8 = v9;
  }
}

@end