@interface BCAppleBacklightBrtControl
+ (id)copyAvailableControls;
+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4;
+ (void)copyAvailableControls;
- (BCAppleBacklightBrtControl)init;
- (BCAppleBacklightBrtControl)initWithService:(unsigned int)a3;
- (BOOL)parseAuroraCapabilities;
- (BOOL)setNits:(double)a3 error:(id *)a4;
- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5;
- (double)getNitsWithError:(id *)a3;
- (id)ID;
- (id)copyModuleIdentifier;
- (id)copyProperty:(id)a3 error:(id *)a4;
- (unint64_t)registryID;
- (void)dealloc;
- (void)parseAuroraCapabilities;
@end

@implementation BCAppleBacklightBrtControl

- (BOOL)setNits:(double)a3 error:(id *)a4
{
  if (self->_isDFR || self->_override)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 1;
    v7 = [(BCBrtControl *)self queue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44__BCAppleBacklightBrtControl_setNits_error___block_invoke;
    v10[3] = &unk_264D100F8;
    v10[5] = &v11;
    v10[6] = a4;
    v10[4] = self;
    *(double *)&v10[7] = a3;
    dispatch_sync((dispatch_queue_t)v7, v10);
    BOOL v8 = *((unsigned char *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v8 = 0;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:16];
    }
  }
  return v8;
}

+ (id)newMonitorWithHandler:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x23EC8DDF0](a1, a2);
  id v7 = &unk_26EB30BD8;
  BOOL v8 = dispatch_queue_create("com.apple.BCAppleBacklightBrtControl.global", 0);
  v9 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
  IONotificationPortSetDispatchQueue(v9, v8);
  if (a3) {
    v10 = _Block_copy(a3);
  }
  else {
    v10 = 0;
  }
  io_iterator_t notification = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke;
  v26[3] = &unk_264D10038;
  v26[4] = v10;
  uint64_t v11 = _newBlockWrapper(v26);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v20 = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v21 = &unk_264D10060;
  v24 = v9;
  v25 = v11;
  v22 = v8;
  v23 = v10;
  uint64_t v12 = IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", (CFDictionaryRef)&unk_26EB30BD8, (IOServiceMatchingCallback)_iokitCallback, v11, &notification);
  if (!v12)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_6;
    v17[3] = &__block_descriptor_44_e5_v8__0l;
    v17[4] = v11;
    io_iterator_t v18 = notification;
    dispatch_async(v8, v17);
    v15 = objc_alloc_init(BCBrtMonitor);
    [(BCBrtMonitor *)v15 setCancelHandler:v19];
    return v15;
  }
  uint64_t v13 = v12;
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR))
  {
    +[BCAppleBacklightBrtControl newMonitorWithHandler:error:]();
    if (!a4) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (a4) {
LABEL_9:
  }
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithIOKitError:v13];
LABEL_10:
  v20((uint64_t)v19);
  return 0;
}

uint64_t __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    uint64_t v5 = result;
    do
    {
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
      if (!_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = init_default_corebrightness_log();
      }
      if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v10 = v5;
        _os_log_impl(&dword_238363000, inited, OS_LOG_TYPE_DEFAULT, "BCAppleBacklightBrtControl: got back service %u", buf, 8u);
      }
      id v7 = [[BCAppleBacklightBrtControl alloc] initWithService:v5];
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        (*(void (**)(uint64_t, BCAppleBacklightBrtControl *))(v8 + 16))(v8, v7);
      }

      uint64_t result = IOIteratorNext(iterator);
      uint64_t v5 = result;
    }
    while (result);
  }
  return result;
}

__n128 __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2;
  v3[3] = &unk_264D10060;
  long long v1 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = v1;
  dispatch_async((dispatch_queue_t)v4, v3);
  return result;
}

void __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_2(uint64_t a1)
{
  inited = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
    inited = init_default_corebrightness_log();
  }
  if (os_log_type_enabled(inited, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_238363000, inited, OS_LOG_TYPE_DEFAULT, "BCAppleBacklightBrtControl: cleaning up monitor", v3, 2u);
  }
  IONotificationPortDestroy(*(IONotificationPortRef *)(a1 + 48));
  _freeBlockWrapper(*(const void ***)(a1 + 56));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 40));
}

uint64_t __58__BCAppleBacklightBrtControl_newMonitorWithHandler_error___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(**(void **)(a1 + 32) + 16))(**(void **)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (id)copyModuleIdentifier
{
  id v2 = [NSString alloc];
  return (id)[v2 initWithString:@"com.apple.BCBrtControl.AppleBacklight"];
}

- (BCAppleBacklightBrtControl)initWithService:(unsigned int)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  v119.receiver = self;
  v119.super_class = (Class)BCAppleBacklightBrtControl;
  long long v4 = [(BCBrtControl *)&v119 init];
  if (v4)
  {
    context = (void *)MEMORY[0x23EC8DDF0]();
    *((_DWORD *)v4 + 29) = a3;
    if (a3)
    {
      CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"IODisplayParameters", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      id v7 = CFProperty;
      if ([v4 logHandle])
      {
        os_log_t v8 = (os_log_t)[v4 logHandle];
      }
      else
      {
        v9 = _COREBRIGHTNESS_LOG_DEFAULT;
        if (_COREBRIGHTNESS_LOG_DEFAULT)
        {
LABEL_10:
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = CFProperty;
            _os_log_impl(&dword_238363000, v9, OS_LOG_TYPE_DEFAULT, "driver params = %{public}@", buf, 0xCu);
          }
          if (CFProperty)
          {
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"brightness"), "objectForKeyedSubscript:", @"min"), "doubleValue");
            *((void *)v4 + 15) = v12;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"brightness"), "objectForKeyedSubscript:", @"max"), "doubleValue");
            *((void *)v4 + 16) = v13;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"BrightnessMilliNits"), "objectForKeyedSubscript:", @"min"), "doubleValue");
            *((double *)v4 + 8) = v14 / 1000.0;
            *((void *)v4 + 7) = 0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"BrightnessMilliNits"), "objectForKeyedSubscript:", @"max"), "doubleValue");
            *((double *)v4 + 6) = v15 / 1000.0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"BrightnessMicroAmps"), "objectForKeyedSubscript:", @"min"), "doubleValue");
            *((double *)v4 + 17) = v16 * 1000.0;
            objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"BrightnessMicroAmps"), "objectForKeyedSubscript:", @"max"), "doubleValue");
            *((double *)v4 + 18) = v17 * 1000.0;
            if (*((double *)v4 + 16) < *((double *)v4 + 15)) {
              -[BCAppleBacklightBrtControl initWithService:]();
            }
            if (*((double *)v4 + 6) < *((double *)v4 + 8)) {
              -[BCAppleBacklightBrtControl initWithService:].cold.4();
            }
            v4[32] = 1;
            io_iterator_t v18 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"dfr-brightness-control", v5, 3u);
            id v19 = v18;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v18 getBytes:v4 + 160 length:1];
              if (v4[160]) {
                uint64_t v20 = MEMORY[0x263EFFA88];
              }
              else {
                uint64_t v20 = MEMORY[0x263EFFA80];
              }
              [*((id *)v4 + 5) setObject:v20 forKeyedSubscript:@"DFR"];
            }
            v21 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"dcp-brightness-node", v5, 3u);
            id v22 = v21;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v21 getBytes:v4 + 161 length:1];
              if (v4[161]) {
                uint64_t v23 = MEMORY[0x263EFFA88];
              }
              else {
                uint64_t v23 = MEMORY[0x263EFFA80];
              }
              [*((id *)v4 + 5) setObject:v23 forKeyedSubscript:@"DCP"];
            }
            if (!v4[160])
            {
              v24 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"energy-saving", v5, 3u);
              id v25 = v24;
              v4[163] = 1;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                [v24 getBytes:v4 + 163 length:1];
              }
              if (v4[163]) {
                uint64_t v26 = MEMORY[0x263EFFA88];
              }
              else {
                uint64_t v26 = MEMORY[0x263EFFA80];
              }
              [*((id *)v4 + 5) setObject:v26 forKeyedSubscript:@"BatterySavingFeatures"];
            }
            v27 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"thermal-mitigation", v5, 3u);
            id v28 = v27;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v27 getBytes:v4 + 168 length:8];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *((void *)v4 + 21)), @"ThermalMitigation");
              v29 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"thermal-mitigation-min-cap", v5, 3u);
              id v30 = v29;
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                *(_DWORD *)buf = 0;
                if ((unint64_t)[v29 length] >= 4)
                {
                  [v29 getBytes:buf length:4];
                  *(float *)&double v31 = (float)*(int *)buf * 0.000015259;
                  objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v31), @"ThermalMitigationMinCap");
                }
              }
            }
            v32 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"force-brightness-control", v5, 3u);
            id v33 = v32;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v32 getBytes:v4 + 162 length:1];
            }
            v34 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"backlight-marketing-table-force", v5, 3u);
            id v35 = v34;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              buf[0] = 0;
              [v34 getBytes:buf length:1];
              if (buf[0]) {
                uint64_t v36 = MEMORY[0x263EFFA88];
              }
              else {
                uint64_t v36 = MEMORY[0x263EFFA80];
              }
              [*((id *)v4 + 5) setObject:v36 forKeyedSubscript:@"NitsToUserBrightnessTableForce"];
            }
            v37 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"backlight-marketing-table", v5, 3u);
            id v38 = v37;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              inited = *((void *)v4 + 1);
              if (!inited)
              {
                inited = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  inited = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(inited, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_238363000, inited, OS_LOG_TYPE_INFO, "slider mapping retrieved from the backlight driver", buf, 2u);
              }
              unint64_t v40 = [v37 length];
              if (v40 >= 4)
              {
                uint64_t v41 = [v37 bytes];
                if (v41)
                {
                  unint64_t v42 = v40 >> 2;
                  v43 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v40 >> 2];
                  uint64_t v45 = 0;
                  if (v42 <= 1) {
                    unint64_t v42 = 1;
                  }
                  do
                  {
                    *(float *)&double v44 = (float)*(int *)(v41 + 4 * v45) * 0.000015259;
                    objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v44), v45++);
                  }
                  while (v42 != v45);
                  uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithArray:v43];
                  if (v46) {
                    [*((id *)v4 + 5) setObject:v46 forKeyedSubscript:@"NitsToUserBrightnessTable"];
                  }
                }
              }
            }
            if (![*((id *)v4 + 5) objectForKeyedSubscript:@"NitsToUserBrightnessTable"])
            {
              v47 = *((void *)v4 + 1);
              if (!v47)
              {
                v47 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v47 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_238363000, v47, OS_LOG_TYPE_INFO, "artificial slider mapping", buf, 2u);
              }
              [*((id *)v4 + 5) setObject:(id)copyNitsToUserMapping() forKeyedSubscript:@"NitsToUserBrightnessTable"];
            }
            v118 = 0;
            unint64_t v48 = load_float_array_from_edt(*((_DWORD *)v4 + 29), @"pil-aab-curve", &v118);
            v49 = v118;
            if (v118 && v48)
            {
              v50 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v48];
              for (uint64_t i = 0; i != v48; ++i)
              {
                LODWORD(v51) = *((_DWORD *)v118 + i);
                objc_msgSend(v50, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v51), i);
              }
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v50), @"PILAABCurve");
              v49 = v118;
            }
            free(v49);
            *(float *)&double v53 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), @"EDRSecondsPerStopRapid");
            float v54 = *(float *)&v53;
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v53), @"EDRSecondsPerStopRapid");
            v55 = *((void *)v4 + 1);
            if (!v55)
            {
              v55 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v55 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = v54;
              _os_log_impl(&dword_238363000, v55, OS_LOG_TYPE_INFO, "EDR APT seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&double v56 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), @"EDRSecondsPerStopDefault");
            float v57 = *(float *)&v56;
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v56), @"EDRSecondsPerStopDefault");
            v58 = *((void *)v4 + 1);
            if (!v58)
            {
              v58 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v58 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = v57;
              _os_log_impl(&dword_238363000, v58, OS_LOG_TYPE_INFO, "EDR seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&double v59 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), @"EDRExitSecondsPerStop");
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v59), @"EDRExitSecondsPerStop");
            v60 = *((void *)v4 + 1);
            if (!v60)
            {
              v60 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v60 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", @"EDRExitSecondsPerStop"), "floatValue");
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = v61;
              _os_log_impl(&dword_238363000, v60, OS_LOG_TYPE_INFO, "EDR EXIT seconds per stop default override to %f", buf, 0xCu);
            }
            *(float *)&double v62 = load_fixed_float_from_edt(*((_DWORD *)v4 + 29), @"EDRAuroraSecondsPerStop");
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v62), @"EDRAuroraSecondsPerStop");
            v63 = *((void *)v4 + 1);
            if (!v63)
            {
              v63 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                v63 = init_default_corebrightness_log();
              }
            }
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              objc_msgSend((id)objc_msgSend(*((id *)v4 + 5), "objectForKeyedSubscript:", @"EDRAuroraSecondsPerStop"), "floatValue");
              *(_DWORD *)buf = 134217984;
              *(double *)&uint8_t buf[4] = v64;
              _os_log_impl(&dword_238363000, v63, OS_LOG_TYPE_INFO, "EDR Aurora seconds per stop default override to %f", buf, 0xCu);
            }
            v65 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.CoreBrightness"];
            v66 = v65;
            if (v65)
            {
              [v65 synchronize];
              uint64_t v67 = [v66 objectForKey:@"EDRSecondsPerStopRapid"];
              if (v67)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [*((id *)v4 + 5) setObject:v67 forKeyedSubscript:@"EDRSecondsPerStopRapid"];
                  v68 = *((void *)v4 + 1);
                  if (!v68)
                  {
                    v68 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                      v68 = init_default_corebrightness_log();
                    }
                  }
                  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"EDRSecondsPerStopDefault";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v67;
                    _os_log_impl(&dword_238363000, v68, OS_LOG_TYPE_DEFAULT, "EDR APT seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              uint64_t v69 = [v66 objectForKey:@"EDRSecondsPerStopDefault"];
              if (v69)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [*((id *)v4 + 5) setObject:v69 forKeyedSubscript:@"EDRSecondsPerStopDefault"];
                  v70 = *((void *)v4 + 1);
                  if (!v70)
                  {
                    v70 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                      v70 = init_default_corebrightness_log();
                    }
                  }
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"EDRSecondsPerStopDefault";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v69;
                    _os_log_impl(&dword_238363000, v70, OS_LOG_TYPE_DEFAULT, "EDR seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              uint64_t v71 = [v66 objectForKey:@"EDRExitSecondsPerStop"];
              if (v71)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [*((id *)v4 + 5) setObject:v71 forKeyedSubscript:@"EDRExitSecondsPerStop"];
                  v72 = *((void *)v4 + 1);
                  if (!v72)
                  {
                    v72 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                      v72 = init_default_corebrightness_log();
                    }
                  }
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"EDRExitSecondsPerStop";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v71;
                    _os_log_impl(&dword_238363000, v72, OS_LOG_TYPE_DEFAULT, "EDR EXIT seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
              uint64_t v73 = [v66 objectForKey:@"EDRAuroraSecondsPerStop"];
              if (v73)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  [*((id *)v4 + 5) setObject:v73 forKeyedSubscript:@"EDRAuroraSecondsPerStop"];
                  v74 = *((void *)v4 + 1);
                  if (!v74)
                  {
                    v74 = _COREBRIGHTNESS_LOG_DEFAULT;
                    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                      v74 = init_default_corebrightness_log();
                    }
                  }
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = @"EDRAuroraSecondsPerStop";
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v73;
                    _os_log_impl(&dword_238363000, v74, OS_LOG_TYPE_DEFAULT, "EDR Aurora seconds per stop overrided in Defaults %@ = %@ \n", buf, 0x16u);
                  }
                }
              }
            }
            v75 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"EDRPotentialHeadroom", v5, 3u);
            id v76 = v75;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (int v117 = 0, (unint64_t)[v75 length] >= 4))
            {
              [v75 getBytes:&v117 length:4];
              *(float *)&double v77 = (float)v117 * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v77), @"EDRPotentialHeadroom");
              v78 = *((void *)v4 + 1);
              if (!v78)
              {
                v78 = _COREBRIGHTNESS_LOG_DEFAULT;
                if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                  v78 = init_default_corebrightness_log();
                }
              }
              if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
              {
                uint64_t v79 = [*((id *)v4 + 5) objectForKeyedSubscript:@"EDRPotentialHeadroom"];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v79;
                _os_log_impl(&dword_238363000, v78, OS_LOG_TYPE_INFO, "EDR POTENTIAL headroom retrieved from brightness node (%@)", buf, 0xCu);
              }
              v80 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"EDRReferenceHeadroom", v5, 3u);
              id v81 = v80;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (int v116 = 0, (unint64_t)[v80 length] >= 4))
              {
                [v80 getBytes:&v116 length:8];
                *(float *)&double v82 = (float)v116 * 0.000015259;
                objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v82), @"EDRReferenceHeadroom");
                v83 = *((void *)v4 + 1);
                if (!v83)
                {
                  v83 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v83 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                {
                  uint64_t v84 = [*((id *)v4 + 5) objectForKeyedSubscript:@"EDRReferenceHeadroom"];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v84;
                  _os_log_impl(&dword_238363000, v83, OS_LOG_TYPE_INFO, "EDR REFERENCE headroom retrieved from brightness node (%@)", buf, 0xCu);
                }
              }
              else
              {
                v87 = *((void *)v4 + 1);
                if (!v87)
                {
                  v87 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (!_COREBRIGHTNESS_LOG_DEFAULT) {
                    v87 = init_default_corebrightness_log();
                  }
                }
                if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = 0;
                  _os_log_impl(&dword_238363000, v87, OS_LOG_TYPE_INFO, "EDR REFERENCE headroom not found in brightness node - use default (%f)", buf, 0xCu);
                }
                [*((id *)v4 + 5) setObject:&unk_26EB30B90 forKeyedSubscript:@"EDRReferenceHeadroom"];
              }
            }
            else
            {
              if (v4[160]) {
                goto LABEL_153;
              }
              [*((id *)v4 + 5) setObject:&unk_26EB30BA0 forKeyedSubscript:@"EDRPotentialHeadroom"];
              [*((id *)v4 + 5) setObject:&unk_26EB30B90 forKeyedSubscript:@"EDRReferenceHeadroom"];
            }
            if (!v4[160]) {
              [*((id *)v4 + 5) setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"BuiltIn"];
            }
LABEL_153:
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v4 + 6)), @"MaxNits");
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v4 + 6)), @"MaxNitsPanel");
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)v4 + 8)), @"MinNits");
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "registryID")), @"RegistryID");
            *((void *)v4 + 19) = *((void *)v4 + 6);
            v88 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"edr-max-nits", v5, 3u);
            id v89 = v88;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(_DWORD *)buf = 0;
              [v88 getBytes:buf length:4];
              double v90 = (float)((float)*(int *)buf * 0.000015259);
              *((double *)v4 + 19) = v90;
            }
            else
            {
              double v90 = *((double *)v4 + 19);
            }
            objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v90), @"MaxNitsEDR");
            v91 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"user-accessible-max-nits", v5, 3u);
            id v92 = v91;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(_DWORD *)buf = 0;
              [v91 getBytes:buf length:4];
              *((double *)v4 + 6) = (float)((float)*(int *)buf * 0.000015259);
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:"), @"MaxNits");
            }
            v93 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"pcc-table", v5, 3u);
            id v94 = v93;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(_DWORD *)buf = 0;
              [v93 getBytes:buf length:4];
              *(float *)&double v95 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v95), @"PCCTable");
            }
            v96 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"pcc-ramp-time", v5, 3u);
            id v97 = v96;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(_DWORD *)buf = 0;
              [v96 getBytes:buf length:4];
              *(float *)&double v98 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v98), @"PCCRampTime");
            }
            v99 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"LmaxProduct", v5, 3u);
            id v100 = v99;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              *(_DWORD *)buf = 0;
              [v99 getBytes:buf length:4];
              *(float *)&double v101 = (float)*(int *)buf * 0.000015259;
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v101), @"LmaxProduct");
            }
            [v4 parseAuroraCapabilities];
            v102 = (void *)IORegistryEntrySearchCFProperty(*((_DWORD *)v4 + 29), "IOService", @"supports-dynamic-pil", v5, 3u);
            id v103 = v102;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              buf[0] = 0;
              [v102 getBytes:buf length:1];
              objc_msgSend(*((id *)v4 + 5), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", buf[0]), @"DynamicPIL");
            }
            if ([v4 logHandle])
            {
              os_log_t v104 = (os_log_t)[v4 logHandle];
            }
            else
            {
              v105 = _COREBRIGHTNESS_LOG_DEFAULT;
              if (_COREBRIGHTNESS_LOG_DEFAULT)
              {
LABEL_170:
                if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v106 = *((void *)v4 + 5);
                  *(_DWORD *)buf = 138543362;
                  *(void *)&uint8_t buf[4] = v106;
                  _os_log_impl(&dword_238363000, v105, OS_LOG_TYPE_DEFAULT, "capabilities = %{public}@", buf, 0xCu);
                }
                *(void *)buf = 0;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3052000000;
                v121 = __Block_byref_object_copy_;
                v122 = __Block_byref_object_dispose_;
                v123 = v4;
                v115[0] = MEMORY[0x263EF8330];
                v115[1] = 3221225472;
                v115[2] = __46__BCAppleBacklightBrtControl_initWithService___block_invoke;
                v115[3] = &unk_264D100D0;
                v115[4] = buf;
                *((void *)v4 + 22) = _newBlockWrapper(v115);
                v107 = IONotificationPortCreate(*MEMORY[0x263F0EC90]);
                *((void *)v4 + 23) = v107;
                IONotificationPortSetDispatchQueue(v107, (dispatch_queue_t)[v4 queue]);
                *((_DWORD *)v4 + 48) = 0;
                v108 = (IONotificationPort *)*((void *)v4 + 23);
                v109 = (void *)MEMORY[0x23EC8DDF0]();
                id v110 = &unk_26EB30BD8;
                if (!IOServiceAddMatchingNotification(v108, "IOServiceTerminate", (CFDictionaryRef)&unk_26EB30BD8, (IOServiceMatchingCallback)_iokitCallback, *((void **)v4 + 22), (io_iterator_t *)v4 + 48))goto LABEL_179; {
                if ([v4 logHandle])
                }
                {
                  os_log_t v111 = (os_log_t)[v4 logHandle];
                }
                else
                {
                  v112 = _COREBRIGHTNESS_LOG_DEFAULT;
                  if (_COREBRIGHTNESS_LOG_DEFAULT)
                  {
LABEL_177:
                    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR)) {
                      -[BCAppleBacklightBrtControl initWithService:].cold.5();
                    }
LABEL_179:
                    _Block_object_dispose(buf, 8);
                    goto LABEL_180;
                  }
                  os_log_t v111 = init_default_corebrightness_log();
                }
                v112 = v111;
                goto LABEL_177;
              }
              os_log_t v104 = init_default_corebrightness_log();
            }
            v105 = v104;
            goto LABEL_170;
          }
          if ([v4 logHandle])
          {
            os_log_t v85 = (os_log_t)[v4 logHandle];
          }
          else
          {
            v86 = _COREBRIGHTNESS_LOG_DEFAULT;
            if (_COREBRIGHTNESS_LOG_DEFAULT)
            {
LABEL_142:
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                -[BCAppleBacklightBrtControl initWithService:](v86);
              }
LABEL_144:

              long long v4 = 0;
LABEL_180:
              return (BCAppleBacklightBrtControl *)v4;
            }
            os_log_t v85 = init_default_corebrightness_log();
          }
          v86 = v85;
          goto LABEL_142;
        }
        os_log_t v8 = init_default_corebrightness_log();
      }
      v9 = v8;
      goto LABEL_10;
    }
    if ([v4 logHandle])
    {
      os_log_t v10 = (os_log_t)[v4 logHandle];
    }
    else
    {
      uint64_t v11 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_138:
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          -[BCAppleBacklightBrtControl initWithService:](v11);
        }
        goto LABEL_144;
      }
      os_log_t v10 = init_default_corebrightness_log();
    }
    uint64_t v11 = v10;
    goto LABEL_138;
  }
  return (BCAppleBacklightBrtControl *)v4;
}

uint64_t __46__BCAppleBacklightBrtControl_initWithService___block_invoke(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v5 = result;
    while (1)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(_DWORD **)(*(void *)(v6 + 8) + 40);
      if (v7)
      {
        if (v5 == v7[29]) {
          break;
        }
      }
      IOObjectRelease(v5);
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v5 = result;
      if (!result) {
        return result;
      }
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46__BCAppleBacklightBrtControl_initWithService___block_invoke_2;
    v8[3] = &unk_264D100A8;
    v8[4] = v6;
    return [v7 _runOnCallbackQueue:v8];
  }
  return result;
}

uint64_t __46__BCAppleBacklightBrtControl_initWithService___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle])
  {
    os_log_t inited = (os_log_t)[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) logHandle];
LABEL_3:
    v3 = inited;
    goto LABEL_5;
  }
  v3 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = init_default_corebrightness_log();
    goto LABEL_3;
  }
LABEL_5:
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_238363000, v3, OS_LOG_TYPE_DEFAULT, "Display disconnected", v6, 2u);
  }
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayInvalidHandler];
  if (result)
  {
    uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) displayInvalidHandler];
    return (*(uint64_t (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  }
  return result;
}

- (BCAppleBacklightBrtControl)init
{
  kern_return_t MatchingServices;
  uint64_t v6;
  io_iterator_t existing;

  v3 = (void *)MEMORY[0x23EC8DDF0](self, a2);
  id v4 = &unk_26EB30BD8;
  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x263F0EC90], (CFDictionaryRef)&unk_26EB30BD8, &existing);
  uint64_t v6 = 0;
  if (!MatchingServices) {
    uint64_t v6 = IOIteratorNext(existing);
  }
  return [(BCAppleBacklightBrtControl *)self initWithService:v6];
}

+ (id)copyAvailableControls
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  io_iterator_t existing = 0;
  mach_port_t v3 = *MEMORY[0x263F0EC90];
  id v4 = (void *)MEMORY[0x23EC8DDF0]();
  id v5 = &unk_26EB30BD8;
  if (IOServiceGetMatchingServices(v3, (CFDictionaryRef)&unk_26EB30BD8, &existing)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = existing == 0;
  }
  if (v6)
  {
    os_log_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    if (!_COREBRIGHTNESS_LOG_DEFAULT) {
      os_log_t inited = init_default_corebrightness_log();
    }
    if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
      +[BCAppleBacklightBrtControl copyAvailableControls]();
    }
  }
  else
  {
    uint64_t v8 = IOIteratorNext(existing);
    if (v8)
    {
      uint64_t v9 = v8;
      do
      {
        os_log_t v10 = [[BCAppleBacklightBrtControl alloc] initWithService:v9];
        if (v10)
        {
          uint64_t v11 = v10;
          [v2 addObject:v10];
        }
        uint64_t v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
  }
  if (existing) {
    IOObjectRelease(existing);
  }
  return v2;
}

- (unint64_t)registryID
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(*(&self->_backlightService + 1), &entryID);
  return entryID;
}

- (id)ID
{
  id result = self->super._id;
  if (!result)
  {
    id v4 = [NSString alloc];
    id v5 = (objc_class *)objc_opt_class();
    id result = (id)[v4 initWithFormat:@"%@-%llu", NSStringFromClass(v5), -[BCAppleBacklightBrtControl registryID](self, "registryID")];
    self->super._id = (NSString *)result;
  }
  return result;
}

- (void)dealloc
{
  io_object_t v3 = *(&self->_backlightService + 1);
  if (v3) {
    IOObjectRelease(v3);
  }
  _freeBlockWrapper((const void **)&self->_terminationCallback->var0);
  terminationNotifPort = self->_terminationNotifPort;
  if (terminationNotifPort) {
    IONotificationPortDestroy(terminationNotifPort);
  }
  io_object_t terminationIterator = self->_terminationIterator;
  if (terminationIterator) {
    IOObjectRelease(terminationIterator);
  }
  v6.receiver = self;
  v6.super_class = (Class)BCAppleBacklightBrtControl;
  [(BCBrtControl *)&v6 dealloc];
}

void __44__BCAppleBacklightBrtControl_setNits_error___block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x23EC8DDF0]();
  if (![*(id *)(a1 + 32) _checkIsValid:*(void *)(a1 + 48)]) {
    goto LABEL_14;
  }
  io_registry_entry_t v4 = *(_DWORD *)(*(void *)(a1 + 32) + 116);
  double v15 = @"brightness-nits";
  LODWORD(v3) = vcvtd_n_s64_f64(*(double *)(a1 + 56), 0x10uLL);
  v16[0] = [NSNumber numberWithInt:v3];
  uint64_t v5 = IORegistryEntrySetCFProperties(v4, (CFTypeRef)[NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1]);
  uint64_t v6 = [*(id *)(a1 + 32) logHandle];
  if (v5)
  {
    if (v6)
    {
      os_log_t inited = (os_log_t)[*(id *)(a1 + 32) logHandle];
    }
    else
    {
      uint64_t v8 = _COREBRIGHTNESS_LOG_DEFAULT;
      if (_COREBRIGHTNESS_LOG_DEFAULT)
      {
LABEL_10:
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __44__BCAppleBacklightBrtControl_setNits_error___block_invoke_cold_1();
        }
        if (*(void *)(a1 + 48))
        {
          char v11 = 0;
          **(void **)(a1 + 48) = [objc_alloc(MEMORY[0x263F087E8]) initWithIOKitError:v5];
          goto LABEL_15;
        }
LABEL_14:
        char v11 = 0;
        goto LABEL_15;
      }
      os_log_t inited = init_default_corebrightness_log();
    }
    uint64_t v8 = inited;
    goto LABEL_10;
  }
  if (v6)
  {
    os_log_t v9 = (os_log_t)[*(id *)(a1 + 32) logHandle];
LABEL_8:
    os_log_t v10 = v9;
    goto LABEL_17;
  }
  os_log_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t v9 = init_default_corebrightness_log();
    goto LABEL_8;
  }
LABEL_17:
  char v11 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    int v13 = 134217984;
    uint64_t v14 = v12;
    _os_log_impl(&dword_238363000, v10, OS_LOG_TYPE_INFO, "Setting nits to %f", (uint8_t *)&v13, 0xCu);
  }
LABEL_15:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
}

- (double)getNitsWithError:(id *)a3
{
  if (self->_isDFR || self->_override)
  {
    uint64_t v9 = 0;
    os_log_t v10 = (double *)&v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 0;
    uint64_t v5 = [(BCBrtControl *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __47__BCAppleBacklightBrtControl_getNitsWithError___block_invoke;
    block[3] = &unk_264D10120;
    block[5] = &v9;
    block[6] = a3;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)v5, block);
    double v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    double v6 = -1.0;
    if (a3) {
      *a3 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithBCError:16];
    }
  }
  return v6;
}

void __47__BCAppleBacklightBrtControl_getNitsWithError___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x23EC8DDF0]();
  double v3 = -1.0;
  if ([*(id *)(a1 + 32) _checkIsValid:*(void *)(a1 + 48)])
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(void *)(a1 + 32) + 116), @"IODisplayParameters", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    id v5 = CFProperty;
    if (CFProperty)
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(CFProperty, "objectForKeyedSubscript:", @"BrightnessMilliNits"), "objectForKeyedSubscript:", @"value"), "doubleValue");
      double v3 = v6 / 1000.0;
    }
    else if (*(void *)(a1 + 48))
    {
      **(void **)(a1 + 48) = [objc_alloc(MEMORY[0x263F087E8]) initWithBCError:19];
    }
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (BOOL)setProperty:(id)a3 value:(id)a4 error:(id *)a5
{
  if (!_isIOKitCompatible((uint64_t)a4))
  {
    if (!a5) {
      return 0;
    }
    uint64_t v9 = 18;
LABEL_7:
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithIOKitError:v9];
    BOOL result = 0;
    *a5 = v11;
    return result;
  }
  uint64_t v9 = IORegistryEntrySetCFProperty(*(&self->_backlightService + 1), (CFStringRef)a3, a4);
  BOOL result = v9 == 0;
  if (a5 && v9) {
    goto LABEL_7;
  }
  return result;
}

- (id)copyProperty:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (_isIOKitCompatible((uint64_t)a3))
  {
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(*(&self->_backlightService + 1), (CFStringRef)a3, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  }
  else
  {
    CFTypeRef CFProperty = 0;
    if (a4) {
      *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithIOKitError:18];
    }
  }
  if ([(BCBrtControl *)self logHandle])
  {
    os_log_t inited = [(BCBrtControl *)self logHandle];
LABEL_7:
    uint64_t v9 = inited;
    goto LABEL_9;
  }
  uint64_t v9 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    os_log_t inited = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_7;
  }
LABEL_9:
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (a4) {
      id v10 = *a4;
    }
    else {
      id v10 = 0;
    }
    int v12 = 138412802;
    id v13 = a3;
    __int16 v14 = 2112;
    CFTypeRef v15 = CFProperty;
    __int16 v16 = 2112;
    id v17 = v10;
    _os_log_impl(&dword_238363000, v9, OS_LOG_TYPE_INFO, "copyProperty(%@) = %@ (error: %@)", (uint8_t *)&v12, 0x20u);
  }
  return (id)CFProperty;
}

- (BOOL)parseAuroraCapabilities
{
  double v3 = (void *)MEMORY[0x23EC8DDF0](self, a2);
  int v65 = 0;
  unsigned __int8 v4 = load_int_from_edt(*(&self->_backlightService + 1), @"supports-aurora", &v65);
  if (v65) {
    BOOL v5 = v4;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    double v6 = (void *)[MEMORY[0x263EFF9A0] dictionary];
    unsigned int v64 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), @"aurora-ignore-peak-apce", &v64)) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v64), @"AuroraIgnorePeakAPCE");
    }
    *(float *)&double v7 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-cpms-threshold");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v7), @"AuroraCPMSThreshold");
    *(float *)&double v8 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-cpms-enter-multiplier");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v8), @"AuroraCPMSEnterMultiplier");
    *(void *)buf = 0;
    unint64_t float_array_from_edt = load_float_array_from_edt(*(&self->_backlightService + 1), @"aurora-enter-lux", buf);
    id v10 = *(void **)buf;
    if (*(void *)buf && float_array_from_edt)
    {
      uint64_t v11 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:float_array_from_edt];
      for (uint64_t i = 0; i != float_array_from_edt; ++i)
      {
        LODWORD(v12) = *(_DWORD *)(*(void *)buf + 4 * i);
        objc_msgSend(v11, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v12), i);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v11), @"AuroraEnterLux");
      id v10 = *(void **)buf;
    }
    free(v10);
    double v62 = 0;
    unint64_t v14 = load_float_array_from_edt(*(&self->_backlightService + 1), @"aurora-exit-lux", &v62);
    CFTypeRef v15 = v62;
    if (v62 && v14)
    {
      __int16 v16 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v14];
      for (uint64_t j = 0; j != v14; ++j)
      {
        LODWORD(v17) = *((_DWORD *)v62 + j);
        objc_msgSend(v16, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v17), j);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v16), @"AuroraExitLux");
      CFTypeRef v15 = v62;
    }
    free(v15);
    float v61 = 0;
    unint64_t v19 = load_float_array_from_edt(*(&self->_backlightService + 1), @"aurora-saturation-lux", &v61);
    uint64_t v20 = v61;
    if (v61 && v19)
    {
      v21 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v19];
      for (uint64_t k = 0; k != v19; ++k)
      {
        LODWORD(v22) = *((_DWORD *)v61 + k);
        objc_msgSend(v21, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v22), k);
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v21), @"AuroraSaturationLux");
      uint64_t v20 = v61;
    }
    free(v20);
    *(float *)&double v24 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-avrg-apce-sampling-rate");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v24), @"AuroraAverageAPCESamplingRate");
    *(float *)&double v25 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-ramp-up-speed");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v25), @"AuroraRampUpSpeed");
    *(float *)&double v26 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-ramp-down-speed");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v26), @"AuroraRampDownSpeed");
    v60 = 0;
    unint64_t v27 = load_float_array_from_edt(*(&self->_backlightService + 1), @"aurora-ramp-up-tap-points", &v60);
    if (v60)
    {
      uint64_t v28 = v27;
      if (v27 == 2)
      {
        v29 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:2];
        LODWORD(v30) = *(_DWORD *)v60;
        objc_msgSend(v29, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v30), 0);
        LODWORD(v31) = *((_DWORD *)v60 + 1);
        objc_msgSend(v29, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v31), 1);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v29), @"AuroraRampUpTapAPCEPoints");
      }
      else
      {
        logHandle = self->super._logHandle;
        if (!logHandle)
        {
          logHandle = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            logHandle = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR)) {
          [(BCAppleBacklightBrtControl *)v28 parseAuroraCapabilities];
        }
      }
    }
    free(v60);
    double v59 = 0;
    unint64_t v41 = load_float_array_from_edt(*(&self->_backlightService + 1), @"aurora-ramp-down-tap-points", &v59);
    if (v59)
    {
      uint64_t v42 = v41;
      if (v41 == 2)
      {
        v43 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:2];
        LODWORD(v44) = *(_DWORD *)v59;
        objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v44), 0);
        LODWORD(v45) = *((_DWORD *)v59 + 1);
        objc_msgSend(v43, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v45), 1);
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v43), @"AuroraRampDownTapAPCEPoints");
      }
      else
      {
        os_log_t inited = self->super._logHandle;
        if (!inited)
        {
          os_log_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
          if (!_COREBRIGHTNESS_LOG_DEFAULT) {
            os_log_t inited = init_default_corebrightness_log();
          }
        }
        if (os_log_type_enabled(inited, OS_LOG_TYPE_ERROR)) {
          [(BCAppleBacklightBrtControl *)v42 parseAuroraCapabilities];
        }
      }
    }
    free(v59);
    *(float *)&double v53 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-session-limit");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v53), @"AuroraSessionLimit");
    unsigned int v58 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), @"aurora-ignore-session-limit", &v58)) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v58), @"AuroraIgnoreSessionLimit");
    }
    *(float *)&double v54 = load_float_from_edt(*(&self->_backlightService + 1), @"aurora-maximum-nits");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v54), @"AuroraMaxNits");
    unsigned int v57 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), @"aurora-ignore-apce", &v57)) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v57), @"AuroraIgnoreAPCE");
    }
    unsigned int v56 = 0;
    if (load_int_from_edt(*(&self->_backlightService + 1), @"aurora-allow-edr", &v56)) {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v56), @"AuroraAllowEDR");
    }
    if ([v6 count]) {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._capabilities, "setObject:forKeyedSubscript:", [NSDictionary dictionaryWithDictionary:v6], @"Aurora");
    }
    goto LABEL_52;
  }
  if ([(BCBrtControl *)self logHandle])
  {
    v32 = [(BCBrtControl *)self logHandle];
LABEL_27:
    id v33 = v32;
    goto LABEL_29;
  }
  id v33 = _COREBRIGHTNESS_LOG_DEFAULT;
  if (!_COREBRIGHTNESS_LOG_DEFAULT)
  {
    v32 = (OS_os_log *)init_default_corebrightness_log();
    goto LABEL_27;
  }
LABEL_29:
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_238363000, v33, OS_LOG_TYPE_INFO, "Aurora not supported, skipping Aurora capabilities", buf, 2u);
  }
LABEL_52:
  return v5;
}

+ (void)newMonitorWithHandler:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_238363000, v0, v1, "Unable to setup IO notifications (error = %d)", v2, v3, v4, v5, v6);
}

- (void)initWithService:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_238363000, log, OS_LOG_TYPE_ERROR, "Unable to find backlight service.", v1, 2u);
}

- (void)initWithService:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_238363000, log, OS_LOG_TYPE_ERROR, "Unable to read properties from backlight service.", v1, 2u);
}

- (void)initWithService:.cold.3()
{
  __assert_rtn("-[BCAppleBacklightBrtControl initWithService:]", "BCAppleBacklightBrtControl.m", 271, "_maxUser >= _minUser");
}

- (void)initWithService:.cold.4()
{
  __assert_rtn("-[BCAppleBacklightBrtControl initWithService:]", "BCAppleBacklightBrtControl.m", 272, "_maxNits >= _minNits");
}

- (void)initWithService:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_238363000, v0, v1, "IOKit error registering for termination notification: %d", v2, v3, v4, v5, v6);
}

+ (void)copyAvailableControls
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_238363000, v0, v1, "error: failed to retrieve backlight services (%u)", v2, v3, v4, v5, v6);
}

void __44__BCAppleBacklightBrtControl_setNits_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_238363000, v0, v1, "Unable to set CF properties (err = 0x%X)", v2, v3, v4, v5, v6);
}

- (void)parseAuroraCapabilities
{
}

@end