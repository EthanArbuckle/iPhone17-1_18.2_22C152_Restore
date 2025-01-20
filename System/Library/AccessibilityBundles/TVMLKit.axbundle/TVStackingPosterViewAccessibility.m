@interface TVStackingPosterViewAccessibility
@end

@implementation TVStackingPosterViewAccessibility

BOOL __76___TVStackingPosterViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  BOOL v3 = ((objc_opt_isKindOfClass() & 1) != 0
     || (NSClassFromString(&cfstr_Tvprogressview_0.isa), (objc_opt_isKindOfClass() & 1) != 0))
    && ([v2 isAccessibilityElement] & 1) != 0;

  return v3;
}

Class __76___TVStackingPosterViewAccessibility__accessibilityShouldReverseComponents___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Tvlabel_0.isa);
  _accessibilityShouldReverseComponents___TVLabelClass = (uint64_t)result;
  return result;
}

uint64_t __76___TVStackingPosterViewAccessibility__accessibilityShouldReverseComponents___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __65___TVStackingPosterViewAccessibility__accessibilityFrameDelegate__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
  v1 = (void *)_accessibilityFrameDelegate_FrameDelegateClasses;
  _accessibilityFrameDelegate_FrameDelegateClasses = v0;

  [(id)_accessibilityFrameDelegate_FrameDelegateClasses axSafelyAddObject:NSClassFromString(&cfstr_Tvimageview.isa)];
  id v2 = (void *)_accessibilityFrameDelegate_FrameDelegateClasses;
  Class v3 = NSClassFromString(&cfstr_Tvmonogramview_0.isa);

  return [v2 axSafelyAddObject:v3];
}

@end