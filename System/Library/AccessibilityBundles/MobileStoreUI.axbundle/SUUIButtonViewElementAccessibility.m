@interface SUUIButtonViewElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityText;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIButtonViewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIButtonViewElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIButtonViewElement", @"buttonImage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIButtonViewElement", @"buttonText", "@", 0);
  [v3 validateClass:@"SUUIButtonViewElement" isKindOfClass:@"IKViewElement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IKViewElement", @"accessibilityText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIImageViewElement", @"resourceName", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SUUIButtonViewElementAccessibility *)self safeValueForKey:@"buttonText"];
  v4 = [v3 accessibilityLabel];

  if ([v4 length])
  {
    id v5 = v4;
    goto LABEL_11;
  }
  v6 = [(SUUIButtonViewElementAccessibility *)self accessibilityIdentifier];
  if ([v6 isEqualToString:@"post"])
  {
    v7 = @"post.label";
  }
  else if ([v6 isEqualToString:@"LoveHateControlNeutral"])
  {
    v7 = @"connect.comment.likes";
  }
  else
  {
    if (![v6 isEqualToString:@"share"])
    {
      id v8 = v4;
      goto LABEL_10;
    }
    v7 = @"share.label";
  }
  accessibilityLocalizedString(v7);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  id v5 = v8;

LABEL_11:

  return v5;
}

- (id)accessibilityIdentifier
{
  objc_opt_class();
  id v3 = [(SUUIButtonViewElementAccessibility *)self safeValueForKey:@"buttonImage"];
  v4 = [v3 safeValueForKey:@"resourceName"];
  id v5 = __UIAccessibilityCastAsClass();

  return v5;
}

- (id)accessibilityText
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIButtonViewElementAccessibility;
  id v3 = [(SUUIButtonViewElementAccessibility *)&v7 accessibilityText];

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIButtonViewElementAccessibility;
    v4 = [(SUUIButtonViewElementAccessibility *)&v6 accessibilityText];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  v4.receiver = self;
  v4.super_class = (Class)SUUIButtonViewElementAccessibility;
  return [(SUUIButtonViewElementAccessibility *)&v4 accessibilityTraits] | v2;
}

@end