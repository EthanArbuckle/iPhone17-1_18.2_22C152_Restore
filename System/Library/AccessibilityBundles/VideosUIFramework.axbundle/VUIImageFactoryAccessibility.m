@interface VUIImageFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation VUIImageFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIImageFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VUIResourceImageDescriptor", @"name", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"VUIImageFactory", @"makeImageViewWithResourceDescriptor:existingView:", "@", "@", "@", 0);
}

+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VUIImageFactoryAccessibility;
  id v5 = a3;
  v6 = objc_msgSendSuper2(&v10, sel_makeImageViewWithResourceDescriptor_existingView_, v5, a4);
  v7 = objc_msgSend(v5, "safeStringForKey:", @"name", v10.receiver, v10.super_class);

  LODWORD(v5) = [v7 isEqualToString:@"AppleTV-Channels"];
  if (v5)
  {
    [v6 setIsAccessibilityElement:1];
    v8 = accessibilityLocalizedString(@"channels.AppleTV");
    [v6 setAccessibilityLabel:v8];
  }

  return v6;
}

@end