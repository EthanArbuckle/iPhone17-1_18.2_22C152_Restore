@interface BMComputeSourceServerConnection
- (BMAccessControlPolicy)accessControlPolicy;
- (BMComputeSourceServer)server;
- (BMComputeSourceServerConnection)initWithServer:(id)a3 clientProcess:(id)a4;
- (BMProcess)clientProcess;
- (NSString)description;
- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6;
- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 signpostID:(unint64_t)a5 eventData:(id)a6 eventDataVersion:(unsigned int)a7 account:(id)a8 remoteName:(id)a9;
@end

@implementation BMComputeSourceServerConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessControlPolicy, 0);
  objc_storeStrong((id *)&self->_clientProcess, 0);

  objc_destroyWeak((id *)&self->_server);
}

- (void)eventsPrunedWithStreamIdentifier:(id)a3 account:(id)a4 remoteName:(id)a5 reason:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  v13 = __biome_log_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeSourceServerConnection eventsPrunedWithStreamIdentifier:account:remoteName:reason:]();
  }

  v14 = [(BMComputeSourceServerConnection *)self server];
  v15 = [v14 source];
  [v15 eventsPrunedWithStreamIdentifier:v10 account:v12 remoteName:v11 reason:a6];
}

- (void)sendEventWithStreamIdentifier:(id)a3 timestamp:(id)a4 signpostID:(unint64_t)a5 eventData:(id)a6 eventDataVersion:(unsigned int)a7 account:(id)a8 remoteName:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  v20 = [(BMComputeSourceServerConnection *)self server];
  v21 = [v20 queue];
  dispatch_assert_queue_V2(v21);

  v22 = __biome_log_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.5((uint64_t)v15);
  }

  uint64_t v34 = MEMORY[0x1E4F143A8];
  uint64_t v35 = 3221225472;
  v36 = __132__BMComputeSourceServerConnection_sendEventWithStreamIdentifier_timestamp_signpostID_eventData_eventDataVersion_account_remoteName___block_invoke;
  v37 = &unk_1E55D7940;
  unint64_t v39 = a5;
  id v23 = v15;
  id v38 = v23;
  v24 = (void (**)(void))_Block_copy(&v34);
  if (v23)
  {
    if (-[BMAccessControlPolicy allowsComputeSourceAccessToStream:](self->_accessControlPolicy, "allowsComputeSourceAccessToStream:", v23, v34, v35, v36, v37))
    {
      if (!v17)
      {
        v30 = 0;
        goto LABEL_16;
      }
      id v25 = BMEventClassForStreamIdentifier(v23);
      if (v25)
      {
        uint64_t v26 = (uint64_t)v25;
        uint64_t v27 = [v25 eventWithData:v17 dataVersion:v10];
        if (v27)
        {
          v28 = (void *)v27;
          id v29 = objc_alloc(MEMORY[0x1E4F50280]);
          [v16 doubleValue];
          v30 = objc_msgSend(v29, "initWithEventBody:timestamp:", v28);

LABEL_16:
          v32 = [(BMComputeSourceServerConnection *)self server];
          v33 = [v32 source];
          [v33 sendEventWithStreamIdentifier:v23 timestamp:v16 account:v18 remoteName:v19 storeEvent:v30];

          v24[2](v24);
          goto LABEL_14;
        }
        v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:](v26);
        }
      }
      else
      {
        v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:]((uint64_t)v23, v31);
        }
      }
    }
    else
    {
      v31 = __biome_log_for_category();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:].cold.4((uint64_t)v23, v31);
      }
    }
  }
  else
  {
    v31 = __biome_log_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[BMComputeSourceServerConnection sendEventWithStreamIdentifier:timestamp:signpostID:eventData:eventDataVersion:account:remoteName:](v31);
    }
  }

  v24[2](v24);
LABEL_14:
}

- (BMComputeSourceServer)server
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);

  return (BMComputeSourceServer *)WeakRetained;
}

void __132__BMComputeSourceServerConnection_sendEventWithStreamIdentifier_timestamp_signpostID_eventData_eventDataVersion_account_remoteName___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(*(void *)(a1 + 40) + 1) >= 2)
  {
    v2 = __biome_log_for_category();
    v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_signpost_emit_with_name_impl(&dword_18E67D000, v3, OS_SIGNPOST_INTERVAL_END, v4, "SendEvent", "StreamIdentifier=%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BMComputeSourceServerConnection)initWithServer:(id)a3 clientProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 queue];
  dispatch_assert_queue_V2(v8);

  v14.receiver = self;
  v14.super_class = (Class)BMComputeSourceServerConnection;
  v9 = [(BMComputeSourceServerConnection *)&v14 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_server, v6);
    objc_storeStrong((id *)&v10->_clientProcess, a4);
    uint64_t v11 = [MEMORY[0x1E4F4FB38] policyForProcess:v7 connectionFlags:0 useCase:*MEMORY[0x1E4F4FB20]];
    accessControlPolicy = v10->_accessControlPolicy;
    v10->_accessControlPolicy = (BMAccessControlPolicy *)v11;
  }
  return v10;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  uint64_t v5 = (void *)[v3 initWithFormat:@"<BMComputeSource server: %@ clientProcess: %@ >", WeakRetained, self->_clientProcess];

  return (NSString *)v5;
}

- (BMProcess)clientProcess
{
  return self->_clientProcess;
}

- (BMAccessControlPolicy)accessControlPolicy
{
  return self->_accessControlPolicy;
}

- (void)sendEventWithStreamIdentifier:(os_log_t)log timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "BMComputeSourceServerConnection dropping sendEventWithStreamIdentifier due to nil stream", v1, 2u);
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:(NSObject *)a2 signpostID:eventData:eventDataVersion:account:remoteName:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "No event body class for stream %@", (uint8_t *)&v2, 0xCu);
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1(&dword_18E67D000, v1, v2, "Error initializing event body of type %@ for stream %@", (void)v3, DWORD2(v3));
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:(NSObject *)a2 signpostID:eventData:eventDataVersion:account:remoteName:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Rejecting sendEvent due to lacking write entitlements for stream %@", (uint8_t *)&v2, 0xCu);
}

- (void)sendEventWithStreamIdentifier:(uint64_t)a1 timestamp:signpostID:eventData:eventDataVersion:account:remoteName:.cold.5(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3(&dword_18E67D000, v1, v2, "BMComputeSourceServerConnection send event with identifier %@, event %@", (void)v3, DWORD2(v3));
}

- (void)eventsPrunedWithStreamIdentifier:account:remoteName:reason:.cold.1()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3(&dword_18E67D000, v0, v1, "BMComputeSourceServerConnection events pruned for stream identifier %@ with reason: %lu");
}

@end