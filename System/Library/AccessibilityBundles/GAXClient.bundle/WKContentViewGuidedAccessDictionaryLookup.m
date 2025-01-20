@interface WKContentViewGuidedAccessDictionaryLookup
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
@end

@implementation WKContentViewGuidedAccessDictionaryLookup

+ (id)safeCategoryTargetClassName
{
  return @"WKContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (UIAccessibilityIsGuidedAccessEnabled()
    && ("_define:" != a3 ? (BOOL v7 = "_lookup:" == a3) : (BOOL v7 = 1),
        v7 && ![UIApp _guidedAccessDictionaryLookupAllowed]))
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WKContentViewGuidedAccessDictionaryLookup;
    BOOL v8 = [(WKContentViewGuidedAccessDictionaryLookup *)&v10 canPerformAction:a3 withSender:v6];
  }

  return v8;
}

@end