@interface MultiChoiceCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MultiChoiceCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.MultiChoiceCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MultiChoiceCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MultiChoiceCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.MultiChoiceCell", @"accessibilityIsSelectedChoice", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MultiChoiceCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"title, subtitle"];
}

- (unint64_t)accessibilityTraits
{
  int v3 = [(MultiChoiceCellAccessibility *)self safeBoolForKey:@"accessibilityIsSelectedChoice"];
  v6.receiver = self;
  v6.super_class = (Class)MultiChoiceCellAccessibility;
  unint64_t v4 = [(MultiChoiceCellAccessibility *)&v6 accessibilityTraits];
  if (v3) {
    return *MEMORY[0x263F1CF38] | v4;
  }
  else {
    return v4 & ~*MEMORY[0x263F1CF38];
  }
}

@end