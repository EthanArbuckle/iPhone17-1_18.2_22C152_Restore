@interface MiroMovieViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation MiroMovieViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroMovieView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(@"memory.movie.description");
}

- (id)accessibilityValue
{
  char v11 = 0;
  objc_opt_class();
  v3 = [(MiroMovieViewAccessibility *)self safeValueForKey:@"player"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 rate];
  if (v5 <= 0.0)
  {
    v8 = 0;
  }
  else
  {
    v6 = [v4 currentItem];
    v7 = v6;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&v10, 0, sizeof(v10));
    }
    CMTimeGetSeconds(&v10);
    v8 = AXDurationStringForDuration();
  }

  return v8;
}

@end