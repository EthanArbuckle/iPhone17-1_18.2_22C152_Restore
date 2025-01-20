@interface MFMessageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4;
@end

@implementation MFMessageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFMessageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MFMessageViewController", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ConversationViewControllerBase", @"collectionView", "@", 0);
}

- (void)messageContentView:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  v9.receiver = self;
  v9.super_class = (Class)MFMessageViewControllerAccessibility;
  -[MFMessageViewControllerAccessibility messageContentView:didFinishRenderingWithHeight:](&v9, sel_messageContentView_didFinishRenderingWithHeight_, a3);
  v6 = [(MFMessageViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  v7 = [v6 safeValueForKey:@"collectionView"];

  NSClassFromString(&cfstr_Mfconversation_3.isa);
  if (objc_opt_isKindOfClass())
  {
    double v8 = (double)[v7 _axHeightOfCellsToLoad];
    if (v8 < a4) {
      objc_msgSend(v7, "_axSetHeightOfCellsToLoad:", (uint64_t)a4, v8);
    }
  }
}

@end