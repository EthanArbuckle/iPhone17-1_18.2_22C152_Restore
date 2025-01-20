@interface NTKFaceEditPageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityOverridesInvalidFrames;
- (id)accessibilityElements;
- (void)_axClearCachedElements;
- (void)addKeyline:(id)a3 forKey:(id)a4 tappable:(BOOL)a5;
- (void)layoutSubviews;
- (void)removeAllKeylines;
@end

@implementation NTKFaceEditPageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKFaceEditPageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKFaceEditPageView" hasInstanceVariable:@"_addColorsView" withType:"_NTKAddColorsView"];
  [v3 validateClass:@"NTKFaceEditPageView" hasInstanceVariable:@"_keylineContainers" withType:"NSMutableDictionary"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceEditPageView", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceEditPageView", @"addKeyline:forKey:tappable:", "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKFaceEditPageView", @"removeAllKeylines", "v", 0);
}

- (BOOL)_accessibilityOverridesInvalidFrames
{
  return 1;
}

- (id)accessibilityElements
{
  id v3 = [(NTKFaceEditPageViewAccessibility *)self safeUIViewForKey:@"_addColorsView"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v11 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v11 count:1];
  }
  else
  {
    v5 = [(NTKFaceEditPageViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];

    if (!v5)
    {
      v6 = [(NTKFaceEditPageViewAccessibility *)self safeDictionaryForKey:@"_keylineContainers"];
      if ([v6 count])
      {
        v7 = [v6 allValues];
        v8 = [v7 sortedArrayUsingSelector:"accessibilityCompareGeometry:"];

        [(NTKFaceEditPageViewAccessibility *)self _accessibilitySetRetainedValue:v8 forKey:kUIAccessibilityStorageKeyChildren];
      }
    }
    uint64_t v4 = [(NTKFaceEditPageViewAccessibility *)self _accessibilityValueForKey:kUIAccessibilityStorageKeyChildren];
  }
  v9 = (void *)v4;

  return v9;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceEditPageViewAccessibility;
  [(NTKFaceEditPageViewAccessibility *)&v3 layoutSubviews];
  [(NTKFaceEditPageViewAccessibility *)self _axClearCachedElements];
}

- (void)addKeyline:(id)a3 forKey:(id)a4 tappable:(BOOL)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKFaceEditPageViewAccessibility;
  [(NTKFaceEditPageViewAccessibility *)&v6 addKeyline:a3 forKey:a4 tappable:a5];
  [(NTKFaceEditPageViewAccessibility *)self _axClearCachedElements];
}

- (void)removeAllKeylines
{
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceEditPageViewAccessibility;
  [(NTKFaceEditPageViewAccessibility *)&v3 removeAllKeylines];
  [(NTKFaceEditPageViewAccessibility *)self _axClearCachedElements];
}

- (void)_axClearCachedElements
{
}

@end