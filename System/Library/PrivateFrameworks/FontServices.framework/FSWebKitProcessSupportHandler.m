@interface FSWebKitProcessSupportHandler
- (FSWebKitProcessSupportHandler)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (void)checkin:(id)a3 reply:(id)a4;
- (void)ping:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation FSWebKitProcessSupportHandler

- (FSWebKitProcessSupportHandler)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FSWebKitProcessSupportHandler;
  v6 = [(FSWebKitProcessSupportHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)checkin:(id)a3 reply:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *))a4;
  id v6 = a3;
  NSLog(&cfstr_FswebkitChecki.isa);
  v7 = +[FontServicesDaemonManager sharedManager];
  [v7 checkinForWebKitProcess:v6 reply:&__block_literal_global_80_0];

  v8 = (void *)GSFontCopyLocallyActivatedFontFilePaths();
  if (v8)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v9 = [MEMORY[0x1E4F29268] currentConnection];
    v10 = v9;
    if (v9)
    {
      [v9 auditToken];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }

    v11 = SandboxExtensionsForPathsAndAuditToken(v8);
    v15 = kFSWebKitSupportParamLocallyActivatedFontsKey;
    v16[0] = v11;
    v12 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1, v13, v14);
    v5[2](v5, v12);
  }
}

- (void)ping:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end