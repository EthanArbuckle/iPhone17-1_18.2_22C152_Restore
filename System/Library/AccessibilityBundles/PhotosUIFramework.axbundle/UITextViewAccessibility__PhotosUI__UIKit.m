@interface UITextViewAccessibility__PhotosUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityPlaceholderValue;
@end

@implementation UITextViewAccessibility__PhotosUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UITextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityPlaceholderValue
{
  v3 = [(UITextViewAccessibility__PhotosUI__UIKit *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AddCommentTextView"];

  if (v4)
  {
    v5 = [(UITextViewAccessibility__PhotosUI__UIKit *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Puphotocomment.isa)];
    v6 = [v5 safeValueForKey:@"_placeholderLabel"];
    v7 = [v6 accessibilityLabel];
    if ([v7 length])
    {
      v8 = [MEMORY[0x263F21660] axAttributedStringWithString:v7];

      [v8 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21820]];
      v7 = v8;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UITextViewAccessibility__PhotosUI__UIKit;
    v7 = [(UITextViewAccessibility__PhotosUI__UIKit *)&v10 accessibilityPlaceholderValue];
  }

  return v7;
}

@end