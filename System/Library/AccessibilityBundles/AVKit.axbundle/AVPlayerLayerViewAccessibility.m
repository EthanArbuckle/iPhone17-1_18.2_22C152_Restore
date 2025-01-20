@interface AVPlayerLayerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axCanZoomIn;
- (BOOL)_axCanZoomOut;
- (BOOL)_axHasVideo;
- (BOOL)_axIsZoomable;
- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3;
- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_axZoomableView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AVPlayerLayerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"__AVPlayerLayerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"__AVPlayerLayerView", @"playerController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"contentDimensions", "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"hasEnabledAudio", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"hasEnabledVideo", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"isReadyToPlay", "B", 0);
  [v3 validateClass:@"AVPlaybackContentZoomingView"];
  [v3 validateClass:@"AVPlaybackContentZoomingView" isKindOfClass:@"UIScrollView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlaybackContentZoomingView", @"isZoomingEnabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"minimumZoomScale", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"maximumZoomScale", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"zoomScale", "d", 0);
}

- (BOOL)_axHasVideo
{
  v2 = [(AVPlayerLayerViewAccessibility *)self safeValueForKey:@"playerController"];
  id v3 = [v2 safeValueForKey:@"contentDimensions"];
  [v3 sizeValue];
  if (v5 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    char v7 = 0;
  }
  else {
    char v7 = [v2 safeBoolForKey:@"hasEnabledVideo"];
  }

  return v7;
}

- (id)_axZoomableView
{
  objc_opt_class();
  id v3 = [(AVPlayerLayerViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_1 startWithSelf:0];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

uint64_t __49__AVPlayerLayerViewAccessibility__axZoomableView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Avplaybackcont_4.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsZoomable
{
  id v2 = [(AVPlayerLayerViewAccessibility *)self _axZoomableView];
  char v3 = [v2 safeBoolForKey:@"isZoomingEnabled"];
  [v2 safeCGFloatForKey:@"minimumZoomScale"];
  double v5 = v4;
  [v2 safeCGFloatForKey:@"maximumZoomScale"];
  if (v6 > v5) {
    BOOL v7 = v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v2) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_axCanZoomIn
{
  id v2 = [(AVPlayerLayerViewAccessibility *)self _axZoomableView];
  [v2 safeCGFloatForKey:@"zoomScale"];
  BOOL v4 = v3 == 1.0;

  return v4;
}

- (BOOL)_axCanZoomOut
{
  id v2 = [(AVPlayerLayerViewAccessibility *)self _axZoomableView];
  [v2 safeCGFloatForKey:@"zoomScale"];
  BOOL v4 = v3 != 1.0;

  return v4;
}

- (id)accessibilityLabel
{
  double v3 = [(AVPlayerLayerViewAccessibility *)self accessibilityUserDefinedLabel];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    double v6 = [(AVPlayerLayerViewAccessibility *)self safeValueForKey:@"playerController"];
    BOOL v7 = @"media.background.view.label";
    if ([v6 safeBoolForKey:@"isReadyToPlay"])
    {
      if ([(AVPlayerLayerViewAccessibility *)self _axHasVideo])
      {
        BOOL v7 = @"video.background.view.label";
      }
      else if ([v6 safeBoolForKey:@"hasEnabledAudio"])
      {
        BOOL v7 = @"audio.background.view.label";
      }
    }
    accessibilityLocalizedString(v7);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"media.background.ios.view.hint");
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerLayerViewAccessibility;
  unint64_t v3 = [(AVPlayerLayerViewAccessibility *)&v7 accessibilityTraits];
  BOOL v4 = [(AVPlayerLayerViewAccessibility *)self _axIsZoomable];
  uint64_t v5 = *MEMORY[0x263F21B48];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3;
}

- (CGPoint)accessibilityActivationPoint
{
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  id v2 = (UIView *)objc_claimAutoreleasedReturnValue();
  [(UIView *)v2 bounds];
  CGRect v8 = UIAccessibilityConvertFrameToScreenCoordinates(v7, v2);
  *(float *)&v8.origin.x = v8.size.width * 0.5;
  double v3 = *(float *)&v8.origin.x;

  double v4 = 0.0;
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  BOOL v4 = [(AVPlayerLayerViewAccessibility *)self _axCanZoomIn];
  if (v4)
  {
    v9 = [(AVPlayerLayerViewAccessibility *)self _axZoomableView];
    id v5 = v9;
    AXPerformSafeBlock();
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    [v5 safeCGFloatForKey:@"zoomScale"];
    CGRect v7 = AXFormatMagnificationFactor();
    UIAccessibilityPostNotification(v6, v7);
  }
  return v4;
}

uint64_t __61__AVPlayerLayerViewAccessibility_accessibilityZoomInAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  BOOL v4 = [(AVPlayerLayerViewAccessibility *)self _axCanZoomOut];
  if (v4)
  {
    v9 = [(AVPlayerLayerViewAccessibility *)self _axZoomableView];
    id v5 = v9;
    AXPerformSafeBlock();
    UIAccessibilityNotifications v6 = *MEMORY[0x263F1CDC8];
    [v5 safeCGFloatForKey:@"zoomScale"];
    CGRect v7 = AXFormatMagnificationFactor();
    UIAccessibilityPostNotification(v6, v7);
  }
  return v4;
}

uint64_t __62__AVPlayerLayerViewAccessibility_accessibilityZoomOutAtPoint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "zoomToPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)isAccessibilityElement
{
  Class v3 = NSClassFromString(&cfstr_VideosuiPagina.isa);
  if (v3)
  {
    BOOL v4 = [(AVPlayerLayerViewAccessibility *)self _accessibilityAncestorIsKindOf:v3];
    if (v4) {
      char v5 = 1;
    }
    else {
      char v5 = [(AVPlayerLayerViewAccessibility *)self _accessibilityIsFKARunningForFocusItem];
    }
  }
  else
  {
    char v5 = [(AVPlayerLayerViewAccessibility *)self _accessibilityIsFKARunningForFocusItem];
  }
  return v5 ^ 1;
}

@end