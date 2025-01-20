@interface PHASEXPCService
+ (id)sharedInstance;
+ (id)sharedInstanceWithPlatform:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PHASEXPCService)init;
- (PHASEXPCService)initWithXPCListener:(id)a3;
- (unint64_t)newConnectionUID;
- (void)resumeListener;
@end

@implementation PHASEXPCService

+ (id)sharedInstance
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = (void *)sPhaseService;
  if (!sPhaseService)
  {
    v3 = [PHASEXPCService alloc];
    v4 = [MEMORY[0x263F08D88] anonymousListener];
    uint64_t v5 = [(PHASEXPCService *)v3 initWithXPCListener:v4];
    v6 = (void *)sPhaseService;
    sPhaseService = v5;

    v8 = **(id **)(Phase::Logger::GetInstance(v7) + 848);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      v11 = "PHASEXPCService.mm";
      __int16 v12 = 1024;
      int v13 = 57;
      __int16 v14 = 2048;
      uint64_t v15 = sPhaseService;
      _os_log_impl(&dword_221E5E000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: created service@%p with anonymous listener", (uint8_t *)&v10, 0x1Cu);
    }
    gInProcessServer = 1;
    v2 = (void *)sPhaseService;
  }

  return v2;
}

+ (id)sharedInstanceWithPlatform:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = sPhaseService;
  if (sPhaseService
    || (+[PHASEXPCService sharedInstance],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v7 = (void *)sPhaseService,
        sPhaseService = v6,
        v7,
        (uint64_t v5 = sPhaseService) != 0))
  {
    objc_storeStrong((id *)(v5 + 32), a3);
    int v10 = **(id **)(Phase::Logger::GetInstance(v9) + 848);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315906;
      uint64_t v15 = "PHASEXPCService.mm";
      __int16 v16 = 1024;
      int v17 = 104;
      __int16 v18 = 2048;
      uint64_t v19 = sPhaseService;
      __int16 v20 = 2048;
      id v21 = v4;
      _os_log_impl(&dword_221E5E000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: set service@%p with platform@%p", (uint8_t *)&v14, 0x26u);
    }
    id v11 = (id)sPhaseService;
  }
  else
  {
    int v13 = **(id **)(Phase::Logger::GetInstance(v8) + 848);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      uint64_t v15 = "PHASEXPCService.mm";
      __int16 v16 = 1024;
      int v17 = 90;
      _os_log_impl(&dword_221E5E000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d xpcserver: Error creating service!", (uint8_t *)&v14, 0x12u);
    }
    id v11 = 0;
  }

  return v11;
}

- (PHASEXPCService)init
{
  return 0;
}

- (PHASEXPCService)initWithXPCListener:(id)a3
{
  id v5 = a3;
  if (!v5) {
    std::terminate();
  }
  uint64_t v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)PHASEXPCService;
  v7 = [(PHASEXPCService *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_connectionUIDGenerator = 1;
    ihdYoUjk3kGK = getpid();
    platform = v8->_platform;
    v8->_platform = 0;

    objc_storeStrong((id *)&v8->_mainListener, a3);
    [(NSXPCListener *)v8->_mainListener setDelegate:v8];
    int v10 = v8;
  }

  return v8;
}

- (void)resumeListener
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 848);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315906;
    id v5 = "PHASEXPCService.mm";
    __int16 v6 = 1024;
    int v7 = 147;
    __int16 v8 = 2048;
    v9 = self;
    __int16 v10 = 1024;
    int v11 = ihdYoUjk3kGK;
    _os_log_impl(&dword_221E5E000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d xpcserver: service@%p (server pid %d) - resuming listener", (uint8_t *)&v4, 0x22u);
  }
  [(NSXPCListener *)self->_mainListener resume];
}

- (unint64_t)newConnectionUID
{
  unint64_t connectionUIDGenerator = self->_connectionUIDGenerator;
  self->_unint64_t connectionUIDGenerator = connectionUIDGenerator + 1;
  return connectionUIDGenerator;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v4 = **(id **)(Phase::Logger::GetInstance((Phase::Logger *)self) + 848);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    int v7 = "PHASEXPCService.mm";
    __int16 v8 = 1024;
    int v9 = 271;
    _os_log_impl(&dword_221E5E000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: not setup to accept any connection to PhaseXPCService!", (uint8_t *)&v6, 0x12u);
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_mainListener, 0);

  objc_storeStrong((id *)&self->_interface, 0);
}

@end