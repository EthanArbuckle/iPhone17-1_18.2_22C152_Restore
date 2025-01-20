@interface MPUNowPlayingIndicatorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
@end

@implementation MPUNowPlayingIndicatorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPUNowPlayingIndicatorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setPlaybackState:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPUNowPlayingIndicatorViewAccessibility;
  -[MPUNowPlayingIndicatorViewAccessibility setPlaybackState:](&v6, sel_setPlaybackState_);
  if ((unint64_t)a3 <= 2)
  {
    v5 = accessibilityMPUILocalizedString(off_2650A33E8[a3]);
    [(MPUNowPlayingIndicatorViewAccessibility *)self setAccessibilityValue:v5];
  }
}

@end