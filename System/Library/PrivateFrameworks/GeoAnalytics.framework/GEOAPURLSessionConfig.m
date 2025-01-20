@interface GEOAPURLSessionConfig
+ (id)allSessionConfigTypes;
+ (id)configForURLSessionConfigType:(int)a3;
- (BOOL)discretionary;
- (BOOL)requirePower;
- (BOOL)requireWifi;
- (int)noCellAuthType;
- (int)type;
- (void)setDiscretionary:(BOOL)a3;
- (void)setNoCellAuthType:(int)a3;
- (void)setRequirePower:(BOOL)a3;
- (void)setRequireWifi:(BOOL)a3;
- (void)setType:(int)a3;
@end

@implementation GEOAPURLSessionConfig

+ (id)allSessionConfigTypes
{
  return &unk_270162DA0;
}

+ (id)configForURLSessionConfigType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  id v19 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__GEOAPURLSessionConfig_configForURLSessionConfigType___block_invoke;
  block[3] = &unk_265345620;
  block[4] = &v14;
  if (qword_26B201BE8 != -1) {
    dispatch_once(&qword_26B201BE8, block);
  }
  v4 = (void *)_MergedGlobals_16;
  v5 = [NSNumber numberWithInt:v3];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];
  v7 = (void *)v15[5];
  v15[5] = v6;

  v8 = (void *)v15[5];
  if (!v8)
  {
    uint64_t v9 = [(id)_MergedGlobals_16 objectForKeyedSubscript:&unk_270162B30];
    v10 = (void *)v15[5];
    v15[5] = v9;

    v8 = (void *)v15[5];
  }
  id v11 = v8;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __55__GEOAPURLSessionConfig_configForURLSessionConfigType___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = (uint64_t)v2;

  v4 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:0];
  v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v8 = (void *)_MergedGlobals_16;
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "type"));
  [v8 setObject:v7 forKeyedSubscript:v9];

  v10 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:2];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:1];
  v13 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v14 = (void *)_MergedGlobals_16;
  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v13, "type"));
  [v14 setObject:v13 forKeyedSubscript:v15];

  uint64_t v16 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:3];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:1];
  id v19 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v20 = (void *)_MergedGlobals_16;
  v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v19, "type"));
  [v20 setObject:v19 forKeyedSubscript:v21];

  v22 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:1];
  v25 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v26 = (void *)_MergedGlobals_16;
  v27 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v25, "type"));
  [v26 setObject:v25 forKeyedSubscript:v27];

  v28 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 8);
  v30 = *(void **)(v29 + 40);
  *(void *)(v29 + 40) = v28;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:5];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:1];
  v31 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v32 = (void *)_MergedGlobals_16;
  v33 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v31, "type"));
  [v32 setObject:v31 forKeyedSubscript:v33];

  v34 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 8);
  v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = v34;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setNoCellAuthType:6];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequireWifi:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setRequirePower:0];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDiscretionary:0];
  v37 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v38 = (void *)_MergedGlobals_16;
  v39 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v37, "type"));
  [v38 setObject:v37 forKeyedSubscript:v39];

  v40 = objc_alloc_init(GEOAPURLSessionConfig);
  uint64_t v41 = *(void *)(*(void *)(a1 + 32) + 8);
  v42 = *(void **)(v41 + 40);
  *(void *)(v41 + 40) = v40;

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setType:0];
  v43 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v44 = (void *)_MergedGlobals_16;
  objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v43, "type"));
  id v45 = (id)objc_claimAutoreleasedReturnValue();
  [v44 setObject:v43 forKeyedSubscript:v45];
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)requireWifi
{
  return self->_requireWifi;
}

- (void)setRequireWifi:(BOOL)a3
{
  self->_requireWifi = a3;
}

- (BOOL)requirePower
{
  return self->_requirePower;
}

- (void)setRequirePower:(BOOL)a3
{
  self->_requirePower = a3;
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (int)noCellAuthType
{
  return self->_noCellAuthType;
}

- (void)setNoCellAuthType:(int)a3
{
  self->_noCellAuthType = a3;
}

@end