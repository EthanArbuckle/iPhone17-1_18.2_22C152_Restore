@interface BrightnessSystemInternal
- (BOOL)isACombinableProperty:(id)a3;
- (BOOL)isAlsSupported;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)setCombinableProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (BrightnessSystemInternal)init;
- (id)adjustDictionaryToBeValidPropertyList:(id)a3;
- (id)copyPropertyForKey:(id)a3 client:(id)a4;
- (id)newAggregatedPropertyForCombinablePropertiesForKey:(id)a3;
- (void)clientConnectedWithExpObj:(id)a3;
- (void)clientDisconnectedWithExpObj:(id)a3;
- (void)dealloc;
- (void)destroyServer;
- (void)notifyClientsForProperty:(id)a3 key:(id)a4;
- (void)registerNotificationBlock:(id)a3;
- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4;
- (void)setNotificationProperties:(id)a3 forClient:(id)a4;
- (void)setOwnedProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (void)undoCombinablePropertiesForClient:(id)a3;
- (void)undoOwnedPropertiesForClient:(id)a3;
@end

@implementation BrightnessSystemInternal

uint64_t __57__BrightnessSystemInternal_notifyClientsForProperty_key___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    objc_opt_class();
    uint64_t result = objc_opt_isKindOfClass();
    if (result)
    {
      uint64_t result = [a3 indexOfObject:a1[4]];
      if (result != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ((*(unsigned char *)(a1[5] + 88) & 1) == 0
          || (uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 80), "objectForKey:", a2), "intValue"),
              result != 2))
        {
          if (*(void *)(a1[5] + 104))
          {
            v5 = *(NSObject **)(a1[5] + 104);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t inited = init_default_corebrightness_log();
            }
            v5 = inited;
          }
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v9, a2);
            _os_log_debug_impl(&dword_1BA438000, v5, OS_LOG_TYPE_DEBUG, "passed for client %@", v9, 0xCu);
          }
          return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 48), "objectForKey:", a2), "remoteObjectProxy"), "notifyChangedProperty:value:", a1[4], a1[6]);
        }
      }
    }
  }
  return result;
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke_87(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if ([*(id *)(*(void *)(a1 + 32) + 80) objectForKey:*(void *)(a1 + 40)])
  {
    v6 = (void *)[objc_alloc(NSNumber) initWithInt:0];
    if (v6)
    {
      [*(id *)(*(void *)(a1 + 32) + 80) setObject:v6 forKey:*(void *)(a1 + 40)];

      if (*(void *)(*(void *)(a1 + 32) + 104))
      {
        v3 = *(NSObject **)(*(void *)(a1 + 32) + 104);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v3 = inited;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v7, *(void *)(a1 + 40));
        _os_log_debug_impl(&dword_1BA438000, v3, OS_LOG_TYPE_DEBUG, "BSI-barrier: Resetting state for client %@", v7, 0xCu);
      }
    }
  }
  return objc_sync_exit(obj);
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke_2(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(unsigned char *)(*(void *)(a1 + 32) + 88))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "enumerateKeysAndObjectsUsingBlock:");
    dispatch_time_t when = dispatch_time(0, 10000000000);
    global_queue = dispatch_get_global_queue(17, 0);
    dispatch_after(when, global_queue, *(dispatch_block_t *)(*(void *)(a1 + 32) + 96));
  }
  return objc_sync_exit(obj);
}

uint64_t __32__BrightnessSystemInternal_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (*(void *)(*(void *)(a1 + 32) + 16)
    && ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:a2] & 1) != 0)
  {
    char v8 = 0;
    if (CBU_IsAccessory())
    {
      char v8 = 1;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = (void *)[a3 valueForKey:@"Brightness"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 floatValue];
          if (v3 == *(float *)(*(void *)(a1 + 32) + 32))
          {
            char v8 = 0;
          }
          else
          {
            *(float *)(*(void *)(a1 + 32) + 32) = v3;
            char v8 = 1;
          }
        }
      }
    }
    if (v8) {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    }
  }
  objc_sync_exit(obj);
  return [*(id *)(a1 + 32) notifyClientsForProperty:a3 key:a2];
}

- (void)notifyClientsForProperty:(id)a3 key:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)a4, (uint64_t)a3);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "key=%@ property=%@", v9, 0x16u);
  }
  objc_sync_enter(self);
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_clientsProps, "enumerateKeysAndObjectsUsingBlock:");
  objc_sync_exit(self);
}

- (void)clientDisconnectedWithExpObj:(id)a3
{
  float v3 = (void *)[a3 copyClientID];
  [(BrightnessSystemInternal *)self undoOwnedPropertiesForClient:v3];
  [(BrightnessSystemInternal *)self undoCombinablePropertiesForClient:v3];
  objc_sync_enter(self);
  if (self->_clientsConnectionState)
  {
    [(NSMutableDictionary *)self->_clientsConnectionState removeObjectForKey:v3];
    if (![(NSMutableDictionary *)self->_clientsConnectionState count])
    {

      self->_clientsConnectionState = 0;
    }
  }
  if (self->_clientsProps)
  {
    [(NSMutableDictionary *)self->_clientsProps removeObjectForKey:v3];
    if (![(NSMutableDictionary *)self->_clientsProps count])
    {

      self->_clientsProps = 0;
    }
  }
  if (self->_clients) {
    [(NSMutableDictionary *)self->_clients removeObjectForKey:v3];
  }

  objc_sync_exit(self);
}

- (void)undoOwnedPropertiesForClient:(id)a3
{
  if (a3)
  {
    id v15 = 0;
    objc_sync_enter(self);
    if (self->_ownedProps)
    {
      if (objc_msgSend(a3, "isEqual:", -[NSMutableDictionary objectForKey:](self->_ownedProps, "objectForKey:", @"BypassBlueLightReduction")))
      {
        v14 = (void *)[objc_alloc(NSNumber) initWithInt:0];
        id v6 = objc_alloc(NSNumber);
        LODWORD(v3) = 2.0;
        v13 = (void *)[v6 initWithFloat:v3];
        if (v14)
        {
          if (v13)
          {
            v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v14, @"BypassBLRValue", v13, @"BypassBLRPeriod", 0);
            if (v12)
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              [v15 setValue:v12 forKey:@"BypassBlueLightReduction"];

              [(NSMutableDictionary *)self->_ownedProps removeObjectForKey:@"BypassBlueLightReduction"];
            }
          }
        }
      }
      if (objc_msgSend(a3, "isEqual:", -[NSMutableDictionary objectForKey:](self->_ownedProps, "objectForKey:", @"PreStrobe")))
      {
        v11 = (void *)[objc_alloc(NSNumber) initWithInt:0];
        if (v11)
        {
          if (!v15) {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v15 setValue:v11 forKey:@"PreStrobe"];

          [(NSMutableDictionary *)self->_ownedProps removeObjectForKey:@"PreStrobe"];
        }
      }
      if (objc_msgSend(a3, "isEqual:", -[NSMutableDictionary objectForKey:](self->_ownedProps, "objectForKey:", @"CBPersonaEnrollment")))
      {
        uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInt:0];
        if (v10)
        {
          if (!v15) {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          [v15 setValue:v10 forKey:@"CBPersonaEnrollment"];

          [(NSMutableDictionary *)self->_ownedProps removeObjectForKey:@"CBPersonaEnrollment"];
        }
      }
      if (objc_msgSend(a3, "isEqual:", -[NSMutableDictionary objectForKey:](self->_ownedProps, "objectForKey:", @"MinNits")))
      {
        v9 = (void *)[objc_alloc(NSNumber) initWithInt:0];
        id v5 = objc_alloc(NSNumber);
        LODWORD(v4) = 0.5;
        char v8 = (void *)[v5 initWithFloat:v4];
        if (v9)
        {
          if (v8)
          {
            v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v9, @"nits", v8, @"period", 0);
            if (v7)
            {
              if (!v15) {
                id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              }
              [v15 setValue:v7 forKey:@"MinNits"];

              [(NSMutableDictionary *)self->_ownedProps removeObjectForKey:@"MinNits"];
            }
          }
        }
      }
    }
    objc_sync_exit(self);
    if (v15)
    {
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:");
    }
  }
}

- (void)undoCombinablePropertiesForClient:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id obj = self;
  SEL v29 = a2;
  id v28 = a3;
  if (a3)
  {
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = obj;
    objc_sync_enter(obj);
    memset(__b, 0, sizeof(__b));
    id v16 = (id)*((void *)obj + 9);
    uint64_t v17 = [v16 countByEnumeratingWithState:__b objects:v33 count:16];
    if (v17)
    {
      uint64_t v12 = *(void *)__b[2];
      uint64_t v13 = 0;
      unint64_t v14 = v17;
      while (1)
      {
        uint64_t v11 = v13;
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(v16);
        }
        uint64_t v26 = 0;
        uint64_t v26 = *(void *)(__b[1] + 8 * v13);
        id v24 = 0;
        id v24 = (id)[*((id *)obj + 9) objectForKeyedSubscript:v26];
        if ([v24 objectForKeyedSubscript:v28])
        {
          [v24 removeObjectForKey:v28];
          os_log_t oslog = 0;
          if (*((void *)obj + 13))
          {
            uint64_t v10 = *((void *)obj + 13);
          }
          else
          {
            if (_COREBRIGHTNESS_LOG_DEFAULT) {
              uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
            }
            else {
              uint64_t inited = init_default_corebrightness_log();
            }
            uint64_t v10 = inited;
          }
          os_log_t oslog = v10;
          os_log_type_t type = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v32, (uint64_t)v28);
            _os_log_debug_impl(&dword_1BA438000, oslog, type, "undoCombinableProperties for client %@", v32, 0xCu);
          }
          [v27 addObject:v26];
        }
        ++v13;
        if (v11 + 1 >= v14)
        {
          uint64_t v13 = 0;
          unint64_t v14 = [v16 countByEnumeratingWithState:__b objects:v33 count:16];
          if (!v14) {
            break;
          }
        }
      }
    }
    objc_sync_exit(v15);
    memset(v20, 0, sizeof(v20));
    id v7 = v27;
    uint64_t v8 = [v27 countByEnumeratingWithState:v20 objects:v31 count:16];
    if (v8)
    {
      uint64_t v4 = *(void *)v20[2];
      uint64_t v5 = 0;
      unint64_t v6 = v8;
      while (1)
      {
        uint64_t v3 = v5;
        if (*(void *)v20[2] != v4) {
          objc_enumerationMutation(v7);
        }
        uint64_t v21 = 0;
        uint64_t v21 = *(void *)(v20[1] + 8 * v5);
        id v19 = (id)[obj newAggregatedPropertyForCombinablePropertiesForKey:v21];
        id v18 = (id)[objc_alloc(NSNumber) initWithLongLong:0x7FFFFFFFFFFFFFFFLL];
        [*((id *)obj + 1) setPropertyWithKey:v21 property:v19 client:v18];

        ++v5;
        if (v3 + 1 >= v6)
        {
          uint64_t v5 = 0;
          unint64_t v6 = [v7 countByEnumeratingWithState:v20 objects:v31 count:16];
          if (!v6) {
            break;
          }
        }
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char v8 = 1;
  id v7 = objc_alloc_init(MEMORY[0x1E4F29280]);
  if (v7)
  {
    [v7 setProtocol:&unk_1F141D690];
    unint64_t v6 = objc_alloc_init(BacklightdExportedObj);
    if (v6)
    {
      [(BacklightdExportedObj *)v6 setServer:self];
      [(BacklightdExportedObj *)v6 setConnection:a4];
      [a4 setExportedInterface:v7];
      [a4 setExportedObject:v6];
      id v5 = objc_alloc_init(MEMORY[0x1E4F29280]);
      if (v5)
      {
        [v5 setProtocol:&unk_1F141C100];
        [a4 setRemoteObjectInterface:v5];
        [(BrightnessSystemInternal *)self clientConnectedWithExpObj:v6];
        objc_msgSend(a4, "setInvalidationHandler:");
        objc_msgSend(a4, "setInterruptionHandler:");
        [a4 resume];
      }
      else
      {

        char v8 = 0;
      }
    }
    else
    {

      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (void)clientConnectedWithExpObj:(id)a3
{
  objc_sync_enter(self);
  if (!self->_clientsProps) {
    self->_clientsProps = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  uint64_t v4 = (void *)[a3 copyClientID];
  [(NSMutableDictionary *)self->_clientsProps setObject:v5 forKey:v4];

  if (!self->_clients) {
    self->_clients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  -[NSMutableDictionary setObject:forKey:](self->_clients, "setObject:forKey:", [a3 connection], v4);

  objc_sync_exit(self);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  if (!self->bl) {
    return 0;
  }
  [(BrightnessSystemInternal *)self setOwnedProperty:a3 forKey:a4 client:a5];
  if ([(BrightnessSystemInternal *)self isACombinableProperty:a4]) {
    return [(BrightnessSystemInternal *)self setCombinableProperty:a3 forKey:a4 client:a5];
  }
  else {
    return [(BLControl *)self->bl setPropertyWithKey:a4 property:a3 client:a5];
  }
}

- (BOOL)isACombinableProperty:(id)a3
{
  return (objc_msgSend(a3, "isEqual:", @"CoreBrightnessFeaturesDisabled", a3, a2, self) & 1) != 0;
}

- (void)setOwnedProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  if (a5 && a3 && a4)
  {
    char v8 = 0;
    BOOL v7 = 0;
    if ([a4 isEqual:@"BypassBlueLightReduction"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v6 = (void *)[a3 valueForKey:@"BypassBLRValue"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v8 = 1;
          BOOL v7 = [v6 intValue] == 0;
        }
      }
    }
    else if ([a4 isEqual:@"MinNits"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[a3 valueForKey:@"nits"];
        [a3 valueForKey:@"period"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v8 = 1;
            BOOL v7 = [v5 intValue] == 0;
          }
        }
      }
    }
    else if ([a4 isEqual:@"PreStrobe"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v8 = 1;
        BOOL v7 = [a3 intValue] == 0;
      }
    }
    else if ([a4 isEqual:@"CBPersonaEnrollment"])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v8 = 1;
        BOOL v7 = [a3 intValue] == 0;
      }
    }
    if (v8)
    {
      objc_sync_enter(self);
      if (!self->_ownedProps && !v7) {
        self->_ownedProps = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
      }
      if (self->_ownedProps)
      {
        if (v7) {
          [(NSMutableDictionary *)self->_ownedProps removeObjectForKey:a4];
        }
        else {
          [(NSMutableDictionary *)self->_ownedProps setObject:a5 forKey:a4];
        }
      }
      objc_sync_exit(self);
    }
  }
}

- (id)copyPropertyForKey:(id)a3 client:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "client=%@ key=%@", v14, 0x16u);
  }
  if ([a3 isEqual:@"CBSystemInitDuration"]) {
    return (id)[objc_alloc(NSNumber) initWithDouble:self->_initDuration];
  }
  if (!self->bl) {
    return 0;
  }
  if ([(BrightnessSystemInternal *)self isACombinableProperty:a3]) {
    id v9 = [(BrightnessSystemInternal *)self newAggregatedPropertyForCombinablePropertiesForKey:a3];
  }
  else {
    id v9 = [(BLControl *)self->bl copyPropertyWithKey:a3 client:a4];
  }
  id v8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = a3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = (id)[a3 getKeyString];
    }
  }
  if ([v8 isEqualToString:@"StatusInfo"])
  {
    context = (void *)MEMORY[0x1BA9ECAE0]();
    id v9 = [(BrightnessSystemInternal *)self adjustDictionaryToBeValidPropertyList:v9];
  }
  return v9;
}

- (void)setNotificationProperties:(id)a3 forClient:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)a4, (uint64_t)a3);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "client=%@ keys=%@", v10, 0x16u);
  }
  if (a3 && a4)
  {
    objc_sync_enter(self);
    [(NSMutableDictionary *)self->_clientsProps setObject:a3 forKey:a4];
    if (self->_checkConnections)
    {
      if ([a3 count])
      {
        if (!self->_clientsConnectionState) {
          self->_clientsConnectionState = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        if (![(NSMutableDictionary *)self->_clientsConnectionState objectForKey:a4])
        {
          unint64_t v6 = (void *)[objc_alloc(NSNumber) initWithInt:0];
          if (v6)
          {
            [(NSMutableDictionary *)self->_clientsConnectionState setObject:v6 forKey:a4];
          }
        }
      }
      else
      {
        [(NSMutableDictionary *)self->_clientsConnectionState removeObjectForKey:a4];
      }
    }
    objc_sync_exit(self);
  }
}

void __32__BrightnessSystemInternal_init__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [a3 intValue];
    if (v11)
    {
      if (v11 == 1)
      {
        if (*(void *)(*(void *)(a1 + 32) + 104))
        {
          uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 104);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          uint64_t v4 = inited;
        }
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v14, a2);
          _os_log_error_impl(&dword_1BA438000, v4, OS_LOG_TYPE_ERROR, "BSI-barrier: Disabling client %@", v14, 0xCu);
        }
        id v8 = (id)[objc_alloc(NSNumber) initWithInt:2];
        if (v8)
        {
          [*(id *)(*(void *)(a1 + 32) + 80) setObject:v8 forKey:a2];
        }
      }
    }
    else
    {
      uint64_t v10 = (void *)[objc_alloc(NSNumber) initWithInt:1];
      if (v10)
      {
        [*(id *)(*(void *)(a1 + 32) + 80) setObject:v10 forKey:a2];
      }
      id v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectForKey:a2];
      if (*(void *)(*(void *)(a1 + 32) + 104))
      {
        unint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 104);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v5 = init_default_corebrightness_log();
        }
        unint64_t v6 = v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, a2, (uint64_t)v9);
        _os_log_debug_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEBUG, "BSI-barrier: Sending barrier to client %@, connection %@", v15, 0x16u);
      }
      objc_msgSend(v9, "scheduleSendBarrierBlock:");
    }
  }
}

void __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
}

void __63__BrightnessSystemInternal_listener_shouldAcceptNewConnection___block_invoke_2(id *a1)
{
}

- (void)destroyServer
{
  self->_checkConnections = 0;

  [(NSXPCListener *)self->_listener invalidate];
  [(BLControl *)self->bl stop];
  [(BrightnessSystemInternal *)self registerNotificationBlock:0];
  if (self->_clients) {
    [(NSMutableDictionary *)self->_clients enumerateKeysAndObjectsUsingBlock:&__block_literal_global_3];
  }
  objc_sync_exit(self);
}

uint64_t __41__BrightnessSystemInternal_destroyServer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result) {
    return [a3 invalidate];
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;

  v4->_listener = 0;
  v4->bl = 0;

  v4->_callbackProps = 0;
  v4->_ownedProps = 0;

  v4->_combinableProps = 0;
  v4->_clients = 0;

  v4->_clientsConnectionState = 0;
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)BrightnessSystemInternal;
  [(BrightnessSystemInternal *)&v2 dealloc];
}

- (BrightnessSystemInternal)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v30 = self;
  SEL v29 = a2;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  BOOL v27 = CFPreferencesGetAppBooleanValue(@"CBInitNotificationPreference", @"com.apple.CoreBrightness", 0) != 0;
  if (v27) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "postNotificationName:object:", @"CBSystemInitStart", 0);
  }
  v26.receiver = v30;
  v26.super_class = (Class)BrightnessSystemInternal;
  id v30 = [(BrightnessSystemInternal *)&v26 init];
  if (v30)
  {
    *((void *)v30 + 1) = objc_alloc_init(BLControl);
    *((void *)v30 + 3) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v30 + 13) = os_log_create("com.apple.CoreBrightness.BrightnessSystemInternal", "default");
    if (!*((void *)v30 + 13))
    {
      v25 = 0;
      uint64_t v10 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
      v25 = v10;
      char v24 = 16;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        log = v25;
        os_log_type_t type = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v23, 2u);
      }
    }
    if (*((void *)v30 + 1))
    {
      if ([*((id *)v30 + 1) start])
      {
        objc_super v2 = (void *)*((void *)v30 + 1);
        uint64_t v17 = MEMORY[0x1E4F143A8];
        int v18 = -1073741824;
        int v19 = 0;
        v20 = __32__BrightnessSystemInternal_init__block_invoke;
        uint64_t v21 = &unk_1E62190B8;
        id v22 = v30;
        objc_msgSend(v2, "registerNotificationBlock:");
        *((void *)v30 + 5) = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.backlightd"];
        if (*((void *)v30 + 5))
        {
          [*((id *)v30 + 5) setDelegate:v30];
          [*((id *)v30 + 5) resume];
        }
        *((unsigned char *)v30 + 88) = 1;
        uint64_t v11 = MEMORY[0x1E4F143A8];
        int v12 = -1073741824;
        int v13 = 0;
        unint64_t v14 = __32__BrightnessSystemInternal_init__block_invoke_2;
        uint64_t v15 = &unk_1E6218FE0;
        id v16 = v30;
        *((void *)v30 + 12) = [&v11 copy];
        dispatch_time_t when = dispatch_time(0, 10000000000);
        global_queue = dispatch_get_global_queue(17, 0);
        dispatch_after(when, global_queue, *((dispatch_block_t *)v30 + 12));
        *((CFAbsoluteTime *)v30 + 14) = CFAbsoluteTimeGetCurrent() - Current;
        if (*((void *)v30 + 13))
        {
          unint64_t v6 = *((void *)v30 + 13);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          unint64_t v6 = inited;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v31, *((void *)v30 + 14));
          _os_log_debug_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEBUG, "Init done after %0.4fs", v31, 0xCu);
        }
      }
      else
      {

        *((void *)v30 + 1) = 0;
        id v30 = 0;
      }
    }
  }
  if (v27) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C40], "defaultCenter"), "postNotificationName:object:", @"CBSystemInitDone", 0);
  }
  return (BrightnessSystemInternal *)v30;
}

- (id)adjustDictionaryToBeValidPropertyList:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v26 = self;
  SEL v25 = a2;
  id v24 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = (id)objc_opt_new();
    memset(__b, 0, sizeof(__b));
    id obj = v24;
    uint64_t v17 = [v24 countByEnumeratingWithState:__b objects:v29 count:16];
    if (v17)
    {
      uint64_t v13 = *(void *)__b[2];
      uint64_t v14 = 0;
      unint64_t v15 = v17;
      while (1)
      {
        uint64_t v12 = v14;
        if (*(void *)__b[2] != v13) {
          objc_enumerationMutation(obj);
        }
        id v22 = 0;
        id v22 = *(id *)(__b[1] + 8 * v14);
        uint64_t v11 = v23;
        uint64_t v10 = -[BrightnessSystemInternal adjustDictionaryToBeValidPropertyList:](v26, "adjustDictionaryToBeValidPropertyList:", [v24 objectForKeyedSubscript:v22]);
        objc_msgSend(v11, "setObject:forKey:", v10, objc_msgSend(v22, "description"));
        ++v14;
        if (v12 + 1 >= v15)
        {
          uint64_t v14 = 0;
          unint64_t v15 = [obj countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v15) {
            break;
          }
        }
      }
    }
    return v23;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = (id)objc_opt_new();
      memset(v18, 0, sizeof(v18));
      id v8 = v24;
      uint64_t v9 = [v24 countByEnumeratingWithState:v18 objects:v28 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)v18[2];
        uint64_t v6 = 0;
        unint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)v18[2] != v5) {
            objc_enumerationMutation(v8);
          }
          uint64_t v19 = 0;
          uint64_t v19 = *(void *)(v18[1] + 8 * v6);
          objc_msgSend(v20, "addObject:", -[BrightnessSystemInternal adjustDictionaryToBeValidPropertyList:](v26, "adjustDictionaryToBeValidPropertyList:", v19));
          ++v6;
          if (v4 + 1 >= v7)
          {
            uint64_t v6 = 0;
            unint64_t v7 = [v8 countByEnumeratingWithState:v18 objects:v28 count:16];
            if (!v7) {
              break;
            }
          }
        }
      }
      return v20;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v24;
      }
      else {
        return (id)[v24 description];
      }
    }
  }
}

- (BOOL)isAlsSupported
{
  BOOL v3 = 0;
  id cf1 = [(BrightnessSystemInternal *)self copyPropertyForKey:@"BLControlAlsSupported" client:0];
  if (cf1)
  {
    BOOL v3 = CFEqual(cf1, (CFTypeRef)*MEMORY[0x1E4F1CFD0]) != 0;
  }
  return v3;
}

- (void)registerNotificationBlock:(id)a3
{
}

- (void)registerNotificationBlock:(id)a3 forProperties:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = self;
  SEL v16 = a2;
  id v15 = a3;
  id v14 = a4;
  objc_sync_enter(self);
  if (v17->_callback)
  {
    _Block_release(v17->_callback);
    v17->_callback = 0;
  }
  if (v15) {
    v17->_callback = _Block_copy(v15);
  }
  [(NSMutableArray *)v17->_callbackProps removeAllObjects];
  if (v14)
  {
    memset(__b, 0, sizeof(__b));
    id obj = v14;
    uint64_t v9 = [v14 countByEnumeratingWithState:__b objects:v18 count:16];
    if (v9)
    {
      uint64_t v5 = *(void *)__b[2];
      uint64_t v6 = 0;
      unint64_t v7 = v9;
      while (1)
      {
        uint64_t v4 = v6;
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = 0;
        uint64_t v12 = *(void *)(__b[1] + 8 * v6);
        [(NSMutableArray *)v17->_callbackProps addObject:v12];
        ++v6;
        if (v4 + 1 >= v7)
        {
          uint64_t v6 = 0;
          unint64_t v7 = [obj countByEnumeratingWithState:__b objects:v18 count:16];
          if (!v7) {
            break;
          }
        }
      }
    }
    int v13 = 0;
  }
  else
  {
    int v13 = 1;
  }
  objc_sync_exit(self);
}

uint64_t __57__BrightnessSystemInternal_undoOwnedPropertiesForClient___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result) {
    return [*(id *)(*(void *)(a1 + 32) + 8) setPropertyWithKey:a2 property:a3 client:*(void *)(a1 + 40)];
  }
  return result;
}

- (BOOL)setCombinableProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_logHandle)
  {
    logHandle = self->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v20, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "setCombinableProperty %@ for key %@ and client %@", v20, 0x20u);
  }
  if (a3 && a4)
  {
    objc_sync_enter(self);
    if (!self->_combinableProps) {
      self->_combinableProps = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v12 = (id)[(NSMutableDictionary *)self->_combinableProps objectForKeyedSubscript:a4];
    if (!v12)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_combinableProps setObject:v12 forKeyedSubscript:a4];
    }
    if (self->_logHandle)
    {
      unint64_t v7 = self->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      unint64_t v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)self->_combinableProps);
      _os_log_debug_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEBUG, "setCombinableProperty _combinableProps is now %@", v19, 0xCu);
    }
    if (a5) {
      [v12 setObject:a3 forKeyedSubscript:a5];
    }
    else {
      [v12 setObject:a3 forKeyedSubscript:@"server"];
    }
    objc_sync_exit(self);
    id v11 = [(BrightnessSystemInternal *)self newAggregatedPropertyForCombinablePropertiesForKey:a4];
    id v10 = (id)[objc_alloc(NSNumber) initWithLongLong:0x7FFFFFFFFFFFFFFFLL];
    char v13 = [(BLControl *)self->bl setPropertyWithKey:a4 property:v11 client:v10];

    char v18 = v13 & 1;
  }
  else
  {
    char v18 = 0;
  }
  return v18 & 1;
}

- (id)newAggregatedPropertyForCombinablePropertiesForKey:(id)a3
{
  *(_DWORD *)&v27[8] = 0;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v57 = self;
  SEL v56 = a2;
  id v55 = a3;
  uint64_t v3 = objc_sync_enter(self);
  id v54 = 0;
  context = (void *)MEMORY[0x1BA9ECAE0](v3);
  *(void *)BOOL v27 = [v55 isEqual:@"CoreBrightnessFeaturesDisabled"];
  if (v27[0])
  {
    float v53 = 1.0;
    float v52 = 1.0;
    id v51 = 0;
    os_log_t v50 = 0;
    if (v57->_logHandle)
    {
      logHandle = v57->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      logHandle = inited;
    }
    os_log_t v50 = logHandle;
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v60, (uint64_t)v55, (uint64_t)v57->_combinableProps);
      _os_log_debug_impl(&dword_1BA438000, v50, type, "copyAggregatedPropertyForCombinablePropertiesForKey. key: %@, combinableProps: %@", v60, 0x16u);
    }
    if (v57->_combinableProps
      && [(NSMutableDictionary *)v57->_combinableProps objectForKeyedSubscript:v55]
      && objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v57->_combinableProps, "objectForKeyedSubscript:", v55), "count"))
    {
      char v48 = 0;
      char v47 = 0;
      float v46 = 2.0;
      char v45 = 0;
      float v44 = 0.0;
      float v43 = 10.0;
      float v42 = 10.0;
      char v41 = 0;
      char v40 = 0;
      memset(__b, 0, sizeof(__b));
      id obj = (id)[(NSMutableDictionary *)v57->_combinableProps objectForKeyedSubscript:v55];
      uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v59 count:16];
      if (v23)
      {
        uint64_t v20 = *(void *)__b[2];
        uint64_t v21 = *(void *)&v27[4];
        unint64_t v22 = v23;
        while (1)
        {
          uint64_t v19 = v21;
          if (*(void *)__b[2] != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v39 = 0;
          uint64_t v39 = *(void *)(__b[1] + 8 * v21);
          char v18 = (void *)[(NSMutableDictionary *)v57->_combinableProps objectForKeyedSubscript:v55];
          id v37 = (id)objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v39), "mutableCopy");
          id v4 = v37;
          if ([v37 objectForKeyedSubscript:@"Status"])
          {
            objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", @"Status"), @"DisableWPShift");
            if ([v37 objectForKeyedSubscript:@"FixBrightnessNits"]
              && (objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"Status"), "BOOLValue") & 1) != 0)
            {
              objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", @"FixBrightnessNits"), @"OverrideBrightnessWithFixedNits");
            }
            else if ([v37 objectForKeyedSubscript:@"FixBrightness"] {
                   && (objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"Status"), "BOOLValue") & 1) != 0)
            }
            {
              objc_msgSend(v37, "setObject:forKeyedSubscript:", objc_msgSend(v37, "objectForKeyedSubscript:", @"FixBrightness"), @"OverrideBrightnessWithFixedSliderPosition");
            }
          }
          BOOL v36 = [v37 objectForKeyedSubscript:@"OverrideBrightnessWithFixedNits"] != 0;
          char v35 = objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"DisableWPShift"), "BOOLValue") & 1;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"OverrideBrightnessWithFixedNits"), "floatValue");
          float v34 = v5;
          BOOL v33 = [v37 objectForKeyedSubscript:@"OverrideBrightnessWithFixedSliderPosition"] != 0;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"OverrideBrightnessWithFixedSliderPosition"), "floatValue");
          float v32 = v6;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"ReenablementRampPeriod"), "floatValue");
          float v31 = v7;
          objc_msgSend((id)objc_msgSend(v37, "objectForKeyedSubscript:", @"DisablementRampPeriod"), "floatValue");
          float v30 = v8;
          if ([v37 objectForKeyedSubscript:@"ReenablementRampPeriod"] && v31 < v42)
          {
            float v42 = v31;
            char v40 = 1;
          }
          if ([v37 objectForKeyedSubscript:@"DisablementRampPeriod"] && v30 < v43)
          {
            float v43 = v30;
            char v41 = 1;
          }
          if (v36) {
            char v48 = 1;
          }
          if (v33) {
            char v45 = 1;
          }
          if (v35) {
            char v47 = 1;
          }
          if (v34 > v46) {
            float v46 = v34;
          }
          *(float *)&double v9 = v32;
          if (v32 > v44)
          {
            *(float *)&double v9 = v32;
            float v44 = v32;
          }
          ++v21;
          if (v19 + 1 >= v22)
          {
            uint64_t v21 = *(void *)&v27[4];
            unint64_t v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v59, 16, v9);
            if (!v22) {
              break;
            }
          }
        }
      }
      id v51 = (id)[MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v47 & 1), @"DisableWPShift");
      if (v48)
      {
        *(float *)&double v10 = v46;
        objc_msgSend(v51, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v10), @"OverrideBrightnessWithFixedNits");
      }
      if (v45)
      {
        *(float *)&double v10 = v44;
        objc_msgSend(v51, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v10), @"OverrideBrightnessWithFixedSliderPosition");
      }
      if (v40) {
        float v17 = v42;
      }
      else {
        float v17 = 1.0;
      }
      *(float *)&double v10 = v17;
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v10), @"ReenablementRampPeriod");
      if (v41) {
        float v16 = v43;
      }
      else {
        float v16 = 1.0;
      }
      *(float *)&double v11 = v16;
      objc_msgSend(v51, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", v11), @"DisablementRampPeriod");
    }
    else
    {
      id v51 = (id)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:&unk_1F1418440];
    }
    id v54 = v51;
    if (v57->_logHandle)
    {
      id v15 = v57->_logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v14 = init_default_corebrightness_log();
      }
      id v15 = v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v54);
      _os_log_debug_impl(&dword_1BA438000, v15, OS_LOG_TYPE_DEBUG, "copyAggregatedPropertyForCombinablePropertiesForKey return dictionary %@", v58, 0xCu);
    }
  }
  id v13 = v54;
  objc_sync_exit(self);
  return v13;
}

@end