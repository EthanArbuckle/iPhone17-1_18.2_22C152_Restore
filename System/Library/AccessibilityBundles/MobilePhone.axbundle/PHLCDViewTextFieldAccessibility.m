@interface PHLCDViewTextFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
- (void)_accessibilityPaste;
@end

@implementation PHLCDViewTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHLCDViewTextField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v2 = (void *)MEMORY[0x263F21660];
  v6.receiver = self;
  v6.super_class = (Class)PHLCDViewTextFieldAccessibility;
  v3 = [(PHLCDViewTextFieldAccessibility *)&v6 accessibilityValue];
  v4 = [v2 axAttributedStringWithString:v3];

  [v4 setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21888]];

  return v4;
}

- (void)_accessibilityPaste
{
  v2 = [MEMORY[0x263F1CBC8] keyWindow];
  id v3 = [v2 firstResponder];

  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v3 canPerformAction:sel_paste_ withSender:0])
  {
    [v3 paste:0];
  }
}

@end