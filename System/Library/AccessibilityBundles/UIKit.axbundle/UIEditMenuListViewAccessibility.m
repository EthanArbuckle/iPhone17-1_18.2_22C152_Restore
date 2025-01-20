@interface UIEditMenuListViewAccessibility
@end

@implementation UIEditMenuListViewAccessibility

void __56___UIEditMenuListViewAccessibility__reloadMenuAnimated___block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  char v1 = [(id)*MEMORY[0x263F1D020] _accessibilitySoftwareKeyboardActive];
  char v8 = 0;
  char v6 = 0;
  if ((v1 & 1) != 0
    || (id v9 = (id)[MEMORY[0x263F1C738] activeInstance],
        char v8 = 1,
        id v7 = (id)[v9 inputDelegate],
        char v6 = 1,
        LOBYTE(v3) = 0,
        !v7))
  {
    BOOL v3 = !AXIsDictationListening();
  }
  if (v6) {

  }
  if (v8) {
  if (v3)
  }
  {
    id v2 = (id)[*(id *)(a1 + 32) safeUIViewForKey:@"collectionView"];
    id argument = (id)[v2 _accessibilityUnignoredDescendant];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
    objc_storeStrong(&argument, 0);
  }
}

@end