@interface MPCAssistantEncodings
- (id)decodeURLData:(id)a3;
- (id)encodeURLData:(id)a3;
- (void)decodeHashedRouteUIDs:(id)a3 completion:(id)a4;
- (void)encodeHashedRouteUIDs:(id)a3 completion:(id)a4;
@end

@implementation MPCAssistantEncodings

- (void)decodeHashedRouteUIDs:(id)a3 completion:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v21 = a4;
  v5 = (void *)[v20 mutableCopy];
  if ([v5 containsObject:@"LOCAL_DEVICE"])
  {
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "Unexpected LOCAL_DEVICE identifier.", buf, 2u);
    }

    [v5 removeObject:@"LOCAL_DEVICE"];
  }
  *(void *)buf = 0;
  v40 = buf;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v23 = objc_alloc_init((Class)getAFSecurityConnectionClass());
  v8 = dispatch_group_create();
  v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v10 = dispatch_queue_create("DecodeSerialQueue", v9);

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v35 + 1) + 8 * v13);
        v15 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0];
        dispatch_group_enter(v8);
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke;
        v28[3] = &unk_2643C55D0;
        id v16 = v23;
        id v29 = v16;
        v30 = v10;
        v34 = buf;
        id v31 = v7;
        uint64_t v32 = v14;
        v33 = v8;
        [v16 processData:v15 usingProcedure:2 completion:v28];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v11);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_13;
  block[3] = &unk_2643C5620;
  id v25 = obj;
  id v26 = v7;
  id v27 = v21;
  id v17 = v21;
  id v18 = v7;
  id v19 = obj;
  dispatch_group_notify(v8, v10, block);

  _Block_object_dispose(buf, 8);
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "Error decoding route UID: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v9 = *(NSObject **)(a1 + 40);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_2;
    v14[3] = &unk_2643C66B0;
    dispatch_queue_t v10 = v5;
    uint64_t v11 = *(void *)(a1 + 72);
    v15 = v10;
    uint64_t v18 = v11;
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v16 = v12;
    uint64_t v17 = v13;
    dispatch_sync(v9, v14);

    v8 = v15;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_13(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = (void *)[*(id *)(a1 + 32) mutableCopy];
  v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21BB87000, v3, OS_LOG_TYPE_INFO, "MPCAssistantEncodings (decode): route UID decoding table", buf, 2u);
  }

  v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_14;
  v7[3] = &unk_2643C55F8;
  id v5 = v2;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  if ([v5 count])
  {
    id v6 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v5;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_ERROR, "MPCAssistantEncodings (decode): could not decrypt: %{public}@", buf, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_INFO, "MPCAssistantEncodings (decode): hashed %{public}@ = decoded %{public}@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) removeObject:v6];
}

void __58__MPCAssistantEncodings_decodeHashedRouteUIDs_completion___block_invoke_2(uint64_t a1)
{
  v2 = (void *)[[NSString alloc] initWithData:*(void *)(a1 + 32) encoding:4];
  if (v2)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    v3 = v2;
    [*(id *)(a1 + 40) setObject:*(void *)(a1 + 48) forKeyedSubscript:v2];
    v2 = v3;
  }
}

- (void)encodeHashedRouteUIDs:(id)a3 completion:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = objc_alloc_init((Class)getAFSecurityConnectionClass());
  id v7 = dispatch_group_create();
  int v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v9 = dispatch_queue_create("EncodeSerialQueue", v8);

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v15, "length", v20))
        {
          id v16 = [v15 dataUsingEncoding:4];
          dispatch_group_enter(v7);
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke;
          v25[3] = &unk_2643C5580;
          id v17 = v21;
          id v26 = v17;
          id v27 = v9;
          id v28 = v6;
          id v29 = v7;
          [v17 processData:v16 usingProcedure:1 completion:v25];
        }
        else
        {
          [v6 addObject:&stru_26CBCA930];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_6;
  block[3] = &unk_2643C55A8;
  id v23 = v6;
  id v24 = v20;
  id v18 = v6;
  id v19 = v20;
  dispatch_group_notify(v7, v9, block);
}

void __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  if (v6)
  {
    int v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Assistant");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_21BB87000, v8, OS_LOG_TYPE_ERROR, "Error encoding route UID: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    dispatch_queue_t v9 = *(NSObject **)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_2;
    v10[3] = &unk_2643C5EE8;
    uint64_t v11 = v5;
    id v12 = *(id *)(a1 + 48);
    dispatch_sync(v9, v10);

    int v8 = v11;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __58__MPCAssistantEncodings_encodeHashedRouteUIDs_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) base64EncodedStringWithOptions:0];
  [*(id *)(a1 + 40) addObject:v2];
}

- (id)decodeURLData:(id)a3
{
  v3 = [a3 stringByRemovingPercentEncoding];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];

  return v4;
}

- (id)encodeURLData:(id)a3
{
  v3 = [a3 base64EncodedStringWithOptions:0];
  v4 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  id v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  return v5;
}

@end