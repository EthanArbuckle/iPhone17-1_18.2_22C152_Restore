@interface NEHotspotConfigurationHelper
+ (id)sharedManager;
- (NEHotspotConfigurationHelper)init;
- (id)helper;
- (void)sendRequest:(uint64_t)a3 requestType:(void *)a4 resultHandler:;
@end

@implementation NEHotspotConfigurationHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

- (NEHotspotConfigurationHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)NEHotspotConfigurationHelper;
  v2 = [(NEHotspotConfigurationHelper *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("NEHotspotConfigurationHelper queue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (id)sharedManager
{
  self;
  if (sharedManager_init_manager_7064 != -1) {
    dispatch_once(&sharedManager_init_manager_7064, &__block_literal_global_7065);
  }
  v0 = (void *)sharedManager_g_manager_7066;

  return v0;
}

uint64_t __45__NEHotspotConfigurationHelper_sharedManager__block_invoke()
{
  sharedManager_g_manager_7066 = objc_alloc_init(NEHotspotConfigurationHelper);

  return MEMORY[0x1F41817F8]();
}

- (id)helper
{
  v1 = a1;
  objc_sync_enter(v1);
  v2 = (void *)v1[1];
  if (!v2)
  {
    v3 = [[NEHelper alloc] initWithDelegateClassID:9 queue:v1[2]];
    dispatch_queue_t v4 = (void *)v1[1];
    v1[1] = v3;

    v2 = (void *)v1[1];
  }
  id v5 = v2;
  objc_sync_exit(v1);

  return v5;
}

- (void)sendRequest:(uint64_t)a3 requestType:(void *)a4 resultHandler:
{
  id v7 = a4;
  id v8 = a2;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  v10 = v9;
  if (a3 == 2)
  {
    xpc_dictionary_set_uint64(v9, "MessageType", 0x3EBuLL);
  }
  else if (a3 == 1)
  {
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v8;
        xpc_dictionary_set_uint64(v10, "MessageType", 0x3EAuLL);
        id v13 = v12;
        v14 = (const char *)[v13 cStringUsingEncoding:4];

        xpc_dictionary_set_string(v10, "NetworkToRemove", v14);
      }
    }
  }
  else
  {
    if (a3 || !v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      v10 = 0;
      goto LABEL_16;
    }
    xpc_dictionary_set_uint64(v10, "MessageType", 0x3E9uLL);
    id v11 = v8;
    xpc_dictionary_set_data(v10, "AddParameter", (const void *)[v11 bytes], objc_msgSend(v11, "length"));
  }

  if (v10)
  {
    if (v7)
    {
      xpc_dictionary_set_BOOL(v10, "IsResponseExpected", 1);
      v15 = -[NEHotspotConfigurationHelper helper](a1);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__NEHotspotConfigurationHelper_sendRequest_requestType_resultHandler___block_invoke;
      v17[3] = &unk_1E598FF40;
      v17[4] = a1;
      id v18 = v7;
      [v15 sendRequest:v10 responseHandler:v17];
    }
    else
    {
      xpc_dictionary_set_BOOL(v10, "IsResponseExpected", 0);
      v16 = -[NEHotspotConfigurationHelper helper](a1);
      [v16 sendRequest:v10 responseHandler:0];
    }
  }
LABEL_16:
}

void __70__NEHotspotConfigurationHelper_sendRequest_requestType_resultHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = v7;
  if (a3 == (void *)107)
  {
LABEL_19:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  if (v7 && MEMORY[0x19F3B92C0](v7) == MEMORY[0x1E4F14590])
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v8, "MessageType");
    if (uint64 == 1005)
    {
      v10 = xpc_dictionary_get_value(v8, "QueryResult");
      if (v10)
      {
        if (*(void *)(a1 + 32))
        {
          id v11 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            id v12 = v11;
          }
          else
          {
            v15 = ne_log_obj();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              int v21 = 138412290;
              id v22 = (id)objc_opt_class();
              id v20 = v22;
              _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "%@ received an invalid response to query.", (uint8_t *)&v21, 0xCu);
            }
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
        (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3);
      }
      else
      {
        id v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v21 = 134217984;
          id v22 = a3;
          _os_log_debug_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEBUG, "query request received nil response with result code = %lld", (uint8_t *)&v21, 0xCu);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }

      if ((a2 & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
    if (uint64 == 1004)
    {
      (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a3);
    }
    else
    {
      id v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412290;
        id v22 = (id)objc_opt_class();
        id v19 = v22;
        _os_log_error_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_ERROR, "%@ received unknown response.", (uint8_t *)&v21, 0xCu);
      }
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 108);
    }
  }
  if ((a2 & 1) == 0)
  {
LABEL_16:
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_opt_class();
      int v21 = 138412290;
      id v22 = v16;
      id v17 = v16;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%@ failed to communicate to helper server.", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_19;
  }
LABEL_20:
}

@end