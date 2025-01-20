@interface VCVideoQualityInfo
- (BOOL)isVideoQualityDegraded;
- (BOOL)updateWithCurrentFramerate:(double)a3 bitrate:(double)a4 time:(double)a5;
- (BOOL)videoIsExpected;
- (VCVideoQualityInfo)init;
- (void)dealloc;
- (void)resetLastGoodVideoQualityTime:(double)a3;
- (void)setVideoIsExpected:(BOOL)a3;
@end

@implementation VCVideoQualityInfo

- (VCVideoQualityInfo)init
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCVideoQualityInfo;
  v2 = [(VCObject *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastGoodVideoQualityTime = 0.0;
    v2->_lastVideoQualityDegradedSwitchTime = 0.0;
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-video-degraded-threshold"), "doubleValue");
    if (v4 < 5.0) {
      double v4 = 5.0;
    }
    v3->_double videoDegradedThreshold = v4;
    v3->_double videoDegradedThreshold = VCDefaults_GetDoubleValueForKey(@"videoDegradedThreshold", v4);
    v3->_double videoImprovedThreshold = VCDefaults_GetDoubleValueForKey(@"videoImprovedThreshold", 1.5);
    v3->_double videoMinFrameRate = VCDefaults_GetDoubleValueForKey(@"videoMinFrameRate", 0.2);
    v3->_BOOL shouldUseExitHysteresis = VCDefaults_GetBoolValueForKey(@"shouldUseExitHysteresis", 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double videoDegradedThreshold = v3->_videoDegradedThreshold;
        double videoImprovedThreshold = v3->_videoImprovedThreshold;
        double videoMinFrameRate = v3->_videoMinFrameRate;
        BOOL shouldUseExitHysteresis = v3->_shouldUseExitHysteresis;
        *(_DWORD *)buf = 136316674;
        uint64_t v14 = v5;
        __int16 v15 = 2080;
        v16 = "-[VCVideoQualityInfo init]";
        __int16 v17 = 1024;
        int v18 = 50;
        __int16 v19 = 2048;
        double v20 = videoDegradedThreshold;
        __int16 v21 = 2048;
        double v22 = videoImprovedThreshold;
        __int16 v23 = 2048;
        double v24 = videoMinFrameRate;
        __int16 v25 = 1024;
        BOOL v26 = shouldUseExitHysteresis;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d double videoDegradedThreshold = %f videoImprovedThreshold = %f videoMinFrameRate = %f shouldUseExitHysteresis = %d", buf, 0x40u);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCVideoQualityInfo;
  [(VCObject *)&v2 dealloc];
}

- (void)resetLastGoodVideoQualityTime:(double)a3
{
  self->_lastGoodVideoQualityTime = a3;
}

- (BOOL)updateWithCurrentFramerate:(double)a3 bitrate:(double)a4 time:(double)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_videoIsExpected)
  {
    double firstDegradedMeasure = self->_firstDegradedMeasure;
    if (firstDegradedMeasure == 0.0)
    {
      self->_double firstDegradedMeasure = a5;
      double firstDegradedMeasure = a5;
    }
    if (a5 - firstDegradedMeasure >= 10.0)
    {
      if (self->_lastGoodVideoQualityTime <= 0.0)
      {
        self->_double lastGoodVideoQualityTime = a5;
        self->_lastVideoQualityDegradedSwitchTime = a5;
        self->_lastBadVideoQualityTime = a5 - self->_videoImprovedThreshold;
      }
      if (self->_videoMinFrameRate >= a3)
      {
        self->_lastBadVideoQualityTime = a5;
        double lastGoodVideoQualityTime = self->_lastGoodVideoQualityTime;
      }
      else
      {
        self->_double lastGoodVideoQualityTime = a5;
        double lastGoodVideoQualityTime = a5;
      }
      double videoDegradedThreshold = self->_videoDegradedThreshold;
      if (a5 - lastGoodVideoQualityTime <= videoDegradedThreshold)
      {
        if (self->_isVideoQualityDegraded)
        {
          if ((p_lastVideoQualityDegradedSwitchTime = &self->_lastVideoQualityDegradedSwitchTime,
                a5 - self->_lastVideoQualityDegradedSwitchTime > videoDegradedThreshold)
            && self->_shouldUseExitHysteresis
            || a5 - self->_lastBadVideoQualityTime > self->_videoImprovedThreshold)
          {
            self->_BOOL isVideoQualityDegraded = 0;
LABEL_18:
            double *p_lastVideoQualityDegradedSwitchTime = a5;
            if ((VCVideoQualityInfo *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                return 1;
              }
              uint64_t v12 = VRTraceErrorLogLevelToCSTR();
              v13 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                return 1;
              }
              BOOL isVideoQualityDegraded = self->_isVideoQualityDegraded;
              int v21 = 136315906;
              uint64_t v22 = v12;
              __int16 v23 = 2080;
              double v24 = "-[VCVideoQualityInfo updateWithCurrentFramerate:bitrate:time:]";
              __int16 v25 = 1024;
              int v26 = 120;
              __int16 v27 = 1024;
              LODWORD(v28) = isVideoQualityDegraded;
              __int16 v15 = " [%s] %s:%d isVideoQualityDegraded:%d";
              v16 = v13;
              uint32_t v17 = 34;
            }
            else
            {
              if (objc_opt_respondsToSelector()) {
                v10 = (__CFString *)[(VCVideoQualityInfo *)self performSelector:sel_logPrefix];
              }
              else {
                v10 = &stru_1F3D3E450;
              }
              if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
                return 1;
              }
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              __int16 v19 = *MEMORY[0x1E4F47A50];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
                return 1;
              }
              BOOL v20 = self->_isVideoQualityDegraded;
              int v21 = 136316418;
              uint64_t v22 = v18;
              __int16 v23 = 2080;
              double v24 = "-[VCVideoQualityInfo updateWithCurrentFramerate:bitrate:time:]";
              __int16 v25 = 1024;
              int v26 = 120;
              __int16 v27 = 2112;
              v28 = v10;
              __int16 v29 = 2048;
              v30 = self;
              __int16 v31 = 1024;
              BOOL v32 = v20;
              __int16 v15 = " [%s] %s:%d %@(%p) isVideoQualityDegraded:%d";
              v16 = v19;
              uint32_t v17 = 54;
            }
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
            return 1;
          }
        }
      }
      else if (!self->_isVideoQualityDegraded)
      {
        self->_BOOL isVideoQualityDegraded = 1;
        p_lastVideoQualityDegradedSwitchTime = &self->_lastVideoQualityDegradedSwitchTime;
        goto LABEL_18;
      }
    }
  }
  return 0;
}

- (void)setVideoIsExpected:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL videoIsExpected = self->_videoIsExpected;
  if (videoIsExpected != a3)
  {
    BOOL v4 = a3;
    self->_double firstDegradedMeasure = 0.0;
    if (videoIsExpected)
    {
      BOOL isVideoQualityDegraded = self->_isVideoQualityDegraded;
      double v7 = micro();
      v8 = &OBJC_IVAR___VCVideoQualityInfo__lastVideoQualityDegradedSwitchTime;
      if (!isVideoQualityDegraded) {
        v8 = &OBJC_IVAR___VCVideoQualityInfo__lastGoodVideoQualityTime;
      }
      *(double *)((char *)&self->super.super.isa + *v8) = v7;
    }
    self->_BOOL videoIsExpected = v4;
    if ((VCVideoQualityInfo *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315906;
          uint64_t v18 = v10;
          __int16 v19 = 2080;
          BOOL v20 = "-[VCVideoQualityInfo setVideoIsExpected:]";
          __int16 v21 = 1024;
          int v22 = 140;
          __int16 v23 = 1024;
          LODWORD(v24) = v4;
          uint64_t v12 = " [%s] %s:%d videoIsExpected=%d";
          v13 = v11;
          uint32_t v14 = 34;
LABEL_16:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCVideoQualityInfo *)self performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136316418;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          BOOL v20 = "-[VCVideoQualityInfo setVideoIsExpected:]";
          __int16 v21 = 1024;
          int v22 = 140;
          __int16 v23 = 2112;
          double v24 = v9;
          __int16 v25 = 2048;
          int v26 = self;
          __int16 v27 = 1024;
          BOOL v28 = v4;
          uint64_t v12 = " [%s] %s:%d %@(%p) videoIsExpected=%d";
          v13 = v16;
          uint32_t v14 = 54;
          goto LABEL_16;
        }
      }
    }
  }
}

- (BOOL)isVideoQualityDegraded
{
  return self->_isVideoQualityDegraded;
}

- (BOOL)videoIsExpected
{
  return self->_videoIsExpected;
}

@end