@interface AXPronunciationDictationView
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)finishReturnToKeyboard;
@end

@implementation AXPronunciationDictationView

+ (id)safeCategoryTargetClassName
{
  return @"UIDictationLayoutView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)finishReturnToKeyboard
{
  v3 = [(AXPronunciationDictationView *)self accessibilityIdentifier];
  unsigned int v4 = [v3 isEqualToString:@"AXPronunciationDictationView"];

  if (v4)
  {
    v5 = [(AXPronunciationDictationView *)self displayDelegate];
    [v5 doneButtonPressed];
  }
  v6.receiver = self;
  v6.super_class = (Class)AXPronunciationDictationView;
  [(AXPronunciationDictationView *)&v6 finishReturnToKeyboard];
}

@end