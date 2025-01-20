@interface CSSelfTriggerDetectorEnabledPolicyFactory
+ selfTriggerDetectorEnabledPolicy;
+ selfTriggerDetectorEnabledPolicyWithAudioSourceType:(unint64_t)a3;
+ (id)studioDisplaySelfTriggerEnabledPolicy;
@end

@implementation CSSelfTriggerDetectorEnabledPolicyFactory

+ selfTriggerDetectorEnabledPolicyWithAudioSourceType:(unint64_t)a3
{
  if (a3 != 1)
  {
    if (!a3)
    {
      v3 = +[CSSelfTriggerDetectorEnabledPolicyFactory selfTriggerDetectorEnabledPolicy];
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!+[CSUtils supportAudioTappingSelfTrigger]
    || !CSIsIOS()
    || (+[CSUtils isDarwinOS] & 1) != 0)
  {
LABEL_7:
    v3 = 0;
    goto LABEL_8;
  }
  v3 = objc_alloc_init(CSSelfTriggerDetectorUseAudioTapEnabledPolicyIOS);
LABEL_8:
  return v3;
}

+ (id)studioDisplaySelfTriggerEnabledPolicy
{
  if (+[CSUtils supportRemoteDarwinVoiceTrigger])v2 = objc_alloc_init(CSiOSHostStudioDisplaySelfTriggerEnabledPolicy); {
  else
  }
    v2 = 0;
  return v2;
}

+ selfTriggerDetectorEnabledPolicy
{
  unsigned int v2;
  __objc2_class **v3;
  id v4;
  uint64_t vars8;

  v2 = +[CSUtils isDarwinOS];
  v3 = off_10024D2A0;
  if (!v2) {
    v3 = &off_10024D2A8;
  }
  v4 = objc_alloc_init(*v3);
  return v4;
}

@end