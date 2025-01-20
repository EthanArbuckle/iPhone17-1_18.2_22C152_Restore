@interface PHASEExternalStream
+ (id)new;
+ (id)newUUID;
- (BOOL)paused;
- (NSUUID)uuid;
- (PHASEExternalStream)init;
- (PHASEExternalStream)initWithEngine:(id)a3 streamGroupUUID:(id)a4 streamUUID:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7;
- (PHASEExternalStreamDelegate)delegate;
- (id)engine;
- (id)streamUUID;
- (unsigned)latencyInFrames;
- (void)dealloc;
- (void)pause;
- (void)resume;
- (void)setPause:(BOOL)a3 completion:(id)a4;
- (void)stopAndInvalidate;
@end

@implementation PHASEExternalStream

- (PHASEExternalStream)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (PHASEExternalStream)initWithEngine:(id)a3 streamGroupUUID:(id)a4 streamUUID:(id)a5 startsPaused:(BOOL)a6 delegate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PHASEExternalStream;
  v15 = [(PHASEExternalStream *)&v21 init];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    streamGroupUUID = v15->_streamGroupUUID;
    v15->_streamGroupUUID = (NSUUID *)v16;

    uint64_t v18 = [v13 copy];
    streamUUID = v15->_streamUUID;
    v15->_streamUUID = (NSUUID *)v18;

    objc_storeWeak((id *)&v15->_delegate, v14);
    objc_storeWeak((id *)&v15->_engine, v11);
    atomic_store(0, (unsigned __int8 *)&v15->_invalidated);
  }

  return v15;
}

- (void)dealloc
{
  [(PHASEExternalStream *)self stopAndInvalidate];
  v3.receiver = self;
  v3.super_class = (Class)PHASEExternalStream;
  [(PHASEExternalStream *)&v3 dealloc];
}

+ (id)newUUID
{
  return objc_alloc_init(MEMORY[0x263F08C38]);
}

- (void)setPause:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v14[1] = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = [WeakRetained implementation];
    (*(void (**)(void, NSUUID *, NSUUID *, BOOL, void (**)(id, void *)))(**(void **)(v9 + 416)
                                                                                                 + 56))(*(void *)(v9 + 416), self->_streamGroupUUID, self->_streamUUID, v4, v6);
  }
  else
  {
    uint64_t v13 = *MEMORY[0x263F08320];
    v10 = [NSString stringWithFormat:@"External stream %@ (%@) has nil engine", self->_streamGroupUUID, self->_streamUUID];
    v14[0] = v10;
    id v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];

    id v12 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346922849 userInfo:v11];
    v6[2](v6, v12);
  }
}

- (void)pause
{
  objc_super v3 = self->_streamUUID;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__PHASEExternalStream_pause__block_invoke;
  v5[3] = &unk_2645F77D0;
  v6 = v3;
  BOOL v4 = v3;
  [(PHASEExternalStream *)self setPause:1 completion:v5];
}

void __28__PHASEExternalStream_pause__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    v5 = **(id **)(Phase::Logger::GetInstance(v3) + 432);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315906;
      v8 = "PHASEExternalStream.mm";
      __int16 v9 = 1024;
      int v10 = 176;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to pause stream %@: %@", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (void)resume
{
  objc_super v3 = self->_streamUUID;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __29__PHASEExternalStream_resume__block_invoke;
  v5[3] = &unk_2645F77D0;
  uint64_t v6 = v3;
  BOOL v4 = v3;
  [(PHASEExternalStream *)self setPause:0 completion:v5];
}

void __29__PHASEExternalStream_resume__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    v5 = **(id **)(Phase::Logger::GetInstance(v3) + 432);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315906;
      v8 = "PHASEExternalStream.mm";
      __int16 v9 = 1024;
      int v10 = 188;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to resume stream %@: %@", (uint8_t *)&v7, 0x26u);
    }
  }
}

- (id)engine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_engine);

  return WeakRetained;
}

- (NSUUID)uuid
{
  return self->_streamGroupUUID;
}

- (id)streamUUID
{
  return self->_streamUUID;
}

- (void)stopAndInvalidate
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_invalidated.__a_.__a_value, 1u) & 1) == 0)
  {
    objc_super v3 = [(PHASEExternalStream *)self engine];
    if (v3)
    {
      BOOL v4 = self->_streamGroupUUID;
      v5 = self->_streamUUID;
      uint64_t v6 = *(void *)([v3 implementation] + 416);
      (*(void (**)(uint64_t, NSUUID *, NSUUID *, uint64_t, void *))(*(void *)v6 + 56))(v6, v4, v5, 1, &__block_literal_global_3);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __40__PHASEExternalStream_stopAndInvalidate__block_invoke_2;
      v9[3] = &unk_2645F77F8;
      int v7 = v5;
      int v10 = v7;
      v8 = v4;
      __int16 v11 = v8;
      (*(void (**)(uint64_t, NSUUID *, NSUUID *, void *))(*(void *)v6 + 32))(v6, v8, v7, v9);
      (*(void (**)(uint64_t, NSUUID *))(*(void *)v6 + 80))(v6, v7);
    }
  }
}

void __40__PHASEExternalStream_stopAndInvalidate__block_invoke_2(Phase::Logger *a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a2)
  {
    objc_super v3 = **(id **)(Phase::Logger::GetInstance(a1) + 432);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *((void *)a1 + 4);
      uint64_t v5 = *((void *)a1 + 5);
      int v6 = 136315906;
      int v7 = "PHASEExternalStream.mm";
      __int16 v8 = 1024;
      int v9 = 233;
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to invalidate stream %@ in group %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (PHASEExternalStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHASEExternalStreamDelegate *)WeakRetained;
}

- (BOOL)paused
{
  return self->_paused;
}

- (unsigned)latencyInFrames
{
  return self->_latencyInFrames;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_engine);
  objc_storeStrong((id *)&self->_streamUUID, 0);

  objc_storeStrong((id *)&self->_streamGroupUUID, 0);
}

@end