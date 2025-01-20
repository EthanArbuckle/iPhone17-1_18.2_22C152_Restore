@interface __HMFBooleanTrue
+ (id)new;
- (BOOL)BOOLValue;
@end

@implementation __HMFBooleanTrue

+ (id)new
{
  if (_MergedGlobals_76 != -1) {
    dispatch_once(&_MergedGlobals_76, &__block_literal_global_49);
  }
  v2 = (void *)qword_1EB4EEE28;
  return v2;
}

- (BOOL)BOOLValue
{
  return 1;
}

@end