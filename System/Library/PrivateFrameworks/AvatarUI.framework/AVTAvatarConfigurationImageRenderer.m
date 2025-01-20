@interface AVTAvatarConfigurationImageRenderer
- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3;
- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3 avatar:(id)a4;
- (AVTAvatarConfigurationImageRenderer)initWithSnapshotBuilder:(id)a3 avatar:(id)a4 lockProvider:(id)a5 logger:(id)a6;
- (AVTMemoji)avatar;
- (AVTSnapshotBuilder)snapshotBuilder;
- (AVTUILogger)logger;
- (OS_dispatch_queue)snapshotBuilderQueue;
- (id)imageForAvatarConfiguration:(id)a3 scope:(id)a4;
- (id)nts_imageForAvatarConfiguration:(id)a3 scope:(id)a4;
- (void)setSnapshotBuilder:(id)a3;
@end

@implementation AVTAvatarConfigurationImageRenderer

- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3 avatar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 lockProvider];
  v9 = [v7 logger];

  v10 = [(AVTAvatarConfigurationImageRenderer *)self initWithSnapshotBuilder:0 avatar:v6 lockProvider:v8 logger:v9];
  return v10;
}

- (AVTAvatarConfigurationImageRenderer)initWithEnvironment:(id)a3
{
  return [(AVTAvatarConfigurationImageRenderer *)self initWithEnvironment:a3 avatar:0];
}

- (AVTAvatarConfigurationImageRenderer)initWithSnapshotBuilder:(id)a3 avatar:(id)a4 lockProvider:(id)a5 logger:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = (void (**)(id, const char *))a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)AVTAvatarConfigurationImageRenderer;
  v15 = [(AVTAvatarConfigurationImageRenderer *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_avatar, a4);
    p_snapshotBuilder = (id *)&v16->_snapshotBuilder;
    objc_storeStrong((id *)&v16->_snapshotBuilder, a3);
    uint64_t v18 = v13[2](v13, "com.apple.AvatarUI.snapshotBuilderRenderingQueue");
    snapshotBuilderQueue = v16->_snapshotBuilderQueue;
    v16->_snapshotBuilderQueue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v16->_logger, a6);
    if (v16->_avatar)
    {
      if (*p_snapshotBuilder) {
        objc_msgSend(*p_snapshotBuilder, "setAvatar:");
      }
    }
  }

  return v16;
}

- (AVTMemoji)avatar
{
  v2 = self;
  objc_sync_enter(v2);
  avatar = v2->_avatar;
  if (!avatar)
  {
    uint64_t v4 = [MEMORY[0x263F29698] memoji];
    v5 = v2->_avatar;
    v2->_avatar = (AVTMemoji *)v4;

    avatar = v2->_avatar;
    snapshotBuilder = v2->_snapshotBuilder;
    if (snapshotBuilder)
    {
      [(AVTSnapshotBuilder *)snapshotBuilder setAvatar:avatar];
      avatar = v2->_avatar;
    }
  }
  id v7 = avatar;
  objc_sync_exit(v2);

  return v7;
}

- (AVTSnapshotBuilder)snapshotBuilder
{
  snapshotBuilder = self->_snapshotBuilder;
  if (!snapshotBuilder)
  {
    uint64_t v4 = (AVTSnapshotBuilder *)objc_alloc_init(MEMORY[0x263F296C0]);
    v5 = self->_snapshotBuilder;
    self->_snapshotBuilder = v4;

    snapshotBuilder = self->_snapshotBuilder;
    if (self->_avatar)
    {
      -[AVTSnapshotBuilder setAvatar:](snapshotBuilder, "setAvatar:");
      snapshotBuilder = self->_snapshotBuilder;
    }
  }
  return snapshotBuilder;
}

- (id)imageForAvatarConfiguration:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__20;
  objc_super v21 = __Block_byref_object_dispose__20;
  id v22 = 0;
  v8 = [(AVTAvatarConfigurationImageRenderer *)self snapshotBuilderQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__AVTAvatarConfigurationImageRenderer_imageForAvatarConfiguration_scope___block_invoke;
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

uint64_t __73__AVTAvatarConfigurationImageRenderer_imageForAvatarConfiguration_scope___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "nts_imageForAvatarConfiguration:scope:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (id)nts_imageForAvatarConfiguration:(id)a3 scope:(id)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [(AVTAvatarConfigurationImageRenderer *)self logger];
  id v9 = [v7 description];
  [v8 logRenderingConfiguration:v9];

  id v10 = [(AVTAvatarConfigurationImageRenderer *)self avatar];
  [v7 applyToAvatar:v10 animated:0];

  uint64_t v25 = *MEMORY[0x263F29628];
  v26[0] = &unk_26BF4D5D8;
  id v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v12 = (void *)[v11 mutableCopy];

  v13 = [v6 adaptedFramingModeForObjectType:2];
  id v14 = [v6 pose];
  if (v13) {
    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F29618]];
  }
  if (v14) {
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x263F29620]];
  }
  id v15 = [(AVTAvatarConfigurationImageRenderer *)self snapshotBuilder];
  [v6 size];
  double v17 = v16;
  double v19 = v18;
  [v6 scale];
  objc_super v21 = objc_msgSend(v15, "imageWithSize:scale:options:", v12, v17, v19, v20);

  id v22 = [(AVTAvatarConfigurationImageRenderer *)self logger];
  v23 = [v21 description];
  [v22 logSnapshotReturnedImage:v23];

  return v21;
}

- (void)setSnapshotBuilder:(id)a3
{
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (OS_dispatch_queue)snapshotBuilderQueue
{
  return self->_snapshotBuilderQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotBuilderQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_snapshotBuilder, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end