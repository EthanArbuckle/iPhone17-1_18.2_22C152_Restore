@interface PXCuratedLibraryOverlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (id)_axUserDataConfiguration;
- (id)accessibilityLabel;
- (id)focusGroupIdentifier;
- (unint64_t)accessibilityTraits;
@end

@implementation PXCuratedLibraryOverlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXCuratedLibraryOverlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButton", @"userData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButton", @"canBecomeFocused", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButtonConfiguration", @"actionPerformer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButtonConfiguration", @"actionHandler", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButtonConfiguration", @"menuActionHandler", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButtonConfiguration", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryOverlayButtonConfiguration", @"systemImageName", "@", 0);
  [v3 validateClass:@"PXCuratedLibraryOverlayButton" isKindOfClass:@"UIControl"];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(PXCuratedLibraryOverlayButtonAccessibility *)self safeValueForKey:@"userData"];
  v4 = [v3 safeValueForKey:@"actionPerformer"];
  uint64_t v5 = [v4 safeIntegerForKey:@"actionZoomLevel"];

  if (v5 == 2)
  {
    v6 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
    v7 = [v6 safeStringForKey:@"systemImageName"];

    LOBYTE(v6) = [v7 hasPrefix:@"sidebar"];
    return (char)v6;
  }
  else
  {
    objc_opt_class();
    v9 = __UIAccessibilityCastAsClass();
    char v10 = [v9 _accessibilityViewIsVisible];

    return v10;
  }
}

- (id)_axUserDataConfiguration
{
  return (id)[(PXCuratedLibraryOverlayButtonAccessibility *)self safeValueForKey:@"userData"];
}

- (unint64_t)accessibilityTraits
{
  v14.receiver = self;
  v14.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
  unint64_t v3 = *MEMORY[0x263F1CEE8] | [(PXCuratedLibraryOverlayButtonAccessibility *)&v14 accessibilityTraits];
  v4 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
  uint64_t v5 = [v4 safeValueForKey:@"actionPerformer"];
  if (v5)
  {
  }
  else
  {
    v6 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
    v7 = [v6 safeValueForKey:@"actionHandler"];
    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      v9 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
      char v10 = [v9 safeValueForKey:@"menuActionHandler"];
      BOOL v8 = v10 != 0;
    }
    if (!v8) {
      v3 |= *MEMORY[0x263F1CF20];
    }
  }
  v11 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
  v12 = [v11 safeStringForKey:@"systemImageName"];

  if ([v12 isEqualToString:@"PXCuratedLibraryFilterIndicatorInactiveIconImageName"])
  {
    v3 &= ~*MEMORY[0x263F1CF38];
  }
  else if ([v12 isEqualToString:@"PXCuratedLibraryFilterIndicatorActiveIconImageName"])
  {
    v3 |= *MEMORY[0x263F1CF38];
  }

  return v3;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
  v4 = [v3 safeStringForKey:@"title"];

  if (v4)
  {
    id v5 = v4;
LABEL_3:
    v6 = v5;
    goto LABEL_26;
  }
  v7 = [(PXCuratedLibraryOverlayButtonAccessibility *)self _axUserDataConfiguration];
  BOOL v8 = [v7 safeStringForKey:@"systemImageName"];

  if ([v8 isEqualToString:@"plus.slash.minus"])
  {
    v9 = @"curated.zoom";
  }
  else if ([v8 isEqualToString:@"plus"])
  {
    v9 = @"curated.zoom.in";
  }
  else if ([v8 isEqualToString:@"minus"])
  {
    v9 = @"curated.zoom.out";
  }
  else if ([v8 isEqualToString:@"xmark"])
  {
    v9 = @"curated.close";
  }
  else if ([v8 isEqualToString:@"person.crop.circle.badge.checkmark"])
  {
    v9 = @"curated.manage.subscribers";
  }
  else if ([v8 isEqualToString:@"person.crop.circle.badge.plus"])
  {
    v9 = @"curated.add.subscribers";
  }
  else if ([v8 isEqualToString:@"PXCuratedLibraryEllipsisIconImageName"])
  {
    v9 = @"curated.more";
  }
  else if (([v8 isEqualToString:@"PXCuratedLibraryFilterIndicatorInactiveIconImageName"] & 1) != 0 {
         || ([v8 isEqualToString:@"PXCuratedLibraryFilterIndicatorActiveIconImageName"] & 1) != 0)
  }
  {
    v9 = @"curated.filter";
  }
  else if (([v8 isEqualToString:@"sidebar.left"] & 1) != 0 {
         || ([v8 isEqualToString:@"sidebar.right"] & 1) != 0
  }
         || ([v8 isEqualToString:@"sidebar.leading"] & 1) != 0)
  {
    v9 = @"curated.show.sidebar";
  }
  else if ([v8 isEqualToString:@"rectangle.arrowtriangle.2.inward"])
  {
    v9 = @"curated.aspect";
  }
  else if ([v8 isEqualToString:@"rectangle.arrowtriangle.2.outward"])
  {
    v9 = @"curated.square";
  }
  else if ([v8 isEqualToString:@"person.fill"])
  {
    v9 = @"personal.library";
  }
  else if ([v8 isEqualToString:@"person.2.fill"])
  {
    v9 = @"shared.library";
  }
  else if ([v8 isEqualToString:@"speaker.wave.2"])
  {
    v9 = @"photo.volume.button";
  }
  else
  {
    if (![v8 isEqualToString:@"speaker.slash"])
    {

      v11.receiver = self;
      v11.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
      id v5 = [(PXCuratedLibraryOverlayButtonAccessibility *)&v11 accessibilityLabel];
      goto LABEL_3;
    }
    v9 = @"photo.volume.muted.button";
  }
  v6 = accessibilityPhotosUICoreLocalizedString(v9);

LABEL_26:

  return v6;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  return [a3 isEqual:*MEMORY[0x263F1D180]];
}

- (BOOL)canBecomeFocused
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryOverlayButtonAccessibility;
  unsigned __int8 v3 = [(PXCuratedLibraryOverlayButtonAccessibility *)&v5 canBecomeFocused];
  return [(PXCuratedLibraryOverlayButtonAccessibility *)self _accessibilityIsFKARunningForFocusItem] | v3;
}

- (id)focusGroupIdentifier
{
  return @"PXCuratedLibraryOverlayButtonAXGroup";
}

@end