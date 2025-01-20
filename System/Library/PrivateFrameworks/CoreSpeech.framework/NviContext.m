@interface NviContext
- (BOOL)requestHistoricalAudio;
- (BOOL)shouldLogRawSensorData;
- (NSDictionary)voiceTriggerInfo;
- (NSString)rootLogDir;
- (id)description;
- (unint64_t)reqStartAudioSampleId;
- (unint64_t)reqStartMachAbsTime;
- (void)setReqStartAudioSampleId:(unint64_t)a3;
- (void)setReqStartMachAbsTime:(unint64_t)a3;
- (void)setRequestHistoricalAudio:(BOOL)a3;
- (void)setRootLogDir:(id)a3;
- (void)setShouldLogRawSensorData:(BOOL)a3;
- (void)setVoiceTriggerInfo:(id)a3;
@end

@implementation NviContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootLogDir, 0);
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);
}

- (void)setRootLogDir:(id)a3
{
}

- (NSString)rootLogDir
{
  return self->_rootLogDir;
}

- (void)setShouldLogRawSensorData:(BOOL)a3
{
  self->_shouldLogRawSensorData = a3;
}

- (BOOL)shouldLogRawSensorData
{
  return self->_shouldLogRawSensorData;
}

- (void)setReqStartMachAbsTime:(unint64_t)a3
{
  self->_reqStartMachAbsTime = a3;
}

- (unint64_t)reqStartMachAbsTime
{
  return self->_reqStartMachAbsTime;
}

- (void)setReqStartAudioSampleId:(unint64_t)a3
{
  self->_reqStartAudioSampleId = a3;
}

- (unint64_t)reqStartAudioSampleId
{
  return self->_reqStartAudioSampleId;
}

- (void)setRequestHistoricalAudio:(BOOL)a3
{
  self->_requestHistoricalAudio = a3;
}

- (BOOL)requestHistoricalAudio
{
  return self->_requestHistoricalAudio;
}

- (void)setVoiceTriggerInfo:(id)a3
{
}

- (NSDictionary)voiceTriggerInfo
{
  return self->_voiceTriggerInfo;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{isVT=%d, requestHistoricalAudio=%d, reqStartAudioSampleId=%lu, reqStartMachAbsTime=%llu}", self->_voiceTriggerInfo != 0, self->_requestHistoricalAudio, self->_reqStartAudioSampleId, self->_reqStartMachAbsTime];
}

@end