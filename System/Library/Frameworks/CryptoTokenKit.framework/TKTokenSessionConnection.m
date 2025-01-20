@interface TKTokenSessionConnection
- (NSMutableDictionary)initialKeepAlives;
- (NSMutableDictionary)sessions;
- (TKTokenConnection)tokenConnection;
- (TKTokenSessionConnection)initWithTokenConnection:(id)a3;
- (void)endSession:(id)a3 reply:(id)a4;
- (void)session:(id)a3 createObjectWithAttributes:(id)a4 reply:(id)a5;
- (void)session:(id)a3 deleteObjectWithObjectID:(id)a4 reply:(id)a5;
- (void)session:(id)a3 evaluateAccessControl:(id)a4 forOperation:(id)a5 reply:(id)a6;
- (void)session:(id)a3 getAdvertisedItemsWithReply:(id)a4;
- (void)session:(id)a3 getAttributesOfObjectID:(id)a4 reply:(id)a5;
- (void)session:(id)a3 objectID:(id)a4 operation:(int64_t)a5 data:(id)a6 algorithms:(id)a7 parameters:(id)a8 reply:(id)a9;
- (void)session:(id)a3 slotNameWithReply:(id)a4;
- (void)startSessionWithLAContext:(id)a3 parameters:(id)a4 reply:(id)a5;
- (void)withSessionID:(id)a3 invoke:(id)a4;
@end

@implementation TKTokenSessionConnection

- (TKTokenSessionConnection)initWithTokenConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TKTokenSessionConnection;
  v6 = [(TKTokenSessionConnection *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tokenConnection, a3);
    v8 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v9 = [MEMORY[0x1E4F1CC08] mutableCopy];
    sessions = v7->_sessions;
    v7->_sessions = (NSMutableDictionary *)v9;

    uint64_t v11 = [v8 mutableCopy];
    initialKeepAlives = v7->_initialKeepAlives;
    v7->_initialKeepAlives = (NSMutableDictionary *)v11;
  }
  return v7;
}

- (void)startSessionWithLAContext:(id)a3 parameters:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v54 = a5;
  if (v8)
  {
    v10 = [(TKTokenSessionConnection *)self tokenConnection];
    uint64_t v11 = [v10 sessions];

    objc_sync_enter(v11);
    v12 = [(TKTokenSessionConnection *)self tokenConnection];
    v13 = [v12 sessions];
    id v14 = [v13 objectForKey:v8];

    objc_sync_exit(v11);
    v15 = (void *)[v9 mutableCopy];
    if (v14)
    {
LABEL_24:
      id v41 = v9;
      if ([v15 count])
      {
        [v15 removeObjectForKey:@"PIN"];
        [v15 removeObjectForKey:@"callerPID"];
        v42 = [v14 parameters];
        [v15 addEntriesFromDictionary:v42];

        [v14 setParameters:v15];
      }
      v43 = NSNumber;
      ++self->_sessionIDCounter;
      v17 = objc_msgSend(v43, "numberWithInteger:");
      v44 = [(TKTokenSessionConnection *)self sessions];
      [v44 setObject:v14 forKey:v17];

      v45 = [(TKTokenSessionConnection *)self initialKeepAlives];
      objc_sync_enter(v45);
      v46 = [(TKTokenSessionConnection *)self initialKeepAlives];
      v47 = [v14 token];
      v48 = [v47 tokenDriver];
      v49 = [v48 keepAlive];
      [v46 setObject:v49 forKey:v17];

      objc_sync_exit(v45);
      v23 = v54;
      (*((void (**)(id, void *, void))v54 + 2))(v54, v17, 0);
      id v19 = v14;
      id v9 = v41;
      goto LABEL_27;
    }
  }
  else
  {
    v15 = (void *)[v9 mutableCopy];
  }
  v16 = [(TKTokenSessionConnection *)self tokenConnection];
  v17 = [v16 token];

  v18 = [v17 delegate];
  id v58 = 0;
  id v14 = [v18 token:v17 createSessionWithError:&v58];
  id v19 = v58;

  if (v14)
  {
    [v14 setLAContext:v8];
    v20 = [MEMORY[0x1E4F29268] currentConnection];
    v21 = v20;
    if (v20)
    {
      [v20 auditToken];
    }
    else
    {
      long long v56 = 0u;
      long long v57 = 0u;
    }
    v55[0] = v56;
    v55[1] = v57;
    [v14 setCreatorAuditToken:v55];

    v24 = [v9 objectForKey:@"PIN"];
    [v15 removeObjectForKey:@"PIN"];
    if (v24)
    {
      v25 = TK_LOG_token_3();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:](v25);
      }

      v26 = [v24 dataUsingEncoding:4];
      [v8 setCredential:v26 type:-3];
    }
    v27 = [v9 objectForKey:@"callerPID"];
    [v14 setCallerPID:v27];

    [v15 removeObjectForKey:@"callerPID"];
    if ([v15 count])
    {
      v28 = [v14 parameters];
      [v15 addEntriesFromDictionary:v28];

      [v14 setParameters:v15];
    }
    if (v8)
    {
      id v52 = v9;
      v29 = [(TKTokenSessionConnection *)self tokenConnection];
      v30 = [v29 sessions];

      id obj = v30;
      objc_sync_enter(v30);
      v31 = [(TKTokenSessionConnection *)self tokenConnection];
      v32 = [v31 sessions];
      v33 = [v32 objectForKey:v8];

      if (v33)
      {
        v34 = v14;
        id v14 = v33;
      }
      else
      {
        v35 = [(TKTokenSessionConnection *)self tokenConnection];
        v36 = [v35 sessions];
        [v36 setObject:v14 forKey:v8];

        v34 = [(TKTokenSessionConnection *)self tokenConnection];
        v51 = [v34 token];
        v50 = [v51 tokenDriver];
        v37 = [v50 keepAlive];
        [v14 setKeepAlive:v37];
      }
      objc_sync_exit(obj);

      id v9 = v52;
    }
    v38 = [(TKTokenSessionConnection *)self tokenConnection];
    v39 = [v38 sessions];

    objc_sync_enter(v39);
    v40 = [(TKTokenSessionConnection *)self tokenConnection];
    [v40 setInitialKeepAlive:0];

    objc_sync_exit(v39);
    goto LABEL_24;
  }
  v22 = TK_LOG_token_3();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[TKTokenSessionConnection startSessionWithLAContext:parameters:reply:](v17, (uint64_t)v19, v22);
  }

  v23 = v54;
  (*((void (**)(id, void, id))v54 + 2))(v54, 0, v19);
LABEL_27:
}

- (void)endSession:(id)a3 reply:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  v7 = [(TKTokenSessionConnection *)self sessions];
  [v7 removeObjectForKey:v6];

  v8[2]();
}

- (void)withSessionID:(id)a3 invoke:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = TK_LOG_token_3();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[TKTokenSessionConnection withSessionID:invoke:]((uint64_t)v7, self, v9);
  }

  v10 = [(TKTokenSessionConnection *)self sessions];
  uint64_t v11 = [v10 objectForKey:v7];

  if (!v11)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [(TKTokenSessionConnection *)self tokenConnection];
    v23 = [v22 token];
    v24 = [v23 tokenID];
    [v21 handleFailureInMethod:a2, self, @"TKTokenConnection.m", 114, @"An attempt to reference nonexistent session %@ on token %@", v7, v24 object file lineNumber description];
  }
  v12 = [MEMORY[0x1E4F29268] currentConnection];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  v13 = [(TKTokenSessionConnection *)self tokenConnection];
  id v14 = [v13 token];
  v15 = [v14 tokenDriver];
  id v33 = [v15 keepAlive];

  v16 = [v11 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke;
  block[3] = &unk_1E63C8E00;
  id v26 = v11;
  id v27 = v12;
  id v30 = v8;
  v31 = v32;
  v28 = self;
  id v29 = v7;
  id v17 = v7;
  id v18 = v8;
  id v19 = v12;
  id v20 = v11;
  dispatch_async(v16, block);

  _Block_object_dispose(v32, 8);
}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCaller:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) beginRequest];
  uint64_t v2 = *(void *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2;
  v7[3] = &unk_1E63C8DD8;
  id v4 = v3;
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v7);
}

void __49__TKTokenSessionConnection_withSessionID_invoke___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1C189C830]();
  [*(id *)(a1 + 32) endRequest];
  [*(id *)(a1 + 32) setCaller:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = [*(id *)(a1 + 40) initialKeepAlives];
  objc_sync_enter(v5);
  id v6 = [*(id *)(a1 + 40) initialKeepAlives];
  [v6 removeObjectForKey:*(void *)(a1 + 48)];

  objc_sync_exit(v5);
}

- (void)session:(id)a3 getAdvertisedItemsWithReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke;
  v8[3] = &unk_1E63C8E50;
  id v9 = v6;
  id v7 = v6;
  [(TKTokenSessionConnection *)self withSessionID:a3 invoke:v8];
}

void __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2;
  v7[3] = &unk_1E63C8E28;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a2 getAdvertisedItemsWithReply:v7];
}

uint64_t __64__TKTokenSessionConnection_session_getAdvertisedItemsWithReply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)session:(id)a3 evaluateAccessControl:(id)a4 forOperation:(id)a5 reply:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke;
  v16[3] = &unk_1E63C8EA0;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(TKTokenSessionConnection *)self withSessionID:a3 invoke:v16];
}

void __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2;
  v9[3] = &unk_1E63C8E78;
  id v10 = *(id *)(a1 + 48);
  id v11 = v5;
  id v8 = v5;
  [a2 evaluateAccessControl:v6 forOperation:v7 reply:v9];
}

uint64_t __77__TKTokenSessionConnection_session_evaluateAccessControl_forOperation_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)session:(id)a3 getAttributesOfObjectID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v21 = 0;
  id v10 = a4;
  id v11 = [(TKTokenSessionConnection *)self tokenConnection];
  id v12 = [v11 token];
  id v13 = [v12 tokenID];
  id v20 = 0;
  id v14 = [v13 decodedObjectID:v10 isCertificate:&v21 error:&v20];

  id v15 = v20;
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke;
    v16[3] = &unk_1E63C8EF0;
    id v17 = v14;
    char v19 = v21;
    id v18 = v9;
    [(TKTokenSessionConnection *)self withSessionID:v8 invoke:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v15);
  }
}

void __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2;
  v9[3] = &unk_1E63C8EC8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  [a2 getAttributesOfObject:v7 isCertificate:v6 reply:v9];
}

uint64_t __66__TKTokenSessionConnection_session_getAttributesOfObjectID_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)session:(id)a3 objectID:(id)a4 operation:(int64_t)a5 data:(id)a6 algorithms:(id)a7 parameters:(id)a8 reply:(id)a9
{
  id v26 = a3;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v18 = a4;
  char v19 = [(TKTokenSessionConnection *)self tokenConnection];
  id v20 = [v19 token];
  char v21 = [v20 tokenID];
  id v34 = 0;
  v22 = [v21 decodedKeyID:v18 error:&v34];

  id v23 = v34;
  if (v22)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke;
    v27[3] = &unk_1E63C8F40;
    id v28 = v22;
    int64_t v33 = a5;
    id v29 = v14;
    id v30 = v15;
    id v31 = v16;
    id v32 = v17;
    v24 = v26;
    [(TKTokenSessionConnection *)self withSessionID:v26 invoke:v27];
  }
  else
  {
    (*((void (**)(id, void, id))v17 + 2))(v17, 0, v23);
    v24 = v26;
  }
}

void __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2;
  v12[3] = &unk_1E63C8F18;
  uint64_t v10 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 64);
  id v14 = v5;
  id v11 = v5;
  [a2 objectID:v6 operation:v10 inputData:v7 algorithms:v8 parameters:v9 reply:v12];
}

uint64_t __88__TKTokenSessionConnection_session_objectID_operation_data_algorithms_parameters_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)session:(id)a3 createObjectWithAttributes:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke;
  v12[3] = &unk_1E63C8F68;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(TKTokenSessionConnection *)self withSessionID:a3 invoke:v12];
}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2;
  v8[3] = &unk_1E63C8EC8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 createObjectWithAttributes:v6 reply:v8];
}

void __69__TKTokenSessionConnection_session_createObjectWithAttributes_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  uint64_t v6 = *MEMORY[0x1E4F3B8B0];
  uint64_t v7 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F3B8B0]];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = +[TKTokenID encodedKeyID:v7];

    id v10 = (void *)[v13 mutableCopy];
    [v10 setObject:v9 forKeyedSubscript:v6];
    uint64_t v11 = [v10 copy];

    id v12 = (id)v11;
  }
  else
  {
    id v9 = 0;
    id v12 = v13;
  }
  id v14 = v12;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)session:(id)a3 deleteObjectWithObjectID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(TKTokenSessionConnection *)self tokenConnection];
  id v12 = [v11 token];
  id v13 = [v12 tokenID];
  id v19 = 0;
  id v14 = [v13 decodedKeyID:v10 error:&v19];

  id v15 = v19;
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke;
    v16[3] = &unk_1E63C8F68;
    id v17 = v14;
    id v18 = v9;
    [(TKTokenSessionConnection *)self withSessionID:v8 invoke:v16];
  }
  else
  {
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v15);
  }
}

void __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2;
  v8[3] = &unk_1E63C8E78;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v5;
  id v7 = v5;
  [a2 deleteObject:v6 reply:v8];
}

uint64_t __67__TKTokenSessionConnection_session_deleteObjectWithObjectID_reply___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)session:(id)a3 slotNameWithReply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke;
  v8[3] = &unk_1E63C8E50;
  id v9 = v6;
  id v7 = v6;
  [(TKTokenSessionConnection *)self withSessionID:a3 invoke:v8];
}

void __54__TKTokenSessionConnection_session_slotNameWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = a3;
  id v5 = [a2 name];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  v6[2]();
}

- (TKTokenConnection)tokenConnection
{
  return self->_tokenConnection;
}

- (NSMutableDictionary)sessions
{
  return self->_sessions;
}

- (NSMutableDictionary)initialKeepAlives
{
  return self->_initialKeepAlives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialKeepAlives, 0);
  objc_storeStrong((id *)&self->_sessions, 0);

  objc_storeStrong((id *)&self->_tokenConnection, 0);
}

- (void)startSessionWithLAContext:(void *)a1 parameters:(uint64_t)a2 reply:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 tokenID];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1BED55000, a3, OS_LOG_TYPE_ERROR, "Token %{public}@ failed to create new session, error %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)startSessionWithLAContext:(os_log_t)log parameters:reply:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BED55000, log, OS_LOG_TYPE_DEBUG, "setting PIN sent in creation attributes into LAContext", v1, 2u);
}

- (void)withSessionID:(NSObject *)a3 invoke:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = [a2 tokenConnection];
  int v6 = [v5 token];
  id v7 = [v6 tokenID];
  int v8 = 138543618;
  uint64_t v9 = a1;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_debug_impl(&dword_1BED55000, a3, OS_LOG_TYPE_DEBUG, "with session %{public}@ on token %{public}@", (uint8_t *)&v8, 0x16u);
}

@end