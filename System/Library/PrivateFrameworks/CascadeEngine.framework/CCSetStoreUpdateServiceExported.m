@interface CCSetStoreUpdateServiceExported
- (BOOL)_setupAdminService;
- (BOOL)_setupDonateConnectionWithItemType:(unsigned __int16)a3;
- (CCSetStoreUpdateServiceExported)initWithQueue:(id)a3 process:(id)a4 connection:(id)a5 writeAccess:(id)a6 donateConnectionFactory:(id)a7;
- (id)useCase;
- (void)_setupAdminService;
- (void)abortSetDonation;
- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5;
- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8;
- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)mergeDelta:(id)a3 completion:(id)a4;
- (void)removeSetsRootDirectory:(id)a3;
- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4;
- (void)startMaintenanceActivity:(id)a3;
- (void)useCase;
@end

@implementation CCSetStoreUpdateServiceExported

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adminConnection, 0);
  objc_storeStrong((id *)&self->_donateConnection, 0);
  objc_storeStrong((id *)&self->_donateConnectionFactory, 0);
  objc_storeStrong((id *)&self->_writeAccess, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_process, 0);
}

- (void)beginSetDonationWithItemType:(unsigned __int16)a3 remoteDevice:(id)a4 encodedDescriptors:(id)a5 version:(unint64_t)a6 validity:(id)a7 completion:(id)a8
{
  uint64_t v12 = a3;
  id v17 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void (**)(id, uint64_t, void))a8;
  if ([(CCSetStoreUpdateServiceExported *)self _setupDonateConnectionWithItemType:v12])
  {
    [(CCDonateConnection *)self->_donateConnection beginSetDonationWithItemType:v12 remoteDevice:v17 encodedDescriptors:v14 version:a6 validity:v15 completion:v16];
  }
  else
  {
    v16[2](v16, 5, 0);
  }
}

- (BOOL)_setupDonateConnectionWithItemType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v5 = (void *)MEMORY[0x263F29E58];
  process = self->_process;
  v7 = [(CCSetStoreUpdateServiceExported *)self useCase];
  v8 = [v5 policyForProcess:process connectionFlags:0 useCase:v7];

  v9 = CCTypeIdentifierRegistryBridge();
  v10 = [v9 setIdentifierForItemType:v3];

  if (!v10)
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CCSetStoreUpdateServiceExported _setupDonateConnectionWithItemType:](v8);
    }

    goto LABEL_10;
  }
  if (([v8 allowsAccessToSetStoreUpdateServiceForSet:v10] & 1) == 0)
  {
    id v15 = __biome_log_for_category();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      [(CCSetStoreUpdateServiceExported *)v8 _setupDonateConnectionWithItemType:v15];
    }

LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  v11 = [(CCDonateConnectionFactory *)self->_donateConnectionFactory makeXPCConnection:self->_connection];
  donateConnection = self->_donateConnection;
  self->_donateConnection = v11;

  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)useCase
{
  uint64_t v3 = [MEMORY[0x263F08D68] currentConnection];
  v4 = objc_msgSend(v3, "bm_remoteUseCase");

  useCase = self->_useCase;
  p_useCase = (uint64_t *)&self->_useCase;
  v5 = useCase;
  if (useCase)
  {
    if (v4 && ([(NSString *)v5 isEqual:v4] & 1) == 0)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        [(CCSetStoreUpdateServiceExported *)p_useCase useCase];
      }
    }
    v9 = (void *)*p_useCase;
  }
  else
  {
    objc_storeStrong((id *)p_useCase, v4);
    v9 = v4;
  }
  id v10 = v9;

  return v10;
}

- (CCSetStoreUpdateServiceExported)initWithQueue:(id)a3 process:(id)a4 connection:(id)a5 writeAccess:(id)a6 donateConnectionFactory:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CCSetStoreUpdateServiceExported;
  id v17 = [(CCSetStoreUpdateServiceExported *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_process, a4);
    objc_storeStrong((id *)&v18->_writeAccess, a6);
    objc_storeStrong((id *)&v18->_donateConnectionFactory, a7);
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeStrong((id *)&v18->_connection, a5);
  }

  return v18;
}

- (void)endSetDonationWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)addItemsWithContents:(id)a3 metaContents:(id)a4 completion:(id)a5
{
}

- (void)abortSetDonation
{
}

- (void)removeSourceItemIdentifier:(id)a3 completion:(id)a4
{
}

- (void)mergeDelta:(id)a3 completion:(id)a4
{
}

- (BOOL)_setupAdminService
{
  if (self->_adminConnection) {
    return 1;
  }
  v4 = (void *)MEMORY[0x263F29E58];
  process = self->_process;
  v6 = [(CCSetStoreUpdateServiceExported *)self useCase];
  v7 = [v4 policyForProcess:process connectionFlags:0 useCase:v6];

  if ([v7 allowsAccessToSetsWithMode:3])
  {
    id v8 = objc_alloc(MEMORY[0x263F29E98]);
    v9 = [v8 initWithType:5 name:*MEMORY[0x263F29E10]];
    id v10 = objc_alloc(MEMORY[0x263F29E48]);
    v11 = (void *)[v10 initWithUseCase:*MEMORY[0x263F29E40]];
    id v18 = 0;
    uint64_t v12 = [v11 requestAccessToResource:v9 mode:3 error:&v18];
    id v13 = v18;
    if (v13) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v12 == 0;
    }
    BOOL v2 = !v14;
    if (v14)
    {
      p_super = __biome_log_for_category();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
        -[CCSetStoreUpdateServiceExported _setupAdminService]();
      }
    }
    else
    {
      id v15 = [[CCAdminConnection alloc] initWithConnection:self->_connection writeAccess:self->_writeAccess accessAssertion:v12];
      p_super = &self->_adminConnection->super;
      self->_adminConnection = v15;
    }
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CCSetStoreUpdateServiceExported _setupAdminService](v9);
    }
    BOOL v2 = 0;
  }

  return v2;
}

- (void)startMaintenanceActivity:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if ([(CCSetStoreUpdateServiceExported *)self _setupAdminService]) {
    [(CCAdminConnection *)self->_adminConnection startMaintenanceActivity:v4];
  }
  else {
    v4[2](v4, 2);
  }
}

- (void)removeSetsRootDirectory:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  if ([(CCSetStoreUpdateServiceExported *)self _setupAdminService]) {
    [(CCAdminConnection *)self->_adminConnection removeSetsRootDirectory:v4];
  }
  else {
    v4[2](v4, 2);
  }
}

- (void)useCase
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_249B69000, log, OS_LOG_TYPE_FAULT, "CCSetDonationServerExported - Ignoring use-case change from %@ to %@", (uint8_t *)&v4, 0x16u);
}

- (void)_setupDonateConnectionWithItemType:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 descriptionOfProcessAndUseCase];
  OUTLINED_FUNCTION_0_3(&dword_249B69000, v2, v3, "%@ could not resolve set identifier for item type %hu'", v4, v5, v6, v7, 2u);
}

- (void)_setupDonateConnectionWithItemType:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 descriptionOfProcessAndUseCase];
  OUTLINED_FUNCTION_8();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_249B69000, a3, OS_LOG_TYPE_ERROR, "%@ is not entitled to access the set store update service for set: %@", v6, 0x16u);
}

- (void)_setupAdminService
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B69000, log, OS_LOG_TYPE_ERROR, "Cannot setup admin service, process not properly entitled to access the sets directory", v1, 2u);
}

@end