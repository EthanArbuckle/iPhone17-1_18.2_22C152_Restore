@interface CIIF_EspressoWrapper
+ (id)cache;
+ (id)cachedEspressoWrapper:(id)a3;
+ (void)clearCache;
- (BOOL)buildWait;
- (BOOL)hasBlob:(const char *)a3;
- (BOOL)loadWait;
- (CIIF_EspressoWrapper)initWithPath:(id)a3;
- (NSString)path;
- (id)CIImageProcessorDigestObject;
- (int)bind:(const char *)a3 buffer:(__CVBuffer *)a4;
- (int)execute;
- (int)executeAsync:(id)a3;
- (int)planIdx;
- (void)buildAsync;
- (void)ctx;
- (void)dealloc;
- (void)loadAsync;
- (void)plan;
- (void)setCtx:(void *)a3;
- (void)setPlan:(void *)a3;
- (void)setPlanIdx:(int)a3;
@end

@implementation CIIF_EspressoWrapper

+ (id)cache
{
  if (qword_18E10 != -1) {
    dispatch_once(&qword_18E10, &stru_145C0);
  }
  v2 = (void *)qword_18E08;
  return v2;
}

- (CIIF_EspressoWrapper)initWithPath:(id)a3
{
  v4 = (NSString *)a3;
  v11.receiver = self;
  v11.super_class = (Class)CIIF_EspressoWrapper;
  v5 = [(CIIF_EspressoWrapper *)&v11 init];
  path = v5->_path;
  v5->_path = v4;
  v7 = v4;

  dispatch_queue_t v8 = dispatch_queue_create("CIIF_EspressoWrapper", 0);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v8;

  return v5;
}

+ (id)cachedEspressoWrapper:(id)a3
{
  id v4 = a3;
  v5 = [a1 cache];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    id v7 = [objc_alloc((Class)a1) initWithPath:v4];
    if (!v7) {
      sub_C4CC();
    }
    v6 = v7;
    dispatch_queue_t v8 = [a1 cache];
    [v8 setObject:v6 forKey:v4];
  }
  return v6;
}

+ (void)clearCache
{
  id v2 = [a1 cache];
  [v2 removeAllObjects];
}

- (void)dealloc
{
  plan = self->_plan;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v4 = (void (*)(void *))off_18E18;
  v18 = off_18E18;
  if (!off_18E18)
  {
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_BE70;
    v13 = &unk_14678;
    v14 = &v15;
    v5 = (void *)sub_BEC0();
    v16[3] = (uint64_t)dlsym(v5, "espresso_plan_destroy");
    off_18E18 = *(_UNKNOWN **)(v14[1] + 24);
    id v4 = (void (*)(void *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v4) {
    sub_C4F8();
  }
  v4(plan);
  ctx = self->_ctx;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v7 = (void (*)(void *))off_18E28;
  v18 = off_18E28;
  if (!off_18E28)
  {
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    v12 = sub_C02C;
    v13 = &unk_14678;
    v14 = &v15;
    dispatch_queue_t v8 = (void *)sub_BEC0();
    v16[3] = (uint64_t)dlsym(v8, "espresso_context_destroy");
    off_18E28 = *(_UNKNOWN **)(v14[1] + 24);
    id v7 = (void (*)(void *))v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v7) {
    sub_C570();
  }
  v7(ctx);
  self->_ctx = 0;
  self->_plan = 0;
  v9.receiver = self;
  v9.super_class = (Class)CIIF_EspressoWrapper;
  [(CIIF_EspressoWrapper *)&v9 dealloc];
}

- (int)planIdx
{
  return self->_planIdx;
}

- (void)setPlanIdx:(int)a3
{
  self->_planIdx = a3;
}

- (void)plan
{
  return self->_plan;
}

- (void)setPlan:(void *)a3
{
  self->_plan = a3;
}

- (void)ctx
{
  return self->_ctx;
}

- (void)setCtx:(void *)a3
{
  self->_ctx = a3;
}

- (id)CIImageProcessorDigestObject
{
  return self->_path;
}

- (void)loadAsync
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B0C0;
  block[3] = &unk_145E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)loadWait
{
  self->_loadState = 89;
  return 1;
}

- (void)buildAsync
{
  [(CIIF_EspressoWrapper *)self loadAsync];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B52C;
  block[3] = &unk_145E8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)buildWait
{
  self->_buildState = 89;
  return 1;
}

- (int)bind:(const char *)a3 buffer:(__CVBuffer *)a4
{
  if ([(CIIF_EspressoWrapper *)self buildWait])
  {
    id v7 = [(CIIF_EspressoWrapper *)self plan];
    unsigned int v8 = [(CIIF_EspressoWrapper *)self planIdx];
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2020000000;
    objc_super v9 = (uint64_t (*)(void *, void, const char *, __CVBuffer *))off_18E50;
    v19 = off_18E50;
    if (!off_18E50)
    {
      v10 = (void *)sub_BEC0();
      v17[3] = (uint64_t)dlsym(v10, "espresso_network_bind_direct_cvpixelbuffer");
      off_18E50 = (_UNKNOWN *)v17[3];
      objc_super v9 = (uint64_t (*)(void *, void, const char *, __CVBuffer *))v17[3];
    }
    _Block_object_dispose(&v16, 8);
    if (!v9) {
      sub_C7C8();
    }
    uint64_t v11 = v9(v7, v8, a3, a4);
    if (v11)
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000;
      v12 = (uint64_t (*)(uint64_t))off_18E58;
      v19 = off_18E58;
      if (!off_18E58)
      {
        v13 = (void *)sub_BEC0();
        v17[3] = (uint64_t)dlsym(v13, "espresso_get_status_string");
        off_18E58 = (_UNKNOWN *)v17[3];
        v12 = (uint64_t (*)(uint64_t))v17[3];
      }
      _Block_object_dispose(&v16, 8);
      if (!v12) {
        sub_C840();
      }
      v14 = (const char *)v12(v11);
      printf("bind:buffer: error=%s\n", v14);
    }
  }
  else
  {
    LODWORD(v11) = -1;
  }
  return v11;
}

- (BOOL)hasBlob:(const char *)a3
{
  BOOL v5 = [(CIIF_EspressoWrapper *)self loadWait];
  if (v5)
  {
    v6 = [(CIIF_EspressoWrapper *)self plan];
    unsigned int v7 = [(CIIF_EspressoWrapper *)self planIdx];
    v11[0] = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    unsigned int v8 = off_18E60;
    uint64_t v16 = off_18E60;
    if (!off_18E60)
    {
      v11[1] = _NSConcreteStackBlock;
      v11[2] = 3221225472;
      v11[3] = sub_C25C;
      v11[4] = &unk_14678;
      v12 = &v13;
      objc_super v9 = (void *)sub_BEC0();
      v14[3] = (uint64_t)dlsym(v9, "espresso_network_query_blob_shape");
      off_18E60 = *(_UNKNOWN **)(v12[1] + 24);
      unsigned int v8 = (void *)v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (!v8) {
      sub_C8B8();
    }
    LOBYTE(v5) = ((unsigned int (*)(void *, void, const char *, void *, _OWORD *))v8)(v6, v7, a3, v11, v17) == 0;
  }
  return v5;
}

- (int)execute
{
  if (![(CIIF_EspressoWrapper *)self buildWait]) {
    return -1;
  }
  v3 = [(CIIF_EspressoWrapper *)self plan];
  [(CIIF_EspressoWrapper *)self planIdx];
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v4 = (uint64_t (*)(void *))off_18E68;
  v10 = off_18E68;
  if (!off_18E68)
  {
    BOOL v5 = (void *)sub_BEC0();
    v8[3] = (uint64_t)dlsym(v5, "espresso_plan_execute_sync");
    off_18E68 = (_UNKNOWN *)v8[3];
    id v4 = (uint64_t (*)(void *))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4) {
    sub_C930();
  }
  return v4(v3);
}

- (int)executeAsync:(id)a3
{
  id v4 = a3;
  if ([(CIIF_EspressoWrapper *)self buildWait])
  {
    BOOL v5 = [(CIIF_EspressoWrapper *)self plan];
    [(CIIF_EspressoWrapper *)self planIdx];
    dispatch_queue_t v6 = dispatch_queue_create(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_BD94;
    v14[3] = &unk_14650;
    id v15 = v4;
    uint64_t v7 = v6;
    unsigned int v8 = v14;
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v9 = (uint64_t (*)(void *, NSObject *, void *))off_18E70;
    v24 = off_18E70;
    if (!off_18E70)
    {
      uint64_t v16 = _NSConcreteStackBlock;
      uint64_t v17 = 3221225472;
      uint64_t v18 = sub_C2FC;
      v19 = &unk_14678;
      v20 = &v21;
      v10 = (void *)sub_BEC0();
      uint64_t v11 = dlsym(v10, "espresso_plan_submit");
      *(void *)(v20[1] + 24) = v11;
      off_18E70 = *(_UNKNOWN **)(v20[1] + 24);
      uint64_t v9 = (uint64_t (*)(void *, NSObject *, void *))v22[3];
    }
    _Block_object_dispose(&v21, 8);
    if (!v9) {
      sub_C9A8();
    }
    int v12 = v9(v5, v7, v8);
  }
  else
  {
    int v12 = -1;
  }

  return v12;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end