@interface GEODefaultsServerConnection
@end

@implementation GEODefaultsServerConnection

void ___GEODefaultsServerConnection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(v2, "message");
    if (string)
    {
      v4 = string;
      if (!strcmp(string, "defaults.keysChanged"))
      {
        v9 = (objc_class *)objc_opt_class();
        id v28 = 0;
        v10 = GEODecodeModernXPCMessage(v2, v9, (uint64_t)&v28);
        v5 = v28;
        v11 = [v10 keyStrings];
        uint64_t v12 = [v10 keyOptions];

        if (!([v11 count] | v12) || v5)
        {
          v22 = j__GEOGetUserDefaultsLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v30 = v11;
            __int16 v31 = 1024;
            int v32 = v12;
            __int16 v33 = 2112;
            v34 = v5;
            _os_log_impl(&dword_188D96000, v22, OS_LOG_TYPE_ERROR, "Could not decode XPC message keys: %@ options: %#x error: %@", buf, 0x1Cu);
          }
        }
        else
        {
          v5 = v11;
          os_unfair_lock_lock(&stru_1EB29F654);
          if (!qword_1EB29F6B8)
          {
            uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
            v14 = (void *)qword_1EB29F6B8;
            qword_1EB29F6B8 = v13;
          }
          v15 = [NSNumber numberWithUnsignedInteger:v12];
          v16 = [(id)qword_1EB29F6B8 objectForKeyedSubscript:v15];
          BOOL v17 = v16 == 0;

          if (v17)
          {
            v18 = [MEMORY[0x1E4F1CA80] set];
            [(id)qword_1EB29F6B8 setObject:v18 forKeyedSubscript:v15];
          }
          v19 = [(id)qword_1EB29F6B8 objectForKeyedSubscript:v15];
          [v19 addObjectsFromArray:v5];

          v20 = qword_1EB29F6B0;
          if (qword_1EB29F6B0)
          {
            dispatch_time_t v21 = dispatch_time(0, 2000000);
            dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
          }
          else
          {
            global_queue = geo_get_global_queue();
            dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
            v25 = (void *)qword_1EB29F6B0;
            qword_1EB29F6B0 = (uint64_t)v24;

            dispatch_source_set_event_handler((dispatch_source_t)qword_1EB29F6B0, &__block_literal_global_191);
            v26 = qword_1EB29F6B0;
            dispatch_time_t v27 = dispatch_time(0, 2000000);
            dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
            dispatch_activate((dispatch_object_t)qword_1EB29F6B0);
          }

          os_unfair_lock_unlock(&stru_1EB29F654);
        }
        goto LABEL_22;
      }
      v5 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = v4;
        v6 = "Received unknown message: \"%s\"";
        v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
        _os_log_impl(&dword_188D96000, v7, v8, v6, buf, 0xCu);
      }
    }
    else
    {
      v5 = j__GEOGetUserDefaultsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = (const char *)v2;
        v6 = "Received invalid message: \"%@\"";
        v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        goto LABEL_8;
      }
    }
LABEL_22:
  }
}

uint64_t ___GEODefaultsServerConnection_block_invoke()
{
  uint64_t v0 = +[GEOXPCConnection createServerConnectionFor:2 debugIdentifier:@"Defaults" eventHandler:&__block_literal_global_109];
  v1 = (void *)qword_1EB29F690;
  qword_1EB29F690 = v0;

  id v2 = (void *)qword_1EB29F690;

  return [v2 setReconnectAutomatically:1];
}

@end