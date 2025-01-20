@interface CBSBIM
+ (BOOL)needsSBIM;
- (BOOL)initialiseLimits;
- (CBSBIM)initWithQueue:(id)a3 andDisplayModule:(id)a4 andEDRModule:(id)a5;
- (const)mitigationStageToString:(int)a3;
- (float)cap;
- (float)currentHeadroom;
- (float)currentHeadroomRequest;
- (float)mitigatedHeadroomFromRequestedHeadroom;
- (float)sdrBrightness;
- (id).cxx_construct;
- (void)dataTimerHandler;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)enableSBIM:(BOOL)a3;
- (void)enterEDR;
- (void)exitEDR;
- (void)mitigationTimerHandler;
- (void)resetMitigationState;
- (void)sendEDRHeadroomRequest:(float)a3;
- (void)setCurrentHeadroom:(float)a3;
- (void)setCurrentHeadroomRequest:(float)a3;
- (void)setSdrBrightness:(float)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)updateMitigationStateWithData:(IOMFBShortTermBIM *)a3 andCurrentHeadroom:(float)a4 andRequestedHeadroom:(float)a5 andSDRBrightness:(float)a6 andReset:(BOOL)a7;
@end

@implementation CBSBIM

- (void)setSdrBrightness:(float)a3
{
  self->_sdrBrightness = a3;
}

- (void)setCurrentHeadroom:(float)a3
{
  self->_currentHeadroom = a3;
}

- (CBSBIM)initWithQueue:(id)a3 andDisplayModule:(id)a4 andEDRModule:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v46 = self;
  SEL v45 = a2;
  id v44 = a3;
  id v43 = a4;
  id v42 = a5;
  v41.receiver = self;
  v41.super_class = (Class)CBSBIM;
  id v46 = [(CBSBIM *)&v41 init];
  if (v46)
  {
    os_log_t v5 = os_log_create("com.apple.CoreBrightness.SBIM", "default");
    *((void *)v46 + 2) = v5;
    *((void *)v46 + 1) = v44;
    dispatch_retain(*((dispatch_object_t *)v46 + 1));
    *((void *)v46 + 3) = v43;
    id v6 = v42;
    *((void *)v46 + 5) = v6;
    if (!+[CBSBIM needsSBIM])
    {
      v40 = 0;
      if (*((void *)v46 + 2))
      {
        v25 = *((void *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v25 = inited;
      }
      v40 = v25;
      char v39 = 16;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        log = v40;
        os_log_type_t type = v39;
        __os_log_helper_16_0_0(v38);
        _os_log_error_impl(&dword_1BA438000, log, type, "SBIM Initialization | Device does not use CoreBrightness SBIM", v38, 2u);
      }
LABEL_52:

      return 0;
    }
    int MainDisplay = IOMobileFramebufferGetMainDisplay();
    if (MainDisplay)
    {
      os_log_t v36 = 0;
      if (*((void *)v46 + 2))
      {
        v21 = *((void *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v20 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v20 = init_default_corebrightness_log();
        }
        v21 = v20;
      }
      os_log_t v36 = v21;
      os_log_type_t v35 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_1_4_0((uint64_t)v48, MainDisplay);
        _os_log_error_impl(&dword_1BA438000, v36, v35, "SBIM Initialization | Unable to obtain IOMFB display object | ErrorCode=0x%x", v48, 8u);
      }
      goto LABEL_52;
    }
    *((_DWORD *)v46 + 16) = IOMobileFramebufferGetServiceObject();
    if (!*((_DWORD *)v46 + 16))
    {
      v34 = 0;
      if (*((void *)v46 + 2))
      {
        v19 = *((void *)v46 + 2);
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
      v34 = v19;
      char v33 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v16 = v34;
        os_log_type_t v17 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_error_impl(&dword_1BA438000, v16, v17, "SBIM Initialization | Unable to obtain IOMFB service object", v32, 2u);
      }
      goto LABEL_52;
    }
    if (([v46 initialiseLimits] & 1) == 0)
    {
      v31 = 0;
      if (*((void *)v46 + 2))
      {
        v15 = *((void *)v46 + 2);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v14 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v14 = init_default_corebrightness_log();
        }
        v15 = v14;
      }
      v31 = v15;
      char v30 = 16;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v12 = v31;
        os_log_type_t v13 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1BA438000, v12, v13, "SBIM Initialization | Unable to obtain SBIM tables", v29, 2u);
      }
      goto LABEL_52;
    }
    v28 = 0;
    if (*((void *)v46 + 2))
    {
      v11 = *((void *)v46 + 2);
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v10 = init_default_corebrightness_log();
      }
      v11 = v10;
    }
    v28 = v11;
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v28;
      os_log_type_t v9 = v27;
      __os_log_helper_16_0_0(v26);
      _os_log_impl(&dword_1BA438000, v8, v9, "SBIM Initialization | SBIM supported", v26, 2u);
    }
    *((float *)v46 + 55) = 1.0;
    *((float *)v46 + 56) = 1.0;
    *((unsigned char *)v46 + 32) = 1;
    *((unsigned char *)v46 + 33) = 0;
    *((unsigned char *)v46 + 48) = 0;
    [v46 resetMitigationState];
  }
  return (CBSBIM *)v46;
}

+ (BOOL)needsSBIM
{
  return (MGIsDeviceOneOfType() & 1) != 0 || (MGIsDeviceOneOfType() & 1) != 0 || (MGIsDeviceOneOfType() & 1) != 0;
}

- (BOOL)initialiseLimits
{
  if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits2;
    self->_limitsSize = 161;
    char v4 = 1;
  }
  else if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits3;
    self->_limitsSize = 121;
    char v4 = 1;
  }
  else if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits4;
    self->_limitsSize = 121;
    char v4 = 1;
  }
  else if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimits5;
    self->_limitsSize = 121;
    char v4 = 1;
  }
  else if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimitsD9x;
    self->_limitsSize = 121;
    char v4 = 1;
  }
  else if (MGIsDeviceOneOfType())
  {
    self->_limits = (const float (*)[3])&CoreBrightness::sbimLimitsD4y;
    self->_limitsSize = 121;
    char v4 = 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (void)dealloc
{
  char v4 = self;
  SEL v3 = a2;
  [(CBSBIM *)self stopMonitoring];

  if (v4->_queue) {
    dispatch_release((dispatch_object_t)v4->_queue);
  }
  if (v4->_log) {

  }
  v2.receiver = v4;
  v2.super_class = (Class)CBSBIM;
  [(CBSBIM *)&v2 dealloc];
}

- (void)dataTimerHandler
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = self;
  SEL v19 = a2;
  BOOL v18 = 0;
  BOOL v18 = self->mitigation.sbim_read_stage == 0;
  int Block = IOMobileFramebufferGetBlock();
  if (Block)
  {
    os_log_t oslog = 0;
    if (v20->_log)
    {
      log = v20->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      log = inited;
    }
    os_log_t oslog = log;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v22, Block);
      _os_log_error_impl(&dword_1BA438000, oslog, type, "SBIM Sampling | Reading SBIM state from IOMFB failed | ErrorCode=0x%x", v22, 8u);
    }
  }
  else
  {
    for (unsigned int i = 0; i < v20->mitigation.sbim_size; ++i)
      *((_DWORD *)&v16 + i + 2) *= 2;
    v11[0] = v16;
    HIDWORD(v4) = DWORD1(v17);
    v11[1] = v17;
    *(float *)&double v4 = v20->_currentHeadroom;
    *(float *)&double v2 = v20->_currentHeadroomRequest;
    *(float *)&double v3 = v20->_sdrBrightness;
    [(CBSBIM *)v20 updateMitigationStateWithData:v11 andCurrentHeadroom:v20->mitigation.sbim_read_stage == 1 andRequestedHeadroom:v4 andSDRBrightness:v2 andReset:v3];
    if (v20->_log)
    {
      v8 = v20->_log;
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
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(CBSBIM *)v20 mitigationStageToString:v20->mitigation.stage];
      if (v20->mitigation.violation) {
        id v6 = "YES";
      }
      else {
        id v6 = "NO";
      }
      __os_log_helper_16_2_11_8_32_8_32_4_0_4_0_4_0_4_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v21, v5, (uint64_t)v6, v20->mitigation.sbim_above_max - v20->mitigation.sbim_above_num, SDWORD2(v16), SHIDWORD(v16), v17, *((uint64_t *)&v17 + 1), COERCE__INT64(v20->_sdrBrightness), COERCE__INT64(v20->_currentHeadroom), COERCE__INT64(v20->_currentHeadroomRequest), v20->mitigation.sbim_read_stage);
      _os_log_impl(&dword_1BA438000, v8, OS_LOG_TYPE_DEFAULT, "SBIM Sampling\n{\n\tState=%s\n\tViolation=%s\n\tConsecutiveViolations=%d\n\tRGB=(%u, %u, %u)\n\tDuration=%llu\n\tSDRBrightness=%f\n\tCurrentHeadroom=%f\n\tRequestedHeadroom=%f\n\tReadStage=%u\n}", v21, 0x5Cu);
    }
    v20->mitigation.sbim_read_stage = (v20->mitigation.sbim_read_stage + 1) % v20->mitigation.sbim_reset_frequency;
  }
}

- (void)mitigationTimerHandler
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CBSBIM *)self mitigatedHeadroomFromRequestedHeadroom];
  float v10 = *(float *)&v2;
  +[CBEDR headroomToScalingFactor:v2];
  float v9 = v3;
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(CBSBIM *)self mitigationStageToString:self->mitigation.stage];
    if (self->mitigation.violation) {
      uint64_t v5 = "YES";
    }
    else {
      uint64_t v5 = "NO";
    }
    __os_log_helper_16_2_6_8_32_8_32_4_0_8_0_8_0_8_0((uint64_t)v12, (uint64_t)v4, (uint64_t)v5, self->mitigation.sbim_above_max - self->mitigation.sbim_above_num, COERCE__INT64(self->_currentHeadroom), COERCE__INT64(self->_currentHeadroomRequest), COERCE__INT64(v10));
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM Mitigation\n{\n\tState=%s\n\tViolation=%s\n\tConsecutiveViolations=%d\n\tCurrentHeadroom=%f\n\tRequestedHeadroom=%f\n\tMitigatedHeadroom=%f\n}", v12, 0x3Au);
  }
  double v6 = (float)(std::__math::fabs[abi:ne180100](self->mitigation.scalingFactor - v9) / self->mitigation.scalingFactor);
  if (self->mitigation.violation && v6 > 0.0001)
  {
    self->mitigation.scalingFactor = v9;
    self->_cap = v10;
    if (v10 < self->_currentHeadroom)
    {
      *(float *)&double v6 = self->_cap;
      [(CBSBIM *)self sendEDRHeadroomRequest:v6];
    }
  }
}

- (float)mitigatedHeadroomFromRequestedHeadroom
{
  +[CBEDR headroomToStops:COERCE_DOUBLE((unint64_t)LODWORD(self->_currentHeadroom))];
  float v13 = v2;
  *(float *)&double v3 = self->_currentHeadroomRequest;
  +[CBEDR headroomToStops:v3];
  float v12 = v4;
  {
    *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::mitigationHRdelta = (float)self->mitigation.mitigation_timer_interval
                                                                                   / (float)(self->mitigation.minutes_per_stop_mitigate
                                                                                           * 60.0);
  }
  {
    *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::recoveryHRdelta = (float)self->mitigation.mitigation_timer_interval
                                                                                 / (float)(self->mitigation.minutes_per_stop_recovery
                                                                                         * 60.0);
  }
  float v11 = 0.0;
  unsigned int stage = self->mitigation.stage;
  if (stage)
  {
    uint64_t v7 = stage;
    char v6 = 1;
  }
  else
  {
    uint64_t v7 = self->mitigation.stage;
    char v6 = 0;
  }
  if ((v6 & 1) == 0)
  {
    switch(v7)
    {
      case 0:
        float v11 = v12;
        break;
      case 1:
        goto LABEL_16;
      case 2:
        if (self->mitigation.violation) {
          goto LABEL_16;
        }
        *(float *)&double v8 = std::__math::fmin[abi:ne180100](v12, v13);
        goto LABEL_21;
      case 3:
        if (self->mitigation.violation)
        {
LABEL_16:
          float v9 = std::__math::fmax[abi:ne180100]<int,float,0>(0, v13 - *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::mitigationHRdelta);
          *(float *)&double v8 = std::__math::fmin[abi:ne180100](v12, v9);
          goto LABEL_21;
        }
        if (v13 <= v12)
        {
          *(float *)&double v8 = std::__math::fmin[abi:ne180100](v12, v13 + *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::recoveryHRdelta);
          goto LABEL_21;
        }
        float v11 = std::__math::fmax[abi:ne180100](v12, v13 - *(float *)&-[CBSBIM mitigatedHeadroomFromRequestedHeadroom]::recoveryHRdelta);
        break;
      default:
        JUMPOUT(0);
    }
  }
  *(float *)&double v8 = std::__math::fmin[abi:ne180100](v12, v11);
LABEL_21:
  +[CBEDR stopsToHeadroom:v8];
  return result;
}

- (void)startMonitoring
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  objc_super v41 = self;
  SEL v40 = a2;
  os_log_t v39 = 0;
  if (self->_log)
  {
    log = v41->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  os_log_t v39 = log;
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (v41->_isMonitoring) {
      float v2 = "YES";
    }
    else {
      float v2 = "NO";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v42, (uint64_t)v2);
    _os_log_impl(&dword_1BA438000, v39, v38, "SBIM Monitoring | Start=YES IsMonitoring=%s", v42, 0xCu);
  }
  if (!v41->_isMonitoring)
  {
    [(CBSBIM *)v41 enableSBIM:1];
    [(CBSBIM *)v41 resetMitigationState];
    v41->_dataTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v41->_queue);
    if (v41->_dataTimer)
    {
      source = v41->_dataTimer;
      dispatch_time_t v3 = dispatch_time(0, 3000000000);
      dispatch_source_set_timer(source, v3, 1000000000 * v41->mitigation.sbim_timer_interval, 1000000000 * v41->mitigation.sbim_timer_interval);
      dataTimer = v41->_dataTimer;
      uint64_t handler = MEMORY[0x1E4F143A8];
      int v33 = -1073741824;
      int v34 = 0;
      os_log_type_t v35 = __25__CBSBIM_startMonitoring__block_invoke;
      os_log_t v36 = &unk_1E6218FE0;
      v37 = v41;
      dispatch_source_set_event_handler(dataTimer, &handler);
      dispatch_resume((dispatch_object_t)v41->_dataTimer);
      dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v41->_queue);
      v41->_mitigationTimer = (OS_dispatch_source *)v5;
      if (v41->_mitigationTimer)
      {
        mitigationTimer = v41->_mitigationTimer;
        dispatch_time_t v6 = dispatch_time(0, 3000000000);
        dispatch_source_set_timer(mitigationTimer, v6, 1000000000 * v41->mitigation.mitigation_timer_interval, 1000000000 * v41->mitigation.mitigation_timer_interval);
        uint64_t v7 = v41->_mitigationTimer;
        uint64_t v23 = MEMORY[0x1E4F143A8];
        int v24 = -1073741824;
        int v25 = 0;
        v26 = __25__CBSBIM_startMonitoring__block_invoke_33;
        os_log_type_t v27 = &unk_1E6218FE0;
        v28 = v41;
        dispatch_source_set_event_handler(v7, &v23);
        dispatch_resume((dispatch_object_t)v41->_mitigationTimer);
        v41->_isMonitoring = 1;
      }
      else
      {
        os_log_t oslog = 0;
        if (v41->_log)
        {
          float v11 = v41->_log;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT) {
            uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT;
          }
          else {
            uint64_t v10 = init_default_corebrightness_log();
          }
          float v11 = v10;
        }
        os_log_t oslog = v11;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          double v8 = oslog;
          os_log_type_t v9 = v21;
          __os_log_helper_16_0_0(v20);
          _os_log_error_impl(&dword_1BA438000, v8, v9, "SBIM Mitigation | Unable to create a timer", v20, 2u);
        }
        [(CBSBIM *)v41 stopMonitoring];
      }
    }
    else
    {
      v31 = 0;
      if (v41->_log)
      {
        long long v16 = v41->_log;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t v15 = init_default_corebrightness_log();
        }
        long long v16 = v15;
      }
      v31 = v16;
      char v30 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        float v13 = v31;
        os_log_type_t v14 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1BA438000, v13, v14, "SBIM Data | Unable to create a timer", v29, 2u);
      }
      [(CBSBIM *)v41 stopMonitoring];
    }
  }
}

uint64_t __25__CBSBIM_startMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataTimerHandler", a1, a1);
}

uint64_t __25__CBSBIM_startMonitoring__block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mitigationTimerHandler", a1, a1);
}

- (void)stopMonitoring
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isMonitoring) {
      float v2 = "YES";
    }
    else {
      float v2 = "NO";
    }
    __os_log_helper_16_2_1_8_32((uint64_t)v6, (uint64_t)v2);
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM Monitoring | Stop=YES IsMonitoring=%s", v6, 0xCu);
  }
  if (self->_isMonitoring)
  {
    if (self->_dataTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_dataTimer);
      dispatch_release((dispatch_object_t)self->_dataTimer);
      self->_dataTimer = 0;
    }
    if (self->_mitigationTimer)
    {
      dispatch_source_cancel((dispatch_source_t)self->_mitigationTimer);
      dispatch_release((dispatch_object_t)self->_mitigationTimer);
      self->_mitigationTimer = 0;
    }
    [(CBSBIM *)self resetMitigationState];
    [(CBSBIM *)self enableSBIM:0];
    self->_isMonitoring = 0;
  }
}

- (void)enable
{
  uint64_t v10 = self;
  SEL v9 = a2;
  double v8 = 0;
  if (self->_log)
  {
    dispatch_source_t v5 = v10->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    dispatch_source_t v5 = inited;
  }
  double v8 = v5;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    os_log_type_t type = v7;
    __os_log_helper_16_0_0(v6);
    _os_log_impl(&dword_1BA438000, log, type, "SBIM State | Enabled=YES", v6, 2u);
  }
  v10->_sbimEnabled = 1;
  if (v10->_edrOn) {
    [(CBSBIM *)v10 startMonitoring];
  }
}

- (void)disable
{
  float v12 = self;
  SEL v11 = a2;
  uint64_t v10 = 0;
  if (self->_log)
  {
    dispatch_time_t v6 = v12->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    dispatch_time_t v6 = inited;
  }
  uint64_t v10 = v6;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    log = v10;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&dword_1BA438000, log, type, "SBIM State | Disabled=YES", v8, 2u);
  }
  v12->_sbimEnabled = 0;
  if (v12->_edrOn)
  {
    [(CBSBIM *)v12 stopMonitoring];
    float cap = v12->_cap;
    [(CBEDR *)v12->_edr maxHeadroom];
    v12->_float cap = *(float *)&v2;
    if (v12->_currentHeadroomRequest > cap)
    {
      *(float *)&double v2 = v12->_currentHeadroomRequest;
      [(CBSBIM *)v12 sendEDRHeadroomRequest:v2];
    }
  }
}

- (void)enterEDR
{
  self->_edrOn = 1;
  if (self->_sbimEnabled) {
    [(CBSBIM *)self startMonitoring];
  }
}

- (void)exitEDR
{
  self->_edrOn = 0;
  if (self->_sbimEnabled) {
    [(CBSBIM *)self stopMonitoring];
  }
}

- (void)enableSBIM:(BOOL)a3
{
  kern_return_t v4;
  uint64_t v5;
  NSObject *v6;
  unsigned int entry;
  uint64_t inited;
  NSObject *log;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint8_t v14[32];
  uint8_t v15[24];
  uint64_t v16;

  long long v16 = *MEMORY[0x1E4F143B8];
  float v12 = a3;
  dispatch_time_t v3 = "Enabling";
  if (!a3) {
    dispatch_time_t v3 = "Disabling";
  }
  SEL v11 = (uint64_t)v3;
  if (self->_log)
  {
    log = self->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v15, v11);
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM IOMFB | %s SBIM", v15, 0xCu);
  }
  entry = self->_iomfbService;
  if (v12) {
    float v4 = IORegistryEntrySetCFProperty(entry, @"enableSBIM", (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
  }
  else {
    float v4 = IORegistryEntrySetCFProperty(entry, @"enableSBIM", (CFTypeRef)*MEMORY[0x1E4F1CFC8]);
  }
  uint64_t v10 = v4;
  if (v4)
  {
    if (self->_log)
    {
      dispatch_time_t v6 = self->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        dispatch_source_t v5 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        dispatch_source_t v5 = init_default_corebrightness_log();
      }
      dispatch_time_t v6 = v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v14, v11, v10);
      _os_log_error_impl(&dword_1BA438000, v6, OS_LOG_TYPE_ERROR, "SBIM IOMFB | %s SBIM failed | ErrorCode=0x%x", v14, 0x12u);
    }
  }
}

- (void)resetMitigationState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v15 = self;
  SEL v14 = a2;
  self->mitigation.scalingFactor = 0.0;
  [(CBEDR *)v15->_edr maxHeadroom];
  v15->_float cap = v2;
  if (v15->mitigation.stage)
  {
    unsigned int v13 = 0;
    float v3 = mach_time_now_in_milliseconds();
    double v4 = (double)(60 * v15->mitigation.sbim_timer_interval);
    double v5 = (v3 - v15->mitigation.lastStateUpdate_) / v4;
    unsigned int v13 = std::__math::fmin[abi:ne180100]<int,unsigned int,0>(6, vcvtad_u64_f64(v5), v5, v4);
    for (unsigned int i = 0; i < v13; ++i)
    {
      long long v10 = *(_OWORD *)&v15->mitigation.lastSBIMBlock_.version;
      long long v11 = *(_OWORD *)&v15->mitigation.lastSBIMBlock_.var0.v1.sbim[2];
      LODWORD(v6) = 1.0;
      LODWORD(v7) = 1120403456;
      [(CBSBIM *)v15 updateMitigationStateWithData:&v10 andCurrentHeadroom:0 andRequestedHeadroom:COERCE_DOUBLE(__PAIR64__(DWORD1(v11), 1.0)) andSDRBrightness:v6 andReset:v7];
    }
    if (v15->_log)
    {
      log = v15->_log;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      log = inited;
    }
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)[(CBSBIM *)v15 mitigationStageToString:v15->mitigation.stage]);
      _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM Reset | CurrentStage=%s", v16, 0xCu);
    }
  }
}

- (const)mitigationStageToString:(int)a3
{
  if (a3)
  {
    uint64_t v4 = a3;
    char v3 = 1;
  }
  else
  {
    uint64_t v4 = 0;
    char v3 = 0;
  }
  if (v3) {
    return "UnknownMitigationStage";
  }
  switch(v4)
  {
    case 0:
      double v6 = "NoMitigation";
      break;
    case 1:
      double v6 = "InMitigation";
      break;
    case 2:
      double v6 = "Sustain";
      break;
    case 3:
      double v6 = "OutMitigation";
      break;
    default:
      JUMPOUT(0);
  }
  return v6;
}

- (void)updateMitigationStateWithData:(IOMFBShortTermBIM *)a3 andCurrentHeadroom:(float)a4 andRequestedHeadroom:(float)a5 andSDRBrightness:(float)a6 andReset:(BOOL)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v56 = self;
  SEL v55 = a2;
  v54 = a3;
  float v53 = a4;
  float v52 = a5;
  float v51 = a6;
  BOOL v50 = a7;
  {
    float v49 = 0.0;
    std::valarray<float>::valarray(&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &v49, v56->mitigation.sbim_size);
    __cxa_atexit((void (*)(void *))std::valarray<float>::~valarray, &-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &dword_1BA438000);
  }
  std::valarray<float>::valarray(v48, v56->mitigation.sbim_size);
  std::valarray<float>::valarray(v47, v56->mitigation.sbim_size);
  for (int i = 0; i < (unint64_t)std::valarray<float>::size[abi:ne180100](v47); ++i)
  {
    float v32 = (float)a3->var0.v1.sbim[i];
    *(float *)std::valarray<float>::operator[][abi:ne180100](v47, i) = v32;
  }
  if (v50)
  {
    int v44 = 1107296256;
    std::operator/[abi:ne180100]<std::valarray<float>,0>(v47, (uint64_t)&v44, (uint64_t)v45);
    std::valarray<float>::operator=<std::_BinaryOp<std::divides<float>,std::valarray<float>,std::__scalar_expr<float>>>(v48, (uint64_t)v45);
  }
  else
  {
    std::operator-[abi:ne180100]<std::valarray<float>,std::valarray<float>,0>((uint64_t)v47, (uint64_t)&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, &v42);
    int v41 = 1107296256;
    std::operator/[abi:ne180100]<std::__val_expr<std::_BinaryOp<std::minus<float>,std::valarray<float>,std::valarray<float>>>,0>((uint64_t)&v42, (uint64_t)&v41, v43);
    std::valarray<float>::operator=<std::_BinaryOp<std::divides<float>,std::__val_expr<std::_BinaryOp<std::minus<float>,std::valarray<float>,std::valarray<float>>>,std::__scalar_expr<float>>>(v48, (uint64_t)v43);
  }
  int v40 = 0;
  int v39 = v56->_limitsSize - 1;
  int v38 = 0;
  unsigned int v37 = vcvtmd_s64_f64(v51 / 10.0 + 0.5);
  v31 = std::max[abi:ne180100]<int>(&v38, &v37);
  int v40 = *std::min[abi:ne180100]<int>(&v39, v31);
  std::valarray<float>::valarray(v36, v56->_limits[v40], v56->mitigation.sbim_size);
  std::operator>[abi:ne180100]<std::valarray<float>,std::valarray<float>,0>((uint64_t)v48, (uint64_t)v36, &v35);
  v56->mitigation.violation = std::__val_expr<std::_BinaryOp<std::greater<float>,std::valarray<float>,std::valarray<float>>>::max[abi:ne180100]((uint64_t)&v35);
  if (v56->_log)
  {
    log = v56->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(double *)&uint64_t v28 = *(float *)std::valarray<float>::operator[][abi:ne180100](v47, 0);
    *(double *)&uint64_t v27 = *(float *)std::valarray<float>::operator[][abi:ne180100](v47, 1);
    *(double *)&uint64_t v26 = *(float *)std::valarray<float>::operator[][abi:ne180100](v47, 2);
    *(double *)&uint64_t v25 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 0);
    *(double *)&uint64_t v24 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 1);
    *(double *)&uint64_t v23 = *(float *)std::valarray<float>::operator[][abi:ne180100](&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, 2);
    *(double *)&uint64_t v22 = *(float *)std::valarray<float>::operator[][abi:ne180100](v48, 0);
    *(double *)&uint64_t v21 = *(float *)std::valarray<float>::operator[][abi:ne180100](v48, 1);
    *(double *)&uint64_t v20 = *(float *)std::valarray<float>::operator[][abi:ne180100](v48, 2);
    *(double *)&uint64_t v19 = *(float *)std::valarray<float>::operator[][abi:ne180100](v36, 0);
    *(double *)&uint64_t v17 = *(float *)std::valarray<float>::operator[][abi:ne180100](v36, 1);
    BOOL v18 = (float *)std::valarray<float>::operator[][abi:ne180100](v36, 2);
    __os_log_helper_16_0_12_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v57, v28, v27, v26, v25, v24, v23, v22, v21, v20, v19, v17, COERCE__INT64(*v18));
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM Data\n{\n\tCurrentAccumulatedSBIM=(%f, %f, %f)\n\tPreviousAccumulatedSBIM=(%f, %f, %f)\n\tCurrentSBIM=(%f, %f, %f)\n\tLimitSBIM=(%f, %f, %f)\n}", v57, 0x7Au);
  }
  std::valarray<float>::operator=((uint64_t *)&-[CBSBIM updateMitigationStateWithData:andCurrentHeadroom:andRequestedHeadroom:andSDRBrightness:andReset:]::previousAccumulatedSBIM, v47);
  unsigned int stage = v56->mitigation.stage;
  if (stage)
  {
    uint64_t v10 = stage;
    char v9 = 1;
  }
  else
  {
    uint64_t v10 = v56->mitigation.stage;
    char v9 = 0;
  }
  if ((v9 & 1) == 0)
  {
    switch(v10)
    {
      case 0:
        if (v56->mitigation.violation)
        {
          if (!--v56->mitigation.sbim_above_num)
          {
            v56->mitigation.unsigned int stage = 1;
            v56->mitigation.sbim_above_num = v56->mitigation.sbim_above_max;
            *(float *)&double v7 = v56->_sdrBrightness;
            +[CBAnalytics sbimMitigationTriggeredWithBrightness:v7];
          }
        }
        else
        {
          v56->mitigation.sbim_above_num = v56->mitigation.sbim_above_max;
        }
        break;
      case 1:
        if (!v56->mitigation.violation)
        {
          v56->mitigation.unsigned int stage = 2;
          v56->mitigation.sbim_sustain_num = v56->mitigation.sbim_sustain_max;
        }
        break;
      case 2:
        if (!--v56->mitigation.sbim_sustain_num)
        {
          v56->mitigation.unsigned int stage = 3;
          v56->mitigation.sbim_sustain_num = v56->mitigation.sbim_sustain_max;
          v56->mitigation.sbim_above_num = v56->mitigation.sbim_above_max;
        }
        break;
      case 3:
        float v34 = (float)(v56->mitigation.delta_factor * (float)v56->mitigation.mitigation_timer_interval)
            / (float)(std::__math::fmin[abi:ne180100](v56->mitigation.minutes_per_stop_mitigate, v56->mitigation.minutes_per_stop_recovery)* 60.0);
        *(float *)&double v11 = v53;
        +[CBEDR headroomToStops:v11];
        float v16 = v12;
        *(float *)&double v13 = v52;
        +[CBEDR headroomToStops:v13];
        if (std::__math::fabs[abi:ne180100](v16 - v14) < v34) {
          v56->mitigation.unsigned int stage = 0;
        }
        break;
      default:
        JUMPOUT(0);
    }
  }
  v56->mitigation.lastStateUpdate_ = mach_time_now_in_milliseconds();
  uint64_t v15 = v56;
  *(_OWORD *)&v56->mitigation.lastSBIMBlock_.version = *(_OWORD *)&a3->version;
  *(_OWORD *)&v15->mitigation.lastSBIMBlock_.var0.v1.sbim[2] = *(_OWORD *)&a3->var0.v1.sbim[2];
  std::valarray<float>::~valarray(v36);
  std::valarray<float>::~valarray(v47);
  std::valarray<float>::~valarray(v48);
}

- (void)sendEDRHeadroomRequest:(float)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = self;
  SEL v9 = a2;
  float valuePtr = a3;
  if (self->_log)
  {
    log = v10->_log;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT) {
      uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
    }
    else {
      uint64_t inited = init_default_corebrightness_log();
    }
    log = inited;
  }
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v13, COERCE__INT64(valuePtr));
    _os_log_impl(&dword_1BA438000, log, OS_LOG_TYPE_DEFAULT, "SBIM EDR | Sending headroom request with headroom=%f", v13, 0xCu);
  }
  float v12 = 0;
  float v12 = (const void *)*MEMORY[0x1E4F39DF0];
  CFNumberRef v11 = 0;
  char v3 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  CFNumberRef v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], kCFNumberFloat32Type, &valuePtr);
  CFDictionaryRef cf = CFDictionaryCreate(*v3, &v12, (const void **)&v11, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (cf)
  {
    [(CBDisplayModuleiOS *)v10->_displayModule setProperty:cf forKey:@"EDRHeadroomRequest"];
    CFRelease(cf);
  }
  for (int i = 0; i < 1; ++i)
  {
    if (*(&v11 + i)) {
      CFRelease(*(&v11 + i));
    }
  }
}

- (float)sdrBrightness
{
  return self->_sdrBrightness;
}

- (float)currentHeadroom
{
  return self->_currentHeadroom;
}

- (float)currentHeadroomRequest
{
  return self->_currentHeadroomRequest;
}

- (void)setCurrentHeadroomRequest:(float)a3
{
  self->_currentHeadroomRequest = a3;
}

- (float)cap
{
  return self->_cap;
}

- (id).cxx_construct
{
  return self;
}

@end