@interface DCPresentmentSession
- (BOOL)hasBeenConfigured;
- (DCPresentmentClient)client;
- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4;
- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5;
- (DCPresentmentSessionOptions)options;
- (NSArray)partitions;
- (unint64_t)presentmentType;
- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4;
- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4;
- (void)buildResponseForSelection:(id)a3 completion:(id)a4;
- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4;
- (void)finishConfiguration;
- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4;
- (void)interpretRequest:(id)a3 completion:(id)a4;
- (void)setHasBeenConfigured:(BOOL)a3;
@end

@implementation DCPresentmentSession

- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession initWithPartitions:presentmentType:options:]();
  }

  v20.receiver = self;
  v20.super_class = (Class)DCPresentmentSession;
  v11 = [(DCPresentmentSession *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v13 = objc_alloc_init(DCPresentmentClient);
    client = v12->_client;
    v12->_client = v13;

    uint64_t v15 = [v8 copy];
    partitions = v12->_partitions;
    v12->_partitions = (NSArray *)v15;

    v12->_presentmentType = a4;
    v12->_hasBeenConfigured = 0;
    uint64_t v17 = [v9 copy];
    options = v12->_options;
    v12->_options = (DCPresentmentSessionOptions *)v17;
  }
  return v12;
}

- (DCPresentmentSession)initWithPartitions:(id)a3 presentmentType:(unint64_t)a4
{
  return [(DCPresentmentSession *)self initWithPartitions:a3 presentmentType:a4 options:0];
}

- (void)configureIfNeededWithContinuation:(id)a3 errorHandler:(id)a4
{
  v6 = (void (**)(void))a3;
  id v7 = a4;
  if ([(DCPresentmentSession *)self hasBeenConfigured])
  {
LABEL_9:
    v6[2](v6);
    goto LABEL_10;
  }
  id v8 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:]();
  }

  if (!self->_client)
  {
    v13 = DC_LOG_CLIENT_3();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[DCPresentmentSession configureIfNeededWithContinuation:errorHandler:]();
    }

    goto LABEL_9;
  }
  id v9 = [(DCPresentmentSession *)self client];
  v10 = [(DCPresentmentSession *)self partitions];
  unint64_t v11 = [(DCPresentmentSession *)self presentmentType];
  v12 = [(DCPresentmentSession *)self options];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke;
  v14[3] = &unk_2642293B0;
  v14[4] = self;
  id v15 = v7;
  v16 = v6;
  [v9 configureWithPartitions:v10 presentmentType:v11 options:v12 completion:v14];

LABEL_10:
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DC_LOG_CLIENT_3();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(v3, v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5) {
      __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) finishConfiguration];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)finishConfiguration
{
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession generateTransportKeyForSpecification:completion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke;
  v11[3] = &unk_2642294C8;
  v11[4] = self;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke_3;
  v9[3] = &unk_264228CB8;
  id v10 = v12;
  id v8 = v12;
  [(DCPresentmentSession *)self configureIfNeededWithContinuation:v11 errorHandler:v9];
}

void __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession generateTransportKeyForSpecification:completion:]();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 generateTransportKeyForSpecification:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __72__DCPresentmentSession_generateTransportKeyForSpecification_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)interpretRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession interpretRequest:completion:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__DCPresentmentSession_interpretRequest_completion___block_invoke;
  v13[3] = &unk_264229400;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__DCPresentmentSession_interpretRequest_completion___block_invoke_4;
  v11[3] = &unk_264228CB8;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(DCPresentmentSession *)self configureIfNeededWithContinuation:v13 errorHandler:v11];
}

void __52__DCPresentmentSession_interpretRequest_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession interpretRequest:completion:]();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 interpretRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __52__DCPresentmentSession_interpretRequest_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)buildResponseForSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildResponseForSelection:completion:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke;
  v13[3] = &unk_264229400;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke_5;
  v11[3] = &unk_264228CB8;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(DCPresentmentSession *)self configureIfNeededWithContinuation:v13 errorHandler:v11];
}

void __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildResponseForSelection:completion:]();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 buildResponseForSelection:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __61__DCPresentmentSession_buildResponseForSelection_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildCredentialResponseForSelection:completion:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke;
  v13[3] = &unk_264229400;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke_6;
  v11[3] = &unk_264228CB8;
  id v12 = v15;
  id v9 = v15;
  id v10 = v6;
  [(DCPresentmentSession *)self configureIfNeededWithContinuation:v13 errorHandler:v11];
}

void __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildCredentialResponseForSelection:completion:]();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 buildCredentialResponseForSelection:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t __71__DCPresentmentSession_buildCredentialResponseForSelection_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildErrorResponseWithStatus:completion:]();
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke;
  v11[3] = &unk_2642294C8;
  void v11[4] = self;
  unint64_t v13 = a3;
  id v12 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke_7;
  v9[3] = &unk_264228CB8;
  id v10 = v12;
  id v8 = v12;
  [(DCPresentmentSession *)self configureIfNeededWithContinuation:v11 errorHandler:v9];
}

void __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke(uint64_t a1)
{
  v2 = DC_LOG_CLIENT_3();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentSession buildResponseForSelection:completion:]();
  }

  id v3 = [*(id *)(a1 + 32) client];
  [v3 buildErrorResponseWithStatus:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

uint64_t __64__DCPresentmentSession_buildErrorResponseWithStatus_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)hasBeenConfigured
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_hasBeenConfigured;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_hasBeenConfigured = a3;

  os_unfair_lock_unlock(p_lock);
}

- (DCPresentmentClient)client
{
  return self->_client;
}

- (NSArray)partitions
{
  return self->_partitions;
}

- (unint64_t)presentmentType
{
  return self->_presentmentType;
}

- (DCPresentmentSessionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_partitions, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

- (void)initWithPartitions:presentmentType:options:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession init called", v2, v3, v4, v5, v6);
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession configureIfNeeded no client set", v2, v3, v4, v5, v6);
}

- (void)configureIfNeededWithContinuation:errorHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession configure needed", v2, v3, v4, v5, v6);
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession configure completed successfully", v2, v3, v4, v5, v6);
}

void __71__DCPresentmentSession_configureIfNeededWithContinuation_errorHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_214B14000, a2, OS_LOG_TYPE_DEBUG, "DCPresentmentSession configure return error %{error}@", (uint8_t *)&v4, 0xCu);
}

- (void)generateTransportKeyForSpecification:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession generateTransportKey", v2, v3, v4, v5, v6);
}

- (void)interpretRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession interpretRequest", v2, v3, v4, v5, v6);
}

- (void)buildResponseForSelection:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession buildResponse", v2, v3, v4, v5, v6);
}

- (void)buildCredentialResponseForSelection:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession buildCredentialResponse", v2, v3, v4, v5, v6);
}

- (void)buildErrorResponseWithStatus:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentSession buildErrorResponse", v2, v3, v4, v5, v6);
}

@end