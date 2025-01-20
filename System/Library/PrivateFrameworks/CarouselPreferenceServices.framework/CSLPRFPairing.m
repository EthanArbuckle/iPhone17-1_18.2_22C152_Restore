@interface CSLPRFPairing
+ (CSLPRFPairing)shared;
- (BOOL)isTinker;
- (CSLPRFPairing)init;
- (void)_didPair:(id)a3;
@end

@implementation CSLPRFPairing

- (BOOL)isTinker
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isTinker = v2->_isTinker;
  objc_sync_exit(v2);

  return isTinker;
}

- (void)_didPair:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x263F576A8] object:0];
  v6 = self;
  objc_sync_enter(v6);
  v6->_BOOL isTinker = _CSLPairingIsTinker();
  v7 = cslprf_systemstate_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL isTinker = v6->_isTinker;
    v9[0] = 67109120;
    v9[1] = isTinker;
    _os_log_impl(&dword_22F4EA000, v7, OS_LOG_TYPE_INFO, "Pairing didPair isTinker? %d", (uint8_t *)v9, 8u);
  }

  objc_sync_exit(v6);
}

- (CSLPRFPairing)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFPairing;
  v2 = [(CSLPRFPairing *)&v7 init];
  if (v2)
  {
    v2->_BOOL isTinker = _CSLPairingIsTinker();
    v3 = cslprf_systemstate_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL isTinker = v2->_isTinker;
      *(_DWORD *)buf = 67109120;
      BOOL v9 = isTinker;
      _os_log_impl(&dword_22F4EA000, v3, OS_LOG_TYPE_INFO, "Pairing init isTinker? %d", buf, 8u);
    }

    if (!v2->_isTinker)
    {
      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 addObserver:v2 selector:sel__didPair_ name:*MEMORY[0x263F576A8] object:0];
    }
  }
  return v2;
}

+ (CSLPRFPairing)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __23__CSLPRFPairing_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_Shared;
  return (CSLPRFPairing *)v2;
}

uint64_t __23__CSLPRFPairing_shared__block_invoke(uint64_t a1)
{
  shared_Shared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

@end