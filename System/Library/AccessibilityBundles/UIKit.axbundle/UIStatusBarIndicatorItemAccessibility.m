@interface UIStatusBarIndicatorItemAccessibility
@end

@implementation UIStatusBarIndicatorItemAccessibility

id __84___UIStatusBarIndicatorItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  location[2] = a1;
  location[1] = a1;
  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  id v7 = -[_UIStatusBarIndicatorItemAccessibility _axLabelKeyForClassNameDict]((uint64_t)WeakRetained);
  id v6 = objc_loadWeakRetained(a1 + 4);
  v1 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v1);
  location[0] = (id)objc_msgSend(v7, "objectForKey:");

  id v10 = objc_loadWeakRetained(a1 + 4);
  id v11 = (id)[v10 accessibilityLabel];
  char v12 = 0;
  if (v11)
  {
    id v2 = v11;
  }
  else
  {
    id v13 = accessibilityLocalizedString(location[0]);
    char v12 = 1;
    id v2 = v13;
  }
  id v15 = v2;
  if (v12) {

  }
  objc_storeStrong(location, 0);
  v3 = v15;

  return v3;
}

@end