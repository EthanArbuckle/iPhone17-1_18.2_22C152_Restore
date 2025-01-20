@interface MKPlaceViewStyleProviderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation MKPlaceViewStyleProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceViewStyleProvider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___MKPlaceViewStyleProviderAccessibility;
  v11 = objc_msgSendSuper2(&v14, sel_attributionStringWithTitle_displayName_logo_isSnippetLogo_, a3, v10, a5, v6);
  v12 = v11;
  if (v10) {
    objc_msgSend(v11, "addAttribute:value:range:", @"AXAttributeDisplayName", v10, 0, objc_msgSend(v11, "length"));
  }

  return v12;
}

@end