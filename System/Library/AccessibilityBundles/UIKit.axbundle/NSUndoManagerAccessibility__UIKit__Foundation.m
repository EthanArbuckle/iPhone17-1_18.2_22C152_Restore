@interface NSUndoManagerAccessibility__UIKit__Foundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)redo;
- (void)undo;
@end

@implementation NSUndoManagerAccessibility__UIKit__Foundation

+ (id)safeCategoryTargetClassName
{
  return @"NSUndoManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)undo
{
  v11[1] = *MEMORY[0x263EF8340];
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)NSUndoManagerAccessibility__UIKit__Foundation;
  [(NSUndoManagerAccessibility__UIKit__Foundation *)&v7 undo];
  uint64_t v10 = *MEMORY[0x263F21828];
  v11[0] = MEMORY[0x263EFFA88];
  id v6 = (id)[NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v5 = (id)[(NSUndoManagerAccessibility__UIKit__Foundation *)v9 undoActionName];
  if (![v5 length])
  {
    id v2 = (id)UIKitAccessibilityLocalizedString();
    id v3 = v5;
    id v5 = v2;
  }
  id argument = (id)[objc_allocWithZone(MEMORY[0x263F21660]) initWithString:v5];
  [argument setAttributes:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
}

- (void)redo
{
  v11[1] = *MEMORY[0x263EF8340];
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)NSUndoManagerAccessibility__UIKit__Foundation;
  [(NSUndoManagerAccessibility__UIKit__Foundation *)&v7 redo];
  uint64_t v10 = *MEMORY[0x263F21828];
  v11[0] = MEMORY[0x263EFFA88];
  id v6 = (id)[NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v5 = (id)[(NSUndoManagerAccessibility__UIKit__Foundation *)v9 redoActionName];
  if (![v5 length])
  {
    id v2 = (id)UIKitAccessibilityLocalizedString();
    id v3 = v5;
    id v5 = v2;
  }
  id argument = (id)[objc_allocWithZone(MEMORY[0x263F21660]) initWithString:v5];
  [argument setAttributes:v6];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
}

@end