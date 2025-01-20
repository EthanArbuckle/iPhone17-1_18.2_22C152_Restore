@interface NSObject(BEAccessibility)
- (id)_browserAccessibilityStoredValueContainerType;
- (id)_browserAccessibilityStoredValueHasDOMFocus;
- (id)_browserAccessibilityStoredValueIsRequired;
- (id)_browserAccessibilityStoredValuePressedState;
- (id)_browserAccessibilityStoredValueSelectedTextRange;
- (id)_browserAccessibilityStoredValueSortDirection;
- (id)browserAccessibilityCurrentStatus;
- (id)browserAccessibilityRoleDescription;
- (id)browserAccessibilitySortDirection;
- (uint64_t)accessibilityLineEndPositionFromCurrentSelection;
- (uint64_t)accessibilityLineRangeForPosition:()BEAccessibility;
- (uint64_t)accessibilityLineStartPositionFromCurrentSelection;
- (uint64_t)browserAccessibilityAttributedValueInRange:()BEAccessibility;
- (uint64_t)browserAccessibilityContainerType;
- (uint64_t)browserAccessibilityHasDOMFocus;
- (uint64_t)browserAccessibilityIsRequired;
- (uint64_t)browserAccessibilityPressedState;
- (uint64_t)browserAccessibilitySelectedTextRange;
- (uint64_t)browserAccessibilityValueInRange:()BEAccessibility;
- (void)browserAccessibilitySetSelectedTextRange:()BEAccessibility;
- (void)setBrowserAccessibilityContainerType:()BEAccessibility;
- (void)setBrowserAccessibilityCurrentStatus:()BEAccessibility;
- (void)setBrowserAccessibilityHasDOMFocus:()BEAccessibility;
- (void)setBrowserAccessibilityIsRequired:()BEAccessibility;
- (void)setBrowserAccessibilityPressedState:()BEAccessibility;
- (void)setBrowserAccessibilityRoleDescription:()BEAccessibility;
- (void)setBrowserAccessibilitySortDirection:()BEAccessibility;
@end

@implementation NSObject(BEAccessibility)

- (id)browserAccessibilityCurrentStatus
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityCurrentStatus);
}

- (void)setBrowserAccessibilityCurrentStatus:()BEAccessibility
{
}

- (id)browserAccessibilitySortDirection
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySortDirection);
}

- (void)setBrowserAccessibilitySortDirection:()BEAccessibility
{
}

- (id)_browserAccessibilityStoredValueSortDirection
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySortDirection);
}

- (id)browserAccessibilityRoleDescription
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityRoleDescription);
}

- (void)setBrowserAccessibilityRoleDescription:()BEAccessibility
{
}

- (uint64_t)browserAccessibilityIsRequired
{
  v1 = objc_getAssociatedObject(a1, &BrowserAccessibilityIsRequired);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setBrowserAccessibilityIsRequired:()BEAccessibility
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityIsRequired, v2, (void *)1);
}

- (id)_browserAccessibilityStoredValueIsRequired
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityIsRequired);
}

- (uint64_t)browserAccessibilityHasDOMFocus
{
  v1 = objc_getAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)setBrowserAccessibilityHasDOMFocus:()BEAccessibility
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus, v2, (void *)1);
}

- (id)_browserAccessibilityStoredValueHasDOMFocus
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityHasDOMFocus);
}

- (uint64_t)browserAccessibilityPressedState
{
  v1 = objc_getAssociatedObject(a1, &BrowserAccessibilityPressedState);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (void)setBrowserAccessibilityPressedState:()BEAccessibility
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityPressedState, v2, (void *)1);
}

- (id)_browserAccessibilityStoredValuePressedState
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityPressedState);
}

- (uint64_t)browserAccessibilityContainerType
{
  v1 = objc_getAssociatedObject(a1, &BrowserAccessibilityContainerType);
  uint64_t v2 = [v1 unsignedIntegerValue];

  return v2;
}

- (void)setBrowserAccessibilityContainerType:()BEAccessibility
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilityContainerType, v2, (void *)1);
}

- (id)_browserAccessibilityStoredValueContainerType
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilityContainerType);
}

- (uint64_t)browserAccessibilitySelectedTextRange
{
  v1 = objc_getAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange);
  uint64_t v2 = [v1 rangeValue];

  return v2;
}

- (void)browserAccessibilitySetSelectedTextRange:()BEAccessibility
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange, v2, (void *)1);
}

- (id)_browserAccessibilityStoredValueSelectedTextRange
{
  return objc_getAssociatedObject(a1, &BrowserAccessibilitySelectedTextRange);
}

- (uint64_t)browserAccessibilityValueInRange:()BEAccessibility
{
  return 0;
}

- (uint64_t)browserAccessibilityAttributedValueInRange:()BEAccessibility
{
  return 0;
}

- (uint64_t)accessibilityLineRangeForPosition:()BEAccessibility
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)accessibilityLineEndPositionFromCurrentSelection
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)accessibilityLineStartPositionFromCurrentSelection
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end