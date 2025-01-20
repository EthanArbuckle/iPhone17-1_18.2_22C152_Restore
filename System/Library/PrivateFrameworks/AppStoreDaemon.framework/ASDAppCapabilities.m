@interface ASDAppCapabilities
+ (BOOL)isCapable:(id)a3;
+ (BOOL)isCapableOfAction:(int64_t)a3 capabilities:(id)a4;
+ (BOOL)isCapableOfAction:(int64_t)a3 capability:(id)a4;
+ (id)defaultInstance;
+ (id)interface;
- (ASDAppCapabilities)init;
- (uint64_t)_isCapable:(uint64_t)a3 method:;
@end

@implementation ASDAppCapabilities

+ (id)interface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEC6C218];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_isCapable_withCompletionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)defaultInstance
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__ASDAppCapabilities_defaultInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1EB4D64F8 != -1) {
    dispatch_once(&qword_1EB4D64F8, block);
  }
  v1 = (void *)_MergedGlobals_36;
  return v1;
}

uint64_t __37__ASDAppCapabilities_defaultInstance__block_invoke(uint64_t a1)
{
  _MergedGlobals_36 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (ASDAppCapabilities)init
{
  v10.receiver = self;
  v10.super_class = (Class)ASDAppCapabilities;
  v2 = [(ASDAppCapabilities *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedValues = v2->_cachedValues;
    v2->_cachedValues = (NSMutableDictionary *)v3;

    v2->_cacheLock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v2);
    v2->_eligibilityChangedNotificationToken = -1;
    v5 = dispatch_get_global_queue(21, 0);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __26__ASDAppCapabilities_init__block_invoke;
    v7[3] = &unk_1E58B36F8;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.os-eligibility-domain.change", &v2->_eligibilityChangedNotificationToken, v5, v7);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __26__ASDAppCapabilities_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = ASDLogHandleForCategory(1);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BF6A000, v1, OS_LOG_TYPE_DEBUG, "Clearing cache after receiving notification", buf, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
    [*((id *)WeakRetained + 1) removeAllObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  }
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"ASDAppCapabilitiesDidChangeNotification" object:WeakRetained];
}

+ (BOOL)isCapable:(id)a3
{
  id v3 = a3;
  v4 = +[ASDAppCapabilities defaultInstance]();
  char v5 = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v4, v3, (uint64_t)"+[ASDAppCapabilities isCapable:]");

  return v5;
}

- (uint64_t)_isCapable:(uint64_t)a3 method:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  char v5 = v4;
  if (a1)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%ld-%ld", objc_msgSend(v4, "features"), objc_msgSend(v4, "action"));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = [*(id *)(a1 + 8) objectForKeyedSubscript:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
    if (v7)
    {
      id v8 = ASDLogHandleForCategory(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 1026;
        *(_DWORD *)&buf[14] = [v7 BOOLValue];
        _os_log_debug_impl(&dword_19BF6A000, v8, OS_LOG_TYPE_DEBUG, "Cached value found for %{public}@ - %{public}d", buf, 0x12u);
      }

      a1 = [v7 BOOLValue];
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v34 = __Block_byref_object_copy__5;
      v35 = __Block_byref_object_dispose__5;
      id v36 = 0;
      uint64_t v24 = 0;
      v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v21 = __40__ASDAppCapabilities__isCapable_method___block_invoke;
      v22 = &unk_1E58B3108;
      v23 = buf;
      v9 = v20;
      objc_super v10 = +[ASDServiceBroker defaultBroker];
      *(void *)v28 = 0;
      v11 = [v10 getCapabilitiesServiceWithError:v28];
      id v12 = *(id *)v28;

      if (v11)
      {
        v13 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v9];
      }
      else
      {
        v21((uint64_t)v9, v12);
        v13 = 0;
      }

      if (*(void *)(*(void *)&buf[8] + 40))
      {
        v14 = ASDLogHandleForCategory(1);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
          *(_DWORD *)v28 = 136446722;
          *(void *)&v28[4] = a3;
          __int16 v29 = 2114;
          v30 = v5;
          __int16 v31 = 2114;
          uint64_t v32 = v17;
          _os_log_error_impl(&dword_19BF6A000, v14, OS_LOG_TYPE_ERROR, "Error in %{public}s: %{public}@ - %{public}@", v28, 0x20u);
        }

        a1 = 0;
      }
      else
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __40__ASDAppCapabilities__isCapable_method___block_invoke_60;
        v19[3] = &unk_1E58B3628;
        v19[4] = &v24;
        [v13 isCapable:v5 withCompletionHandler:v19];
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
        v15 = [NSNumber numberWithBool:*((unsigned __int8 *)v25 + 24)];
        [*(id *)(a1 + 8) setObject:v15 forKeyedSubscript:v6];

        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
        a1 = *((unsigned char *)v25 + 24) != 0;
      }

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(buf, 8);
    }
  }

  return a1;
}

+ (BOOL)isCapableOfAction:(int64_t)a3 capability:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  char v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  v7 = [v5 arrayWithObjects:&v11 count:1];
  id v8 = +[ASDAppCapabilityMetadata metadataWithAction:bundleID:capabilities:](ASDAppCapabilityMetadata, "metadataWithAction:bundleID:capabilities:", a3, &stru_1EEC399F8, v7, v11, v12);

  v9 = +[ASDAppCapabilities defaultInstance]();
  LOBYTE(a3) = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v9, v8, (uint64_t)"+[ASDAppCapabilities isCapableOfAction:capability:]");

  return a3;
}

+ (BOOL)isCapableOfAction:(int64_t)a3 capabilities:(id)a4
{
  id v4 = +[ASDAppCapabilityMetadata metadataWithAction:a3 bundleID:&stru_1EEC399F8 capabilities:a4];
  char v5 = +[ASDAppCapabilities defaultInstance]();
  char v6 = -[ASDAppCapabilities _isCapable:method:]((uint64_t)v5, v4, (uint64_t)"+[ASDAppCapabilities isCapableOfAction:capabilities:]");

  return v6;
}

void __40__ASDAppCapabilities__isCapable_method___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __40__ASDAppCapabilities__isCapable_method___block_invoke_60(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void).cxx_destruct
{
}

@end