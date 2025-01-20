@interface CloudSettingsService
- (CloudSettingsMediator)mediator;
- (CloudSettingsService)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4;
- (CloudSettingsStore)store;
- (NSString)identifier;
- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4;
- (void)performFirstTimeSetupForStore:(id)a3 newDevice:(BOOL)a4;
- (void)performSmartMergeWithStoreSettings:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMediator:(id)a3;
- (void)setStore:(id)a3;
- (void)writeToCloudSettings:(id)a3 forStore:(id)a4;
- (void)writeToCloudSettingsDict:(id)a3 forStore:(id)a4;
@end

@implementation CloudSettingsService

- (CloudSettingsService)initWithStoreIdentifier:(id)a3 settingsMediator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CloudSettingsService;
  v8 = [(CloudSettingsService *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(CloudSettingsService *)v8 setIdentifier:v6];
    v10 = [[CloudSettingsStore alloc] initWithStoreIdentifier:v6];
    [(CloudSettingsService *)v9 setStore:v10];

    [(CloudSettingsService *)v9 setMediator:v7];
  }

  return v9;
}

- (void)performFirstTimeSetupForStore:(id)a3 newDevice:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, performFirstTimeSetupForStore: %@, isNewDevice: %d", (uint8_t *)&v11, 0x12u);
  }
  id v7 = [(CloudSettingsService *)self store];
  v8 = [v7 dictionaryRepresentation];

  if ([v8 count]) {
    uint64_t v9 = v4 | 2u;
  }
  else {
    uint64_t v9 = v4;
  }
  switch(v9)
  {
    case 1:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, kCSS_NEW_NOKVS, Do nothing", (uint8_t *)&v11, 2u);
      }
      break;
    case 2:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, kCSS_NOTNEW_HASKVS, smart sync needed", (uint8_t *)&v11, 2u);
      }
      [(CloudSettingsService *)self performSmartMergeWithStoreSettings:v8];
      break;
    case 3:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, kCSS_NEW_HASKVS, pull cloud and set local settings to match", (uint8_t *)&v11, 2u);
      }
      v10 = [(CloudSettingsService *)self identifier];
      [(CloudSettingsService *)self applyCloudSettingsToDevice:0 forStore:v10];
      goto LABEL_16;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "in CloudSettings Service, NOTNEW_NOKVS, push local to cloud", (uint8_t *)&v11, 2u);
      }
      v10 = [(CloudSettingsService *)self identifier];
      [(CloudSettingsService *)self writeToCloudSettings:0 forStore:v10];
LABEL_16:

      break;
  }
}

- (void)applyCloudSettingsToDevice:(id)a3 forStore:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v33 = a4;
  id v7 = [(CloudSettingsService *)self store];
  v8 = [v7 dictionaryRepresentation];

  if (!v6)
  {
    id v6 = [v8 allKeys];
  }
  v32 = self;
  uint64_t v9 = [(CloudSettingsService *)self mediator];
  v10 = [v9 deviceSettingsForKeys:v6];

  int v11 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  v34 = v11;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v37;
    uint64_t v15 = &_os_log_internal;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
        v18 = [v8 objectForKeyedSubscript:v17];
        if (v18)
        {
          v19 = [v10 objectForKeyedSubscript:v17];
          if (v19 && (v20 = objc_opt_class(), v21 = v20 == objc_opt_class(), int v11 = v34, v21))
          {
            if (objc_opt_respondsToSelector())
            {
              if (([v18 isEqual:v19] & 1) == 0) {
                goto LABEL_11;
              }
            }
            else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2188A2000, v15, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: storeValue does not respond to isEqual", buf, 2u);
            }
          }
          else
          {
LABEL_11:
            [v11 setObject:v18 forKeyedSubscript:v17];
          }

          goto LABEL_15;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v41 = v17;
          _os_log_impl(&dword_2188A2000, v15, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: key not found in KVS store: %@", buf, 0xCu);
        }
LABEL_15:

        ++v16;
      }
      while (v13 != v16);
      uint64_t v22 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      uint64_t v13 = v22;
    }
    while (v22);
  }

  uint64_t v23 = [(CloudSettingsService *)v32 mediator];
  if (v23
    && (v24 = (void *)v23,
        [(CloudSettingsService *)v32 mediator],
        v25 = objc_claimAutoreleasedReturnValue(),
        char v26 = objc_opt_respondsToSelector(),
        v25,
        int v11 = v34,
        v24,
        (v26 & 1) != 0))
  {
    v27 = [(CloudSettingsService *)v32 mediator];
    v28 = [v27 mergeSettings:v34];

    v29 = v33;
    if (v28 && [v28 count]) {
      [(CloudSettingsService *)v32 writeToCloudSettingsDict:v28 forStore:v33];
    }
    v30 = v34;
  }
  else
  {
    v31 = [(CloudSettingsService *)v32 mediator];
    [v31 applySettings:v11];

    v28 = 0;
    v30 = v11;
    v29 = v33;
  }
}

- (void)writeToCloudSettingsDict:(id)a3 forStore:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412546;
    long long v16 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v5, "objectForKey:", v11, v16);
        uint64_t v13 = [NSNumber numberWithBool:0];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v15 = [(CloudSettingsService *)self store];
          objc_msgSend(v15, "setBool:forKey:", objc_msgSend(v12, "BOOLValue"), v11);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v15 = [(CloudSettingsService *)self store];
            [v15 setNumber:v12 forKey:v11];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v15 = [(CloudSettingsService *)self store];
              [v15 setString:v12 forKey:v11];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = [(CloudSettingsService *)self store];
                [v15 setArray:v12 forKey:v11];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v15 = [(CloudSettingsService *)self store];
                  [v15 setDictionary:v12 forKey:v11];
                }
                else
                {
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_19;
                  }
                  uint64_t v15 = [v12 description];
                  *(_DWORD *)buf = v16;
                  uint64_t v22 = v15;
                  __int16 v23 = 2112;
                  uint64_t v24 = v11;
                  _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: writeToCloudSettings - unsupported class: %@ write for key: %@", buf, 0x16u);
                }
              }
            }
          }
        }

LABEL_19:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }
}

- (void)writeToCloudSettings:(id)a3 forStore:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CloudSettingsService *)self mediator];
  id v9 = [v8 deviceSettingsForKeys:v7];

  [(CloudSettingsService *)self writeToCloudSettingsDict:v9 forStore:v6];
}

- (void)performSmartMergeWithStoreSettings:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = [(CloudSettingsService *)self mediator];
  id v7 = [v6 deviceSettingsForKeys:0];
  uint64_t v8 = [v5 dictionaryWithDictionary:v7];

  if (!v4 || (id v9 = v4, ![v4 count]))
  {
    v10 = [(CloudSettingsService *)self store];
    id v9 = [v10 dictionaryRepresentation];

    if (!v9)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ERROR | CloudSettingsService: performSmartMergeWithStoreSettings - nil cloud dict, this should not happen, do nothing", buf, 2u);
      }
      goto LABEL_35;
    }
  }
  if (![v9 count])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    BOOL v21 = &_os_log_internal;
    uint64_t v22 = "ERROR | CloudSettingsService: performSmartMergeWithStoreSettings - empty cloud dict, this should not happen, do nothing";
    goto LABEL_24;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v9 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (!v11) {
    goto LABEL_18;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v39;
  v35 = self;
  id v36 = v4;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v39 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
      long long v16 = [v9 objectForKey:v15];
      long long v17 = [v8 objectForKey:v15];
      if (!v17)
      {
        id v23 = v15;
        uint64_t v24 = @"no matching local setting";
LABEL_34:

        v30 = +[CloudSettingsManager sharedCloudSettingsManager];
        v31 = [(CloudSettingsService *)v35 identifier];
        [v30 setConflict:2 forStore:v31];

        v32 = +[CloudSettingsManager sharedCloudSettingsManager];
        id v33 = [(CloudSettingsService *)v35 identifier];
        [v32 setEnabled:0 forStore:v33];

        id v4 = v36;
        goto LABEL_35;
      }
      uint64_t v18 = objc_opt_class();
      if (v18 != objc_opt_class())
      {
        id v25 = v15;
        uint64_t v26 = NSString;
        uint64_t v27 = objc_opt_class();
        uint64_t v24 = [v26 stringWithFormat:@"kvsStore type: %@, does not match local type: %@", v27, objc_opt_class()];
        goto LABEL_34;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v28 = v15;
        [NSString stringWithFormat:@"kvsStore type: %@, does not respond to isEqual", objc_opt_class()];
        goto LABEL_32;
      }
      if (![v16 isEqual:v17])
      {
        id v29 = v15;
        objc_msgSend(NSString, "stringWithFormat:", @"cloudValue is NOT equal to local value", v34);
LABEL_32:
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v43 = v15;
          __int16 v44 = 2112;
          v45 = v24;
          _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "CloudSettingsService: performSmartMergeWithStoreSettings - conflict found for key: %@.  Conflict: %@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v43 = v15;
        _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Removing match: %@", buf, 0xCu);
      }
      [v8 removeObjectForKey:v15];
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    self = v35;
    id v4 = v36;
    if (v12) {
      continue;
    }
    break;
  }
LABEL_18:

  if (![v8 count])
  {
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    BOOL v21 = &_os_log_internal;
    uint64_t v22 = "No Conflicts, no remaining setting, exit";
LABEL_24:
    _os_log_impl(&dword_2188A2000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_25;
  }
  long long v19 = [v8 allKeys];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v43 = v19;
    _os_log_impl(&dword_2188A2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "No Conflicts, but some left over local settings to be uploaded: %@", buf, 0xCu);
  }
  long long v20 = [(CloudSettingsService *)self identifier];
  [(CloudSettingsService *)self writeToCloudSettings:v19 forStore:v20];

LABEL_25:
LABEL_35:
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (CloudSettingsStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (CloudSettingsMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediator, 0);
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end