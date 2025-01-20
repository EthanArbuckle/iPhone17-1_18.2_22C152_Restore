@interface XPCStreamEventRegister
+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3;
+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3 withActivityServicesMap:(id)a4;
+ (id)_registrationKeyFromStreamName:(id)a3 eventName:(id)a4;
+ (id)emptyRegister;
+ (id)registerFromDagServiceNames:(id)a3;
- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withAssetCollection:(id)a5 withSelfMetadata:(id)a6;
- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 currentConfig:(id)a5 withSelfMetadata:(id)a6;
- (NSDictionary)activityServicesMap;
- (NSDictionary)registrationsMap;
- (id)_initWithRegistrationsMap:(id)a3 withActivityServicesMap:(id)a4;
- (id)handleableXPCActivities;
- (id)handleableXPCEventStreams;
@end

@implementation XPCStreamEventRegister

+ (id)registerFromDagServiceNames:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v3;
  uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        Class v7 = NSClassFromString(*(NSString **)(*((void *)&v45 + 1) + 8 * i));
        if (objc_opt_respondsToSelector())
        {
          v32 = v7;
          uint64_t v33 = i;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          v8 = [(objc_class *)v7 xpcEventStreamsSupported];
          uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v42 != v11) {
                  objc_enumerationMutation(v8);
                }
                v13 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                v14 = [v13 streamName];
                v15 = [v13 eventName];
                v16 = [a1 _registrationKeyFromStreamName:v14 eventName:v15];

                v17 = [v4 objectForKey:v16];

                if (!v17)
                {
                  v18 = [MEMORY[0x263EFF980] array];
                  [v4 setValue:v18 forKey:v16];
                }
                v19 = [v4 objectForKey:v16];
                [v19 addObject:v13];
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v10);
          }

          Class v7 = v32;
          uint64_t i = v33;
        }
        if (objc_opt_respondsToSelector())
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v20 = [(objc_class *)v7 xpcActivitySupported];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v38;
            do
            {
              for (uint64_t k = 0; k != v22; ++k)
              {
                if (*(void *)v38 != v23) {
                  objc_enumerationMutation(v20);
                }
                uint64_t v25 = *(void *)(*((void *)&v37 + 1) + 8 * k);
                v26 = [v5 objectForKey:v25];

                if (!v26)
                {
                  v27 = [MEMORY[0x263EFF980] array];
                  [v5 setValue:v27 forKey:v25];
                }
                v28 = [v5 objectForKey:v25];
                [v28 addObject:v7];
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v49 count:16];
            }
            while (v22);
          }
        }
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v35);
  }

  v29 = [a1 registerWithRegistrations:v4 withActivityServicesMap:v5];

  return v29;
}

+ (id)_registrationKeyFromStreamName:(id)a3 eventName:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@", a3, a4];
}

+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3 withActivityServicesMap:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[XPCStreamEventRegister alloc] _initWithRegistrationsMap:v6 withActivityServicesMap:v5];

  return (XPCStreamEventRegister *)v7;
}

- (id)_initWithRegistrationsMap:(id)a3 withActivityServicesMap:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)XPCStreamEventRegister;
  uint64_t v9 = [(XPCStreamEventRegister *)&v12 init];
  objc_storeStrong((id *)&v9->_registrationsMap, a3);
  objc_storeStrong((id *)&v9->_activityServicesMap, a4);
  uint64_t v10 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[XPCStreamEventRegister _initWithRegistrationsMap:withActivityServicesMap:]";
    __int16 v15 = 2112;
    id v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_debug_impl(&dword_2263A0000, v10, OS_LOG_TYPE_DEBUG, "%s Registered with xpc events:\n%@\n and activities\n%@", buf, 0x20u);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityServicesMap, 0);
  objc_storeStrong((id *)&self->_registrationsMap, 0);
}

- (NSDictionary)activityServicesMap
{
  return self->_activityServicesMap;
}

- (NSDictionary)registrationsMap
{
  return self->_registrationsMap;
}

- (BOOL)handleXPCActivity:(id)a3 fromIdentifier:(id)a4 withAssetCollection:(id)a5 withSelfMetadata:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v26 = a5;
  id v10 = a6;
  uint64_t v11 = v9;
  objc_super v12 = [(NSDictionary *)self->_activityServicesMap objectForKeyedSubscript:v9];
  v13 = v12;
  if (v12)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(objc_class **)(*((void *)&v27 + 1) + 8 * i);
          char v19 = objc_opt_respondsToSelector();
          v20 = CDMOSLoggerForCategory(0);
          uint64_t v21 = v20;
          if (v19)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v23 = NSStringFromClass(v18);
              *(_DWORD *)buf = 136315394;
              uint64_t v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
              __int16 v34 = 2112;
              id v35 = v23;
              _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s Calling handleXPCActivity on service %@", buf, 0x16u);
            }
            [(objc_class *)v18 handleXPCActivity:v11 withAssets:v26 withSelfMetadata:v10];
          }
          else
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              uint64_t v22 = NSStringFromClass(v18);
              *(_DWORD *)buf = 136315394;
              uint64_t v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
              __int16 v34 = 2112;
              id v35 = v22;
              _os_log_impl(&dword_2263A0000, v21, OS_LOG_TYPE_INFO, "%s [WARN]: Found service [%@] that does not support handleXPCActivity yet is registered for an activity?", buf, 0x16u);
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }
  }
  else
  {
    v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v33 = "-[XPCStreamEventRegister handleXPCActivity:fromIdentifier:withAssetCollection:withSelfMetadata:]";
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s There were no services found supporting xpc activity: %@. Doing nothing.", buf, 0x16u);
    }
  }
  return v13 != 0;
}

- (BOOL)handleXPCEvent:(id)a3 fromStream:(id)a4 currentConfig:(id)a5 withSelfMetadata:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = +[XPCStreamEventUtils getXPCEventName:v10];
  if (v14)
  {
    uint64_t v15 = [(id)objc_opt_class() _registrationKeyFromStreamName:v11 eventName:v14];
    uint64_t v16 = [(NSDictionary *)self->_registrationsMap objectForKeyedSubscript:v15];
    BOOL v17 = v16 != 0;
    id v18 = CDMOSLoggerForCategory(0);
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if (v16)
    {
      if (v19)
      {
        *(_DWORD *)buf = 136315650;
        long long v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
        __int16 v38 = 2112;
        long long v39 = v14;
        __int16 v40 = 2112;
        id v41 = v11;
        _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s Found matching registrations for XPC event %@ from stream %@. Calling handlers.", buf, 0x20u);
      }

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v30 = v16;
      id v18 = v16;
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        BOOL v27 = v17;
        long long v28 = v15;
        long long v29 = v14;
        uint64_t v22 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v18);
            }
            v24 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            uint64_t v25 = [v12 assetCollection];
            [v24 invoke:v10 fromStream:v11 withAssets:v25 withSelfMetadata:v13];
          }
          uint64_t v21 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v21);
        uint64_t v15 = v28;
        uint64_t v14 = v29;
        BOOL v17 = v27;
      }
      uint64_t v16 = v30;
    }
    else if (v19)
    {
      *(_DWORD *)buf = 136315650;
      long long v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
      __int16 v38 = 2112;
      long long v39 = v14;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s There was no matching registration for XPC event %@ from stream %@. Doing nothing.", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v15 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      long long v37 = "-[XPCStreamEventRegister handleXPCEvent:fromStream:currentConfig:withSelfMetadata:]";
      _os_log_error_impl(&dword_2263A0000, v15, OS_LOG_TYPE_ERROR, "%s [ERR]: Error extracting XPC event name", buf, 0xCu);
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (id)handleableXPCActivities
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v4 = [(NSDictionary *)self->_activityServicesMap allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v29;
    key = (char *)*MEMORY[0x263EF8268];
    int64_t v21 = *MEMORY[0x263EF8210];
    uint64_t v22 = (const char *)*MEMORY[0x263EF81C0];
    id v8 = (const char *)*MEMORY[0x263EF82A0];
    id v9 = (const char *)*MEMORY[0x263EF8280];
    BOOL v19 = (char *)*MEMORY[0x263EF82D0];
    string = (char *)*MEMORY[0x263EF8290];
    BOOL v17 = (char *)*MEMORY[0x263EF82B8];
    id v18 = (char *)*MEMORY[0x263EF8180];
    int64_t v26 = *MEMORY[0x263EF81E8];
    BOOL v27 = (const char *)*MEMORY[0x263EF81D8];
    v24 = (char *)*MEMORY[0x263EF82D8];
    uint64_t v25 = (char *)*MEMORY[0x263EF8288];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(__CFString **)(*((void *)&v28 + 1) + 8 * i);
        if (v11 == @"com.apple.siri.cdm.xpc_activity.maintenance")
        {
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_int64(v12, v27, v26);
          xpc_dictionary_set_BOOL(v12, v8, 1);
          xpc_dictionary_set_string(v12, v9, v25);
          xpc_dictionary_set_BOOL(v12, v24, 1);
          id v13 = v3;
          xpc_object_t v14 = v12;
          uint64_t v15 = @"com.apple.siri.cdm.xpc_activity.maintenance";
        }
        else
        {
          if (v11 != @"com.apple.siri.cdm.xpc_activity.post_install") {
            continue;
          }
          xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
          xpc_dictionary_set_BOOL(v12, key, 1);
          xpc_dictionary_set_int64(v12, v22, v21);
          xpc_dictionary_set_BOOL(v12, v8, 0);
          xpc_dictionary_set_string(v12, v9, string);
          xpc_dictionary_set_BOOL(v12, v19, 1);
          xpc_dictionary_set_BOOL(v12, v18, 1);
          xpc_dictionary_set_BOOL(v12, v17, 1);
          id v13 = v3;
          xpc_object_t v14 = v12;
          uint64_t v15 = @"com.apple.siri.cdm.xpc_activity.post_install";
        }
        [v13 setObject:v14 forKey:v15];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)handleableXPCEventStreams
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = self->_registrationsMap;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[NSDictionary objectForKeyedSubscript:](self->_registrationsMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        id v10 = [v9 firstObject];

        id v11 = [v10 streamName];
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (XPCStreamEventRegister)registerWithRegistrations:(id)a3
{
  id v3 = NSDictionary;
  id v4 = a3;
  uint64_t v5 = [v3 dictionary];
  uint64_t v6 = +[XPCStreamEventRegister registerWithRegistrations:v4 withActivityServicesMap:v5];

  return (XPCStreamEventRegister *)v6;
}

+ (id)emptyRegister
{
  id v3 = [NSDictionary dictionary];
  id v4 = [a1 registerWithRegistrations:v3];

  return v4;
}

@end