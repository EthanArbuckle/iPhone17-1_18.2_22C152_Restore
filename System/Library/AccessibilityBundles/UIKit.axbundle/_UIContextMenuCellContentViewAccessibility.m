@interface _UIContextMenuCellContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityElementsHidden;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityStoredHintFromMenuElement;
- (id)_accessibilityStoredIdentifierFromMenuElement;
- (id)_accessibilityStoredLabelFromMenuElement;
- (id)_accessibilityStoredTraitsFromMenuElement;
- (id)_accessibilityStoredUserInputLabelsFromMenuElement;
- (id)_accessibilityStoredValueFromMenuElement;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (int64_t)_accessibilityExpandedStatus;
- (uint64_t)_accessibilitySetStoredElementsHidden:(uint64_t)result;
- (uint64_t)_accessibilityStoredElementsHidden;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetStoredHintFromMenuElement:(uint64_t)a1;
- (void)_accessibilitySetStoredIdentifierFromMenuElement:(uint64_t)a1;
- (void)_accessibilitySetStoredLabelFromMenuElement:(uint64_t)a1;
- (void)_accessibilitySetStoredTraitsFromMenuElement:(uint64_t)a1;
- (void)_accessibilitySetStoredUserInputLabelsFromMenuElement:(uint64_t)a1;
- (void)_accessibilitySetStoredValueFromMenuElement:(uint64_t)a1;
- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3;
@end

@implementation _UIContextMenuCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStoredLabelFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredLabelFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredLabelFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredValueFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredValueFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredValueFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredHintFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredHintFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredHintFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredIdentifierFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredIdentifierFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredIdentifierFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredTraitsFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredTraitsFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredTraitsFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredUserInputLabelsFromMenuElement
{
  if (a1) {
    id v2 = objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredUserInputLabelsFromMenuElement);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (void)_accessibilitySetStoredUserInputLabelsFromMenuElement:(uint64_t)a1
{
  uint64_t v3 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v3) {
    __UIAccessibilitySetAssociatedObject();
  }
  objc_storeStrong(&location, 0);
}

- (uint64_t)_accessibilityStoredElementsHidden
{
  if (a1) {
    char v2 = __UIAccessibilityGetAssociatedBool() & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)_accessibilitySetStoredElementsHidden:(uint64_t)result
{
  if (result) {
    return __UIAccessibilitySetAssociatedBool();
  }
  return result;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  id v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = @"_UIContextMenuCellContentView";
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"subtitleLabel", v5, 0);
  uint64_t v3 = "Q";
  [location[0] validateClass:v4 hasInstanceMethod:@"options" withFullSignature:0];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"_updateForOptionsChangeFromPreviousOptions:", "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, @"iconImageView", v5, 0);
  objc_storeStrong(v7, v6);
}

- (unint64_t)accessibilityTraits
{
  v8 = self;
  SEL v7 = a2;
  unint64_t v6 = 0;
  unint64_t v6 = *MEMORY[0x263F1CEE8];
  uint64_t v5 = [(_UIContextMenuCellContentViewAccessibility *)self safeUnsignedIntegerForKey:@"options"];
  if ((v5 & 4) == 4) {
    v6 |= *MEMORY[0x263F1CF38];
  }
  if ((v5 & 1) == 1) {
    v6 |= *MEMORY[0x263F1CF20];
  }
  id location = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredTraitsFromMenuElement](v8);
  if (location) {
    v6 |= [location unsignedLongLongValue];
  }
  unint64_t v3 = v6;
  objc_storeStrong(&location, 0);
  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  char v4 = [(_UIContextMenuCellContentViewAccessibility *)self safeUnsignedIntegerForKey:@"options", 0, a2, self];
  if ((v4 & 0x10) == 0) {
    return 0;
  }
  int64_t v2 = 2;
  if ((v4 & 0x40) != 0) {
    return 1;
  }
  return v2;
}

- (id)accessibilityLabel
{
  v10 = self;
  v9[1] = (id)a2;
  v9[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredLabelFromMenuElement](self);
  if ([v9[0] length])
  {
    id v11 = v9[0];
    int v8 = 1;
  }
  else
  {
    id v7 = (id)[(_UIContextMenuCellContentViewAccessibility *)v10 _accessibilityStringForLabelKeyValues:@"titleLabel, subtitleLabel"];
    if ([v7 length])
    {
      id v11 = v7;
      int v8 = 1;
    }
    else
    {
      id v4 = (id)[(_UIContextMenuCellContentViewAccessibility *)v10 safeValueForKey:@"iconImageView"];
      id location = (id)[v4 accessibilityLabel];

      if ([location length])
      {
        id v11 = location;
      }
      else
      {
        v5.receiver = v10;
        v5.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
        id v11 = [(_UIContextMenuCellContentViewAccessibility *)&v5 accessibilityLabel];
      }
      int v8 = 1;
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v9, 0);
  int64_t v2 = v11;

  return v2;
}

- (id)accessibilityValue
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredValueFromMenuElement](self);
  if ([location[0] length])
  {
    id v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    id v8 = [(_UIContextMenuCellContentViewAccessibility *)&v4 accessibilityValue];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  int64_t v2 = v8;

  return v2;
}

- (id)accessibilityHint
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredHintFromMenuElement](self);
  if ([location[0] length])
  {
    id v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    id v8 = [(_UIContextMenuCellContentViewAccessibility *)&v4 accessibilityHint];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  int64_t v2 = v8;

  return v2;
}

- (id)accessibilityIdentifier
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredIdentifierFromMenuElement](self);
  if ([location[0] length])
  {
    id v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    id v8 = [(_UIContextMenuCellContentViewAccessibility *)&v4 accessibilityIdentifier];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  int64_t v2 = v8;

  return v2;
}

- (id)accessibilityUserInputLabels
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredUserInputLabelsFromMenuElement](self);
  if ([location[0] count])
  {
    id v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    id v8 = [(_UIContextMenuCellContentViewAccessibility *)&v4 accessibilityUserInputLabels];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  int64_t v2 = v8;

  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  v9 = self;
  SEL v8 = a2;
  id v2 = (id)[(_UIContextMenuCellContentViewAccessibility *)self storedAccessibilityElementsHidden];
  BOOL v5 = v2 == 0;

  if (v5)
  {
    BOOL v7 = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredElementsHidden]((uint64_t)v9) & 1;
    if (v7)
    {
      return v7;
    }
    else
    {
      v6.receiver = v9;
      v6.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
      return [(_UIContextMenuCellContentViewAccessibility *)&v6 accessibilityElementsHidden];
    }
  }
  else
  {
    id v4 = (id)[(_UIContextMenuCellContentViewAccessibility *)v9 storedAccessibilityElementsHidden];
    BOOL v10 = [v4 BOOLValue] & 1;
  }
  return v10;
}

- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3
{
  BOOL v7 = self;
  SEL v6 = a2;
  unint64_t v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
  [(_UIContextMenuCellContentViewAccessibility *)&v4 _updateForOptionsChangeFromPreviousOptions:a3];
  char v3 = [(_UIContextMenuCellContentViewAccessibility *)v7 safeUnsignedIntegerForKey:@"options"];
  if ((v5 & 0x40) == 0 && (v3 & 0x40) != 0) {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
  }
}

@end