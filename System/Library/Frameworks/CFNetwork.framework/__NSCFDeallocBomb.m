@interface __NSCFDeallocBomb
- (uint64_t)disarm;
- (void)dealloc;
- (void)initWithMethod:(void *)a3 delegate:;
@end

@implementation __NSCFDeallocBomb

- (void).cxx_destruct
{
}

- (void)initWithMethod:(void *)a3 delegate:
{
  id v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)__NSCFDeallocBomb;
    id v7 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a3);
      if (a2) {
        uint64_t v8 = a2;
      }
      else {
        uint64_t v8 = 0;
      }
      a1[2] = v8;
    }
  }

  return a1;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->disarmed)
  {
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    v3 = (id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = (char *)objc_opt_class();
      id object = self->object;
      *(_DWORD *)buf = 138412802;
      v12 = v5;
      __int16 v13 = 2112;
      id v14 = object;
      __int16 v15 = 2048;
      id v16 = object;
      id v7 = v5;
      _os_log_error_impl(&dword_184085000, v3, OS_LOG_TYPE_ERROR, "API MISUSE: NSURLSession delegate %@: %@ (%p)", buf, 0x20u);
    }
    if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
      dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
    }
    v4 = (id)__CFNAPIMisuseFaultLogHandle::logger;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      if (self->method) {
        method = self->method;
      }
      else {
        method = 0;
      }
      Name = sel_getName(method);
      *(_DWORD *)buf = 136315138;
      v12 = Name;
      _os_log_fault_impl(&dword_184085000, v4, OS_LOG_TYPE_FAULT, "API MISUSE: %s completion handler not called", buf, 0xCu);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)__NSCFDeallocBomb;
  [(__NSCFDeallocBomb *)&v10 dealloc];
}

- (uint64_t)disarm
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 24))
    {
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
      }
      v2 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v4 = (char *)objc_opt_class();
        uint64_t v5 = *(void *)(v1 + 8);
        int v9 = 138412802;
        objc_super v10 = v4;
        __int16 v11 = 2112;
        uint64_t v12 = v5;
        __int16 v13 = 2048;
        uint64_t v14 = v5;
        id v6 = v4;
        _os_log_error_impl(&dword_184085000, v2, OS_LOG_TYPE_ERROR, "API MISUSE: NSURLSession delegate %@: %@ (%p)", (uint8_t *)&v9, 0x20u);
      }
      if (__CFNAPIMisuseFaultLogHandle::onceToken != -1) {
        dispatch_once(&__CFNAPIMisuseFaultLogHandle::onceToken, &__block_literal_global_10_5521);
      }
      v3 = (id)__CFNAPIMisuseFaultLogHandle::logger;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        if (*(void *)(v1 + 16)) {
          id v7 = *(const char **)(v1 + 16);
        }
        else {
          id v7 = 0;
        }
        Name = sel_getName(v7);
        int v9 = 136315138;
        objc_super v10 = Name;
        _os_log_fault_impl(&dword_184085000, v3, OS_LOG_TYPE_FAULT, "API MISUSE: %s completion handler called more than once", (uint8_t *)&v9, 0xCu);
      }

      return 0;
    }
    else
    {
      result = 1;
      *(unsigned char *)(v1 + 24) = 1;
    }
  }
  return result;
}

@end