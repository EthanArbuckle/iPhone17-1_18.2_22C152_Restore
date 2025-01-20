@interface CSMockRemotePluginServices
+ (id)getMockRemotePluginXPCConnection;
+ (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5;
+ (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4;
+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5;
+ (void)listAudioInjectionDeviecesWithCompletion:(id)a3;
@end

@implementation CSMockRemotePluginServices

+ (void)listAudioInjectionDeviecesWithCompletion:(id)a3
{
  id v4 = a3;
  os_log_t v5 = os_log_create("com.apple.corespeech", "services");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3BF0;
  v22[3] = &unk_8448;
  id v6 = v4;
  id v23 = v6;
  v7 = objc_retainBlock(v22);
  v8 = [a1 getMockRemotePluginXPCConnection];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_3C08;
  v19[3] = &unk_8470;
  v9 = v5;
  v20 = v9;
  v10 = v7;
  id v21 = v10;
  [v8 setInterruptionHandler:v19];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_3C80;
  v16[3] = &unk_8470;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  id v18 = v12;
  [v8 setInvalidationHandler:v16];
  [v8 resume];
  v13 = [v8 remoteObjectProxy];
  BOOL v14 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v14)
    {
      __int16 v15 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Request to list all devices.", (uint8_t *)&v15, 2u);
    }
    [v13 listMockRemoteDeviecesWithCompletion:v6];
  }
  else
  {
    if (v14)
    {
      __int16 v15 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "XPC connection not exist", (uint8_t *)&v15, 2u);
    }
    ((void (*)(void *, void))v12[2])(v12, 0);
  }
}

+ (void)disconnectDeviceWithUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_log_t v8 = os_log_create("com.apple.corespeech", "services");
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_3FE0;
  v25[3] = &unk_8420;
  id v9 = v7;
  id v26 = v9;
  v10 = objc_retainBlock(v25);
  v11 = [a1 getMockRemotePluginXPCConnection];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3FF8;
  v22[3] = &unk_8470;
  v12 = v8;
  id v23 = v12;
  v13 = v10;
  id v24 = v13;
  [v11 setInterruptionHandler:v22];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_40A4;
  v19[3] = &unk_8470;
  BOOL v14 = v12;
  v20 = v14;
  __int16 v15 = v13;
  id v21 = v15;
  [v11 setInvalidationHandler:v19];
  [v11 resume];
  v16 = [v11 remoteObjectProxy];
  BOOL v17 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Request to disconnect device with UUID %@", buf, 0xCu);
    }
    [v16 disconnectDeviceWithUUID:v6 completion:v9];
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "XPC connection not exist", buf, 2u);
    }
    id v18 = +[NSError errorWithDomain:CSErrorDomain code:1654 userInfo:0];
    ((void (*)(void *, void, void *))v15[2])(v15, 0, v18);
  }
}

+ (void)injectAudio:(id)a3 toDeviceWithUUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_t v11 = os_log_create("com.apple.corespeech", "services");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_446C;
  v28[3] = &unk_83F8;
  id v12 = v10;
  id v29 = v12;
  v13 = objc_retainBlock(v28);
  BOOL v14 = [a1 getMockRemotePluginXPCConnection];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4484;
  v25[3] = &unk_8470;
  __int16 v15 = v11;
  id v26 = v15;
  v16 = v13;
  id v27 = v16;
  [v14 setInterruptionHandler:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_4538;
  v22[3] = &unk_8470;
  BOOL v17 = v15;
  id v23 = v17;
  id v18 = v16;
  id v24 = v18;
  [v14 setInvalidationHandler:v22];
  [v14 resume];
  v19 = [v14 remoteObjectProxy];
  BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Request to inject audio %@ to deviceUUID %@", buf, 0x16u);
    }
    [v19 injectAudio:v8 toDeviceWithUUID:v9 completion:v12];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "XPC connection not exist", buf, 2u);
    }
    id v21 = +[NSError errorWithDomain:CSErrorDomain code:1654 userInfo:0];
    ((void (*)(void *, void, void *, void, void))v18[2])(v18, 0, v21, 0, 0);
  }
}

+ (void)createMockRemoteDeviceWithName:(id)a3 deviceID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_log_t v11 = os_log_create("com.apple.corespeech", "services");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_4910;
  v28[3] = &unk_83D0;
  id v12 = v10;
  id v29 = v12;
  v13 = objc_retainBlock(v28);
  BOOL v14 = [a1 getMockRemotePluginXPCConnection];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_4928;
  v25[3] = &unk_8470;
  __int16 v15 = v11;
  id v26 = v15;
  v16 = v13;
  id v27 = v16;
  [v14 setInterruptionHandler:v25];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_49D8;
  v22[3] = &unk_8470;
  BOOL v17 = v15;
  id v23 = v17;
  id v18 = v16;
  id v24 = v18;
  [v14 setInvalidationHandler:v22];
  [v14 resume];
  v19 = [v14 remoteObjectProxy];
  BOOL v20 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Request to create mock remote deviceName : %@, deviceId : %@", buf, 0x16u);
    }
    id v21 = [v14 remoteObjectProxy];
    [v21 createMockRemoteDeviceWithName:v8 deviceID:v9 completion:v12];
  }
  else
  {
    if (v20)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "XPC connection not exist", buf, 2u);
    }
    id v21 = +[NSError errorWithDomain:CSErrorDomain code:1654 userInfo:0];
    ((void (*)(void *, void, void *, void))v18[2])(v18, 0, v21, 0);
  }
}

+ (id)getMockRemotePluginXPCConnection
{
  id v2 = objc_alloc((Class)NSXPCConnection);
  id v3 = [v2 initWithMachServiceName:kCSMockRemotePluginServiceName options:4096];
  id v4 = MockRemotePluginXPCGetInterface();
  [v3 setRemoteObjectInterface:v4];

  return v3;
}

@end