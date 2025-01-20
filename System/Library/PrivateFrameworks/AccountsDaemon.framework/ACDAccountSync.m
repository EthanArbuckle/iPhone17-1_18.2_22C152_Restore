@interface ACDAccountSync
+ (id)accountSyncPropertiesForAccount:(id)a3;
+ (id)accountSyncSupportedTypes;
+ (id)accountSyncUnsupportedTypes;
+ (id)sharedAccountSyncServer;
+ (void)sharedAccountSyncServer;
- (ACDAccountSync)init;
- (BOOL)checkCircleState;
- (void)dealloc;
@end

@implementation ACDAccountSync

+ (id)sharedAccountSyncServer
{
  v2 = _ACDLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[ACDAccountSync sharedAccountSyncServer]();
  }

  return 0;
}

+ (id)accountSyncUnsupportedTypes
{
  v11[14] = *MEMORY[0x263EF8340];
  uint64_t v2 = *MEMORY[0x263EFAEE0];
  v11[0] = *MEMORY[0x263EFAE68];
  v11[1] = v2;
  uint64_t v3 = *MEMORY[0x263EFAEA0];
  v11[2] = *MEMORY[0x263EFAF00];
  v11[3] = v3;
  uint64_t v4 = *MEMORY[0x263EFAFD0];
  v11[4] = *MEMORY[0x263EFAF48];
  v11[5] = v4;
  uint64_t v5 = *MEMORY[0x263EFAEC0];
  v11[6] = *MEMORY[0x263EFAFA0];
  v11[7] = v5;
  uint64_t v6 = *MEMORY[0x263EFAFD8];
  v11[8] = *MEMORY[0x263EFAED8];
  v11[9] = v6;
  uint64_t v7 = *MEMORY[0x263EFAFF8];
  v11[10] = *MEMORY[0x263EFAFC0];
  v11[11] = v7;
  uint64_t v8 = *MEMORY[0x263EFAF68];
  v11[12] = *MEMORY[0x263EFAFB8];
  v11[13] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:14];

  return v9;
}

+ (id)accountSyncSupportedTypes
{
  return (id)MEMORY[0x263EFFA68];
}

- (ACDAccountSync)init
{
  v3.receiver = self;
  v3.super_class = (Class)ACDAccountSync;
  return [(ACDAccountSync *)&v3 init];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ACDAccountSync;
  [(ACDAccountSync *)&v4 dealloc];
}

- (BOOL)checkCircleState
{
  self->_enabled = 0;
  return 0;
}

+ (id)accountSyncPropertiesForAccount:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

+ (void)sharedAccountSyncServer
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Account Sync - sharedAccountSyncServer is deprecated\"", v2, v3, v4, v5, v6);
}

@end