@interface SAUIUserUtteranceView(KeyboardInitiated)
- (uint64_t)afui_isKeyboardInitiated;
- (void)setAfui_KeyboardInitiated:()KeyboardInitiated;
@end

@implementation SAUIUserUtteranceView(KeyboardInitiated)

- (void)setAfui_KeyboardInitiated:()KeyboardInitiated
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setProperty:v2 forKey:@"SiriUserUtteranceKeyboardInitiated"];
}

- (uint64_t)afui_isKeyboardInitiated
{
  v1 = [a1 propertyForKey:@"SiriUserUtteranceKeyboardInitiated"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end