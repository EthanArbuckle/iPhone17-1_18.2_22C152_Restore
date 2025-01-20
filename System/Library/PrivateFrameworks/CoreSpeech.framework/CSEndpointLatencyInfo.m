@interface CSEndpointLatencyInfo
- (CSEndpointLatencyInfo)initWithRequestMHUUID:(id)a3;
- (NSMutableArray)trailingPktLatencies;
- (NSMutableArray)trailingPktSpeechLatencies;
- (NSString)requestMHUUID;
- (double)firstPktLatency;
- (unint64_t)numOfAudioPackets;
- (unint64_t)numOfValidTrailingPackets;
- (unint64_t)numOfValidTrailingSpeechPackets;
- (void)_emitMHEndpointLatencyInfo:(id)a3 withRequestMHUUID:(id)a4;
- (void)addPktInfoWithTimestamp:(unint64_t)a3 arrivalTimestamp:(unint64_t)a4 currentMachTime:(unint64_t)a5;
- (void)report;
- (void)setFirstPktLatency:(double)a3;
- (void)setNumOfAudioPackets:(unint64_t)a3;
- (void)setNumOfValidTrailingPackets:(unint64_t)a3;
- (void)setNumOfValidTrailingSpeechPackets:(unint64_t)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setTrailingPktLatencies:(id)a3;
- (void)setTrailingPktSpeechLatencies:(id)a3;
@end

@implementation CSEndpointLatencyInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPktLatencies, 0);
  objc_storeStrong((id *)&self->_trailingPktSpeechLatencies, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

- (void)setNumOfValidTrailingSpeechPackets:(unint64_t)a3
{
  self->_numOfValidTrailingSpeechPackets = a3;
}

- (unint64_t)numOfValidTrailingSpeechPackets
{
  return self->_numOfValidTrailingSpeechPackets;
}

- (void)setNumOfValidTrailingPackets:(unint64_t)a3
{
  self->_numOfValidTrailingPackets = a3;
}

- (unint64_t)numOfValidTrailingPackets
{
  return self->_numOfValidTrailingPackets;
}

- (void)setNumOfAudioPackets:(unint64_t)a3
{
  self->_numOfAudioPackets = a3;
}

- (unint64_t)numOfAudioPackets
{
  return self->_numOfAudioPackets;
}

- (void)setTrailingPktLatencies:(id)a3
{
}

- (NSMutableArray)trailingPktLatencies
{
  return self->_trailingPktLatencies;
}

- (void)setTrailingPktSpeechLatencies:(id)a3
{
}

- (NSMutableArray)trailingPktSpeechLatencies
{
  return self->_trailingPktSpeechLatencies;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setFirstPktLatency:(double)a3
{
  self->_firstPktLatency = a3;
}

- (double)firstPktLatency
{
  return self->_firstPktLatency;
}

- (void)_emitMHEndpointLatencyInfo:(id)a3 withRequestMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [v5 copy];
    id v8 = objc_alloc_init((Class)MHSchemaMHEndpointLatencyInfoReported);
    v9 = [v7 objectForKey:@"FirstPktLatency"];

    if (v9)
    {
      v10 = [v7 objectForKey:@"FirstPktLatency"];
      [v10 floatValue];
      int v12 = v11;

      LODWORD(v13) = v12;
      objc_msgSend(v8, "setFirstPacketLatencyInNs:", +[CSFTimeUtils millisecondsToNs:](CSFTimeUtils, "millisecondsToNs:", v13));
    }
    v14 = [v7 objectForKey:@"TrailingPktLatency"];

    if (v14)
    {
      v15 = [v7 objectForKey:@"TrailingPktLatency"];
      v16 = +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:v15];
      [v8 setTrailingPacketLatency:v16];
    }
    v17 = [v7 objectForKey:@"TrailingPktSpeechLatency"];

    if (v17)
    {
      v18 = [v7 objectForKey:@"TrailingPktSpeechLatency"];
      v19 = +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:v18];
      [v8 setCoreSpeechTrailingPacketLatency:v19];
    }
    v20 = +[CSEndpointLoggingHelper getMHClientEventByMhUUID:v6];
    [v20 setEndpointLatencyInfoReported:v8];
    v21 = +[AssistantSiriAnalytics sharedStream];
    [v21 emitMessage:v20];

    v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 136315394;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointLatencyInfoReportedEvent to SELF for MH ID: %@", (uint8_t *)&v24, 0x16u);
    }
  }
  else
  {
    v23 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136315138;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)report
{
  v3 = +[CSUtils distributionDictionary:self->_trailingPktLatencies];
  v4 = +[CSUtils distributionDictionary:self->_trailingPktSpeechLatencies];
  id v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numOfAudioPackets = self->_numOfAudioPackets;
    unint64_t numOfValidTrailingPackets = self->_numOfValidTrailingPackets;
    unint64_t numOfValidTrailingSpeechPackets = self->_numOfValidTrailingSpeechPackets;
    int v14 = 136316418;
    v15 = "-[CSEndpointLatencyInfo report]";
    __int16 v16 = 2050;
    unint64_t v17 = numOfAudioPackets;
    __int16 v18 = 2050;
    unint64_t v19 = numOfValidTrailingPackets;
    __int16 v20 = 2050;
    unint64_t v21 = numOfValidTrailingSpeechPackets;
    __int16 v22 = 2114;
    v23 = v3;
    __int16 v24 = 2114;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s numOfAudioPackets: %{public}lu, numOfValidTrailingPackets: %{public}lu, numOfValidTrailingSpeechPackets: %{public}lu, \ntrailingPktLatencies: %{public}@ \ntrailingPktSpeechLatencies: %{public}@", (uint8_t *)&v14, 0x3Eu);
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v3 count]) {
    [v9 setObject:v3 forKey:@"TrailingPktLatency"];
  }
  if ([v4 count]) {
    [v9 setObject:v4 forKey:@"TrailingPktSpeechLatency"];
  }
  if (self->_firstPktLatency > 0.0)
  {
    v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v9 setObject:v10 forKey:@"FirstPktLatency"];
  }
  if ([v9 count])
  {
    [(CSEndpointLatencyInfo *)self _emitMHEndpointLatencyInfo:v9 withRequestMHUUID:self->_requestMHUUID];
    id v11 = objc_alloc((Class)AFAnalytics);
    int v12 = +[AFInstanceContext currentContext];
    id v13 = [v11 initWithInstanceContext:v12];

    [v13 logEventWithType:4712 context:v9];
  }
}

- (void)addPktInfoWithTimestamp:(unint64_t)a3 arrivalTimestamp:(unint64_t)a4 currentMachTime:(unint64_t)a5
{
  CSMachAbsoluteTimeGetTimeInterval();
  double v10 = v9;
  unint64_t numOfAudioPackets = self->_numOfAudioPackets;
  self->_unint64_t numOfAudioPackets = numOfAudioPackets + 1;
  if (!numOfAudioPackets)
  {
    int v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      unint64_t v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v20 = 2050;
      double v21 = v10 * 1000.0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}.2f ms after firstBufferStart", (uint8_t *)&v18, 0x16u);
    }
  }
  if (v10 <= 10.0)
  {
    int v14 = +[NSNumber numberWithDouble:v10 * 1000.0];
    [(NSMutableArray *)self->_trailingPktLatencies setObject:v14 atIndexedSubscript:self->_numOfValidTrailingPackets % 0xA];

    ++self->_numOfValidTrailingPackets;
  }
  else
  {
    id v13 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      unint64_t v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v20 = 2050;
      double v21 = *(double *)&a5;
      __int16 v22 = 2050;
      unint64_t v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Invalid timestamp (currentMachTime: %{public}llu timestamp: %{public}llu)", (uint8_t *)&v18, 0x20u);
    }
  }
  CSMachAbsoluteTimeGetTimeInterval();
  if (a4 && v15 > 10.0)
  {
    __int16 v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      unint64_t v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      __int16 v20 = 2050;
      double v21 = *(double *)&a5;
      __int16 v22 = 2050;
      unint64_t v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s Invalid timestamp (currentMachTime: %{public}llu arrivalTimestamp: %{public}llu)", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    unint64_t v17 = +[NSNumber numberWithDouble:v15 * 1000.0];
    [(NSMutableArray *)self->_trailingPktSpeechLatencies setObject:v17 atIndexedSubscript:self->_numOfValidTrailingSpeechPackets % 0xA];

    ++self->_numOfValidTrailingSpeechPackets;
  }
}

- (CSEndpointLatencyInfo)initWithRequestMHUUID:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSEndpointLatencyInfo;
  id v5 = [(CSEndpointLatencyInfo *)&v13 init];
  if (v5)
  {
    id v6 = (NSString *)[v4 copy];
    requestMHUUID = v5->_requestMHUUID;
    v5->_requestMHUUID = v6;

    uint64_t v8 = +[NSMutableArray arrayWithCapacity:10];
    trailingPktLatencies = v5->_trailingPktLatencies;
    v5->_trailingPktLatencies = (NSMutableArray *)v8;

    uint64_t v10 = +[NSMutableArray arrayWithCapacity:10];
    trailingPktSpeechLatencies = v5->_trailingPktSpeechLatencies;
    v5->_trailingPktSpeechLatencies = (NSMutableArray *)v10;

    v5->_unint64_t numOfAudioPackets = 0;
    v5->_unint64_t numOfValidTrailingPackets = 0;
    v5->_unint64_t numOfValidTrailingSpeechPackets = 0;
  }

  return v5;
}

@end