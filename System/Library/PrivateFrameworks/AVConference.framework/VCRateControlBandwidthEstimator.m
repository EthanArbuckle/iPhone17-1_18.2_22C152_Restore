@interface VCRateControlBandwidthEstimator
- (BOOL)fastSuddenBandwidthDetectionEnabled;
- (VCRateControlBandwidthEstimator)init;
- (VCRateControlServerBag)serverBag;
- (double)estimatedBandwidth;
- (double)estimatedBandwidthUncapped;
- (double)lastProbingArrivalTime;
- (int)bandwidthEstimationState;
- (unsigned)mode;
- (unsigned)radioAccessTechnology;
- (void)dealloc;
- (void)enableBWELogDump:(void *)a3;
- (void)setEstimatedBandwidth:(double)a3;
- (void)setEstimatedBandwidthUncapped:(double)a3;
- (void)setMaxBitrateForBandwidthEstimator:(unsigned int)a3;
- (void)setMode:(unsigned int)a3;
- (void)setRadioAccessTechnology:(unsigned int)a3;
- (void)setServerBag:(id)a3;
@end

@implementation VCRateControlBandwidthEstimator

- (VCRateControlBandwidthEstimator)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCRateControlBandwidthEstimator;
  v2 = [(VCRateControlBandwidthEstimator *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(SuddenChangeParameters);
    v2->_suddenChangeParameters = v3;
    [(SuddenChangeParameters *)v3 setPercentage:0.5];
    [(SuddenChangeParameters *)v2->_suddenChangeParameters setMinSamplesCountFastBandwidthEstimation:10];
    v2->_minProbingSequenceSize = 250;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlBandwidthEstimator;
  [(VCRateControlBandwidthEstimator *)&v3 dealloc];
}

- (void)setMaxBitrateForBandwidthEstimator:(unsigned int)a3
{
  self->_maxBitrate = a3;
  _VCRateControlBandwidthEstimator_UpdateQualificationParameters((uint64_t)self);
}

- (void)setMode:(unsigned int)a3
{
  self->_mode = a3;
  _VCRateControlBandwidthEstimator_UpdateQualificationParameters((uint64_t)self);
}

- (void)setServerBag:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  serverBag = self->_serverBag;
  if (serverBag == a3
    || -[NSDictionary isEqualToDictionary:](-[VCRateControlServerBag serverBagDictionary](serverBag, "serverBagDictionary"), "isEqualToDictionary:", [a3 serverBagDictionary]))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136316162;
        uint64_t v22 = v6;
        __int16 v23 = 2080;
        v24 = "-[VCRateControlBandwidthEstimator setServerBag:]";
        __int16 v25 = 1024;
        int v26 = 176;
        __int16 v27 = 2048;
        v28 = a3;
        __int16 v29 = 2048;
        v30 = self;
        v8 = "VCRC [%s] %s:%d Same serverbag=%p is set to the bandwidthEstimator=%p";
        v9 = v7;
        uint32_t v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v21, v10);
      }
    }
  }
  else
  {

    v11 = (VCRateControlServerBag *)a3;
    self->_serverBag = v11;
    BOOL v12 = [(VCRateControlServerBag *)v11 containsAllSecondaryKeysWithPrimaryKey:@"bwEstimation"];
    if (v12)
    {
      self->_BOOL fastSuddenBandwidthDetectionEnabled = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"bwEstimation", @"aggModeEnabled", 0), "BOOLValue");
      self->_unsigned int minProbingSequenceSize = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"bwEstimation", @"minProbingSequenceSize", 0), "integerValue");
      objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"bwEstimation", @"suddenBWDPercentage", 2), "doubleValue");
      -[SuddenChangeParameters setPercentage:](self->_suddenChangeParameters, "setPercentage:");
      -[SuddenChangeParameters setMinSamplesCountFastBandwidthEstimation:](self->_suddenChangeParameters, "setMinSamplesCountFastBandwidthEstimation:", objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", @"bwEstimation", @"minFastBWDSampleCount", 0), "integerValue"));
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [@"bwEstimation" UTF8String];
        BOOL fastSuddenBandwidthDetectionEnabled = self->_fastSuddenBandwidthDetectionEnabled;
        unsigned int minProbingSequenceSize = self->_minProbingSequenceSize;
        [(SuddenChangeParameters *)self->_suddenChangeParameters percentage];
        uint64_t v19 = v18;
        int v20 = [(SuddenChangeParameters *)self->_suddenChangeParameters minSamplesCountFastBandwidthEstimation];
        int v21 = 136317442;
        uint64_t v22 = v13;
        __int16 v23 = 2080;
        v24 = "-[VCRateControlBandwidthEstimator setServerBag:]";
        __int16 v25 = 1024;
        int v26 = 189;
        __int16 v27 = 2048;
        v28 = self;
        __int16 v29 = 2080;
        v30 = (VCRateControlBandwidthEstimator *)v15;
        __int16 v31 = 1024;
        BOOL v32 = v12;
        __int16 v33 = 1024;
        BOOL v34 = fastSuddenBandwidthDetectionEnabled;
        __int16 v35 = 1024;
        unsigned int v36 = minProbingSequenceSize;
        __int16 v37 = 2048;
        uint64_t v38 = v19;
        __int16 v39 = 1024;
        int v40 = v20;
        v8 = "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d fastSuddenBandwidthDetectionEnabled=%d min"
             "ProbingSequenceSize=%d suddenBWDPercentage=%f minFastBWDSampleCount=%d";
        v9 = v14;
        uint32_t v10 = 82;
        goto LABEL_11;
      }
    }
  }
}

- (void)enableBWELogDump:(void *)a3
{
  self->_logBWEDump = a3;
}

- (unsigned)radioAccessTechnology
{
  return self->_radioAccessTechnology;
}

- (void)setRadioAccessTechnology:(unsigned int)a3
{
  self->_radioAccessTechnology = a3;
}

- (unsigned)mode
{
  return self->_mode;
}

- (int)bandwidthEstimationState
{
  return self->_bandwidthEstimationState;
}

- (BOOL)fastSuddenBandwidthDetectionEnabled
{
  return self->_fastSuddenBandwidthDetectionEnabled;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

- (double)lastProbingArrivalTime
{
  return self->_referencePacketArrivalTime;
}

- (double)estimatedBandwidth
{
  return self->_estimatedBandwidth;
}

- (void)setEstimatedBandwidth:(double)a3
{
  self->_estimatedBandwidth = a3;
}

- (double)estimatedBandwidthUncapped
{
  return self->_estimatedBandwidthUncapped;
}

- (void)setEstimatedBandwidthUncapped:(double)a3
{
  self->_estimatedBandwidthUncapped = a3;
}

@end