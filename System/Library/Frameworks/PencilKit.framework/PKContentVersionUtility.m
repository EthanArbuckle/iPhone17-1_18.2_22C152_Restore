@interface PKContentVersionUtility
+ (id)sharedUtility;
- (BOOL)programLinkedOnOrAfterDawnburst;
- (BOOL)programLinkedOnOrAfterDawnburstE;
- (uint64_t)contentVersionForCurrentSDK;
@end

@implementation PKContentVersionUtility

+ (id)sharedUtility
{
  self;
  if (qword_1EB3C5F88 != -1) {
    dispatch_once(&qword_1EB3C5F88, &__block_literal_global_41);
  }
  v0 = (void *)qword_1EB3C5F90;

  return v0;
}

void __40__PKContentVersionUtility_sharedUtility__block_invoke()
{
  v0 = objc_alloc_init(PKContentVersionUtility);
  v1 = (void *)qword_1EB3C5F90;
  qword_1EB3C5F90 = (uint64_t)v0;
}

- (BOOL)programLinkedOnOrAfterDawnburst
{
  if (result)
  {
    if (qword_1EB3C5F98 != -1) {
      dispatch_once(&qword_1EB3C5F98, &__block_literal_global_2);
    }
    return _MergedGlobals_134 != 0;
  }
  return result;
}

uint64_t __58__PKContentVersionUtility_programLinkedOnOrAfterDawnburst__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  _MergedGlobals_134 = result;
  return result;
}

- (BOOL)programLinkedOnOrAfterDawnburstE
{
  if (result)
  {
    if (qword_1EB3C5FA0 != -1) {
      dispatch_once(&qword_1EB3C5FA0, &__block_literal_global_4);
    }
    return byte_1EB3C5F81 != 0;
  }
  return result;
}

uint64_t __59__PKContentVersionUtility_programLinkedOnOrAfterDawnburstE__block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  byte_1EB3C5F81 = result;
  return result;
}

- (uint64_t)contentVersionForCurrentSDK
{
  if (result)
  {
    if (qword_1EB3C5FA0 != -1) {
      dispatch_once(&qword_1EB3C5FA0, &__block_literal_global_4);
    }
    if (byte_1EB3C5F81 && (_os_feature_enabled_impl() & 1) != 0)
    {
      return 3;
    }
    else
    {
      if (qword_1EB3C5F98 != -1) {
        dispatch_once(&qword_1EB3C5F98, &__block_literal_global_2);
      }
      if (_MergedGlobals_134) {
        return 2;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

@end