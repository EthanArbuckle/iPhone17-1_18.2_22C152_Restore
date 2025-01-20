@interface SCLHistoryItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAddPausesToNewLineInLabel:(id)a3;
- (void)setHistoryGroup:(id)a3;
@end

@implementation SCLHistoryItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SCLHistoryItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SCLHistoryItemView" hasInstanceVariable:@"_label" withType:"UILabel"];
  [v3 validateClass:@"SCLHistoryItemView" hasInstanceVariable:@"_intervalLabel" withType:"UILabel"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)SCLHistoryItemViewAccessibility;
  [(SCLHistoryItemViewAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  id v3 = [(SCLHistoryItemViewAccessibility *)self safeValueForKey:@"_label"];
  v4 = __UIAccessibilityCastAsClass();

  [(SCLHistoryItemViewAccessibility *)self _axAddPausesToNewLineInLabel:v4];
  objc_opt_class();
  v5 = [(SCLHistoryItemViewAccessibility *)self safeValueForKey:@"_intervalLabel"];
  v6 = __UIAccessibilityCastAsClass();

  [(SCLHistoryItemViewAccessibility *)self _axAddPausesToNewLineInLabel:v6];
}

- (void)setHistoryGroup:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SCLHistoryItemViewAccessibility;
  [(SCLHistoryItemViewAccessibility *)&v4 setHistoryGroup:a3];
  [(SCLHistoryItemViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_axAddPausesToNewLineInLabel:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __64__SCLHistoryItemViewAccessibility__axAddPausesToNewLineInLabel___block_invoke;
  v6[3] = &unk_41E0;
  objc_copyWeak(&v7, &location);
  [v3 _setAccessibilityLabelBlock:v6];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __64__SCLHistoryItemViewAccessibility__axAddPausesToNewLineInLabel___block_invoke_2;
  v4[3] = &unk_41E0;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityValueBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __64__SCLHistoryItemViewAccessibility__axAddPausesToNewLineInLabel___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained text];
  id v3 = +[NSCharacterSet newlineCharacterSet];
  objc_super v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  id v5 = [v4 firstObject];

  return v5;
}

id __64__SCLHistoryItemViewAccessibility__axAddPausesToNewLineInLabel___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained text];
  id v3 = +[NSCharacterSet newlineCharacterSet];
  objc_super v4 = [v2 componentsSeparatedByCharactersInSet:v3];

  if ([v4 count])
  {
    uint64_t v5 = objc_msgSend(v4, "subarrayWithRange:", 1, (char *)objc_msgSend(v4, "count") - 1);

    objc_super v4 = (void *)v5;
  }
  v6 = [v4 componentsJoinedByString:@", "];

  return v6;
}

@end