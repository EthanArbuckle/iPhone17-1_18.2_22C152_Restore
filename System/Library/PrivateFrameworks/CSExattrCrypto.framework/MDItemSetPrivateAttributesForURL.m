@interface MDItemSetPrivateAttributesForURL
@end

@implementation MDItemSetPrivateAttributesForURL

void ___MDItemSetPrivateAttributesForURL_block_invoke()
{
  CFUUIDRef v0 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0xFEu, 0x65u, 0x61u, 0x5Bu, 0xFu, 0xF3u, 0x4Eu, 0x3Du, 0xBBu, 0x10u, 0xA7u, 0xACu, 0x81u, 0x62u, 0x22u, 0x6Eu);
  CFUUIDBytes v3 = CFUUIDGetUUIDBytes(v0);
  uint64_t v1 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:&v3];
  v2 = (void *)_MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID;
  _MDItemSetPrivateAttributesForURL_sMDPrivateMDAttributesXattrNSUUID = v1;
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a6;
  v13 = copyConnection();
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = ___MDItemSetPrivateAttributesForURL_block_invoke_3;
  v20[3] = &unk_26525E538;
  id v14 = v12;
  id v22 = v14;
  id v15 = v13;
  id v21 = v15;
  v16 = [v15 remoteObjectProxyWithErrorHandler:v20];
  if (v16)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = ___MDItemSetPrivateAttributesForURL_block_invoke_5;
    v17[3] = &unk_26525E560;
    id v19 = v14;
    id v18 = v15;
    [v16 computeUpdatedCryptoData:v10 newParams:v11 isPrivateMDAttributes:a4 doMergeArrayValues:a5 replyBlock:v17];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1();
    }
    (*((void (**)(id, void, void, void))v14 + 2))(v14, 0, 0, 0);
    releaseConnection(v15);
  }
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ___MDItemSetPrivateAttributesForURL_block_invoke_3_cold_1((uint64_t)v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    releaseConnection(*(void **)(a1 + 32));
  }
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  releaseConnection(v2);
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_2_cold_1()
{
  *(_WORD *)CFUUIDRef v0 = 0;
  _os_log_error_impl(&dword_24954B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to connect to remote service", v0, 2u);
}

void ___MDItemSetPrivateAttributesForURL_block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_24954B000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Error from remote service: %@", (uint8_t *)&v1, 0xCu);
}

@end