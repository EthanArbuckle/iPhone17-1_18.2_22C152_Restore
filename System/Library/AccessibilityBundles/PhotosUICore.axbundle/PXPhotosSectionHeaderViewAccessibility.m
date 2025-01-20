@interface PXPhotosSectionHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axUpdateActionLabel;
- (void)_axUpdateDateLabel;
- (void)_axUpdateLocationLabel;
- (void)_updateActionButton;
- (void)_updateDateLabel;
- (void)_updateLocationsLabelVisibility;
- (void)_updateTitleLabel;
@end

@implementation PXPhotosSectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPhotosSectionHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  [(PXPhotosSectionHeaderViewAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateActionLabel];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateDateLabel];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateLocationLabel];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  return *MEMORY[0x263F1CEF8] | [(PXPhotosSectionHeaderViewAccessibility *)&v3 accessibilityTraits];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_super v3 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
  v6 = [v5 accessibilityLabel];
  v7 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
  v10 = [v7 accessibilityLabel];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)_accessibilitySupplementaryFooterViews
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
  if (v2
    && (__UIAccessibilitySafeClass(),
        objc_super v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 isHidden],
        v3,
        (v4 & 1) == 0))
  {
    v7[0] = v2;
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)automationElements
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  char v4 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  v5 = __UIAccessibilitySafeClass();
  char v6 = [v5 isHidden];

  if ((v6 & 1) == 0) {
    [v3 axSafelyAddObject:v4];
  }
  if (AXDeviceIsPad())
  {
    uint64_t v7 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
    v8 = __UIAccessibilitySafeClass();

    LOBYTE(v7) = [v8 isHidden];
    if ((v7 & 1) == 0)
    {
      v9 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
      [v3 axSafelyAddObject:v9];
    }
    uint64_t v10 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
    v11 = __UIAccessibilitySafeClass();

    LOBYTE(v10) = [v11 isHidden];
    if ((v10 & 1) == 0)
    {
      v12 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
      [v3 axSafelyAddObject:v12];
    }
    uint64_t v13 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
    v14 = __UIAccessibilitySafeClass();

    LOBYTE(v13) = [v14 isHidden];
    if ((v13 & 1) == 0)
    {
      v15 = @"_actionButton";
LABEL_16:
      v24 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:v15];
      [v3 axSafelyAddObject:v24];
    }
  }
  else
  {
    uint64_t v16 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
    v17 = __UIAccessibilitySafeClass();

    LOBYTE(v16) = [v17 isHidden];
    if ((v16 & 1) == 0)
    {
      v18 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
      [v3 axSafelyAddObject:v18];
    }
    uint64_t v19 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
    v20 = __UIAccessibilitySafeClass();

    LOBYTE(v19) = [v20 isHidden];
    if ((v19 & 1) == 0)
    {
      v21 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
      [v3 axSafelyAddObject:v21];
    }
    uint64_t v22 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
    v23 = __UIAccessibilitySafeClass();

    LOBYTE(v22) = [v23 isHidden];
    if ((v22 & 1) == 0)
    {
      v15 = @"_dateLabel";
      goto LABEL_16;
    }
  }

  return v3;
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:*MEMORY[0x263F1D1A0]] & 1) == 0
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v3, (UIContentSizeCategory)*MEMORY[0x263F1D148]) != NSOrderedDescending;

  return v4;
}

- (void)_updateTitleLabel
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  [(PXPhotosSectionHeaderViewAccessibility *)&v3 _updateTitleLabel];
  [(PXPhotosSectionHeaderViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_updateDateLabel
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  [(PXPhotosSectionHeaderViewAccessibility *)&v3 _updateDateLabel];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateDateLabel];
}

- (void)_updateLocationsLabelVisibility
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  [(PXPhotosSectionHeaderViewAccessibility *)&v3 _updateLocationsLabelVisibility];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateLocationLabel];
}

- (void)_updateActionButton
{
  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionHeaderViewAccessibility;
  [(PXPhotosSectionHeaderViewAccessibility *)&v3 _updateActionButton];
  [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateActionLabel];
}

- (void)_axUpdateActionLabel
{
  id v4 = [(PXPhotosSectionHeaderViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_actionButtonTitle, _dateLabel, _titleLabel"];
  objc_super v3 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_actionButton"];
  [v3 setAccessibilityLabel:v4];
}

- (void)_axUpdateDateLabel
{
  if (!UIAccessibilityIsVoiceOverRunning()) {
    return;
  }
  id v20 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_sectionStartDate"];
  objc_super v3 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_sectionEndDate"];
  if (v20 && v3)
  {
    id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
    v5 = [v4 components:28 fromDate:v20];

    char v6 = [MEMORY[0x263EFF8F0] currentCalendar];
    uint64_t v7 = [v6 components:28 fromDate:v3];

    uint64_t v8 = [v5 year];
    if (v8 == [v7 year]
      && (uint64_t v9 = [v5 month], v9 == objc_msgSend(v7, "month"))
      && (uint64_t v10 = [v5 day], v10 == objc_msgSend(v7, "day")))
    {
      uint64_t v11 = [v5 hour];
      if (v11 != [v7 hour] || (uint64_t v12 = objc_msgSend(v5, "minute"), v12 != objc_msgSend(v7, "minute")))
      {
        uint64_t v19 = NSString;
        v14 = accessibilityPhotosUICoreLocalizedString(@"photos.taken.date");
        v15 = AXDateStringForFormat();
        v17 = objc_msgSend(v19, "stringWithFormat:", v14, v15);
        goto LABEL_13;
      }
      uint64_t v13 = NSString;
      v14 = accessibilityPhotosUICoreLocalizedString(@"photos.taken.date.time");
      v15 = AXDateStringForFormat();
    }
    else
    {
      uint64_t v13 = NSString;
      v14 = accessibilityPhotosUICoreLocalizedString(@"photos.taken.range");
      v15 = AXDateStringForFormat();
    }
    uint64_t v16 = AXDateStringForFormat();
    v17 = objc_msgSend(v13, "stringWithFormat:", v14, v15, v16);

LABEL_13:
    v18 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_dateLabel"];
    [v18 setAccessibilityLabel:v17];

    [(PXPhotosSectionHeaderViewAccessibility *)self _axUpdateActionLabel];
  }
}

- (void)_axUpdateLocationLabel
{
  objc_super v3 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  id v5 = [(PXPhotosSectionHeaderViewAccessibility *)self safeValueForKey:@"_locationsLabel"];
  id v4 = accessibilityPhotosUICoreLocalizedString(@"locations.label.button.hint");
  [v5 setAccessibilityHint:v4];
}

@end