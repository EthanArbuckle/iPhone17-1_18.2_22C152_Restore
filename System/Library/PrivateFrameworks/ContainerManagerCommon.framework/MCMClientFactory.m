@interface MCMClientFactory
- (MCMClientCodeSignInfoCache)clientCodeSignInfoCache;
- (MCMClientFactory)initWithUserIdentityCache:(id)a3 clientCodeSignInfoCache:(id)a4 clientIdentityCache:(id)a5;
- (MCMClientIdentityCache)clientIdentityCache;
- (MCMUserIdentityCache)userIdentityCache;
- (id)_clientIdentityWithClient:(container_client *)a3 proximateClient:(id)a4 error:(id *)a5;
- (id)_clientIdentityWithClientMessageContext:(id)a3 error:(id *)a4;
- (id)_codeSignInfoWithClient:(container_client *)a3 CDHash:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 error:(id *)a7;
- (id)_proxiedClientIdentityFromMessage:(id)a3 proximateClient:(id)a4 error:(id *)a5;
- (id)clientIdentityWithClientMessageContext:(id)a3 xpcMessage:(id)a4 error:(id *)a5;
@end

@implementation MCMClientFactory

- (id)_clientIdentityWithClientMessageContext:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  uint64_t v21 = 1;
  long long v24 = 0u;
  long long v25 = 0u;
  if (v6) {
    [v6 auditToken];
  }
  v8 = [v7 personaUniqueString];
  *(_OWORD *)buf = v24;
  long long v23 = v25;
  v9 = (const char *)container_audit_token_copy_codesign_identifier();
  __s = v9;
  if (v9)
  {
    v10 = (char *)v9;
    if (!strncmp("com.apple.installd", v9, 0x13uLL))
    {
      v11 = container_log_handle_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v8;
        _os_log_debug_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEBUG, "Ignoring client persona because it is identified as installd; persona was = [%@]",
          buf,
          0xCu);
      }

      v8 = 0;
    }
    free(v10);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  id v12 = v8;
  [v12 UTF8String];
  *(_OWORD *)buf = v24;
  long long v23 = v25;
  uint64_t v13 = container_client_create_from_audit_token();
  if (v13)
  {
    id v19 = 0;
    v14 = [(MCMClientFactory *)self _clientIdentityWithClient:v13 proximateClient:0 error:&v19];
    v15 = (MCMError *)v19;
  }
  else
  {
    v16 = [MCMError alloc];
    v15 = [(MCMError *)v16 initWithErrorType:v21 category:2];
    v17 = container_log_handle_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_error_impl(&dword_1D7739000, v17, OS_LOG_TYPE_ERROR, "Could not generate client object from xpc connection; error = %@",
        buf,
        0xCu);
    }

    v14 = 0;
  }
  container_free_client();
  if (a4 && !v14) {
    *a4 = v15;
  }

  return v14;
}

- (id)_clientIdentityWithClient:(container_client *)a3 proximateClient:(id)a4 error:(id *)a5
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v66 = 0u;
  long long v67 = 0u;
  container_client_get_audit_token();
  int is_test_client = container_client_is_test_client();
  uint64_t euid = container_client_get_euid();
  unsigned int pid = container_client_get_pid();
  unsigned int platform = container_client_get_platform();
  v53 = v7;
  if (!container_client_is_signed())
  {
    uint64_t v21 = [[MCMError alloc] initWithErrorType:98 category:3];
    v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Client pid [%d] is not signed or has died.", buf, 8u);
    }

    goto LABEL_20;
  }
  uint64_t v63 = 0;
  *(_OWORD *)buf = v66;
  *(_OWORD *)&uint8_t buf[16] = v67;
  id v12 = (void *)container_audit_token_copy_codesign_hash();
  __s = v12;
  if (!v12)
  {
    v27 = container_log_handle_for_category();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(void *)&buf[8] = *((void *)&v66 + 1);
      *(_OWORD *)&uint8_t buf[16] = v67;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = container_audit_token_get_pid();
      _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "Failed to get codesign hash for pid %d", buf, 8u);
    }

    uint64_t v21 = [[MCMError alloc] initWithErrorType:97 category:3];
LABEL_20:
    long long v24 = 0;
    long long v25 = 0;
    uint64_t v26 = 0;
    v17 = 0;
    v15 = 0;
    v28 = 0;
    v20 = 0;
    v29 = 0;
    goto LABEL_21;
  }
  v51 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:v63];
  free(__s);
  memset_s(&__s, 8uLL, 0, 8uLL);
  uint64_t codesign_identifier = container_client_get_codesign_identifier();
  if (!codesign_identifier
    || ([NSString stringWithUTF8String:codesign_identifier],
        (uint64_t v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v23 = container_log_handle_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = pid;
      _os_log_error_impl(&dword_1D7739000, v23, OS_LOG_TYPE_ERROR, "Could not get client identifier for pid [%d]", buf, 8u);
    }

    uint64_t v21 = [[MCMError alloc] initWithErrorType:97 category:3];
    long long v24 = 0;
    long long v25 = 0;
    uint64_t v26 = 0;
    v17 = 0;
    v15 = 0;
    goto LABEL_41;
  }
  v15 = (void *)v14;
  unsigned int v50 = platform;
  uint64_t codesign_team_identifier = container_client_get_codesign_team_identifier();
  if (codesign_team_identifier)
  {
    v17 = [NSString stringWithUTF8String:codesign_team_identifier];
    if (is_test_client) {
      goto LABEL_7;
    }
  }
  else
  {
    v17 = 0;
    if (is_test_client)
    {
LABEL_7:
      if (v7)
      {
        id v18 = containermanager_copy_global_configuration();
        if ([v18 isInternalImage])
        {
          char v19 = [v7 isAllowedToTest];

          if (v19)
          {
            unsigned int v49 = pid;
            id v61 = 0;
            v20 = [(MCMClientFactory *)self _codeSignInfoWithClient:a3 CDHash:v51 identifier:v15 teamIdentifier:v17 error:&v61];
            uint64_t v21 = (MCMError *)v61;
            goto LABEL_25;
          }
        }
        else
        {
        }
        v37 = container_log_handle_for_category();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D7739000, v37, OS_LOG_TYPE_ERROR, "Cannot use a test client.", buf, 2u);
        }

        v35 = [MCMError alloc];
        uint64_t v36 = 55;
      }
      else
      {
        v34 = container_log_handle_for_category();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D7739000, v34, OS_LOG_TYPE_ERROR, "Cannot use a test client without a proximate client.", buf, 2u);
        }

        v35 = [MCMError alloc];
        uint64_t v36 = 38;
      }
      uint64_t v21 = [(MCMError *)v35 initWithErrorType:v36 category:3];
LABEL_40:
      long long v24 = 0;
      long long v25 = 0;
      uint64_t v26 = 0;
LABEL_41:
      v20 = 0;
      goto LABEL_42;
    }
  }
  unsigned int v49 = pid;
  v31 = [(MCMClientFactory *)self clientCodeSignInfoCache];
  v59 = a3;
  id v60 = 0;
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke;
  v55[3] = &unk_1E6A7FA40;
  v55[4] = self;
  id v56 = v51;
  id v57 = v15;
  id v58 = v17;
  v20 = [v31 codeSignInfoForCDHash:v56 identifier:v57 error:&v60 generator:v55];
  uint64_t v21 = (MCMError *)v60;

LABEL_25:
  if (!v20)
  {
    v33 = container_log_handle_for_category();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v21;
      _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "Could not generate codesign info from xpc connection; error = %@",
        buf,
        0xCu);
    }

    goto LABEL_40;
  }
  HIDWORD(v47) = container_client_is_sandboxed();
  v32 = [(MCMClientFactory *)self userIdentityCache];
  v54 = v21;
  uint64_t v26 = [v32 userIdentityForClient:a3 error:&v54];
  v48 = v54;

  if (v26)
  {
    bzero(v64, 0x401uLL);
    *(_OWORD *)buf = v66;
    *(_OWORD *)&uint8_t buf[16] = v67;
    if (sandbox_container_path_for_audit_token())
    {
      long long v25 = 0;
    }
    else
    {
      long long v25 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v64 isDirectory:1 relativeToURL:0];
    }
    uint64_t v41 = +[MCMPOSIXUser posixUserWithUID:euid];
    if (v41)
    {
      long long v24 = (void *)v41;
      v42 = container_log_handle_for_category();
      v28 = v51;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        v45 = [v26 shortDescription];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v45;
        _os_log_debug_impl(&dword_1D7739000, v42, OS_LOG_TYPE_DEBUG, "Generating new client identity for [%@/%@]", buf, 0x16u);

        v28 = v51;
      }

      v43 = [MCMClientIdentity alloc];
      *(_OWORD *)buf = v66;
      *(_OWORD *)&uint8_t buf[16] = v67;
      LOWORD(v47) = is_test_client;
      LOBYTE(v46) = BYTE4(v47);
      v29 = -[MCMClientIdentity initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:](v43, "initWithPOSIXUser:POSIXPID:platform:userIdentity:proximateClient:auditToken:codeSignInfo:sandboxed:sandboxContainerURL:testClient:kernel:", v24, v49, v50, v26, v53, buf, v20, v46, v25, v47);
      uint64_t v21 = v48;
LABEL_21:
      v30 = a5;
      if (!a5) {
        goto LABEL_45;
      }
      goto LABEL_43;
    }
    uint64_t v21 = [[MCMError alloc] initWithErrorType:75 category:3];

    v44 = container_log_handle_for_category();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = euid;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v49;
      _os_log_error_impl(&dword_1D7739000, v44, OS_LOG_TYPE_ERROR, "Could not generate user details for euid %d from pid %d", buf, 0xEu);
    }

    long long v24 = 0;
  }
  else
  {
    v40 = container_log_handle_for_category();
    uint64_t v21 = v48;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v49;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v48;
      _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Could not compute user identity for client %d; error = %@",
        buf,
        0x12u);
    }

    long long v24 = 0;
    long long v25 = 0;
    uint64_t v26 = 0;
  }
LABEL_42:
  v29 = 0;
  v28 = v51;
  v30 = a5;
  if (!a5) {
    goto LABEL_45;
  }
LABEL_43:
  if (!v29) {
    id *v30 = v21;
  }
LABEL_45:
  v38 = v29;

  return v38;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (MCMClientCodeSignInfoCache)clientCodeSignInfoCache
{
  return self->_clientCodeSignInfoCache;
}

uint64_t __73__MCMClientFactory_XPC___clientIdentityWithClient_proximateClient_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[8];
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  uint64_t v7 = a1[7];

  return [v4 _codeSignInfoWithClient:v3 CDHash:v5 identifier:v6 teamIdentifier:v7 error:a2];
}

- (id)_codeSignInfoWithClient:(container_client *)a3 CDHash:(id)a4 identifier:(id)a5 teamIdentifier:(id)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  long long v31 = 0u;
  long long v32 = 0u;
  container_client_get_audit_token();
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t codesign_status = container_audit_token_get_codesign_status();
  int pid = container_client_get_pid();
  if ((codesign_status & 1) == 0)
  {
    v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3, v29, v30);
    v16 = container_log_handle_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl(&dword_1D7739000, v16, OS_LOG_TYPE_ERROR, "Client pid [%d] is not signed or has died.", (uint8_t *)&v29, 8u);
    }

LABEL_17:
    v22 = 0;
    id v18 = 0;
    goto LABEL_18;
  }
  v17 = (void *)container_client_copy_entitlement();
  if (!v17 || (id v18 = (void *)_CFXPCCreateCFObjectFromXPCObject()) == 0)
  {
    if ((container_client_is_alive() & 1) == 0)
    {
      v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 98, 3, v29, v30);
      uint64_t v26 = container_log_handle_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v29) = 67109120;
        DWORD1(v29) = pid;
        _os_log_error_impl(&dword_1D7739000, v26, OS_LOG_TYPE_ERROR, "Client pid [%d] has died, failed to fetch entitlements.", (uint8_t *)&v29, 8u);
      }

      goto LABEL_17;
    }
    id v18 = (void *)MEMORY[0x1E4F1CC08];
  }

  char v19 = [MCMEntitlements alloc];
  id v20 = containermanager_copy_global_configuration();
  uint64_t v21 = objc_msgSend(v20, "classIterator", v29, v30);
  v22 = [(MCMEntitlements *)v19 initWithEntitlements:v18 clientIdentifier:v11 classIterator:v21];

  long long v23 = container_log_handle_for_category();
  long long v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 67109120;
      DWORD1(v29) = pid;
      _os_log_error_impl(&dword_1D7739000, v24, OS_LOG_TYPE_ERROR, "Could not initialize entitlements for pid [%d]", (uint8_t *)&v29, 8u);
    }

    v15 = [[MCMError alloc] initWithErrorType:97 category:3];
    v22 = 0;
LABEL_18:
    long long v25 = 0;
    if (!a7) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v29) = 138412290;
    *(void *)((char *)&v29 + 4) = v11;
    _os_log_debug_impl(&dword_1D7739000, v24, OS_LOG_TYPE_DEBUG, "Generating new codesign info blob for [%@]", (uint8_t *)&v29, 0xCu);
  }

  long long v25 = [[MCMClientCodeSignInfo alloc] initWithCDHash:v10 entitlements:v22 identifier:v11 teamIdentifier:v12 status:codesign_status];
  v15 = 0;
  if (a7)
  {
LABEL_19:
    if (!v25) {
      *a7 = v15;
    }
  }
LABEL_21:
  v27 = v25;

  return v27;
}

- (id)clientIdentityWithClientMessageContext:(id)a3 xpcMessage:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(MCMClientFactory *)self clientIdentityCache];
  if (v8) {
    [v8 auditToken];
  }
  else {
    memset(v31, 0, sizeof(v31));
  }
  id v11 = [v8 personaUniqueString];
  id v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke;
  v26[3] = &unk_1E6A7F9F0;
  v26[4] = self;
  id v12 = v8;
  id v27 = v12;
  *(_OWORD *)buf = 0u;
  long long v30 = 0u;
  uint64_t v13 = [v10 clientIdentityWithAuditToken:v31 proximateAuditToken:buf personaUniqueString:v11 error:&v28 generator:v26];
  uint64_t v14 = (MCMError *)v28;

  if (v13)
  {
    long long v25 = v14;
    v15 = [(MCMClientFactory *)self _proxiedClientIdentityFromMessage:v9 proximateClient:v13 error:&v25];
    v16 = v25;

    if (v15 || !v16)
    {
      char v19 = [v13 codeSignInfo];
      v17 = [v19 entitlements];

      id v20 = v13;
      if (!v15 || (char v21 = [v17 proxyAllowed], v20 = v15, (v21 & 1) != 0))
      {
        id v18 = v20;
        goto LABEL_18;
      }
      uint64_t v14 = [[MCMError alloc] initWithErrorType:55 category:3];

      v22 = container_log_handle_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D7739000, v22, OS_LOG_TYPE_ERROR, "Not entitled to proxy", buf, 2u);
      }

      if (!a5) {
        goto LABEL_17;
      }
    }
    else
    {
      v15 = 0;
      v17 = 0;
      uint64_t v14 = v16;
      if (!a5) {
        goto LABEL_17;
      }
    }
  }
  else
  {
    v15 = 0;
    v17 = 0;
    if (!a5)
    {
LABEL_17:
      id v18 = 0;
      v16 = v14;
      goto LABEL_18;
    }
  }
  v16 = v14;
  id v18 = 0;
  *a5 = v16;
LABEL_18:
  id v23 = v18;

  return v23;
}

- (id)_proxiedClientIdentityFromMessage:(id)a3 proximateClient:(id)a4 error:(id *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = xpc_dictionary_get_dictionary(a3, "ProxyForClient");
  if (!v9)
  {
    v16 = 0;
    goto LABEL_14;
  }
  uint64_t v30 = 1;
  uint64_t v10 = container_client_copy_decoded_from_xpc_object();
  if (!v10)
  {
    v16 = [[MCMError alloc] initWithErrorType:v30 category:3];
    v17 = container_log_handle_for_category();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
      char v21 = 0;
      if (!a5) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = container_get_error_description();
    id v18 = "Invalid proxied client, error = %s";
    char v19 = v17;
    uint32_t v20 = 12;
LABEL_28:
    _os_log_error_impl(&dword_1D7739000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
    goto LABEL_13;
  }
  uint64_t v11 = v10;
  if (!container_client_is_test_client()) {
    goto LABEL_6;
  }
  id v12 = containermanager_copy_global_configuration();
  if (![v12 isInternalImage])
  {

    goto LABEL_12;
  }
  char v13 = [v8 isAllowedToTest];

  if ((v13 & 1) == 0)
  {
LABEL_12:
    v16 = [[MCMError alloc] initWithErrorType:55 category:3];
    v17 = container_log_handle_for_category();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v18 = "Not allowed to proxy a test client";
    char v19 = v17;
    uint32_t v20 = 2;
    goto LABEL_28;
  }
LABEL_6:
  *(_OWORD *)buf = 0u;
  long long v34 = 0u;
  container_client_get_audit_token();
  uint64_t persona_unique_string = container_client_get_persona_unique_string();
  if (persona_unique_string)
  {
    v15 = [NSString stringWithUTF8String:persona_unique_string];
  }
  else
  {
    v15 = 0;
  }
  if (container_client_is_test_client())
  {
    id v29 = 0;
    char v21 = [(MCMClientFactory *)self _clientIdentityWithClient:v11 proximateClient:v8 error:&v29];
    v16 = (MCMError *)v29;
  }
  else
  {
    long long v24 = [(MCMClientFactory *)self clientIdentityCache];
    if (v8) {
      [v8 auditToken];
    }
    else {
      memset(v32, 0, sizeof(v32));
    }
    uint64_t v27 = v11;
    id v28 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke;
    v25[3] = &unk_1E6A7FA18;
    v25[4] = self;
    id v26 = v8;
    v31[0] = *(_OWORD *)buf;
    v31[1] = v34;
    char v21 = [v24 clientIdentityWithAuditToken:v31 proximateAuditToken:v32 personaUniqueString:v15 error:&v28 generator:v25];
    v16 = (MCMError *)v28;
  }
  container_free_client();

  if (a5)
  {
LABEL_15:
    if (!v21) {
      *a5 = v16;
    }
  }
LABEL_17:
  id v22 = v21;

  return v22;
}

- (MCMClientIdentityCache)clientIdentityCache
{
  return self->_clientIdentityCache;
}

uint64_t __81__MCMClientFactory_XPC__clientIdentityWithClientMessageContext_xpcMessage_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 _clientIdentityWithClientMessageContext:v4 error:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentityCache, 0);
  objc_storeStrong((id *)&self->_clientCodeSignInfoCache, 0);

  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

- (MCMClientFactory)initWithUserIdentityCache:(id)a3 clientCodeSignInfoCache:(id)a4 clientIdentityCache:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMClientFactory;
  id v12 = [(MCMClientFactory *)&v15 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userIdentityCache, a3);
    objc_storeStrong((id *)&v13->_clientCodeSignInfoCache, a4);
    objc_storeStrong((id *)&v13->_clientIdentityCache, a5);
  }

  return v13;
}

uint64_t __81__MCMClientFactory_XPC___proxiedClientIdentityFromMessage_proximateClient_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = a1[6];
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];

  return [v4 _clientIdentityWithClient:v3 proximateClient:v5 error:a2];
}

@end