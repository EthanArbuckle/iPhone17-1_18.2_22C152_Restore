@interface PHASESharedListener
- (BOOL)addChild:(id)a3 error:(id *)a4;
- (PHASESharedListener)initWithEngine:(id)a3;
- (PHASESharedListener)initWithEngine:(id)a3 entityType:(unsigned int)a4;
- (id)initInternalWithEngine:(id)a3;
- (int64_t)updateMode;
- (void)dealloc;
- (void)removeChild:(id)a3;
- (void)removeChildren;
- (void)setGain:(double)a3;
- (void)setTransform:(double)a3;
- (void)setUpdateMode:(int64_t)a3;
@end

@implementation PHASESharedListener

- (PHASESharedListener)initWithEngine:(id)a3
{
  return 0;
}

- (PHASESharedListener)initWithEngine:(id)a3 entityType:(unsigned int)a4
{
  return 0;
}

- (id)initInternalWithEngine:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASESharedListener;
  v5 = [(PHASEListener *)&v9 initWithEngine:v4 entityType:0];
  if (v5)
  {
    uint64_t v6 = *(void *)([v4 implementation] + 488);
    if (!v6)
    {
      v7 = 0;
      goto LABEL_6;
    }
    [(PHASEObject *)v5 setGeoEntityHandle:(*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6)];
  }
  v7 = v5;
LABEL_6:

  return v7;
}

- (void)setUpdateMode:(int64_t)a3
{
  v5 = [(PHASEObject *)self engine];
  if (v5)
  {
    id v9 = v5;
    uint64_t v6 = [v5 implementation];
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 488);
      if (v7)
      {
        BOOL ListenerUpdateModeFromEnum = Phase::GetListenerUpdateModeFromEnum((Phase::Logger *)a3);
        (*(void (**)(uint64_t, BOOL))(*(void *)v7 + 32))(v7, ListenerUpdateModeFromEnum);
      }
    }
    self->_updateMode = a3;
    v5 = v9;
  }
}

- (void)dealloc
{
  v3 = [(PHASEObject *)self engine];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 implementation];
    if (v5)
    {
      uint64_t v6 = *(void *)(v5 + 488);
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
      }
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)PHASESharedListener;
  [(PHASEObject *)&v7 dealloc];
}

- (void)setGain:(double)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHASESharedListener;
    [(PHASEListener *)&v6 setGain:a3];
  }
  else
  {
    uint64_t v5 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "PHASESharedListener.mm";
      __int16 v9 = 1024;
      int v10 = 86;
      _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting PHASESharedListener's gain has no effect", buf, 0x12u);
    }
  }
}

- (void)setTransform:(double)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  objc_super v6 = [a1 engine];
  objc_super v7 = v6;
  if (v6)
  {
    if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
      dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
    }
    if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
    {
      mach_absolute_time();
      uint64_t v8 = __udivti3();
      long long v24 = xmmword_2220A4E00;
      float v25 = 0.0;
      uint64_t v26 = 0;
      int v27 = 1065353216;
      v23.receiver = a1;
      v23.super_class = (Class)PHASESharedListener;
      __int16 v9 = (Phase::Logger *)-[PHASEObject validateTransform:outAffine:](&v23, sel_validateTransform_outAffine_, &v24, a2, a3, a4, a5);
      if (v9)
      {
        Instance = (Phase::Logger *)Phase::Logger::GetInstance(v9);
        if (*((unsigned char *)Instance + 440))
        {
          uint64_t v11 = (Phase::Logger *)**(id **)(Phase::Logger::GetInstance(Instance) + 432);
          uint64_t v12 = Phase::Logger::GetInstance(v11);
          os_signpost_id_t v13 = os_signpost_id_generate(**(os_log_t **)(v12 + 432));
          if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            os_signpost_id_t v14 = v13;
            if (os_signpost_enabled((os_log_t)v11))
            {
              uint64_t v15 = [a1 geoEntityHandle];
              *(_DWORD *)buf = 134220032;
              v29 = (const char *)a1;
              __int16 v30 = 2048;
              uint64_t v31 = v15;
              __int16 v32 = 2048;
              double v33 = *(float *)&v24;
              __int16 v34 = 2048;
              double v35 = *((float *)&v24 + 1);
              __int16 v36 = 2048;
              double v37 = *((float *)&v24 + 2);
              __int16 v38 = 2048;
              double v39 = *((float *)&v24 + 3);
              __int16 v40 = 2048;
              double v41 = v25;
              __int16 v42 = 2048;
              double v43 = *(float *)&v26;
              __int16 v44 = 2048;
              double v45 = *((float *)&v26 + 1);
              _os_signpost_emit_with_name_impl(&dword_221E5E000, (os_log_t)v11, OS_SIGNPOST_EVENT, v14, "Phase_API_Transform_Update", "SharedListener@%p: %llu Update Rotation: [%f, %f, %f, %f], Position: [%f, %f, %f]", buf, 0x5Cu);
            }
          }
        }
        uint64_t v16 = *(void *)([(Phase::Logger *)v7 implementation] + 368);
        (*(void (**)(uint64_t, uint64_t, long long *, uint64_t))(*(void *)v16 + 264))(v16, [a1 geoEntityHandle], &v24, v8);
        v22.receiver = a1;
        v22.super_class = (Class)PHASESharedListener;
        -[PHASEObject _storeTransform:](&v22, sel__storeTransform_, a2, a3, a4, a5);
      }
    }
    else
    {
      v17 = **(id **)(Phase::Logger::GetInstance(v6) + 432);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "PHASESharedListener.mm";
        __int16 v30 = 1024;
        LODWORD(v31) = 103;
        _os_log_impl(&dword_221E5E000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Setting PHASESharedListener's transform has no effect", buf, 0x12u);
      }
    }
  }
}

- (BOOL)addChild:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v13.receiver = self;
    v13.super_class = (Class)PHASESharedListener;
    BOOL v7 = [(PHASEObject *)&v13 addChild:v6 error:a4];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F08320];
    uint64_t v20 = *MEMORY[0x263F08320];
    v21[0] = @"Cannot add child to PHASESharedListener";
    __int16 v9 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    int v10 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v9)
                                                                                        + 432)));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [(Phase::Logger *)v9 objectForKeyedSubscript:v8];
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "PHASESharedListener.mm";
      __int16 v16 = 1024;
      int v17 = 131;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v9];
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)removeChild:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (Phase::Logger *)a3;
  uint64_t v5 = v4;
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v7.receiver = self;
    v7.super_class = (Class)PHASESharedListener;
    [(PHASEObject *)&v7 removeChild:v5];
  }
  else
  {
    id v6 = **(id **)(Phase::Logger::GetInstance(v4) + 432);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v9 = "PHASESharedListener.mm";
      __int16 v10 = 1024;
      int v11 = 148;
      _os_log_impl(&dword_221E5E000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot remove child from PHASESharedListener", buf, 0x12u);
    }
  }
}

- (void)removeChildren
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v4.receiver = self;
    v4.super_class = (Class)PHASESharedListener;
    [(PHASEObject *)&v4 removeChildren];
  }
  else
  {
    v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 432);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v6 = "PHASESharedListener.mm";
      __int16 v7 = 1024;
      int v8 = 159;
      _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d Cannot remove children from PHASESharedListener", buf, 0x12u);
    }
  }
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

@end