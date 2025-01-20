@interface DTAssetService
+ (id)translatedManifest:(id)a3 withAssetServicePort:(unsigned int)a4;
+ (void)registerCapabilities:(id)a3;
- (DTAssetHTTPServer)server;
- (NSXPCConnection)ondemandConnection;
- (id)registerApplicationIdentifier:(id)a3 manifest:(id)a4;
- (id)startServer;
- (id)startServerForApplicationWithDevicePath:(id)a3;
- (void)appendAllowedResources:(id)a3;
- (void)connectToOnDemandDaemon;
- (void)messageReceived:(id)a3;
- (void)setOndemandConnection:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation DTAssetService

+ (void)registerCapabilities:(id)a3
{
}

+ (id)translatedManifest:(id)a3 withAssetServicePort:(unsigned int)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"resources"];
  v7 = [MEMORY[0x263EFF980] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (!v9)
  {
    v26 = 0;
    v25 = v8;
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v10 = v9;
  char v30 = 0;
  uint64_t v11 = *(void *)v34;
  v28 = v5;
  uint64_t v29 = a4;
  id v31 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v34 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
      v14 = (void *)[v13 mutableCopy];
      v15 = NSURL;
      v16 = [v13 objectForKeyedSubscript:@"URL"];
      v17 = [v15 URLWithString:v16];

      if (v17)
      {
        v18 = [v17 scheme];
        if ([v18 hasPrefix:@"http"])
        {
          v19 = [v17 host];
          if ([v19 isEqual:@"localhost"])
          {
          }
          else
          {
            v20 = [v17 host];
            int v21 = [v20 isEqual:@"127.0.0.1"];

            id v8 = v31;
            if (!v21) {
              goto LABEL_13;
            }
          }
          v22 = [v17 path];
          v23 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
          v18 = [v22 stringByAddingPercentEncodingWithAllowedCharacters:v23];

          id v8 = v31;
          v24 = [NSString stringWithFormat:@"http://localhost:%li%@", v29, v18];
          [v14 setObject:v24 forKeyedSubscript:@"URL"];
          [v14 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"isStreamable"];

          char v30 = 1;
        }
      }
LABEL_13:
      [v7 addObject:v14];
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
  }
  while (v10);

  if (v30)
  {
    id v5 = v28;
    v25 = (void *)[v28 mutableCopy];
    [v25 setObject:v7 forKeyedSubscript:@"resources"];
    uint64_t v32 = 0;
    v26 = [MEMORY[0x263F08AC0] dataWithPropertyList:v25 format:100 options:0 error:&v32];
    goto LABEL_18;
  }
  v26 = 0;
  id v5 = v28;
LABEL_20:

  return v26;
}

- (void)messageReceived:(id)a3
{
  id v5 = a3;
  if ((id)*MEMORY[0x263F38CC8] == v5)
  {
    v4 = [(DTAssetService *)self server];
    [v4 stopListening];
  }
  else
  {
    v4 = +[DTAssetResponseBroker sharedBroker];
    [v4 forwardMessage:v5];
  }
}

- (id)startServerForApplicationWithDevicePath:(id)a3
{
  id v4 = a3;
  id v5 = [(DTAssetService *)self startServer];
  v6 = [MEMORY[0x263F086E0] bundleWithPath:v4];

  v7 = [v6 pathForResource:@"AssetPackManifestTemplate" ofType:@"plist"];
  if (!v7)
  {
    v7 = [v6 pathForResource:@"AssetPackManifest" ofType:@"plist"];
  }
  id v8 = [NSDictionary dictionaryWithContentsOfFile:v7];
  uint64_t v9 = +[DTAssetService translatedManifest:withAssetServicePort:](DTAssetService, "translatedManifest:withAssetServicePort:", v8, [v5 unsignedIntValue]);
  uint64_t v10 = [v6 bundleIdentifier];
  if (v9)
  {
    [(DTAssetService *)self appendAllowedResources:v9];
    uint64_t v11 = objc_opt_new();
    v12 = [(DTAssetService *)self ondemandConnection];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_230892FD8;
    v22[3] = &unk_264B8DAE8;
    id v13 = v11;
    id v23 = v13;
    v14 = [v12 remoteObjectProxyWithErrorHandler:v22];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_230892FE8;
    v19[3] = &unk_264B8DE58;
    id v15 = v13;
    id v20 = v15;
    id v21 = v5;
    id v16 = v5;
    [v14 registerManifest:v9 forBundleID:v10 replyBlock:v19];
    v17 = v21;
    id v5 = v15;
  }
  return v5;
}

- (id)startServer
{
  v3 = [(DTAssetService *)self server];

  if (!v3)
  {
    id v4 = objc_alloc_init(DTAssetHTTPServer);
    [(DTAssetService *)self setServer:v4];

    id v5 = [(DTXService *)self channel];
    v6 = [(DTAssetService *)self server];
    [v6 setChannel:v5];

    v7 = [(DTAssetService *)self server];
    [v7 startListeningWithError:0];
  }
  [(DTAssetService *)self connectToOnDemandDaemon];
  id v8 = NSNumber;
  uint64_t v9 = [(DTAssetService *)self server];
  uint64_t v10 = [v8 numberWithUnsignedInteger:[v9 port]];

  return v10;
}

- (void)connectToOnDemandDaemon
{
  v3 = [(DTAssetService *)self ondemandConnection];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ondemandd.devtools" options:4096];
    [(DTAssetService *)self setOndemandConnection:v4];

    id v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E549FE8];
    v6 = [(DTAssetService *)self ondemandConnection];
    [v6 setRemoteObjectInterface:v5];

    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x263EF8330];
    objc_copyWeak(&v10, &location);
    v7 = [(DTAssetService *)self ondemandConnection];
    [v7 setInvalidationHandler:&v9];

    id v8 = [(DTAssetService *)self ondemandConnection];
    [v8 resume];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (id)registerApplicationIdentifier:(id)a3 manifest:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_new();
  [(DTAssetService *)self appendAllowedResources:v6];
  uint64_t v9 = [(DTAssetService *)self ondemandConnection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_230893438;
  v18[3] = &unk_264B8DAE8;
  id v10 = v8;
  id v19 = v10;
  uint64_t v11 = [v9 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_230893448;
  v16[3] = &unk_264B8DAE8;
  id v12 = v10;
  id v17 = v12;
  [v11 registerManifest:v6 forBundleID:v7 replyBlock:v16];

  id v13 = v17;
  id v14 = v12;

  return v14;
}

- (void)appendAllowedResources:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:0];
  id v7 = [v6 objectForKeyedSubscript:@"resources"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v15 + 1) + 8 * v11) objectForKeyedSubscript:@"URL"];
        [v5 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  id v13 = (void *)[v5 copy];
  id v14 = [(DTAssetService *)self server];
  [v14 setAllowedResources:v13];
}

- (DTAssetHTTPServer)server
{
  return (DTAssetHTTPServer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServer:(id)a3
{
}

- (NSXPCConnection)ondemandConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOndemandConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ondemandConnection, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end