@interface BRInterfaceKeyboard
+ (id)interface;
- (BOOL)_disableState:(unint64_t)a3;
- (BOOL)_enableState:(unint64_t)a3;
- (BOOL)_servicesSetProperty:(void *)a3 forKey:(__CFString *)a4;
- (BOOL)_setCachedPropertiesOnService:(__IOHIDServiceClient *)a3;
- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5;
- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5;
- (BOOL)enableStates:(id)a3 error:(id *)a4;
- (BOOL)isReady;
- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6;
- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4;
- (BRInterfaceKeyboard)init;
- (NSMutableSet)services;
- (id)description;
- (id)propertyList;
- (unint64_t)maxAssetSlots;
- (unint64_t)unusedAssetSlots;
- (void)_findServices;
- (void)dealloc;
- (void)init;
- (void)propertyList;
- (void)scheduleReadyNotificationWithBlock:(id)a3;
@end

@implementation BRInterfaceKeyboard

- (BRInterfaceKeyboard)init
{
  v8.receiver = self;
  v8.super_class = (Class)BRInterfaceKeyboard;
  v2 = [(BRInterface *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxAssetSlots = -1;
    v2->_unusedAssetSlots = -1;
    v2->_isReady = 1;
    v2->_client = 0;
    uint64_t v4 = objc_opt_new();
    v3->_services = (NSMutableSet *)v4;
    if (v4 && (v5 = (NSMutableDictionary *)objc_opt_new(), v3->_propertyCache = v5, v3->_services))
    {
      [(NSMutableDictionary *)v5 setObject:&unk_26D3CD868 forKeyedSubscript:@"PressCountUsagePairs"];
      v3->_doublePressTimeoutUs = 0;
      v3->_triplePressTimeoutUs = 0;
      v3->_longPressTimeoutUs = 0;
    }
    else
    {
      v7 = _BRLog_log_2;
      if (!_BRLog_log_2)
      {
        v7 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_2 = (uint64_t)v7;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[BRInterfaceKeyboard init](v7);
      }

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  client = self->_client;
  if (client) {
    CFRelease(client);
  }
  v4.receiver = self;
  v4.super_class = (Class)BRInterfaceKeyboard;
  [(BRInterface *)&v4 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceKeyboard;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  [v3 appendFormat:@"Services: %@;\n", self->_services];
  objc_msgSend(v3, "appendFormat:", @"DoublePressTO: %lu;\n", self->_doublePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"TriplePressTO: %lu;\n", self->_triplePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"LongPressTO: %lu;\n", self->_longPressTimeoutUs);
  return v3;
}

- (id)propertyList
{
  v6.receiver = self;
  v6.super_class = (Class)BRInterfaceKeyboard;
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", -[BRInterface propertyList](&v6, sel_propertyList));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_doublePressTimeoutUs), @"DoublePressTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_triplePressTimeoutUs), @"TriplePressTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_longPressTimeoutUs), @"LongPressTO");
  objc_super v4 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    objc_super v4 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v4;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceKeyboard propertyList]();
  }
  return v3;
}

+ (id)interface
{
  v2 = objc_alloc_init(BRInterfaceKeyboard);
  return v2;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  v17 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  if ([a5 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      uint64_t v12 = a3 ? [a3 objectAtIndexedSubscript:v11] : 0;
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "unsignedIntegerValue");
      uint64_t v14 = v12 == [MEMORY[0x263EFF9D0] null] ? 0 : v12;
      [(BRInterfaceKeyboard *)self _setConfig:v14 forState:v13 error:&v17];
      v15 = v17;
      if (v17) {
        break;
      }
      if (++v11 >= (unint64_t)[a5 count])
      {
        v15 = v17;
        break;
      }
    }
    if (a6 && v15) {
      *a6 = v15;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return v17 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(a3);
        }
        if (!-[BRInterfaceKeyboard _enableState:](self, "_enableState:", [*(id *)(*((void *)&v15 + 1) + 8 * i) unsignedIntegerValue]))
        {
          uint64_t v14 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870212 userInfo:0];
          BOOL v12 = v14 != 0;
          if (a4 && v14)
          {
            *a4 = v14;
            BOOL v12 = 1;
          }
          goto LABEL_10;
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_10:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return !v12;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(a3);
        }
        if (!-[BRInterfaceKeyboard _disableState:](self, "_disableState:", [*(id *)(*((void *)&v16 + 1) + 8 * i) unsignedIntegerValue]))
        {
          long long v15 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870212 userInfo:0];
          BOOL v13 = v15 != 0;
          if (a5 && v15)
          {
            *a5 = v15;
            BOOL v13 = 1;
          }
          goto LABEL_10;
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_10:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return !v13;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  [(BRInterfaceKeyboard *)self _findServices];
  objc_super v5 = [(BRInterface *)self queue];
  dispatch_async((dispatch_queue_t)v5, a3);
}

- (void)_findServices
{
  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  self->_client = v3;
  if (v3)
  {
    IOHIDEventSystemClientSetMatching();
    objc_super v4 = [(BRInterface *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __36__BRInterfaceKeyboard__findServices__block_invoke;
    block[3] = &unk_2645C7E98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

void __36__BRInterfaceKeyboard__findServices__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) queue];
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterDeviceMatchingCallback();
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(*(void *)(a1 + 32) + 48));
  CFArrayRef v3 = v2;
  if (v2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    uint64_t v4 = [(__CFArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          LODWORD(v4) = serviceAddedCallback_0(v4, *(void **)(a1 + 32), *(IOHIDServiceClientRef *)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = v4;
      }
      while (v4);
    }
  }
}

- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5
{
  long long v8 = (void *)[a3 objectForKeyedSubscript:@"MaxTime"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v10 = 0;
  if ((isKindOfClass & 1) == 0) {
    long long v8 = 0;
  }
  switch(__ROR8__(a4, 1))
  {
    case 0:
      if ([(BRInterfaceKeyboard *)self _servicesSetProperty:*MEMORY[0x263EFFB40] forKey:@"PressCountTrackingEnabled"])
      {
        goto LABEL_16;
      }
      goto LABEL_18;
    case 1:
      if (!v8) {
        goto LABEL_16;
      }
      if (![(BRInterfaceKeyboard *)self _servicesSetProperty:v8 forKey:@"PressCountDoublePressTimeout"])goto LABEL_18; {
      long long v11 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v12 = 64;
      goto LABEL_15;
    case 2:
      if (!v8) {
        goto LABEL_16;
      }
      if (![(BRInterfaceKeyboard *)self _servicesSetProperty:v8 forKey:@"PressCountTriplePressTimeout"])goto LABEL_18; {
      long long v11 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v12 = 72;
      goto LABEL_15;
    case 7:
      if (v8)
      {
        if ([(BRInterfaceKeyboard *)self _servicesSetProperty:v8 forKey:@"LongPressTimeout"])
        {
          long long v11 = (objc_class *)[v8 unsignedIntegerValue];
          BOOL v10 = 0;
          uint64_t v12 = 80;
LABEL_15:
          *(Class *)((char *)&self->super.super.isa + v12) = v11;
        }
        else
        {
LABEL_18:
          uint64_t v14 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870199 userInfo:0];
          BOOL v10 = v14 != 0;
          if (a5 && v14)
          {
            *a5 = v14;
            BOOL v10 = 1;
          }
        }
      }
      else
      {
LABEL_16:
        BOOL v10 = 0;
      }
      return !v10;
    default:
      return !v10;
  }
}

- (BOOL)_enableState:(unint64_t)a3
{
  switch(__ROR8__(a3, 1))
  {
    case 0:
      uint64_t v4 = *MEMORY[0x263EFFB40];
      uint64_t v5 = @"PressCountTrackingEnabled";
      goto LABEL_9;
    case 1:
      if (!self->_doublePressTimeoutUs) {
        goto LABEL_12;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"PressCountDoublePressTimeout";
      goto LABEL_9;
    case 2:
      if (!self->_triplePressTimeoutUs) {
        goto LABEL_12;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"PressCountTriplePressTimeout";
      goto LABEL_9;
    case 7:
      if (!self->_longPressTimeoutUs) {
        goto LABEL_12;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"LongPressTimeout";
LABEL_9:
      BOOL result = [(BRInterfaceKeyboard *)self _servicesSetProperty:v4 forKey:v5];
      break;
    default:
LABEL_12:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)_disableState:(unint64_t)a3
{
  switch(__ROR8__(a3, 1))
  {
    case 0:
      CFArrayRef v3 = (void *)*MEMORY[0x263EFFB38];
      uint64_t v4 = @"PressCountTrackingEnabled";
      goto LABEL_3;
    case 1:
      CFArrayRef v3 = &unk_26D3CD420;
      uint64_t v4 = @"PressCountDoublePressTimeout";
      goto LABEL_3;
    case 2:
      CFArrayRef v3 = &unk_26D3CD420;
      uint64_t v4 = @"PressCountTriplePressTimeout";
      goto LABEL_3;
    case 7:
      CFArrayRef v3 = &unk_26D3CD420;
      uint64_t v4 = @"LongPressTimeout";
LABEL_3:
      BOOL result = [(BRInterfaceKeyboard *)self _servicesSetProperty:v3 forKey:v4];
      break;
    default:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)_servicesSetProperty:(void *)a3 forKey:(__CFString *)a4
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v7 = _BRLog_log_2;
  if (!_BRLog_log_2)
  {
    uint64_t v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_2 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceKeyboard _servicesSetProperty:forKey:]();
  }
  long long v8 = [(BRInterface *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke;
  v11[3] = &unk_2645C7F10;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a4;
  v11[7] = a3;
  dispatch_sync((dispatch_queue_t)v8, v11);
  BOOL v9 = *((unsigned char *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  CFArrayRef v2 = *(void **)(*(void *)(a1 + 32) + 112);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(*((void *)&v9 + 1)+ 8 * i), *(CFStringRef *)(a1 + 48), *(CFTypeRef *)(a1 + 56));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          uint64_t v7 = _BRLog_log_2;
          if (!_BRLog_log_2)
          {
            uint64_t v7 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_2 = (uint64_t)v7;
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke_cold_1();
          }
          return [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  return [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
}

- (BOOL)_setCachedPropertiesOnService:(__IOHIDServiceClient *)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = self->_propertyCache;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 136315650;
    long long v16 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v10 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
        long long v11 = (const void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_propertyCache, "objectForKeyedSubscript:", v10, v16);
        long long v12 = _BRLog_log_2;
        if (!_BRLog_log_2)
        {
          long long v12 = os_log_create("com.apple.ButtonResolver", "default");
          _BRLog_log_2 = (uint64_t)v12;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v16;
          v23 = "-[BRInterfaceKeyboard _setCachedPropertiesOnService:]";
          __int16 v24 = 2112;
          v25 = v11;
          __int16 v26 = 2112;
          CFStringRef v27 = v10;
          _os_log_debug_impl(&dword_221782000, v12, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", buf, 0x20u);
        }
        if (!IOHIDServiceClientSetProperty(a3, v10, v11))
        {
          uint64_t v14 = _BRLog_log_2;
          if (!_BRLog_log_2)
          {
            uint64_t v14 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_2 = (uint64_t)v14;
          }
          BOOL v13 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
          if (v13)
          {
            -[BRInterfaceKeyboard _setCachedPropertiesOnService:]();
            LOBYTE(v13) = 0;
          }
          return v13;
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (unint64_t)maxAssetSlots
{
  return self->_maxAssetSlots;
}

- (unint64_t)unusedAssetSlots
{
  return self->_unusedAssetSlots;
}

- (NSMutableSet)services
{
  return self->_services;
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  CFArrayRef v2 = "-[BRInterfaceKeyboard init]";
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

- (void)propertyList
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_221782000, v0, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)v1, 0x16u);
}

- (void)_servicesSetProperty:forKey:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_221782000, v2, OS_LOG_TYPE_DEBUG, "%s property: %@ key: %@", (uint8_t *)v3, 0x20u);
}

void __51__BRInterfaceKeyboard__servicesSetProperty_forKey___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_221782000, v0, OS_LOG_TYPE_ERROR, "%s error setting property on service %@", (uint8_t *)v1, 0x16u);
}

- (void)_setCachedPropertiesOnService:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_221782000, v0, OS_LOG_TYPE_ERROR, "%s error setting cached property on service %@", (uint8_t *)v1, 0x16u);
}

@end