@interface ECSASLClient
+ (NSArray)installedMechanisms;
+ (OS_os_log)log;
- (BOOL)_logGenericError:(int)a3 saslConnection:(sasl_conn *)a4 description:(id)a5 error:(id *)a6;
- (BOOL)excludeAuthorizationName;
- (BOOL)excludeInitialResponse;
- (BOOL)isATOKEN2Enabled;
- (BOOL)lastResponseIncludesCredential;
- (BOOL)lastResponseIncludesPlainTextCredential;
- (BOOL)mechanismUsesPlainText;
- (BOOL)useATOKEN2Authentication;
- (ECAuthenticationCredentials)credentials;
- (ECSASLClient)init;
- (ECSASLClient)initWithMechanismNames:(id)a3 credentials:(id)a4 externalSecurityLayer:(unsigned int)a5 allowPlainText:(BOOL)a6;
- (NSArray)mechanismNames;
- (NSError)saslError;
- (NSString)description;
- (NSString)selectedMechanismName;
- (id)newDecryptedDataForBytes:(const char *)a3 length:(unsigned int)a4;
- (id)newEncryptedDataForBytes:(const char *)a3 length:(unsigned int)a4;
- (id)responseForServerData:(id)a3;
- (id)start;
- (int64_t)saslStatus;
- (sasl_callback)callbacks;
- (sasl_conn)saslConnection;
- (unsigned)encryptionBufferSize;
- (void)_clearAuthenticationCallbackBuffers;
- (void)_handleGenericError:(int)a3 description:(id)a4;
- (void)_handleNeedsUserInteraction:(sasl_interact *)a3;
- (void)_handleStartFailure:(int)a3;
- (void)_retrieveEncryptionBufferSize;
- (void)dealloc;
- (void)setCredentials:(id)a3;
- (void)setEncryptionBufferSize:(unsigned int)a3;
- (void)setExcludeAuthorizationName:(BOOL)a3;
- (void)setExcludeInitialResponse:(BOOL)a3;
- (void)setIsATOKEN2Enabled:(BOOL)a3;
- (void)setLastResponseIncludesCredential:(BOOL)a3;
- (void)setMechanismNames:(id)a3;
- (void)setMechanismUsesPlainText:(BOOL)a3;
- (void)setSaslError:(id)a3;
- (void)setSaslStatus:(int64_t)a3;
- (void)setSelectedMechanismName:(id)a3;
@end

@implementation ECSASLClient

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__ECSASLClient_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return (OS_os_log *)v2;
}

void __19__ECSASLClient_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

- (ECSASLClient)initWithMechanismNames:(id)a3 credentials:(id)a4 externalSecurityLayer:(unsigned int)a5 allowPlainText:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  unsigned int value = a5;
  if (![v10 count])
  {
    v29 = @"mechanismNames cannot be nil or empty";
    goto LABEL_29;
  }
  if (!v11)
  {
    v29 = @"credentials cannot be nil";
LABEL_29:
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v29 userInfo:0];
    objc_exception_throw(v30);
  }
  v36.receiver = self;
  v36.super_class = (Class)ECSASLClient;
  v12 = [(ECSASLClient *)&v36 init];
  if (v12)
  {
    if (initializeSASLIfNecessary_onceToken != -1) {
      dispatch_once(&initializeSASLIfNecessary_onceToken, &__block_literal_global_17);
    }
    if (initializeSASLIfNecessary_saslInitializationStatus) {
      goto LABEL_24;
    }
    if ([(ECSASLClient *)v12 useATOKEN2Authentication]) {
      [(ECSASLClient *)v12 setIsATOKEN2Enabled:1];
    }
    v13 = (sasl_callback_t *)malloc_type_malloc(0x150uLL, 0x1080040D2F62047uLL);
    v14 = v13;
    if (!v13)
    {
      v20 = +[ECSASLClient log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_1BF11D000, v20, OS_LOG_TYPE_INFO, "Failed to allocate memory for SASL connection callback structures", (uint8_t *)&v31, 2u);
      }

      goto LABEL_24;
    }
    v13->id = 1;
    v13->proc = (int (*)(void))getOption;
    v13->context = 0;
    v13[1].id = 16387;
    v13[1].proc = (int (*)(void))getSimpleValue;
    v13[1].context = v12;
    v13[2].id = 16386;
    v13[2].proc = (int (*)(void))getSimpleValue;
    v13[2].context = v12;
    v13[3].id = 16385;
    v13[3].proc = (int (*)(void))getSimpleValue;
    v13[3].context = v12;
    v13[4].id = 16388;
    v13[4].proc = (int (*)(void))getPassword;
    v13[4].context = v12;
    v13[5].id = 18945;
    v13[5].proc = (int (*)(void))getSimpleValue;
    v13[5].context = v12;
    v13[6].id = 18944;
    v13[6].proc = (int (*)(void))getSimpleValue;
    v13[6].context = v12;
    v13[7].id = 18946;
    v13[7].proc = (int (*)(void))getSimpleValue;
    v13[7].context = v12;
    v13[8].id = 18952;
    v13[8].proc = (int (*)(void))getSimpleValue;
    v13[8].context = v12;
    v13[9].id = 18949;
    v13[9].proc = (int (*)(void))getSimpleValue;
    v13[9].context = v12;
    v13[10].id = 18950;
    v13[10].proc = (int (*)(void))getSimpleValue;
    v13[10].context = v12;
    v13[11].id = 18951;
    v13[11].proc = (int (*)(void))getSimpleValue;
    v13[11].context = v12;
    v13[12].id = 18948;
    v13[12].proc = (int (*)(void))getSimpleValue;
    v13[12].context = v12;
    v13[13].id = 0;
    v13[13].proc = 0;
    v13[13].context = 0;
    id v15 = [v11 saslProfileName];
    v16 = (const char *)[v15 UTF8String];

    id v17 = [v11 hostname];
    v18 = (const char *)[v17 UTF8String];

    pconn = 0;
    uint64_t v19 = sasl_client_new(v16, v18, 0, 0, v14, 0, &pconn);
    if (v19)
    {
      [(ECSASLClient *)v12 _logGenericError:v19 saslConnection:pconn description:@"Failed to create a new SASL connection" error:0];
LABEL_23:
      free(v14);
LABEL_24:

      v12 = 0;
      goto LABEL_25;
    }
    if (a5)
    {
      uint64_t v21 = sasl_setprop(pconn, 100, &value);
      if (v21)
      {
        [(ECSASLClient *)v12 _logGenericError:v21 saslConnection:pconn description:@"Failed to set the TLS/SSL strength on the SASL connection" error:0];
LABEL_22:
        sasl_dispose(&pconn);
        goto LABEL_23;
      }
    }
    else
    {
      int v31 = 0;
      long long v34 = 0u;
      uint64_t v32 = 0x280000000800;
      int v33 = !v6;
      uint64_t v21 = sasl_setprop(pconn, 101, &v31);
      if (v21)
      {
        [(ECSASLClient *)v12 _logGenericError:v21 saslConnection:pconn description:@"Failed to set security properties on the SASL connection" error:0];
        goto LABEL_22;
      }
    }
    objc_msgSend(v11, "username", v21);
    id v22 = objc_claimAutoreleasedReturnValue();
    v23 = (const void *)[v22 UTF8String];

    uint64_t v24 = sasl_setprop(pconn, 102, v23);
    if (!v24)
    {
      uint64_t v26 = objc_msgSend(v10, "copy", v24);
      mechanismNames = v12->_mechanismNames;
      v12->_mechanismNames = (NSArray *)v26;

      objc_storeWeak((id *)&v12->_credentials, v11);
      v28 = pconn;
      v12->_callbacks = v14;
      v12->_saslConnection = v28;
      goto LABEL_25;
    }
    [(ECSASLClient *)v12 _logGenericError:v24 saslConnection:pconn description:@"Failed to enable the EXTERNAL mechanism on the SASL connection" error:0];
    goto LABEL_22;
  }
LABEL_25:

  return v12;
}

- (BOOL)useATOKEN2Authentication
{
  if (_os_feature_enabled_impl()) {
    return 1;
  }
  id v3 = [MEMORY[0x1E4F60D58] currentDevice];
  if ([v3 isInternal])
  {
    v4 = [MEMORY[0x1E4F60D58] currentDevice];
    char v2 = [v4 isVirtualMachine];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (ECSASLClient)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"ECSASLClient.m", 279, @"Invalid initializer called, returning nil" object file lineNumber description];

  return 0;
}

- (void)dealloc
{
  sasl_dispose(&self->_saslConnection);
  free(self->_callbacks);
  free(self->_userLanguageCode);
  free(self->_authenticationName);
  free(self->_authorizationName);
  free(self->_password);
  free(self->_authenticationPersonID);
  free(self->_authorizationPersonID);
  free(self->_appleToken);
  free(self->_machineID);
  free(self->_oneTimePassword);
  free(self->_clientInfo);
  free(self->_oauthToken);
  free(self->_appleToken2);
  v3.receiver = self;
  v3.super_class = (Class)ECSASLClient;
  [(ECSASLClient *)&v3 dealloc];
}

- (NSString)description
{
  switch([(ECSASLClient *)self saslStatus])
  {
    case 0:
      objc_super v3 = @"Unauthenticated";
      break;
    case 1:
      objc_super v3 = @"NegotiatingAuthentication";
      break;
    case 2:
      objc_super v3 = @"AuthenticationCompleted";
      break;
    case 3:
      id v4 = [NSString alloc];
      v5 = [(ECSASLClient *)self saslError];
      objc_super v3 = (__CFString *)[v4 initWithFormat:@"Error[%@]", v5];

      break;
    default:
      objc_super v3 = 0;
      break;
  }
  BOOL v6 = NSString;
  v15.receiver = self;
  v15.super_class = (Class)ECSASLClient;
  v7 = [(ECSASLClient *)&v15 description];
  v8 = [(ECSASLClient *)self selectedMechanismName];
  v9 = [(ECSASLClient *)self mechanismNames];
  id v10 = [v9 componentsJoinedByString:@", "];
  unsigned int v11 = [(ECSASLClient *)self encryptionBufferSize];
  v12 = @"yes";
  if (!v11) {
    v12 = @"no";
  }
  v13 = [v6 stringWithFormat:@"%@ status: %@, selected mechanism: %@ (out of %@), security layer: %@", v7, v3, v8, v10, v12];

  return (NSString *)v13;
}

- (id)start
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if ([(ECSASLClient *)self saslStatus])
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:328 description:@"This method must be called in the Unauthenticated state"];
  }
  id v4 = [(ECSASLClient *)self saslConnection];
  v5 = [(ECSASLClient *)self mechanismNames];
  id v6 = [v5 componentsJoinedByString:@" "];
  v7 = (const char *)[v6 UTF8String];

  clientout[0] = 0;
  unsigned int clientoutlen = 0;
  uint64_t v21 = 0;
  mech = 0;
  if ([(ECSASLClient *)self excludeInitialResponse]) {
    uint64_t v8 = sasl_client_start(v4, v7, 0, 0, 0, (const char **)&mech);
  }
  else {
    uint64_t v8 = sasl_client_start(v4, v7, &v21, (const char **)clientout, &clientoutlen, (const char **)&mech);
  }
  uint64_t v9 = v8;
  if (mech)
  {
    uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
    if (([v5 containsObject:v10] & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:349 description:@"SASL selected a mechanism outside of the requested ones"];
    }
    unsigned int v11 = (void *)v10;
  }
  else
  {
    unsigned int v11 = 0;
  }
  [(ECSASLClient *)self setSelectedMechanismName:v11];
  if (v9 > 1)
  {
    v12 = 0;
    if (v9 == 2) {
      [(ECSASLClient *)self _handleNeedsUserInteraction:v21];
    }
    else {
      [(ECSASLClient *)self _handleStartFailure:v9];
    }
    goto LABEL_29;
  }
  if (!clientout[0])
  {
    v12 = 0;
    if (v9) {
      goto LABEL_14;
    }
LABEL_19:
    [(ECSASLClient *)self _clearAuthenticationCallbackBuffers];
    [(ECSASLClient *)self setSaslStatus:2];
    [(ECSASLClient *)self _retrieveEncryptionBufferSize];
    goto LABEL_20;
  }
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:clientout[0] length:clientoutlen];
  if (!v9) {
    goto LABEL_19;
  }
LABEL_14:
  [(ECSASLClient *)self setSaslStatus:1];
LABEL_20:
  v13 = mech;
  if (!mech)
  {
    v13 = "";
    mech = "";
  }
  clientout[1] = 0;
  v25[0] = 0;
  *(void *)((char *)v25 + 5) = 0;
  size_t v14 = strlen(v13);
  if (v14 <= 0x14)
  {
    v16 = (char *)__strcpy_chk();
  }
  else
  {
    objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:384 description:@"SASL selected a mechanism whose name is longer than permitted by the standard"];

    v16 = (char *)malloc_type_malloc(v14 + 1, 0x110CE0A5uLL);
    strcpy(v16, mech);
  }
  uint64_t v17 = sasl_client_plugin_info(v16, (sasl_client_info_callback_t *)getMechanismInformation, self);
  if (v14 >= 0x15) {
    free(v16);
  }
  if (v17)
  {
    [(ECSASLClient *)self setSaslStatus:3];
    [(ECSASLClient *)self _handleGenericError:v17 description:@"Failed to get information about the SASL mechanism"];
  }
LABEL_29:

  return v12;
}

+ (NSArray)installedMechanisms
{
  if (initializeSASLIfNecessary_onceToken != -1) {
    dispatch_once(&initializeSASLIfNecessary_onceToken, &__block_literal_global_17);
  }
  if (initializeSASLIfNecessary_saslInitializationStatus)
  {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = sasl_global_listmech();
    if (v4 && *v4)
    {
      v5 = v4 + 1;
      do
      {
        id v6 = objc_msgSend(NSString, "stringWithUTF8String:");
        [v2 addObject:v6];
      }
      while (*v5++);
    }
  }
  return (NSArray *)v2;
}

- (id)responseForServerData:(id)a3
{
  id v5 = a3;
  if ([(ECSASLClient *)self saslStatus] != 1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:433 description:@"This method must be called in the NegotiatingAuthentication state"];
  }
  [(ECSASLClient *)self setLastResponseIncludesCredential:0];
  unint64_t v6 = [v5 length];
  unsigned int v7 = v6;
  if (HIDWORD(v6))
  {
    NSLog(&cfstr_ServerDataWasT.isa, v6, 0xFFFFFFFFLL, self);
    unsigned int v7 = -1;
  }
  uint64_t v8 = [(ECSASLClient *)self saslConnection];
  clientout = 0;
  unsigned int clientoutlen = 0;
  prompt_need = 0;
  id v9 = v5;
  uint64_t v10 = sasl_client_step(v8, (const char *)[v9 bytes], v7, &prompt_need, (const char **)&clientout, &clientoutlen);
  if (v10)
  {
    if (v10 == 1)
    {
      unsigned int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:clientout length:clientoutlen];
    }
    else
    {
      if (v10 == 2) {
        [(ECSASLClient *)self _handleNeedsUserInteraction:prompt_need];
      }
      else {
        [(ECSASLClient *)self _handleGenericError:v10 description:@"Failed a step of SASL authentication"];
      }
      unsigned int v11 = 0;
    }
  }
  else
  {
    unsigned int v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:clientout length:clientoutlen];
    [(ECSASLClient *)self _clearAuthenticationCallbackBuffers];
    [(ECSASLClient *)self setSaslStatus:2];
    [(ECSASLClient *)self _retrieveEncryptionBufferSize];
  }

  return v11;
}

- (BOOL)lastResponseIncludesPlainTextCredential
{
  BOOL v3 = [(ECSASLClient *)self lastResponseIncludesCredential];
  if (v3)
  {
    LOBYTE(v3) = [(ECSASLClient *)self mechanismUsesPlainText];
  }
  return v3;
}

- (void)_retrieveEncryptionBufferSize
{
  BOOL v3 = [(ECSASLClient *)self saslConnection];
  punsigned int value = 0;
  uint64_t v4 = sasl_getprop(v3, 1, (const void **)&pvalue);
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = @"Failed to get security strength factor from the SASL connection";
LABEL_3:
    [(ECSASLClient *)self _handleGenericError:v5 description:v6];
    return;
  }
  if (*(_DWORD *)pvalue)
  {
    uint64_t v8 = 0;
    uint64_t v7 = sasl_getprop(v3, 2, (const void **)&v8);
    if (!v7)
    {
      [(ECSASLClient *)self setEncryptionBufferSize:*v8];
      return;
    }
    uint64_t v5 = v7;
    unint64_t v6 = @"Failed to get security layer buffer size from the SASL connection";
    goto LABEL_3;
  }
}

- (id)newEncryptedDataForBytes:(const char *)a3 length:(unsigned int)a4
{
  if ([(ECSASLClient *)self saslStatus] != 2)
  {
    unsigned int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:752 description:@"This method must be called in the Authenticated state"];
  }
  output = 0;
  unsigned int outputlen = 0;
  uint64_t v8 = sasl_encode([(ECSASLClient *)self saslConnection], a3, a4, (const char **)&output, &outputlen);
  if (v8)
  {
    [(ECSASLClient *)self _handleGenericError:v8 description:@"Failed to encrypt data"];
    return 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    return (id)[v10 initWithBytes:output length:outputlen];
  }
}

- (id)newDecryptedDataForBytes:(const char *)a3 length:(unsigned int)a4
{
  if ([(ECSASLClient *)self saslStatus] != 2)
  {
    unsigned int v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:769 description:@"This method must be called in the Authenticated state"];
  }
  output = 0;
  unsigned int outputlen = 0;
  uint64_t v8 = sasl_decode([(ECSASLClient *)self saslConnection], a3, a4, (const char **)&output, &outputlen);
  if (v8)
  {
    [(ECSASLClient *)self _handleGenericError:v8 description:@"Failed to decrypt data"];
    return 0;
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    return (id)[v10 initWithBytes:output length:outputlen];
  }
}

- (void)_clearAuthenticationCallbackBuffers
{
  self->_authenticationName = 0;
  free(self->_authorizationName);
  self->_authorizationName = 0;
  free(self->_password);
  self->_password = 0;
}

- (void)_handleGenericError:(int)a3 description:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v8 = 0;
  [(ECSASLClient *)self _logGenericError:v4 saslConnection:[(ECSASLClient *)self saslConnection] description:v6 error:&v8];
  id v7 = v8;
  [(ECSASLClient *)self setSaslStatus:3];
  [(ECSASLClient *)self setSaslError:v7];
}

- (BOOL)_logGenericError:(int)a3 saslConnection:(sasl_conn *)a4 description:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = [NSString stringWithUTF8String:sasl_errdetail(a4)];
  unsigned int v11 = +[ECSASLClient log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v9;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1BF11D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@\n%{public}@", buf, 0x16u);
  }

  if (a6)
  {
    uint64_t v18 = *MEMORY[0x1E4F285A0];
    uint64_t v19 = v10;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SASLErrorDomain" code:a3 userInfo:v12];
    uint64_t v16 = *MEMORY[0x1E4F28A50];
    uint64_t v17 = v13;
    size_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];

    *a6 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ECAuthenticationErrorDomain" code:1030 userInfo:v14];
  }

  return 0;
}

- (void)_handleStartFailure:(int)a3
{
  if (a3 == -4)
  {
    uint64_t v4 = [(ECSASLClient *)self saslConnection];
    memset(value, 0, sizeof(value));
    if (sasl_setprop(v4, 101, value))
    {
      uint64_t v5 = 1046;
    }
    else
    {
      prompt_need = 0;
      id v6 = [(ECSASLClient *)self mechanismNames];
      id v7 = [v6 componentsJoinedByString:@" "];
      id v8 = (const char *)[v7 UTF8String];

      if (sasl_client_start(v4, v8, &prompt_need, 0, 0, 0) == -4) {
        uint64_t v5 = 1046;
      }
      else {
        uint64_t v5 = 1045;
      }
    }
    [(ECSASLClient *)self setSaslStatus:3];
    id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ECAuthenticationErrorDomain" code:v5 userInfo:0];
    [(ECSASLClient *)self setSaslError:v9];
  }
  else
  {
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:");
  }
}

- (void)_handleNeedsUserInteraction:(sasl_interact *)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ECSASLClient.m" lineNumber:872 description:@"libsasl returned SASL_INTERACT without a corresponding sasl_interact_t"];
  }
  id v12 = [(ECSASLClient *)self credentials];
  do
  {
    BOOL v5 = 0;
    uint64_t id = v3->id;
    if ((uint64_t)v3->id > 18947)
    {
      if (id == 18948)
      {
        id v7 = [v12 password];
        if (!v7)
        {
          id v8 = [v12 appleAuthenticationToken];
          if (!v8)
          {
LABEL_24:
            id v9 = [v12 base64EncodedAppleAuthenticationToken2];
            goto LABEL_25;
          }
LABEL_23:
          BOOL v5 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        if (id != 18952) {
          goto LABEL_28;
        }
        id v7 = [v12 password];
        if (!v7)
        {
          id v8 = [v12 oauthToken];
          if (!v8)
          {
            id v9 = [v12 appleAuthenticationToken];
LABEL_25:
            BOOL v5 = v9 == 0;

            goto LABEL_26;
          }
          goto LABEL_23;
        }
      }
LABEL_19:
      BOOL v5 = 0;
LABEL_27:

      goto LABEL_28;
    }
    switch(id)
    {
      case 16388:
        id v7 = [v12 appleAuthenticationToken];
        if (!v7)
        {
          id v8 = [v12 oauthToken];
          if (!v8) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        goto LABEL_19;
      case 18946:
        id v7 = [v12 password];
        if (!v7)
        {
          id v8 = [v12 oauthToken];
          if (!v8) {
            goto LABEL_24;
          }
          goto LABEL_23;
        }
        goto LABEL_19;
      case 0:
        [(ECSASLClient *)self _handleGenericError:2 description:@"User interaction needed"];
        goto LABEL_30;
    }
LABEL_28:
    ++v3;
  }
  while (!v5);
  [(ECSASLClient *)self setSaslStatus:3];
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ECAuthenticationErrorDomain" code:1032 userInfo:0];
  [(ECSASLClient *)self setSaslError:v10];

LABEL_30:
}

- (BOOL)isATOKEN2Enabled
{
  return self->_isATOKEN2Enabled;
}

- (void)setIsATOKEN2Enabled:(BOOL)a3
{
  self->_isATOKEN2Enabled = a3;
}

- (ECAuthenticationCredentials)credentials
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_credentials);
  return (ECAuthenticationCredentials *)WeakRetained;
}

- (void)setCredentials:(id)a3
{
}

- (int64_t)saslStatus
{
  return self->_saslStatus;
}

- (void)setSaslStatus:(int64_t)a3
{
  self->_saslStatus = a3;
}

- (NSError)saslError
{
  return self->_saslError;
}

- (void)setSaslError:(id)a3
{
}

- (NSString)selectedMechanismName
{
  return self->_selectedMechanismName;
}

- (void)setSelectedMechanismName:(id)a3
{
}

- (BOOL)excludeAuthorizationName
{
  return self->_excludeAuthorizationName;
}

- (void)setExcludeAuthorizationName:(BOOL)a3
{
  self->_excludeAuthorizationName = a3;
}

- (BOOL)excludeInitialResponse
{
  return self->_excludeInitialResponse;
}

- (void)setExcludeInitialResponse:(BOOL)a3
{
  self->_excludeInitialResponse = a3;
}

- (unsigned)encryptionBufferSize
{
  return self->_encryptionBufferSize;
}

- (void)setEncryptionBufferSize:(unsigned int)a3
{
  self->_encryptionBufferSize = a3;
}

- (NSArray)mechanismNames
{
  return self->_mechanismNames;
}

- (void)setMechanismNames:(id)a3
{
}

- (sasl_callback)callbacks
{
  return self->_callbacks;
}

- (sasl_conn)saslConnection
{
  return self->_saslConnection;
}

- (BOOL)mechanismUsesPlainText
{
  return self->_mechanismUsesPlainText;
}

- (void)setMechanismUsesPlainText:(BOOL)a3
{
  self->_mechanismUsesPlainText = a3;
}

- (BOOL)lastResponseIncludesCredential
{
  return self->_lastResponseIncludesCredential;
}

- (void)setLastResponseIncludesCredential:(BOOL)a3
{
  self->_lastResponseIncludesCredential = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mechanismNames, 0);
  objc_storeStrong((id *)&self->_selectedMechanismName, 0);
  objc_storeStrong((id *)&self->_saslError, 0);
  objc_destroyWeak((id *)&self->_credentials);
}

@end