@interface UIColorAccessibility__AnnotationKit__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)akColorPickerBlue;
+ (id)akColorPickerGreen;
+ (id)akColorPickerOrange;
+ (id)akColorPickerPurple;
+ (id)akColorPickerRed;
+ (id)akColorPickerYellow;
+ (id)blackColor;
+ (id)safeCategoryTargetClassName;
+ (id)whiteColor;
@end

@implementation UIColorAccessibility__AnnotationKit__UIKit

+ (id)whiteColor
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_whiteColor);
  v3 = accessibilityLocalizedString(@"color.picker.white");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)blackColor
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_blackColor);
  v3 = accessibilityLocalizedString(@"color.picker.black");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)safeCategoryTargetClassName
{
  return @"UIColor";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (id)akColorPickerRed
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerRed);
  v3 = accessibilityLocalizedString(@"color.picker.red");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)akColorPickerOrange
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerOrange);
  v3 = accessibilityLocalizedString(@"color.picker.orange");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)akColorPickerYellow
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerYellow);
  v3 = accessibilityLocalizedString(@"color.picker.yellow");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)akColorPickerGreen
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerGreen);
  v3 = accessibilityLocalizedString(@"color.picker.green");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)akColorPickerBlue
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerBlue);
  v3 = accessibilityLocalizedString(@"color.picker.blue");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

+ (id)akColorPickerPurple
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___UIColorAccessibility__AnnotationKit__UIKit;
  v2 = objc_msgSendSuper2(&v5, sel_akColorPickerPurple);
  v3 = accessibilityLocalizedString(@"color.picker.purple");
  [v2 setAccessibilityLabel:v3];

  return v2;
}

@end