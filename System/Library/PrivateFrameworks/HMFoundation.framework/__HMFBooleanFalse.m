@interface __HMFBooleanFalse
+ (id)new;
- (BOOL)BOOLValue;
@end

@implementation __HMFBooleanFalse

+ (id)new
{
  if (qword_1EB4EEE30 != -1) {
    dispatch_once(&qword_1EB4EEE30, &__block_literal_global_115);
  }
  v2 = (void *)qword_1EB4EEE38;
  return v2;
}

- (BOOL)BOOLValue
{
  return 0;
}

@end