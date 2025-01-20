@interface BWNRFAdaptiveBracketingParameters
- (BOOL)generateWhiteBalanceParameters;
- (BOOL)stationary;
- initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:;
- (double)totalIntegrationTime;
- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6;
- (float)evZeroTargetGain;
- (float)previewSNR;
- (id)adaptiveBracketingFrameParametersForGroup:(int)a3;
- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4;
- (void)dealloc;
- (void)stopAdaptiveBracketing;
@end

@implementation BWNRFAdaptiveBracketingParameters

- initWithProgressiveBracketingParameters:(uint64_t)a3 progressiveBracketingStatisticsClass:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)BWNRFAdaptiveBracketingParameters;
  v5 = objc_msgSendSuper2(&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[2] = 0;
    *((void *)v5 + 2) = a2;
    *((void *)v6 + 4) = a3;
  }
  return v6;
}

- (void)dealloc
{
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = 0;
  os_unfair_lock_unlock(&self->_adaptiveBracketingParametersLock);
  v3.receiver = self;
  v3.super_class = (Class)BWNRFAdaptiveBracketingParameters;
  [(BWNRFAdaptiveBracketingParameters *)&v3 dealloc];
}

- (void)stopAdaptiveBracketing
{
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    *(unsigned char *)(a1 + 24) = 1;
    os_unfair_lock_unlock(v2);
  }
}

- (id)adaptiveBracketingFrameParametersForGroup:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = (void *)[(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters currentBracketingParametersForGroup:v3];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v11 integrationTime];
        double v13 = v12;
        [v11 gain];
        int v15 = v14;
        uint64_t v16 = [v11 AGC];
        LODWORD(v17) = v15;
        objc_msgSend(v5, "addObject:", +[BWAdaptiveBracketingFrameParameters frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:](BWAdaptiveBracketingFrameParameters, "frameParametersWithIntegrationTimeInSeconds:gain:maxAGC:", v16, v13, v17));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }
  p_adaptiveBracketingParametersLock = &self->_adaptiveBracketingParametersLock;
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
  BOOL stopAdaptiveBracketing = self->_stopAdaptiveBracketing;
  os_unfair_lock_unlock(p_adaptiveBracketingParametersLock);
  if (stopAdaptiveBracketing) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)generateWhiteBalanceParameters
{
  return [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters recomputeAWBCCM];
}

- (float)evZeroTargetGain
{
  [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters evZeroTargetGain];
  return result;
}

- (float)previewSNR
{
  [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters previewSNR];
  return result;
}

- (double)totalIntegrationTime
{
  [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters totalIntegrationTime];
  return result;
}

- (BOOL)stationary
{
  v2 = (void *)[(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters statistics];
  return [v2 stationary];
}

- (double)totalIntegrationTimeForDigitalFlashMode:(int)a3 frameStatistics:(id)a4 stationary:(BOOL)a5 detectedObjects:(id)a6
{
  if (!a4)
  {
    FigDebugAssert3();
    double v9 = 0.0;
    return round(v9 * 100.0) / 100.0;
  }
  NRFStatisticsFromFrameStatistics = (NRFProgressiveBracketingStatistics *)nfrp_createNRFStatisticsFromFrameStatistics(self->_progressiveBracketingStatisticsClass, a4, a5, a6);
  if (a3 == 1)
  {
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  double v9 = 0.0;
  if (a3 == 2)
  {
    uint64_t v10 = 1;
LABEL_6:
    [(NRFProgressiveBracketingParameters *)self->_progressiveBracketingParameters computeTotalIntegrationTimeWithStatistics:NRFStatisticsFromFrameStatistics forMode:v10];
    double v9 = v11;
  }
  os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);

  self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider = NRFStatisticsFromFrameStatistics;
  os_unfair_lock_unlock(&self->_adaptiveBracketingParametersLock);
  return round(v9 * 100.0) / 100.0;
}

- (id)adaptiveBracketingParametersForDigitalFlashMode:(int)a3 sphereOffsetEnabled:(BOOL)a4
{
  if (a3)
  {
    BOOL v5 = a4;
    p_adaptiveBracketingParametersLock = &self->_adaptiveBracketingParametersLock;
    os_unfair_lock_lock(&self->_adaptiveBracketingParametersLock);
    double v9 = self->_lastProgressiveBracketingStatisticsForTotalIntegrationTimesProvider;
    os_unfair_lock_unlock(p_adaptiveBracketingParametersLock);
    if (v9)
    {
      id v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:portType:statistics:mode:sphereOffsetEnabled:", -[NRFProgressiveBracketingParameters options](self->_progressiveBracketingParameters, "options"), -[NRFProgressiveBracketingParameters portType](self->_progressiveBracketingParameters, "portType"), v9, a3 == 2, v5);

      double v11 = -[BWNRFAdaptiveBracketingParameters initWithProgressiveBracketingParameters:progressiveBracketingStatisticsClass:]([BWNRFAdaptiveBracketingParameters alloc], v10, (uint64_t)self->_progressiveBracketingStatisticsClass);
    }
    else
    {
      double v11 = 0;
    }
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

@end