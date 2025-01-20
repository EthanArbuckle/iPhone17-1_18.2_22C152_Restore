@interface HIDPreferencesHelperClient
- (BOOL)setupConnectionOnQueue:(id)a3;
- (HIDPreferencesHelperClient)initWithConnection:(id)a3 listener:(id)a4 onQueue:(id)a5;
- (id)handleMessage:(id)a3;
- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5;
- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)invalidateConnection;
- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5;
- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5;
@end

@implementation HIDPreferencesHelperClient

- (HIDPreferencesHelperClient)initWithConnection:(id)a3 listener:(id)a4 onQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HIDPreferencesHelperClient;
  v12 = [(HIDPreferencesHelperClient *)&v17 init];
  p_isa = (id *)&v12->super.isa;
  if (!v12)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v12->_connection, a3);
  objc_storeWeak(p_isa + 2, v10);
  if (([p_isa setupConnectionOnQueue:v11] & 1) == 0)
  {
    v15 = _IOHIDLogCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient initWithConnection:listener:onQueue:]();
    }

    goto LABEL_7;
  }
  v14 = p_isa;
LABEL_8:

  return v14;
}

- (BOOL)setupConnectionOnQueue:(id)a3
{
  v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  xpc_connection_set_target_queue(self->_connection, v4);
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke;
  v7[3] = &unk_264807AE8;
  objc_copyWeak(&v8, &location);
  xpc_connection_set_event_handler(connection, v7);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return 1;
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _IOHIDLogCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3();
  }

  WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = MEMORY[0x22A678CC0](v3);
    if (v6 == MEMORY[0x263EF8720])
    {
      id v9 = _IOHIDLogCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1();
      }

      [(xpc_connection_t *)WeakRetained invalidateConnection];
    }
    else if (v6 == MEMORY[0x263EF8708])
    {
      v7 = [(xpc_connection_t *)WeakRetained handleMessage:v3];
      if (v7)
      {
        xpc_connection_send_message(WeakRetained[1], v7);
        id v8 = _IOHIDLogCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2();
        }
      }
    }
  }
}

- (id)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    v25 = _IOHIDLogCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient handleMessage:]();
    }
    goto LABEL_66;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v25 = _IOHIDLogCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient handleMessage:]2();
    }
LABEL_66:

    id v11 = 0;
    id v13 = 0;
    id v10 = 0;
    id v12 = 0;
    id v6 = 0;
    goto LABEL_52;
  }
  id v6 = v5;
  v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient handleMessage:]1();
  }

  id v8 = [v6 objectForKeyedSubscript:@"Type"];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v6 objectForKeyedSubscript:@"Domain"];
  if (v10)
  {
    switch(v9)
    {
      case 1:
        id v11 = [v6 objectForKeyedSubscript:@"Key"];
        if (!v11)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.4();
          }
          goto LABEL_84;
        }
        id v12 = [v6 objectForKeyedSubscript:@"User"];
        if (!v12)
        {
          v24 = _IOHIDLogCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.5();
          }
          goto LABEL_59;
        }
        id v13 = [v6 objectForKeyedSubscript:@"Host"];
        if (!v13)
        {
          v30 = _IOHIDLogCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.6();
          }

          goto LABEL_96;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v37[0] = MEMORY[0x263EF8330];
            v37[1] = 3221225472;
            v37[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke;
            v37[3] = &unk_264807B10;
            v37[4] = self;
            id v12 = v12;
            id v38 = v12;
            id v13 = v13;
            id v39 = v13;
            id v10 = v10;
            id v40 = v10;
            [v11 enumerateKeysAndObjectsUsingBlock:v37];

            goto LABEL_52;
          }
          v22 = _IOHIDLogCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.7();
          }
          goto LABEL_51;
        }
        [(HIDPreferencesHelperClient *)self set:v11 value:0 user:v12 host:v13 domain:v10];
        id v14 = 0;
        goto LABEL_53;
      case 2:
        id v12 = [v6 objectForKeyedSubscript:@"User"];
        if (!v12)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.8();
          }
          goto LABEL_84;
        }
        id v13 = [v6 objectForKeyedSubscript:@"Host"];
        if (!v13)
        {
          v28 = _IOHIDLogCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.9();
          }
          goto LABEL_95;
        }
        id v11 = [v6 objectForKey:@"Key"];

        if (v11)
        {
          id v11 = [v6 objectForKeyedSubscript:@"Key"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v18 = [v11 objectForKeyedSubscript:@"KeysToSet"];
            v19 = [v11 objectForKeyedSubscript:@"KeysToRemove"];
            [(HIDPreferencesHelperClient *)self setMultiple:v18 keysToRemove:v19 user:v12 host:v13 domain:v10];
          }
          goto LABEL_52;
        }
        [(HIDPreferencesHelperClient *)self setMultiple:0 keysToRemove:0 user:v12 host:v13 domain:v10];
        id v14 = 0;
        goto LABEL_53;
      case 3:
        id v12 = [v6 objectForKeyedSubscript:@"User"];
        if (!v12)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]2();
          }
          goto LABEL_84;
        }
        id v13 = [v6 objectForKeyedSubscript:@"Host"];
        if (!v13)
        {
          v28 = _IOHIDLogCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]3();
          }
          goto LABEL_95;
        }
        id v11 = [v6 objectForKeyedSubscript:@"Key"];
        if (v11)
        {
          v36[0] = MEMORY[0x263EF8330];
          v36[1] = 3221225472;
          v36[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22;
          v36[3] = &unk_264807B38;
          v36[4] = &v41;
          [(HIDPreferencesHelperClient *)self copy:v11 user:v12 host:v13 domain:v10 reply:v36];
          goto LABEL_47;
        }
        v29 = _IOHIDLogCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:]4();
        }

        goto LABEL_15;
      case 4:
        id v12 = [v6 objectForKeyedSubscript:@"User"];
        if (!v12)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]6();
          }
          goto LABEL_84;
        }
        id v13 = [v6 objectForKeyedSubscript:@"Host"];
        if (v13)
        {
          id v11 = [v6 objectForKey:@"Key"];

          if (v11)
          {
            id v11 = [v6 objectForKeyedSubscript:@"Key"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [v11 objectForKey:@"KeysToCopy"];

              if (v15)
              {
                v16 = [v11 objectForKeyedSubscript:@"KeysToCopy"];
                v35[0] = MEMORY[0x263EF8330];
                v35[1] = 3221225472;
                v35[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_27;
                v35[3] = &unk_264807B38;
                v35[4] = &v41;
                [(HIDPreferencesHelperClient *)self copyMultiple:v16 user:v12 host:v13 domain:v10 reply:v35];
              }
            }
          }
          else
          {
            v34[0] = MEMORY[0x263EF8330];
            v34[1] = 3221225472;
            v34[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2;
            v34[3] = &unk_264807B38;
            v34[4] = &v41;
            [(HIDPreferencesHelperClient *)self copyMultiple:0 user:v12 host:v13 domain:v10 reply:v34];
          }
          goto LABEL_47;
        }
        v28 = _IOHIDLogCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:]7();
        }
        goto LABEL_95;
      case 5:
        id v12 = [v6 objectForKeyedSubscript:@"User"];
        if (!v12)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]0();
          }
          goto LABEL_84;
        }
        id v13 = [v6 objectForKeyedSubscript:@"Host"];
        if (v13)
        {
          [(HIDPreferencesHelperClient *)self synchronize:v12 host:v13 domain:v10];
LABEL_15:
          id v11 = 0;
        }
        else
        {
          v28 = _IOHIDLogCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]1();
          }
LABEL_95:

          id v11 = 0;
LABEL_96:
          id v13 = 0;
        }
        goto LABEL_52;
      case 6:
        id v11 = [v6 objectForKeyedSubscript:@"Key"];
        if (!v11)
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]0();
          }
          goto LABEL_84;
        }
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_29;
        v31[3] = &unk_264807B38;
        v31[4] = &v41;
        [(HIDPreferencesHelperClient *)self copyDomain:v11 domain:v10 reply:v31];
        id v12 = 0;
        id v13 = 0;
LABEL_47:
        xpc_object_t reply = xpc_dictionary_create_reply(v4);
        v21 = reply;
        if (reply)
        {
          xpc_dictionary_set_value(reply, "Value", (xpc_object_t)v42[5]);
          id v14 = v21;
          goto LABEL_53;
        }
        v22 = _IOHIDLogCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:]5();
        }
LABEL_51:

        goto LABEL_52;
      case 7:
        id v11 = [v6 objectForKeyedSubscript:@"Key"];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(HIDPreferencesHelperClient *)self setDomain:v11 value:0 domain:v10];
            id v13 = 0;
            id v12 = 0;
            id v14 = 0;
            goto LABEL_53;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v32[0] = MEMORY[0x263EF8330];
            v32[1] = 3221225472;
            v32[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_28;
            v32[3] = &unk_264807B60;
            v32[4] = self;
            id v10 = v10;
            id v33 = v10;
            [v11 enumerateKeysAndObjectsUsingBlock:v32];
          }
          else
          {
            v24 = _IOHIDLogCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[HIDPreferencesHelperClient handleMessage:]9();
            }
LABEL_59:
          }
        }
        else
        {
          v27 = _IOHIDLogCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:]8();
          }
LABEL_84:

LABEL_29:
          id v11 = 0;
        }
        id v13 = 0;
        goto LABEL_31;
      default:
        objc_super v17 = _IOHIDLogCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:]();
        }

        goto LABEL_29;
    }
  }
  v26 = _IOHIDLogCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[HIDPreferencesHelperClient handleMessage:]();
  }

  id v11 = 0;
  id v13 = 0;
  id v10 = 0;
LABEL_31:
  id v12 = 0;
LABEL_52:
  id v14 = 0;
LABEL_53:

  _Block_object_dispose(&v41, 8);
  return v14;
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) set:a2 value:a3 user:*(void *)(a1 + 40) host:*(void *)(a1 + 48) domain:*(void *)(a1 + 56)];
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = _CFXPCCreateXPCObjectFromCFObject();
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_27(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = _CFXPCCreateXPCObjectFromCFObject();
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = _CFXPCCreateXPCObjectFromCFObject();
    return MEMORY[0x270F9A758]();
  }
  return result;
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setDomain:a2 value:a3 domain:*(void *)(a1 + 40)];
}

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_29(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40) = _CFXPCCreateXPCObjectFromCFObject();
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)invalidateConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  connection = self->_connection;
  id v6 = WeakRetained;
  if (connection) {
    BOOL v5 = WeakRetained == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    xpc_connection_cancel(connection);
    [v6 removeClient:self];
  }
}

- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Key:%@ Value:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetValue(v11, v12, v15, v13, v14);
}

- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = (__CFString *)a3;
  id v12 = (__CFString *)a4;
  id v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  v15 = (void (**)(id, void *))a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Key:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  int v17 = (void *)CFPreferencesCopyValue(v11, v14, v12, v13);
  v18 = _IOHIDLogCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:]();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = (__CFString *)a5;
  id v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_debug_impl(&dword_227443000, v10, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Synchronize User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSynchronize(v9, v7, v8);
}

- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFArrayRef v11 = (const __CFArray *)a3;
  id v12 = (__CFString *)a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  __int16 v15 = (void (**)(id, CFDictionaryRef))a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    CFArrayRef v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Multiple Keys:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v19, 0x2Au);
  }

  CFDictionaryRef v17 = CFPreferencesCopyMultiple(v11, v14, v12, v13);
  v18 = _IOHIDLogCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:]();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  CFDictionaryRef v11 = (const __CFDictionary *)a3;
  CFArrayRef v12 = (const __CFArray *)a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  __int16 v15 = (__CFString *)a7;
  v16 = _IOHIDLogCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    CFDictionaryRef v18 = v11;
    __int16 v19 = 2112;
    CFArrayRef v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl(&dword_227443000, v16, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Multiple KeysToSet:%@ KeysToRemove:%@ User:%@ Host:%@ Domain:%@\n", (uint8_t *)&v17, 0x34u);
  }

  CFPreferencesSetMultiple(v11, v12, v15, v13, v14);
}

- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5
{
  v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  id v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copyDomain:domain:reply:]();
  }

  CFDictionaryRef v11 = (void *)CFPreferencesCopyAppValue(v7, v8);
  CFArrayRef v12 = _IOHIDLogCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:]();
  }

  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v7 = (__CFString *)a3;
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  id v10 = _IOHIDLogCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    CFArrayRef v12 = v7;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_debug_impl(&dword_227443000, v10, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Set Domain Value Key:%@ Domain:%@ Value : %@\n", (uint8_t *)&v11, 0x20u);
  }

  CFPreferencesSetAppValue(v7, v8, v9);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listener);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:listener:onQueue:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper failed to setup connection\n", v2, v3, v4, v5, v6);
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_227443000, v0, v1, "HIDPreferencesHelper Remote Connection terminated\n", v2, v3, v4, v5, v6);
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_227443000, v0, v1, "HIDPreferencesHelper send event reply\n", v2, v3, v4, v5, v6);
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_227443000, v0, v1, "HIDPreferencesHelper XPC connection event\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper failed to decode message\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper invalid domain\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_227443000, v0, v1, "HIDPreferencesHelper invalid request type %lu\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set invalid key\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set invalid user\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set invalid host\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_227443000, v0, v1, "HIDPreferencesHelper Set unknown key type %@\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set Multiple invalid user\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set Multiple invalid host\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Synchronize invalid user\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Synchronize invalid host\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.12()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy invalid user\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.13()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy invalid host\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.14()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy invalid key\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.15()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper failed to create reply object\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.16()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy Multiple invalid user\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.17()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy Multiple invalid host\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.18()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Set Domain invalid key\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5(&dword_227443000, v0, v1, "HIDPreferencesHelper Set Domain unknown key type %@\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.20()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper Copy Domain invalid key\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.21()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_227443000, v0, v1, "HIDPreferencesHelper Message from remote connection %@\n", v2, v3, v4, v5, v6);
}

- (void)handleMessage:.cold.22()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_227443000, v0, v1, "HIDPreferencesHelper invalid message type\n", v2, v3, v4, v5, v6);
}

- (void)copy:user:host:domain:reply:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_227443000, v0, v1, "HIDPreferencesHelper CFPreference value %@\n", v2, v3, v4, v5, v6);
}

- (void)copyDomain:domain:reply:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_227443000, v1, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper Copy Domain Value Key:%@ Domain:%@\n", v2, 0x16u);
}

@end