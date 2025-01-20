@interface SB_UIScenePresentationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6;
- (CGRect)_accessibilityFrameForSorting;
- (id)_accessibilitySpringBoardIconView;
@end

@implementation SB_UIScenePresentationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIScenePresentationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityFrameForSorting", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", 0);
}

- (CGRect)_accessibilityFrameForSorting
{
  id v3 = [(SB_UIScenePresentationViewAccessibility *)self _accessibilitySpringBoardIconView];
  v4 = v3;
  if (v3)
  {
    [v3 _accessibilityFrameForSorting];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)SB_UIScenePresentationViewAccessibility;
    [(SB_UIScenePresentationViewAccessibility *)&v17 _accessibilityFrameForSorting];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  double v14 = [(SB_UIScenePresentationViewAccessibility *)self _accessibilitySpringBoardIconView];
  double v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v13, a5, a6, x, y, width, height);
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)SB_UIScenePresentationViewAccessibility;
    -[SB_UIScenePresentationViewAccessibility _accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:](&v28, sel__accessibilityCompareFrameForScrollParent_frame_fromOrientation_toOrientation_, v13, a5, a6, x, y, width, height);
  }
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;

  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (id)_accessibilitySpringBoardIconView
{
  return (id)[(SB_UIScenePresentationViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_6 startWithSelf:0];
}

@end