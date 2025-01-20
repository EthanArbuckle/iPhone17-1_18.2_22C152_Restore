@interface SGMessageEventDissectorTrialClientWrapperGuardedData
@end

@implementation SGMessageEventDissectorTrialClientWrapperGuardedData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialRateLimitInterval, 0);
  objc_storeStrong((id *)&self->_trialMessageProcessingLimit, 0);
  objc_storeStrong((id *)&self->_trialEventClassifierThreshold, 0);
  objc_storeStrong((id *)&self->_trialEventClassifierModelPath, 0);
  objc_storeStrong((id *)&self->_trialEventExtractionAssetsPath, 0);
}

@end