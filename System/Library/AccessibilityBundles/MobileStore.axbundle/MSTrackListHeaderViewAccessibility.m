@interface MSTrackListHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityChildren;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
@end

@implementation MSTrackListHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTrackListHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  v3 = [(MSTrackListHeaderViewAccessibility *)self safeValueForKey:@"_albumLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(MSTrackListHeaderViewAccessibility *)self safeValueForKey:@"_artistLabel"];
  v6 = [v5 accessibilityLabel];

  v7 = [(MSTrackListHeaderViewAccessibility *)self safeValueForKey:@"_releaseDateLabel"];
  v8 = [v7 accessibilityLabel];

  v9 = [MEMORY[0x263F089D8] string];
  if ([v6 length]) {
    [v9 appendFormat:@"%@, ", v6];
  }
  if ([v4 length]) {
    [v9 appendFormat:@"%@, ", v4];
  }
  if ([v8 length]) {
    [v9 appendFormat:@"%@, ", v8];
  }

  return v9;
}

- (id)accessibilityLanguage
{
  return (id)[(id)*MEMORY[0x263F1D020] safeValueForKey:@"_accessibilityContentLanguage"];
}

- (id)_accessibilityChildren
{
  v3 = (void *)MEMORY[0x263F81490];
  v4 = [(MSTrackListHeaderViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v6 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
    [(MSTrackListHeaderViewAccessibility *)self _accessibilitySetRetainedValue:v6 forKey:*v3];
    v7 = (void *)[objc_allocWithZone((Class)MSTrackAccessibilityElement) initWithAccessibilityContainer:self];
    v8 = [(MSTrackListHeaderViewAccessibility *)self accessibilityLabel];
    [v7 setAccessibilityLabel:v8];

    v9 = [(MSTrackListHeaderViewAccessibility *)self accessibilityLanguage];
    [v7 setAccessibilityLanguage:v9];

    [(MSTrackListHeaderViewAccessibility *)self accessibilityFrame];
    objc_msgSend(v7, "setAccessibilityFrame:");
    [v6 addObject:v7];
    v10 = [(MSTrackListHeaderViewAccessibility *)self safeValueForKey:@"_offerButton"];
    if (v10) {
      [v6 addObject:v10];
    }
    id v5 = v6;
  }

  return v5;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (objc_msgSend(a4, "_gsEvent", a3.x, a3.y))
  {
    GSEventGetLocationInWindow();
    CGFloat v6 = v5;
    CGFloat v8 = v7;
  }
  else
  {
    CGFloat v8 = 0.0;
    CGFloat v6 = 0.0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = [(MSTrackListHeaderViewAccessibility *)self _accessibilityChildren];
  v10 = [v9 reverseObjectEnumerator];
  v11 = [v10 allObjects];

  id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v15 accessibilityFrame];
        v24.x = v6;
        v24.y = v8;
        if (CGRectContainsPoint(v25, v24))
        {
          id v12 = v15;
          goto LABEL_14;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v12;
}

- (int64_t)accessibilityElementCount
{
  v2 = [(MSTrackListHeaderViewAccessibility *)self _accessibilityChildren];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  v4 = [(MSTrackListHeaderViewAccessibility *)self _accessibilityChildren];
  double v5 = [v4 objectAtIndex:a3];

  return v5;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  id v4 = a3;
  double v5 = [(MSTrackListHeaderViewAccessibility *)self _accessibilityChildren];
  int64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

@end