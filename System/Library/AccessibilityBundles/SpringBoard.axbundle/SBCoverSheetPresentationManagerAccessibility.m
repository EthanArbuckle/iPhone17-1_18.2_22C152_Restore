@interface SBCoverSheetPresentationManagerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6;
@end

@implementation SBCoverSheetPresentationManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBCoverSheetPresentationManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__SBCoverSheetPresentationManagerAccessibility_setCoverSheetPresented_animated_options_withCompletion___block_invoke;
  v13[3] = &unk_265154020;
  id v14 = v10;
  v12.receiver = self;
  v12.super_class = (Class)SBCoverSheetPresentationManagerAccessibility;
  id v11 = v10;
  [(SBCoverSheetPresentationManagerAccessibility *)&v12 setCoverSheetPresented:v8 animated:v7 options:a5 withCompletion:v13];
}

uint64_t __103__SBCoverSheetPresentationManagerAccessibility_setCoverSheetPresented_animated_options_withCompletion___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

@end