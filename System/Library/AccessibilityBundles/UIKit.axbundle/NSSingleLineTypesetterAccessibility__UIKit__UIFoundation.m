@interface NSSingleLineTypesetterAccessibility__UIKit__UIFoundation
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9;
@end

@implementation NSSingleLineTypesetterAccessibility__UIKit__UIFoundation

+ (id)safeCategoryTargetClassName
{
  return @"NSSingleLineTypesetter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = @"NSSingleLineTypesetter";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "{_NSRange=QQ}", "q", "B", "B", "B", "B", "d", 0);
  v4 = @"NSTypesetter";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"attributedString", v5, 0);
  objc_storeStrong(v7, v6);
}

- (id)createRenderingContextForCharacterRange:(_NSRange)a3 typesetterBehavior:(int64_t)a4 usesScreenFonts:(BOOL)a5 hasStrongRight:(BOOL)a6 syncDirection:(BOOL)a7 mirrorsTextAlignment:(BOOL)a8 maximumWidth:(double)a9
{
  _NSRange v25 = a3;
  v24 = self;
  SEL v23 = a2;
  int64_t v22 = a4;
  BOOL v21 = a5;
  BOOL v20 = a6;
  BOOL v19 = a7;
  BOOL v18 = a8;
  v17[1] = *(id *)&a9;
  v16.receiver = self;
  v16.super_class = (Class)NSSingleLineTypesetterAccessibility__UIKit__UIFoundation;
  v17[0] = -[NSSingleLineTypesetterAccessibility__UIKit__UIFoundation createRenderingContextForCharacterRange:typesetterBehavior:usesScreenFonts:hasStrongRight:syncDirection:mirrorsTextAlignment:maximumWidth:](&v16, sel_createRenderingContextForCharacterRange_typesetterBehavior_usesScreenFonts_hasStrongRight_syncDirection_mirrorsTextAlignment_maximumWidth_, a3.location, a3.length, a4, a5, a6, a7, a9, a8);
  char v14 = 0;
  objc_opt_class();
  id v11 = (id)[(NSSingleLineTypesetterAccessibility__UIKit__UIFoundation *)v24 safeValueForKey:@"attributedString"];
  id v13 = (id)__UIAccessibilityCastAsClass();

  id v12 = v13;
  objc_storeStrong(&v13, 0);
  id v15 = (id)[v12 string];

  if ([v15 length]) {
    [v17[0] _accessibilitySetRetainedValue:v15 forKey:@"AXStringToBeRenderedByContext"];
  }
  id v10 = v17[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v17, 0);

  return v10;
}

@end