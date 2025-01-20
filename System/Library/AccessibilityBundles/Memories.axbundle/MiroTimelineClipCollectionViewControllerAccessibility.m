@interface MiroTimelineClipCollectionViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axMiroPhotoScrubber;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setAXMiroPhotoScrubber:(id)a3;
- (void)viewDidLoad;
@end

@implementation MiroTimelineClipCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroTimelineClipCollectionViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMiroPhotoScrubber
{
}

- (void)_setAXMiroPhotoScrubber:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MiroEditorFlowLayout"];
  [v3 validateClass:@"MiroTimelineClipCollectionViewController" isKindOfClass:@"UICollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroEditorFlowLayout", @"snappedIndexPath", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroTimelineClipCollectionViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroTimelineClipCollectionViewController", @"collectionView: didSelectItemAtIndexPath:", "v", "@", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9[1] = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)MiroTimelineClipCollectionViewControllerAccessibility;
  [(MiroTimelineClipCollectionViewControllerAccessibility *)&v8 _accessibilityLoadAccessibilityInformation];
  id v3 = [(MiroTimelineClipCollectionViewControllerAccessibility *)self _axMiroPhotoScrubber];

  if (!v3)
  {
    v4 = [[AXMiroPhotoScrubber alloc] initWithAccessibilityContainer:self];
    [(MiroTimelineClipCollectionViewControllerAccessibility *)self _setAXMiroPhotoScrubber:v4];
    objc_opt_class();
    v5 = [(MiroTimelineClipCollectionViewControllerAccessibility *)self safeValueForKey:@"view"];
    v6 = __UIAccessibilityCastAsClass();

    v9[0] = v4;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
    [v6 setAccessibilityElements:v7];
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MiroTimelineClipCollectionViewControllerAccessibility;
  [(MiroTimelineClipCollectionViewControllerAccessibility *)&v3 viewDidLoad];
  [(MiroTimelineClipCollectionViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end