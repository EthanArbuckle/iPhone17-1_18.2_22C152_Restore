@interface PLExpandableImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityElementStoredUserLabel;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_axExifLabel;
- (id)_axMainAssetURL;
- (id)_axSourceObject;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation PLExpandableImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLExpandableImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axMainAssetURL
{
  v3 = [(PLExpandableImageViewAccessibility *)self safeValueForKey:@"_photo"];
  v4 = v3;
  if (v3) {
    [v3 safeValueForKey:@"mainFileURL"];
  }
  else {
  v5 = [(PLExpandableImageViewAccessibility *)self _accessibilityValueForKey:@"AXAssetURL"];
  }

  return v5;
}

- (id)_axExifLabel
{
  v2 = [(PLExpandableImageViewAccessibility *)self _axMainAssetURL];
  v3 = UIAccessibilityMetadataDescriptionForImage();

  return v3;
}

- (id)_accessibilityElementStoredUserLabel
{
  v2 = [(PLExpandableImageViewAccessibility *)self _axExifLabel];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }
  else {
    v4 = &stru_26F41F300;
  }

  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGPoint v38 = a3;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(PLExpandableImageViewAccessibility *)self _accessibilityValueForKey:@"AXAccessibilityFrame"];
  [v6 rectValue];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  [(PLExpandableImageViewAccessibility *)self accessibilityFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v48.origin.double x = v8;
  v48.origin.double y = v10;
  v48.size.width = v12;
  v48.size.height = v14;
  v50.origin.double x = v16;
  v50.origin.double y = v18;
  v50.size.width = v20;
  v50.size.height = v22;
  if (!CGRectEqualToRect(v48, v50))
  {
    v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRect:", v16, v18, v20, v22);
    [(PLExpandableImageViewAccessibility *)self _accessibilitySetRetainedValue:v23 forKey:@"AXAccessibilityFrame"];
  }
  double x = v38.x;
  double y = v38.y;
  UIAccessibilityPointForPoint();
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  [(PLExpandableImageViewAccessibility *)self _accessibilityValueForKey:@"_faceElements"];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v30 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v41 != v33) {
          objc_enumerationMutation(v30);
        }
        v35 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v35, "accessibilityFrame", *(void *)&v38.x, *(void *)&v38.y);
        v47.double x = v27;
        v47.double y = v29;
        if (CGRectContainsPoint(v49, v47))
        {
          id v36 = v35;

          goto LABEL_13;
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  v39.receiver = self;
  v39.super_class = (Class)PLExpandableImageViewAccessibility;
  -[PLExpandableImageViewAccessibility _accessibilityHitTest:withEvent:](&v39, sel__accessibilityHitTest_withEvent_, v5, x, y);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v36;
}

- (id)_axSourceObject
{
  v3 = [(PLExpandableImageViewAccessibility *)self safeValueForKey:@"_photo"];
  v4 = [v3 accessibilityLabel];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
    uint64_t v6 = [(PLExpandableImageViewAccessibility *)self safeValueForKey:@"_imageView"];

    v3 = (void *)v6;
  }

  return v3;
}

- (BOOL)_accessibilityScrollToVisible
{
  return 1;
}

- (id)accessibilityValue
{
  v2 = [(PLExpandableImageViewAccessibility *)self _axSourceObject];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (id)accessibilityLabel
{
  v2 = [(PLExpandableImageViewAccessibility *)self _axSourceObject];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(PLExpandableImageViewAccessibility *)self _axSourceObject];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end