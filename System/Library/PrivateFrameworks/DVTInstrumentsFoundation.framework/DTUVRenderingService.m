@interface DTUVRenderingService
+ (void)registerCapabilities:(id)a3;
- (BOOL)_launchCLIFromPath:(id)a3 message:(id)a4 arguments:(id)a5 environment:(id)a6 error:(id *)a7;
- (BOOL)processCommand:(id)a3 fromMessage:(id)a4 error:(id *)a5;
- (BOOL)processConnectToPreviewHostFromMessage:(id)a3 error:(id *)a4;
- (BOOL)processForwardMessageFromMessage:(id)a3 error:(id *)a4;
- (BOOL)processMessage:(id)a3 error:(id *)a4;
- (BOOL)processStartCLIFromMessage:(id)a3 error:(id *)a4;
- (DTUVRenderingService)initWithChannel:(id)a3;
- (void)messageReceived:(id)a3;
@end

@implementation DTUVRenderingService

+ (void)registerCapabilities:(id)a3
{
}

- (DTUVRenderingService)initWithChannel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DTUVRenderingService;
  v5 = [(DTXService *)&v10 initWithChannel:v4];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = sub_2308817BC;
    v8[3] = &unk_264B8D590;
    v9 = v5;
    [v4 registerDisconnectHandler:v8];
  }
  return v6;
}

- (BOOL)_launchCLIFromPath:(id)a3 message:(id)a4 arguments:(id)a5 environment:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_230881B38;
  v45 = sub_230881B48;
  id v46 = 0;
  v17 = [v14 stringForMessageKey:@"stdoutPath"];
  v18 = [v14 stringForMessageKey:@"stderrPath"];
  SEL v40 = a2;
  v19 = [MEMORY[0x263EFF9A0] dictionary];
  v20 = v19;
  if (v17) {
    [v19 setObject:v17 forKeyedSubscript:*MEMORY[0x263F38C78]];
  }
  if (v18) {
    [v20 setObject:v18 forKeyedSubscript:*MEMORY[0x263F38C70]];
  }
  uint64_t v21 = DTXSpawnSubtask();
  uint64_t v28 = v21;
  if (v42[5])
  {
    id v29 = objc_alloc(MEMORY[0x263F38C88]);
    v30 = (DTXConnection *)[v29 initWithTransport:v42[5]];
    connection = self->_connection;
    self->_connection = v30;

    [(DTXConnection *)self->_connection resume];
    v32 = [(DTXService *)self channel];
    v33 = [NSNumber numberWithInt:v28];
    v34 = (void *)[v14 newReplyWithObject:v33];
    [v32 sendMessageAsync:v34 replyHandler:0];

LABEL_7:
    id v35 = 0;
    goto LABEL_13;
  }
  if ((int)v21 >= 1) {
    kill(v21, 9);
  }
  v36 = DTUVRenderingServiceErrorWithDescription(11, @"Failed to launch CLI: %@", v22, v23, v24, v25, v26, v27, (uint64_t)v14);
  id v35 = v36;
  if (!v36)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:v40 object:self file:@"DTUVRenderingService.m" lineNumber:69 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    goto LABEL_7;
  }
  if (a7)
  {
    id v35 = v36;
    *a7 = v35;
  }
LABEL_13:
  BOOL v37 = v42[5] != 0;

  _Block_object_dispose(&v41, 8);
  return v37;
}

- (BOOL)processStartCLIFromMessage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v14 = v7;
  if (!self->_connection)
  {
    uint64_t v23 = [v7 stringForMessageKey:@"launchPath"];
    if (v23)
    {
      uint64_t v24 = [MEMORY[0x263F08850] defaultManager];
      int v25 = [v24 fileExistsAtPath:v23];

      if (v25)
      {
        uint64_t v32 = [v14 object];
        if (!v32
          || (v33 = (void *)v32,
              [v14 object],
              v34 = objc_claimAutoreleasedReturnValue(),
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v34,
              v33,
              (isKindOfClass & 1) != 0))
        {
          v42 = [v14 object];
          uint64_t v43 = [v42 valueForKey:@"inheritEnvironment"];
          v44 = v43;
          if (v43 && ![v43 BOOLValue])
          {
            v47 = [MEMORY[0x263EFF9A0] dictionary];
          }
          else
          {
            v45 = [MEMORY[0x263F08AB0] processInfo];
            id v46 = [v45 environment];
            v47 = (void *)[v46 mutableCopy];
          }
          v54 = [v42 valueForKey:@"environment"];
          if (v54) {
            [v47 addEntriesFromDictionary:v54];
          }

          id v57 = 0;
          BOOL v16 = [(DTUVRenderingService *)self _launchCLIFromPath:v23 message:v14 arguments:0 environment:v47 error:&v57];
          id v15 = v57;

LABEL_22:
          if (!a4) {
            goto LABEL_25;
          }
          goto LABEL_23;
        }
        uint64_t v48 = DTUVRenderingServiceErrorWithDescription(7, @"\"startCLI\" message payload is not a dictionary: %@", v36, v37, v38, v39, v40, v41, (uint64_t)v14);
        if (v48)
        {
LABEL_17:
          id v15 = (id)v48;
          BOOL v16 = 0;
          goto LABEL_22;
        }
        v49 = [MEMORY[0x263F08690] currentHandler];
        v50 = v49;
        SEL v51 = a2;
        v52 = self;
        uint64_t v53 = 93;
      }
      else
      {
        uint64_t v48 = DTUVRenderingServiceErrorWithDescription(10, @"\"startCLI\" \"launchPath\" does not exist: %@", v26, v27, v28, v29, v30, v31, (uint64_t)v14);
        if (v48) {
          goto LABEL_17;
        }
        v49 = [MEMORY[0x263F08690] currentHandler];
        v50 = v49;
        SEL v51 = a2;
        v52 = self;
        uint64_t v53 = 97;
      }
    }
    else
    {
      uint64_t v48 = DTUVRenderingServiceErrorWithDescription(5, @"No \"launchPath\" provided for \"startCLI\": %@", v17, v18, v19, v20, v21, v22, (uint64_t)v14);
      if (v48) {
        goto LABEL_17;
      }
      v49 = [MEMORY[0x263F08690] currentHandler];
      v50 = v49;
      SEL v51 = a2;
      v52 = self;
      uint64_t v53 = 101;
    }
    [v49 handleFailureInMethod:v51 object:v52 file:@"DTUVRenderingService.m" lineNumber:v53 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v16 = 0;
    id v15 = 0;
    goto LABEL_22;
  }
  DTUVRenderingServiceErrorWithDescription(4, @"\"startCLI\" has already been called and a connection established (%@): %@", v8, v9, v10, v11, v12, v13, (uint64_t)self->_connection);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v56 = [MEMORY[0x263F08690] currentHandler];
    [v56 handleFailureInMethod:a2 object:self file:@"DTUVRenderingService.m" lineNumber:105 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v16 = 0;
    goto LABEL_25;
  }
  BOOL v16 = 0;
  if (!a4) {
    goto LABEL_25;
  }
LABEL_23:
  if (v15)
  {
    id v15 = v15;
    *a4 = v15;
  }
LABEL_25:

  return v16;
}

- (BOOL)processForwardMessageFromMessage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id v14 = v7;
  connection = self->_connection;
  if (connection)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_230882070;
    v19[3] = &unk_264B8D5E0;
    id v20 = v7;
    uint64_t v21 = self;
    [(DTXConnection *)connection sendControlAsync:v20 replyHandler:v19];

LABEL_3:
    id v16 = 0;
    goto LABEL_7;
  }
  DTUVRenderingServiceErrorWithDescription(3, @"No connection has been established to the CLI yet for \"forwardMessage\". Make sure to pass a \"startCLI\" command first. Message was: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"DTUVRenderingService.m" lineNumber:166 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    goto LABEL_3;
  }
  if (a4)
  {
    id v16 = v16;
    *a4 = v16;
  }
LABEL_7:

  return connection != 0;
}

- (BOOL)processConnectToPreviewHostFromMessage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v8 = [v7 stringForMessageKey:@"injectionPath"];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 stringForMessageKey:@"launchedPath"];
  }
  uint64_t v11 = v10;

  uint64_t v12 = [v7 integerForMessageKey:@"pid"];
  if (!v11)
  {
    DTUVRenderingServiceErrorWithDescription(15, @"No \"injectionPath\" or \"launchedPath\" provided for \"connectToPreviewHost\": %@", v13, v14, v15, v16, v17, v18, (uint64_t)v7);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    if (v31) {
      goto LABEL_12;
    }
    uint64_t v32 = [MEMORY[0x263F08690] currentHandler];
    v33 = v32;
    SEL v34 = a2;
    id v35 = self;
    uint64_t v36 = 186;
LABEL_20:
    [v32 handleFailureInMethod:v34 object:v35 file:@"DTUVRenderingService.m" lineNumber:v36 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v28 = 0;
    goto LABEL_18;
  }
  uint64_t v19 = v12;
  if (v12)
  {
    id v38 = 0;
    id v20 = DVTIFAttachToProcess(v12, v11, @"__SERVICEHUB_ATTACH_POINT__", &v38);
    id v27 = v38;
    BOOL v28 = v20 != 0;
    if (v20)
    {
      [v20 resume];
      objc_storeStrong((id *)&self->_connection, v20);
      uint64_t v29 = (void *)[v7 newReply];
      [v29 setInteger:1 forMessageKey:@"success"];
      uint64_t v30 = [(DTXService *)self channel];
      [v30 sendControlAsync:v29 replyHandler:0];
    }
    else
    {
      DTUVRenderingServiceErrorWithDescription(17, @"connectToPreviewHost: Failed to connect to %d: %@", v21, v22, v23, v24, v25, v26, v19);
      id v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
LABEL_15:

        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_16;
      }
      uint64_t v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"DTUVRenderingService.m" lineNumber:202 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];
      id v27 = 0;
    }

    id v31 = v27;
    goto LABEL_15;
  }
  DTUVRenderingServiceErrorWithDescription(16, @"No \"pid\" provided for \"connectToPreviewHost\": %@", v13, v14, v15, v16, v17, v18, (uint64_t)v7);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    uint64_t v32 = [MEMORY[0x263F08690] currentHandler];
    v33 = v32;
    SEL v34 = a2;
    id v35 = self;
    uint64_t v36 = 189;
    goto LABEL_20;
  }
LABEL_12:
  BOOL v28 = 0;
  if (!a4) {
    goto LABEL_18;
  }
LABEL_16:
  if (v31)
  {
    id v31 = v31;
    *a4 = v31;
  }
LABEL_18:

  return v28;
}

- (BOOL)processCommand:(id)a3 fromMessage:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if ([v9 isEqualToString:@"startCLI"])
  {
    uint64_t v25 = 0;
    uint64_t v11 = (id *)&v25;
    BOOL v12 = [(DTUVRenderingService *)self processStartCLIFromMessage:v10 error:&v25];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"forwardMessage"])
  {
    uint64_t v24 = 0;
    uint64_t v11 = (id *)&v24;
    BOOL v12 = [(DTUVRenderingService *)self processForwardMessageFromMessage:v10 error:&v24];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"connectToPreviewHost"])
  {
    uint64_t v23 = 0;
    uint64_t v11 = (id *)&v23;
    BOOL v12 = [(DTUVRenderingService *)self processConnectToPreviewHostFromMessage:v10 error:&v23];
LABEL_7:
    BOOL v19 = v12;
    id v20 = *v11;
    if (!a5) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  DTUVRenderingServiceErrorWithDescription(2, @"Unknown command \"%@\": %@", v13, v14, v15, v16, v17, v18, (uint64_t)v9);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"DTUVRenderingService.m" lineNumber:226 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v19 = 0;
    id v20 = 0;
    goto LABEL_10;
  }
  BOOL v19 = 0;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_8:
  if (v20)
  {
    id v20 = v20;
    *a5 = v20;
  }
LABEL_10:

  return v19;
}

- (BOOL)processMessage:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v14 = [v7 stringForMessageKey:@"serviceCommand"];
  if (v14)
  {
    id v19 = 0;
    BOOL v15 = [(DTUVRenderingService *)self processCommand:v14 fromMessage:v7 error:&v19];

    id v16 = v19;
    if (!a4) {
      goto LABEL_8;
    }
LABEL_6:
    if (v16)
    {
      id v16 = v16;
      *a4 = v16;
    }
    goto LABEL_8;
  }
  DTUVRenderingServiceErrorWithDescription(0, @"No \"serviceCommand\" specified for message: %@", v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"DTUVRenderingService.m" lineNumber:244 description:@"rdar://98220290 False positive nil passed to a callee that requires a non-null parameter"];

    BOOL v15 = 0;
    goto LABEL_8;
  }
  BOOL v15 = 0;
  if (a4) {
    goto LABEL_6;
  }
LABEL_8:

  return v15;
}

- (void)messageReceived:(id)a3
{
  id v4 = a3;
  id v9 = 0;
  BOOL v5 = [(DTUVRenderingService *)self processMessage:v4 error:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = [(DTXService *)self channel];
    uint64_t v8 = (void *)[v4 newReplyWithError:v6];
    [v7 sendMessage:v8 replyHandler:0];
  }
}

- (void).cxx_destruct
{
}

@end