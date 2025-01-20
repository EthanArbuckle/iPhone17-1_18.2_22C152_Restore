@interface AVTAvatarRemoteImageRenderer
- (AVTAvatarRemoteImageRenderer)init;
- (AVTAvatarRemoteImageRenderer)initWithEnvironment:(id)a3;
- (AVTUILogger)logger;
- (NSXPCConnection)connection;
- (id)_setupConnection;
- (void)_requestStickerAndCacheWithProxy:(id)a3 avatarRecord:(id)a4 stickerPackName:(id)a5 stickerConfigurationName:(id)a6 resource:(id)a7 reply:(id)a8;
- (void)_startRequestWithRetryCount:(unint64_t)a3 withReply:(id)a4 connectionRequestHandler:(id)a5;
- (void)_tearDownService;
- (void)getSnapshotAndCacheForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6;
- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5;
- (void)getStickerAndCacheForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7;
@end

@implementation AVTAvatarRemoteImageRenderer

- (AVTAvatarRemoteImageRenderer)init
{
  v3 = +[AVTUIEnvironment defaultEnvironment];
  v4 = [(AVTAvatarRemoteImageRenderer *)self initWithEnvironment:v3];

  return v4;
}

- (AVTAvatarRemoteImageRenderer)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarRemoteImageRenderer;
  v5 = [(AVTAvatarRemoteImageRenderer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 logger];
    logger = v5->_logger;
    v5->_logger = (AVTUILogger *)v6;
  }
  return v5;
}

- (id)_setupConnection
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.MemojiImageRenderService"];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BF94EC8];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    objc_initWeak(&location, v2);
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2050000000;
    v11[3] = v2->_connection;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __48__AVTAvatarRemoteImageRenderer__setupConnection__block_invoke;
    v9[3] = &unk_263FF17C0;
    objc_copyWeak(&v10, &location);
    v9[4] = v11;
    uint64_t v6 = (void *)MEMORY[0x210530210](v9);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:v6];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:v6];
    [(NSXPCConnection *)v2->_connection resume];

    objc_destroyWeak(&v10);
    _Block_object_dispose(v11, 8);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  v7 = v2->_connection;
  return v7;
}

void __48__AVTAvatarRemoteImageRenderer__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = WeakRetained;
    objc_sync_enter(v3);
    id v4 = (void *)v3[1];
    if (v4 == *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v3[1] = 0;
    }
    objc_sync_exit(v3);

    id WeakRetained = v5;
  }
}

- (void)_tearDownService
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)_startRequestWithRetryCount:(unint64_t)a3 withReply:(id)a4 connectionRequestHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2050000000;
  v25[3] = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  uint64_t v24 = 0;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __95__AVTAvatarRemoteImageRenderer__startRequestWithRetryCount_withReply_connectionRequestHandler___block_invoke;
  v13[3] = &unk_263FF17E8;
  objc_copyWeak(v19, &location);
  v16 = &v21;
  id v10 = v8;
  v13[4] = self;
  id v14 = v10;
  v17 = v25;
  v18 = v26;
  v19[1] = (id)a3;
  id v11 = v9;
  id v15 = v11;
  v12 = (void (**)(void, void))[v13 copy];
  v22[3] = (uint64_t)v12;
  v12[2](v12, 0);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v26, 8);
}

void __95__AVTAvatarRemoteImageRenderer__startRequestWithRetryCount_withReply_connectionRequestHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v4 = (void *)MEMORY[0x210530210](*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  if (!WeakRetained) {
    goto LABEL_6;
  }
  if (!v8) {
    goto LABEL_7;
  }
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  uint64_t v6 = (void *)*((void *)WeakRetained + 1);
  if (v6 == *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    *((void *)WeakRetained + 1) = 0;
  }
  objc_sync_exit(v5);

  [*((id *)WeakRetained + 2) logImageRenderServiceConnectionError:v8];
  if (++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) <= *(void *)(a1 + 88))
  {
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = (id)[WeakRetained _setupConnection];
    v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) remoteObjectProxyWithErrorHandler:v4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTAvatarRemoteImageRenderer *)self _setupConnection];
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke;
  v17[3] = &unk_263FF1810;
  v17[4] = self;
  v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke_2;
  v15[3] = &unk_263FF1838;
  id v16 = v8;
  id v14 = v8;
  [v13 requestImageForAvatar:v10 scope:v9 withReply:v15];
}

uint64_t __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) logImageRenderServiceConnectionError:a2];
}

uint64_t __69__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSnapshotForAvatar:(id)a3 scope:(id)a4 withModifications:(id)a5 withReply:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AVTAvatarRemoteImageRenderer *)self _setupConnection];
  connection = self->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke;
  v20[3] = &unk_263FF1810;
  v20[4] = self;
  id v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke_2;
  v18[3] = &unk_263FF1838;
  id v19 = v10;
  id v17 = v10;
  [v16 requestImageForAvatar:v13 scope:v12 withModifications:v11 withReply:v18];
}

uint64_t __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) logImageRenderServiceConnectionError:a2];
}

uint64_t __87__AVTAvatarRemoteImageRenderer_getSnapshotForAvatar_scope_withModifications_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getSnapshotAndCacheForAvatarRecord:(id)a3 scope:(id)a4 withReply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AVTAvatarRemoteImageRenderer *)self _setupConnection];
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke;
  v17[3] = &unk_263FF1810;
  v17[4] = self;
  id v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke_2;
  v15[3] = &unk_263FF1860;
  void v15[4] = self;
  id v16 = v8;
  id v14 = v8;
  [v13 generateAndCacheImageForAvatarRecord:v10 scope:v9 withReply:v15];
}

uint64_t __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) logImageRenderServiceConnectionError:a2];
}

void __83__AVTAvatarRemoteImageRenderer_getSnapshotAndCacheForAvatarRecord_scope_withReply___block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 logger];
    uint64_t v6 = [v4 path];
    [v5 logRetrievingSnapshotInServiceForPath:v6];

    id v7 = objc_alloc(MEMORY[0x263F1C6B0]);
    id v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];

    id v9 = (id)[v7 initWithData:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_requestStickerAndCacheWithProxy:(id)a3 avatarRecord:(id)a4 stickerPackName:(id)a5 stickerConfigurationName:(id)a6 resource:(id)a7 reply:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVTUILogger *)self->_logger logRequestedAnimojiSticker:v17];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke;
    v25[3] = &unk_263FF13E0;
    v20 = &v26;
    id v26 = v19;
    id v21 = v19;
    [v14 requestAnimojiStickerImageForAvatarRecord:v15 withStickerPackName:v16 stickerConfigurationName:v17 resource:v18 withReply:v25];
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke_2;
    v23[3] = &unk_263FF13E0;
    v20 = &v24;
    id v24 = v19;
    id v22 = v19;
    [v14 requestStickerImageForAvatarRecord:v15 withStickerPackName:v16 stickerConfigurationName:v17 resource:v18 withReply:v23];
  }
}

uint64_t __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __134__AVTAvatarRemoteImageRenderer__requestStickerAndCacheWithProxy_avatarRecord_stickerPackName_stickerConfigurationName_resource_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getStickerAndCacheForAvatarRecord:(id)a3 withStickerPackName:(id)a4 stickerConfigurationName:(id)a5 resource:(id)a6 withReply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __130__AVTAvatarRemoteImageRenderer_getStickerAndCacheForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke;
  v22[3] = &unk_263FF1888;
  v22[4] = self;
  id v23 = v12;
  id v24 = v13;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  [(AVTAvatarRemoteImageRenderer *)self _startRequestWithRetryCount:10 withReply:v17 connectionRequestHandler:v22];
}

uint64_t __130__AVTAvatarRemoteImageRenderer_getStickerAndCacheForAvatarRecord_withStickerPackName_stickerConfigurationName_resource_withReply___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _requestStickerAndCacheWithProxy:a2 avatarRecord:*(void *)(a1 + 40) stickerPackName:*(void *)(a1 + 48) stickerConfigurationName:*(void *)(a1 + 56) resource:*(void *)(a1 + 64) reply:*(void *)(a1 + 72)];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end