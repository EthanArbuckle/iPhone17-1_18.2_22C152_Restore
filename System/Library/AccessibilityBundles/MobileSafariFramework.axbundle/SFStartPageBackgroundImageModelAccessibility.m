@interface SFStartPageBackgroundImageModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SFStartPageBackgroundImageModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFStartPageBackgroundImageModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageModel", @"isCustomImage", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageModel", @"itemProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SFStartPageBackgroundImageModel", @"imageDescription", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WBSStartPageBackgroundImageDescription", @"url", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(SFStartPageBackgroundImageModelAccessibility *)self safeValueForKey:@"imageDescription"];
  if (v3)
  {
    objc_opt_class();
    v4 = [v3 safeValueForKey:@"url"];
    v5 = __UIAccessibilityCastAsClass();

    v6 = [v5 lastPathComponent];

    v7 = accessibilityMobileSafariLocalizedString(v6);
  }
  else
  {
    v8 = [(SFStartPageBackgroundImageModelAccessibility *)self safeValueForKey:@"itemProvider"];
    int v9 = [(SFStartPageBackgroundImageModelAccessibility *)self safeBoolForKey:@"isCustomImage"];
    if (v8) {
      int v10 = v9;
    }
    else {
      int v10 = 0;
    }
    if ((v10 & 1) != 0 || !v9)
    {
      if (v10) {
        v11 = @"image.from.library";
      }
      else {
        v11 = @"select.image.from.library";
      }
      v7 = accessibilityMobileSafariLocalizedString(v11);
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

@end