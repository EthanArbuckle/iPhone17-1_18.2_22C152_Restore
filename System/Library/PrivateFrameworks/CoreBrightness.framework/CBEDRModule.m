@interface CBEDRModule
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBEDRModule)initWithQueue:(id)a3 display:(id)a4 colorModule:(id)a5 andDisplayModule:(id)a6;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)dealloc;
- (void)handleALSEvent:(id)a3;
- (void)handleBrightnessUpdate:(id)a3;
- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)handleTargetWhitepointUpdate:(id)a3;
- (void)start;
- (void)stop;
- (void)updateEDRState;
@end

@implementation CBEDRModule

- (CBEDRModule)initWithQueue:(id)a3 display:(id)a4 colorModule:(id)a5 andDisplayModule:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v49 = self;
  SEL v48 = a2;
  id v47 = a3;
  id v46 = a4;
  id v45 = a5;
  id v44 = a6;
  v43.receiver = self;
  v43.super_class = (Class)CBEDRModule;
  v49 = [(CBModule *)&v43 initWithQueue:a3];
  if (!v49) {
    return v49;
  }
  if (v46)
  {
    context = (void *)MEMORY[0x1BA9ECAE0]();
    os_log_t v6 = os_log_create("com.apple.CoreBrightness.EDR", (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v46, "displayId")), "UTF8String"));
    v49->super._logHandle = (OS_os_log *)v6;
  }
  else
  {
    os_log_t v7 = os_log_create("com.apple.CoreBrightness.EDR", "default");
    v49->super._logHandle = (OS_os_log *)v7;
  }
  if (!v49->super._logHandle)
  {
    v42 = 0;
    v28 = (_COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log());
    v42 = v28;
    char v41 = 16;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      log = v42;
      os_log_type_t type = v41;
      __os_log_helper_16_0_0(v40);
      _os_log_error_impl(&dword_1BA438000, log, type, "failed to create log handle", v40, 2u);
    }
  }
  v8 = (CADisplay *)v46;
  v49->_cadisplay = v8;
  v9 = (CBDisplayModuleHID *)v44;
  v49->_displayModule = v9;
  v10 = (CBColorModuleiOS *)v45;
  v49->_colorModule = v10;
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v49->_filters = v11;
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v49->_alsNodes = v12;
  v39 = objc_alloc_init(CBBrightestALSFilter);
  if (v39) {
    [(NSMutableArray *)v49->_filters addObject:v39];
  }

  v25 = (void *)[MEMORY[0x1E4F39D28] serverIfRunning];
  id v38 = (id)objc_msgSend(v25, "displayWithDisplayId:", objc_msgSend(v46, "displayId"));
  if (v38)
  {
    [v38 maximumLuminance];
    v49->_maxNits = v13;
    os_log_t v37 = 0;
    if (v49->super._logHandle)
    {
      logHandle = v49->super._logHandle;
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
    os_log_t v37 = logHandle;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v51, COERCE__INT64(v49->_maxNits));
      _os_log_impl(&dword_1BA438000, v37, v36, "maximum luminance if %f", v51, 0xCu);
    }
  }
  else
  {
    v49->_maxNits = 1500.0;
    v35 = 0;
    if (v49->super._logHandle)
    {
      v22 = v49->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v21 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v21 = init_default_corebrightness_log();
      }
      v22 = v21;
    }
    v35 = v22;
    char v34 = 16;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v19 = v35;
      os_log_type_t v20 = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_error_impl(&dword_1BA438000, v19, v20, "failed to retrieve CAWindowServerDisplay, defaulting the maximum luminance", v33, 2u);
    }
  }
  v49->_currentLux = 300.0;
  v49->_Ycomp = 1.0;
  v49->_currentNits = 0.0;
  v49->_prevLux = -1.0;
  v49->_prevNits = -1.0;
  v49->_prevMaxNits = -1.0;
  v49->_prevYcomp = -1.0;
  if (CBEDRServerStartServer()) {
    return v49;
  }
  v32 = 0;
  if (v49->super._logHandle)
  {
    v18 = v49->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t v17 = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t v17 = init_default_corebrightness_log();
    }
    v18 = v17;
  }
  v32 = v18;
  os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v32;
    os_log_type_t v16 = v31;
    __os_log_helper_16_0_0(v30);
    _os_log_impl(&dword_1BA438000, v15, v16, "Lib EDR missing. Not creating CBEDRModule", v30, 2u);
  }

  return 0;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)CBEDRModule;
  [(CBModule *)&v2 dealloc];
}

- (id)copyPropertyForKey:(id)a3
{
  return 0;
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)handleBrightnessUpdate:(id)a3
{
  v22 = self;
  SEL v21 = a2;
  id v20 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = (id)[v20 objectForKeyedSubscript:@"NitsPhysical"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v19 floatValue];
      v22->_currentNits = v3;
    }
    else
    {
      v18 = 0;
      if (v22->super._logHandle)
      {
        logHandle = v22->super._logHandle;
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
      v18 = logHandle;
      char v17 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v18;
        os_log_type_t type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_error_impl(&dword_1BA438000, log, type, "Unexpected nits type", v16, 2u);
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      v22->_currentNits = v4;
    }
    else
    {
      v15 = 0;
      if (v22->super._logHandle)
      {
        v8 = v22->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        v8 = v7;
      }
      v15 = v8;
      char v14 = 16;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v5 = v15;
        os_log_type_t v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, v5, v6, "Unexpected brightness data type", v13, 2u);
      }
    }
  }
}

- (void)handleTargetWhitepointUpdate:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = (void *)[a3 objectForKey:@"YWP"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFXFindBrightnessCompAlpha(self->_maxNits);
      float v7 = v3;
      float v6 = v3;
      [v8 floatValue];
      float v5 = (float)(v6 * (float)(1.0 / v4)) + 1.0 - v7;
      self->_Ycomp = v5;
    }
  }
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ([a3 isEqual:@"DisplayBrightness"])
  {
    [(CBEDRModule *)self handleBrightnessUpdate:a4];
    [(CBEDRModule *)self updateEDRState];
  }
  else if ([a3 isEqual:@"CBTargetWhitePoint"])
  {
    [(CBEDRModule *)self handleTargetWhitepointUpdate:a4];
    [(CBEDRModule *)self updateEDRState];
  }
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)start
{
  v12 = self;
  SEL v11 = a2;
  v10 = 0;
  if (self->super._logHandle)
  {
    logHandle = v12->super._logHandle;
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
  v10 = logHandle;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v8, 2u);
  }
  CBEDRServerAddDisplay([(CADisplay *)v12->_cadisplay displayId]);
  id v7 = [(CBColorModuleiOS *)v12->_colorModule copyPropertyForKey:@"CBTargetWhitePoint"];
  if (v7) {
    [(CBEDRModule *)v12 handleTargetWhitepointUpdate:v7];
  }

  id v6 = (id)[(CBDisplayModuleHID *)v12->_displayModule copyPropertyForKey:@"DisplayBrightness"];
  if (v6) {
    [(CBEDRModule *)v12 handleBrightnessUpdate:v6];
  }

  [(CBEDRModule *)v12 updateEDRState];
}

- (void)stop
{
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->super._logHandle)
  {
    logHandle = self->super._logHandle;
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
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(a3);
    __os_log_helper_16_2_1_8_66((uint64_t)v14, (uint64_t)RegistryID);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "new service ID = %{public}@", v14, 0xCu);
  }
  if (IOHIDServiceClientConformsTo(a3, 0x20u, 0x41u))
  {
    v10 = [[CBALSNode alloc] initWithALSServiceClient:a3];
    if (v10)
    {
      [(NSMutableArray *)self->_alsNodes addObject:v10];
      CFTypeRef cf = (CFTypeRef)IOHIDServiceClientCopyEvent();
      if (cf)
      {
        [(CBEDRModule *)self handleHIDEventInternal:cf from:a3];
        CFRelease(cf);
      }
      else
      {
        if (self->super._logHandle)
        {
          id v6 = self->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v5 = init_default_corebrightness_log();
          }
          id v6 = v5;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v13, (uint64_t)a3);
          _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "failed to copy event for ALS (%p)", v13, 0xCu);
        }
      }
    }
  }
  return 1;
}

- (void)handleALSEvent:(id)a3
{
  [a3 illuminance];
  *(float *)&double v3 = v3;
  self->_currentLux = *(float *)&v3;
  [(CBEDRModule *)self updateEDRState];
}

- (void)handleHIDEventInternal:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18 = self;
  SEL v17 = a2;
  os_log_type_t v16 = a3;
  uint64_t v15 = a4;
  id v14 = +[CBHIDEvent newEvent:a3 andService:a4];
  if (v14)
  {
    memset(__b, 0, sizeof(__b));
    obj = v18->_filters;
    uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
    if (v10)
    {
      uint64_t v6 = *(void *)__b[2];
      uint64_t v7 = 0;
      unint64_t v8 = v10;
      while (1)
      {
        uint64_t v5 = v7;
        if (*(void *)__b[2] != v6) {
          objc_enumerationMutation(obj);
        }
        id v13 = 0;
        id v13 = *(id *)(__b[1] + 8 * v7);
        id v11 = (id)[v13 filterEvent:v14];
        if (!v11) {
          break;
        }
        id v4 = v11;

        id v14 = v11;
        ++v7;
        if (v5 + 1 >= v8)
        {
          uint64_t v7 = 0;
          unint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:__b objects:v19 count:16];
          if (!v8) {
            break;
          }
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(CBEDRModule *)v18 handleALSEvent:v14];
    }
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  return 0;
}

uint64_t __35__CBEDRModule_handleHIDEvent_from___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 conformsToHIDServiceClient:*(void *)(a1 + 40)];
  if (result) {
    return [*(id *)(a1 + 32) handleHIDEventInternal:*(void *)(a1 + 48) from:*(void *)(a1 + 40)];
  }
  return result;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  id v13 = self;
  SEL v12 = a2;
  id v11 = a3;
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  int v6 = 1375731712;
  int v7 = 48;
  unint64_t v8 = __Block_byref_object_copy__13;
  os_log_type_t v9 = __Block_byref_object_dispose__13;
  uint64_t v10 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_alsNodes, "enumerateObjectsUsingBlock:");
  if (v5[5])
  {
    -[NSMutableArray enumerateObjectsUsingBlock:](v13->_filters, "enumerateObjectsUsingBlock:");
    [(NSMutableArray *)v13->_alsNodes removeObject:v5[5]];
  }
  _Block_object_dispose(&v4, 8);
  return 1;
}

uint64_t __38__CBEDRModule_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToHIDServiceClient:*(void *)(a1 + 40)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __38__CBEDRModule_removeHIDServiceClient___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forgetDataForService:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "alsService"));
}

- (void)updateEDRState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_currentLux == self->_prevLux
    && self->_currentNits == self->_prevNits
    && self->_maxNits == self->_prevMaxNits
    && self->_Ycomp == self->_prevYcomp)
  {
    if (self->super._logHandle)
    {
      logHandle = self->super._logHandle;
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
      __os_log_helper_16_0_1_4_0((uint64_t)v8, [(CADisplay *)self->_cadisplay displayId]);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "No update in properties -> skip update of EDR state for display = %d", v8, 8u);
    }
  }
  else
  {
    self->_prevLux = self->_currentLux;
    self->_prevNits = self->_currentNits;
    self->_prevMaxNits = self->_maxNits;
    self->_prevYcomp = self->_Ycomp;
    if (self->super._logHandle)
    {
      double v3 = self->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v2 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v2 = init_default_corebrightness_log();
      }
      double v3 = v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_5_4_0_8_0_8_0_8_0_8_0((uint64_t)v7, [(CADisplay *)self->_cadisplay displayId], COERCE__INT64(self->_currentNits), COERCE__INT64(self->_maxNits), COERCE__INT64(self->_currentLux), COERCE__INT64(self->_Ycomp));
      _os_log_debug_impl(&dword_1BA438000, v3, OS_LOG_TYPE_DEBUG, "Update EDR state for display = %d ; currentNits = %f ; maxNits = %f ; currentLux = %f ; Ycomp = %f",
        v7,
        0x30u);
    }
    CBEDRServerDisplayBrightness([(CADisplay *)self->_cadisplay displayId], self->_currentNits, self->_maxNits, self->_currentLux, self->_Ycomp);
  }
}

@end