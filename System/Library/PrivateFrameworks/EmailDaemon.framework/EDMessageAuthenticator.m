@interface EDMessageAuthenticator
+ (OS_os_log)log;
+ (OS_os_log)signpostLog;
- (BOOL)_isTemporaryDKIMError:(uint64_t)a1;
- (BOOL)_shouldAuthenticateNewMessage:(BOOL)a1;
- (BOOL)authenticateMessage:(id)a3;
- (BOOL)authenticateMessages:(id)a3 trustingServer:(BOOL)a4 cancelationToken:(id)a5;
- (EDMessageAuthenticator)initWithMessagePersistence:(id)a3 hookRegistry:(id)a4;
- (unint64_t)_authenticationStateForMessage:(int)a3 trustingServer:;
- (unint64_t)_messageAuthenticationStateForAuthenticationResult:(int)a3 trustingServer:;
- (unint64_t)signpostID;
- (void)persistenceWillAddNewMessages:(id)a3;
@end

@implementation EDMessageAuthenticator

void ___ef_log_EDMessageAuthenticator_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDMessageAuthenticator");
  v1 = (void *)_ef_log_EDMessageAuthenticator_log;
  _ef_log_EDMessageAuthenticator_log = (uint64_t)v0;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__EDMessageAuthenticator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_50 != -1) {
    dispatch_once(&log_onceToken_50, block);
  }
  v2 = (void *)log_log_50;

  return (OS_os_log *)v2;
}

void __29__EDMessageAuthenticator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_50;
  log_log_50 = (uint64_t)v1;
}

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EDMessageAuthenticator_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;

  return (OS_os_log *)v2;
}

void __37__EDMessageAuthenticator_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (EDMessageAuthenticator)initWithMessagePersistence:(id)a3 hookRegistry:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDMessageAuthenticator;
  v9 = [(EDMessageAuthenticator *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messagePersistence, a3);
    v11 = (ECMessageAuthenticator *)objc_alloc_init(MEMORY[0x1E4F60898]);
    authenticator = v10->_authenticator;
    v10->_authenticator = v11;

    [v8 registerMessageChangeHookResponder:v10];
  }

  return v10;
}

- (BOOL)authenticateMessage:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = -[EDMessageAuthenticator _authenticationStateForMessage:trustingServer:]((uint64_t)self, v4, 0);
  if (self) {
    messagePersistence = self->_messagePersistence;
  }
  else {
    messagePersistence = 0;
  }
  BOOL v7 = [(EDMessagePersistence *)messagePersistence persistMessageAuthenticationState:v5 forMessage:v4];
  id v8 = _ef_log_EDMessageAuthenticator();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218498;
      unint64_t v12 = v5;
      __int16 v13 = 2048;
      unint64_t v14 = v5 & 0xE28;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Persisted message authentication state %lld (on-device: %lld) for message: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    [(EDMessageAuthenticator *)v5 authenticateMessage:v9];
  }

  return v7;
}

- (unint64_t)_authenticationStateForMessage:(int)a3 trustingServer:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = v5;
  if (!a1)
  {
    unint64_t v16 = 0;
    goto LABEL_14;
  }
  BOOL v7 = [v5 senders];
  id v8 = [v7 firstObject];

  if ([MEMORY[0x1E4F602E0] preferenceEnabled:39]
    && ([*(id *)(a1 + 8) fullDataIfAvailableForMessage:v6],
        (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = _ef_log_EDMessageAuthenticator();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = v6;
      int v11 = "Authenticating full data for message: %{public}@";
LABEL_9:
      _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    unint64_t v12 = [v6 headers];
    v9 = [v12 encodedHeaders];

    __int16 v13 = _ef_log_EDMessageAuthenticator();
    v10 = v13;
    if (!v9)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[EDMessageAuthenticator _authenticationStateForMessage:trustingServer:]((uint64_t)v6, v10);
      }
      v9 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      v19 = v6;
      int v11 = "Authenticating header data for message: %{public}@";
      goto LABEL_9;
    }
  }
LABEL_13:

  unint64_t v14 = EMRecodeDataToNetwork();
  __int16 v15 = [*(id *)(a1 + 16) authenticateMessageData:v14 onDevice:a3 ^ 1u sender:v8];
  unint64_t v16 = -[EDMessageAuthenticator _messageAuthenticationStateForAuthenticationResult:trustingServer:](a1, v15, a3);

LABEL_14:
  return v16;
}

- (BOOL)authenticateMessages:(id)a3 trustingServer:(BOOL)a4 cancelationToken:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v27 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = +[EDMessageAuthenticator signpostLog];
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, (const void *)[MEMORY[0x1E4F29128] UUID]);

  int v11 = +[EDMessageAuthenticator signpostLog];
  unint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v37 = [v26 count];
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "EDMessageAuthenticator", "Begin message authentication (count=%{public,signpost.telemetry:number1}lu) enableTelemetry=YES ", buf, 0xCu);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__EDMessageAuthenticator_authenticateMessages_trustingServer_cancelationToken___block_invoke;
  aBlock[3] = &unk_1E6C01F40;
  os_signpost_id_t v34 = v10;
  id v13 = v26;
  id v33 = v13;
  v25 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
LABEL_6:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v29 != v16) {
        objc_enumerationMutation(v14);
      }
      int v18 = *(void **)(*((void *)&v28 + 1) + 8 * v17);
      v19 = objc_msgSend(NSNumber, "numberWithLongLong:", -[EDMessageAuthenticator _authenticationStateForMessage:trustingServer:]((uint64_t)self, v18, v6));
      [v8 setObject:v19 forKeyedSubscript:v18];

      if ([v27 isCanceled]) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (v15) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  if (self) {
    messagePersistence = self->_messagePersistence;
  }
  else {
    messagePersistence = 0;
  }
  BOOL v21 = [(EDMessagePersistence *)messagePersistence persistMessageAuthenticationStates:v8];
  v22 = _ef_log_EDMessageAuthenticator();
  v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = (uint64_t)v8;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Persisted message authentication states: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    -[EDMessageAuthenticator authenticateMessages:trustingServer:cancelationToken:]((uint64_t)v8, v23);
  }

  v25[2](v25, [v8 count]);
  return v21;
}

void __79__EDMessageAuthenticator_authenticateMessages_trustingServer_cancelationToken___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = +[EDMessageAuthenticator signpostLog];
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = [*(id *)(a1 + 32) count];
    int v8 = 134349312;
    uint64_t v9 = v7;
    __int16 v10 = 2050;
    uint64_t v11 = a2;
    _os_signpost_emit_with_name_impl(&dword_1DB39C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDMessageAuthenticator", "Finish message authentication (count=%{public,signpost.telemetry:number1}lu, result=%{public,signpost.telemetry:number2}lu) enableTelemetry=YES ", (uint8_t *)&v8, 0x16u);
  }
}

- (unint64_t)_messageAuthenticationStateForAuthenticationResult:(int)a3 trustingServer:
{
  id v5 = a2;
  os_signpost_id_t v6 = v5;
  if (a1)
  {
    if ([v5 dkimHasServerResult])
    {
      if ([v6 dkimServerVerified]) {
        uint64_t v7 = 3;
      }
      else {
        uint64_t v7 = 1;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    unint64_t v8 = v7 & 0xFFFFFFFFFFFFFE3FLL | (([v6 dmarcServerStatus] & 7) << 6);
    if (a3)
    {
      uint64_t v9 = v8 | 0x14;
      if ([v6 dkimHasServerResult] && objc_msgSend(v6, "dkimServerVerified")) {
        uint64_t v9 = v8 | 0x3C;
      }
      char v10 = [v6 dmarcServerStatus];
      uint64_t v11 = [v6 dmarcServerStatus];
      unint64_t v12 = (unint64_t)(v10 & 7) << 9;
      if (!v11) {
        unint64_t v12 = 512;
      }
      unint64_t v13 = v12 | v9;
    }
    else
    {
      id v14 = [v6 dkimError];
      BOOL v15 = -[EDMessageAuthenticator _isTemporaryDKIMError:](a1, v14);

      if (!v15)
      {
        if ([v6 dkimAttemptedHeaderVerification])
        {
          int v16 = [v6 dkimHeadersVerified];
          uint64_t v17 = 4;
          if (v16) {
            uint64_t v17 = 12;
          }
          v8 |= v17;
        }
        if ([v6 dkimAttemptedBodyVerification])
        {
          int v18 = [v6 dkimBodyVerified];
          uint64_t v19 = 16;
          if (v18) {
            uint64_t v19 = 48;
          }
          v8 |= v19;
        }
        else
        {
          uint64_t v20 = [v6 bestDKIMSignatureHeader];
          BOOL v21 = [v20 bodyLength];

          if (v21) {
            v8 |= 0x10uLL;
          }
        }
      }
      char v22 = [v6 dmarcStatus];
      char v23 = [v6 dmarcIdentifierAlignment];
      unint64_t v13 = v8 & 0xFFFFFFFFFFFF01FFLL | ((v22 & 7) << 9) & 0xFFF | ((v23 & 3) << 12) & 0x3FFF | (([v6 dmarcReceiverPolicy] & 3) << 14);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)_isTemporaryDKIMError:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F60608]]) {
      BOOL v6 = [v4 code] == 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)persistenceWillAddNewMessages:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (-[EDMessageAuthenticator _shouldAuthenticateNewMessage:]((BOOL)self, v8))
        {
          unint64_t v9 = -[EDMessageAuthenticator _authenticationStateForMessage:trustingServer:]((uint64_t)self, v8, 0);
          [v8 setAuthenticationState:v9];
          char v10 = _ef_log_EDMessageAuthenticator();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            unint64_t v16 = v9;
            __int16 v17 = 2048;
            unint64_t v18 = v9 & 0xE28;
            __int16 v19 = 2114;
            uint64_t v20 = v8;
            _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Set message authentication state %lld (on-device: %lld) on message: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v5);
  }
}

- (BOOL)_shouldAuthenticateNewMessage:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    if (_os_feature_enabled_impl())
    {
      a1 = 1;
    }
    else
    {
      id v4 = [v3 headers];
      uint64_t v5 = [v4 firstHeaderForKey:*MEMORY[0x1E4F60658]];

      if (v5)
      {
        uint64_t v6 = [v3 headers];
        uint64_t v7 = [v6 firstHeaderForKey:*MEMORY[0x1E4F606B0]];

        a1 = v7 == 0;
      }
      else
      {
        a1 = 0;
      }
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);

  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

- (void)authenticateMessage:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a1 & 0xE28;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to persist message authentication state %lld (on-device: %lld) for message: %{public}@", (uint8_t *)&v3, 0x20u);
}

- (void)_authenticationStateForMessage:(uint64_t)a1 trustingServer:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "No data to authenticate for message: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)authenticateMessages:(uint64_t)a1 trustingServer:(NSObject *)a2 cancelationToken:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Failed to persist message authentication states: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end