@interface NWRPFileTransferSession
- (BOOL)isTarget;
- (NSData)peerPublicKey;
- (NSData)selfPublicKey;
- (NSString)targetID;
- (NSURL)temporaryDirectoryURL;
- (RPFileTransferSession)session;
- (id)completionHandler;
- (id)initAsTarget:(BOOL)a3;
- (id)receivedFileHandler;
- (void)activate;
- (void)handleProgress:(id)a3;
- (void)handleReceivedItem:(id)a3;
- (void)invalidate;
- (void)prepare;
- (void)setCompletionHandler:(id)a3;
- (void)setPeerPublicKey:(id)a3;
- (void)setReceivedFileHandler:(id)a3;
- (void)setTargetID:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
- (void)transferFileURL:(id)a3 completion:(id)a4;
@end

@implementation NWRPFileTransferSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_receivedFileHandler, 0);
}

- (RPFileTransferSession)session
{
  return self->_session;
}

- (BOOL)isTarget
{
  return self->_isTarget;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setReceivedFileHandler:(id)a3
{
}

- (id)receivedFileHandler
{
  return self->_receivedFileHandler;
}

- (void)handleProgress:(id)a3
{
  id v7 = a3;
  v4 = [(NWRPFileTransferSession *)self completionHandler];

  if (v4)
  {
    if (-[NWRPFileTransferSession isTarget](self, "isTarget") && [v7 type] == 11
      || [v7 totalFileCount] >= 1
      && (uint64_t v5 = [v7 totalFileCount], v5 == objc_msgSend(v7, "transferredFileCount")))
    {
      v6 = [(NWRPFileTransferSession *)self completionHandler];
      v6[2]();
    }
  }
}

- (void)handleReceivedItem:(id)a3
{
  id v6 = [a3 filename];
  if (v6)
  {
    v4 = [(NWRPFileTransferSession *)self receivedFileHandler];

    if (v4)
    {
      uint64_t v5 = [(NWRPFileTransferSession *)self receivedFileHandler];
      ((void (**)(void, id))v5)[2](v5, v6);
    }
  }
}

- (void)transferFileURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferItem(v7);
  v9 = *(objc_class **)(v8 + 1792);
  id v10 = a3;
  id v11 = objc_alloc_init(v9);
  [v11 setItemURL:v10];
  v12 = [v10 lastPathComponent];

  [v11 setFilename:v12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke;
  v15[3] = &unk_1E523D160;
  id v16 = v6;
  id v13 = v6;
  [v11 setCompletionHandler:v15];
  v14 = [(NWRPFileTransferSession *)self session];
  [v14 addItem:v11];
}

uint64_t __54__NWRPFileTransferSession_transferFileURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepare
{
  id v2 = [(NWRPFileTransferSession *)self session];
  [v2 prepareTemplateAndReturnError:0];
}

- (void)invalidate
{
  id v2 = [(NWRPFileTransferSession *)self session];
  [v2 invalidate];
}

- (void)activate
{
  id v2 = [(NWRPFileTransferSession *)self session];
  [v2 activate];
}

- (void)setTemporaryDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = [(NWRPFileTransferSession *)self session];
  [v5 setTemporaryDirectoryURL:v4];
}

- (NSURL)temporaryDirectoryURL
{
  id v2 = [(NWRPFileTransferSession *)self session];
  v3 = [v2 temporaryDirectoryURL];

  return (NSURL *)v3;
}

- (void)setTargetID:(id)a3
{
  id v4 = a3;
  id v5 = [(NWRPFileTransferSession *)self session];
  [v5 setTargetID:v4];
}

- (NSString)targetID
{
  id v2 = [(NWRPFileTransferSession *)self session];
  v3 = [v2 targetID];

  return (NSString *)v3;
}

- (NSData)selfPublicKey
{
  id v2 = [(NWRPFileTransferSession *)self session];
  v3 = [v2 selfPublicKey];

  return (NSData *)v3;
}

- (void)setPeerPublicKey:(id)a3
{
  id v4 = a3;
  id v5 = [(NWRPFileTransferSession *)self session];
  [v5 setPeerPublicKey:v4];
}

- (NSData)peerPublicKey
{
  id v2 = [(NWRPFileTransferSession *)self session];
  v3 = [v2 peerPublicKey];

  return (NSData *)v3;
}

- (id)initAsTarget:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NWRPFileTransferSession;
  id v4 = [(NWRPFileTransferSession *)&v15 init];
  v4->_isTarget = v3;
  objc_initWeak(&location, v4);
  gotLoadHelper_x8__OBJC_CLASS___RPFileTransferSession(v5);
  double v7 = (RPFileTransferSession *)objc_alloc_init(*(Class *)(v6 + 1800));
  session = v4->_session;
  v4->_session = v7;

  [(RPFileTransferSession *)v4->_session setFlags:v3 | 0x50u];
  [(RPFileTransferSession *)v4->_session setProgressHandlerTimeInterval:1.0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke;
  v12[3] = &unk_1E523D110;
  objc_copyWeak(&v13, &location);
  [(RPFileTransferSession *)v4->_session setReceivedItemHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__NWRPFileTransferSession_initAsTarget___block_invoke_2;
  v10[3] = &unk_1E523D138;
  objc_copyWeak(&v11, &location);
  [(RPFileTransferSession *)v4->_session setProgressHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v4;
}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(void (**)(uint64_t, void))(a3 + 16);
  id v6 = a2;
  v5(a3, 0);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleReceivedItem:v6];
}

void __40__NWRPFileTransferSession_initAsTarget___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleProgress:v3];
}

@end