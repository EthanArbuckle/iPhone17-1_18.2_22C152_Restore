@interface CHFriendListTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setFriend:(id)a3 snapshot:(id)a4 formattingManager:(id)a5 animated:(BOOL)a6;
@end

@implementation CHFriendListTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHFriendListTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHFriendListTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendListTableViewCell", @"detailLineOneLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendListTableViewCell", @"detailLineTwoLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendListTableViewCell", @"competitionBadgeView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHFriendListTableViewCell", @"setFriend:snapshot:formattingManager:animated:", "v", "@", "@", "@", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)CHFriendListTableViewCellAccessibility;
  [(CHFriendListTableViewCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 textLabel];
  if (v4)
  {
    v5 = [(CHFriendListTableViewCellAccessibility *)self safeValueForKey:@"detailLineOneLabel"];
    v6 = [(CHFriendListTableViewCellAccessibility *)self safeValueForKey:@"detailLineTwoLabel"];
    v7 = [(CHFriendListTableViewCellAccessibility *)self safeValueForKey:@"competitionBadgeView"];
    [v7 setIsAccessibilityElement:1];
    v8 = accessibilityLocalizedString(@"competition.in.progress");
    [v7 setAccessibilityLabel:v8];

    objc_initWeak(&location, v4);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = __84__CHFriendListTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v14 = &unk_18448;
    objc_copyWeak(&v15, &location);
    [v4 _setAccessibilityLabelBlock:&v11];
    v9 = +[NSArray axArrayByIgnoringNilElementsWithCount:](NSArray, "axArrayByIgnoringNilElementsWithCount:", 4, v4, v5, v6, v7, v11, v12, v13, v14);
    v10 = AXLabelForElements();
    [(CHFriendListTableViewCellAccessibility *)self setAccessibilityLabel:v10];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

id __84__CHFriendListTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained text];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"•" withString:&stru_1A620];

  return v3;
}

- (void)setFriend:(id)a3 snapshot:(id)a4 formattingManager:(id)a5 animated:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)CHFriendListTableViewCellAccessibility;
  [(CHFriendListTableViewCellAccessibility *)&v7 setFriend:a3 snapshot:a4 formattingManager:a5 animated:a6];
  [(CHFriendListTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end