@interface ANEDaemonConnection
@end

@implementation ANEDaemonConnection

void __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke_13(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a8;
  id v14 = a7;
  v15 = +[_ANELog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = a2;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_debug_impl(&dword_1DB8AB000, v15, OS_LOG_TYPE_DEBUG, "[proxy loadModel:...] returned success=%d : attr=%@ : error=%@", (uint8_t *)v16, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 89;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

uint64_t __51___ANEDaemonConnection_beginRealTimeTaskWithReply___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 105;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

uint64_t __49___ANEDaemonConnection_endRealTimeTaskWithReply___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39___ANEDaemonConnection_echo_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 121;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

uint64_t __39___ANEDaemonConnection_echo_withReply___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 149;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __76___ANEDaemonConnection_compileModel_sandboxExtension_options_qos_withReply___block_invoke_11(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[_ANELog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109890;
    v13[1] = a2;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_debug_impl(&dword_1DB8AB000, v12, OS_LOG_TYPE_DEBUG, "[proxy compileModel:...] returned success=%d : attr=%@ : cacheURLIdentifier=%@ : error=%@", (uint8_t *)v13, 0x26u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73___ANEDaemonConnection_loadModel_sandboxExtension_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 181;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 219;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __83___ANEDaemonConnection_loadModelNewInstance_options_modelInstParams_qos_withReply___block_invoke_15(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a8;
  id v14 = a7;
  id v15 = +[_ANELog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = a2;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_debug_impl(&dword_1DB8AB000, v15, OS_LOG_TYPE_DEBUG, "[proxy loadModelNewInstance:...] returned success=%d : attr=%@ : error=%@", (uint8_t *)v16, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 258;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __58___ANEDaemonConnection_unloadModel_options_qos_withReply___block_invoke_16(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = +[_ANELog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_1DB8AB000, v6, OS_LOG_TYPE_INFO, "[proxy unloadModel:...] returned success = %d with error = %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __54___ANEDaemonConnection_reportTelemetryToPPS_playload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 277;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    v7 = v5;
    __int16 v8 = 1024;
    int v9 = 287;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __57___ANEDaemonConnection_compiledModelExistsFor_withReply___block_invoke_17(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = +[_ANELog framework];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109634;
    v10[1] = a2;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_debug_impl(&dword_1DB8AB000, v9, OS_LOG_TYPE_DEBUG, "[proxy compiledModelExistsFor:...] returned success = %d : cacheURLIdentifier = %@ : with error = %@", (uint8_t *)v10, 0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    id v7 = v5;
    __int16 v8 = 1024;
    int v9 = 302;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    id v7 = v5;
    __int16 v8 = 1024;
    int v9 = 331;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    id v7 = v5;
    __int16 v8 = 1024;
    int v9 = 352;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_ANELog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412802;
    id v7 = v5;
    __int16 v8 = 1024;
    int v9 = 367;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1DB8AB000, v4, OS_LOG_TYPE_INFO, "%@: errorHandler %d: %@", (uint8_t *)&v6, 0x1Cu);
  }
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = +[_ANELog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53___ANEDaemonConnection_purgeCompiledModel_withReply___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_1DB8AB000, v0, v1, "[proxy purgeCompiledModel:...] returned success = %d with error = %@");
}

void __83___ANEDaemonConnection_prepareChainingWithModel_options_chainingReq_qos_withReply___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_1DB8AB000, v0, v1, "[proxy prepareChaining:...] returned success = %d with error = %@");
}

void __66___ANEDaemonConnection_compiledModelExistsMatchingHash_withReply___block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_1DB8AB000, v0, v1, "[proxy compiledModelExistsMatchingHash:...] returned success = %d with error = %@");
}

void __65___ANEDaemonConnection_purgeCompiledModelMatchingHash_withReply___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_1_5(&dword_1DB8AB000, v0, v1, "[proxy purgeCompiledModelMatchingHash:...] returned success = %d with error = %@");
}

@end