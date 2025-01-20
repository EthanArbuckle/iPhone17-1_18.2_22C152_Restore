@interface BCSXPCDaemonConnection
- (BCSXPCDaemonProtocol)remoteObjectProxy;
- (id)initWithMachServiceName:(void *)a3 exportedClient:;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)resume;
- (void)setExportedClient:(id)a3;
@end

@implementation BCSXPCDaemonConnection

- (void)resume
{
  if (self) {
    self = (BCSXPCDaemonConnection *)self->_connection;
  }
  [(BCSXPCDaemonConnection *)self resume];
}

- (id)initWithMachServiceName:(void *)a3 exportedClient:
{
  v20[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)BCSXPCDaemonConnection;
    a1 = (id *)objc_msgSendSuper2(&v18, sel_init);
    if (a1)
    {
      v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C62E728];
      v8 = (void *)MEMORY[0x263EFFA08];
      v20[0] = objc_opt_class();
      v20[1] = objc_opt_class();
      v20[2] = objc_opt_class();
      v20[3] = objc_opt_class();
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
      v10 = [v8 setWithArray:v9];
      [v7 setClasses:v10 forSelector:sel_fetchBusinessMetadataForEmails_forClientBundleID_requestId_completion_ argumentIndex:0 ofReply:1];

      uint64_t v11 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v5 options:0];
      id v12 = a1[1];
      a1[1] = (id)v11;

      [a1[1] setRemoteObjectInterface:v7];
      v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C62BD88];
      v14 = (void *)MEMORY[0x263EFFA08];
      v19[0] = objc_opt_class();
      v19[1] = objc_opt_class();
      v19[2] = objc_opt_class();
      v19[3] = objc_opt_class();
      v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
      v16 = [v14 setWithArray:v15];
      [v13 setClasses:v16 forSelector:sel_didFetchBusinessMetadataForEmailsForRequestId_error_reply_ argumentIndex:0 ofReply:0];

      [a1[1] setExportedInterface:v13];
      [a1[1] setExportedObject:v6];
    }
  }

  return a1;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  if (self) {
    self = (BCSXPCDaemonConnection *)self->_connection;
  }
  return [(BCSXPCDaemonConnection *)self synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (BCSXPCDaemonProtocol)remoteObjectProxy
{
  if (self) {
    self = (BCSXPCDaemonConnection *)self->_connection;
  }
  return [(BCSXPCDaemonConnection *)self remoteObjectProxy];
}

- (void)setExportedClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedClient);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end