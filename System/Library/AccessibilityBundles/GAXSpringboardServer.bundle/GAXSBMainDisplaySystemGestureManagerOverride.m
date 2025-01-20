@interface GAXSBMainDisplaySystemGestureManagerOverride
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_gaxIgnoresGuidedAccessSystemGestureDisabling;
- (BOOL)_gaxInternalIgnoresGuidedAccessSystemGestureDisabling;
- (void)_gaxDeviceWasLocked:(id)a3;
- (void)_gaxDeviceWasUnlocked:(id)a3;
- (void)_gaxInitializeOverride;
- (void)_gaxInternalSetIgnoresGuidedAccessSystemGestureDisabling:(BOOL)a3;
- (void)_gaxSetIgnoresGuidedAccessSystemGestureDisabling:(BOOL)a3;
- (void)dealloc;
- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3;
@end

@implementation GAXSBMainDisplaySystemGestureManagerOverride

+ (id)safeCategoryTargetClassName
{
  return @"SBMainDisplaySystemGestureManager";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_gaxInternalIgnoresGuidedAccessSystemGestureDisabling
{
  return ___UIAccessibilityGetAssociatedBool(self, &unk_37A89);
}

- (void)_gaxInternalSetIgnoresGuidedAccessSystemGestureDisabling:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_gaxSetIgnoresGuidedAccessSystemGestureDisabling:(BOOL)a3
{
}

- (BOOL)_gaxIgnoresGuidedAccessSystemGestureDisabling
{
  return [(GAXSBMainDisplaySystemGestureManagerOverride *)self _gaxInternalIgnoresGuidedAccessSystemGestureDisabling];
}

- (void)setSystemGesturesDisabledForAccessibility:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)GAXSBMainDisplaySystemGestureManagerOverride;
  [(GAXSBMainDisplaySystemGestureManagerOverride *)&v3 setSystemGesturesDisabledForAccessibility:a3];
}

- (void)_gaxDeviceWasLocked:(id)a3
{
}

- (void)_gaxDeviceWasUnlocked:(id)a3
{
  v4 = +[GAXSpringboard sharedInstance];
  unsigned int v5 = [v4 isActive];

  if (v5)
  {
    [(GAXSBMainDisplaySystemGestureManagerOverride *)self setSystemGesturesDisabledForAccessibility:1];
  }
}

- (void)_gaxInitializeOverride
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_gaxDeviceWasLocked:" name:@"GAXDeviceWasLockedOrRelockedNotification" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_gaxDeviceWasUnlocked:" name:@"GAXDeviceWasUnlockedNotification" object:0];
}

- (void)dealloc
{
  objc_super v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"GAXDeviceWasUnlockedNotification" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"GAXDeviceWasLockedOrRelockedNotification" object:0];

  v5.receiver = self;
  v5.super_class = (Class)GAXSBMainDisplaySystemGestureManagerOverride;
  [(GAXSBMainDisplaySystemGestureManagerOverride *)&v5 dealloc];
}

@end