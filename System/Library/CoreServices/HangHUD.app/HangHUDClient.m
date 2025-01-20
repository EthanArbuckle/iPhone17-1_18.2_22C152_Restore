@interface HangHUDClient
+ (id)sharedInstance;
- (HangHUDClient)initWithIdentifier:(id)a3;
- (HangHUDClientDelegate)delegate;
- (id)obtainKeepHangHUDAliveAssertion:(id)a3;
- (void)clearHUDWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendHangHUDInfo:(id)a3 completion:(id)a4;
- (void)sendHudConfiguration:(id)a3 completion:(id)a4;
- (void)sendMonitoredStates:(id)a3 completion:(id)a4;
- (void)sendProcExitRecord:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation HangHUDClient

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010870;
  block[3] = &unk_100030840;
  block[4] = a1;
  if (qword_10003E9F8 != -1) {
    dispatch_once(&qword_10003E9F8, block);
  }
  v2 = (void *)qword_10003E9F0;

  return v2;
}

- (HangHUDClient)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HangHUDClient;
  v5 = [(HangHUDClient *)&v22 init];
  if (v5)
  {
    v6 = +[HangHUDServiceSpecification machName];
    v7 = +[HangHUDServiceSpecification identifier];
    uint64_t v8 = +[BSServiceConnectionEndpoint endpointForMachName:v6 service:v7 instance:0];
    endpoint = v5->_endpoint;
    v5->_endpoint = (BSServiceConnectionEndpoint *)v8;

    v10 = v5->_endpoint;
    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100010B88;
      v20[3] = &unk_100030D18;
      v21 = v4;
      uint64_t v11 = +[BSServiceConnection connectionWithEndpoint:v10 clientContextBuilder:v20];
      connection = v5->_connection;
      v5->_connection = (BSServiceConnectionClient *)v11;

      v13 = v5->_connection;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100010C00;
      v18[3] = &unk_100030D40;
      v19 = v5;
      [(BSServiceConnectionClient *)v13 configureConnection:v18];

      v14 = v21;
    }
    else
    {
      v14 = sub_100006A20();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = +[HangHUDServiceSpecification machName];
        v16 = +[HangHUDServiceSpecification identifier];
        *(_DWORD *)buf = 138412546;
        v24 = v15;
        __int16 v25 = 2112;
        v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to lookup endpoint with machName=%@ service=%@", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (void)invalidate
{
}

- (id)obtainKeepHangHUDAliveAssertion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)RBSAssertion);
  v5 = +[RBSProcessIdentity identityForAngelJobLabel:@"com.apple.HangHUD"];
  v6 = +[RBSTarget targetWithProcessIdentity:v5];
  v7 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  uint64_t v11 = v7;
  uint64_t v8 = +[NSArray arrayWithObjects:&v11 count:1];
  id v9 = [v4 initWithExplanation:v3 target:v6 attributes:v8];

  return v9;
}

- (void)sendHangHUDInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006A20();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001CFD0(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(BSServiceConnectionClient *)self->_connection activate];
  connection = self->_connection;
  v17 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v23 = v17;
  v18 = +[NSArray arrayWithObjects:&v23 count:1];
  v19 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v18];

  if (v19)
  {
    [v19 receiveHangHUDInfo:v6 completion:v7];
  }
  else
  {
    v20 = sub_100006A20();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      CFStringRef v22 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)sendProcExitRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006A20();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001D048(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(BSServiceConnectionClient *)self->_connection activate];
  connection = self->_connection;
  v17 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v23 = v17;
  v18 = +[NSArray arrayWithObjects:&v23 count:1];
  v19 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v18];

  if (v19)
  {
    [v19 receiveProcExitRecord:v6 completion:v7];
  }
  else
  {
    v20 = sub_100006A20();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      CFStringRef v22 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)sendHudConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006A20();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001D0C0(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(BSServiceConnectionClient *)self->_connection activate];
  connection = self->_connection;
  v17 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v23 = v17;
  v18 = +[NSArray arrayWithObjects:&v23 count:1];
  v19 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v18];

  if (v19)
  {
    [v19 receiveHudConfiguration:v6 completion:v7];
  }
  else
  {
    v20 = sub_100006A20();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      CFStringRef v22 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)sendMonitoredStates:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_100006A20();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10001D138(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  [(BSServiceConnectionClient *)self->_connection activate];
  connection = self->_connection;
  v17 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v23 = v17;
  v18 = +[NSArray arrayWithObjects:&v23 count:1];
  v19 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v18];

  if (v19)
  {
    [v19 receiveMonitoredStates:v6 completion:v7];
  }
  else
  {
    v20 = sub_100006A20();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138412290;
      CFStringRef v22 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
    }
  }
}

- (void)clearHUDWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100006A20();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10001D1B0(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  [(BSServiceConnectionClient *)self->_connection activate];
  connection = self->_connection;
  uint64_t v14 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.common" name:@"BasicAngelIPC"];
  v20 = v14;
  uint64_t v15 = +[NSArray arrayWithObjects:&v20 count:1];
  v16 = [(BSServiceConnectionClient *)connection remoteTargetWithLaunchingAssertionAttributes:v15];

  if (v16)
  {
    [v16 clearHUDWithCompletion:v4];
  }
  else
  {
    v17 = sub_100006A20();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      CFStringRef v19 = @"launchingTarget is nil. connection is not active or remote interface is empty.";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (HangHUDClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HangHUDClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end