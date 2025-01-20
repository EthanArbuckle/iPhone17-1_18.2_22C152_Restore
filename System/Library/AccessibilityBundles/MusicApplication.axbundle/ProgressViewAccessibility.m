@interface ProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation ProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.ProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityValue
{
  [(ProgressViewAccessibility *)self safeCGFloatForKey:@"progress"];
  v2 = NSString;
  v3 = accessibilityMusicLocalizedString(@"playback.percentage");
  v4 = AXFormatFloatWithPercentage();
  v5 = objc_msgSend(v2, "stringWithFormat:", v3, v4);

  return v5;
}

@end