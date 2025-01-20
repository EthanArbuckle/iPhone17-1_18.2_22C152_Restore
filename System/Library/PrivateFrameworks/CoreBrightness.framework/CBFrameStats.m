@interface CBFrameStats
- (BOOL)shouldPop;
- (CBFrameStats)initWithQueue:(id)a3;
- (double)movingAverageDuration;
- (float)currentTripStartTime;
- (float)getMovingAverage;
- (float)getPeakAPCE;
- (float)getPeakAPCECap;
- (float)scaleFactor;
- (float)tripMaxAPCE;
- (id).cxx_construct;
- (unint64_t)tripLength;
- (void)dealloc;
- (void)enableFrameInfoLogging:(BOOL)a3;
- (void)initialiseWindowServerDisplay;
- (void)processFrameInfo:(id *)a3;
- (void)setMovingAverageDuration:(double)a3;
- (void)startMonitoring:(id)a3;
- (void)stopMonitoring;
@end

@implementation CBFrameStats

- (float)getPeakAPCE
{
  return std::__math::round[abi:ne180100](self->_peakAPCE.current * 100.0) / 100.0;
}

- (CBFrameStats)initWithQueue:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v14 = self;
  SEL v13 = a2;
  id v12 = a3;
  if (!a3) {
    return 0;
  }
  v11.receiver = v14;
  v11.super_class = (Class)CBFrameStats;
  id v14 = [(CBFrameStats *)&v11 init];
  if (v14)
  {
    os_log_t v3 = os_log_create("com.apple.CoreBrightness.FrameStats", "default");
    *((void *)v14 + 16) = v3;
    *((void *)v14 + 1) = v12;
    dispatch_retain(*((dispatch_object_t *)v14 + 1));
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v14 + 17) = v4;
    [v14 initialiseWindowServerDisplay];
    for (int i = 0;
          i < (unint64_t)objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "tableSize");
          ++i)
    {
      std::vector<float>::push_back[abi:ne180100]((uint64_t *)v14 + 3, (float *)(objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "nitsTable") + 4 * i));
      std::vector<float>::push_back[abi:ne180100]((uint64_t *)v14 + 6, (float *)(objc_msgSend((id)objc_msgSend(*((id *)v14 + 2), "averagePixelConstraints"), "averagePixelTable")+ 4 * i));
      if (*((void *)v14 + 16))
      {
        v9 = *((void *)v14 + 16);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT) {
          uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
        }
        else {
          uint64_t inited = init_default_corebrightness_log();
        }
        v9 = inited;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(double *)&uint64_t v7 = *(float *)std::vector<float>::back[abi:ne180100]((uint64_t)v14 + 24);
        v5 = (float *)std::vector<float>::back[abi:ne180100]((uint64_t)v14 + 48);
        __os_log_helper_16_0_4_4_0_8_0_4_0_8_0((uint64_t)v16, i, v7, i, COERCE__INT64(*v5));
        _os_log_impl(&dword_1BA438000, v9, OS_LOG_TYPE_DEFAULT, "FrameStats RTPLC | FrameDelayedNits[%d]=%f FrameDelayedAPCE[%d]=%f", v16, 0x22u);
      }
    }
    *((unsigned char *)v14 + 112) = 0;
    *((_DWORD *)v14 + 30) = 0;
    *((_DWORD *)v14 + 29) = 0;
    *((void *)v14 + 22) = 0;
    *((_DWORD *)v14 + 40) = 0;
    *((_DWORD *)v14 + 18) = 0;
    *((float *)v14 + 20) = 0.5;
    *((float *)v14 + 21) = 2.0;
    *((float *)v14 + 22) = mach_time_now_in_seconds();
    *((_DWORD *)v14 + 26) = 1060320051;
    *((float *)v14 + 27) = 10.0;
    *((float *)v14 + 31) = -1.0;
    *((unsigned char *)v14 + 148) = 0;
  }
  return (CBFrameStats *)v14;
}

- (void)initialiseWindowServerDisplay
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v21 = self;
  SEL v20 = a2;
  if (!self->_windowServerDisplay)
  {
    id v19 = (id)[MEMORY[0x1E4F39D28] serverIfRunning];
    if (v19)
    {
      memset(__b, 0, sizeof(__b));
      id obj = (id)[v19 displays];
      uint64_t v9 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)__b[2];
        uint64_t v6 = 0;
        uint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)__b[2] != v5) {
            objc_enumerationMutation(obj);
          }
          id v15 = 0;
          id v15 = *(id *)(__b[1] + 8 * v6);
          if (!objc_msgSend(v15, "displayType", v7)) {
            break;
          }
          ++v6;
          uint64_t v7 = v3;
          if (v4 + 1 >= v3)
          {
            uint64_t v6 = 0;
            uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
            if (!v7) {
              return;
            }
          }
        }
        v2 = (CAWindowServerDisplay *)v15;
        v21->_windowServerDisplay = v2;
      }
    }
    else
    {
      v18 = 0;
      if (v21->_logHandle)
      {
        logHandle = v21->_logHandle;
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
        _os_log_error_impl(&dword_1BA438000, log, type, "CAWindowServer is not running", v16, 2u);
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(CBFrameStats *)self stopMonitoring];
  if (v4->_queue)
  {
    dispatch_release((dispatch_object_t)v4->_queue);
    v4->_queue = 0;
  }
  if (v4->_logHandle)
  {

    v4->_logHandle = 0;
  }

  v2.receiver = v4;
  v2.super_class = (Class)CBFrameStats;
  [(CBFrameStats *)&v2 dealloc];
}

- (void)startMonitoring:(id)a3
{
  id v12 = self;
  SEL v11 = a2;
  id v10 = a3;
  self->_previousFramePresentationTime = -1.0;
  v12->_rtplcCapApplied.previous = 0;
  v12->_rtplcCapApplied.triggerCount = 0.0;
  v12->_rtplcCapApplied.count = 0.0;
  v12->_peakAPCE.recoveryTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v12->_queue);
  if (v12->_peakAPCE.recoveryTimer)
  {
    dispatch_source_set_timer((dispatch_source_t)v12->_peakAPCE.recoveryTimer, 0, (unint64_t)(float)(v12->_peakAPCE.recoveryWindowSize * 1000000000.0), 0);
    dispatch_block_t v9 = 0;
    uint64_t block = MEMORY[0x1E4F143A8];
    int v4 = -1073741824;
    int v5 = 0;
    uint64_t v6 = __32__CBFrameStats_startMonitoring___block_invoke;
    uint64_t v7 = &unk_1E6218FE0;
    v8 = v12;
    dispatch_block_t v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    if (v9)
    {
      dispatch_source_set_event_handler((dispatch_source_t)v12->_peakAPCE.recoveryTimer, v9);
      _Block_release(v9);
    }
    dispatch_resume((dispatch_object_t)v12->_peakAPCE.recoveryTimer);
  }
  [(CAWindowServerDisplay *)v12->_windowServerDisplay setFrameInfoCallback:v10];
}

float __32__CBFrameStats_startMonitoring___block_invoke(uint64_t a1)
{
  *(float *)(*(void *)(a1 + 32) + 120) = *(float *)(*(void *)(a1 + 32) + 120)
                                           * *(float *)(*(void *)(a1 + 32) + 104);
  uint64_t v1 = *(void *)(a1 + 32);
  float result = *(float *)(v1 + 116) * *(float *)(v1 + 104);
  *(float *)(v1 + 116) = result;
  return result;
}

- (void)stopMonitoring
{
  if (self->_peakAPCE.recoveryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_peakAPCE.recoveryTimer);
    dispatch_release((dispatch_object_t)self->_peakAPCE.recoveryTimer);
    self->_peakAPCE.recoveryTimer = 0;
  }
}

- (float)getMovingAverage
{
  float v25 = 0.0;
  float v24 = 0.0;
  float v22 = mach_time_now_in_seconds();
  float v2 = v22 - self->_movingAverageDuration;
  float v21 = v2;
  float v20 = 0.0;
  while ([(NSMutableArray *)self->_frameArray count])
  {
    v18 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"PresentationTimeInSeconds"), "floatValue");
      float v20 = v3;
      if (v3 >= v21) {
        break;
      }
      objc_msgSend((id)objc_msgSend(v18, "objectForKey:", @"APCE"), "floatValue");
      self->_lastFrameAPCE = v4;
      [(NSMutableArray *)self->_frameArray removeObjectAtIndex:0];
    }
  }
  if (![(NSMutableArray *)self->_frameArray count]) {
    return self->_lastFrameAPCE;
  }
  unsigned __int16 v26 = 0;
  id v19 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(v19, "objectForKey:", @"PresentationTimeInSeconds"), "floatValue");
    float v20 = *(float *)&v5;
  }
  *(float *)&double v5 = v20;
  if (v20 > v21)
  {
    float v25 = (float)(self->_lastFrameAPCE * (float)(v20 - v21)) + 0.0;
    *(float *)&double v5 = (float)(v20 - v21) + 0.0;
    float v24 = *(float *)&v5;
  }
  while (v26 + 1 < (unint64_t)[(NSMutableArray *)self->_frameArray count])
  {
    char v17 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:v26];
    v16 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:v26 + 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend((id)objc_msgSend(v17, "objectForKey:"), "floatValue");
        float v15 = v6;
        objc_msgSend((id)objc_msgSend(v16, "objectForKey:", @"PresentationTimeInSeconds"), "floatValue");
        float v14 = v7;
        objc_msgSend((id)objc_msgSend(v17, "objectForKey:", @"APCE"), "floatValue");
        float v25 = v25 + (float)(*(float *)&v5 * (float)(v14 - v15));
        *(float *)&double v5 = v24 + (float)(v14 - v15);
        float v24 = *(float *)&v5;
      }
    }
    ++v26;
  }
  SEL v13 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:v26];
  float v12 = 0.0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"PresentationTimeInSeconds"), "floatValue");
    float v12 = v8;
  }
  if (v22 > v12)
  {
    objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"APCE"), "floatValue");
    float v25 = v25 + (float)(v9 * (float)(v22 - v12));
  }
  return v25 / self->_movingAverageDuration;
}

- (void)enableFrameInfoLogging:(BOOL)a3
{
  self->_frameInfoLoggingEnabled = a3;
}

- (void)processFrameInfo:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_frameInfoLoggingEnabled)
  {
    if (self->_logHandle)
    {
      logHandle = self->_logHandle;
    }
    else
    {
      uint64_t v10 = _COREBRIGHTNESS_LOG_DEFAULT ? _COREBRIGHTNESS_LOG_DEFAULT : init_default_corebrightness_log();
      logHandle = v10;
    }
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
    {
      if (a3->var8) {
        float v3 = "YES";
      }
      else {
        float v3 = "NO";
      }
      if (a3->var9) {
        float v4 = "YES";
      }
      else {
        float v4 = "NO";
      }
      __os_log_helper_16_2_7_4_0_8_0_8_32_8_32_8_0_8_0_8_0((uint64_t)v18, a3->var6, a3->var3, (uint64_t)v3, (uint64_t)v4, COERCE__INT64(a3->var10), COERCE__INT64(a3->var11), COERCE__INT64(a3->var12));
      _os_log_impl(&dword_1BA438000, logHandle, OS_LOG_TYPE_DEFAULT, "FrameStats Info\n{\n\tSwap=%u\n\tPresentationTime=%llu\n\tRTPLC.Triggered=%s\n\tRTPLC.CapApplied=%s\n\tNominalBrightness=%f\n\tScaleFactor=%f\n\tAPCE=%f\n}", v18, 0x44u);
    }
  }
  float v16 = mach_time_to_seconds(a3->var3);
  float var12 = a3->var12;
  self->_scaleFactor = a3->var11;
  id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  *(float *)&double v5 = var12;
  uint64_t v8 = [NSNumber numberWithFloat:v5];
  *(float *)&double v6 = v16;
  id v14 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v8, @"APCE", objc_msgSend(NSNumber, "numberWithFloat:", v6), @"PresentationTimeInSeconds", 0);
  [(NSMutableArray *)self->_frameArray addObject:v14];

  if ([(CBFrameStats *)self shouldPop])
  {
    SEL v13 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend((id)objc_msgSend(v13, "objectForKey:", @"APCE"), "floatValue");
      self->_lastFrameAPCE = v7;
    }
    [(NSMutableArray *)self->_frameArray removeObjectAtIndex:0];
  }
  if (var12 <= self->_peakAPCE.current)
  {
    if ((float)(mach_time_now_in_seconds() - self->_peakAPCE.windowStart) >= self->_peakAPCE.windowSize) {
      self->_peakAPCE.current = self->_peakAPCE.current
    }
                              + (float)((float)(var12 - self->_peakAPCE.current)
                                      * (float)(self->_peakAPCE.timeTaperConstant
                                              / (float)((float)((float)(self->_rtplcCapApplied.triggerCount
                                                                      * self->_rtplcCapApplied.count)
                                                              / 5.0)
                                                      + 1.0)));
  }
  else
  {
    self->_peakAPCE.current = var12;
    self->_peakAPCE.windowStart = mach_time_now_in_seconds();
  }
  if (a3->var9)
  {
    if (self->_previousFramePresentationTime != -1.0) {
      self->_rtplcCapApplied.count = self->_rtplcCapApplied.count
    }
                                   + (float)(60.0 * (float)(v16 - self->_previousFramePresentationTime));
    if (!self->_rtplcCapApplied.previous) {
      self->_rtplcCapApplied.triggerCount = self->_rtplcCapApplied.triggerCount + 1.0;
    }
  }
  if (a3->var8 || a3->var9)
  {
    if (!self->_tripLength)
    {
      self->_currentTripStartTime = mach_time_now_in_seconds();
      self->_tripMaxAPCE = 0.0;
    }
    self->_tripMaxAPCE = fmaxf(a3->var12, self->_tripMaxAPCE);
    ++self->_tripLength;
  }
  else
  {
    self->_tripLength = 0;
  }
  self->_rtplcCapApplied.previous = a3->var9;
  self->_previousFramePresentationTime = v16;
}

- (BOOL)shouldPop
{
  uint64_t v8 = [(NSMutableArray *)self->_frameArray count];
  BOOL v10 = 0;
  if (v8)
  {
    float v7 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:0];
    double v6 = (void *)[(NSMutableArray *)self->_frameArray objectAtIndex:v8 - 1];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend((id)objc_msgSend(v7, "objectForKey:"), "floatValue");
        float v5 = v2;
        objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"PresentationTimeInSeconds"), "floatValue");
        if ((float)(v3 - v5) > self->_movingAverageDuration) {
          return 1;
        }
      }
    }
  }
  return v10;
}

- (float)getPeakAPCECap
{
  v18 = self;
  SEL v17 = a2;
  if (std::vector<float>::empty[abi:ne180100](&self->_rtplcFrameDelayedNitsTable.__begin_))
  {
    float v16 = 0;
    if (v18->_logHandle)
    {
      logHandle = v18->_logHandle;
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
    float v16 = logHandle;
    char v15 = 16;
    if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
    {
      log = v16;
      os_log_type_t type = v15;
      __os_log_helper_16_0_0(v14);
      _os_log_error_impl(&dword_1BA438000, log, type, "FrameStats PeakAPCE | PixelConstraints table is empty!", v14, 2u);
    }
    return 100000.0;
  }
  else
  {
    [(CBFrameStats *)v18 getPeakAPCE];
    float v13 = v2;
    for (int i = 0; ; ++i)
    {
      if (i >= (unint64_t)std::vector<float>::size[abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_)) {
        return *(float *)std::vector<float>::back[abi:ne180100]((uint64_t)&v18->_rtplcFrameDelayedNitsTable);
      }
      if (v13 > *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i)) {
        break;
      }
    }
    if (i)
    {
      float v5 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i);
      float v6 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_, i);
      float v7 = *(float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedAPCETable.__begin_, i - 1);
      float v3 = (float *)std::vector<float>::operator[][abi:ne180100](&v18->_rtplcFrameDelayedNitsTable.__begin_, i - 1);
      return linear_interpolation(v13, v5, v6, v7, *v3);
    }
    else
    {
      return *(float *)std::vector<float>::front[abi:ne180100]((uint64_t)&v18->_rtplcFrameDelayedNitsTable);
    }
  }
}

- (double)movingAverageDuration
{
  return self->_movingAverageDuration;
}

- (void)setMovingAverageDuration:(double)a3
{
  self->_movingAverageDuration = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (unint64_t)tripLength
{
  return self->_tripLength;
}

- (float)currentTripStartTime
{
  return self->_currentTripStartTime;
}

- (float)tripMaxAPCE
{
  return self->_tripMaxAPCE;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end