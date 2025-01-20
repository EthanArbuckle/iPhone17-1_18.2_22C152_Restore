@interface CLLocationIndependenceAssertion
+ (id)newAssertionWithReason:(id)a3;
@end

@implementation CLLocationIndependenceAssertion

+ (id)newAssertionWithReason:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v4 = @"kCLConnectionMessagePurposeKey";
  v5[0] = a3;
  return -[CLAssertion initWithRegistrationMessageName:messageDictionary:]([CLLocationIndependenceAssertion alloc], "initWithRegistrationMessageName:messageDictionary:", "LocationIndependenceAssertion/kCLConnectionMessage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

@end