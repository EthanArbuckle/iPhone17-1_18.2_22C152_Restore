@interface SFUnifiedBarRegistrationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_makeBarItemForSFBarItem:(int64_t)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axApplyLabel:(id)a3 withType:(int64_t)a4;
- (void)_axSetTabGroupTitle:(id)a3 forItem:(id)a4;
- (void)setAttributedTitle:(id)a3 forBarItem:(int64_t)a4;
- (void)setTitle:(id)a3 forBarItem:(int64_t)a4;
@end

@implementation SFUnifiedBarRegistrationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedBarRegistration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBarRegistration", @"_makeBarItemForSFBarItem:", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBarRegistration", @"setTitle:forBarItem:", "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFUnifiedBarRegistration", @"setAttributedTitle:forBarItem:", "v", "@", "q", 0);
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_bookmarksAndSidebarButton" withType:"SFUnifiedBarButton"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_backButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_forwardButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_tabGroupButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_newTabButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_tabOverviewButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_cancelButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_shareButton" withType:"SFUnifiedBarItem"];
  [v3 validateClass:@"SFFeatureManager"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"SFFeatureManager", @"sharedFeatureManager", "@", 0);
  [v3 validateClass:@"SFUnifiedBarRegistration" hasInstanceVariable:@"_barManager" withType:"_SFBarManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SFBarManager", @"delegate", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  [(SFUnifiedBarRegistrationAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_bookmarksAndSidebarButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v3 withType:3];

  v4 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_backButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v4 withType:0];

  v5 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_forwardButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v5 withType:1];

  v6 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_tabGroupButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v6 withType:2];

  v7 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_newTabButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v7 withType:7];

  v8 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_tabOverviewButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v8 withType:8];

  v9 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_cancelButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v9 withType:12];

  v10 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_shareButton"];
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v10 withType:6];
}

- (id)_makeBarItemForSFBarItem:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  v5 = -[SFUnifiedBarRegistrationAccessibility _makeBarItemForSFBarItem:](&v7, sel__makeBarItemForSFBarItem_);
  [(SFUnifiedBarRegistrationAccessibility *)self _axApplyLabel:v5 withType:a3];

  return v5;
}

- (void)_axApplyLabel:(id)a3 withType:(int64_t)a4
{
  id v12 = a3;
  switch(a4)
  {
    case 0:
      v6 = @"buttonbar.back.text";
      goto LABEL_20;
    case 1:
      v6 = @"buttonbar.forward.text";
      goto LABEL_20;
    case 2:
      objc_super v7 = [v12 safeValueForKeyPath:@"attributedTitle.string"];
      v8 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_tabGroupButton"];
      [(SFUnifiedBarRegistrationAccessibility *)self _axSetTabGroupTitle:v7 forItem:v8];

      goto LABEL_21;
    case 3:
      v9 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_barManager"];
      objc_super v7 = [v9 safeValueForKey:@"delegate"];

      if ([v7 safeIntegerForKey:@"_bookmarksPresentationStyle"]) {
        v10 = @"buttonbar.sidebar.text";
      }
      else {
        v10 = @"buttonbar.bookmarks.text";
      }
      objc_super v11 = accessibilitySafariServicesLocalizedString(v10);
      [v12 setAccessibilityLabel:v11];

      goto LABEL_21;
    case 4:
      v6 = @"buttonbar.voicesearch";
      goto LABEL_20;
    case 5:
      v6 = @"buttonbar.moreMenu";
      goto LABEL_20;
    case 6:
      v6 = @"actions.button";
      goto LABEL_20;
    case 7:
      v6 = @"new.tab.button";
      goto LABEL_20;
    case 8:
      v6 = @"buttonbar.tabs.text";
      goto LABEL_20;
    case 9:
      v6 = @"open.safari";
      goto LABEL_20;
    case 11:
      v6 = @"downloads.button";
      goto LABEL_20;
    case 12:
      v6 = @"cancel.button";
      goto LABEL_20;
    case 13:
      v6 = @"buttonbar.formatmenu";
      goto LABEL_20;
    case 14:
      v6 = @"buttonbar.stop";
      goto LABEL_20;
    case 15:
      v6 = @"buttonbar.reload";
LABEL_20:
      objc_super v7 = accessibilitySafariServicesLocalizedString(v6);
      [v12 setAccessibilityLabel:v7];
LABEL_21:

      break;
    default:
      break;
  }
}

- (void)_axSetTabGroupTitle:(id)a3 forItem:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    accessibilityMobileSafariLocalizedString(@"tab.group.name.button");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v7 = AXCFormattedString();

    objc_msgSend(v5, "setAccessibilityLabel:", v7, v6);
  }
}

- (void)setTitle:(id)a3 forBarItem:(int64_t)a4
{
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  [(SFUnifiedBarRegistrationAccessibility *)&v8 setTitle:v6 forBarItem:a4];
  if (a4 == 2)
  {
    objc_super v7 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_tabGroupButton"];
    [(SFUnifiedBarRegistrationAccessibility *)self _axSetTabGroupTitle:v6 forItem:v7];
  }
}

- (void)setAttributedTitle:(id)a3 forBarItem:(int64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedBarRegistrationAccessibility;
  [(SFUnifiedBarRegistrationAccessibility *)&v9 setAttributedTitle:v6 forBarItem:a4];
  if (a4 == 2)
  {
    objc_super v7 = [v6 string];
    objc_super v8 = [(SFUnifiedBarRegistrationAccessibility *)self safeValueForKey:@"_tabGroupButton"];
    [(SFUnifiedBarRegistrationAccessibility *)self _axSetTabGroupTitle:v7 forItem:v8];
  }
}

@end