@interface RequestBrokerClient
- (id)description;
- (void)cancelAllRequestsWithErrorHandler:(id)a3;
- (void)submitRequest:(id)a3 delegate:(id)a4 withReplyHandler:(id)a5;
@end

@implementation RequestBrokerClient

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)RequestBrokerClient;
  v3 = [(RequestBrokerClient *)&v8 description];
  if (self) {
    client = self->_client;
  }
  else {
    client = 0;
  }
  v5 = [(XPCClient *)client clientID];
  v6 = +[NSString stringWithFormat:@"%@: %@", v3, v5];

  return v6;
}

- (void)submitRequest:(id)a3 delegate:(id)a4 withReplyHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, id *, void))a5;
  id v10 = a4;
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = v8;
    __int16 v15 = 2114;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received request: %{public}@ from: %{public}@", (uint8_t *)&v13, 0x16u);
  }

  v12 = sub_10000F9B8((id *)[RequestProxy alloc], self, v8, v10);
  if (v9) {
    v9[2](v9, v12, 0);
  }
}

- (void)cancelAllRequestsWithErrorHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Canceling all system applications for: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v6 = sub_1003E0BA4();
  [v6 modifyUsingTransaction:&stru_10052D2C0];

  v7 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Finished canceling all system applications for: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (v4) {
    v4[2](v4, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_client, 0);
}

@end