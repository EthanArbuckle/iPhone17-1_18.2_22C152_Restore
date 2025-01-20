@interface BWImageControlModeTransitionMonitor
+ (void)initialize;
- (BOOL)isTransitionCompleteWithSampleBuffer:(opaqueCMSampleBuffer *)a3 masterCaptureStreamPortType:(id)a4 activeSlaveStreamPortType:(id)a5;
- (BOOL)waitForTorchToRampUp;
- (BWImageControlModeTransitionMonitor)init;
- (NSDictionary)expectedLTMCurvesByPortType;
- (NSDictionary)expectedMaximumFrameRatesByPortType;
- (NSDictionary)expectedMinimumFrameRatesByPortType;
- (NSDictionary)expectedSphereModesByPortType;
- (double)coarseFocusCheckTimeout;
- (id)description;
- (int)ltmCurvesTransitionFrameCount;
- (void)dealloc;
- (void)setCoarseFocusCheckTimeout:(double)a3;
- (void)setExpectedLTMCurvesByPortType:(id)a3;
- (void)setExpectedMaximumFrameRatesByPortType:(id)a3;
- (void)setExpectedMinimumFrameRatesByPortType:(id)a3;
- (void)setExpectedSphereModesByPortType:(id)a3;
- (void)setLtmCurvesTransitionFrameCount:(int)a3;
- (void)setWaitForTorchToRampUp:(BOOL)a3;
@end

@implementation BWImageControlModeTransitionMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWImageControlModeTransitionMonitor)init
{
  v5.receiver = self;
  v5.super_class = (Class)BWImageControlModeTransitionMonitor;
  v2 = [(BWImageControlModeTransitionMonitor *)&v5 init];
  if (v2)
  {
    *((void *)v2 + 8) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v2 + 9) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v2 + 10) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *((void *)v2 + 6) = 0;
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v2 + 92) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v2 + 108) = *(void *)(v3 + 16);
  }
  return (BWImageControlModeTransitionMonitor *)v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWImageControlModeTransitionMonitor;
  [(BWImageControlModeTransitionMonitor *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p> Frame wait count %d.\nExpectedSphereModes %@, Actual %@\nExpectedMinimumFrameRates %@, ExpectedMaximumFrameRates %@, ActualFramerates %@", NSStringFromClass(v4), self, HIDWORD(self->_firstFramePTS.epoch), self->_expectedSphereModesByPortType, self->_currentSphereModesByPortType, self->_expectedMinimumFrameRatesByPortType, self->_expectedMaximumFrameRatesByPortType, self->_currentFrameRatesByPortType];
}

- (BOOL)isTransitionCompleteWithSampleBuffer:(opaqueCMSampleBuffer *)a3 masterCaptureStreamPortType:(id)a4 activeSlaveStreamPortType:(id)a5
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  v8 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v63 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F542E0]];
  uint64_t v64 = v9;
  v66 = v8;
  if (self->_expectedSphereModesByPortType)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentSphereModesByPortType, "setObject:forKeyedSubscript:", [v8 objectForKeyedSubscript:*MEMORY[0x1E4F54280]], v9);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    expectedSphereModesByPortType = self->_expectedSphereModesByPortType;
    uint64_t v11 = [(NSDictionary *)expectedSphereModesByPortType countByEnumeratingWithState:&v80 objects:v98 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v81;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v81 != v13) {
            objc_enumerationMutation(expectedSphereModesByPortType);
          }
          v15 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          if ((([v15 isEqualToString:a4] & 1) != 0
             || [v15 isEqualToString:a5])
            && !objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedSphereModesByPortType, "objectForKeyedSubscript:", v15), "isEqualToString:", -[NSMutableDictionary objectForKeyedSubscript:](self->_currentSphereModesByPortType, "objectForKeyedSubscript:", v15)))
          {
            BOOL v16 = 0;
            uint64_t v9 = v64;
            v8 = v66;
            goto LABEL_16;
          }
        }
        uint64_t v12 = [(NSDictionary *)expectedSphereModesByPortType countByEnumeratingWithState:&v80 objects:v98 count:16];
        BOOL v16 = 1;
        uint64_t v9 = v64;
        v8 = v66;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_16:
  if ((objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BB8]), "BOOLValue") & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E4F53DA0];
    if (self->_expectedMinimumFrameRatesByPortType)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentFrameRatesByPortType, "setObject:forKeyedSubscript:", [v8 objectForKeyedSubscript:*MEMORY[0x1E4F53DA0]], v9);
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      expectedMinimumFrameRatesByPortType = self->_expectedMinimumFrameRatesByPortType;
      uint64_t v19 = [(NSDictionary *)expectedMinimumFrameRatesByPortType countByEnumeratingWithState:&v76 objects:v97 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v77;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v77 != v21) {
              objc_enumerationMutation(expectedMinimumFrameRatesByPortType);
            }
            v23 = *(void **)(*((void *)&v76 + 1) + 8 * j);
            if (([v23 isEqualToString:a4] & 1) != 0
              || [v23 isEqualToString:a5])
            {
              objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedMinimumFrameRatesByPortType, "objectForKeyedSubscript:", v23), "floatValue");
              float v25 = v24;
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentFrameRatesByPortType, "objectForKeyedSubscript:", v23), "floatValue");
              if ((float)(v26 + 0.1) < v25)
              {
                LOBYTE(v16) = 0;
                goto LABEL_30;
              }
            }
          }
          uint64_t v20 = [(NSDictionary *)expectedMinimumFrameRatesByPortType countByEnumeratingWithState:&v76 objects:v97 count:16];
          if (v20) {
            continue;
          }
          break;
        }
LABEL_30:
        uint64_t v9 = v64;
        v8 = v66;
        v17 = (void *)MEMORY[0x1E4F53DA0];
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
    if (self->_expectedMaximumFrameRatesByPortType)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentFrameRatesByPortType, "setObject:forKeyedSubscript:", [v8 objectForKeyedSubscript:*v17], v9);
      long long v75 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      long long v72 = 0u;
      expectedMaximumFrameRatesByPortType = self->_expectedMaximumFrameRatesByPortType;
      uint64_t v28 = [(NSDictionary *)expectedMaximumFrameRatesByPortType countByEnumeratingWithState:&v72 objects:v96 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v73;
LABEL_35:
        uint64_t v31 = 0;
        while (1)
        {
          if (*(void *)v73 != v30) {
            objc_enumerationMutation(expectedMaximumFrameRatesByPortType);
          }
          v32 = *(void **)(*((void *)&v72 + 1) + 8 * v31);
          if (([v32 isEqualToString:a4] & 1) != 0
            || [v32 isEqualToString:a5])
          {
            objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedMaximumFrameRatesByPortType, "objectForKeyedSubscript:", v32), "floatValue");
            float v34 = v33;
            objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentFrameRatesByPortType, "objectForKeyedSubscript:", v32), "floatValue");
            if ((float)(v35 + 0.1) < v34) {
              break;
            }
          }
          if (v29 == ++v31)
          {
            uint64_t v29 = [(NSDictionary *)expectedMaximumFrameRatesByPortType countByEnumeratingWithState:&v72 objects:v96 count:16];
            if (v29) {
              goto LABEL_35;
            }
            goto LABEL_43;
          }
        }
      }
      else
      {
LABEL_43:
        if (v16)
        {
          BOOL v16 = 1;
LABEL_46:
          uint64_t v9 = v64;
          v8 = v66;
          goto LABEL_48;
        }
      }
      BOOL v16 = SHIDWORD(self->_firstFramePTS.epoch) > 10;
      goto LABEL_46;
    }
    BOOL v16 = 0;
  }
LABEL_48:
  if (!self->_expectedLTMCurvesByPortType)
  {
    BOOL v16 = 0;
    goto LABEL_64;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentLTMCurvesByPortType, "setObject:forKeyedSubscript:", [v8 objectForKeyedSubscript:*MEMORY[0x1E4F53FF8]], v9);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  expectedLTMCurvesByPortType = self->_expectedLTMCurvesByPortType;
  uint64_t v37 = [(NSDictionary *)expectedLTMCurvesByPortType countByEnumeratingWithState:&v68 objects:v95 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    BOOL v65 = v16;
    uint64_t v39 = *(void *)v69;
    while (2)
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v69 != v39) {
          objc_enumerationMutation(expectedLTMCurvesByPortType);
        }
        v41 = *(void **)(*((void *)&v68 + 1) + 8 * k);
        if (([v41 isEqualToString:a4] & 1) != 0
          || [v41 isEqualToString:a5])
        {
          int v42 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_expectedLTMCurvesByPortType, "objectForKeyedSubscript:", v41), "intValue");
          if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentLTMCurvesByPortType, "objectForKeyedSubscript:", v41), "intValue") != v42)
          {
            int ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
            if (ltmCurvesTransitionFrameCount > 0)
            {
              int v44 = 0;
              v45 = (void *)v63;
              BOOL v16 = v65;
              v8 = v66;
              goto LABEL_67;
            }
            v45 = (void *)v63;
            BOOL v16 = v65;
            v8 = v66;
            goto LABEL_71;
          }
        }
      }
      uint64_t v38 = [(NSDictionary *)expectedLTMCurvesByPortType countByEnumeratingWithState:&v68 objects:v95 count:16];
      if (v38) {
        continue;
      }
      break;
    }
    int ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
    BOOL v16 = v65;
    v8 = v66;
    if (ltmCurvesTransitionFrameCount > 0) {
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  int ltmCurvesTransitionFrameCount = self->_ltmCurvesTransitionFrameCount;
  if (ltmCurvesTransitionFrameCount < 1)
  {
LABEL_64:
    v45 = (void *)v63;
    goto LABEL_71;
  }
LABEL_66:
  int v44 = self->_ltmCurvesTransitionFrameWaitCount + 1;
  v45 = (void *)v63;
LABEL_67:
  self->_ltmCurvesTransitionFrameWaitCount = v44;
  if (v44 < ltmCurvesTransitionFrameCount) {
    BOOL v16 = 0;
  }
LABEL_71:
  if (self->_coarseFocusCheckTimeout > 0.0 && !LOBYTE(self->_frameWaitCount))
  {
    int v46 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F53BF8]), "intValue");
    LOBYTE(self->_frameWaitCount) = v46 != 2;
    if (v46 == 2)
    {
      memset(v84, 0, 24);
      CMSampleBufferGetPresentationTimeStamp((CMTime *)v84, a3);
      v47 = &self->_ltmCurvesTransitionFrameWaitCount + 1;
      if (self->_firstFramePTS.timescale)
      {
        CMTime lhs = *(CMTime *)v84;
        *(_OWORD *)&rhs.unsigned int value = *(_OWORD *)v47;
        rhs.epoch = *(void *)&self->_firstFramePTS.flags;
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > self->_coarseFocusCheckTimeout)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          LOBYTE(self->_frameWaitCount) = 1;
        }
      }
      else
      {
        CMSampleBufferGetPresentationTimeStamp(&lhs, a3);
        *(_OWORD *)v47 = *(_OWORD *)&lhs.value;
        *(void *)&self->_firstFramePTS.flags = lhs.epoch;
      }
      if (!LOBYTE(self->_frameWaitCount)) {
        BOOL v16 = 0;
      }
    }
  }
  if (self->_waitForTorchToRampUp)
  {
    if (v16 & ~objc_msgSend((id)CMGetAttachment(a3, @"DropFrameWaitingForTorchToRampUp", 0), "BOOLValue"))
    {
LABEL_82:
      BOOL v49 = 1;
      goto LABEL_92;
    }
  }
  else if (v16)
  {
    goto LABEL_82;
  }
  if (SHIDWORD(self->_firstFramePTS.epoch) < 45)
  {
    BOOL v49 = 0;
  }
  else
  {
    LODWORD(rhs.value) = 0;
    v50 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int value = rhs.value;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v52 = value;
    }
    else {
      unsigned int v52 = value & 0xFFFFFFFE;
    }
    if (v52)
    {
      int epoch_high = HIDWORD(self->_firstFramePTS.epoch);
      v54 = self->_expectedSphereModesByPortType;
      v55 = self->_expectedMinimumFrameRatesByPortType;
      v56 = self->_expectedMaximumFrameRatesByPortType;
      currentSphereModesByPortType = self->_currentSphereModesByPortType;
      currentFrameRatesByPortType = self->_currentFrameRatesByPortType;
      *(_DWORD *)v84 = 136316674;
      *(void *)&v84[4] = "-[BWImageControlModeTransitionMonitor isTransitionCompleteWithSampleBuffer:masterCaptureStrea"
                           "mPortType:activeSlaveStreamPortType:]";
      *(_WORD *)&v84[12] = 1024;
      *(_DWORD *)&v84[14] = epoch_high;
      *(_WORD *)&v84[18] = 2112;
      *(void *)&v84[20] = v54;
      __int16 v85 = 2112;
      v86 = currentSphereModesByPortType;
      __int16 v87 = 2112;
      v88 = v55;
      __int16 v89 = 2112;
      v90 = v56;
      __int16 v91 = 2112;
      v92 = currentFrameRatesByPortType;
      LODWORD(v61) = 68;
      v60 = v84;
      _os_log_send_and_compose_impl();
    }
    BOOL v49 = 1;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_92:
  if ((objc_msgSend(v45, "BOOLValue", v60, v61) & 1) != 0 || !v45) {
    ++HIDWORD(self->_firstFramePTS.epoch);
  }
  return v49;
}

- (NSDictionary)expectedSphereModesByPortType
{
  return self->_expectedSphereModesByPortType;
}

- (void)setExpectedSphereModesByPortType:(id)a3
{
}

- (NSDictionary)expectedMinimumFrameRatesByPortType
{
  return self->_expectedMinimumFrameRatesByPortType;
}

- (void)setExpectedMinimumFrameRatesByPortType:(id)a3
{
}

- (NSDictionary)expectedMaximumFrameRatesByPortType
{
  return self->_expectedMaximumFrameRatesByPortType;
}

- (void)setExpectedMaximumFrameRatesByPortType:(id)a3
{
}

- (NSDictionary)expectedLTMCurvesByPortType
{
  return self->_expectedLTMCurvesByPortType;
}

- (void)setExpectedLTMCurvesByPortType:(id)a3
{
}

- (int)ltmCurvesTransitionFrameCount
{
  return self->_ltmCurvesTransitionFrameCount;
}

- (void)setLtmCurvesTransitionFrameCount:(int)a3
{
  self->_int ltmCurvesTransitionFrameCount = a3;
}

- (double)coarseFocusCheckTimeout
{
  return self->_coarseFocusCheckTimeout;
}

- (void)setCoarseFocusCheckTimeout:(double)a3
{
  self->_coarseFocusCheckTimeout = a3;
}

- (BOOL)waitForTorchToRampUp
{
  return self->_waitForTorchToRampUp;
}

- (void)setWaitForTorchToRampUp:(BOOL)a3
{
  self->_waitForTorchToRampUp = a3;
}

@end