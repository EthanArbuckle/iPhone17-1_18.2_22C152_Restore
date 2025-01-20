@interface UITabOutlineViewAccessibility
@end

@implementation UITabOutlineViewAccessibility

id __62___UITabOutlineViewAccessibility__accessibilitySetupTabButton__block_invoke(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  v10[0] = objc_loadWeakRetained(a1 + 4);
  id v9 = (id)[v10[0] _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Uitabcontainer_0.isa)];
  id v4 = (id)[v9 safeValueForKey:@"sidebar"];
  if ([v4 safeBoolForKey:@"_isVisible"]) {
    v1 = @"hide.sidebar";
  }
  else {
    v1 = @"show.sidebar";
  }
  id location = v1;

  id WeakRetained = objc_loadWeakRetained(a1 + 4);
  char v7 = [WeakRetained safeBoolForKey:@"isEditing"];

  if (v7) {
    objc_storeStrong(&location, @"reset.sidebar");
  }
  id v3 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);

  return v3;
}

@end