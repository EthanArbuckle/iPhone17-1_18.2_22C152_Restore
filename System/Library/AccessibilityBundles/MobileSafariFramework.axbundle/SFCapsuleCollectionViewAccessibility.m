@interface SFCapsuleCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5;
@end

@implementation SFCapsuleCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFCapsuleCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_shouldToggleMinimizedWithTranslation:(double)a3 velocity:(double)a4 gestureEnded:(BOOL)a5
{
  BOOL v5 = a5;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning()) {
    return 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)SFCapsuleCollectionViewAccessibility;
  return [(SFCapsuleCollectionViewAccessibility *)&v10 _shouldToggleMinimizedWithTranslation:v5 velocity:a3 gestureEnded:a4];
}

@end