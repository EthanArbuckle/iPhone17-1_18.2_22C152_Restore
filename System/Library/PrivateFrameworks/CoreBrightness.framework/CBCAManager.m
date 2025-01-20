@interface CBCAManager
- (CBCAManager)initWithCADisplay:(id)a3 andQueue:(id)a4;
- (void)colorRampPropertyHandler:(id)a3;
- (void)dealloc;
- (void)displayBrightnessPropertyHandler:(id)a3;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)nitsThresholdPLCPropertyHandler:(id)a3;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)updateDigitalDimmingBrightnessScaler:(id)a3;
@end

@implementation CBCAManager

- (CBCAManager)initWithCADisplay:(id)a3 andQueue:(id)a4
{
  v23 = self;
  SEL v22 = a2;
  id v21 = a3;
  id v20 = a4;
  if (a3 && (id v15 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v16.receiver = v23;
    v16.super_class = (Class)CBCAManager;
    v23 = [(CBModule *)&v16 initWithQueue:v20];
    if (v23)
    {
      v23->_digitalDimmingBrightnessScaler = 1.0;
      v9 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
      v23->_currentlySetMatrix[0] = 1.0;
      v23->_currentlySetMatrix[1] = 0.0;
      v23->_currentlySetMatrix[2] = 0.0;
      v23->_currentlySetMatrix[3] = 0.0;
      v23->_currentlySetMatrix[4] = 1.0;
      v23->_currentlySetMatrix[5] = 0.0;
      v23->_currentlySetMatrix[6] = 0.0;
      v23->_currentlySetMatrix[7] = 0.0;
      v23->_currentlySetMatrix[8] = 1.0;
      v23->_currentlySetScaler = 1.0;
      context = (void *)MEMORY[0x1BA9ECAE0]();
      uint64_t v10 = NSString;
      os_log_t v4 = os_log_create("com.apple.CoreBrightness.CBCAManager", (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v21, "displayId")), "UTF8String"));
      v5 = context;
      v23->super._logHandle = (OS_os_log *)v4;
      id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v7 = objc_msgSend(v6, "initWithObjects:", v21, 0);
      v23->_displays = (NSMutableArray *)v7;
    }
    return v23;
  }
  else
  {
    v19 = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      os_log_t inited = (os_log_t)_COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      os_log_t inited = (os_log_t)init_default_corebrightness_log();
    }
    v19 = inited;
    unsigned __int8 v18 = 16;
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = v19;
      *(_DWORD *)type = v18;
      __os_log_helper_16_0_0(v17);
      _os_log_error_impl(&dword_1BA438000, log, type[0], "invalid display", v17, 2u);
    }

    v23 = 0;
    return 0;
  }
}

- (void)dealloc
{
  os_log_t v4 = self;
  SEL v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBCAManager;
  [(CBModule *)&v2 dealloc];
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
  if ([a3 isEqualToString:@"ColorRamp"])
  {
    [(CBCAManager *)self colorRampPropertyHandler:a4];
  }
  else if ([a3 isEqualToString:@"DisplayBrightness"])
  {
    [(CBCAManager *)self displayBrightnessPropertyHandler:a4];
  }
  else if ([a3 isEqualToString:@"nitsExceedsPLCThreshold"])
  {
    [(CBCAManager *)self nitsThresholdPLCPropertyHandler:a4];
  }
  else if ([a3 isEqualToString:@"UpdateDigitalDimmingBrightnessScaler"])
  {
    [(CBCAManager *)self updateDigitalDimmingBrightnessScaler:a4];
  }
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (void)updateDigitalDimmingBrightnessScaler:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_log_t v4 = (void *)[a3 objectForKey:@"Scaler"];
      if (v4)
      {
        [v4 floatValue];
        if (self->_digitalDimmingBrightnessScaler != v3)
        {
          self->_digitalDimmingBrightnessScaler = v3;
          -[NSMutableArray enumerateObjectsUsingBlock:](self->_displays, "enumerateObjectsUsingBlock:");
        }
      }
    }
  }
}

uint64_t __52__CBCAManager_updateDigitalDimmingBrightnessScaler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0 && *(void *)(a1 + 32) != -40)
  {
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      uint64_t v7 = inited;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v10, COERCE__INT64(*(float *)(*(void *)(a1 + 32) + 80)));
      _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_INFO, "Updating digital dimming brightness scaler to %f", v10, 0xCu);
    }
    float v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39D28], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(a2, "displayId"));
    uint64_t v4 = *(void *)(a1 + 32);
    *(float *)&double v5 = *(float *)(v4 + 76) * *(float *)(v4 + 80);
    return [v3 setColorMatrix:v4 + 40 scale:v5 rampDuration:0.0];
  }
  return result;
}

- (void)colorRampPropertyHandler:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_displays, "enumerateObjectsUsingBlock:");
  }
}

void __40__CBCAManager_colorRampPropertyHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = a1;
  id v42 = a2;
  uint64_t v41 = a3;
  uint64_t v40 = a4;
  uint64_t v39 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = 0;
    id v38 = (id)[*(id *)(a1 + 32) objectForKey:@"ColorRampTarget"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v37 = 0;
      id v36 = 0;
      id v36 = (id)[*(id *)(a1 + 32) objectForKey:@"ColorRampPeriod"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v36 doubleValue];
        uint64_t v37 = v4;
      }
      float v35 = 1.0;
      id v34 = 0;
      id v34 = (id)[*(id *)(a1 + 32) objectForKey:@"ColorScaler"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v34 floatValue];
        float v35 = v5;
      }
      if ([v38 count] == 9)
      {
        for (unsigned int i = 0; i < 9; ++i)
        {
          objc_msgSend((id)objc_msgSend(v38, "objectAtIndex:", i), "floatValue");
          v47[i] = v6;
        }
        os_log_t v32 = 0;
        if (*(void *)(*(void *)(a1 + 40) + 16))
        {
          id v21 = *(NSObject **)(*(void *)(a1 + 40) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t inited = init_default_corebrightness_log();
          }
          id v21 = inited;
        }
        os_log_t v32 = v21;
        os_log_type_t v31 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_3_4_0_8_64_8_0((uint64_t)v46, [v42 displayId], (uint64_t)v38, v37);
          _os_log_debug_impl(&dword_1BA438000, v32, v31, "pushing matrix to display %u CA: %@ with ramp period %f", v46, 0x1Cu);
        }
        __memcpy_chk();
        *(float *)(*(void *)(a1 + 40) + 76) = v35;
        uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39D28], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(v42, "displayId"));
        *(float *)&double v8 = v35 * *(float *)(*(void *)(a1 + 40) + 80);
        [v7 setColorMatrix:v47 scale:v8 rampDuration:*(double *)&v37];
        id v30 = 0;
        id v30 = (id)[*(id *)(a1 + 32) objectForKey:@"ColorRampWhitePointTarget"];
        if ([v30 count] == 2)
        {
          [v30 objectAtIndexedSubscript:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v30 objectAtIndexedSubscript:1];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              osos_log_t log = 0;
              if (*(void *)(*(void *)(a1 + 40) + 16))
              {
                v19 = *(NSObject **)(*(void *)(a1 + 40) + 16);
              }
              else
              {
                if (_COREBRIGHTNESS_LOG_DEFAULT) {
                  uint64_t v18 = _COREBRIGHTNESS_LOG_DEFAULT;
                }
                else {
                  uint64_t v18 = init_default_corebrightness_log();
                }
                v19 = v18;
              }
              osos_log_t log = v19;
              os_log_type_t v28 = OS_LOG_TYPE_INFO;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndex:", 0), "floatValue");
                *(double *)&uint64_t v17 = v9;
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndex:", 1), "floatValue");
                __os_log_helper_16_0_3_8_0_8_0_8_0((uint64_t)v45, v17, COERCE__INT64(v10), v37);
                _os_log_impl(&dword_1BA438000, oslog, v28, "pushing white point [%f, %f] with ramp period %f", v45, 0x20u);
              }
            }
          }
        }
      }
      else
      {
        os_log_t v27 = 0;
        if (*(void *)(*(void *)(a1 + 40) + 16))
        {
          objc_super v16 = *(NSObject **)(*(void *)(a1 + 40) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v15 = init_default_corebrightness_log();
          }
          objc_super v16 = v15;
        }
        os_log_t v27 = v16;
        os_log_type_t v26 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v44, [v38 count]);
          _os_log_error_impl(&dword_1BA438000, v27, v26, "Unexpected number or elements in the matrix (%lu)", v44, 0xCu);
        }
      }
    }
    else
    {
      os_log_t v25 = 0;
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        v14 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        v14 = v13;
      }
      os_log_t v25 = v14;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = v25;
        os_log_type_t v12 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_1BA438000, v11, v12, "Unexpected color ramp target type", v23, 2u);
      }
    }
  }
}

- (void)displayBrightnessPropertyHandler:(id)a3
{
  id v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    displays = v20->_displays;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __48__CBCAManager_displayBrightnessPropertyHandler___block_invoke;
    uint64_t v15 = &unk_1E62198C0;
    id v16 = v18;
    uint64_t v17 = v20;
    -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:");
  }
  else
  {
    osos_log_t log = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    osos_log_t log = logHandle;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = oslog;
      os_log_type_t v5 = type;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1BA438000, log, v5, "Unexpected brightness type", v8, 2u);
    }
  }
}

void __48__CBCAManager_displayBrightnessPropertyHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v35 = a1;
  id v34 = a2;
  uint64_t v33 = a3;
  uint64_t v32 = a4;
  uint64_t v31 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v30 = 0;
    id v30 = (id)[*(id *)(a1 + 32) objectForKeyedSubscript:@"NitsPhysical"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v30 floatValue];
      float v29 = v4;
      os_log_t v28 = 0;
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        id v16 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        id v16 = inited;
      }
      os_log_t v28 = v16;
      os_log_type_t v27 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v38, [v34 displayId], COERCE__INT64(v29));
        _os_log_impl(&dword_1BA438000, v28, v27, "pushing nits to CA: display=%u | nits=%f", v38, 0x12u);
      }
      os_log_t v26 = 0;
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        v14 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        v14 = v13;
      }
      os_log_t v26 = v14;
      os_signpost_type_t v25 = OS_SIGNPOST_INTERVAL_BEGIN;
      os_signpost_id_t v24 = 0xEEEEB0B5B2B2EEEELL;
      if (os_signpost_enabled(v14))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v37, [v34 displayId], COERCE__INT64(v29));
        _os_signpost_emit_with_name_impl(&dword_1BA438000, v26, v25, v24, "SetNits", "display=%u | nits=%f", v37, 0x12u);
      }
      os_log_type_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39D28], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(v34, "displayId"));
      *(float *)&double v6 = v29;
      [v5 setNits:v6];
      os_log_t v23 = 0;
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        int v12 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v11 = init_default_corebrightness_log();
        }
        int v12 = v11;
      }
      os_log_t v23 = v12;
      os_signpost_type_t v22 = OS_SIGNPOST_INTERVAL_END;
      os_signpost_id_t v21 = 0xEEEEB0B5B2B2EEEELL;
      if (os_signpost_enabled(v12))
      {
        __os_log_helper_16_0_2_4_0_8_0((uint64_t)v36, [v34 displayId], COERCE__INT64(v29));
        _os_signpost_emit_with_name_impl(&dword_1BA438000, v23, v22, v21, "SetNits", "display=%u | nits=%f", v36, 0x12u);
      }
      [*(id *)(a1 + 40) sendNotificationForKey:@"CBCACommit" andValue:*(void *)(a1 + 32)];
    }
    else
    {
      osos_log_t log = 0;
      if (*(void *)(*(void *)(a1 + 40) + 16))
      {
        float v10 = *(NSObject **)(*(void *)(a1 + 40) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v9 = init_default_corebrightness_log();
        }
        float v10 = v9;
      }
      osos_log_t log = v10;
      os_log_type_t v19 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = oslog;
        os_log_type_t v8 = v19;
        __os_log_helper_16_0_0(v18);
        _os_log_error_impl(&dword_1BA438000, v7, v8, "Unexpected nits type", v18, 2u);
      }
    }
  }
}

- (void)nitsThresholdPLCPropertyHandler:(id)a3
{
  id v20 = self;
  SEL v19 = a2;
  id v18 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    displays = v20->_displays;
    uint64_t v11 = MEMORY[0x1E4F143A8];
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __47__CBCAManager_nitsThresholdPLCPropertyHandler___block_invoke;
    uint64_t v15 = &unk_1E62198C0;
    id v16 = v20;
    id v17 = v18;
    -[NSMutableArray enumerateObjectsUsingBlock:](displays, "enumerateObjectsUsingBlock:");
  }
  else
  {
    osos_log_t log = 0;
    if (v20->super._logHandle)
    {
      logHandle = v20->super._logHandle;
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
    osos_log_t log = logHandle;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      os_log_t log = oslog;
      os_log_type_t v5 = type;
      __os_log_helper_16_0_0(v8);
      _os_log_error_impl(&dword_1BA438000, log, v5, "Unexpected PLC threshold type", v8, 2u);
    }
  }
}

uint64_t __47__CBCAManager_nitsThresholdPLCPropertyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    if (*(void *)(*(void *)(a1 + 32) + 16))
    {
      os_log_type_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      os_log_type_t v5 = inited;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (([*(id *)(a1 + 40) BOOLValue] ^ 1)) {
        float v3 = "ON";
      }
      else {
        float v3 = "OFF";
      }
      __os_log_helper_16_2_1_8_32((uint64_t)v8, (uint64_t)v3);
      _os_log_impl(&dword_1BA438000, v5, OS_LOG_TYPE_INFO, "pushing update in compositing to CA: %s", v8, 0xCu);
    }
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F39D28], "serverIfRunning"), "displayWithDisplayId:", objc_msgSend(a2, "displayId")), "setAllowsDisplayCompositing:", (objc_msgSend(*(id *)(a1 + 40), "BOOLValue") ^ 1) & 1);
  }
  return result;
}

@end