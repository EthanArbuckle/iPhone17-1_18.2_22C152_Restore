@interface BRInterfaceLegacy
+ (BOOL)_isTapState:(unint64_t)a3;
+ (id)interface;
- (BOOL)_disableState:(unint64_t)a3;
- (BOOL)_enableState:(unint64_t)a3;
- (BOOL)_servicesSetProperty:(void *)a3 forKey:(__CFString *)a4;
- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5;
- (BOOL)_setDefaultServicePropertiesOnService:(__IOHIDServiceClient *)a3;
- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5;
- (BOOL)enableStates:(id)a3 error:(id *)a4;
- (BOOL)isReady;
- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6;
- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4;
- (BOOL)tapOnly;
- (BRInterfaceLegacy)init;
- (id)description;
- (id)propertyList;
- (unint64_t)maxAssetSlots;
- (unint64_t)unusedAssetSlots;
- (void)_findServices;
- (void)dealloc;
- (void)init;
- (void)propertyList;
- (void)scheduleReadyNotificationWithBlock:(id)a3;
- (void)serviceAddedHandler:(__IOHIDServiceClient *)a3;
- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a3;
- (void)setTapOnly:(BOOL)a3;
@end

@implementation BRInterfaceLegacy

- (BRInterfaceLegacy)init
{
  v7.receiver = self;
  v7.super_class = (Class)BRInterfaceLegacy;
  v2 = [(BRInterface *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxAssetSlots = -1;
    v2->_unusedAssetSlots = -1;
    v2->_isReady = 0;
    v2->_client = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v3->_services = v4;
    if (v4)
    {
      v3->_block = 0;
      v3->_tapOnly = 0;
      v3->_doublePressTimeoutUs = 0;
      v3->_triplePressTimeoutUs = 0;
      v3->_doubleTapTimeoutUs = 0;
      v3->_tripleTapTimeoutUs = 0;
      v3->_longPressTimeoutUs = 0;
    }
    else
    {
      v6 = _BRLog_log_1;
      if (!_BRLog_log_1)
      {
        v6 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_1 = (uint64_t)v6;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[BRInterfaceLegacy init](v6);
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
  v4.super_class = (Class)BRInterfaceLegacy;
  [(BRInterface *)&v4 dealloc];
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)BRInterfaceLegacy;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithString:", -[BRInterface description](&v5, sel_description));
  [v3 appendFormat:@"Services: %@;\n", self->_services];
  objc_msgSend(v3, "appendFormat:", @"DoublePressTO: %lu;\n", self->_doublePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"TriplePressTO: %lu;\n", self->_triplePressTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"DoubleTapTO: %lu;\n", self->_doubleTapTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"TripleTapTO: %lu;\n", self->_tripleTapTimeoutUs);
  objc_msgSend(v3, "appendFormat:", @"LongPressTO: %lu;\n", self->_longPressTimeoutUs);
  return v3;
}

- (id)propertyList
{
  v7.receiver = self;
  v7.super_class = (Class)BRInterfaceLegacy;
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", -[BRInterface propertyList](&v7, sel_propertyList));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_doublePressTimeoutUs), @"DoublePressTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_triplePressTimeoutUs), @"TriplePressTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_doubleTapTimeoutUs), @"DoubleTapTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_tripleTapTimeoutUs), @"TripleTapTO");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_longPressTimeoutUs), @"LongPressTO");
  if (self->_tapOnly) {
    objc_super v4 = "Y";
  }
  else {
    objc_super v4 = "N";
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSString, "stringWithFormat:", @"%s;", v4),
    @"TapOnly");
  objc_super v5 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    objc_super v5 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v5;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceLegacy propertyList]();
  }
  return v3;
}

+ (id)interface
{
  v2 = objc_alloc_init(BRInterfaceLegacy);
  return v2;
}

- (void)_findServices
{
  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  self->_client = v3;
  if (v3)
  {
    IOHIDEventSystemClientSetMatchingMultiple();
    objc_super v4 = [(BRInterface *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __34__BRInterfaceLegacy__findServices__block_invoke;
    block[3] = &unk_2645C7E98;
    block[4] = self;
    dispatch_async((dispatch_queue_t)v4, block);
  }
}

void __34__BRInterfaceLegacy__findServices__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) queue];
  IOHIDEventSystemClientScheduleWithDispatchQueue();
  IOHIDEventSystemClientRegisterDeviceMatchingCallback();
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(*(IOHIDEventSystemClientRef *)(*(void *)(a1 + 32) + 56));
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
          uint64_t v4 = serviceAddedCallback(v4, *(void **)(a1 + 32), *(void *)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v4 = [(__CFArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        uint64_t v5 = v4;
      }
      while (v4);
    }
  }
}

- (void)serviceAddedHandler:(__IOHIDServiceClient *)a3
{
  -[NSMutableArray addObject:](self->_services, "addObject:");
  IOHIDServiceClientRegisterRemovalCallback();
  [(BRInterfaceLegacy *)self _setDefaultServicePropertiesOnService:a3];
  if (!self->_isReady)
  {
    self->_isReady = 1;
    if (self->_block)
    {
      dispatch_async((dispatch_queue_t)[(BRInterface *)self queue], self->_block);

      self->_block = 0;
    }
    else
    {
      uint64_t v5 = _BRLog_log_1;
      if (!_BRLog_log_1)
      {
        uint64_t v5 = os_log_create("com.apple.ButtonResolver", "default");
        _BRLog_log_1 = (uint64_t)v5;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[BRInterfaceLegacy serviceAddedHandler:](v5);
      }
    }
  }
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  services = self->_services;
  uint64_t v6 = [(NSMutableArray *)services countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(services);
      }
      long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      if (CFEqual(v10, a3)) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)services countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
    if (!v10) {
      goto LABEL_16;
    }
    long long v11 = _BRLog_log_1;
    if (!_BRLog_log_1)
    {
      long long v11 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_1 = (uint64_t)v11;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRInterfaceLegacy serviceRemovedHandler:]((__IOHIDServiceClient *)v10, v11);
    }
    [(NSMutableArray *)self->_services removeObject:v10];
  }
  else
  {
LABEL_16:
    v12 = _BRLog_log_1;
    if (!_BRLog_log_1)
    {
      v12 = os_log_create("com.apple.ButtonResolver", "default");
      _BRLog_log_1 = (uint64_t)v12;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[BRInterfaceLegacy serviceRemovedHandler:](a3, v12);
    }
  }
}

- (BOOL)_servicesSetProperty:(void *)a3 forKey:(__CFString *)a4
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  uint64_t v7 = _BRLog_log_1;
  if (!_BRLog_log_1)
  {
    uint64_t v7 = os_log_create("com.apple.ButtonResolver", "default");
    _BRLog_log_1 = (uint64_t)v7;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRInterfaceLegacy _servicesSetProperty:forKey:]();
  }
  uint64_t v8 = [(BRInterface *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke;
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

void __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  CFArrayRef v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = IOHIDServiceClientSetProperty(*(IOHIDServiceClientRef *)(*((void *)&v8 + 1)+ 8 * i), *(CFStringRef *)(a1 + 48), *(CFTypeRef *)(a1 + 56));
        if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          uint64_t v7 = _BRLog_log_1;
          if (!_BRLog_log_1)
          {
            uint64_t v7 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_1 = (uint64_t)v7;
          }
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
            __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke_cold_1();
          }
          return;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
}

- (BOOL)_setDefaultServicePropertiesOnService:(__IOHIDServiceClient *)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [&unk_26D3CD850 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(&unk_26D3CD850);
        }
        if (!IOHIDServiceClientSetProperty(a3, *(CFStringRef *)(*((void *)&v11 + 1) + 8 * v7), &unk_26D3CD390))
        {
          long long v9 = _BRLog_log_1;
          if (!_BRLog_log_1)
          {
            long long v9 = os_log_create("com.apple.ButtonResolver", "default");
            _BRLog_log_1 = (uint64_t)v9;
          }
          BOOL v8 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
          if (v8)
          {
            -[BRInterfaceLegacy _setDefaultServicePropertiesOnService:]();
            LOBYTE(v8) = 0;
          }
          return v8;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [&unk_26D3CD850 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)setGlobalConfigs:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)setConfigs:(id)a3 withAssets:(id)a4 forStates:(id)a5 error:(id *)a6
{
  uint64_t v16 = 0;
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  if ([a5 count])
  {
    uint64_t v11 = 0;
    while (1)
    {
      if (a3) {
        uint64_t v12 = [a3 objectAtIndexedSubscript:v11];
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = objc_msgSend((id)objc_msgSend(a5, "objectAtIndexedSubscript:", v11), "unsignedIntegerValue");
      if (v12 == [MEMORY[0x263EFF9D0] null]) {
        uint64_t v12 = 0;
      }
      if (![(BRInterfaceLegacy *)self tapOnly]
        || +[BRInterfaceLegacy _isTapState:v13])
      {
        [(BRInterfaceLegacy *)self _setConfig:v12 forState:v13 error:&v16];
        long long v14 = v16;
        if (v16) {
          break;
        }
      }
      if (++v11 >= (unint64_t)[a5 count])
      {
        long long v14 = v16;
        break;
      }
    }
    if (a6 && v14) {
      *a6 = v14;
    }
  }
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return v16 == 0;
}

- (BOOL)enableStates:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v16 = a4;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((![(BRInterfaceLegacy *)self tapOnly]
           || +[BRInterfaceLegacy _isTapState:](BRInterfaceLegacy, "_isTapState:", [v12 unsignedIntegerValue]))&& !-[BRInterfaceLegacy _enableState:](self, "_enableState:", objc_msgSend(v12, "unsignedIntegerValue")))
        {
          uint64_t v15 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870212 userInfo:0];
          BOOL v13 = v15 != 0;
          if (v16 && v15)
          {
            *uint64_t v16 = (id)v15;
            BOOL v13 = 1;
          }
          goto LABEL_12;
        }
      }
      uint64_t v9 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return !v13;
}

- (BOOL)disableStates:(id)a3 clearAsset:(BOOL)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"start"]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    long long v17 = a5;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(a3);
        }
        BOOL v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((![(BRInterfaceLegacy *)self tapOnly]
           || +[BRInterfaceLegacy _isTapState:](BRInterfaceLegacy, "_isTapState:", [v13 unsignedIntegerValue]))&& !-[BRInterfaceLegacy _disableState:](self, "_disableState:", objc_msgSend(v13, "unsignedIntegerValue")))
        {
          uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870212 userInfo:0];
          BOOL v14 = v16 != 0;
          if (v17 && v16)
          {
            *long long v17 = (id)v16;
            BOOL v14 = 1;
          }
          goto LABEL_12;
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_12:
  -[BRInterface timestampWithLabel:](self, "timestampWithLabel:", [NSString stringWithFormat:@"%@ %@", NSStringFromSelector(a2), @"end"]);
  return !v14;
}

- (void)scheduleReadyNotificationWithBlock:(id)a3
{
  uint64_t v5 = [(BRInterface *)self queue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__BRInterfaceLegacy_scheduleReadyNotificationWithBlock___block_invoke;
  v6[3] = &unk_2645C7EE8;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync((dispatch_queue_t)v5, v6);
  [(BRInterfaceLegacy *)self _findServices];
}

uint64_t __56__BRInterfaceLegacy_scheduleReadyNotificationWithBlock___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) copy];
  *(void *)(*(void *)(a1 + 32) + 72) = result;
  return result;
}

- (BOOL)_setConfig:(id)a3 forState:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"MaxTime"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v10 = 0;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v8 = 0;
  }
  switch(a4)
  {
    case 0uLL:
      uint64_t v11 = *MEMORY[0x263EFFB40];
      uint64_t v12 = @"PressCountTrackingEnabled";
      goto LABEL_12;
    case 2uLL:
      if (!v8) {
        goto LABEL_13;
      }
      if (![(BRInterfaceLegacy *)self _servicesSetProperty:v8 forKey:@"PressCountDoublePressTimeout"])goto LABEL_25; {
      BOOL v13 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v14 = 80;
      goto LABEL_23;
    case 4uLL:
      if (!v8) {
        goto LABEL_13;
      }
      if (![(BRInterfaceLegacy *)self _servicesSetProperty:v8 forKey:@"PressCountTriplePressTimeout"])goto LABEL_25; {
      BOOL v13 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v14 = 88;
      goto LABEL_23;
    case 6uLL:
      uint64_t v11 = *MEMORY[0x263EFFB40];
      uint64_t v12 = @"TapTrackingEnabled";
LABEL_12:
      if ([(BRInterfaceLegacy *)self _servicesSetProperty:v11 forKey:v12]) {
        goto LABEL_13;
      }
      goto LABEL_25;
    case 8uLL:
      if (!v8) {
        goto LABEL_13;
      }
      if (![(BRInterfaceLegacy *)self _servicesSetProperty:v8 forKey:@"DoubleTapTimeout"])goto LABEL_25; {
      BOOL v13 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v14 = 96;
      goto LABEL_23;
    case 0xAuLL:
      if (!v8) {
        goto LABEL_13;
      }
      if (![(BRInterfaceLegacy *)self _servicesSetProperty:v8 forKey:@"TripleTapTimeout"])goto LABEL_25; {
      BOOL v13 = (objc_class *)[v8 unsignedIntegerValue];
      }
      BOOL v10 = 0;
      uint64_t v14 = 104;
      goto LABEL_23;
    case 0xEuLL:
      if (v8)
      {
        if ([(BRInterfaceLegacy *)self _servicesSetProperty:v8 forKey:@"LongPressTimeout"])
        {
          BOOL v13 = (objc_class *)[v8 unsignedIntegerValue];
          BOOL v10 = 0;
          uint64_t v14 = 112;
LABEL_23:
          *(Class *)((char *)&self->super.super.isa + v14) = v13;
        }
        else
        {
LABEL_25:
          uint64_t v16 = (void *)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-536870199 userInfo:0];
          BOOL v10 = v16 != 0;
          if (a5 && v16)
          {
            *a5 = v16;
            BOOL v10 = 1;
          }
        }
      }
      else
      {
LABEL_13:
        BOOL v10 = 0;
      }
      return !v10;
    default:
      return !v10;
  }
}

- (BOOL)_enableState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = *MEMORY[0x263EFFB40];
      uint64_t v5 = @"PressCountTrackingEnabled";
      goto LABEL_14;
    case 2uLL:
      if (!self->_doublePressTimeoutUs) {
        goto LABEL_17;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"PressCountDoublePressTimeout";
      goto LABEL_14;
    case 4uLL:
      if (!self->_triplePressTimeoutUs) {
        goto LABEL_17;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"PressCountTriplePressTimeout";
      goto LABEL_14;
    case 6uLL:
      uint64_t v4 = *MEMORY[0x263EFFB40];
      uint64_t v5 = @"TapTrackingEnabled";
      goto LABEL_14;
    case 8uLL:
      if (!self->_doubleTapTimeoutUs) {
        goto LABEL_17;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"DoubleTapTimeout";
      goto LABEL_14;
    case 0xAuLL:
      if (!self->_tripleTapTimeoutUs) {
        goto LABEL_17;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"TripleTapTimeout";
      goto LABEL_14;
    case 0xEuLL:
      if (!self->_longPressTimeoutUs) {
        goto LABEL_17;
      }
      uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
      uint64_t v5 = @"LongPressTimeout";
LABEL_14:
      BOOL result = [(BRInterfaceLegacy *)self _servicesSetProperty:v4 forKey:v5];
      break;
    default:
LABEL_17:
      BOOL result = 1;
      break;
  }
  return result;
}

- (BOOL)_disableState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v3 = (void *)*MEMORY[0x263EFFB38];
      uint64_t v4 = @"PressCountTrackingEnabled";
      goto LABEL_3;
    case 2uLL:
      uint64_t v3 = &unk_26D3CD3A8;
      uint64_t v4 = @"PressCountDoublePressTimeout";
      goto LABEL_3;
    case 4uLL:
      uint64_t v3 = &unk_26D3CD3A8;
      uint64_t v4 = @"PressCountTriplePressTimeout";
      goto LABEL_3;
    case 6uLL:
      uint64_t v3 = (void *)*MEMORY[0x263EFFB38];
      uint64_t v4 = @"TapTrackingEnabled";
      goto LABEL_3;
    case 8uLL:
      uint64_t v3 = &unk_26D3CD3A8;
      uint64_t v4 = @"DoubleTapTimeout";
      goto LABEL_3;
    case 0xAuLL:
      uint64_t v3 = &unk_26D3CD3A8;
      uint64_t v4 = @"TripleTapTimeout";
      goto LABEL_3;
    case 0xEuLL:
      uint64_t v3 = &unk_26D3CD3A8;
      uint64_t v4 = @"LongPressTimeout";
LABEL_3:
      BOOL result = [(BRInterfaceLegacy *)self _servicesSetProperty:v3 forKey:v4];
      break;
    default:
      BOOL result = 1;
      break;
  }
  return result;
}

+ (BOOL)_isTapState:(unint64_t)a3
{
  return a3 - 6 < 6;
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

- (BOOL)tapOnly
{
  return self->_tapOnly;
}

- (void)setTapOnly:(BOOL)a3
{
  self->_tapOnly = a3;
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  CFArrayRef v2 = "-[BRInterfaceLegacy init]";
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "%s failed!", (uint8_t *)&v1, 0xCu);
}

- (void)propertyList
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_221782000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)serviceAddedHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_221782000, log, OS_LOG_TYPE_ERROR, "Unexpected error: block is nil!", v1, 2u);
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a1 .cold.1(__IOHIDServiceClient *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(a1);
  _os_log_error_impl(&dword_221782000, a2, OS_LOG_TYPE_ERROR, "No service removed for %@", (uint8_t *)&v3, 0xCu);
}

- (void)serviceRemovedHandler:(__IOHIDServiceClient *)a1 .cold.2(__IOHIDServiceClient *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(a1);
  _os_log_debug_impl(&dword_221782000, a2, OS_LOG_TYPE_DEBUG, "service removed: %@", (uint8_t *)&v3, 0xCu);
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

void __49__BRInterfaceLegacy__servicesSetProperty_forKey___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_221782000, v0, OS_LOG_TYPE_ERROR, "%s error setting property on service %@", (uint8_t *)v1, 0x16u);
}

- (void)_setDefaultServicePropertiesOnService:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_221782000, v0, OS_LOG_TYPE_ERROR, "%s error setting default property on service %@", (uint8_t *)v1, 0x16u);
}

@end