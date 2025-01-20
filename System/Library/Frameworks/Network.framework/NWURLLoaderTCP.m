@interface NWURLLoaderTCP
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)errorForNWError:(id *)a1;
- (id)takeCachedResponse;
- (void)configureTLS:(uint64_t)a1;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)stop;
- (void)updateClient:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoaderTCP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerTrustInternal, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pendingWork, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_hostname, 0);
}

- (OS_nw_connection)underlyingConnection
{
  if (self) {
    self = (NWURLLoaderTCP *)self->_connection;
  }
  return (OS_nw_connection *)self;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke;
  v20 = &unk_1E52484D8;
  v21 = self;
  id v10 = v8;
  id v22 = v10;
  BOOL v24 = a4;
  id v11 = v9;
  id v23 = v11;
  v12 = _Block_copy(&v17);
  v13 = v12;
  if (!self)
  {
    pendingWork = 0;
    goto LABEL_6;
  }
  if (!self->_ready)
  {
    pendingWork = self->_pendingWork;
LABEL_6:
    v15 = pendingWork;
    v16 = _Block_copy(v13);
    -[NSMutableArray addObject:](v15, "addObject:", v16, v17, v18, v19, v20, v21, v22);

    goto LABEL_4;
  }
  (*((void (**)(void *))v12 + 2))(v12);
LABEL_4:
}

void __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(NSObject **)(v1 + 64);
  }
  else {
    v2 = 0;
  }
  char v3 = *(unsigned char *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5242798;
  v5[4] = v1;
  v4 = *(NSObject **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  nw_connection_send(v2, v4, (nw_content_context_t)&__block_literal_global_8_42267, v3, v5);
}

void __55__NWURLLoaderTCP_writeData_complete_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!v3 || !*(void *)(v3 + 72))
    {
      v4 = -[NWURLLoaderTCP errorForNWError:]((id *)v3, v8);
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        objc_storeStrong((id *)(v5 + 72), v4);
      }
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void *)(v6 + 72);
  }
  else {
    uint64_t v7 = 0;
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
}

- (id)errorForNWError:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [NWURLError alloc];
    uint64_t v5 = [v2[5] loaderTask];
    v2 = (id *)-[NWURLError initWithNWError:forLoader:andTask:](v4, v3, v2, v5);
  }

  return v2;
}

- (BOOL)allowsWrite
{
  return 1;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (id)takeCachedResponse
{
  return 0;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (BOOL)requestComplete
{
  return 1;
}

- (OS_sec_trust)peerTrust
{
  if (self) {
    self = (NWURLLoaderTCP *)self->_peerTrustInternal;
  }
  return (OS_sec_trust *)self;
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke;
  uint64_t v18 = &unk_1E523C650;
  v19 = self;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  id v9 = v8;
  id v20 = v9;
  id v10 = _Block_copy(&v15);
  id v11 = v10;
  if (!self)
  {
    pendingWork = 0;
    goto LABEL_6;
  }
  if (!self->_ready)
  {
    pendingWork = self->_pendingWork;
LABEL_6:
    v13 = pendingWork;
    v14 = _Block_copy(v11);
    -[NSMutableArray addObject:](v13, "addObject:", v14, v15, v16, v17, v18, v19);

    goto LABEL_4;
  }
  (*((void (**)(void *))v10 + 2))(v10);
LABEL_4:
}

void __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    v2 = *(void **)(v1 + 64);
  }
  else {
    v2 = 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 48);
  unsigned int v4 = *(_DWORD *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5248DC0;
  v5[4] = v1;
  id v6 = *(id *)(a1 + 40);
  nw_connection_receive_internal(v2, 0, v3, v4, v5);
}

void __84__NWURLLoaderTCP_readDataOfMinimumIncompleteLength_maximumLength_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v16 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    if (!v11 || !*(void *)(v11 + 72))
    {
      v12 = -[NWURLLoaderTCP errorForNWError:]((id *)v11, v10);
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        objc_storeStrong((id *)(v13 + 72), v12);
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    uint64_t v15 = *(void *)(v14 + 72);
  }
  else {
    uint64_t v15 = 0;
  }
  (*(void (**)(void, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v16, a4, v15);
}

- (void)readResponse:(id)a3
{
  id v3 = a3;
  _os_crash();
  __break(1u);
}

- (void)updateClient:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_storeStrong((id *)&self->_client, a3);
  }
}

- (void)stop
{
  if (self)
  {
    id v3 = self->_connection;
    if (v3)
    {
      BOOL cancelled = self->_cancelled;

      if (!cancelled)
      {
        self->_BOOL cancelled = 1;
        nw_connection_cancel((nw_connection_t)self->_connection);
      }
    }
    client = self->_client;
    self->_client = 0;
  }
}

- (void)start:(id)a3
{
  if (self) {
    hostname = self->_hostname;
  }
  else {
    hostname = 0;
  }
  id v6 = hostname;
  uint64_t v7 = (void (**)(void))a3;
  id v8 = [(NSString *)v6 UTF8String];
  if (self)
  {
    BOOL host_with_numeric_port = nw_endpoint_create_host_with_numeric_port(v8, LOWORD(self->_port));
    id v10 = _Block_copy(&__block_literal_global_19196);
    if (self->_TLS)
    {
      self->_addedTLS = 1;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __24__NWURLLoaderTCP_start___block_invoke;
      aBlock[3] = &unk_1E5248AE8;
      aBlock[4] = self;
      uint64_t v11 = _Block_copy(aBlock);

      id v10 = v11;
    }
    nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v10, &__block_literal_global_158);
    configuration = self->_configuration;
  }
  else
  {
    BOOL host_with_numeric_port = nw_endpoint_create_host_with_numeric_port(v8, 0);
    id v10 = _Block_copy(&__block_literal_global_19196);
    nw_parameters_t secure_tcp = nw_parameters_create_secure_tcp(v10, &__block_literal_global_158);
    configuration = 0;
  }
  -[NWURLSessionTaskConfiguration configureParameters:]((id *)&configuration->super.isa, secure_tcp);
  uint64_t v14 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)host_with_numeric_port, secure_tcp);
  if (self)
  {
    connection = self->_connection;
    self->_connection = v14;

    id v16 = self->_connection;
  }
  else
  {

    id v16 = 0;
  }
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __24__NWURLLoaderTCP_start___block_invoke_3;
  handler[3] = &unk_1E524BA60;
  handler[4] = self;
  nw_connection_set_state_changed_handler(v16, handler);
  if (self) {
    uint64_t v17 = self->_connection;
  }
  else {
    uint64_t v17 = 0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __24__NWURLLoaderTCP_start___block_invoke_4;
  v24[3] = &unk_1E523FCB0;
  v24[4] = self;
  nw_connection_set_better_path_available_handler(v17, v24);
  if (self) {
    uint64_t v18 = self->_connection;
  }
  else {
    uint64_t v18 = 0;
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __24__NWURLLoaderTCP_start___block_invoke_5;
  v23[3] = &unk_1E523FCB0;
  v23[4] = self;
  nw_connection_set_viability_changed_handler(v18, v23);
  if (self)
  {
    v19 = self->_connection;
    nw_connection_set_queue((nw_connection_t)v19, (dispatch_queue_t)self->_queue);

    id v20 = self->_configuration;
    unint64_t v21 = self->_connection;
  }
  else
  {
    nw_connection_set_queue(0, 0);
    id v20 = 0;
    unint64_t v21 = 0;
  }
  -[NWURLSessionTaskConfiguration configureConnection:]((uint64_t)v20, v21);

  if (self) {
    unint64_t v22 = self->_connection;
  }
  else {
    unint64_t v22 = 0;
  }
  nw_connection_start(v22);
  v7[2](v7);
}

void __24__NWURLLoaderTCP_start___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  -[NWURLLoaderTCP configureTLS:](v2, v3);
}

void __24__NWURLLoaderTCP_start___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  switch(a2)
  {
    case 1:
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        [*(id *)(v6 + 40) loaderWaitingForConnectivity];
      }
      else {
        [0 loaderWaitingForConnectivity];
      }
      goto LABEL_54;
    case 2:
      uint64_t v41 = *(void *)(a1 + 32);
      if (v41) {
        v42 = *(void **)(v41 + 40);
      }
      else {
        v42 = 0;
      }
      [v42 loaderPreparingConnection];
      goto LABEL_54;
    case 3:
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        id v8 = *(void **)(v7 + 40);
      }
      else {
        id v8 = 0;
      }
      [v8 loaderConnectedWithHTTPConnectionMetadata:0 CNAMEChain:0 unlistedTracker:0];
      uint64_t v9 = *(void *)(a1 + 32);
      if (!v9) {
        goto LABEL_10;
      }
      if (*(unsigned char *)(v9 + 10) && !*(unsigned char *)(v9 + 11))
      {
        *(unsigned char *)(v9 + 11) = 1;
        v43 = (void *)nw_protocol_boringssl_copy_definition();
        options = nw_protocol_create_options(v43);

        uint64_t v45 = *(void *)(a1 + 32);
        v46 = options;
        -[NWURLLoaderTCP configureTLS:](v45, v46);

        uint64_t v47 = *(void *)(a1 + 32);
        if (v47) {
          v48 = *(void **)(v47 + 64);
        }
        else {
          v48 = 0;
        }
        nw_connection_append_and_start_application_protocol(v48, v46);
      }
      else
      {
        uint64_t v9 = *(void *)(v9 + 64);
LABEL_10:
        id v10 = (id)v9;
        uint64_t v11 = nw_protocol_boringssl_copy_definition();
        nw_protocol_metadata_t v12 = nw_connection_copy_protocol_metadata(v10, v11);

        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = (void *)sec_protocol_metadata_copy_sec_trust();
          uint64_t v15 = *(void *)(a1 + 32);
          if (v15) {
            objc_storeStrong((id *)(v15 + 80), v14);
          }
        }
        id v16 = *(void **)(a1 + 32);
        if (v16) {
          id v16 = (void *)v16[7];
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)(a1 + 32);
        if (v18)
        {
          v19 = *(void **)(v18 + 56);
          *(void *)(v18 + 56) = 0;

          uint64_t v20 = *(void *)(a1 + 32);
          if (v20) {
            *(unsigned char *)(v20 + 8) = 1;
          }
        }
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        unint64_t v21 = v17;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v54;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v54 != v23) {
                objc_enumerationMutation(v21);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v53 + 1) + 8 * v24++) + 16))();
            }
            while (v22 != v24);
            uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v58 count:16];
          }
          while (v22);
        }
      }
      goto LABEL_54;
    case 4:
      v25 = *(void **)(a1 + 32);
      if (v25) {
        v25 = (void *)v25[7];
      }
      v26 = v25;
      uint64_t v27 = *(void *)(a1 + 32);
      if (v27
        && (v28 = *(void **)(v27 + 56), *(void *)(v27 + 56) = 0,
                                        v28,
                                        (uint64_t v29 = *(void *)(a1 + 32)) != 0))
      {
        BOOL v30 = *(unsigned char *)(v29 + 8) != 0;
        *(unsigned char *)(v29 + 8) = 1;
        if (!v5) {
          goto LABEL_37;
        }
      }
      else
      {
        BOOL v30 = 0;
        if (!v5) {
          goto LABEL_37;
        }
      }
      uint64_t v31 = *(void *)(a1 + 32);
      if (!v31 || !*(void *)(v31 + 72))
      {
        v32 = -[NWURLLoaderTCP errorForNWError:]((id *)v31, v5);
        uint64_t v33 = *(void *)(a1 + 32);
        if (v33) {
          objc_storeStrong((id *)(v33 + 72), v32);
        }
      }
LABEL_37:
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v34 = v26;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v57 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v50;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v50 != v36) {
              objc_enumerationMutation(v34);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v49 + 1) + 8 * v37) + 16))(*(void *)(*((void *)&v49 + 1) + 8 * v37));
            ++v37;
          }
          while (v35 != v37);
          uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v57 count:16];
        }
        while (v35);
      }

      if (v30) {
        goto LABEL_50;
      }
      uint64_t v38 = *(void *)(a1 + 32);
      if (!v38) {
        goto LABEL_63;
      }
      if (!*(unsigned char *)(v38 + 9))
      {
        *(unsigned char *)(v38 + 9) = 1;
        uint64_t v39 = *(void *)(a1 + 32);
        if (v39) {
          v40 = *(NSObject **)(v39 + 64);
        }
        else {
LABEL_63:
        }
          v40 = 0;
        nw_connection_cancel(v40);
      }
LABEL_50:

LABEL_54:
      return;
    default:
      goto LABEL_54;
  }
}

uint64_t __24__NWURLLoaderTCP_start___block_invoke_4(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(result + 32);
    if (v2) {
      id v3 = *(void **)(v2 + 40);
    }
    else {
      id v3 = 0;
    }
    return [v3 loaderBetterPathAvailable];
  }
  return result;
}

void __24__NWURLLoaderTCP_start___block_invoke_5(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (!v3 || !*(void *)(v3 + 72))
    {
      unsigned int v4 = [NWURLError alloc];
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        uint64_t v6 = (void *)v5[5];
      }
      else {
        uint64_t v6 = 0;
      }
      id v7 = v6;
      id v8 = [v7 loaderTask];
      uint64_t v9 = v5;
      id v10 = v8;
      if (v4)
      {
        uint64_t v11 = *MEMORY[0x1E4F289A0];
        v16.receiver = v4;
        v16.super_class = (Class)NWURLError;
        nw_protocol_metadata_t v12 = (NWURLError *)objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v11, -1005, 0);
        unsigned int v4 = v12;
        if (v12) {
          [(NWURLError *)v12 fillErrorForLoader:v9 andTask:v10];
        }
      }

      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        objc_storeStrong((id *)(v13 + 72), v4);
      }

      uint64_t v3 = *(void *)(a1 + 32);
      if (!v3) {
        goto LABEL_19;
      }
    }
    if (*(unsigned char *)(v3 + 9)) {
      return;
    }
    *(unsigned char *)(v3 + 9) = 1;
    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      uint64_t v15 = *(NSObject **)(v14 + 64);
    }
    else {
LABEL_19:
    }
      uint64_t v15 = 0;
    nw_connection_cancel(v15);
  }
}

- (void)configureTLS:(uint64_t)a1
{
  if (a1)
  {
    verify_block[0] = MEMORY[0x1E4F143A8];
    verify_block[1] = 3221225472;
    verify_block[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke;
    verify_block[3] = &unk_1E5248A48;
    verify_block[4] = a1;
    uint64_t v3 = *(NSObject **)(a1 + 48);
    unsigned int v4 = a2;
    sec_protocol_options_set_verify_block(v4, verify_block, v3);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke_2;
    v5[3] = &unk_1E5248A98;
    v5[4] = a1;
    sec_protocol_options_set_challenge_block(v4, v5, *(dispatch_queue_t *)(a1 + 48));
    -[NWURLSessionTaskConfiguration configureSecProtocolOptions:](*(void *)(a1 + 32), v4);
  }
}

uint64_t __31__NWURLLoaderTCP_configureTLS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(void **)(v4 + 40);
  }
  else {
    id v5 = 0;
  }
  return [v5 loaderDidReceiveServerTrustChallenge:a3 secProtocolMetadata:a2 completionHandler:a4];
}

void __31__NWURLLoaderTCP_configureTLS___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_alloc_init(v5);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __31__NWURLLoaderTCP_configureTLS___block_invoke_3;
  handler[3] = &unk_1E5248A70;
  id v9 = v8;
  id v14 = v9;
  sec_protocol_metadata_access_distinguished_names(v7, handler);

  id v10 = *(void **)(a1 + 32);
  if (v10) {
    id v10 = (void *)v10[5];
  }
  uint64_t v11 = v10;
  nw_protocol_metadata_t v12 = (void *)[v9 copy];
  [v11 loaderDidReceiveClientCertificateChallenge:v12 completionHandler:v6];
}

uint64_t __31__NWURLLoaderTCP_configureTLS___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __24__NWURLLoaderTCP_start___block_invoke_2(int a1, nw_protocol_options_t options)
{
}

@end