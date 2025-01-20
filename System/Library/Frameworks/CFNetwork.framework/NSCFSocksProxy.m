@interface NSCFSocksProxy
@end

@implementation NSCFSocksProxy

uint64_t __58___NSCFSocksProxy_outboundConnectionReceivedData_handler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 40);
  if (result && (*(unsigned char *)(result + 8) & 1) != 0 && !*(void *)(result + 32))
  {
    return [(id)result cancel];
  }
  return result;
}

void __31___NSCFSocksProxy_readOutbound__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __31___NSCFSocksProxy_readOutbound__block_invoke_2;
    v8[3] = &unk_1E5256400;
    v8[4] = v6;
    [v7 write:v5 handler:v8];
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) cleanup];
  }
}

uint64_t __31___NSCFSocksProxy_readOutbound__block_invoke_2(uint64_t a1)
{
  return -[_NSCFSocksProxy readOutbound](*(void *)(a1 + 32));
}

void __30___NSCFSocksProxy_readInbound__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __30___NSCFSocksProxy_readInbound__block_invoke_2;
    v8[3] = &unk_1E5256400;
    v8[4] = v6;
    [v7 write:v5 handler:v8];
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) cleanup];
  }
}

uint64_t __30___NSCFSocksProxy_readInbound__block_invoke_2(uint64_t a1)
{
  return -[_NSCFSocksProxy readInbound](*(void *)(a1 + 32));
}

void __32___NSCFSocksProxy_handshakeRead__block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    v8 = v7;
    v9 = *(void **)(*(void *)(a1 + 32) + 32);
    if (!v9)
    {
      id v10 = v7;
      int v11 = *(unsigned __int8 *)[v10 bytes];
      self;
      if (v11 == 5) {
        v12 = objc_alloc_init(__CFN_SocksHandshakev5);
      }
      else {
        v12 = 0;
      }
      uint64_t v13 = *(void *)(a1 + 32);
      v14 = *(void **)(v13 + 32);
      *(void *)(v13 + 32) = v12;

      v16 = *(void **)(a1 + 32);
      if (!v16[4])
      {
        [v16 cleanup];

        goto LABEL_25;
      }
      v18 = objc_msgSend(objc_getProperty(v16, v15, 56, 1), "objectForKeyedSubscript:", @"NSServerConfigurationSOCKS5ServerCredentials");
      v19 = *(void **)(*(void *)(a1 + 32) + 32);
      if (v19) {
        objc_setProperty_atomic(v19, v17, v18, 24);
      }

      v9 = *(void **)(*(void *)(a1 + 32) + 32);
    }
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__7431;
    v49 = __Block_byref_object_dispose__7432;
    id v50 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    int v44 = 0;
    id v20 = v8;
    uint64_t v21 = [v20 bytes];
    uint64_t v22 = [v20 length];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __32___NSCFSocksProxy_handshakeRead__block_invoke_4;
    v40[3] = &unk_1E5254CB8;
    v40[4] = &v45;
    v40[5] = &v41;
    char v23 = [v9 parse:v21 len:v22 completion:v40];
    uint64_t v24 = v46[5];
    if (v24) {
      [*(id *)(*(void *)(a1 + 32) + 40) write:v24 handler:&__block_literal_global_7433];
    }
    if (*((_DWORD *)v42 + 6))
    {
      [*(id *)(a1 + 32) cleanup];
    }
    else if (v23)
    {
      v26 = [NSProxyConnectionStreamTask alloc];
      id Property = *(id *)(*(void *)(a1 + 32) + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v25, 16, 1);
      }
      id v29 = Property;
      v30 = *(void **)(a1 + 32);
      uint64_t v31 = v30[4];
      if (v31) {
        uint64_t v32 = *(unsigned __int16 *)(v31 + 10);
      }
      else {
        uint64_t v32 = 0;
      }
      uint64_t v33 = v30[1];
      id v34 = objc_getProperty(v30, v28, 56, 1);
      uint64_t v35 = [(NSProxyConnectionStreamTask *)v26 initWithHost:v29 port:v32 queue:v33 configuration:v34];
      uint64_t v36 = *(void *)(a1 + 32);
      v37 = *(void **)(v36 + 48);
      *(void *)(v36 + 48) = v35;

      v38 = *(void **)(a1 + 32);
      uint64_t v39 = v38[6];
      if (v39) {
        objc_storeWeak((id *)(v39 + 24), v38);
      }
    }
    else
    {
      -[_NSCFSocksProxy handshakeRead](*(void *)(a1 + 32));
    }
    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(&v45, 8);
  }
  else if (a3)
  {
    [*(id *)(a1 + 32) cleanup];
  }
LABEL_25:
}

void __32___NSCFSocksProxy_handshakeRead__block_invoke_4(uint64_t a1, void *a2, int a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

@end