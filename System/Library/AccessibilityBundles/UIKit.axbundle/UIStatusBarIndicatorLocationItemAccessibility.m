@interface UIStatusBarIndicatorLocationItemAccessibility
@end

@implementation UIStatusBarIndicatorLocationItemAccessibility

void __68___UIStatusBarIndicatorLocationItemAccessibility_accessibilityLabel__block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v10 = 0;
  objc_storeStrong(&v10, a3);
  id v7 = location[0];
  id v8 = (id)[NSClassFromString(&cfstr_Uistatusbarind_5.isa) safeValueForKey:@"prominentDisplayIdentifier"];
  char v9 = 0;
  if (objc_msgSend(v7, "isEqual:")) {
    char v9 = [v10 safeBoolForKey:@"isEnabled"];
  }

  if (v9)
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    *a4 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

@end