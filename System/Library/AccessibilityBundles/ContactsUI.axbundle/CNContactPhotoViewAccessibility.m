@interface CNContactPhotoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CNContactPhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNContactPhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactPhotoView", @"contact", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactPhotoView", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactPhotoView", @"hasPhoto", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNContactPhotoView", @"avatarView", "@", 0);
  [v3 validateClass:@"CNContact" hasInstanceVariable:@"_displayNameOrder" withType:"NSInteger"];
  [v3 validateClass:@"CNContactPhotoView" hasInstanceVariable:@"_editPhotoButton" withType:"UIButton"];
}

- (BOOL)isAccessibilityElement
{
  if ([(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"hasPhoto"]) {
    return 1;
  }

  return [(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"isEditing"];
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(CNContactPhotoViewAccessibility *)self safeValueForKey:@"contact"];
  v4 = __UIAccessibilityCastAsClass();

  [(CNContactPhotoViewAccessibility *)self frame];
  double v6 = v5;
  int v7 = [(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"hasPhoto"];
  int v8 = [(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"isEditing"];
  if (!v7 && v8 && v6 >= 50.0)
  {
    v9 = @"add.photo.button";
LABEL_10:
    v12 = accessibilityLocalizedString(v9);
    goto LABEL_11;
  }
  if (!v4)
  {
LABEL_9:
    v9 = @"missing.photo.for.text.no.name";
    goto LABEL_10;
  }
  uint64_t v10 = [v4 givenName];
  uint64_t v11 = [v4 familyName];
  if (!(v10 | v11))
  {
    if (v7)
    {
      v9 = @"photo.for.text.no.name";
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v10) {
    v14 = (__CFString *)v10;
  }
  else {
    v14 = &stru_26F677218;
  }
  if (v11) {
    v15 = (__CFString *)v11;
  }
  else {
    v15 = &stru_26F677218;
  }
  if ([v4 safeIntegerForKey:@"_displayNameOrder"] == 2) {
    [NSString stringWithFormat:@"%@ %@", v15, v14];
  }
  else {
  v16 = [NSString stringWithFormat:@"%@ %@", v14, v15];
  }
  if (v7)
  {
    v17 = [(CNContactPhotoViewAccessibility *)self safeValueForKey:@"avatarView"];
    uint64_t v18 = [v17 accessibilityLabel];
  }
  else
  {
    v17 = accessibilityLocalizedString(@"missing.photo.for.text");
    v19 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v20 = [v16 stringByTrimmingCharactersInSet:v19];
    uint64_t v21 = [v20 length];

    if (!v21)
    {
      v22 = [v4 phoneNumbers];
      v23 = [v22 firstObject];
      v24 = [v23 value];
      uint64_t v25 = [v24 stringValue];

      v16 = (void *)v25;
    }
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", v17, v16);
  }
  v12 = (void *)v18;

LABEL_11:

  return v12;
}

- (id)accessibilityValue
{
  id v3 = [(CNContactPhotoViewAccessibility *)self safeValueForKey:@"_editPhotoButton"];
  int v4 = [v3 _accessibilityViewIsVisible];

  if (v4)
  {
    double v5 = [(CNContactPhotoViewAccessibility *)self safeValueForKey:@"_editPhotoButton"];
    double v6 = [v5 accessibilityValue];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNContactPhotoViewAccessibility;
    double v6 = [(CNContactPhotoViewAccessibility *)&v8 accessibilityValue];
  }

  return v6;
}

- (id)accessibilityHint
{
  if ([(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"hasPhoto"]
    && [(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"isEditing"])
  {
    id v3 = accessibilityLocalizedString(@"edit.photo.hint");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CNContactPhotoViewAccessibility;
    id v3 = [(CNContactPhotoViewAccessibility *)&v5 accessibilityHint];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactPhotoViewAccessibility;
  unint64_t v3 = [(CNContactPhotoViewAccessibility *)&v7 accessibilityTraits];
  int v4 = [(CNContactPhotoViewAccessibility *)self safeBoolForKey:@"isEditing"];
  uint64_t v5 = *MEMORY[0x263F1CEE8];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3 | *MEMORY[0x263F1CF00];
}

@end