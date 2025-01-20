@interface SASFinishSpeech
- (void)af_logDiagnostics;
@end

@implementation SASFinishSpeech

- (void)af_logDiagnostics
{
  id v2 = +[AFDiagnostics sharedDiagnostics];
  [v2 logVoiceSendEnd];
}

@end