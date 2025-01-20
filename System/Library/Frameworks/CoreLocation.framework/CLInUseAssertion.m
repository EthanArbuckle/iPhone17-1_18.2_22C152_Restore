@interface CLInUseAssertion
+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4;
+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 level:(int)a5;
+ (id)newAssertionForBundleIdentifier:(id)a3 bundlePath:(id)a4 reason:(id)a5 level:(int)a6;
+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4;
+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 level:(int)a5;
@end

@implementation CLInUseAssertion

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4 level:(int)a5
{
  id v7 = (id)objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "copy");
  id v8 = (id)[a4 copy];

  return (id)MEMORY[0x1F4181798](a1, sel_newAssertionForBundleIdentifier_bundlePath_reason_level_);
}

+ (id)newAssertionForBundle:(id)a3 withReason:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel_newAssertionForBundle_withReason_level_);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 bundlePath:(id)a4 reason:(id)a5 level:(int)a6
{
  v11[4] = *MEMORY[0x1E4F143B8];
  v10[0] = @"kCLConnectionMessageBundleIdentifierKey";
  v10[1] = @"kCLConnectionMessageBundlePathKey";
  v6 = &stru_1EE006720;
  if (a3) {
    id v7 = (__CFString *)a3;
  }
  else {
    id v7 = &stru_1EE006720;
  }
  if (a4) {
    v6 = (__CFString *)a4;
  }
  v11[0] = v7;
  v11[1] = v6;
  id v8 = @"(Unspecified)";
  if (a5) {
    id v8 = (__CFString *)a5;
  }
  v11[2] = v8;
  v10[2] = @"kCLConnectionMessagePurposeKey";
  v10[3] = @"kCLConnectionMessageAssertionLevelKey";
  v11[3] = [NSNumber numberWithInt:*(void *)&a6];
  return -[CLAssertion initWithRegistrationMessageName:messageDictionary:]([CLInUseAssertion alloc], "initWithRegistrationMessageName:messageDictionary:", "InUseAssertion/kCLConnectionMessage", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:4]);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4 level:(int)a5
{
  id v7 = (id)[a3 copy];
  id v8 = (id)[a4 copy];

  return (id)MEMORY[0x1F4181798](a1, sel_newAssertionForBundleIdentifier_bundlePath_reason_level_);
}

+ (id)newAssertionForBundleIdentifier:(id)a3 withReason:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel_newAssertionForBundleIdentifier_withReason_level_);
}

@end