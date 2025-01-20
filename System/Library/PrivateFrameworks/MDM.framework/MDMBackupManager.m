@interface MDMBackupManager
- (MBManager)manager;
- (MDMBackupManager)init;
- (MDMBackupManager)initWithPersonaIdentifier:(id)a3;
- (NSString)personaIdentifier;
- (OS_dispatch_queue)queue;
- (void)isCloudBackupInProgressWithCompletion:(id)a3;
- (void)setManager:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation MDMBackupManager

- (MDMBackupManager)init
{
  return [(MDMBackupManager *)self initWithPersonaIdentifier:0];
}

- (MDMBackupManager)initWithPersonaIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDMBackupManager;
  v6 = [(MDMBackupManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_personaIdentifier, a3);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mdm.MDMBackupManager", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F559D8]) initWithDelegate:v7 eventQueue:v7->_queue personaIdentifier:v5];
    manager = v7->_manager;
    v7->_manager = (MBManager *)v10;
  }
  return v7;
}

- (void)isCloudBackupInProgressWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMBackupManager *)self manager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__MDMBackupManager_isCloudBackupInProgressWithCompletion___block_invoke;
  v7[3] = &unk_264B9D2A8;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchiCloudRestoreIsCompleteWithCompletion:v7];
}

uint64_t __58__MDMBackupManager_isCloudBackupInProgressWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (MBManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
}

@end