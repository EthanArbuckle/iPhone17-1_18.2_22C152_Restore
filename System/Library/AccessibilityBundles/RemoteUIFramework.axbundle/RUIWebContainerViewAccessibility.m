@interface RUIWebContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (float)_accessibilityActivationDelay;
- (id)_axSubviewText;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RUIWebContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RUIWebContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUIWebContainerView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUIWebContainerView", @"webView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUITableViewRow", @"linkedPage", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RUITableViewRow", @"tableCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RemoteUITableViewCell", @"remoteUIAccessoryType", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(RUIWebContainerViewAccessibility *)self safeValueForKey:@"delegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 attributes];
    v5 = [v4 objectForKey:@"class"];
    unsigned __int8 v6 = [v5 isEqualToString:@"htmlLink"];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RUIWebContainerViewAccessibility;
    unsigned __int8 v6 = [(RUIWebContainerViewAccessibility *)&v8 isAccessibilityElement];
  }

  return v6;
}

- (id)_axSubviewText
{
  v2 = [(RUIWebContainerViewAccessibility *)self safeUIViewForKey:@"webView"];
  id v3 = [MEMORY[0x263F81198] defaultVoiceOverOptions];
  v4 = [v2 _accessibilityLeafDescendantsWithOptions:v3];
  v5 = MEMORY[0x2455E5270]();

  return v5;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(RUIWebContainerViewAccessibility *)self safeValueForKey:@"delegate"];
  v4 = [(RUIWebContainerViewAccessibility *)self safeValueForKeyPath:@"delegate.tableCell.remoteUIAccessoryType"];
  int v5 = [v4 intValue];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  unsigned __int8 v6 = [v3 safeValueForKey:@"linkedPage"];

  if (v6) {
    goto LABEL_6;
  }
  if (v5 == 1
    && ([(RUIWebContainerViewAccessibility *)self accessibilityContainer],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 _accessibilityFindSubviewDescendant:&__block_literal_global_0],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    [v8 accessibilityActivationPoint];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
LABEL_6:
    v17.receiver = self;
    v17.super_class = (Class)RUIWebContainerViewAccessibility;
    [(RUIWebContainerViewAccessibility *)&v17 accessibilityActivationPoint];
    double v10 = v13;
    double v12 = v14;
  }

  double v15 = v10;
  double v16 = v12;
  result.y = v16;
  result.x = v15;
  return result;
}

uint64_t __64__RUIWebContainerViewAccessibility_accessibilityActivationPoint__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  MEMORY[0x2455E5260](@"_UITableCellAccessoryButton");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  if ([(RUIWebContainerViewAccessibility *)self isAccessibilityElement])
  {
    id v3 = [(RUIWebContainerViewAccessibility *)self _axSubviewText];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)RUIWebContainerViewAccessibility;
    id v3 = [(RUIWebContainerViewAccessibility *)&v5 accessibilityLabel];
  }

  return v3;
}

- (float)_accessibilityActivationDelay
{
  if ([(RUIWebContainerViewAccessibility *)self isAccessibilityElement]) {
    return 0.15;
  }
  v4.receiver = self;
  v4.super_class = (Class)RUIWebContainerViewAccessibility;
  [(RUIWebContainerViewAccessibility *)&v4 _accessibilityActivationDelay];
  return result;
}

- (unint64_t)accessibilityTraits
{
  if ([(RUIWebContainerViewAccessibility *)self isAccessibilityElement]) {
    return *MEMORY[0x263F1CEE8];
  }
  v4.receiver = self;
  v4.super_class = (Class)RUIWebContainerViewAccessibility;
  return [(RUIWebContainerViewAccessibility *)&v4 accessibilityTraits];
}

@end