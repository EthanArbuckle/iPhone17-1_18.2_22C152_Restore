@interface BWBoxedOutputDetectionTimingInfo
- (BWBoxedOutputDetectionTimingInfo)init;
@end

@implementation BWBoxedOutputDetectionTimingInfo

- (BWBoxedOutputDetectionTimingInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)BWBoxedOutputDetectionTimingInfo;
  result = [(BWBoxedOutputDetectionTimingInfo *)&v6 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    long long v4 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->_previousDetectionPTS.value = *MEMORY[0x1E4F1F9F8];
    int64_t v5 = *(void *)(v3 + 16);
    result->_previousDetectionPTS.epoch = v5;
    *(_OWORD *)&result->_previousDetectionDuration.value = v4;
    result->_previousDetectionDuration.epoch = v5;
    *(_OWORD *)&result->_previousNoDetectionPTS.value = v4;
    result->_previousNoDetectionPTS.epoch = v5;
    result->_lastDetectionCount = 0;
  }
  return result;
}

@end