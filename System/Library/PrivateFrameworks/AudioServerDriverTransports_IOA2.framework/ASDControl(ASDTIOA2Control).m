@interface ASDControl(ASDTIOA2Control)
- (BOOL)asdtAddControlProperties:()ASDTIOA2Control;
- (void)asdtRemoveControlProperties;
- (void)asdtSendControlPropertyChangeNotificationAtIndex:()ASDTIOA2Control;
@end

@implementation ASDControl(ASDTIOA2Control)

- (BOOL)asdtAddControlProperties:()ASDTIOA2Control
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v4 = a1;
  v5 = (void *)MEMORY[0x263EFF980];
  id v45 = v4;
  v6 = [v4 properties];
  v46 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v7 = [v45 properties];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v52 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = NSNumber;
          v13 = [v11 address];
          v14 = objc_msgSend(v12, "numberWithUnsignedInt:", objc_msgSend(v13, "selector"));
          [v46 addObject:v14];
        }
        else
        {
          [v46 addObject:&unk_26FCB1F98];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v8);
  }

  if ([v46 isEqual:v44])
  {
    BOOL v15 = 1;
    goto LABEL_44;
  }
  [v45 asdtRemoveControlProperties];
  v43 = [v45 propertySelectorInfo];
  if (![v43 count] || !objc_msgSend(v44, "count"))
  {
    BOOL v15 = 1;
    goto LABEL_43;
  }
  uint64_t v16 = [v44 count];
  if (v16 != [v43 count])
  {
    log = ASDTIOA2LogType();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      int v40 = [v44 count];
      int v41 = [v43 count];
      *(_DWORD *)buf = 138412802;
      id v57 = v39;
      __int16 v58 = 1024;
      int v59 = v40;
      __int16 v60 = 1024;
      int v61 = v41;
      _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "%@: Invalid property selector count in registry: found %u, expected %u", buf, 0x18u);
    }
    BOOL v15 = 0;
    goto LABEL_42;
  }
  log = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v44, "count"));
  for (unsigned int j = 0; ; ++j)
  {
    unint64_t v18 = [v44 count];
    BOOL v15 = v18 <= j;
    if (v18 <= j)
    {
      id v26 = [log copy];
      [v45 setProperties:v26];

      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v27 = [v45 properties];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
      uint64_t v29 = v28;
      if (v28)
      {
        uint64_t v30 = *(void *)v48;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            uint64_t v32 = *(void *)(*((void *)&v47 + 1) + 8 * v31);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v33 = [v45 ioa2Device];
              [v33 addCustomProperty:v32];
            }
            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v29);
      }
      goto LABEL_41;
    }
    v19 = [v44 objectAtIndexedSubscript:j];
    uint64_t v20 = [v19 unsignedIntValue];

    if (v20) {
      break;
    }
    v27 = [MEMORY[0x263EFF9D0] null];
    [log addObject:v27];
LABEL_23:
  }
  v27 = [v43 objectAtIndexedSubscript:j];
  v21 = [v27 objectForKeyedSubscript:@"selector"];
  uint64_t v22 = [v21 unsignedIntValue];

  v23 = [v27 objectForKeyedSubscript:@"dataType"];
  uint64_t v24 = [v23 unsignedIntValue];

  v25 = [MEMORY[0x263F28C78] forControl:v45 controlSelector:v22 propertySelector:v20 propertyDataType:v24];
  if (v25)
  {
    [log addObject:v25];

    goto LABEL_23;
  }
  v34 = ASDTIOA2LogType();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v35 = (objc_class *)objc_opt_class();
    v36 = NSStringFromClass(v35);
    -[ASDControl(ASDTIOA2Control) asdtAddControlProperties:](v36, v20, buf, v34);
  }

LABEL_41:
LABEL_42:

LABEL_43:
LABEL_44:

  return v15;
}

- (void)asdtRemoveControlProperties
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(v1, "properties", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = [v1 ioa2Device];
          [v7 removeCustomProperty:v6];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  [v1 setProperties:0];
}

- (void)asdtSendControlPropertyChangeNotificationAtIndex:()ASDTIOA2Control
{
  uint64_t v4 = [a1 properties];
  id v5 = [v4 objectAtIndex:a3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 sendPropertyChangeNotification];
  }
}

- (void)asdtAddControlProperties:()ASDTIOA2Control .cold.1(void *a1, unsigned int a2, uint8_t *buf, os_log_t log)
{
  int v5 = HIBYTE(a2);
  if ((a2 - 0x20000000) >> 24 >= 0x5F) {
    int v5 = 32;
  }
  int v6 = BYTE2(a2);
  if (BYTE2(a2) - 32 >= 0x5F) {
    int v6 = 32;
  }
  int v7 = BYTE1(a2);
  if (BYTE1(a2) - 32 >= 0x5F) {
    int v7 = 32;
  }
  *(_DWORD *)buf = 138413314;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  *((_WORD *)buf + 9) = 1024;
  *((_DWORD *)buf + 5) = v6;
  *((_WORD *)buf + 12) = 1024;
  *(_DWORD *)(buf + 26) = v7;
  if (a2 - 32 >= 0x5F) {
    int v8 = 32;
  }
  else {
    int v8 = a2;
  }
  *((_WORD *)buf + 15) = 1024;
  *((_DWORD *)buf + 8) = v8;
  _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "%@: Failed creating custom property for selector '%c%c%c%c'.", buf, 0x24u);
}

@end