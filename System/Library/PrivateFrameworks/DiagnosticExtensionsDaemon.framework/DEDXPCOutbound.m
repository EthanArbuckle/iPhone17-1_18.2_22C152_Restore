@interface DEDXPCOutbound
- (DEDXPCOutbound)initWithRemoteObject:(id)a3;
- (DEDXPCProtocol)remoteObject;
- (int64_t)transportType;
- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5;
- (void)adoptFiles:(id)a3 forSession:(id)a4;
- (void)cancelSession:(id)a3;
- (void)commitSession:(id)a3;
- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5;
- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4;
- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4;
- (void)didCancelSession:(id)a3;
- (void)didCommitSession:(id)a3;
- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5;
- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5;
- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5;
- (void)getSessionStateWithSession:(id)a3;
- (void)getSessionStatusWithSession:(id)a3;
- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5;
- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6;
- (void)listAvailableExtensionsForSession:(id)a3;
- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5;
- (void)pingSession:(id)a3;
- (void)pongSession:(id)a3;
- (void)scheduleNotificationForSession:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)syncSessionStatusWithSession:(id)a3;
- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5;
- (void)unscheduleNotificationForSession:(id)a3;
- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5;
@end

@implementation DEDXPCOutbound

- (int64_t)transportType
{
  return 2;
}

- (DEDXPCOutbound)initWithRemoteObject:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDXPCOutbound;
  v5 = [(DEDXPCOutbound *)&v8 init];
  v6 = v5;
  if (v5) {
    [(DEDXPCOutbound *)v5 setRemoteObject:v4];
  }

  return v6;
}

- (void)pingSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_pingSession:", v4);
}

- (void)pongSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_pongSession:", v4);
}

- (void)listAvailableExtensionsForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_listAvailableExtensionsForSession:", v4);
}

- (void)getSessionStatusWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_getSessionStatusWithSession:", v4);
}

- (void)syncSessionStatusWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_syncSessionStatusWithSession:", v4);
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 inSession:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a3 valueForKeyPath:@"serialize"];
  v11 = (void *)v10;
  v12 = &unk_26D1AF380;
  if (v10) {
    v12 = (void *)v10;
  }
  id v13 = v12;

  v14 = [v9 valueForKeyPath:@"serialize"];

  v15 = &unk_26D1AF398;
  if (v14) {
    v15 = v14;
  }
  id v16 = v15;

  id v17 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v17, "xpc_hasCollected:isCollecting:inSession:", v13, v16, v8);
}

- (void)hasCollected:(id)a3 isCollecting:(id)a4 withIdentifiers:(id)a5 inSession:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [a3 valueForKeyPath:@"serialize"];
  v14 = (void *)v13;
  v15 = &unk_26D1AF3B0;
  if (v13) {
    v15 = (void *)v13;
  }
  id v16 = v15;

  id v17 = [v12 valueForKeyPath:@"serialize"];

  v18 = &unk_26D1AF3C8;
  if (v17) {
    v18 = v17;
  }
  id v19 = v18;

  v20 = [v11 valueForKey:@"stringValue"];

  v21 = (void *)MEMORY[0x263EFFA68];
  if (v20) {
    v21 = v20;
  }
  id v22 = v21;

  id v23 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v23, "xpc_hasCollected:isCollecting:withIdentifiers:inSession:", v16, v19, v22, v10);
}

- (void)deviceSupportsDiagnosticExtensions:(id)a3 session:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13), "serialize", (void)v16);
        [v8 addObject:v14];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  v15 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v15, "xpc_deviceSupportsDiagnosticExtensions:session:", v8, v7);
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v11, "xpc_startDiagnosticWithIdentifier:parameters:session:", v10, v9, v8);
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v14, "xpc_startDiagnosticWithIdentifier:parameters:deferRunUntil:session:", v13, v12, v11, v10);
}

- (void)finishedDiagnosticWithIdentifier:(id)a3 result:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(DEDXPCOutbound *)self remoteObject];
  id v11 = [v9 serialize];

  objc_msgSend(v12, "xpc_finishedDiagnosticWithIdentifier:result:session:", v10, v11, v8);
}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  id v8 = (id)MEMORY[0x263EFFA78];
  if (a4) {
    id v8 = a4;
  }
  id v9 = v8;
  id v10 = a5;
  id v11 = a3;
  id v12 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v12, "xpc_terminateExtension:info:session:", v11, v9, v10);
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v8, "xpc_adoptFiles:forSession:", v7, v6);
}

- (void)didAdoptFilesWithError:(id)a3 forSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v8, "xpc_didAdoptFilesWithError:forSession:", v7, v6);
}

- (void)uploadProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v9, "xpc_uploadProgress:total:session:", a3, a4, v8);
}

- (void)compressionProgress:(unint64_t)a3 total:(unint64_t)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v9, "xpc_compressionProgress:total:session:", a3, a4, v8);
}

- (void)commitSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_commitSession:", v4);
}

- (void)didCommitSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_didCommitSession:", v4);
}

- (void)cancelSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_cancelSession:", v4);
}

- (void)scheduleNotificationForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_notifySession:", v4);
}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_cancelNotifySession:", v4);
}

- (void)getSessionStateWithSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_getSessionStateWithSession:", v4);
}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v11, "xpc_addData:withFilename:forSession:", v10, v9, v8);
}

- (void)didCancelSession:(id)a3
{
  id v4 = a3;
  id v5 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v5, "xpc_didCancelSession:", v4);
}

- (void)didGetState:(int64_t)a3 info:(id)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v10, "xpc_didGetState:info:sessionID:", a3, v9, v8);
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [a3 valueForKeyPath:@"serialize"];
  id v10 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v10, "xpc_loadTextDataForExtensions:localization:sessionID:", v11, v9, v8);
}

- (void)didLoadTextDataForExtensions:(id)a3 localization:(id)a4 session:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [a3 valueForKeyPath:@"serialize"];
  id v10 = [(DEDXPCOutbound *)self remoteObject];
  objc_msgSend(v10, "xpc_didLoadTextDataForExtensions:localization:sessionID:", v11, v9, v8);
}

- (DEDXPCProtocol)remoteObject
{
  return (DEDXPCProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end