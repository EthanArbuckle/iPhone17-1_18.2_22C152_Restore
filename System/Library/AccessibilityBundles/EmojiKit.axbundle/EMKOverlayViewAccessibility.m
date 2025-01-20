@interface EMKOverlayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (BOOL)isAccessibilityElement;
- (EMKOverlayViewAccessibility)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6;
- (int64_t)accessibilityContainerType;
- (void)setView:(id)a3 anchorRect:(CGRect)a4;
@end

@implementation EMKOverlayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EMKOverlayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKOverlayView", @"initWithView: anchorRect: emojiTokenList: selectionHandler:", "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMKEmojiTokenList", @"emojiTokenArray", "@", 0);
  [v3 validateClass:@"EMFEmojiToken"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EMFEmojiToken", @"string", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

uint64_t __57__EMKOverlayViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (EMKOverlayViewAccessibility)initWithView:(id)a3 anchorRect:(CGRect)a4 emojiTokenList:(id)a5 selectionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v37.receiver = self;
  v37.super_class = (Class)EMKOverlayViewAccessibility;
  v16 = -[EMKOverlayViewAccessibility initWithView:anchorRect:emojiTokenList:selectionHandler:](&v37, sel_initWithView_anchorRect_emojiTokenList_selectionHandler_, v13, v14, v15, x, y, width, height);
  v17 = [(EMKOverlayViewAccessibility *)v16 safeValueForKey:@"_overlayRect"];
  [v17 rectValue];
  double v19 = v18;
  double v21 = v20;

  v22 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  v23 = __UIAccessibilitySafeClass();
  v24 = [v23 safeValueForKey:@"emojiTokenArray"];
  v25 = __UIAccessibilityCastAsClass();

  v36 = v14;
  if ([v25 count])
  {
    unint64_t v26 = 0;
    double v27 = v21 + 6.0;
    do
    {
      v28 = [v25 objectAtIndex:v26];
      v29 = [[EMKEmojiOverlayElement alloc] initWithAccessibilityContainer:v16];
      unint64_t v30 = v26 + 1;
      -[EMKEmojiOverlayElement setRowRange:](v29, "setRowRange:", v26, [v25 count]);
      -[EMKEmojiOverlayElement setAccessibilityFrame:](v29, "setAccessibilityFrame:", v19 + (double)v26 * 36.0 + 10.0 + (double)(v26 + 1) * 4.0, v27, 36.0, 43.0);
      v31 = [v28 safeValueForKey:@"string"];
      [(EMKEmojiOverlayElement *)v29 setAccessibilityLabel:v31];
      [v22 addObject:v29];

      unint64_t v26 = v30;
    }
    while ([v25 count] > v30);
  }
  [(EMKOverlayViewAccessibility *)v16 setAccessibilityElements:v22];
  UIAccessibilityNotifications v32 = *MEMORY[0x263F1CE68];
  v33 = [(EMKOverlayViewAccessibility *)v16 accessibilityElements];
  v34 = [v33 firstObject];
  UIAccessibilityPostNotification(v32, v34);

  return v16;
}

- (void)setView:(id)a3 anchorRect:(CGRect)a4
{
  v18.receiver = self;
  v18.super_class = (Class)EMKOverlayViewAccessibility;
  -[EMKOverlayViewAccessibility setView:anchorRect:](&v18, sel_setView_anchorRect_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v5 = [(EMKOverlayViewAccessibility *)self safeValueForKey:@"_overlayRect"];
  [v5 rectValue];
  double v7 = v6;
  double v9 = v8;

  v10 = [(EMKOverlayViewAccessibility *)self accessibilityElements];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = 0;
    double v13 = v9 + 6.0;
    do
    {
      uint64_t v14 = v12 + 1;
      double v15 = v7 + (double)v12 * 36.0 + 10.0 + (double)(unint64_t)(v12 + 1) * 4.0;
      v16 = [(EMKOverlayViewAccessibility *)self accessibilityElements];
      v17 = [v16 objectAtIndex:v12];

      objc_msgSend(v17, "setAccessibilityFrame:", v15, v13, 36.0, 43.0);
      uint64_t v12 = v14;
    }
    while (v14 != v11);
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end