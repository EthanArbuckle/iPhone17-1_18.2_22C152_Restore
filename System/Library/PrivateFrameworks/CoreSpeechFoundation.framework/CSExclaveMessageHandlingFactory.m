@interface CSExclaveMessageHandlingFactory
+ (id)commonExclaveMessageHandler;
+ (id)exclaveAdblockerAnalyzer;
+ (id)exclaveAssetsController;
+ (id)exclaveAudioProvider;
+ (id)exclaveFirstPassVoiceTriggerAnalyzer;
+ (id)exclaveSecondPassVoiceTriggerAnalyzer;
@end

@implementation CSExclaveMessageHandlingFactory

+ (id)commonExclaveMessageHandler
{
  if (+[CSUtils isExclaveHardware])
  {
    v2 = +[CSExclaveRecordClient sharedClient];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

+ (id)exclaveAdblockerAnalyzer
{
  return 0;
}

+ (id)exclaveAssetsController
{
  return +[CSExclaveMessageHandlingFactory commonExclaveMessageHandler];
}

+ (id)exclaveSecondPassVoiceTriggerAnalyzer
{
  return +[CSExclaveMessageHandlingFactory commonExclaveMessageHandler];
}

+ (id)exclaveFirstPassVoiceTriggerAnalyzer
{
  return +[CSExclaveMessageHandlingFactory commonExclaveMessageHandler];
}

+ (id)exclaveAudioProvider
{
  return +[CSExclaveMessageHandlingFactory commonExclaveMessageHandler];
}

@end