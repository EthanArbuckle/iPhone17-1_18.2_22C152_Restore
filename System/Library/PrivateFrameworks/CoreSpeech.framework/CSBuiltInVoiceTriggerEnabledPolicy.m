@interface CSBuiltInVoiceTriggerEnabledPolicy
+ (id)builtInVoiceTriggerEnabledPolicy;
@end

@implementation CSBuiltInVoiceTriggerEnabledPolicy

+ (id)builtInVoiceTriggerEnabledPolicy
{
  if (+[CSUtils isDarwinOS])
  {
    v2 = off_10024D350;
  }
  else if (CSIsHorseman())
  {
    v2 = off_10024D358;
  }
  else
  {
    int v3 = CSHasAOP();
    v2 = &off_10024D360;
    if (v3) {
      v2 = off_10024D348;
    }
  }
  id v4 = objc_alloc_init(*v2);
  return v4;
}

@end