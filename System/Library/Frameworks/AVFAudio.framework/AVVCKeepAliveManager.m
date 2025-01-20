@interface AVVCKeepAliveManager
+ (id)sharedManager;
- (AVVCKeepAliveManager)init;
- (id)getDispatchQueue;
- (void)createWithCompletion:(id)a3;
- (void)dealloc;
- (void)destroyWithCompletion:(id)a3;
- (void)startWithCompletion:(id)a3;
- (void)stopWithCompletion:(id)a3;
@end

@implementation AVVCKeepAliveManager

- (void).cxx_destruct
{
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (impl) {
    (*((void (**)(AVVCKeepAliveImpl *, SEL))impl->var0 + 5))(impl, a2);
  }
  mKeepAliveDispatchQueue = self->mKeepAliveDispatchQueue;
  self->mKeepAliveDispatchQueue = 0;

  if (kAVVCScope)
  {
    v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_10;
    }
  }
  else
  {
    v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v9 = "AVVCKeepAliveManager.mm";
    __int16 v10 = 1024;
    int v11 = 142;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Dealloced AVVCKeepAliveManager", buf, 0x12u);
  }

LABEL_10:
  v7.receiver = self;
  v7.super_class = (Class)AVVCKeepAliveManager;
  [(AVVCKeepAliveManager *)&v7 dealloc];
}

- (void)destroyWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  uint64_t v4 = (*((uint64_t (**)(AVVCKeepAliveImpl *))self->_impl->var0 + 3))(self->_impl);
  if (v6)
  {
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v4 userInfo:0];
    v6[2](v6, v5);
  }

  MEMORY[0x1F41817F8](v4);
}

- (void)stopWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  uint64_t v4 = (*((uint64_t (**)(AVVCKeepAliveImpl *))self->_impl->var0 + 2))(self->_impl);
  if (v6)
  {
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v4 userInfo:0];
    v6[2](v6, v5);
  }

  MEMORY[0x1F41817F8](v4);
}

- (void)startWithCompletion:(id)a3
{
  id v4 = a3;
  impl = self->_impl;
  mKeepAliveDispatchQueue = self->mKeepAliveDispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AVVCKeepAliveManager_startWithCompletion___block_invoke;
  v8[3] = &unk_1E5965A60;
  id v9 = v4;
  __int16 v10 = impl;
  id v7 = v4;
  dispatch_async(mKeepAliveDispatchQueue, v8);
}

void __44__AVVCKeepAliveManager_startWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 40) + 8))(*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v2 userInfo:0];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

- (void)createWithCompletion:(id)a3
{
  id v6 = (void (**)(id, void *))a3;
  uint64_t v4 = ((uint64_t (*)(AVVCKeepAliveImpl *))*self->_impl->var0)(self->_impl);
  if (v6)
  {
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:(int)v4 userInfo:0];
    v6[2](v6, v5);
  }

  MEMORY[0x1F41817F8](v4);
}

- (id)getDispatchQueue
{
  return self->mKeepAliveDispatchQueue;
}

- (AVVCKeepAliveManager)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)AVVCKeepAliveManager;
  int v2 = [(AVVCKeepAliveManager *)&v8 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_impl = 0;
    if (GetImplType(void)::onceToken != -1) {
      dispatch_once(&GetImplType(void)::onceToken, &__block_literal_global_6077);
    }
    if (!GetImplType(void)::type) {
      operator new();
    }
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v5 = dispatch_queue_create("KeepAliveDispatchQueue", v4);
    mKeepAliveDispatchQueue = v3->mKeepAliveDispatchQueue;
    v3->mKeepAliveDispatchQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AVVCKeepAliveManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[AVVCKeepAliveManager sharedManager]::onceToken != -1) {
    dispatch_once(&+[AVVCKeepAliveManager sharedManager]::onceToken, block);
  }
  int v2 = (void *)sSharedManager;

  return v2;
}

void __37__AVVCKeepAliveManager_sharedManager__block_invoke(Class *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int ProductType = PlatformUtilities_iOS::GetProductType((PlatformUtilities_iOS *)a1);
  int v3 = MGGetSInt32Answer();
  if ((MGGetBoolAnswer() & 1) != 0 || v3 == 7) {
    goto LABEL_9;
  }
  unsigned int v4 = ((ProductType - 96) < 0x11) & (0x18003u >> (ProductType - 96));
  if (isDarwinOSProduct(void)::onceToken != -1) {
    dispatch_once(&isDarwinOSProduct(void)::onceToken, &__block_literal_global_160);
  }
  char v5 = isDarwinOSProduct(void)::isDarwinOS ? 1 : v4;
  if (v5)
  {
LABEL_9:
    id v6 = (void *)sSharedManager;
    sSharedManager = 0;

    if (kAVVCScope)
    {
      id v7 = *(id *)kAVVCScope;
      if (!v7) {
        return;
      }
    }
    else
    {
      id v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      v16 = "AVVCKeepAliveManager.mm";
      __int16 v17 = 1024;
      int v18 = 100;
      uint64_t v9 = "%25s:%-5d AVVCKeepAliveManager not supported on this device";
      __int16 v10 = v7;
      uint32_t v11 = 18;
LABEL_21:
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  id v12 = objc_alloc_init(a1[4]);
  v13 = (void *)sSharedManager;
  sSharedManager = (uint64_t)v12;

  if (!kAVVCScope)
  {
    id v7 = MEMORY[0x1E4F14500];
    id v14 = MEMORY[0x1E4F14500];
LABEL_19:
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      v16 = "AVVCKeepAliveManager.mm";
      __int16 v17 = 1024;
      int v18 = 96;
      __int16 v19 = 2048;
      uint64_t v20 = sSharedManager;
      uint64_t v9 = "%25s:%-5d Created AVVCKeepAliveManager (%p)";
      __int16 v10 = v7;
      uint32_t v11 = 28;
      goto LABEL_21;
    }
LABEL_22:

    return;
  }
  id v7 = *(id *)kAVVCScope;
  if (v7) {
    goto LABEL_19;
  }
}

@end