@interface AAMessagingDestination
- (AAMessagingDestination)initWithEmail:(id)a3;
- (AAMessagingDestination)initWithHandle:(id)a3;
- (AAMessagingDestination)initWithPhoneNumber:(id)a3;
- (NSString)destination;
- (NSString)destinationURI;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)destinationType;
- (void)isRegisteredToiMessageWithCompletion:(id)a3;
@end

@implementation AAMessagingDestination

- (AAMessagingDestination)initWithEmail:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAMessagingDestination;
  v5 = [(AAMessagingDestination *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_destinationType = 1;
    uint64_t v7 = [v4 copy];
    destination = v6->_destination;
    v6->_destination = (NSString *)v7;

    uint64_t v9 = _SIDSCopyIDForEmailAddress(v4);
    destinationURI = v6->_destinationURI;
    v6->_destinationURI = (NSString *)v9;
  }
  return v6;
}

- (AAMessagingDestination)initWithPhoneNumber:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AAMessagingDestination;
  v5 = [(AAMessagingDestination *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_destinationType = 2;
    uint64_t v7 = [v4 copy];
    destination = v6->_destination;
    v6->_destination = (NSString *)v7;

    uint64_t v9 = _SIDSCopyIDForPhoneNumberWithOptions(v4, 0, 0);
    destinationURI = v6->_destinationURI;
    v6->_destinationURI = (NSString *)v9;
  }
  return v6;
}

- (AAMessagingDestination)initWithHandle:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)AAMessagingDestination;
  v5 = [(AAMessagingDestination *)&v42 init];
  if (!v5) {
    goto LABEL_8;
  }
  if (([v4 hasPrefix:@"token:"] & 1) != 0
    || [v4 hasPrefix:@"self-token:"])
  {
    v6 = _AALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[AAMessagingDestination initWithHandle:](v6, v7, v8, v9, v10, v11, v12, v13);
    }

    v5->_destinationType = 3;
    uint64_t v14 = [v4 copy];
LABEL_7:
    destinationURI = v5->_destinationURI;
    v5->_destinationURI = (NSString *)v14;

LABEL_8:
    uint64_t v16 = dispatch_get_global_queue(33, 0);
    idsQueue = v5->_idsQueue;
    v5->_idsQueue = (OS_dispatch_queue *)v16;

    v18 = v5;
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "aa_appearsToBeEmail"))
  {
    v20 = _AALogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[AAMessagingDestination initWithHandle:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v5->_destinationType = 1;
    uint64_t v28 = [v4 copy];
    destination = v5->_destination;
    v5->_destination = (NSString *)v28;

    uint64_t v14 = _SIDSCopyIDForEmailAddress(v4);
    goto LABEL_7;
  }
  int v30 = objc_msgSend(v4, "aa_appearsToBePhoneNumber");
  v31 = _AALogSystem();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG);
  if (v30)
  {
    if (v32) {
      -[AAMessagingDestination initWithHandle:](v31, v33, v34, v35, v36, v37, v38, v39);
    }

    v5->_destinationType = 2;
    uint64_t v40 = [v4 copy];
    v41 = v5->_destination;
    v5->_destination = (NSString *)v40;

    uint64_t v14 = _SIDSCopyIDForPhoneNumberWithOptions(v4, 0, 0);
    goto LABEL_7;
  }
  if (v32) {
    -[AAMessagingDestination initWithHandle:].cold.4((uint64_t)v4, v31);
  }

  v18 = 0;
LABEL_9:

  return v18;
}

- (void)isRegisteredToiMessageWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [getIDSIDQueryControllerClass() sharedInstance];
  v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[AAMessagingDestination isRegisteredToiMessageWithCompletion:](self, v6);
  }

  objc_initWeak(&location, self);
  destinationURI = self->_destinationURI;
  uint64_t v8 = getIDSServiceNameiMessage();
  uint64_t v9 = getIDSServiceNameiMessage();
  idsQueue = self->_idsQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke;
  v13[3] = &unk_1E5A49C90;
  objc_copyWeak(&v17, &location);
  id v11 = v5;
  id v14 = v11;
  id v12 = v4;
  v15 = self;
  id v16 = v12;
  [v11 currentIDStatusForDestination:destinationURI service:v8 listenerID:v9 queue:idsQueue completionBlock:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = _AALogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v6) {
      __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_2();
    }

    (*(void (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2 == 1);
  }
  else
  {
    if (v6) {
      __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_1(v5);
    }

    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = WeakRetained[4];
    uint64_t v9 = getIDSServiceNameiMessage();
    uint64_t v10 = getIDSServiceNameiMessage();
    uint64_t v11 = WeakRetained[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_37;
    v13[3] = &unk_1E5A49C68;
    id v14 = WeakRetained;
    id v12 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 40);
    id v16 = v12;
    [v7 refreshIDStatusForDestination:v8 service:v9 listenerID:v10 queue:v11 completionBlock:v13];
  }
}

uint64_t __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_37(uint64_t a1, uint64_t a2)
{
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_37_cold_1();
  }

  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2 == 1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_destination copy];
  BOOL v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (int64_t)destinationType
{
  return self->_destinationType;
}

- (NSString)destination
{
  return self->_destination;
}

- (NSString)destinationURI
{
  return self->_destinationURI;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationURI, 0);
  objc_storeStrong((id *)&self->_destination, 0);

  objc_storeStrong((id *)&self->_idsQueue, 0);
}

- (void)initWithHandle:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithHandle:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithHandle:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithHandle:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[AAMessagingDestination initWithHandle:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "%s unable to initialize with handle %@", (uint8_t *)&v2, 0x16u);
}

- (void)isRegisteredToiMessageWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 destinationURI];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1A11D8000, a2, OS_LOG_TYPE_DEBUG, "Checking if %@ is reachable via iMessage.", (uint8_t *)&v4, 0xCu);
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A11D8000, log, OS_LOG_TYPE_DEBUG, "IDS status is unknown. Forcing refresh.", v1, 2u);
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "Known IDS status for %@ is %ld");
}

void __63__AAMessagingDestination_isRegisteredToiMessageWithCompletion___block_invoke_37_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_5(&dword_1A11D8000, v0, v1, "IDS status for %@ is %ld");
}

@end