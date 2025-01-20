@interface CEKWheelScrubberViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsFilterChooser;
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)isPhotoStyleScrubber;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)accessibilityFrame;
- (id)_axPhotoEffect;
- (id)_axPhotoFilterName;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axFilterAnnouncement;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation CEKWheelScrubberViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKWheelScrubberView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKWheelScrubberView", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKWheelScrubberView", @"selectedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKWheelScrubberView", @"markedIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKWheelScrubberView", @"switchToNextItem", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKWheelScrubberView", @"switchToPreviousItem", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CEKSlider", @"value", "d", 0);
  [v3 validateClass:@"CEKWheelScrubberView" isKindOfClass:@"UIView"];
}

- (BOOL)_axIsFilterChooser
{
  v2 = [(CEKWheelScrubberViewAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    MEMORY[0x2455E1420](@"CAMViewfinderViewController");
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (id)_axPhotoEffect
{
  id v3 = [(CEKWheelScrubberViewAccessibility *)self safeValueForKey:@"delegate"];
  uint64_t v4 = [(CEKWheelScrubberViewAccessibility *)self safeIntegerForKey:@"selectedIndex"];
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v5 = [v3 _effectForIndex:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_axFilterAnnouncement
{
  v2 = [(CEKWheelScrubberViewAccessibility *)self _axPhotoEffect];

  if (v2)
  {
    id v3 = (void *)MEMORY[0x263F21660];
    uint64_t v4 = accessibilityCameraEditKitD2xLocalizedString(@"filter.intensity.hint");
    id argument = [v3 axAttributedStringWithString:v4];

    [argument setAttribute:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F21828]];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], argument);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)isPhotoStyleScrubber
{
  v2 = [(CEKWheelScrubberViewAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"PhotosUIPrivate.PUPhotoStyleToolController");
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  id v3 = [(CEKWheelScrubberViewAccessibility *)self safeValueForKey:@"delegate"];
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = accessibilityCameraEditKitD2xLocalizedString(@"filter.chooser");
  }
  else if ([(CEKWheelScrubberViewAccessibility *)self isPhotoStyleScrubber])
  {
    uint64_t v4 = accessibilityCameraEditKitV2LocalizedString(@"styles.chooser");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CEKWheelScrubberViewAccessibility;
    uint64_t v4 = [(CEKWheelScrubberViewAccessibility *)&v7 accessibilityLabel];
  }
  v5 = (void *)v4;

  return v5;
}

- (BOOL)accessibilityActivate
{
  if ([(CEKWheelScrubberViewAccessibility *)self isPhotoStyleScrubber]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)CEKWheelScrubberViewAccessibility;
  return [(CEKWheelScrubberViewAccessibility *)&v4 accessibilityActivate];
}

- (CGPoint)accessibilityActivationPoint
{
  BOOL v3 = [(CEKWheelScrubberViewAccessibility *)self isPhotoStyleScrubber];
  double v4 = -1.0;
  double v5 = -1.0;
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CEKWheelScrubberViewAccessibility;
    [(CEKWheelScrubberViewAccessibility *)&v6 accessibilityActivationPoint];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)accessibilityValue
{
  BOOL v3 = [(CEKWheelScrubberViewAccessibility *)self safeValueForKey:@"delegate"];
  uint64_t v4 = [(CEKWheelScrubberViewAccessibility *)self safeIntegerForKey:@"selectedIndex"];
  MEMORY[0x2455E1420](@"CAMViewfinderViewController");
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_respondsToSelector())
    {
      unint64_t v5 = [v3 _filterTypeForItemIndex:v4];
      if (v5 > 0x10) {
        objc_super v6 = 0;
      }
      else {
        objc_super v6 = off_26509F0A8[v5];
      }
    }
    else
    {
      objc_super v6 = @"none";
    }
    objc_super v7 = [NSString stringWithFormat:@"filter.%@", v6];
    v10 = accessibilityCameraEditKitD2xLocalizedString(v7);
    goto LABEL_17;
  }
  MEMORY[0x2455E1420](@"PUFilterToolController");
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (![(CEKWheelScrubberViewAccessibility *)self isPhotoStyleScrubber])
    {
      v14.receiver = self;
      v14.super_class = (Class)CEKWheelScrubberViewAccessibility;
      v10 = [(CEKWheelScrubberViewAccessibility *)&v14 accessibilityValue];
      goto LABEL_18;
    }
    objc_super v7 = [v3 safeSwiftValueForKey:@"styleLabel"];
    v8 = [v7 accessibilityLabel];
    __UIAXStringForVariables();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  objc_super v7 = [(CEKWheelScrubberViewAccessibility *)self _axPhotoFilterName];
  v8 = [(CEKWheelScrubberViewAccessibility *)self _axPhotoEffect];
  if (!v8)
  {
    id v11 = v7;
LABEL_15:
    v10 = v11;
    goto LABEL_16;
  }
  v9 = [v3 safeValueForKey:@"_slider"];
  [v9 safeCGFloatForKey:@"value"];
  v13 = AXFormatFloatWithPercentage();
  v10 = __UIAXStringForVariables();

LABEL_16:
LABEL_17:

LABEL_18:

  return v10;
}

- (id)_axPhotoFilterName
{
  v2 = [(CEKWheelScrubberViewAccessibility *)self _axPhotoEffect];
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 CIFilterName];
    if ([v4 isEqualToString:@"CIPhotoEffect3DVivid"])
    {
      unint64_t v5 = @"vivid";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DVividWarm"])
    {
      unint64_t v5 = @"vivid.warm";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DVividCool"])
    {
      unint64_t v5 = @"vivid.cool";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DDramatic"])
    {
      unint64_t v5 = @"dramatic";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DDramaticWarm"])
    {
      unint64_t v5 = @"dramatic.warm";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DDramaticCool"])
    {
      unint64_t v5 = @"dramatic.cool";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffectMono"])
    {
      unint64_t v5 = @"mono";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DSilverplate"])
    {
      unint64_t v5 = @"silverplate";
    }
    else if ([v4 isEqualToString:@"CIPhotoEffect3DNoir"])
    {
      unint64_t v5 = @"noir";
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = @"none";
  }
  objc_super v6 = [NSString stringWithFormat:@"filter.%@", v5];
  objc_super v7 = accessibilityCameraEditKitD2xLocalizedString(v6);

  return v7;
}

- (id)accessibilityHint
{
  v8.receiver = self;
  v8.super_class = (Class)CEKWheelScrubberViewAccessibility;
  BOOL v3 = [(CEKWheelScrubberViewAccessibility *)&v8 accessibilityHint];
  if ([(CEKWheelScrubberViewAccessibility *)self _axIsFilterChooser])
  {
    uint64_t v4 = accessibilityCameraEditKitD2xLocalizedString(@"filter.adjustable.instructions");

    unint64_t v5 = [(CEKWheelScrubberViewAccessibility *)self _axPhotoEffect];

    if (v5)
    {
      objc_super v7 = accessibilityCameraEditKitD2xLocalizedString(@"filter.intensity.hint");
      BOOL v3 = __UIAXStringForVariables();
    }
    else
    {
      BOOL v3 = v4;
    }
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)CEKWheelScrubberViewAccessibility;
  unint64_t v3 = [(CEKWheelScrubberViewAccessibility *)&v8 accessibilityTraits];
  uint64_t v4 = [(CEKWheelScrubberViewAccessibility *)self safeIntegerForKey:@"selectedIndex"];
  uint64_t v5 = [(CEKWheelScrubberViewAccessibility *)self safeIntegerForKey:@"markedIndex"];
  unint64_t v6 = v3 & ~*MEMORY[0x263F1CF38];
  if (v4 == v5) {
    unint64_t v6 = *MEMORY[0x263F1CF38] | v3;
  }
  return *MEMORY[0x263F1CED8] | v6;
}

- (void)accessibilityIncrement
{
}

uint64_t __59__CEKWheelScrubberViewAccessibility_accessibilityIncrement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) switchToNextItem];
  v2 = *(void **)(a1 + 32);

  return [v2 _axFilterAnnouncement];
}

- (void)accessibilityDecrement
{
}

uint64_t __59__CEKWheelScrubberViewAccessibility_accessibilityDecrement__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) switchToPreviousItem];
  v2 = *(void **)(a1 + 32);

  return [v2 _axFilterAnnouncement];
}

- (CGRect)accessibilityFrame
{
  v25.receiver = self;
  v25.super_class = (Class)CEKWheelScrubberViewAccessibility;
  [(CEKWheelScrubberViewAccessibility *)&v25 accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  id v11 = __UIAccessibilityCastAsClass();
  v12 = [(CEKWheelScrubberViewAccessibility *)self safeUIViewForKey:@"superview"];
  objc_msgSend(v11, "convertRect:toView:", v12, v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)accessibilityPath
{
  [(CEKWheelScrubberViewAccessibility *)self accessibilityFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_opt_class();
  id v11 = __UIAccessibilityCastAsClass();
  v12 = [(CEKWheelScrubberViewAccessibility *)self safeUIViewForKey:@"superview"];
  objc_msgSend(v11, "convertRect:fromView:", v12, v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRect:", v14, v16, v18, v20);

  return v21;
}

@end