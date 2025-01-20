@interface CKHyperlinkBalloonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)accessibilityActivate;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5;
@end

@implementation CKHyperlinkBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKHyperlinkBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKHyperlinkBalloonView", @"textView:shouldInteractWithURL:inRange:", "B", "@", "@", "{_NSRange=QQ}", 0);
  [v3 validateClass:@"CKHyperlinkBalloonView" isKindOfClass:@"CKTextBalloonView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKTextBalloonView", @"textView", "@", 0);
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v2 = [(CKHyperlinkBalloonViewAccessibility *)self safeValueForKey:@"textView"];
  char v3 = [v2 accessibilityActivate];

  return v3;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = a3;
  id v10 = a4;
  v11 = objc_opt_new();
  char v12 = [v11 isClarityBoardEnabled];

  if (v12)
  {
    BOOL v13 = 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)CKHyperlinkBalloonViewAccessibility;
    BOOL v13 = -[CKHyperlinkBalloonViewAccessibility textView:shouldInteractWithURL:inRange:](&v15, sel_textView_shouldInteractWithURL_inRange_, v9, v10, location, length);
  }

  return v13;
}

@end