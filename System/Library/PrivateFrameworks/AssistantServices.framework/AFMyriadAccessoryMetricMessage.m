@interface AFMyriadAccessoryMetricMessage
- (AFMyriadAccessoryMetricMessage)initWithDataPayload:(id)a3;
- (AFMyriadAccessoryMetricMessage)initWithMetricData:(id)a3;
- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV1 *)a4;
- (BOOL)coordinationAllowed;
- (BOOL)decision;
- (BOOL)homepodInvolved;
- (BOOL)lateToElection;
- (BOOL)previousDecision;
- (MyriadMetricsDataV1)messageAsStruct;
- (char)electionParticipantDeviceType;
- (char)electionParticipantGoodnessScore;
- (char)electionParticipantProductType;
- (double)advDelay;
- (double)advInterval;
- (double)previousDecisionTime;
- (id)_extractMetricDataFromDataPayload:(id)a3;
- (id)messageAsData;
- (unint64_t)requestType;
- (unint64_t)sessionId;
- (unsigned)deviceGroup;
- (unsigned)electionParticipantCount;
- (unsigned)eventType;
- (unsigned)state;
- (unsigned)version;
- (unsigned)winnerDeviceClass;
- (unsigned)winnerGoodnessScore;
- (unsigned)winnerProductType;
@end

@implementation AFMyriadAccessoryMetricMessage

- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV1 *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5 && [v5 length])
  {
    char v13 = 0;
    objc_msgSend(v6, "getBytes:range:", &v13, 0, 1);
    BOOL v7 = v13 != 0;
    if (v13)
    {
      unint64_t v8 = [v6 length];
      *(_OWORD *)&a4->version = 0u;
      *(_OWORD *)&a4->eventType = 0u;
      if (v8 >= 0xE8) {
        size_t v9 = 232;
      }
      else {
        size_t v9 = v8;
      }
      *(_OWORD *)&a4->state = 0uLL;
      *(_OWORD *)&a4->advInterval = 0uLL;
      *(_OWORD *)&a4->previousDecisionTime = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[5] = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[21] = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[37] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[3] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[19] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[35] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[1] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[17] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[33] = 0uLL;
      *(void *)&a4->electionParticipantProductType[49] = 0;
      memcpy(a4, (const void *)[v6 bytes], v9);
    }
    else
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
        __int16 v16 = 1024;
        LODWORD(v17) = 0;
        _os_log_error_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_ERROR, "%s Analytics data has a invalid version %d", buf, 0x12u);
      }
    }
  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s Invalid analytics data payload: %@", buf, 0x16u);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_extractMetricDataFromDataPayload:(id)a3
{
  id v3 = a3;
  v4 = +[AFMyriadMetrics sharedInstance];
  int v5 = [v4 isMyriadMetricsMessage:v3];

  if (v5)
  {
    v6 = [v3 objectForKeyedSubscript:@"accessoryMetrics"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (char)electionParticipantProductType
{
  return (char *)self->_metric.electionParticipantProductType;
}

- (char)electionParticipantDeviceType
{
  return (char *)self->_metric.electionParticipantDeviceType;
}

- (char)electionParticipantGoodnessScore
{
  return (char *)self->_metric.electionParticipantGoodnessScore;
}

- (unsigned)electionParticipantCount
{
  return self->_metric.electionParticipantCount;
}

- (BOOL)lateToElection
{
  return self->_metric.lateToElection != 0;
}

- (BOOL)decision
{
  return self->_metric.decision != 0;
}

- (unsigned)deviceGroup
{
  return self->_metric.deviceGroup;
}

- (double)previousDecisionTime
{
  return self->_metric.previousDecisionTime;
}

- (BOOL)previousDecision
{
  return self->_metric.previousDecision != 0;
}

- (BOOL)homepodInvolved
{
  return self->_metric.homepodInvolved != 0;
}

- (unsigned)winnerDeviceClass
{
  return self->_metric.winnerDeviceClass;
}

- (unsigned)winnerProductType
{
  return self->_metric.winnerProductType;
}

- (unsigned)winnerGoodnessScore
{
  return self->_metric.winnerGoodnessScore;
}

- (BOOL)coordinationAllowed
{
  return self->_metric.coordinationAllowed != 0;
}

- (double)advInterval
{
  return self->_metric.advInterval;
}

- (double)advDelay
{
  return self->_metric.advDelay;
}

- (unsigned)state
{
  return self->_metric.state;
}

- (unint64_t)requestType
{
  return self->_metric.requestType;
}

- (unsigned)eventType
{
  return self->_metric.eventType;
}

- (unint64_t)sessionId
{
  return self->_metric.sessionId;
}

- (unsigned)version
{
  return self->_metric.version;
}

- (MyriadMetricsDataV1)messageAsStruct
{
  long long v3 = *(_OWORD *)&self->electionParticipantProductType[9];
  long long v4 = *(_OWORD *)&self->electionParticipantProductType[41];
  *(_OWORD *)&retstr->electionParticipantProductType[17] = *(_OWORD *)&self->electionParticipantProductType[25];
  *(_OWORD *)&retstr->electionParticipantProductType[33] = v4;
  *(void *)&retstr->electionParticipantProductType[49] = *(void *)&self[1].version;
  long long v5 = *(_OWORD *)&self->electionParticipantGoodnessScore[45];
  long long v6 = *(_OWORD *)&self->electionParticipantDeviceType[27];
  *(_OWORD *)&retstr->electionParticipantDeviceType[3] = *(_OWORD *)&self->electionParticipantDeviceType[11];
  *(_OWORD *)&retstr->electionParticipantDeviceType[19] = v6;
  *(_OWORD *)&retstr->electionParticipantDeviceType[35] = *(_OWORD *)&self->electionParticipantDeviceType[43];
  *(_OWORD *)&retstr->electionParticipantProductType[1] = v3;
  long long v7 = *(_OWORD *)&self->coordinationAllowed;
  long long v8 = *(_OWORD *)&self->electionParticipantGoodnessScore[13];
  *(_OWORD *)&retstr->previousDecisionTime = *(_OWORD *)&self->deviceGroup;
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[5] = v8;
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[21] = *(_OWORD *)&self->electionParticipantGoodnessScore[29];
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[37] = v5;
  long long v9 = *(_OWORD *)&self->requestType;
  *(_OWORD *)&retstr->version = *(_OWORD *)&self->sessionId;
  *(_OWORD *)&retstr->eventType = v9;
  *(_OWORD *)&retstr->state = *(_OWORD *)&self->advDelay;
  *(_OWORD *)&retstr->advInterval = v7;
  return self;
}

- (id)messageAsData
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  [v3 appendBytes:&self->_metric length:232];
  return v3;
}

- (AFMyriadAccessoryMetricMessage)initWithDataPayload:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFMyriadAccessoryMetricMessage;
  long long v5 = [(AFMyriadAccessoryMetricMessage *)&v10 init];
  long long v6 = v5;
  if (!v5)
  {
LABEL_4:
    long long v7 = v6;
    goto LABEL_6;
  }
  long long v7 = [(AFMyriadAccessoryMetricMessage *)v5 _extractMetricDataFromDataPayload:v4];
  if (v7)
  {
    BOOL v8 = [(AFMyriadAccessoryMetricMessage *)v6 _decodeMetricDataPayload:v7 decodedPayload:&v6->_metric];

    if (!v8)
    {
      long long v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v7;
}

- (AFMyriadAccessoryMetricMessage)initWithMetricData:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMyriadAccessoryMetricMessage;
  long long v5 = [(AFMyriadAccessoryMetricMessage *)&v9 init];
  long long v6 = v5;
  if (v5
    && ![(AFMyriadAccessoryMetricMessage *)v5 _decodeMetricDataPayload:v4 decodedPayload:&v5->_metric])
  {
    long long v7 = 0;
  }
  else
  {
    long long v7 = v6;
  }

  return v7;
}

@end