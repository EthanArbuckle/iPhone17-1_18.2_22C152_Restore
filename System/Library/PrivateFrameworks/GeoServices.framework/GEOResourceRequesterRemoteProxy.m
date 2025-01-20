@interface GEOResourceRequesterRemoteProxy
- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10;
@end

@implementation GEOResourceRequesterRemoteProxy

void __121__GEOResourceRequesterRemoteProxy_fetchResources_force_unpack_manifestConfiguration_auditToken_signpostID_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v14 names];
      uint64_t v7 = [v6 count];
      uint64_t v8 = [*(id *)(a1 + 32) count];

      if (v7 == v8)
      {
        uint64_t v9 = *(void *)(a1 + 40);
        id v5 = [v14 names];
        v10 = [v14 paths];
        v11 = [v14 error];
        (*(void (**)(uint64_t, id, void *, void *))(v9 + 16))(v9, v5, v10, v11);

        goto LABEL_7;
      }
    }
    v12 = (void *)MEMORY[0x1E4F28C58];
    v13 = [NSString stringWithFormat:@"Unexpected response: %@", v14];
    id v5 = [v12 GEOErrorWithCode:-11 reason:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
}

- (void)fetchResources:(id)a3 force:(BOOL)a4 unpack:(BOOL)a5 manifestConfiguration:(id)a6 auditToken:(id)a7 signpostID:(unint64_t)a8 queue:(id)a9 handler:(id)a10
{
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v14 = a3;
  id v15 = a10;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  v19 = [[GEOResourceFetchRequest alloc] initWithTraits:0 auditToken:v17 throttleToken:0];

  [(GEOResourceFetchRequest *)v19 setResources:v14];
  [(GEOResourceFetchRequest *)v19 setForce:v13];
  [(GEOResourceFetchRequest *)v19 setUnpack:v12];
  [(GEOResourceFetchRequest *)v19 setManifestConfiguration:v18];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __121__GEOResourceRequesterRemoteProxy_fetchResources_force_unpack_manifestConfiguration_auditToken_signpostID_queue_handler___block_invoke;
  v22[3] = &unk_1E53F6478;
  id v23 = v14;
  id v24 = v15;
  id v20 = v15;
  id v21 = v14;
  [(GEOXPCRequest *)v19 send:0 withReply:v16 handler:v22];
}

@end