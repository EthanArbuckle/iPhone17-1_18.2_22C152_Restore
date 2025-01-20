@interface UIMovieScrubberEditingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UIMovieScrubberEditingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIMovieScrubberEditingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"UIMovieScrubberEditingView";
  v3 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"setEnabled:", "v", v3, 0);
  objc_storeStrong(v6, obj);
}

- (void)setEnabled:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  BOOL v8 = ([(UIMovieScrubberEditingViewAccessibility *)self safeBoolForKey:@"isEnabled"] & 1) != a3;
  v7.receiver = v11;
  v7.super_class = (Class)UIMovieScrubberEditingViewAccessibility;
  [(UIMovieScrubberEditingViewAccessibility *)&v7 setEnabled:v9];
  if (v8)
  {
    char v6 = 0;
    objc_opt_class();
    id v3 = (id)[(UIMovieScrubberEditingViewAccessibility *)v11 _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uimoviescrubbe.isa)];
    id v5 = (id)__UIAccessibilityCastAsSafeCategory();

    id v4 = v5;
    objc_storeStrong(&v5, 0);
    -[UIMovieScrubberAccessibility _accessibilityClearChildren](v4);
  }
}

@end