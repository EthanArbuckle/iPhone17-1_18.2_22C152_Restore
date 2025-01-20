@interface HSTPencilVirtualService
- (BOOL)handleHSDecode:(void *)a3;
- (BOOL)handleHSEncode:(void *)a3;
- (BOOL)setOutputEvent:(id)a3 forService:(id)a4;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5;
- (HIDVirtualEventService)virtualService;
- (HSTPencilVirtualService)initWithConfig:(const HSTPencilVirtualServiceConfig *)a3 withQueue:(id)a4;
- (HSTPencilVirtualServiceConfig)config;
- (OS_dispatch_queue)innie;
- (OS_dispatch_queue)outie;
- (id)copyEventMatching:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3 forService:(id)a4;
- (void)_dispatchHIDEvents:(const void *)a3;
- (void)_dispatchHIDEventsAsync:(void *)a3;
- (void)_handleDebugStateEvent:(id)a3;
- (void)_handleHIDEvents:(id)a3;
- (void)_handleHIDPencilEvents:(id)a3;
- (void)_handleVendorEvent:(id)a3;
- (void)_logHIDEvent:(id)a3;
- (void)_saveLastTouchSystemReady:(id)a3;
- (void)dealloc;
- (void)handleConsume:(id)a3;
- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5;
- (void)setConfig:(HSTPencilVirtualServiceConfig *)a3;
- (void)setInnie:(id)a3;
- (void)setOutie:(id)a3;
- (void)setVirtualService:(id)a3;
@end

@implementation HSTPencilVirtualService

- (HSTPencilVirtualService)initWithConfig:(const HSTPencilVirtualServiceConfig *)a3 withQueue:(id)a4
{
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HSTPencilVirtualService;
  v8 = [(HSStage *)&v26 init];
  if (v8)
  {
    inactive = dispatch_workloop_create_inactive("com.apple.hid.PencilVirtualEventService");
    dispatch_set_qos_class_fallback();
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(inactive);
    *(_OWORD *)&v8->_config.vendorID = *(_OWORD *)&a3->vendorID;
    long long v11 = *(_OWORD *)&a3->accurateMaxForce;
    long long v10 = *(_OWORD *)&a3->maxHoverHeight;
    long long v12 = *(_OWORD *)&a3->ownerRegistryID;
    *(void *)&v8->_config.heightMm = *(void *)&a3->heightMm;
    *(_OWORD *)&v8->_config.accurateMaxForce = v11;
    *(_OWORD *)&v8->_config.maxHoverHeight = v10;
    *(_OWORD *)&v8->_config.ownerRegistryID = v12;
    objc_storeStrong((id *)&v8->_outie, a4);
    objc_storeStrong((id *)&v8->_innie, inactive);
    uint64_t v13 = objc_opt_new();
    hidStats = v8->_hidStats;
    v8->_hidStats = (HSTHIDEventStatistics *)v13;

    uint64_t v15 = objc_opt_new();
    recordedProperties = v8->_recordedProperties;
    v8->_recordedProperties = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    formatter = v8->_formatter;
    v8->_formatter = (NSDateFormatter *)v17;

    [(NSDateFormatter *)v8->_formatter setDateStyle:1];
    [(NSDateFormatter *)v8->_formatter setTimeStyle:4];
    v19 = +[NSTimeZone localTimeZone];
    [(NSDateFormatter *)v8->_formatter setTimeZone:v19];

    innie = v8->_innie;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __52__HSTPencilVirtualService_initWithConfig_withQueue___block_invoke;
    block[3] = &unk_1412D0;
    v21 = v8;
    v25 = v21;
    dispatch_async(innie, block);
    v22 = v21;
  }
  return v8;
}

void __52__HSTPencilVirtualService_initWithConfig_withQueue___block_invoke(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setVirtualService:");

  v2 = [*(id *)(a1 + 32) virtualService];

  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) virtualService];
    [v6 setDelegate:*(void *)(a1 + 32)];

    id v7 = [*(id *)(a1 + 32) virtualService];
    [v7 setCancelHandler:&__block_literal_global_4];

    id v8 = [*(id *)(a1 + 32) virtualService];
    v3 = [*(id *)(a1 + 32) innie];
    [v8 setDispatchQueue:v3];

    id v9 = [*(id *)(a1 + 32) virtualService];
    [v9 activate];
  }
  else
  {
    v4 = MTLoggingPlugin();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__HSTPencilVirtualService_initWithConfig_withQueue___block_invoke_cold_1(v4);
    }
  }
}

void __52__HSTPencilVirtualService_initWithConfig_withQueue___block_invoke_30(id a1)
{
  v1 = MTLoggingPlugin();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&def_411C8, v1, OS_LOG_TYPE_DEFAULT, "HSTPencilVirtualService: Calling cancel handler", v2, 2u);
  }
}

- (void)dealloc
{
  [(HIDVirtualEventService *)self->_virtualService cancel];
  v3.receiver = self;
  v3.super_class = (Class)HSTPencilVirtualService;
  [(HSStage *)&v3 dealloc];
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  if ([v9 isEqualToString:@"MinDigitizerPressureValue"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_config.minForce = (unint64_t)[(__CFString *)v8 unsignedIntegerValue];
LABEL_8:
      long long v11 = MTLoggingPlugin();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[HSTPencilVirtualService setProperty:forKey:forService:]();
      }
      BOOL v12 = 1;
LABEL_11:

      goto LABEL_23;
    }
  }
  else if (([v9 isEqualToString:@"AccurateMaxDigitizerPressureValue"] & 1) != 0 {
         || [v9 isEqualToString:@"MaxDigitizerPressureValue"])
  }
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_config.accurateMaxForce = (unint64_t)[(__CFString *)v8 unsignedIntegerValue];
      goto LABEL_8;
    }
  }
  else if (([v9 isEqualToString:@"ExtendedMaxDigitizerPressureValue"] & 1) != 0 {
         || [v9 isEqualToString:@"DigitizerPressureDynamicRange"])
  }
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_config.extendedMaxForce = (unint64_t)[(__CFString *)v8 unsignedIntegerValue];
      goto LABEL_8;
    }
  }
  else if ([v9 isEqualToString:@"HoverDisabled"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->_config.hoverDisabled = [(__CFString *)v8 BOOLValue];
      outie = self->_outie;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __57__HSTPencilVirtualService_setProperty_forKey_forService___block_invoke;
      block[3] = &unk_142CD0;
      id v28 = v9;
      v29 = v8;
      v30 = self;
      dispatch_async(outie, block);

      goto LABEL_8;
    }
  }
  else
  {
    if (![v9 isEqualToString:@"ExternalMessage"])
    {
      long long v11 = MTLoggingPlugin();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = v9;
        __int16 v35 = 2112;
        id v36 = v10;
        __int16 v37 = 2112;
        v38 = v8;
        _os_log_debug_impl(&def_411C8, v11, OS_LOG_TYPE_DEBUG, "HSTPencilVirtualService: unknown set property %@ for service %@ with value %@", buf, 0x20u);
      }
      BOOL v12 = 0;
      goto LABEL_11;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = self->_outie;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __57__HSTPencilVirtualService_setProperty_forKey_forService___block_invoke_2;
      v24[3] = &unk_1412A8;
      v25 = v8;
      objc_super v26 = self;
      dispatch_async(v14, v24);

      goto LABEL_8;
    }
  }
  BOOL v12 = 0;
LABEL_23:
  formatter = self->_formatter;
  v16 = +[NSDate date];
  uint64_t v17 = [(NSDateFormatter *)formatter stringFromDate:v16];

  CFStringRef v18 = @"0";
  if (v17) {
    CFStringRef v18 = v17;
  }
  v31[0] = @"set time";
  v31[1] = @"key";
  v31[2] = @"value";
  v32[0] = v18;
  CFStringRef v19 = @"nil";
  if (v8) {
    CFStringRef v19 = v8;
  }
  v32[1] = v9;
  v32[2] = v19;
  v20 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  while (1)
  {
    id v21 = [(NSMutableArray *)self->_recordedProperties count];
    recordedProperties = self->_recordedProperties;
    if ((unint64_t)v21 < 0x64) {
      break;
    }
    [(NSMutableArray *)recordedProperties removeObjectAtIndex:0];
  }
  [(NSMutableArray *)recordedProperties addObject:v20];

  return v12;
}

void __57__HSTPencilVirtualService_setProperty_forKey_forService___block_invoke(id *a1)
{
  uint64_t v2 = objc_opt_new();
  std::string::assign((std::string *)(v2 + 16), (const std::string::value_type *)[a1[4] UTF8String]);
  objc_storeStrong((id *)(v2 + 40), a1[5]);
  v3.receiver = a1[6];
  v3.super_class = (Class)HSTPencilVirtualService;
  objc_msgSendSuper2(&v3, "handleConsume:", v2);
}

void __57__HSTPencilVirtualService_setProperty_forKey_forService___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [[HSTExternalMessageEvent alloc] initWithMessage:*(void *)(a1 + 32)];
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)HSTPencilVirtualService;
  objc_msgSendSuper2(&v3, "handleConsume:", v2);
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  if ([v6 isEqualToString:@"Built-In"]) {
    goto LABEL_2;
  }
  if ([v6 isEqualToString:@"DeviceUsagePairs"])
  {
    v18[0] = @"DeviceUsagePage";
    v18[1] = @"DeviceUsage";
    v19[0] = &off_149AC0;
    v19[1] = &off_149AD8;
    id v9 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    v20 = v9;
    id v8 = +[NSArray arrayWithObjects:&v20 count:1];
LABEL_5:

    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"Transport"])
  {
    id v8 = @"Virtual";
    goto LABEL_17;
  }
  if ([v6 isEqualToString:@"VendorID"])
  {
    p_config = &self->_config;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"ProductID"])
  {
    p_config = (HSTPencilVirtualServiceConfig *)&self->_config.productID;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"VirtualServiceOwnerRegistryID"])
  {
    p_config = (HSTPencilVirtualServiceConfig *)&self->_config.ownerRegistryID;
    goto LABEL_14;
  }
  if ([v6 isEqualToString:@"PrimaryUsagePage"])
  {
    id v8 = (__CFString *)&off_149AC0;
  }
  else
  {
    if (([v6 isEqualToString:@"PrimaryUsage"] & 1) == 0)
    {
      if ([v6 isEqualToString:@"MaxHoverHeight"])
      {
        p_config = (HSTPencilVirtualServiceConfig *)&self->_config.maxHoverHeight;
      }
      else
      {
        if ([v6 isEqualToString:@"DisplayIntegrated"])
        {
LABEL_2:
          id v8 = (__CFString *)&__kCFBooleanTrue;
          goto LABEL_17;
        }
        if ([v6 isEqualToString:@"ServicePluginDebug"])
        {
          id v8 = (__CFString *)objc_opt_new();
          [(__CFString *)v8 setObject:self->_recordedProperties forKeyedSubscript:@"Recent set properties"];
LABEL_16:
          if (!v8) {
            goto LABEL_20;
          }
          goto LABEL_17;
        }
        if ([v6 isEqualToString:@"MinDigitizerPressureValue"])
        {
          p_config = (HSTPencilVirtualServiceConfig *)&self->_config.minForce;
        }
        else if (([v6 isEqualToString:@"AccurateMaxDigitizerPressureValue"] & 1) != 0 {
               || [v6 isEqualToString:@"MaxDigitizerPressureValue"])
        }
        {
          p_config = (HSTPencilVirtualServiceConfig *)&self->_config.accurateMaxForce;
        }
        else
        {
          if (([v6 isEqualToString:@"ExtendedMaxDigitizerPressureValue"] & 1) == 0
            && ![v6 isEqualToString:@"DigitizerPressureDynamicRange"])
          {
            if (![v6 isEqualToString:@"HoverDisabled"])
            {
              if (![v6 isEqualToString:@"SurfaceDimensions"])
              {
                BOOL v12 = MTLoggingPlugin();
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                  -[HSTPencilVirtualService propertyForKey:forService:]();
                }
                id v8 = 0;
                goto LABEL_19;
              }
              v14 = &self->_config;
              id v9 = +[NSNumber numberWithInt:self->_config.widthMm, @"Width"];
              v16[1] = @"Height";
              v17[0] = v9;
              uint64_t v15 = +[NSNumber numberWithInt:v14->heightMm];
              v17[1] = v15;
              id v8 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

              goto LABEL_5;
            }
            uint64_t v11 = +[NSNumber numberWithBool:self->_config.hoverDisabled];
            goto LABEL_15;
          }
          p_config = (HSTPencilVirtualServiceConfig *)&self->_config.extendedMaxForce;
        }
      }
LABEL_14:
      uint64_t v11 = +[NSNumber numberWithUnsignedInteger:p_config->vendorID];
LABEL_15:
      id v8 = (__CFString *)v11;
      goto LABEL_16;
    }
    id v8 = (__CFString *)&off_149AD8;
  }
LABEL_17:
  BOOL v12 = MTLoggingPlugin();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[HSTPencilVirtualService propertyForKey:forService:]();
  }
LABEL_19:

LABEL_20:

  return v8;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  id v6 = [v5 objectForKeyedSubscript:@"MatchingEvent"];
  unsigned int v7 = [v6 integerValueForField:0x10000];
  unsigned int v8 = [v6 integerValueForField:65537];
  if ([v6 type] != 1 || v7 == 65376 || v8 == 9)
  {
    id v10 = MTLoggingPlugin();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12[0] = 67109632;
      v12[1] = [v6 type];
      __int16 v13 = 1024;
      unsigned int v14 = v7;
      __int16 v15 = 1024;
      unsigned int v16 = v8;
      _os_log_debug_impl(&def_411C8, v10, OS_LOG_TYPE_DEBUG, "Unsuported Pencil copyEvent match event: type=0x%x, usagePage=0x%x, usage=0x%x", (uint8_t *)v12, 0x14u);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = self->_lastTouchSystemReadyEvent;
  }

  return v9;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  LOBYTE(self) = [(HIDVirtualEventService *)self->_virtualService dispatchEvent:v5];

  return (char)self;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
}

- (void)_logHIDEvent:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToEventType:11])
  {
    id v4 = [v3 integerValueForField:720920];
    if ((v4 & 0x83) != 0)
    {
      id v5 = MTLoggingPlugin();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v3 children];
        int v7 = 134219264;
        id v8 = [v6 count];
        __int16 v9 = 2048;
        id v10 = [v3 integerValueForField:720903];
        __int16 v11 = 2048;
        id v12 = v4;
        __int16 v13 = 1024;
        unsigned int v14 = (v4 >> 7) & 1;
        __int16 v15 = 2048;
        id v16 = [v3 integerValueForField:720905];
        __int16 v17 = 2048;
        id v18 = [v3 integerValueForField:720904];
        _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "Dispatching stylus digitizer event with %lu children, eventMask=0x%lx childEventMask=0x%lx Cancel=%d Touching=%ld inRange=%ld", (uint8_t *)&v7, 0x3Au);
      }
    }
  }
}

- (void)_saveLastTouchSystemReady:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  if ([v5 type] == 1
    && [v5 integerValueForField:0x10000] == (char *)&loc_FF5C + 4
    && [v5 integerValueForField:65537] == (char *)&dword_8 + 1)
  {
    objc_storeStrong((id *)&self->_lastTouchSystemReadyEvent, a3);
    id v6 = [v5 dataValueForField:65540];
    int v7 = MTLoggingPlugin();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (*v6) {
        id v8 = "YES";
      }
      else {
        id v8 = "NO";
      }
      int v9 = 136446210;
      id v10 = v8;
      _os_log_impl(&def_411C8, v7, OS_LOG_TYPE_DEFAULT, "Pencil Touch System Ready = %{public}s", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_dispatchHIDEvents:(const void *)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_innie);
  id v5 = *(id **)a3;
  id v6 = (id *)*((void *)a3 + 1);
  if (*(id **)a3 != v6)
  {
    do
    {
      id v7 = *v5;
      [(HSTPencilVirtualService *)self _logHIDEvent:v7];
      [(HSTPencilVirtualService *)self _saveLastTouchSystemReady:v7];
      [(HIDVirtualEventService *)self->_virtualService dispatchEvent:v7];

      ++v5;
    }
    while (v5 != v6);
  }
}

- (void)_dispatchHIDEventsAsync:(void *)a3
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_innie);
  id v5 = (void *)mach_continuous_time();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x4812000000;
  v9[3] = __Block_byref_object_copy__3;
  v9[4] = __Block_byref_object_dispose__3;
  v9[5] = "";
  long long v10 = *(_OWORD *)a3;
  uint64_t v11 = *((void *)a3 + 2);
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  *((void *)a3 + 2) = 0;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  innie = self->_innie;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __51__HSTPencilVirtualService__dispatchHIDEventsAsync___block_invoke;
  block[3] = &unk_142CF8;
  objc_copyWeak(v8, &location);
  void block[4] = v9;
  v8[1] = v5;
  dispatch_async(innie, block);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(v9, 8);
  id location = &v10;
  std::vector<HIDEvent * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&location);
}

void __51__HSTPencilVirtualService__dispatchHIDEventsAsync___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _dispatchHIDEvents:*(void *)(*(void *)(a1 + 32) + 8) + 48];
    id v4 = MTLoggingPlugin();
    if (os_signpost_enabled(v4))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      int v6 = 134349056;
      uint64_t v7 = v5;
      _os_signpost_emit_with_name_impl(&def_411C8, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DispatchStylus", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)_handleHIDEvents:(id)a3
{
}

- (void)_handleVendorEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_innie);
  if (!v4)
  {
    v25 = +[NSAssertionHandler currentHandler];
    objc_super v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTPencilVirtualService _handleVendorEvent:]");
    [v25 handleFailureInFunction:v26, @"HSTPencilVirtualService.mm", 392, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)HSTPencilVirtualService;
  [(HSStage *)&v27 handleConsume:v4];
  HSUtil::MachTimeFromNanoseconds((HSUtil *)[v4 hsTimestamp]);
  uint64_t v5 = objc_opt_new();
  [v4 type];
  id v6 = [v4 data];
  [v6 bytes];
  uint64_t v7 = [v4 data];
  [v7 length];
  uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
  int v9 = (uint64_t **)(v5 + 1);
  unint64_t v10 = v5[3];
  uint64_t v11 = (uint64_t *)v5[2];
  if ((unint64_t)v11 >= v10)
  {
    uint64_t v13 = v11 - *v9;
    if ((unint64_t)(v13 + 1) >> 61) {
      std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v10 - (void)*v9;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    v31 = v5 + 3;
    if (v16) {
      __int16 v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HSUtil::CoderKey const*>>((uint64_t)(v5 + 3), v16);
    }
    else {
      __int16 v17 = 0;
    }
    id v18 = (uint64_t *)&v17[8 * v13];
    CFStringRef v19 = &v17[8 * v16];
    v30 = v19;
    *id v18 = VendorDefinedEvent;
    id v12 = v18 + 1;
    v29 = v18 + 1;
    id v21 = *v9;
    v20 = (uint64_t *)v5[2];
    if (v20 == *v9)
    {
      v23 = (uint64_t *)v5[2];
    }
    else
    {
      do
      {
        uint64_t v22 = *--v20;
        uint64_t *v20 = 0;
        *--id v18 = v22;
      }
      while (v20 != v21);
      v23 = *v9;
      v20 = (uint64_t *)v5[2];
      id v12 = v29;
      CFStringRef v19 = v30;
    }
    *int v9 = v18;
    v28[1] = v23;
    v5[2] = v12;
    v29 = v20;
    v24 = (char *)v5[3];
    v5[3] = v19;
    v30 = v24;
    v28[0] = v23;
    std::__split_buffer<HIDEvent * {__strong}>::~__split_buffer((uint64_t)v28);
  }
  else
  {
    *uint64_t v11 = VendorDefinedEvent;
    id v12 = v11 + 1;
  }
  v5[2] = v12;

  [(HSTPencilVirtualService *)self _handleHIDEvents:v5];
}

- (void)_handleHIDPencilEvents:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_innie);
  id v4 = v7;
  if (!v7)
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTPencilVirtualService _handleHIDPencilEvents:]");
    [v5 handleFailureInFunction:v6, @"HSTPencilVirtualService.mm", 408, @"Invalid parameter not satisfying: %@", @"events" file lineNumber description];

    id v4 = 0;
  }
  [(HSTHIDEventStatistics *)self->_hidStats handleHIDEvents:v4];
  [(HSTPencilVirtualService *)self _handleHIDEvents:v7];
}

- (void)_handleDebugStateEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_innie);
  if (!v4)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    id v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[HSTPencilVirtualService _handleDebugStateEvent:]");
    [v7 handleFailureInFunction:v8, @"HSTPencilVirtualService.mm", 420, @"Invalid parameter not satisfying: %@", @"event" file lineNumber description];
  }
  *((unsigned char *)v4 + 16) = 1;
  v10[0] = @"Stage";
  v10[1] = @"Generation Stats";
  v11[0] = @"PencilVirtualService";
  uint64_t v5 = [(HSTHIDEventStatistics *)self->_hidStats stats];
  v11[1] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  [*((id *)v4 + 3) addObject:v6];
  v9.receiver = self;
  v9.super_class = (Class)HSTPencilVirtualService;
  [(HSStage *)&v9 handleConsume:v4];
}

- (void)handleConsume:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_innie);
  id v5 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if (v6)
  {
    [(HSTPencilVirtualService *)self _handleVendorEvent:v5];
  }
  else
  {
    id v7 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      [(HSTPencilVirtualService *)self _handleHIDPencilEvents:v7];
    }
    else
    {
      id v9 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }

      if (v10)
      {
        [(HSTPencilVirtualService *)self _handleDebugStateEvent:v9];
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)HSTPencilVirtualService;
        [(HSStage *)&v11 handleConsume:v9];
      }
    }
  }
}

- (BOOL)handleHSEncode:(void *)a3
{
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeMapStart((unint64_t *)a3, 4);
  }
  p_config = &self->_config;
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)101,(char)110,(char)100,(char)111,(char)114,(char)73,(char)68>::Key, p_config->vendorID);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)111,(char)100,(char)117,(char)99,(char)116,(char)73,(char)68>::Key, p_config->productID);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)111,(char)119,(char)110,(char)101,(char)114,(char)82,(char)101,(char)103,(char)105,(char)115,(char)116,(char)114,(char)121,(char)73,(char)68>::Key, p_config->ownerRegistryID);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)70,(char)111,(char)114,(char)99,(char)101>::Key, p_config->minForce);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)97,(char)99,(char)99,(char)117,(char)114,(char)97,(char)116,(char)101,(char)77,(char)97,(char)120,(char)70,(char)111,(char)114,(char)99,(char)101>::Key, p_config->accurateMaxForce);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)116,(char)101,(char)110,(char)100,(char)101,(char)100,(char)77,(char)97,(char)120,(char)70,(char)111,(char)114,(char)99,(char)101>::Key, p_config->extendedMaxForce);
  HSUtil::Encoder::encodeUInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)72,(char)111,(char)118,(char)101,(char)114,(char)72,(char)101,(char)105,(char)103,(char)104,(char)116>::Key, p_config->maxHoverHeight);
  HSUtil::Encoder::encodeBool((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)111,(char)118,(char)101,(char)114,(char)68,(char)105,(char)115,(char)97,(char)98,(char)108,(char)101,(char)100>::Key, p_config->hoverDisabled);
  HSUtil::Encoder::encodeInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)105,(char)100,(char)116,(char)104,(char)77,(char)109>::Key, p_config->widthMm);
  HSUtil::Encoder::encodeInt((HSUtil::Encoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)101,(char)105,(char)103,(char)104,(char)116,(char)77,(char)109>::Key, p_config->heightMm);
  if (!*(_DWORD *)a3) {
    HSUtil::Encoder::_encodeContainerStop((uint64_t (***)(void))a3);
  }
  return 1;
}

- (BOOL)handleHSDecode:(void *)a3
{
  p_config = &self->_config;
  self->_config.vendorID = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)118,(char)101,(char)110,(char)100,(char)111,(char)114,(char)73,(char)68>::Key);
  p_config->productID = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)112,(char)114,(char)111,(char)100,(char)117,(char)99,(char)116,(char)73,(char)68>::Key);
  p_config->ownerRegistryID = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)111,(char)119,(char)110,(char)101,(char)114,(char)82,(char)101,(char)103,(char)105,(char)115,(char)116,(char)114,(char)121,(char)73,(char)68>::Key);
  p_config->minForce = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)105,(char)110,(char)70,(char)111,(char)114,(char)99,(char)101>::Key);
  p_config->accurateMaxForce = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)97,(char)99,(char)99,(char)117,(char)114,(char)97,(char)116,(char)101,(char)77,(char)97,(char)120,(char)70,(char)111,(char)114,(char)99,(char)101>::Key);
  p_config->extendedMaxForce = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)101,(char)120,(char)116,(char)101,(char)110,(char)100,(char)101,(char)100,(char)77,(char)97,(char)120,(char)70,(char)111,(char)114,(char)99,(char)101>::Key);
  p_config->maxHoverHeight = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)109,(char)97,(char)120,(char)72,(char)111,(char)118,(char)101,(char)114,(char)72,(char)101,(char)105,(char)103,(char)104,(char)116>::Key);
  p_config->hoverDisabled = HSUtil::Decoder::decodeBool((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)111,(char)118,(char)101,(char)114,(char)68,(char)105,(char)115,(char)97,(char)98,(char)108,(char)101,(char)100>::Key);
  p_config->widthMm = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)119,(char)105,(char)100,(char)116,(char)104,(char)77,(char)109>::Key);
  p_config->heightMm = HSUtil::Decoder::decodeInt((HSUtil::Decoder *)a3, (const CoderKey *)HSUtil::CoderKey::Literal<(char)104,(char)101,(char)105,(char)103,(char)104,(char)116,(char)77,(char)109>::Key);
  int v5 = *(_DWORD *)a3;
  if (*(_DWORD *)a3)
  {
    memset(__b, 170, sizeof(__b));
    id v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/Multitouch/HIDSensingTouch/HSTPipeline/HSTPencilVirtualService.mm", __b);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[HSTPencilVirtualService handleHSDecode:]((uint64_t)v6);
    }
  }
  return v5 == 0;
}

- (HSTPencilVirtualServiceConfig)config
{
  long long v3 = *(_OWORD *)&self[3].productID;
  *(_OWORD *)&retstr->accurateMaxForce = *(_OWORD *)&self[2].heightMm;
  *(_OWORD *)&retstr->maxHoverHeight = v3;
  *(void *)&retstr->heightMm = self[3].minForce;
  long long v4 = *(_OWORD *)&self[2].maxHoverHeight;
  *(_OWORD *)&retstr->vendorID = *(_OWORD *)&self[2].accurateMaxForce;
  *(_OWORD *)&retstr->ownerRegistryID = v4;
  return self;
}

- (void)setConfig:(HSTPencilVirtualServiceConfig *)a3
{
  *(_OWORD *)&self->_config.vendorID = *(_OWORD *)&a3->vendorID;
  long long v4 = *(_OWORD *)&a3->accurateMaxForce;
  long long v3 = *(_OWORD *)&a3->maxHoverHeight;
  long long v5 = *(_OWORD *)&a3->ownerRegistryID;
  *(void *)&self->_config.heightMm = *(void *)&a3->heightMm;
  *(_OWORD *)&self->_config.accurateMaxForce = v4;
  *(_OWORD *)&self->_config.maxHoverHeight = v3;
  *(_OWORD *)&self->_config.ownerRegistryID = v5;
}

- (OS_dispatch_queue)outie
{
  return self->_outie;
}

- (void)setOutie:(id)a3
{
}

- (OS_dispatch_queue)innie
{
  return self->_innie;
}

- (void)setInnie:(id)a3
{
}

- (HIDVirtualEventService)virtualService
{
  return self->_virtualService;
}

- (void)setVirtualService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualService, 0);
  objc_storeStrong((id *)&self->_innie, 0);
  objc_storeStrong((id *)&self->_outie, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_recordedProperties, 0);
  objc_storeStrong((id *)&self->_lastTouchSystemReadyEvent, 0);

  objc_storeStrong((id *)&self->_hidStats, 0);
}

void __52__HSTPencilVirtualService_initWithConfig_withQueue___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&def_411C8, log, OS_LOG_TYPE_ERROR, "Could not create HSTPencilVirtualService", v1, 2u);
}

- (void)setProperty:forKey:forService:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&def_411C8, v0, v1, "HSTPencilVirtualService: set property %@ = %@");
}

- (void)propertyForKey:forService:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&def_411C8, v0, v1, "HSTPencilVirtualService: get property %@ = %@");
}

- (void)propertyForKey:forService:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_9(&def_411C8, v0, v1, "HSTPencilVirtualService: unknown get property %@ for service %@");
}

- (void)handleHSDecode:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1 = 136315906;
  uint64_t v2 = "-[HSTPencilVirtualService handleHSDecode:]";
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = 479;
  __int16 v7 = 2080;
  id v8 = "coder";
  _os_log_error_impl(&def_411C8, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", (uint8_t *)&v1, 0x2Au);
}

@end