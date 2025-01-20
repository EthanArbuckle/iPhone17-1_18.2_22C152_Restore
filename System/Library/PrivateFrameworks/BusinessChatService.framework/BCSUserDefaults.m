@interface BCSUserDefaults
+ (id)sharedDefaults;
@end

@implementation BCSUserDefaults

+ (id)sharedDefaults
{
  v2 = (void *)_MergedGlobals_35;
  if (!_MergedGlobals_35)
  {
    if (qword_26ACEFCB0 != -1) {
      dispatch_once(&qword_26ACEFCB0, &__block_literal_global_2);
    }
    v2 = (void *)_MergedGlobals_35;
  }

  return v2;
}

uint64_t __33__BCSUserDefaults_sharedDefaults__block_invoke()
{
  _MergedGlobals_35 = objc_alloc_init(BCSUserDefaults);

  return MEMORY[0x270F9A758]();
}

@end