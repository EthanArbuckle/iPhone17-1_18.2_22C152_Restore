@interface FMFMapSession
+ (id)newConnection;
+ (id)sharedInstance;
- (FMFMapCache)mapCache;
- (NSXPCConnection)connection;
- (void)gridImageForScreenRatio:(double)a3 andCompletion:(id)a4;
- (void)gridImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6;
- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 screenRatio:(double)a6 andCompletion:(id)a7;
- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9;
- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 screenRatio:(double)a7 andCompletion:(id)a8;
- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 cache:(BOOL)a9 andCompletion:(id)a10;
- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9;
- (void)mapImageForLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 cache:(BOOL)a7 andCompletion:(id)a8;
- (void)mapImageForRequest:(id)a3 andCompletion:(id)a4;
- (void)noLocationImageForScreenRatio:(double)a3 andCompletion:(id)a4;
- (void)noLocationImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6;
- (void)setConnection:(id)a3;
- (void)setMapCache:(id)a3;
@end

@implementation FMFMapSession

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__FMFMapSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_dispatch_predicate != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate, block);
  }
  v2 = (void *)sharedInstance__instance;

  return v2;
}

void __31__FMFMapSession_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

  id v2 = (id)objc_opt_new();
  [(id)sharedInstance__instance setMapCache:v2];
}

+ (id)newConnection
{
  id v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BEF4278];
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.icloud.FMF.FMFMapXPCService"];
  [v3 setRemoteObjectInterface:v2];
  [v3 resume];

  return v3;
}

- (void)gridImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6
{
  BOOL v6 = a5;
  v10 = (void (**)(id, void *, void))a6;
  v11 = self;
  v12 = v11;
  if (v6
    && ([(FMFMapSession *)v11 mapCache],
        v13 = objc_claimAutoreleasedReturnValue(),
        [v13 cachedGridImageForWidth:a3 andHeight:a4],
        v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    v10[2](v10, v14, 0);
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    id v15 = +[FMFMapSession newConnection];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke;
    v23[3] = &unk_263FE7178;
    v23[4] = &v24;
    v16 = [v15 remoteObjectProxyWithErrorHandler:v23];
    if (v10 && v25[5])
    {
      ((void (*)(void (**)(id, void *, void), void))v10[2])(v10, 0);
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke_2;
      v17[3] = &unk_263FE71A0;
      BOOL v22 = v6;
      v18 = v12;
      double v20 = a3;
      double v21 = a4;
      v19 = v10;
      [v16 gridImageForWidth:v17 height:a3 andCompletion:a4];
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v6 = [*(id *)(a1 + 32) mapCache];
    [v6 cacheGridImage:v7 forWidth:*(double *)(a1 + 48) andHeight:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)mapImageForLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 cache:(BOOL)a7 andCompletion:(id)a8
{
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9
{
  BOOL v9 = a8;
  BOOL v13 = a4;
  id v16 = a9;
  id v17 = a3;
  v18 = [[FMFMapImageRequest alloc] initWithLocation:v17 isShifted:v13 radius:v9 width:a5 height:a6 andCachingEnabled:a7];

  [(FMFMapSession *)self mapImageForRequest:v18 andCompletion:v16];
}

- (void)noLocationImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6
{
  BOOL v6 = a5;
  v10 = (void (**)(id, void *, void))a6;
  v11 = self;
  v12 = v11;
  if (v6
    && ([(FMFMapSession *)v11 mapCache],
        BOOL v13 = objc_claimAutoreleasedReturnValue(),
        [v13 cachedNoLocationImageForWidth:a3 andHeight:a4],
        v14 = objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    v10[2](v10, v14, 0);
  }
  else
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    id v15 = +[FMFMapSession newConnection];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke;
    v23[3] = &unk_263FE7178;
    v23[4] = &v24;
    id v16 = [v15 remoteObjectProxyWithErrorHandler:v23];
    if (v10 && v25[5])
    {
      ((void (*)(void (**)(id, void *, void), void))v10[2])(v10, 0);
    }
    else
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke_2;
      v17[3] = &unk_263FE71A0;
      BOOL v22 = v6;
      v18 = v12;
      double v20 = a3;
      double v21 = a4;
      v19 = v10;
      [v16 noLocationImageForWidth:v17 height:a3 andCompletion:a4];
    }
    _Block_object_dispose(&v24, 8);
  }
}

void __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 64))
  {
    BOOL v6 = [*(id *)(a1 + 32) mapCache];
    [v6 cacheNoLocationImage:v7 forWidth:*(double *)(a1 + 48) andHeight:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9
{
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 cache:(BOOL)a9 andCompletion:(id)a10
{
  BOOL v10 = a9;
  BOOL v15 = a4;
  id v18 = a10;
  id v19 = a3;
  double v20 = [[FMFMapImageRequest alloc] initWithLocation:v19 isShifted:v15 altitude:v10 pitch:a5 width:a6 height:a7 andCachingEnabled:a8];

  [(FMFMapSession *)self mapImageForRequest:v20 andCompletion:v18];
}

- (void)mapImageForRequest:(id)a3 andCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  v8 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[FMFMapSession mapImageForRequest:andCompletion:]();
  }

  BOOL v9 = self;
  if (![v6 cachingEnabled]
    || ([(FMFMapSession *)v9 mapCache],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        [v10 cachedMapImageForRequest:v6],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    id v29 = 0;
    id v13 = +[FMFMapSession newConnection];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke;
    v23[3] = &unk_263FE7178;
    v23[4] = &v24;
    v14 = [v13 remoteObjectProxyWithErrorHandler:v23];
    if (v7 && v25[5])
    {
      v7[2](v7, 0);
    }
    else
    {
      BOOL v15 = [(FMFMapSession *)v9 mapCache];
      int v16 = [v15 pendingMapImageForRequest:v6];

      id v17 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[FMFMapSession mapImageForRequest:andCompletion:]();
      }

      if (v16 && [v6 priority] < 1)
      {
        if (!v7) {
          goto LABEL_17;
        }
        id v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"FMFMapXPCService" code:206 userInfo:0];
        ((void (*)(void (**)(id, void), void, void *))v7[2])(v7, 0, v18);
      }
      else
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66;
        v19[3] = &unk_263FE71C8;
        id v20 = v6;
        double v21 = v9;
        BOOL v22 = v7;
        [v14 mapImageForRequest:v20 andCompletion:v19];

        id v18 = v20;
      }
    }
LABEL_17:

    _Block_object_dispose(&v24, 8);
    goto LABEL_18;
  }
  v12 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[FMFMapSession mapImageForRequest:andCompletion:]();
  }

  ((void (*)(void (**)(id, void), void *, void))v7[2])(v7, v11, 0);
LABEL_18:
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) cachingEnabled])
  {
    id v7 = [*(id *)(a1 + 40) mapCache];
    [v7 cacheMapImage:v5 forRequest:*(void *)(a1 + 32)];
  }
  v8 = LogCategory_FMFMapXPC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9) {
      __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_2((uint64_t)v6, v8);
    }
  }
  else if (v9)
  {
    __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)gridImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  BOOL v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v6 = +[FMFMapSession newConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke;
  v10[3] = &unk_263FE7178;
  v10[4] = &v11;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v10];
  if (v5 && v12[5])
  {
    v5[2](v5, 0);
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke_2;
    v8[3] = &unk_263FE71F0;
    BOOL v9 = v5;
    [v7 gridImageForScreenRatio:v8 andCompletion:a3];
  }
  _Block_object_dispose(&v11, 8);
}

void __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

uint64_t __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)noLocationImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  BOOL v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id v6 = +[FMFMapSession newConnection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke;
  v10[3] = &unk_263FE7178;
  v10[4] = &v11;
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v10];
  if (v5 && v12[5])
  {
    v5[2](v5, 0);
  }
  else
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke_2;
    v8[3] = &unk_263FE71F0;
    BOOL v9 = v5;
    [v7 noLocationImageForScreenRatio:v8 andCompletion:a3];
  }
  _Block_object_dispose(&v11, 8);
}

void __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

uint64_t __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 screenRatio:(double)a6 andCompletion:(id)a7
{
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 screenRatio:(double)a7 andCompletion:(id)a8
{
  BOOL v12 = a4;
  id v13 = a3;
  v14 = (void (**)(id, void))a8;
  uint64_t v20 = 0;
  double v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  id v15 = +[FMFMapSession newConnection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke;
  v19[3] = &unk_263FE7178;
  void v19[4] = &v20;
  id v16 = [v15 remoteObjectProxyWithErrorHandler:v19];
  if (v14 && v21[5])
  {
    v14[2](v14, 0);
  }
  else
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke_2;
    v17[3] = &unk_263FE71F0;
    id v18 = v14;
    [v16 mapImageForLocation:v13 isShifted:v12 altitude:v17 pitch:a5 screenRatio:a6 andCompletion:a7];
  }
  _Block_object_dispose(&v20, 8);
}

void __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

uint64_t __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (FMFMapCache)mapCache
{
  return self->_mapCache;
}

- (void)setMapCache:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_mapCache, 0);
}

- (void)mapImageForRequest:andCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20AD87000, v0, v1, "requesting new map from XPC service", v2, v3, v4, v5, v6);
}

- (void)mapImageForRequest:andCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20AD87000, v0, v1, "returning cached map", v2, v3, v4, v5, v6);
}

- (void)mapImageForRequest:andCompletion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20AD87000, v0, v1, "mapImageForRequest:", v2, v3, v4, v5, v6);
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_20AD87000, v0, v1, "returning new map from XPC service", v2, v3, v4, v5, v6);
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20AD87000, a2, OS_LOG_TYPE_DEBUG, "Error generating maps %@", (uint8_t *)&v2, 0xCu);
}

@end