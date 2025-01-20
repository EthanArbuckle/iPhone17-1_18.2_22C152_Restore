@interface CSFVoiceTriggerEventInfoSelfLogger
+ (id)sharedLogger;
- (void)logCancelledEventWithMHUUID:(id)a3;
- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5;
- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3;
- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3;
- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4;
- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4;
- (void)logTwoShotDetectedWithMHUUID:(id)a3;
- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5;
- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4;
@end

@implementation CSFVoiceTriggerEventInfoSelfLogger

+ (id)sharedLogger
{
  if (sharedLogger_onceToken_6308 != -1) {
    dispatch_once(&sharedLogger_onceToken_6308, &__block_literal_global_6309);
  }
  v2 = (void *)sharedLogger_sharedInstance;
  return v2;
}

uint64_t __50__CSFVoiceTriggerEventInfoSelfLogger_sharedLogger__block_invoke()
{
  v0 = objc_alloc_init(CSFVoiceTriggerEventInfoSelfLoggerEmbedded);
  v1 = (void *)sharedLogger_sharedInstance;
  sharedLogger_sharedInstance = (uint64_t)v0;

  uint64_t result = +[CSUtils isDarwinOS];
  if (result)
  {
    sharedLogger_sharedInstance = objc_alloc_init(CSFVoiceTriggerEventInfoSelfLoggerDarwin);
    return MEMORY[0x1F41817F8]();
  }
  return result;
}

- (void)logSiriLaunchCompletedWithVoiceTriggerEventInfo:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logSiriLaunchCompletedWithVoiceTriggerEventInfo:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 78, "NO");
}

- (void)logSiriLaunchStartedWithVoiceTriggerEventInfo:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logSiriLaunchStartedWithVoiceTriggerEventInfo:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 74, "NO");
}

- (void)logTwoShotDetectedWithMHUUID:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotDetectedWithMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 70, "NO");
}

- (void)logTwoShotStartEventWithPromptType:(unsigned int)a3 withMHUUID:(id)a4
{
  id v4 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotStartEventWithPromptType:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 66, "NO");
}

- (void)logTwoShotEndEventWithSuppresedAlert:(BOOL)a3 withTimedOut:(BOOL)a4 withMHUUID:(id)a5
{
  id v5 = a5;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 62, "NO");
}

- (void)logCancelledEventWithMHUUID:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logCancelledEventWithMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 58, "NO");
}

- (void)logRejectEventWithVTEI:(id)a3 withMHUUID:(id)a4 withSecondPassResult:(unint64_t)a5
{
  id v6 = a3;
  id v7 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logRejectEventWithVTEI:withMHUUID:withSecondPassResult:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 54, "NO");
}

- (void)logTriggerEventWithVTEI:(id)a3 withMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logTriggerEventWithVTEI:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 49, "NO");
}

- (void)logStartEventWithFirstPassStartedInfo:(id)a3 withMHUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __assert_rtn("-[CSFVoiceTriggerEventInfoSelfLogger logStartEventWithFirstPassStartedInfo:withMHUUID:]", "CSFVoiceTriggerEventInfoSelfLogger.m", 45, "NO");
}

@end