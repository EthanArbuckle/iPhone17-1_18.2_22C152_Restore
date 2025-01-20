@interface PHASESharedEngine
- (PHASESharedEngine)initWithUpdateMode:(int64_t)a3 error:(id *)a4;
- (PHASESharedListener)sharedListener;
- (id)rootObject;
- (id)rootObjectForSessionIOBinding:(id)a3 error:(id *)a4;
- (id)rootObjectForSessionUUID:(id)a3 error:(id *)a4;
- (id)sessionRootObjects;
- (void)gatherSharedEntityDebugInformation:(id)a3;
@end

@implementation PHASESharedEngine

- (PHASESharedEngine)initWithUpdateMode:(int64_t)a3 error:(id *)a4
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a4) {
    *a4 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PHASESharedEngine;
  v5 = [(PHASEEngine *)&v11 initWithUpdateMode:a3];
  uint64_t v6 = *MEMORY[0x263F08320];
  uint64_t v18 = *MEMORY[0x263F08320];
  v19[0] = @"PHASESharedEngine not available";
  v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v7)
                                                                                     + 432)));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = [(Phase::Logger *)v7 objectForKeyedSubscript:v6];
    *(_DWORD *)buf = 136315650;
    v13 = "PHASEEngine.mm";
    __int16 v14 = 1024;
    int v15 = 1571;
    __int16 v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
  }
  if (a4)
  {
    *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v7];
  }

  return 0;
}

- (id)rootObject
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F28D98]);
  v4 = [MEMORY[0x263EF93E0] sharedInstance];
  v5 = (void *)[v3 initWithSession:v4];

  id v12 = 0;
  uint64_t v6 = [(PHASESharedEngine *)self rootObjectForSessionIOBinding:v5 error:&v12];
  v7 = (Phase::Logger *)v12;
  v8 = v7;
  if (!v6)
  {
    v9 = **(id **)(Phase::Logger::GetInstance(v7) + 432);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "PHASEEngine.mm";
      __int16 v15 = 1024;
      int v16 = 1587;
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_221E5E000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create root for [AVAudioSession sharedInstance]: %@", buf, 0x1Cu);
    }
    v11.receiver = self;
    v11.super_class = (Class)PHASESharedEngine;
    uint64_t v6 = [(PHASEEngine *)&v11 rootObject];
  }

  return v6;
}

- (PHASESharedListener)sharedListener
{
  sharedListener = self->_sharedListener;
  if (!sharedListener)
  {
    v4 = [[PHASESharedListener alloc] initInternalWithEngine:self];
    v5 = self->_sharedListener;
    self->_sharedListener = v4;

    sharedListener = self->_sharedListener;
  }

  return sharedListener;
}

- (id)sessionRootObjects
{
  sessionRootObjects = self->_sessionRootObjects;
  if (!sessionRootObjects)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = self->_sessionRootObjects;
    self->_sessionRootObjects = v4;

    sessionRootObjects = self->_sessionRootObjects;
  }

  return sessionRootObjects;
}

- (id)rootObjectForSessionUUID:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::onceToken != -1) {
    dispatch_once(&Phase::CurrentProcessCanModifySharedEntities(void)::onceToken, &__block_literal_global_4);
  }
  if (Phase::CurrentProcessCanModifySharedEntities(void)::currentProcessCanModifySharedEntities)
  {
    v7 = [(PHASESharedEngine *)self sessionRootObjects];
    v8 = [v7 objectForKey:v6];

    if (!v8)
    {
      v8 = [[PHASESharedRoot alloc] initWithEngine:self sessionUUID:v6];
      v9 = [(PHASESharedEngine *)self sessionRootObjects];
      [v9 setObject:v8 forKey:v6];
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F08320];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = @"Insufficient permissions to access root object by UUID";
    objc_super v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v12 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v11)
                                                                                        + 432)));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(Phase::Logger *)v11 objectForKeyedSubscript:v10];
      int v15 = 136315650;
      int v16 = "PHASEEngine.mm";
      __int16 v17 = 1024;
      int v18 = 1625;
      __int16 v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_221E5E000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", (uint8_t *)&v15, 0x1Cu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v11];
    }

    v8 = 0;
  }

  return v8;
}

- (id)rootObjectForSessionIOBinding:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = v6;
  if (a4) {
    *a4 = 0;
  }
  v8 = [v6 session];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_9:
    uint64_t v20 = *MEMORY[0x263F08320];
    uint64_t v36 = *MEMORY[0x263F08320];
    v37[0] = @"rootObjectForSessionIOBinding:error: not implemented";
    __int16 v14 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
    uint64_t v21 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v14)
                                                                                        + 432)));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [(Phase::Logger *)v14 objectForKeyedSubscript:v20];
      *(_DWORD *)buf = 136315650;
      v31 = "PHASEEngine.mm";
      __int16 v32 = 1024;
      int v33 = 1658;
      __int16 v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_221E5E000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a4)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v14];
      int v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v9 = [v7 session];
  uint64_t v10 = [v9 spatialTrackingLabel];

  if (!v10) {
    goto LABEL_9;
  }
  id v11 = objc_alloc(MEMORY[0x263F08C38]);
  id v12 = [v7 session];
  v13 = [v12 spatialTrackingLabel];
  __int16 v14 = (Phase::Logger *)[v11 initWithUUIDString:v13];

  if (!v14)
  {
    uint64_t v23 = *MEMORY[0x263F08320];
    uint64_t v28 = *MEMORY[0x263F08320];
    v29 = @"AVAudioSessionIOBinding has invalid session";
    v24 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    v25 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstance(v24)
                                                                                        + 432)));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = [(Phase::Logger *)v24 objectForKeyedSubscript:v23];
      *(_DWORD *)buf = 136315650;
      v31 = "PHASEEngine.mm";
      __int16 v32 = 1024;
      int v33 = 1673;
      __int16 v34 = 2112;
      v35 = v26;
      _os_log_impl(&dword_221E5E000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);
    }
    if (a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.coreaudio.phase" code:1346913634 userInfo:v24];
    }

    __int16 v14 = 0;
LABEL_18:
    int v16 = 0;
    goto LABEL_19;
  }
  int v15 = [(PHASESharedEngine *)self sessionRootObjects];
  int v16 = [v15 objectForKey:v14];

  if (!v16)
  {
    __int16 v17 = [PHASESharedRoot alloc];
    int v18 = [v7 session];
    int v16 = [(PHASESharedRoot *)v17 initWithEngine:self session:v18 sessionUUID:v14];

    __int16 v19 = [(PHASESharedEngine *)self sessionRootObjects];
    [v19 setObject:v16 forKey:v14];
  }
LABEL_19:

  return v16;
}

- (void)gatherSharedEntityDebugInformation:(id)a3
{
  id v5 = a3;
  v4 = [(PHASEEngine *)self implementation];
  (*(void (**)(void *, id))(*v4[61] + 80))(v4[61], v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRootObjects, 0);

  objc_storeStrong((id *)&self->_sharedListener, 0);
}

@end