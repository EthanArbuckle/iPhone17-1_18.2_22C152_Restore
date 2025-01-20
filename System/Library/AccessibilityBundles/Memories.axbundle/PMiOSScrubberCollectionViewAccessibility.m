@interface PMiOSScrubberCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PMiOSScrubberCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMiOSScrubberCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSScrubberCollectionView", @"collectionViewDelegate", "@", 0);
  [v3 validateClass:@"PMiOSScrubberViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMiOSScrubberViewController", @"provider", "@", 0);
  [v3 validateClass:@"PMScrubberProvider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMScrubberProvider", @"currentDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMScrubberProvider", @"currentProgress", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PMScrubberProvider", @"isPlayingCurrent", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityMemoriesLocalizedString(@"scrubber.description");
}

- (id)accessibilityValue
{
  id v3 = [(PMiOSScrubberCollectionViewAccessibility *)self safeValueForKey:@"collectionViewDelegate"];
  MEMORY[0x2455E2920](@"PMiOSScrubberViewController");
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 safeValueForKey:@"provider"];
    MEMORY[0x2455E2920](@"PMScrubberProvider");
    if (objc_opt_isKindOfClass())
    {
      [v4 safeTimeIntervalForKey:@"currentDuration"];
      v5 = AXDurationStringForDuration();
      [v4 safeCGFloatForKey:@"currentProgress"];
      v6 = AXDurationStringForDuration();
      if ([v4 safeBoolForKey:@"isPlayingCurrent"]) {
        v7 = @"scrubber.playing";
      }
      else {
        v7 = @"scrubber.paused";
      }
      v8 = accessibilityMemoriesLocalizedString(v7);
      v9 = NSString;
      v10 = accessibilityMemoriesLocalizedString(@"scrubber.value");
      v13 = objc_msgSend(v9, "stringWithFormat:", v10, v6, v5);
      v11 = __UIAXStringForVariables();

      goto LABEL_9;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PMiOSScrubberCollectionViewAccessibility;
  v11 = [(PMiOSScrubberCollectionViewAccessibility *)&v14 accessibilityValue];
LABEL_9:

  return v11;
}

@end