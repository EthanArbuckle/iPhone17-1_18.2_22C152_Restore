@interface DTAssetProviderService
+ (BOOL)shouldStartAssetServerForApplication:(id)a3;
+ (id)assetManifestPathForApplication:(id)a3;
+ (void)assetProviderWithConnection:(id)a3 workingDirectory:(id)a4 completion:(id)a5;
+ (void)beginProvidingAssetsForApplication:(id)a3 onChannel:(id)a4 completion:(id)a5;
+ (void)beginProvidingAssetsForLocalApplication:(id)a3 connection:(id)a4 completion:(id)a5;
+ (void)beginProvidingAssetsForRemoteApplication:(id)a3 workingDirectory:(id)a4 connection:(id)a5 completion:(id)a6;
- (BOOL)_requestedPath:(id)a3 belongsToWorkingDirectory:(id)a4;
- (BOOL)_serveData:(id)a3 usingChannel:(id)a4 forRequestIdentifier:(id)a5 checkForCancellation:(BOOL)a6 error:(id *)a7;
- (BOOL)hasCancelledRequestWithIdentifier:(id)a3 onChannel:(id)a4;
- (BOOL)serveDataFromFileHandle:(id)a3 forRequestIdentifier:(id)a4;
- (BOOL)serveDataWithResultFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4;
- (DTAssetProviderService)initWithChannel:(id)a3;
- (DTXConnection)connection;
- (NSString)workingDirectory;
- (OS_dispatch_queue)concurrentRequestQueue;
- (id)_bestChannelForRequestWithIdentifier:(id)a3;
- (void)_completeResponseOnChannel:(id)a3 withIdentifier:(id)a4;
- (void)messageReceived:(id)a3;
- (void)registerManifestForApplicationAtPath:(id)a3 onPort:(unint64_t)a4;
- (void)serveDataFromFile:(id)a3 forRequestIdentifier:(id)a4;
- (void)serveDataFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4;
- (void)setConcurrentRequestQueue:(id)a3;
- (void)setConnection:(id)a3;
- (void)setWorkingDirectory:(id)a3;
- (void)startServerOnDeviceWithCompletion:(id)a3;
- (void)startServingAssetsForAppWithPath:(id)a3 withCompletion:(id)a4;
@end

@implementation DTAssetProviderService

- (DTAssetProviderService)initWithChannel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DTAssetProviderService;
  v3 = [(DTXService *)&v6 initWithChannel:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dt.DTAssetProviderService", MEMORY[0x263EF83A8]);
    [(DTAssetProviderService *)v3 setConcurrentRequestQueue:v4];
  }
  return v3;
}

+ (void)beginProvidingAssetsForRemoteApplication:(id)a3 workingDirectory:(id)a4 connection:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"DTAssetProviderService.m", 107, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_23089DB30;
  v18[3] = &unk_264B8E2A0;
  id v19 = v11;
  id v20 = v14;
  id v15 = v14;
  id v16 = v11;
  [a1 assetProviderWithConnection:v13 workingDirectory:v12 completion:v18];
}

+ (void)beginProvidingAssetsForLocalApplication:(id)a3 connection:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"DTAssetProviderService.m", 121, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  if ([a1 shouldStartAssetServerForApplication:v9])
  {
    id v12 = [v9 stringByDeletingLastPathComponent];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_23089DD34;
    v14[3] = &unk_264B8E2F0;
    id v16 = v11;
    id v15 = v9;
    [a1 assetProviderWithConnection:v10 workingDirectory:v12 completion:v14];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v9;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Not starting ODR asset provider because there is no manifest template at %@", buf, 0xCu);
    }
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

+ (void)assetProviderWithConnection:(id)a3 workingDirectory:(id)a4 completion:(id)a5
{
  v17[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (v8)
  {
    if ((int)[v8 remoteCapabilityVersion:@"com.apple.instruments.server.services.assets"] > 2)
    {
      [v8 setMaximumEnqueueSize:40960];
      id v14 = [v8 makeChannelWithIdentifier:@"com.apple.instruments.server.services.assets"];
      id v15 = (void *)[objc_alloc((Class)a1) initWithChannel:v14];
      [v15 setWorkingDirectory:v9];
      [v15 setConnection:v8];
      v10[2](v10, v15, 0);
    }
    else
    {
      v10[2](v10, 0, 0);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = @"no connection provided";
    id v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v13 = [v11 errorWithDomain:@"com.apple.dt.AssetProviderService" code:1 userInfo:v12];

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v13);
  }
}

- (void)startServingAssetsForAppWithPath:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x263F38CA0] messageWithSelector:sel_startServerForApplicationWithDevicePath_ objectArguments:a3];
  id v8 = [(DTXService *)self channel];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_23089E1AC;
  v10[3] = &unk_264B8E318;
  id v11 = v6;
  id v9 = v6;
  [v8 sendControlAsync:v7 replyHandler:v10];
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  if ([v4 errorStatus] != 2)
  {
    v5 = [(DTAssetProviderService *)self concurrentRequestQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = sub_23089E2C8;
    v6[3] = &unk_264B8DA70;
    id v7 = v4;
    id v8 = self;
    dispatch_async(v5, v6);
  }
}

- (void)serveDataFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4
{
}

- (BOOL)serveDataWithResultFromZippedDirectory:(id)a3 forRequestIdentifier:(id)a4
{
  return 0;
}

- (void)serveDataFromFile:(id)a3 forRequestIdentifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "ODR: Serving data for request %@ from file %@", (uint8_t *)&v9, 0x16u);
  }
  id v8 = [MEMORY[0x263F08840] fileHandleForReadingAtPath:v6];
  [(DTAssetProviderService *)self serveDataFromFileHandle:v8 forRequestIdentifier:v7];
}

- (BOOL)serveDataFromFileHandle:(id)a3 forRequestIdentifier:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v28 = a3;
  id v6 = a4;
  id v7 = [(DTXService *)self channel];
  v27 = self;
  id v8 = [(DTAssetProviderService *)self connection];
  int v9 = [v8 remoteCapabilityVersion:@"com.apple.instruments.server.services.assets.response"];

  BOOL v10 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v9 < 1)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Using existing channel to send response packets for request %@", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Opening new channel to send response packets for request %@", buf, 0xCu);
    }
    __int16 v11 = [(DTAssetProviderService *)self connection];
    id v12 = [v11 makeChannelWithIdentifier:@"com.apple.instruments.server.services.assets.response"];

    uint64_t v13 = [MEMORY[0x263F38CA0] messageWithSelector:sel_prepareForResponse objectArguments:0];
    [v12 sendControlSync:v13 replyHandler:&unk_26E5155A8];

    id v7 = v12;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v6;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Starting to send data for request %@.", buf, 0xCu);
  }
  id v14 = [v28 availableData];
  if (v14)
  {
    unint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    while ([v14 length])
    {
      if (v9 >= 2 && v17 >= v15)
      {
        if ([(DTAssetProviderService *)v27 hasCancelledRequestWithIdentifier:v6 onChannel:v7])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v6;
            _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "ODR: Request %@ has been cancelled, stopping sending data.", buf, 0xCu);
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            id v33 = v6;
            __int16 v34 = 2048;
            unint64_t v35 = v17;
            __int16 v36 = 2048;
            uint64_t v37 = v16;
            _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "ODR: Cancelled request %@ after sending %llu bytes from %llu messages.", buf, 0x20u);
          }
          BOOL v23 = 0;
          goto LABEL_22;
        }
        v15 += 0x100000;
      }
      id v18 = +[DTAssetResponse responseWithIdentifier:v6 data:v14];
      uint64_t v19 = [v18 message];
      [v7 sendMessage:v19 replyHandler:0];

      v17 += [v14 length];
      ++v16;

      uint64_t v20 = [v28 availableData];

      id v14 = (void *)v20;
      if (!v20) {
        break;
      }
    }
  }
  else
  {
    unint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  v21 = +[DTAssetResponse completedResponseWithIdentifier:v6];
  v22 = [v21 message];
  [v7 sendMessage:v22 replyHandler:0];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v33 = v6;
    __int16 v34 = 2048;
    unint64_t v35 = v17;
    __int16 v36 = 2048;
    uint64_t v37 = v16;
    _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_INFO, "ODR: Finished sending request %@. Sent bytes: %llu from %llu messages.", buf, 0x20u);
  }

  BOOL v23 = 1;
LABEL_22:
  v24 = [(DTXService *)v27 channel];

  if (v7 != v24)
  {
    uint64_t v25 = *MEMORY[0x263F38CB8];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_23089EB64;
    v29[3] = &unk_264B8D5E0;
    id v30 = v6;
    id v31 = v7;
    [v31 sendMessageAsync:v25 replyHandler:v29];
  }
  return v23;
}

- (BOOL)hasCancelledRequestWithIdentifier:(id)a3 onChannel:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F38CA0] messageWithSelector:sel_canContinueServingRequestWithIdentifier_ objectArguments:v5, 0];
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_23089EE44;
  uint64_t v19 = sub_23089EE54;
  id v20 = 0;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_23089EE5C;
  v14[3] = &unk_264B8E340;
  void v14[4] = &v15;
  [v6 sendMessageSync:v7 replyHandler:v14];
  id v8 = [(id)v16[5] error];

  if (v8)
  {
    int v9 = &_os_log_internal;
    id v10 = &_os_log_internal;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = [(id)v16[5] error];
      *(_DWORD *)buf = 138412546;
      id v22 = v5;
      __int16 v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_ERROR, "ODR: Error checking if request %@ is cancelled: %@", buf, 0x16u);
    }
    LOBYTE(v12) = 1;
  }
  else
  {
    int v9 = [(id)v16[5] object];
    int v12 = [v9 BOOLValue] ^ 1;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

+ (id)assetManifestPathForApplication:(id)a3
{
  v3 = [MEMORY[0x263F086E0] bundleWithPath:a3];
  id v4 = [v3 pathForResource:@"AssetPackManifestTemplate" ofType:@"plist"];

  return v4;
}

+ (BOOL)shouldStartAssetServerForApplication:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08850];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  id v7 = [a1 assetManifestPathForApplication:v5];

  LOBYTE(v5) = [v6 fileExistsAtPath:v7];
  return (char)v5;
}

+ (void)beginProvidingAssetsForApplication:(id)a3 onChannel:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (([a1 shouldStartAssetServerForApplication:v8] & 1) != 0 && v9)
  {
    __int16 v11 = (void *)[objc_alloc((Class)a1) initWithChannel:v9];
    int v12 = [v8 stringByDeletingLastPathComponent];
    [v11 setWorkingDirectory:v12];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_23089F090;
    v14[3] = &unk_264B8E2C8;
    uint64_t v17 = v10;
    id v15 = v11;
    id v16 = v8;
    id v13 = v11;
    [v13 startServerOnDeviceWithCompletion:v14];
  }
  else
  {
    v10[2](v10);
  }
}

- (void)startServerOnDeviceWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F38CA0] messageWithSelector:sel_startServer objectArguments:0];
  id v6 = [(DTXService *)self channel];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_23089F248;
  v8[3] = &unk_264B8E318;
  id v9 = v4;
  id v7 = v4;
  [v6 sendMessageAsync:v5 replyHandler:v8];
}

- (void)registerManifestForApplicationAtPath:(id)a3 onPort:(unint64_t)a4
{
  id v13 = [MEMORY[0x263F086E0] bundleWithPath:a3];
  id v6 = [v13 pathForResource:@"AssetPackManifestTemplate" ofType:@"plist"];
  id v7 = [NSDictionary dictionaryWithContentsOfFile:v6];
  id v8 = +[DTAssetService translatedManifest:v7 withAssetServicePort:a4];
  if (v8)
  {
    id v9 = (void *)MEMORY[0x263F38CA0];
    id v10 = [v13 bundleIdentifier];
    __int16 v11 = [v9 messageWithSelector:sel_registerApplicationIdentifier_manifest_ objectArguments:v10, v8, 0];

    int v12 = [(DTXService *)self channel];
    [v12 sendMessageAsync:v11 replyHandler:&unk_26E515B88];
  }
}

- (BOOL)_requestedPath:(id)a3 belongsToWorkingDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 stringByResolvingSymlinksInPath];
  id v8 = [v7 pathComponents];

  id v9 = [v6 stringByResolvingSymlinksInPath];
  id v10 = [v9 pathComponents];

  BOOL v11 = 0;
  if (v8 && v10)
  {
    unint64_t v12 = [v8 count];
    if (v12 >= [v10 count])
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2020000000;
      char v20 = 1;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = sub_23089F5B0;
      v14[3] = &unk_264B8E368;
      id v15 = v8;
      id v16 = &v17;
      [v10 enumerateObjectsUsingBlock:v14];
      BOOL v11 = *((unsigned char *)v18 + 24) != 0;

      _Block_object_dispose(&v17, 8);
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (id)_bestChannelForRequestWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DTXService *)self channel];
  id v6 = [(DTAssetProviderService *)self connection];
  int v7 = [v6 remoteCapabilityVersion:@"com.apple.instruments.server.services.assets.response"];

  BOOL v8 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v7 < 1)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Using existing channel to send response packets for request %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Opening new channel to send response packets for request %@", (uint8_t *)&v13, 0xCu);
    }
    id v9 = [(DTAssetProviderService *)self connection];
    id v10 = [v9 makeChannelWithIdentifier:@"com.apple.instruments.server.services.assets.response"];

    BOOL v11 = [MEMORY[0x263F38CA0] messageWithSelector:sel_prepareForResponse objectArguments:0];
    [v10 sendControlSync:v11 replyHandler:&unk_26E515BC8];

    id v5 = v10;
  }

  return v5;
}

- (void)_completeResponseOnChannel:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[DTAssetResponse completedResponseWithIdentifier:v7];
  id v9 = [v8 message];
  [v6 sendMessage:v9 replyHandler:0];

  id v10 = [(DTXService *)self channel];

  if (v10 != v6)
  {
    uint64_t v11 = *MEMORY[0x263F38CB8];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = sub_23089F91C;
    v12[3] = &unk_264B8D5E0;
    id v13 = v7;
    id v14 = v6;
    [v14 sendMessageAsync:v11 replyHandler:v12];
  }
}

- (BOOL)_serveData:(id)a3 usingChannel:(id)a4 forRequestIdentifier:(id)a5 checkForCancellation:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v14;
      _os_log_impl(&dword_23087D000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "ODR: Sending data for request %@.", buf, 0xCu);
    }
    if (!v8
      || ![(DTAssetProviderService *)self hasCancelledRequestWithIdentifier:v14 onChannel:v13])
    {
      id v22 = +[DTAssetResponse responseWithIdentifier:v14 data:v12];
      __int16 v23 = [v22 message];
      [v13 sendMessage:v23 replyHandler:0];

      BOOL v24 = 1;
      goto LABEL_13;
    }
    [v13 cancel];
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08438];
    uint64_t v30 = *MEMORY[0x263F08320];
    uint64_t v17 = [NSString stringWithFormat:@"Request %@ has been cancelled, stopping sending data.", v14];
    id v31 = v17;
    id v18 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    uint64_t v19 = v15;
    uint64_t v20 = v16;
    uint64_t v21 = 89;
  }
  else
  {
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08438];
    uint64_t v28 = *MEMORY[0x263F08320];
    uint64_t v17 = [NSString stringWithFormat:@"Request %@ can't send data because there is no channel connection.", v14];
    v29 = v17;
    id v18 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v19 = v25;
    uint64_t v20 = v26;
    uint64_t v21 = 57;
  }
  id v22 = [v19 errorWithDomain:v20 code:v21 userInfo:v18];

  if (a7 && v22) {
    *a7 = v22;
  }
  BOOL v24 = v22 == 0;
LABEL_13:

  return v24;
}

- (DTXConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (DTXConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)concurrentRequestQueue
{
  return self->_concurrentRequestQueue;
}

- (void)setConcurrentRequestQueue:(id)a3
{
}

- (NSString)workingDirectory
{
  return self->_workingDirectory;
}

- (void)setWorkingDirectory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingDirectory, 0);
  objc_storeStrong((id *)&self->_concurrentRequestQueue, 0);
  objc_destroyWeak((id *)&self->_connection);
}

@end