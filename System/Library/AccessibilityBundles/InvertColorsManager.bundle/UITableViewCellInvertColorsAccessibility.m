@interface UITableViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_accessibilityLoadInvertColors;
@end

@implementation UITableViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x3032000000;
  v7 = sub_C638;
  v8 = sub_C648;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  objc_msgSend(v2, "setAccessibilityIgnoresInvertColors:", 1, _NSConcreteStackBlock, 3221225472, sub_E2C4, &unk_44710, self, &v4);
}

@end