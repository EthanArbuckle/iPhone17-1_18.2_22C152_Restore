@interface BWUBAdaptiveBracketingParameters
- (BOOL)generateWhiteBalanceParameters;
- (BOOL)stationary;
- (double)totalIntegrationTime;
- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6;
- (float)evZeroTargetGain;
- (float)previewSNR;
- (id)adaptiveBracketingFrameParametersForGroup:(int)a3;
- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4;
- (void)dealloc;
- (void)initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:;
- (void)stopAdaptiveBracketing;
- (void)updateAdaptiveBracketingFrameParametersUsingGroup:(uint64_t)a1;
@end

@implementation BWUBAdaptiveBracketingParameters

- (void)initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWUBAdaptiveBracketingParameters;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[5] = a3;
    *((_DWORD *)v5 + 4) = 0;
    -[BWUBAdaptiveBracketingParameters updateAdaptiveBracketingFrameParametersUsingGroup:]((uint64_t)v5, 1);
  }
  return v5;
}

- (void)updateAdaptiveBracketingFrameParametersUsingGroup:(uint64_t)a1
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    v5 = (void *)[*(id *)(a1 + 8) currentBracketingParametersForGroup:a2];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          [v10 integrationTime];
          double v12 = v11;
          [v10 gain];
          int v14 = v13;
          uint64_t v15 = [v10 AGC];
          LODWORD(v16) = v14;
          objc_msgSend(v4, "addObject:", +[BWAdaptiveBracketingFrameParameters frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:](BWAdaptiveBracketingFrameParameters, "frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:", v15, v12, v16));
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    if (!*(unsigned char *)(a1 + 32))
    {

      *(void *)(a1 + 24) = [v4 copy];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWUBAdaptiveBracketingParameters;
  [(BWUBAdaptiveBracketingParameters *)&v3 dealloc];
}

- (void)stopAdaptiveBracketing
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    *(unsigned char *)(a1 + 32) = 1;

    *(void *)(a1 + 24) = 0;
    os_unfair_lock_unlock(v2);
  }
}

- (id)adaptiveBracketingFrameParametersForGroup:(int)a3
{
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  v5 = self->_adaptiveBracketingFrameParameters;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v5;
}

- (BOOL)generateWhiteBalanceParameters
{
  v2 = self;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  LOBYTE(v2) = [(UBProgressiveBracketingParameters *)v2->_progressiveBracketingParameters recomputeAWBCCM];
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return (char)v2;
}

- (float)evZeroTargetGain
{
  return 0.0;
}

- (float)previewSNR
{
  return 0.0;
}

- (double)totalIntegrationTime
{
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  [(UBProgressiveBracketingParameters *)self->_progressiveBracketingParameters totalIntegrationTime];
  double v5 = v4;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v5;
}

- (BOOL)stationary
{
  v2 = self;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  LOBYTE(v2) = objc_msgSend((id)-[UBProgressiveBracketingParameters statistics](v2->_progressiveBracketingParameters, "statistics"), "stationary");
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return (char)v2;
}

- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6
{
  if (!a4)
  {
    FigDebugAssert3();
    return 0.0;
  }
  BOOL v6 = a5;
  p_adaptiveBracketingFrameParametersLock = &self->_adaptiveBracketingFrameParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingFrameParametersLock);
  if (a3 == 2)
  {
    UBStatisticsFromFrameStatistics = (UBProgressiveBracketingStatistics *)udp_createUBStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, v6);
    progressiveBracketingParameters = self->_progressiveBracketingParameters;
    int v13 = UBStatisticsFromFrameStatistics;
    uint64_t v14 = 1;
  }
  else
  {
    if (a3 != 1)
    {
      UBStatisticsFromFrameStatistics = 0;
      double v16 = 0.0;
      goto LABEL_8;
    }
    UBStatisticsFromFrameStatistics = (UBProgressiveBracketingStatistics *)udp_createUBStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, v6);
    progressiveBracketingParameters = self->_progressiveBracketingParameters;
    int v13 = UBStatisticsFromFrameStatistics;
    uint64_t v14 = 0;
  }
  [(UBProgressiveBracketingParameters *)progressiveBracketingParameters computeTotalIntegrationTimeWithStatistics:v13 forMode:v14];
  double v16 = v15;
LABEL_8:

  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = UBStatisticsFromFrameStatistics;
  os_unfair_lock_unlock(p_adaptiveBracketingFrameParametersLock);
  return v16;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4
{
  if (a3)
  {
    id v6 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:portType:statistics:mode:", -[UBProgressiveBracketingParameters options](self->_progressiveBracketingParameters, "options"), -[UBProgressiveBracketingParameters portType](self->_progressiveBracketingParameters, "portType"), self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider, a3 == 2);
    uint64_t v7 = -[BWUBAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWUBAdaptiveBracketingParameters alloc], v6, (uint64_t)self->_progressiveBracketingStatisticsClass);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

@end