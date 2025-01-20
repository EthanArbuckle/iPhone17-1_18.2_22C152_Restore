@interface DOMNodeAccessibility__UIKit__WebKitLegacy
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4;
- (id)_moveRight:(BOOL)a3 withHistory:(id)a4;
- (void)_accessibilityCheckBorderHit:(char)a3 left:;
- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4;
@end

@implementation DOMNodeAccessibility__UIKit__WebKitLegacy

+ (id)safeCategoryTargetClassName
{
  return @"DOMNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_updateSelectionWithTextRange:(id)a3 withAffinityDownstream:(BOOL)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v6 = a4;
  v5.receiver = v8;
  v5.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  [(DOMNodeAccessibility__UIKit__WebKitLegacy *)&v5 _updateSelectionWithTextRange:location[0] withAffinityDownstream:a4];
  UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
  objc_storeStrong(location, 0);
}

- (void)_accessibilityCheckBorderHit:(char)a3 left:
{
  id v14 = a1;
  char v13 = a2 & 1;
  char v12 = a3 & 1;
  if (a1)
  {
    id v11 = (id)[v14 safeValueForKey:@"_selectableText"];
    id v3 = (id)[v11 selectedTextRange];
    BOOL v7 = v3 != 0;

    if (v7)
    {
      id v9 = (id)[v11 selectedTextRange];
      id location = (id)[v9 start];
      if ([v9 isEmpty] & 1) != 0 || (v13)
      {
        if (v12) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 2;
        }
        id v5 = (id)[v11 positionFromPosition:location inDirection:v4 offset:1];
        id v6 = location;
        id location = v5;
      }
      if (!location) {
        UIAccessibilityPostNotification(*MEMORY[0x263F81340], 0);
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v9, 0);
      int v10 = 0;
    }
    else
    {
      int v10 = 1;
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_moveLeft:(BOOL)a3 withHistory:(id)a4
{
  int v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  -[DOMNodeAccessibility__UIKit__WebKitLegacy _accessibilityCheckBorderHit:left:](v10, v8, 1);
  v6.receiver = v10;
  v6.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  id v5 = [(DOMNodeAccessibility__UIKit__WebKitLegacy *)&v6 _moveLeft:v8 withHistory:location];
  objc_storeStrong(&location, 0);

  return v5;
}

- (id)_moveRight:(BOOL)a3 withHistory:(id)a4
{
  int v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  -[DOMNodeAccessibility__UIKit__WebKitLegacy _accessibilityCheckBorderHit:left:](v10, v8, 0);
  v6.receiver = v10;
  v6.super_class = (Class)DOMNodeAccessibility__UIKit__WebKitLegacy;
  id v5 = [(DOMNodeAccessibility__UIKit__WebKitLegacy *)&v6 _moveRight:v8 withHistory:location];
  objc_storeStrong(&location, 0);

  return v5;
}

@end