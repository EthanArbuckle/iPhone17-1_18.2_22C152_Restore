@interface AVTAvatarImageRenderer
- (AVTAvatarImageRenderer)init;
- (AVTAvatarImageRenderer)initWithEnvironment:(id)a3;
- (AVTAvatarImageRenderer)initWithSceneNodeModifications:(id)a3;
- (AVTAvatarImageRenderer)initWithSnapshotBuilder:(id)a3 lockProvider:(id)a4 remoteImageRenderer:(id)a5 logger:(id)a6;
- (AVTAvatarRemoteImageRenderer)remoteImageRenderer;
- (AVTSnapshotBuilder)snapshotBuilder;
- (AVTUILogger)logger;
- (OS_dispatch_queue)snapshotBuilderQueue;
- (double)fieldOfViewForNodeWithName:(id)a3;
- (id)_imageForAvatar:(id)a3 scope:(id)a4;
- (id)imageForAvatar:(id)a3 scope:(id)a4;
- (id)imageForAvatar:(id)a3 scope:(id)a4 usingService:(BOOL)a5;
- (id)imageForAvatar:(id)a3 scope:(id)a4 withSCNModifications:(id)a5 usingService:(BOOL)a6;
- (id)nts_imageForAvatar:(id)a3 scope:(id)a4;
- (void)setRemoteImageRenderer:(id)a3;
- (void)setSnapshotBuilder:(id)a3;
- (void)updateSnapshotBuilderModifications:(id)a3;
@end

@implementation AVTAvatarImageRenderer

- (OS_dispatch_queue)snapshotBuilderQueue
{
  return self->_snapshotBuilderQueue;
}

- (AVTSnapshotBuilder)snapshotBuilder
{
  snapshotBuilder = self->_snapshotBuilder;
  if (!snapshotBuilder)
  {
    v4 = (AVTSnapshotBuilder *)objc_alloc_init(MEMORY[0x263F296C0]);
    v5 = self->_snapshotBuilder;
    self->_snapshotBuilder = v4;

    snapshotBuilder = self->_snapshotBuilder;
  }
  return snapshotBuilder;
}

- (AVTAvatarImageRenderer)init
{
  v3 = +[AVTUIEnvironment defaultEnvironment];
  v4 = [(AVTAvatarImageRenderer *)self initWithEnvironment:v3];

  return v4;
}

- (AVTAvatarImageRenderer)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v5 = [v4 lockProvider];
  v6 = [v4 remoteRenderer];
  v7 = [v4 logger];

  v8 = [(AVTAvatarImageRenderer *)self initWithSnapshotBuilder:0 lockProvider:v5 remoteImageRenderer:v6 logger:v7];
  return v8;
}

- (AVTAvatarImageRenderer)initWithSnapshotBuilder:(id)a3 lockProvider:(id)a4 remoteImageRenderer:(id)a5 logger:(id)a6
{
  id v11 = a3;
  v12 = (void (**)(id, const char *))a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTAvatarImageRenderer;
  v15 = [(AVTAvatarImageRenderer *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_snapshotBuilder, a3);
    objc_storeStrong((id *)&v16->_remoteImageRenderer, a5);
    objc_storeStrong((id *)&v16->_logger, a6);
    uint64_t v17 = v12[2](v12, "com.apple.AvatarUI.avatarSnapshotBuilderRenderingQueue");
    snapshotBuilderQueue = v16->_snapshotBuilderQueue;
    v16->_snapshotBuilderQueue = (OS_dispatch_queue *)v17;
  }
  return v16;
}

- (AVTAvatarImageRenderer)initWithSceneNodeModifications:(id)a3
{
  [(AVTAvatarImageRenderer *)self updateSnapshotBuilderModifications:a3];
  id v4 = +[AVTUIEnvironment defaultEnvironment];
  v5 = [v4 lockProvider];
  v6 = [v4 remoteRenderer];
  v7 = [v4 logger];
  v8 = [(AVTAvatarImageRenderer *)self snapshotBuilder];
  v9 = [(AVTAvatarImageRenderer *)self initWithSnapshotBuilder:v8 lockProvider:v5 remoteImageRenderer:v6 logger:v7];

  return v9;
}

- (void)updateSnapshotBuilderModifications:(id)a3
{
  id v4 = a3;
  [v4 verticalLensShift];
  LODWORD(v5) = 0;
  HIDWORD(v5) = v6;
  double v11 = v5;
  id v12 = [(AVTAvatarImageRenderer *)self snapshotBuilder];
  v7 = [v4 framingMode];
  uint64_t v8 = [v4 projectionDirection];
  [v4 fieldOfView];
  double v10 = v9;

  objc_msgSend(v12, "deprecated_avtui_applyModificationsForFramingMode:projectionDirectionModification:fieldOfViewModification:lensShiftModification:", v7, v8, v10, v11);
}

- (double)fieldOfViewForNodeWithName:(id)a3
{
  id v4 = a3;
  double v5 = [(AVTAvatarImageRenderer *)self snapshotBuilder];
  objc_msgSend(v5, "deprecated_avtui_fieldOfViewForFramingMode:", v4);
  double v7 = v6;

  return v7;
}

- (id)imageForAvatar:(id)a3 scope:(id)a4
{
  return [(AVTAvatarImageRenderer *)self imageForAvatar:a3 scope:a4 usingService:0];
}

- (id)imageForAvatar:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  return [(AVTAvatarImageRenderer *)self imageForAvatar:a3 scope:a4 withSCNModifications:0 usingService:a5];
}

- (id)_imageForAvatar:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  objc_super v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  uint64_t v8 = [(AVTAvatarImageRenderer *)self snapshotBuilderQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__AVTAvatarImageRenderer__imageForAvatar_scope___block_invoke;
  v13[3] = &unk_263FF1160;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

uint64_t __48__AVTAvatarImageRenderer__imageForAvatar_scope___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "nts_imageForAvatar:scope:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)imageForAvatar:(id)a3 scope:(id)a4 withSCNModifications:(id)a5 usingService:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v6)
  {
    id v14 = [(AVTAvatarImageRenderer *)self remoteImageRenderer];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    id v30 = 0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    v16 = v15;
    if (v13)
    {
      uint64_t v17 = v24;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke;
      v24[3] = &unk_263FF1188;
      v24[5] = &v25;
      v24[4] = v15;
      [v14 getSnapshotForAvatar:v10 scope:v11 withModifications:v13 withReply:v24];
    }
    else
    {
      uint64_t v17 = v23;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke_2;
      v23[3] = &unk_263FF1188;
      v23[5] = &v25;
      v23[4] = v15;
      [v14 getSnapshotForAvatar:v10 scope:v11 withReply:v23];
    }

    dispatch_time_t v19 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v16, v19))
    {
      objc_super v20 = [(AVTAvatarImageRenderer *)self logger];
      v21 = [v10 description];
      [v20 logTimedOutWaitingForSnapshotInService:v21];
    }
    id v18 = (id)v26[5];

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    if (v12) {
      [(AVTAvatarImageRenderer *)self updateSnapshotBuilderModifications:v12];
    }
    id v18 = [(AVTAvatarImageRenderer *)self _imageForAvatar:v10 scope:v11];
  }

  return v18;
}

void __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __81__AVTAvatarImageRenderer_imageForAvatar_scope_withSCNModifications_usingService___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)nts_imageForAvatar:(id)a3 scope:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(AVTAvatarImageRenderer *)self snapshotBuilder];
  [(id)v8 setAvatar:v7];

  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if (v8) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  uint64_t v22 = *MEMORY[0x263F29628];
  v23[0] = &unk_26BF4D538;
  id v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:1];
  id v11 = (void *)[v10 mutableCopy];

  id v12 = [v6 adaptedFramingModeForObjectType:v9];
  id v13 = [v6 pose];
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F29618]];
  }
  if (v13) {
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x263F29620]];
  }
  id v14 = [(AVTAvatarImageRenderer *)self snapshotBuilder];
  [v6 size];
  double v16 = v15;
  double v18 = v17;
  [v6 scale];
  objc_super v20 = objc_msgSend(v14, "imageWithSize:scale:options:", v11, v16, v18, v19);

  return v20;
}

- (void)setSnapshotBuilder:(id)a3
{
}

- (AVTAvatarRemoteImageRenderer)remoteImageRenderer
{
  return self->_remoteImageRenderer;
}

- (void)setRemoteImageRenderer:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBuilderQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_remoteImageRenderer, 0);
  objc_storeStrong((id *)&self->_snapshotBuilder, 0);
}

@end