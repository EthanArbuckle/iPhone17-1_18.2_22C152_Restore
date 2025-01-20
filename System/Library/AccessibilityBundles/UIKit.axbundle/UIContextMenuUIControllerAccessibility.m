@interface UIContextMenuUIControllerAccessibility
@end

@implementation UIContextMenuUIControllerAccessibility

void __59___UIContextMenuUIControllerAccessibility__axPerformEscape__block_invoke(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  v2[0] = (id)[a1[4] safeValueForKey:@"delegate"];
  objc_msgSend(v2[0], "contextMenuUIController:didRequestDismissalWithReason:alongsideActions:completion:", a1[4], 0);
  objc_storeStrong(v2, 0);
}

void __59___UIContextMenuUIControllerAccessibility__axPerformEscape__block_invoke_2()
{
}

uint64_t __63___UIContextMenuUIControllerAccessibility_platterContainerView__block_invoke(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  char v2 = -[_UIContextMenuUIControllerAccessibility _axPerformEscape](v3[0]);
  objc_storeStrong(v3, 0);
  return v2 & 1;
}

void __71___UIContextMenuUIControllerAccessibility_presentationTransitionDidEnd__block_invoke(id *a1)
{
  location[2] = a1;
  location[1] = a1;
  id v2 = (id)[a1[4] safeValueForKey:@"menuView"];
  location[0] = (id)[v2 safeValueForKey:@"currentListView"];

  UIAccessibilityNotifications notification = *MEMORY[0x263F812F8];
  char v4 = 0;
  if (location[0])
  {
    UIAccessibilityPostNotification(notification, location[0]);
  }
  else
  {
    id v5 = (id)[a1[4] safeValueForKey:@"platterContainerView"];
    char v4 = 1;
    UIAccessibilityPostNotification(notification, v5);
  }
  if (v4) {

  }
  objc_storeStrong(location, 0);
}

double __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained accessibilityFrame];
  double v4 = v1;

  return v4;
}

uint64_t __85___UIContextMenuUIControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  char v2 = -[_UIContextMenuUIControllerAccessibility _axPerformEscape](v3[0]);
  objc_storeStrong(v3, 0);
  return v2 & 1;
}

@end