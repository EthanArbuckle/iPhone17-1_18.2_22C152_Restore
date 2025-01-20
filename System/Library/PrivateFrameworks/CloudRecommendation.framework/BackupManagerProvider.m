@interface BackupManagerProvider
- (BackupManagerProvider)initWithAccount:(id)a3;
- (MBManager)backupManager;
- (NSString)backupDeviceUUID;
- (void)setBackupDeviceUUID:(id)a3;
- (void)setBackupManager:(id)a3;
@end

@implementation BackupManagerProvider

- (BackupManagerProvider)initWithAccount:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BackupManagerProvider;
  v5 = [(BackupManagerProvider *)&v12 init];
  if (v5)
  {
    id v11 = 0;
    uint64_t v6 = [objc_alloc(MEMORY[0x263F559D8]) initWithAccount:v4 delegate:0 eventQueue:0 error:&v11];
    id v7 = v11;
    backupManager = v5->_backupManager;
    v5->_backupManager = (MBManager *)v6;

    if (v7)
    {
      v9 = _CELogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[BackupManagerProvider initWithAccount:]((uint64_t)v7, v9);
      }
    }
  }

  return v5;
}

- (NSString)backupDeviceUUID
{
  return (NSString *)[(MBManager *)self->_backupManager backupDeviceUDID];
}

- (void)setBackupDeviceUUID:(id)a3
{
}

- (MBManager)backupManager
{
  return self->_backupManager;
}

- (void)setBackupManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupManager, 0);
  objc_storeStrong((id *)&self->_backupDeviceUUID, 0);
}

- (void)initWithAccount:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[BackupManagerProvider initWithAccount:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_24A2CB000, a2, OS_LOG_TYPE_ERROR, "%s unable to init MBManager with error: %@", (uint8_t *)&v2, 0x16u);
}

@end