@interface UIKeyboardEmojiDraggableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation UIKeyboardEmojiDraggableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIKeyboardEmojiDraggableView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  v12 = self;
  v11[1] = (id)a2;
  char v10 = 0;
  objc_opt_class();
  id v9 = (id)__UIAccessibilityCastAsClass();
  id v8 = v9;
  objc_storeStrong(&v9, 0);
  v11[0] = (id)[v8 text];

  char v5 = 0;
  if (v11[0])
  {
    id v2 = v11[0];
  }
  else
  {
    v7.receiver = v12;
    v7.super_class = (Class)UIKeyboardEmojiDraggableViewAccessibility;
    id v6 = [(UIKeyboardEmojiDraggableViewAccessibility *)&v7 accessibilityLabel];
    char v5 = 1;
    id v2 = v6;
  }
  id v13 = v2;
  if (v5) {

  }
  objc_storeStrong(v11, 0);
  v3 = v13;

  return v3;
}

@end