@interface HMCameraRecordingReachabilityEvent(HFAdditions)
- (double)duration;
- (double)targetFragmentDuration;
- (id)hf_dateInterval;
- (id)hf_endDate;
- (uint64_t)canAskForUserFeedback;
- (uint64_t)containerType;
- (uint64_t)encryptionKey;
- (uint64_t)hf_hasInsufficientAnalysis;
- (uint64_t)hf_isPlayable;
- (uint64_t)isComplete;
- (uint64_t)videoAssetRequiredHTTPHeaders;
@end

@implementation HMCameraRecordingReachabilityEvent(HFAdditions)

- (double)duration
{
  return 4.0;
}

- (uint64_t)isComplete
{
  return 1;
}

- (uint64_t)canAskForUserFeedback
{
  return 0;
}

- (id)hf_endDate
{
  v2 = [a1 dateOfOccurrence];
  [a1 duration];
  v3 = objc_msgSend(v2, "dateByAddingTimeInterval:");

  return v3;
}

- (id)hf_dateInterval
{
  id v2 = objc_alloc(MEMORY[0x263F08798]);
  v3 = [a1 dateOfOccurrence];
  [a1 duration];
  v4 = objc_msgSend(v2, "initWithStartDate:duration:", v3);

  return v4;
}

- (uint64_t)hf_isPlayable
{
  return 0;
}

- (uint64_t)hf_hasInsufficientAnalysis
{
  return 0;
}

- (double)targetFragmentDuration
{
  return 4.0;
}

- (uint64_t)encryptionKey
{
  return [MEMORY[0x263EFF8F8] data];
}

- (uint64_t)videoAssetRequiredHTTPHeaders
{
  return MEMORY[0x263EFFA78];
}

- (uint64_t)containerType
{
  return 2;
}

@end