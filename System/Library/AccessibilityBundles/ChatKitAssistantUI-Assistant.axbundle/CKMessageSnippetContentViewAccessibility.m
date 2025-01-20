@interface CKMessageSnippetContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)setBalloonType:(int64_t)a3;
@end

@implementation CKMessageSnippetContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKMessageSnippetContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(CKMessageSnippetContentViewAccessibility *)self safeValueForKey:@"_toLabel"];
  v4 = [v3 safeValueForKey:@"text"];

  v5 = [(CKMessageSnippetContentViewAccessibility *)self safeValueForKey:@"_balloonImageView"];
  v6 = [v5 safeValueForKey:@"attributedText"];
  v7 = [v6 safeValueForKey:@"string"];

  if (v7 && ([v7 isEqualToString:@" "] & 1) == 0)
  {
    v8 = NSString;
    v9 = accessibilityAssistantLocalizedString(@"message.snippet.message");
    uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

    v7 = (void *)v10;
  }
  v11 = __UIAXStringForVariables();

  return v11;
}

- (void)setBalloonType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKMessageSnippetContentViewAccessibility;
  -[CKMessageSnippetContentViewAccessibility setBalloonType:](&v7, sel_setBalloonType_);
  if (a3 == 1) {
    v5 = @"message.snippet.status.sent";
  }
  else {
    v5 = @"message.snippet.status.unsent";
  }
  v6 = accessibilityAssistantLocalizedString(v5);
  [(CKMessageSnippetContentViewAccessibility *)self setAccessibilityValue:v6];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end