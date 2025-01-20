@interface CSVoiceTriggerAPModeSuspendPolicyFactory
+ (id)policy;
@end

@implementation CSVoiceTriggerAPModeSuspendPolicyFactory

+ (id)policy
{
  unsigned int v2 = +[CSUtils isDarwinOS];
  v3 = (Class *)CSAlwaysDisabledPolicy_ptr;
  if (!v2) {
    v3 = (Class *)&off_10024D320;
  }
  id v4 = objc_alloc_init(*v3);
  return v4;
}

@end