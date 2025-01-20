@interface SASStartSpeech
- (void)af_logDiagnostics;
@end

@implementation SASStartSpeech

- (void)af_logDiagnostics
{
  id v2 = +[AFDiagnostics sharedDiagnostics];
  [v2 logVoiceSendStart];
}

@end