@interface ParallaxViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation ParallaxViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ParallaxView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  if (accessibilityElements_onceToken != -1) {
    dispatch_once(&accessibilityElements_onceToken, &__block_literal_global_2);
  }

  return (id)[(ParallaxViewAccessibility *)self _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_277];
}

uint64_t __50__ParallaxViewAccessibility_accessibilityElements__block_invoke()
{
  uint64_t result = MEMORY[0x2456584B0](@"MusicApplication.DetailHeader");
  accessibilityElements_detailHeader = result;
  return result;
}

uint64_t __50__ParallaxViewAccessibility_accessibilityElements__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    *a3 = 1;
  }
  return isKindOfClass & 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end