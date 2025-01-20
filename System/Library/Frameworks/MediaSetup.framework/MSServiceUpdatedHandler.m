@interface MSServiceUpdatedHandler
+ (id)shared;
- (MediaServiceUpdatedClientDelegate)delegate;
- (void)defaultMediaServiceUpdated:(id)a3 homeUserID:(id)a4;
- (void)mediaServiceChanged:(id)a3 homeUserID:(id)a4;
- (void)mediaServiceRemoved:(id)a3 homeUserID:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MSServiceUpdatedHandler

+ (id)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MSServiceUpdatedHandler_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, block);
  }
  v2 = (void *)shared_sShared;

  return v2;
}

uint64_t __33__MSServiceUpdatedHandler_shared__block_invoke(uint64_t a1)
{
  shared_sShared = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  v5 = _MSLogingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MSServiceUpdatedHandler setDelegate:]((uint64_t)v4, v5);
  }

  objc_storeWeak((id *)&self->_delegate, v4);
}

- (void)mediaServiceChanged:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _MSLogingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 serviceName];
    int v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler mediaServiceChanged:homeUserID:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_225D52000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about service change - User: %@ Service %@", (uint8_t *)&v13, 0x20u);
  }
  v10 = [(MSServiceUpdatedHandler *)self delegate];
  if (![v10 conformsToProtocol:&unk_26D982940]) {
    goto LABEL_6;
  }
  v11 = [(MSServiceUpdatedHandler *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v10 = [(MSServiceUpdatedHandler *)self delegate];
    [v10 serviceSettingDidUpdate:v6 homeUserID:v7];
LABEL_6:
  }
}

- (void)mediaServiceRemoved:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _MSLogingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 serviceName];
    int v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler mediaServiceRemoved:homeUserID:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_225D52000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about service removal - User: %@ Service %@", (uint8_t *)&v13, 0x20u);
  }
  v10 = [(MSServiceUpdatedHandler *)self delegate];
  if (![v10 conformsToProtocol:&unk_26D982940]) {
    goto LABEL_6;
  }
  v11 = [(MSServiceUpdatedHandler *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v10 = [(MSServiceUpdatedHandler *)self delegate];
    [v10 userDidRemoveService:v6 homeUserID:v7];
LABEL_6:
  }
}

- (void)defaultMediaServiceUpdated:(id)a3 homeUserID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _MSLogingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v6 serviceName];
    int v13 = 136315650;
    v14 = "-[MSServiceUpdatedHandler defaultMediaServiceUpdated:homeUserID:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_225D52000, v8, OS_LOG_TYPE_DEFAULT, "%s Informing delegate about default service update - User: %@ Service %@", (uint8_t *)&v13, 0x20u);
  }
  v10 = [(MSServiceUpdatedHandler *)self delegate];
  if (![v10 conformsToProtocol:&unk_26D982940]) {
    goto LABEL_6;
  }
  v11 = [(MSServiceUpdatedHandler *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v10 = [(MSServiceUpdatedHandler *)self delegate];
    [v10 userDidUpdateDefaultService:v6 homeUserID:v7];
LABEL_6:
  }
}

- (MediaServiceUpdatedClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MediaServiceUpdatedClientDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

- (void)setDelegate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[MSServiceUpdatedHandler setDelegate:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_225D52000, a2, OS_LOG_TYPE_DEBUG, "%s Setting MediaServiceUpdatedClientDelegate %@", (uint8_t *)&v2, 0x16u);
}

@end