@interface SecEscrowRequest
+ (id)request:(id *)a3;
- (BOOL)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 error:(id *)a5;
- (BOOL)escrowCompletedWithinLastSeconds:(double)a3;
- (BOOL)pendingEscrowUpload:(id *)a3;
- (BOOL)resetAllRequests:(id *)a3;
- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4;
- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (SecEscrowRequest)initWithConnection:(id)a3;
- (id)fetchPrerecord:(id)a3 error:(id *)a4;
- (id)fetchRequestWaitingOnPasscode:(id *)a3;
- (id)fetchStatuses:(id *)a3;
- (unint64_t)storePrerecordsInEscrow:(id *)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation SecEscrowRequest

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__3305;
  v9[4] = __Block_byref_object_dispose__3306;
  id v10 = 0;
  v4 = [(SecEscrowRequest *)self connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke;
  v8[3] = &unk_1E5481470;
  v8[4] = v9;
  v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v8];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_99;
  v7[3] = &unk_1E54779C0;
  v7[4] = &v11;
  v7[5] = v9;
  [v5 escrowCompletedWithinLastSeconds:v7 reply:a3];
  LOBYTE(v4) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_99(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v7 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v20 = 0;
  id v4 = [(SecEscrowRequest *)self fetchStatuses:&v20];
  id v5 = v20;
  if (v5)
  {
    id v6 = secLogObjForScope("escrow");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_18B299000, v6, OS_LOG_TYPE_DEFAULT, "failed to fetch escrow statuses: %@", buf, 0xCu);
    }

    if (a3)
    {
      char v7 = 0;
      *a3 = v5;
      goto LABEL_23;
    }
LABEL_20:
    char v7 = 0;
    goto LABEL_23;
  }
  if (!v4 || ![v4 count]) {
    goto LABEL_20;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v15 = v4;
  int v8 = [v4 allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v7 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v13 isEqualToString:@"have_prerecord"] & 1) != 0
          || ([v13 isEqualToString:@"pending_passcode"] & 1) != 0
          || [v13 isEqualToString:@"pending_certificate"])
        {
          char v7 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }
  else
  {
    char v7 = 0;
  }

  id v4 = v15;
LABEL_23:

  return v7 & 1;
}

- (unint64_t)storePrerecordsInEscrow:(id *)a3
{
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__3305;
  long long v19 = __Block_byref_object_dispose__3306;
  id v20 = 0;
  id v4 = [(SecEscrowRequest *)self connection];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke;
  v14[3] = &unk_1E5481470;
  v14[4] = &v15;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v14];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_97;
  v9[3] = &unk_1E5475FC8;
  v9[4] = &v10;
  void v9[5] = &v15;
  [v5 storePrerecordsInEscrow:v9];
  if (a3)
  {
    id v6 = (void *)v16[5];
    if (v6) {
      *a3 = v6;
    }
  }
  unint64_t v7 = v11[3];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v7 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_18B299000, v7, OS_LOG_TYPE_DEFAULT, "Stored %d records: %@", (uint8_t *)v8, 0x12u);
  }
}

- (BOOL)resetAllRequests:(id *)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__3305;
  long long v16 = __Block_byref_object_dispose__3306;
  id v17 = 0;
  id v4 = [(SecEscrowRequest *)self connection];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke;
  v11[3] = &unk_1E5481470;
  v11[4] = &v12;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke_96;
  v10[3] = &unk_1E5481470;
  v10[4] = &v12;
  [v5 resetAllRequests:v10];
  id v6 = v13;
  if (a3)
  {
    id v7 = (void *)v13[5];
    if (v7)
    {
      *a3 = v7;
      id v6 = v13;
    }
  }
  BOOL v8 = v6[5] == 0;

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __37__SecEscrowRequest_resetAllRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __37__SecEscrowRequest_resetAllRequests___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)fetchStatuses:(id *)a3
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3305;
  v21 = __Block_byref_object_dispose__3306;
  id v22 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__3305;
  uint64_t v15 = __Block_byref_object_dispose__3306;
  id v16 = 0;
  id v4 = [(SecEscrowRequest *)self connection];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke;
  v10[3] = &unk_1E5481470;
  v10[4] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke_94;
  v9[3] = &unk_1E5477970;
  v9[4] = &v11;
  void v9[5] = &v17;
  [v5 fetchRequestStatuses:v9];
  if (a3)
  {
    int v6 = (void *)v18[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __34__SecEscrowRequest_fetchStatuses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "requestStatuses: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __34__SecEscrowRequest_fetchStatuses___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v8 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Received statuses: %@ %@", (uint8_t *)&v10, 0x16u);
  }
}

- (id)fetchRequestWaitingOnPasscode:(id *)a3
{
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3305;
  v21 = __Block_byref_object_dispose__3306;
  id v22 = 0;
  id v4 = [(SecEscrowRequest *)self connection];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke;
  v16[3] = &unk_1E5481470;
  v16[4] = &v17;
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v16];

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__3305;
  uint64_t v14 = __Block_byref_object_dispose__3306;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_92;
  v9[3] = &unk_1E5475FA0;
  v9[4] = &v10;
  void v9[5] = &v17;
  [v5 fetchRequestWaitingOnPasscode:v9];
  if (a3)
  {
    id v6 = (void *)v18[5];
    if (v6) {
      *a3 = v6;
    }
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v17, 8);

  return v7;
}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v8 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Received request waiting on passcode: %@ %@", (uint8_t *)&v9, 0x16u);
  }
}

- (id)fetchPrerecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3305;
  v28 = __Block_byref_object_dispose__3306;
  id v29 = 0;
  id v7 = [(SecEscrowRequest *)self connection];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke;
  v23[3] = &unk_1E5481470;
  v23[4] = &v24;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v23];

  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__3305;
  v21 = __Block_byref_object_dispose__3306;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_90;
  v13[3] = &unk_1E5475F78;
  id v15 = &v17;
  id v16 = &v24;
  id v9 = v6;
  id v14 = v9;
  [v8 fetchPrerecord:v9 reply:v13];
  if (a4)
  {
    id v10 = (void *)v25[5];
    if (v10) {
      *a4 = v10;
    }
  }
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v24, 8);

  return v11;
}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "fetchprerecord: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_90(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  uint64_t v8 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_18B299000, v8, OS_LOG_TYPE_DEFAULT, "Received prerecord for %@: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (BOOL)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3305;
  v25 = __Block_byref_object_dispose__3306;
  id v26 = 0;
  int v10 = [(SecEscrowRequest *)self connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke;
  v20[3] = &unk_1E5481470;
  v20[4] = &v21;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_89;
  v17[3] = &unk_1E5477948;
  uint64_t v19 = &v21;
  id v12 = v8;
  id v18 = v12;
  [v11 cachePrerecord:v12 serializedPrerecord:v9 reply:v17];
  id v13 = v22;
  if (a5)
  {
    uint64_t v14 = (void *)v22[5];
    if (v14)
    {
      *a5 = v14;
      id v13 = v22;
    }
  }
  BOOL v15 = v13[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "cachePrerecord: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_89(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "Cached prerecord for %@: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__3305;
  v25 = __Block_byref_object_dispose__3306;
  id v26 = 0;
  id v10 = [(SecEscrowRequest *)self connection];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke;
  v20[3] = &unk_1E5481470;
  v20[4] = &v21;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_88;
  v17[3] = &unk_1E5477948;
  uint64_t v19 = &v21;
  id v12 = v8;
  id v18 = v12;
  [v11 triggerEscrowUpdate:v12 options:v9 reply:v17];
  id v13 = v22;
  if (a5)
  {
    uint64_t v14 = (void *)v22[5];
    if (v14)
    {
      *a5 = v14;
      id v13 = v22;
    }
  }
  BOOL v15 = v13[5] == 0;

  _Block_object_dispose(&v21, 8);
  return v15;
}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "triggerEscrowUpdate: Failed to get XPC connection: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v5 = secLogObjForScope("escrow");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_18B299000, v5, OS_LOG_TYPE_DEFAULT, "Triggered escrow update for '%@': %@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return [(SecEscrowRequest *)self triggerEscrowUpdate:a3 options:0 error:a4];
}

- (void)dealloc
{
  v3 = [(SecEscrowRequest *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SecEscrowRequest;
  [(SecEscrowRequest *)&v4 dealloc];
}

- (SecEscrowRequest)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SecEscrowRequest;
  uint64_t v6 = [(SecEscrowRequest *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

+ (id)request:(id *)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.security.escrow-update" options:0];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED87A630];
    SecEscrowRequestSetupControlProtocol(v5);
    objc_claimAutoreleasedReturnValue();

    [v4 setRemoteObjectInterface:v5];
    [v4 resume];
    a3 = [[SecEscrowRequest alloc] initWithConnection:v4];
  }
  else if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Couldn't create connection (no reason given)";
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a3 = [v6 errorWithDomain:@"securityd" code:-1 userInfo:v7];

    a3 = 0;
  }

  return a3;
}

@end