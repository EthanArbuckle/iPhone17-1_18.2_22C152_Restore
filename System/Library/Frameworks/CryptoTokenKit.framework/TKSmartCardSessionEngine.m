@interface TKSmartCardSessionEngine
- (BOOL)active;
- (BOOL)valid;
- (NSXPCConnection)connection;
- (TKSmartCardSessionEngine)initWithSlot:(id)a3 connection:(id)a4;
- (int64_t)endPolicy;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setEndPolicy:(int64_t)a3;
- (void)setSessionEndPolicy:(int64_t)a3;
- (void)setValid:(BOOL)a3;
- (void)terminateWithReply:(id)a3;
- (void)transmit:(id)a3 reply:(id)a4;
@end

@implementation TKSmartCardSessionEngine

- (TKSmartCardSessionEngine)initWithSlot:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKSmartCardSessionEngine;
  v9 = [(TKSmartCardSessionEngine *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slot, a3);
    objc_storeWeak((id *)&v10->_connection, v8);
    v10->_valid = 1;
  }

  return v10;
}

- (void)transmit:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (self->_transmitting)
  {
    id v8 = TK_LOG_token_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCardSessionEngine transmit:reply:]((uint64_t)self);
    }

    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -2;
    goto LABEL_9;
  }
  if (![(TKSmartCardSessionEngine *)self valid])
  {
    v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = -7;
LABEL_9:
    v16 = [v9 errorWithDomain:@"CryptoTokenKit" code:v10 userInfo:0];
    v7[2](v7, 0, v16);

    goto LABEL_10;
  }
  slot = self->_slot;
  p_slot = &self->_slot;
  [(TKSmartCardSlotEngine *)slot setApduSentSinceLastReset:1];
  *((unsigned char *)p_slot + 8) = 1;
  [(TKSmartCardSlotEngine *)*p_slot logWithBytes:v6 handler:&__block_literal_global_389];
  v13 = [(TKSmartCardSlotEngine *)*p_slot delegate];
  v14 = [v13 engine:*p_slot transmit:v6];

  *((unsigned char *)p_slot + 8) = 0;
  v15 = *p_slot;
  if (v14)
  {
    [(TKSmartCardSlotEngine *)v15 logWithBytes:v14 handler:&__block_literal_global_392];
    ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
  }
  else
  {
    [(TKSmartCardSlotEngine *)v15 logWithBytes:0 handler:&__block_literal_global_395];
    v17 = TK_LOG_token_0();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCardSessionEngine transmit:reply:]((id *)p_slot);
    }

    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
    v7[2](v7, 0, v18);
  }
LABEL_10:
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1();
  }
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_390(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_390_cold_1();
  }
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_393(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_393_cold_1();
  }
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (void)terminateWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  if (self->_active) {
    [(TKSmartCardSlotEngine *)self->_slot leaveSession:self];
  }
  v4[2]();
}

- (void)dealloc
{
  [(TKSmartCardSessionEngine *)self terminateWithReply:&__block_literal_global_397];
  v3.receiver = self;
  v3.super_class = (Class)TKSmartCardSessionEngine;
  [(TKSmartCardSessionEngine *)&v3 dealloc];
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)endPolicy
{
  return self->_endPolicy;
}

- (void)setEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);

  return (NSXPCConnection *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);

  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)transmit:(id *)a1 reply:.cold.1(id *a1)
{
  v1 = [*a1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v2, v3, "%@: failed to transmit APDU", v4, v5, v6, v7, v8);
}

- (void)transmit:(uint64_t)a1 reply:.cold.2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 8) name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v2, v3, "%{public}@: refusing to send APDU while another is in progress.", v4, v5, v6, v7, v8);
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "APDU ->%{public}s", v2, v3, v4, v5, v6);
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_390_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BED55000, v0, v1, "APDU <-%{public}s", v2, v3, v4, v5, v6);
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_393_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1BED55000, v0, v1, "APDU FAILED", v2, v3, v4, v5, v6);
}

@end