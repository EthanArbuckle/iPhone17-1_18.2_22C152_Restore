@interface CBALSTelemetry
- (BOOL)setALSService:(__IOHIDServiceClient *)a3;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (CBALSTelemetry)initWithQueue:(id)a3;
- (id)copyALSSampleHistoryWithLength:(int)a3 frequency:(float)a4 lastTimestamp:(unint64_t *)a5;
- (id)copyPropertyForKey:(id)a3;
- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4;
- (unint64_t)getBootTimeInMicroSeconds;
- (void)dealloc;
- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3;
- (void)handleSystemPrepareForSleepPropertyHandler:(id)a3;
- (void)sendNotificationForKey:(id)a3 andValue:(id)a4;
- (void)start;
- (void)stop;
- (void)timerFired;
- (void)updateLastTimestampInDefaults;
@end

@implementation CBALSTelemetry

- (id)copyPropertyForKey:(id)a3
{
  v9 = self;
  SEL v8 = a2;
  id v7 = a3;
  v6 = 0;
  if ([a3 isEqualToString:@"CBAmbientLightTelemetry"])
  {
    uint64_t v5 = 0;
    LODWORD(v3) = 1.0;
    return [(CBALSTelemetry *)v9 copyALSSampleHistoryWithLength:30 frequency:&v5 lastTimestamp:v3];
  }
  return v6;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  BOOL v5 = 0;
  if ([a4 isEqualToString:@"CBSystemDidWakeFromSleep"])
  {
    [(CBALSTelemetry *)self handleSystemDidWakeFromSleepPropertyHandler:a3];
    return 1;
  }
  else if ([a4 isEqualToString:@"CBSystemPrepareForSleep"])
  {
    [(CBALSTelemetry *)self handleSystemPrepareForSleepPropertyHandler:a3];
    return 1;
  }
  return v5;
}

- (CBALSTelemetry)initWithQueue:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19 = self;
  SEL v18 = a2;
  id v17 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CBALSTelemetry;
  v19 = [(CBModule *)&v16 initWithQueue:a3];
  if (v19)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.CBALSTelemetry", "Default");
    v19->super._logHandle = (OS_os_log *)v3;
    mach_timebase_info(&info);
    LODWORD(v4) = info.numer;
    LODWORD(v5) = info.denom;
    v19->_timeFactor = (double)v4 / (double)v5 * 0.000000001;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CoreBrightness"];
    v19->_defaults = (NSUserDefaults *)v6;
    BOOL v7 = [(NSUserDefaults *)v19->_defaults BOOLForKey:@"CBAmbientLightTelemetry"];
    v19->_alsLiveOnTelemetryEnabled = v7;
    if (v19->_alsLiveOnTelemetryEnabled)
    {
      uint64_t v14 = [(CBALSTelemetry *)v19 getBootTimeInMicroSeconds];
      if (v14 == objc_msgSend(-[NSUserDefaults objectForKey:](v19->_defaults, "objectForKey:", @"CBAmbientLightTelemetryBootTime"), "unsignedLongLongValue"))
      {
        id v13 = [(NSUserDefaults *)v19->_defaults objectForKey:@"CBAmbientLightTelemetryLastTimestamp"];
        if (v13)
        {
          uint64_t v8 = [v13 unsignedLongLongValue];
          v19->_lastTimestampInMicroseconds = v8;
        }
      }
      else
      {
        [(NSUserDefaults *)v19->_defaults removeObjectForKey:@"CBAmbientLightTelemetryLastTimestamp"];
      }
      if (v19->super._logHandle)
      {
        logHandle = v19->super._logHandle;
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
        __os_log_helper_16_0_2_8_0_8_0((uint64_t)v21, v14, v19->_lastTimestampInMicroseconds);
        _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "bootTime=%llu _lastTimestampInMicroseconds=%llu", v21, 0x16u);
      }
      id v12 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:v14];
      [(NSUserDefaults *)v19->_defaults setObject:v12 forKey:@"CBAmbientLightTelemetryBootTime"];
    }
    return v19;
  }
  else
  {

    return 0;
  }
}

- (void)start
{
  v10 = self;
  SEL v9 = a2;
  if (self->_alsService && !v10->_timer && v10->_alsLiveOnTelemetryEnabled)
  {
    v10->_timer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v10->super._queue);
    if (v10->_timer)
    {
      dispatch_source_set_timer((dispatch_source_t)v10->_timer, 0, 0x29E8D60800uLL, 0x77359400uLL);
      timer = v10->_timer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v4 = -1073741824;
      int v5 = 0;
      uint64_t v6 = __23__CBALSTelemetry_start__block_invoke;
      BOOL v7 = &unk_1E6218FE0;
      uint64_t v8 = v10;
      dispatch_source_set_event_handler(timer, &handler);
      dispatch_activate((dispatch_object_t)v10->_timer);
    }
  }
}

uint64_t __23__CBALSTelemetry_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerFired", a1, a1);
}

- (void)stop
{
  if (self->_timer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timer);
    dispatch_release((dispatch_object_t)self->_timer);
    self->_timer = 0;
  }
}

- (void)dealloc
{
  int v4 = self;
  SEL v3 = a2;
  [(CBALSTelemetry *)self stop];
  if (v4->super._logHandle)
  {

    v4->super._logHandle = 0;
  }

  v4->_defaults = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBALSTelemetry;
  [(CBModule *)&v2 dealloc];
}

- (id)copyPropertyForKey:(id)a3 withParameter:(id)a4
{
  return -[CBALSTelemetry copyPropertyForKey:](self, "copyPropertyForKey:", a3, a4, a3, a2, self);
}

- (unint64_t)getBootTimeInMicroSeconds
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5[2] = (size_t)self;
  v5[1] = (size_t)a2;
  *(void *)BOOL v7 = 0x1500000001;
  v5[0] = 16;
  if (sysctl(v7, 2u, &v3, v5, 0, 0) == -1) {
    return 0;
  }
  else {
    return (unint64_t)((double)v4 + (double)v3 * 1000000.0);
  }
}

- (BOOL)setALSService:(__IOHIDServiceClient *)a3
{
  if (self->_alsService) {
    return 0;
  }
  id v4 = (id)IOHIDServiceClientCopyProperty(a3, @"ALSSensorType");
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v4 intValue] == 8 || objc_msgSend(v4, "intValue") == 9))
    {
      self->_alsService = a3;
    }
  }
  return self->_alsService != 0;
}

- (void)timerFired
{
  if (self->_alsLiveOnTelemetryEnabled)
  {
    LODWORD(v2) = 0.5;
    id v3 = [(CBALSTelemetry *)self copyALSSampleHistoryWithLength:20 frequency:&self->_lastTimestampInMicroseconds lastTimestamp:v2];
    if (v3)
    {
      [(CBALSTelemetry *)self sendNotificationForKey:@"CBAmbientLightTelemetry" andValue:v3];
    }
    [(CBALSTelemetry *)self updateLastTimestampInDefaults];
  }
}

- (id)copyALSSampleHistoryWithLength:(int)a3 frequency:(float)a4 lastTimestamp:(unint64_t *)a5
{
  v78 = &v97;
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  v108 = self;
  SEL v107 = a2;
  int v106 = a3;
  float v105 = a4;
  v104 = a5;
  uint64_t v103 = 0;
  double v6 = std::__math::fmin[abi:ne180100]<float,unsigned int,0>(2, a4, v5);
  *(float *)&double v6 = v6;
  float v105 = *(float *)&v6;
  LODWORD(v7) = 1232348160;
  *(float *)&double v6 = (float)((float)(1.0 / *(float *)&v6) * 1000000.0) + -50000.0;
  unint64_t v102 = (unint64_t)*(float *)&v6;
  int v106 = (int)std::__math::fmin[abi:ne180100]<int,unsigned int,0>(v106, 20, v6, v7);
  if (v108->_alsService)
  {
    uint64_t v8 = (void *)MEMORY[0x1BA9ECAE0]();
    SEL v9 = v78;
    context = v8;
    *((_DWORD *)v78 + 23) = 0;
    *((_DWORD *)v9 + 23) = 0;
    *((void *)v9 + 10) = 0;
    uint64_t v10 = mach_continuous_time();
    v11 = v78;
    *((void *)v78 + 10) = v10;
    *((void *)v11 + 9) = 0;
    CFTypeRef v12 = (id)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((void *)v11 + 17) + 32), @"CBALSHistory");
    id v13 = v78;
    *((void *)v78 + 9) = v12;
    *((void *)v13 + 8) = 0;
    uint64_t v14 = mach_continuous_time();
    v15 = v78;
    *((double *)v78 + 8) = (double)(v14 - *((void *)v78 + 10)) * *(double *)(*((void *)v78 + 17) + 56);
    if (*((void *)v15 + 9))
    {
      if ([*((id *)v78 + 9) length] == 684)
      {
        uint64_t v65 = 0;
        *(void *)v78 = 0;
        *(double *)v78 = (double)mach_continuous_time() * *(double *)(*((void *)v78 + 17) + 56);
        id v96 = (id)[MEMORY[0x1E4F1C9C8] date];
        [v96 timeIntervalSinceReferenceDate];
        double v95 = v22;
        id v94 = 0;
        unint64_t v66 = 0x1E4F1C000uLL;
        id v94 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((int *)v78 + 31)];
        id v93 = 0;
        id v93 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((int *)v78 + 31)];
        id v92 = 0;
        id v92 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((int *)v78 + 31)];
        id v91 = 0;
        id v91 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((int *)v78 + 31)];
        uint64_t v90 = 0;
        uint64_t v90 = [*((id *)v78 + 9) bytes];
        for (unsigned int i = 0; i < 0x14; ++i)
        {
          int v88 = 0;
          int v88 = (int)(*(_DWORD *)(v90 + 680) - (i + 1)) % 20;
          int v64 = v88 >= 0 ? v88 : v88 + 20;
          double v25 = std::__math::fmin[abi:ne180100]<int,unsigned int,0>(v64, 19, v23, v24);
          double v23 = std::__math::fmax[abi:ne180100]<int,int,0>((int)v25, 0);
          int v88 = (int)v23;
          if ((!**((void **)v78 + 14)
             || *(void *)(v90 + 34 * v88 + 4) < **((void **)v78 + 14) - *((void *)v78 + 12))
            && ((*(unsigned char *)(v90 + 34 * v88 + 28) & 1) == 0 || *(unsigned char *)(v90 + 34 * v88 + 31) != 65))
          {
            double v87 = 0.0;
            uint64_t v62 = 34;
            double v87 = (double)*(unint64_t *)(v90 + 34 * v88 + 4) / 1000000.0;
            double v86 = 0.0;
            double v86 = v95 + v87 - *(double *)v78;
            id v58 = v94;
            unint64_t v61 = 0x1E4F28000uLL;
            objc_msgSend(v94, "addObject:", objc_msgSend(NSNumber, "numberWithDouble:", v86));
            id v59 = v93;
            LODWORD(v26) = *(_DWORD *)(v90 + 34 * v88 + 12);
            objc_msgSend(v93, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v26));
            id v60 = v92;
            LODWORD(v27) = *(_DWORD *)(v90 + 34 * v88 + 20);
            objc_msgSend(v92, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v27));
            id v63 = v91;
            LODWORD(v28) = *(_DWORD *)(v90 + 34 * v88 + 24);
            objc_msgSend(v91, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v28));
            osos_log_t log = 0;
            if (*(void *)(*((void *)v78 + 17) + 16))
            {
              os_log_t v57 = *(os_log_t *)(*((void *)v78 + 17) + 16);
            }
            else
            {
              if (_COREBRIGHTNESS_LOG_DEFAULT) {
                uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
              }
              else {
                uint64_t inited = init_default_corebrightness_log();
              }
              os_log_t v57 = inited;
            }
            osos_log_t log = v57;
            os_log_type_t v84 = OS_LOG_TYPE_DEBUG;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              os_log_t v53 = oslog;
              *(_DWORD *)v54 = v84;
              *(double *)&uint64_t v29 = *(float *)(v90 + 34 * v88 + 12);
              v55 = v110;
              __os_log_helper_16_0_4_4_0_8_0_4_0_8_0((uint64_t)v110, i, v29, v88, *(uint64_t *)&v86);
              _os_log_debug_impl(&dword_1BA438000, oslog, v84, "ALS samples history [%d]: lux = %f, index = %d, timestamp = %f", v110, 0x22u);
            }
            v30 = v78;
            ++*((_DWORD *)v78 + 23);
            **((void **)v30 + 14) = *(void *)(v90 + 34 * v88 + 4);
            if ([v94 count] >= (unint64_t)*((int *)v78 + 31)) {
              break;
            }
          }
        }
        uint64_t v52 = NSNumber;
        id v83 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v94, "count"));
        if ([v83 unsignedIntValue])
        {
          id v50 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          id v49 = v83;
          uint64_t v46 = objc_msgSend((id)objc_msgSend(v94, "reverseObjectEnumerator"), "allObjects");
          uint64_t v47 = objc_msgSend((id)objc_msgSend(v93, "reverseObjectEnumerator"), "allObjects");
          uint64_t v48 = objc_msgSend((id)objc_msgSend(v92, "reverseObjectEnumerator"), "allObjects");
          v51 = &v38;
          uint64_t v31 = objc_msgSend(v50, "initWithObjectsAndKeys:", v83, @"count", v46, @"timestamp", v47, @"lux", v48, @"color_x", objc_msgSend((id)objc_msgSend(v91, "reverseObjectEnumerator"), "allObjects"), @"color_y", 0);
          *((void *)v78 + 13) = v31;
        }
        double v44 = 0.0;
        double v82 = 0.0;
        double v32 = (double)(mach_continuous_time() - *((void *)v78 + 10));
        uint64_t v33 = *((void *)v78 + 17);
        v45 = &OBJC_IVAR___CBDisplayModuleiOS__maxNitsPanel;
        double v82 = v32 * *(double *)(v33 + 56);
        double v81 = v44;
        double v81 = (double)(mach_continuous_time() - *((void *)v78 + 10)) * *(double *)(*((void *)v78 + 17) + 56);
        os_log_t v80 = 0;
        if (*(void *)(*((void *)v78 + 17) + 16))
        {
          os_log_t v43 = *(os_log_t *)(*((void *)v78 + 17) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            v42 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            v42 = init_default_corebrightness_log();
          }
          os_log_t v43 = v42;
        }
        os_log_t v80 = v43;
        os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          os_log_t v39 = v80;
          *(_DWORD *)v40 = v79;
          int v34 = *((_DWORD *)v78 + 23);
          uint64_t v35 = *(void *)(*((void *)v78 + 17) + 64);
          uint64_t v36 = *((void *)v78 + 8);
          v41 = v109;
          __os_log_helper_16_0_5_4_0_8_0_8_0_8_0_8_0((uint64_t)v109, v34, v35, v36, *(uint64_t *)&v82, *(uint64_t *)&v81);
          _os_log_impl(&dword_1BA438000, v39, v40[0], "ALS samples history: itemsProcessed=%u newLastTimestamp=%lluus durations=(dataRetrieval=%fs partial=%fs overall=%fs)", v41, 0x30u);
        }
        *((_DWORD *)v78 + 9) = 0;
      }
      else
      {
        v19 = v78;
        *((void *)v78 + 3) = 0;
        if (*(void *)(*((void *)v19 + 17) + 16))
        {
          uint64_t v71 = *(void *)(*((void *)v78 + 17) + 16);
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v70 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v70 = init_default_corebrightness_log();
          }
          uint64_t v71 = v70;
        }
        v20 = (os_log_t *)v78;
        *((void *)v78 + 3) = v71;
        unsigned __int8 v99 = 16;
        if (os_log_type_enabled(v20[3], OS_LOG_TYPE_ERROR))
        {
          os_log_t v67 = (os_log_t)*((void *)v78 + 3);
          *(_DWORD *)v68 = v99;
          v69 = v98;
          __os_log_helper_16_0_0(v98);
          _os_log_error_impl(&dword_1BA438000, v67, v68[0], "Unexpected size!", v98, 2u);
        }
        v21 = v78;
        *((void *)v78 + 18) = 0;
        *((_DWORD *)v21 + 9) = 1;
      }
    }
    else
    {
      objc_super v16 = v78;
      *((void *)v78 + 7) = 0;
      if (*(void *)(*((void *)v16 + 17) + 16))
      {
        uint64_t v76 = *(void *)(*((void *)v78 + 17) + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v75 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v75 = init_default_corebrightness_log();
        }
        uint64_t v76 = v75;
      }
      id v17 = (os_log_t *)v78;
      *((void *)v78 + 7) = v76;
      unsigned __int8 v101 = 16;
      if (os_log_type_enabled(v17[7], OS_LOG_TYPE_ERROR))
      {
        os_log_t log = (os_log_t)*((void *)v78 + 7);
        *(_DWORD *)type = v101;
        buf = v100;
        __os_log_helper_16_0_0(v100);
        _os_log_error_impl(&dword_1BA438000, log, type[0], "Unable to retrieve history from ALS!", v100, 2u);
      }
      SEL v18 = v78;
      *((void *)v78 + 18) = 0;
      *((_DWORD *)v18 + 9) = 1;
    }
    if (!*((_DWORD *)v78 + 9)) {
      *((void *)v78 + 18) = *((void *)v78 + 13);
    }
  }
  else
  {
    *((void *)v78 + 18) = 0;
  }
  return (id)*((void *)v78 + 18);
}

- (void)updateLastTimestampInDefaults
{
  id v2 = (id)[objc_alloc(NSNumber) initWithUnsignedLongLong:self->_lastTimestampInMicroseconds];
  [(NSUserDefaults *)self->_defaults setObject:v2 forKey:@"CBAmbientLightTelemetryLastTimestamp"];
  [(NSUserDefaults *)self->_defaults synchronize];
}

- (void)sendNotificationForKey:(id)a3 andValue:(id)a4
{
  if (self->super._notificationBlock) {
    (*((void (**)(void))self->super._notificationBlock + 2))();
  }
}

- (void)handleSystemDidWakeFromSleepPropertyHandler:(id)a3
{
}

- (void)handleSystemPrepareForSleepPropertyHandler:(id)a3
{
}

@end