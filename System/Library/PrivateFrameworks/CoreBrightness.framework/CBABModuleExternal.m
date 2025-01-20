@interface CBABModuleExternal
- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)getAggregatedLux:(float *)a3;
- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4;
- (BOOL)newALSService:(__IOHIDServiceClient *)a3;
- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4;
- (CBABModuleExternal)initWithDisplayModule:(id)a3 andQueue:(id)a4;
- (CBDisplayModule)displayModule;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (void)dealloc;
- (void)endFastRamp;
- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4;
- (void)sendNotificationForKey:(id)a3 withValue:(id)a4;
- (void)start;
- (void)stop;
- (void)storeCurveToPreferences;
- (void)updateAutoBrightnessState:(BOOL)a3;
- (void)updateAvailability;
- (void)updateBrightness;
- (void)updateBrightnessForce:(BOOL)a3 periodOverride:(BOOL)a4 period:(float)a5;
- (void)userBrightnessChangingHandler;
- (void)userBrightnessCommitHandler;
@end

@implementation CBABModuleExternal

- (CBABModuleExternal)initWithDisplayModule:(id)a3 andQueue:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v43 = self;
  SEL v42 = a2;
  id v41 = a3;
  id v40 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CBABModuleExternal;
  v43 = [(CBModule *)&v39 initWithQueue:a4];
  if (v43)
  {
    id v38 = (id)[v41 copyPropertyForKey:@"kUSBContainerID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((void *)v43 + 5) = [v38 copy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        *((void *)v43 + 5) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");
      }
    }

    id v38 = (id)[v41 copyPropertyForKey:@"DisplayUniqueID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((void *)v43 + 7) = [v38 copy];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        *((void *)v43 + 7) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");
      }
    }

    if (*((void *)v43 + 5))
    {
      *((void *)v43 + 6) = [*((id *)v43 + 5) copy];
    }
    else if (*((void *)v43 + 7))
    {
      *((void *)v43 + 6) = [*((id *)v43 + 7) copy];
    }
    else
    {
      v37 = 0;
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        inited = init_default_corebrightness_log();
      }
      v37 = inited;
      char v36 = 16;
      if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
      {
        log = v37;
        os_log_type_t type = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1BA438000, log, type, "error: no unique ID or contaienr ID - create ad-hoc UUID as backup", v35, 2u);
      }
      id v38 = objc_alloc_init(MEMORY[0x1E4F29128]);
      *((void *)v43 + 6) = objc_msgSend((id)objc_msgSend(v38, "UUIDString"), "copy");
    }
    id v34 = 0;
    id v34 = (id)[[NSString alloc] initWithFormat:@"com.apple.CBABModuleExternal.%@", *((void *)v43 + 6)];
    if (v34) {
      *((void *)v43 + 2) = os_log_create((const char *)[v34 cStringUsingEncoding:1], "default");
    }
    else {
      *((void *)v43 + 2) = os_log_create("com.apple.CBABModuleExternal", "default");
    }

    *((void *)v43 + 12) = v41;
    id v33 = (id)[v41 copyPropertyForKey:@"DisplayServicesIsBuiltInDisplay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *((unsigned char *)v43 + 91) = [v33 BOOLValue] & 1;
    }

    *((void *)v43 + 4) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    os_log_t v32 = 0;
    if (*((void *)v43 + 2))
    {
      v16 = *((void *)v43 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v15 = init_default_corebrightness_log();
      }
      v16 = v15;
    }
    os_log_t v32 = v16;
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_3_8_66_8_66_8_66((uint64_t)v47, (uint64_t)v41, *((void *)v43 + 5), *((void *)v43 + 7));
      _os_log_impl(&dword_1BA438000, v32, v31, "display = %{public}@ | container ID = %{public}@ | UUID = %{public}@", v47, 0x20u);
    }
    *((unsigned char *)v43 + 64) = 1;
    *((unsigned char *)v43 + 88) = 0;
    *((unsigned char *)v43 + 89) = 0;
    *((unsigned char *)v43 + 66) = 0;
    *((unsigned char *)v43 + 90) = 0;
    *((void *)v43 + 10) = [[CBABRamp alloc] initWithDisplayModule:*((void *)v43 + 12) andQueue:*((void *)v43 + 3)];
    if (*((void *)v43 + 7))
    {
      if (([*((id *)v43 + 6) isEqual:*((void *)v43 + 7)] & 1) == 0)
      {
        char v30 = 0;
        char v30 = +[CBPreferencesHandler migrateNestedPreferenceForAllUsersWithKey1:@"DisplayPreferences" key2:*((void *)v43 + 7) toKey:*((void *)v43 + 6)];
        if (v30)
        {
          os_log_t v29 = 0;
          if (*((void *)v43 + 2))
          {
            v14 = *((void *)v43 + 2);
          }
          else
          {
            uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
            v14 = v13;
          }
          os_log_t v29 = v14;
          os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_2_8_66_8_66((uint64_t)v46, *((void *)v43 + 7), *((void *)v43 + 6));
            _os_log_impl(&dword_1BA438000, v29, v28, "Preferences for key = %{public}@ were migrated to key = %{public}@", v46, 0x16u);
          }
        }
      }
    }
    id v27 = 0;
    id v27 = +[CBPreferencesHandler copyNestedPreferenceForKey1:@"DisplayPreferences" key2:*((void *)v43 + 6) key3:@"AutoBrightnessEnable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *((unsigned char *)v43 + 64) = [v27 BOOLValue] & 1;
      os_log_t oslog = 0;
      if (*((void *)v43 + 2))
      {
        v12 = *((void *)v43 + 2);
      }
      else
      {
        uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v12 = v11;
      }
      os_log_t oslog = v12;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v45, *((unsigned char *)v43 + 64) & 1);
        _os_log_impl(&dword_1BA438000, oslog, v25, "auto-brightness state loaded from preferences: %d", v45, 8u);
      }
    }

    id v24 = 0;
    id v24 = (id)[*((id *)v43 + 12) copyPropertyForKey:@"CBDisplayVendorID"];
    id v23 = 0;
    id v23 = (id)[*((id *)v43 + 12) copyPropertyForKey:@"CBDisplayProductID"];
    *((void *)v43 + 9) = [[CBABCurve alloc] initWithUUID:*((void *)v43 + 6) vendorID:v24 andProductID:v23];
    if (!*((void *)v43 + 9))
    {
      os_log_t v22 = 0;
      if (*((void *)v43 + 2))
      {
        v10 = *((void *)v43 + 2);
      }
      else
      {
        uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        v10 = v9;
      }
      os_log_t v22 = v10;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v7 = v22;
        os_log_type_t v8 = v21;
        __os_log_helper_16_0_0(v20);
        _os_log_error_impl(&dword_1BA438000, v7, v8, "failed to create curve module", v20, 2u);
      }
    }

    if (*((void *)v43 + 2))
    {
      v6 = *((void *)v43 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v5 = init_default_corebrightness_log();
      }
      v6 = v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_66((uint64_t)v44, *((void *)v43 + 9));
      _os_log_impl(&dword_1BA438000, v6, OS_LOG_TYPE_DEFAULT, "auto-brightness curve initialised: %{public}@", v44, 0xCu);
    }
  }
  return (CBABModuleExternal *)v43;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBABModuleExternal;
  [(CBModule *)&v2 dealloc];
}

- (void)start
{
  v10 = self;
  SEL v9 = a2;
  os_log_type_t v8 = 0;
  if (self->super._logHandle)
  {
    logHandle = v10->super._logHandle;
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
  os_log_type_t v8 = logHandle;
  char v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
  }
}

- (void)stop
{
  v10 = self;
  SEL v9 = a2;
  os_log_type_t v8 = 0;
  if (self->super._logHandle)
  {
    logHandle = v10->super._logHandle;
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
  os_log_type_t v8 = logHandle;
  char v7 = 2;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_debug_impl(&dword_1BA438000, log, type, (const char *)&unk_1BA61B929, v6, 2u);
  }
  [(CBABRamp *)v10->_ramp stopTransition];
}

- (id)copyPropertyForKey:(id)a3
{
  v4 = 0;
  if ([a3 isEqualToString:@"DisplayBrightnessAuto2"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_enabled];
  }
  if ([a3 isEqualToString:@"DisplayBrightnessAuto2Available"]) {
    return (id)[objc_alloc(NSNumber) initWithBool:self->_available];
  }
  return v4;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v11 = [(CBABModuleExternal *)self setPropertyInternal:a3 forKey:a4];
  if ([a4 isEqualToString:@"DisplayBrightnessAuto2"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(NSMutableArray *)self->_ALSServices count])
    {
      -[CBABModuleExternal updateAutoBrightnessState:](self, "updateAutoBrightnessState:", [a3 BOOLValue] & 1);
      char v11 = 1;
    }
  }
  else if ([a4 isEqualToString:@"DisplayBrightness2"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[a3 objectForKey:@"Commit"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if ([v10 BOOLValue]) {
          [(CBABModuleExternal *)self userBrightnessCommitHandler];
        }
        else {
          [(CBABModuleExternal *)self userBrightnessChangingHandler];
        }
        char v11 = 1;
      }
    }
  }
  else if ([a4 isEqual:@"DisplayBrightnessFactorWithFade"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([a3 BOOLValue])
    {
      LODWORD(v4) = 1036831949;
      [(CBABModuleExternal *)self updateBrightnessForce:0 periodOverride:1 period:v4];
      if (self->super._logHandle)
      {
        logHandle = self->super._logHandle;
      }
      else
      {
        uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
        logHandle = v8;
      }
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v16, [a3 intValue]);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_INFO, "Receive brightness factor %d -> update brightness of ext display in short period.", v16, 8u);
      }
    }
  }
  if (self->super._logHandle)
  {
    char v7 = self->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    char v7 = inited;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_66_8_64_4_0((uint64_t)v15, (uint64_t)a4, (uint64_t)a3, v11 & 1);
    _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "key = %{public}@ | property = %@ | result = %d", v15, 0x1Cu);
  }
  return v11 & 1;
}

- (BOOL)setPropertyInternal:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)updateAutoBrightnessState:(BOOL)a3
{
  id v23 = self;
  SEL v22 = a2;
  BOOL v21 = a3;
  BOOL enabled = 0;
  BOOL enabled = self->_enabled;
  self->_BOOL enabled = a3;
  if (!v21 || enabled)
  {
    if (!v21) {
      [(CBABRamp *)v23->_ramp stopTransition];
    }
  }
  else
  {
    [(CBABCurve *)v23->_curve resetToDefaultState];
    [(CBABModuleExternal *)v23 storeCurveToPreferences];
    LODWORD(v3) = 0.5;
    [(CBABModuleExternal *)v23 updateBrightnessForce:1 periodOverride:1 period:v3];
  }
  if (enabled != v21)
  {
    if (v21) {
      uint64_t v4 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v4 = MEMORY[0x1E4F1CC28];
    }
    [(CBABModuleExternal *)v23 sendNotificationForKey:@"DisplayBrightnessAuto2" withValue:v4];
  }
  id v19 = 0;
  id v19 = (id)[objc_alloc(NSNumber) initWithBool:v23->_enabled];
  if (v19)
  {
    if (+[CBPreferencesHandler storeNestedPreferenceForAllUsersWithKey1:@"DisplayPreferences" key2:v23->_uniqueID key3:@"AutoBrightnessEnable" andValue:v19])
    {
      v18 = 0;
      if (v23->super._logHandle)
      {
        logHandle = v23->super._logHandle;
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
      char v17 = 2;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
      {
        log = v18;
        os_log_type_t type = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_debug_impl(&dword_1BA438000, log, type, "auto-brightness state preferences stored successfully", v16, 2u);
      }
    }
    else
    {
      uint64_t v15 = 0;
      if (v23->super._logHandle)
      {
        uint64_t v8 = v23->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v7 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v7 = init_default_corebrightness_log();
        }
        uint64_t v8 = v7;
      }
      uint64_t v15 = v8;
      char v14 = 16;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = v15;
        os_log_type_t v6 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_error_impl(&dword_1BA438000, v5, v6, "auto-brightness state preferences failed to store", v13, 2u);
      }
    }
  }
}

- (void)updateBrightness
{
}

- (void)updateBrightnessForce:(BOOL)a3 periodOverride:(BOOL)a4 period:(float)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  char v36 = self;
  SEL v35 = a2;
  BOOL v34 = a3;
  BOOL v33 = a4;
  float v32 = a5;
  if (!self->_enabled || v36->_updatesFrozen || v36->_suspendAutoBrightness || v36->_presetDisableAB)
  {
    if (v36->super._logHandle)
    {
      logHandle = v36->super._logHandle;
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
      __os_log_helper_16_0_4_4_0_4_0_4_0_4_0((uint64_t)v37, v36->_enabled, v36->_updatesFrozen, v36->_suspendAutoBrightness, v36->_presetDisableAB);
      _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "skip update (enabled=%i | frozen=%i | suspended=%i | presetDisableAB=%i)", v37, 0x1Au);
    }
  }
  else
  {
    float v31 = 0.0;
    float v30 = 0.0;
    if ([(CBABModuleExternal *)v36 getAggregatedLux:&v30])
    {
      *(float *)&double v5 = v30;
      if ([(CBABCurve *)v36->_curve setLux:v5])
      {
        [(CBABCurve *)v36->_curve getLinearBrightness];
        float v31 = v6;
        os_log_t v29 = 0;
        if (v36->super._logHandle)
        {
          v20 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v19 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v19 = init_default_corebrightness_log();
          }
          v20 = v19;
        }
        os_log_t v29 = v20;
        os_log_type_t v28 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v36->_curve);
          _os_log_debug_impl(&dword_1BA438000, v29, v28, "Curve Object: %@", v40, 0xCu);
        }
        os_log_t v27 = 0;
        if (v36->super._logHandle)
        {
          v18 = v36->super._logHandle;
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
        os_log_t v27 = v18;
        os_log_type_t v26 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v39, COERCE__INT64(v31), COERCE__INT64(v30));
          _os_log_impl(&dword_1BA438000, v27, v26, "Got brightness %f from Lux %f", v39, 0x16u);
        }
        if (v36->_fastRamp)
        {
          BOOL v33 = 1;
          float v32 = 0.5;
        }
        *(float *)&double v7 = v31;
        *(float *)&double v8 = v32;
        [(CBABRamp *)v36->_ramp transitionToBrightness:v34 force:v33 periodOverride:v7 period:v8];
      }
      else
      {
        os_log_t v25 = 0;
        if (v36->super._logHandle)
        {
          v16 = v36->super._logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v15 = init_default_corebrightness_log();
          }
          v16 = v15;
        }
        os_log_t v25 = v16;
        os_log_type_t v24 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v38, COERCE__INT64(v30));
          _os_log_error_impl(&dword_1BA438000, v25, v24, "Error retrieving brightness for lux %f", v38, 0xCu);
        }
      }
    }
    else
    {
      id v23 = 0;
      if (v36->super._logHandle)
      {
        char v14 = v36->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v13 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v13 = init_default_corebrightness_log();
        }
        char v14 = v13;
      }
      id v23 = v14;
      char v22 = 16;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        char v11 = v23;
        os_log_type_t v12 = v22;
        __os_log_helper_16_0_0(v21);
        _os_log_error_impl(&dword_1BA438000, v11, v12, "failed to retrieve aggregated lux value", v21, 2u);
      }
    }
  }
}

- (BOOL)newALSService:(__IOHIDServiceClient *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v33 = self;
  SEL v32 = a2;
  IOHIDServiceClientRef v31 = a3;
  char v30 = 0;
  id v29 = 0;
  char v28 = 0;
  id v27 = (id)IOHIDServiceClientCopyProperty(a3, @"kUSBContainerID");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = (id)objc_msgSend((id)objc_msgSend(v27, "UUIDString"), "copy");
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v26 = (id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v27];
      id v29 = (id)objc_msgSend((id)objc_msgSend(v26, "UUIDString"), "copy");
    }
  }
  id v25 = (id)IOHIDServiceClientCopyProperty(v31, @"Built-In");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v28 = [v25 BOOLValue] & 1;
  }

  os_log_t v24 = 0;
  if (v33->super._logHandle)
  {
    logHandle = v33->super._logHandle;
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
  os_log_t v24 = logHandle;
  os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_66_4_0((uint64_t)v37, (uint64_t)v29, v28 & 1);
    _os_log_impl(&dword_1BA438000, v24, v23, "sensor: containerID=%{public}@ builtIn=%i", v37, 0x12u);
  }
  if (([v29 isEqual:v33->_containerID] & 1) != 0 || (v28 & 1) == 1 && v33->_builtIn)
  {
    char v22 = [[CBALSService alloc] initWithHIDALSServiceClient:v31];
    if (v22)
    {
      os_log_t v21 = 0;
      if (v33->super._logHandle)
      {
        char v11 = v33->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v10 = init_default_corebrightness_log();
        }
        char v11 = v10;
      }
      os_log_t v21 = v11;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_0_1_8_0((uint64_t)v36, 0x4008000000000000);
        _os_log_impl(&dword_1BA438000, v21, v20, "Set fast ramp for %f sec", v36, 0xCu);
      }
      v33->_fastRamp = 1;
      dispatch_time_t v3 = dispatch_time(0, 3000000000);
      queue = v33->super._queue;
      uint64_t block = MEMORY[0x1E4F143A8];
      int v15 = -1073741824;
      int v16 = 0;
      uint64_t v17 = __36__CBABModuleExternal_newALSService___block_invoke;
      v18 = &unk_1E6218FE0;
      uint64_t v19 = v33;
      dispatch_after(v3, queue, &block);
      [(NSMutableArray *)v33->_ALSServices addObject:v22];
      char v30 = 1;
      if (v33->super._logHandle)
      {
        SEL v9 = v33->super._logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v8 = init_default_corebrightness_log();
        }
        SEL v9 = v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_66_4_0((uint64_t)v35, (uint64_t)v22, v30 & 1);
        _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "new ALS service added \n%{public}@, success=%d", v35, 0x12u);
      }
    }
  }
  else
  {
    if (v33->super._logHandle)
    {
      double v7 = v33->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v6 = init_default_corebrightness_log();
      }
      double v7 = v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_66_8_66((uint64_t)v34, (uint64_t)v29, (uint64_t)v33->_containerID);
      _os_log_impl(&dword_1BA438000, v7, OS_LOG_TYPE_DEFAULT, "service containerID (%{public}@) and display container ID (%{public}@) mismatch", v34, 0x16u);
    }
  }

  return v30 & 1;
}

uint64_t __36__CBABModuleExternal_newALSService___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endFastRamp", a1, a1);
}

- (BOOL)addHIDServiceClient:(__IOHIDServiceClient *)a3
{
  char v4 = 0;
  if (a3 && (IOHIDServiceClientConformsTo(a3, 0x20u, 0x41u) || IOHIDServiceClientConformsTo(a3, 0xFF00u, 4u)))
  {
    char v4 = [(CBABModuleExternal *)self newALSService:a3];
    if (v4) {
      [(CBABModuleExternal *)self updateBrightness];
    }
  }
  [(CBABModuleExternal *)self updateAvailability];
  return v4 & 1;
}

- (BOOL)removeHIDServiceClient:(__IOHIDServiceClient *)a3
{
  os_log_t v21 = self;
  SEL v20 = a2;
  uint64_t v19 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  int v14 = 1375731712;
  int v15 = 48;
  int v16 = __Block_byref_object_copy__11;
  uint64_t v17 = __Block_byref_object_dispose__11;
  uint64_t v18 = 0;
  ALSServices = self->_ALSServices;
  uint64_t v5 = MEMORY[0x1E4F143A8];
  int v6 = -1073741824;
  int v7 = 0;
  uint64_t v8 = __45__CBABModuleExternal_removeHIDServiceClient___block_invoke;
  SEL v9 = &unk_1E6219AB8;
  char v11 = a3;
  uint64_t v10 = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](ALSServices, "enumerateObjectsUsingBlock:");
  [(NSMutableArray *)v21->_ALSServices removeObject:v13[5]];
  [(CBABModuleExternal *)v21 updateAvailability];
  _Block_object_dispose(&v12, 8);
  return 1;
}

uint64_t __45__CBABModuleExternal_removeHIDServiceClient___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToHIDService:*(void *)(a1 + 40)];
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)updateAvailability
{
  if (!self->_available || [(NSMutableArray *)self->_ALSServices count])
  {
    if (!self->_available)
    {
      if ([(NSMutableArray *)self->_ALSServices count])
      {
        self->_available = 1;
        [(CBABModuleExternal *)self sendNotificationForKey:@"DisplayBrightnessAuto2Available" withValue:MEMORY[0x1E4F1CC38]];
      }
    }
  }
  else
  {
    self->_available = 0;
    [(CBABModuleExternal *)self sendNotificationForKey:@"DisplayBrightnessAuto2Available" withValue:MEMORY[0x1E4F1CC28]];
  }
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3 from:(__IOHIDServiceClient *)a4
{
  uint64_t v13 = self;
  SEL v12 = a2;
  char v11 = a3;
  uint64_t v10 = a4;
  if (!a3) {
    return 0;
  }
  if (IOHIDEventGetType() == 12)
  {
    uint64_t v5 = 0;
    int v6 = &v5;
    int v7 = 0x20000000;
    int v8 = 32;
    char v9 = 0;
    -[NSMutableArray enumerateObjectsUsingBlock:](v13->_ALSServices, "enumerateObjectsUsingBlock:");
    if (v6[3]) {
      [(CBABModuleExternal *)v13 updateBrightness];
    }
    _Block_object_dispose(&v5, 8);
  }
  return 1;
}

uint64_t __42__CBABModuleExternal_handleHIDEvent_from___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 conformsToHIDService:a1[5]];
  if (result)
  {
    uint64_t result = [a2 setEvent:a1[6]];
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)userBrightnessChangingHandler
{
  self->_updatesFrozen = 1;
}

- (void)userBrightnessCommitHandler
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v16 = self;
  SEL v15 = a2;
  [(CBABRamp *)self->_ramp stopTransition];
  v16->_updatesFrozen = 0;
  id v14 = 0;
  id v14 = [(CBDisplayModule *)v16->_displayModule copyPropertyForKey:@"DisplayBrightnessLinear"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_log_t v13 = 0;
    if (v16->super._logHandle)
    {
      logHandle = v16->super._logHandle;
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
    os_log_t v13 = logHandle;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v14);
      _os_log_impl(&dword_1BA438000, v13, v12, "user brightness commit (%@)", v17, 0xCu);
    }
    [(CBABRamp *)v16->_ramp stopTransition];
    curve = v16->_curve;
    [v14 floatValue];
    -[CBABCurve updateALSParametersForDisplayBrightness:](curve, "updateALSParametersForDisplayBrightness:");
    [(CBABModuleExternal *)v16 storeCurveToPreferences];
  }
  else
  {
    char v11 = 0;
    if (v16->super._logHandle)
    {
      uint64_t v5 = v16->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      uint64_t v5 = v4;
    }
    char v11 = v5;
    char v10 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_super v2 = v11;
      os_log_type_t v3 = v10;
      __os_log_helper_16_0_0(v9);
      _os_log_error_impl(&dword_1BA438000, v2, v3, "ERROR: user brightness commit - failed to retrieve current brightness", v9, 2u);
    }
  }
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return 0;
}

- (void)storeCurveToPreferences
{
  uint64_t v18 = self;
  SEL v17 = a2;
  id v16 = 0;
  id v16 = [(CBABCurve *)self->_curve copyUserPrefState];
  if (+[CBPreferencesHandler storeNestedPreferenceForAllUsersWithKey1:@"DisplayPreferences" key2:v18->_uniqueID key3:@"AutoBrightnessCurve" andValue:v16])
  {
    SEL v15 = 0;
    if (v18->super._logHandle)
    {
      logHandle = v18->super._logHandle;
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
    SEL v15 = logHandle;
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      log = v15;
      os_log_type_t type = v14;
      __os_log_helper_16_0_0(v13);
      _os_log_impl(&dword_1BA438000, log, type, "Curve preferences saved sucessfully", v13, 2u);
    }
  }
  else
  {
    os_log_type_t v12 = 0;
    if (v18->super._logHandle)
    {
      uint64_t v5 = v18->super._logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v4 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v4 = init_default_corebrightness_log();
      }
      uint64_t v5 = v4;
    }
    os_log_type_t v12 = v5;
    char v11 = 16;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_super v2 = v12;
      os_log_type_t v3 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_error_impl(&dword_1BA438000, v2, v3, "Curve preferences failed to save", v10, 2u);
    }
  }
}

- (void)sendNotificationForKey:(id)a3 withValue:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
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
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v9, (uint64_t)a3, (uint64_t)a4);
    _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "key=%@ value=%@", v9, 0x16u);
  }
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (void)handleNotificationForKey:(id)a3 withProperty:(id)a4
{
}

- (BOOL)getAggregatedLux:(float *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = self;
  SEL v18 = a2;
  SEL v17 = a3;
  uint64_t v12 = 0;
  os_log_t v13 = &v12;
  int v14 = 0x20000000;
  int v15 = 32;
  char v16 = 0;
  uint64_t v7 = 0;
  int v8 = (float *)&v7;
  int v9 = 0x20000000;
  int v10 = 32;
  int v11 = 0;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_ALSServices, "enumerateObjectsUsingBlock:");
  if (v19->super._logHandle)
  {
    logHandle  = v19->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle  = inited;
  }
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_0_8_64((uint64_t)v20, COERCE__INT64(v8[6]), (uint64_t)v19->_ALSServices);
    _os_log_debug_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEBUG, "lux=%f from: %@", v20, 0x16u);
  }
  *SEL v17 = v8[6];
  char v4 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v12, 8);
  return v4 & 1;
}

uint64_t __39__CBABModuleExternal_getAggregatedLux___block_invoke(uint64_t a1, void *a2)
{
  double v6 = *(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t result = [a2 lux];
  if (v6 < v3)
  {
    uint64_t result = objc_msgSend(a2, "lux", v6);
    *(float *)&double v4 = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)  = LODWORD(v4);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)  = 1;
  return result;
}

- (void)endFastRamp
{
  int v10 = self;
  SEL v9 = a2;
  int v8 = 0;
  if (self->super._logHandle)
  {
    logHandle  = v10->super._logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    logHandle  = inited;
  }
  int v8 = logHandle;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    log  = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "Fast ramp ends", v6, 2u);
  }
  v10->_fastRamp  = 0;
}

- (CBDisplayModule)displayModule
{
  return self->_displayModule;
}

@end