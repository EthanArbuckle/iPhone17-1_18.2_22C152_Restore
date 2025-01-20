@interface AAUIProfilePhotoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsEditing;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)_accessibilityPhotoView;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AAUIProfilePhotoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIProfilePhotoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AAUIProfilePhotoView" hasInstanceVariable:@"_editButton" withType:"UIButton"];
  [v3 validateClass:@"AAUIProfilePhotoView" hasInstanceVariable:@"_photoView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AAUIProfilePhotoView", @"isEditing", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(AAUIProfilePhotoViewAccessibility *)self _accessibilityPhotoView];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityHint
{
  if ([(AAUIProfilePhotoViewAccessibility *)self _accessibilityIsEditing])
  {
    id v3 = accessibilityLocalizedString(@"editablePhoto.hint");
  }
  else
  {
    v4 = [(AAUIProfilePhotoViewAccessibility *)self _accessibilityPhotoView];
    id v3 = [v4 accessibilityHint];
  }

  return v3;
}

- (unint64_t)accessibilityTraits
{
  BOOL v2 = [(AAUIProfilePhotoViewAccessibility *)self _accessibilityIsEditing];
  uint64_t v3 = *MEMORY[0x263F1CEE8];
  if (!v2) {
    uint64_t v3 = 0;
  }
  return v3 | *MEMORY[0x263F1CF00];
}

- (CGPoint)accessibilityActivationPoint
{
  BOOL v2 = [(AAUIProfilePhotoViewAccessibility *)self safeValueForKey:@"_editButton"];
  [v2 accessibilityActivationPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (BOOL)_accessibilityIsEditing
{
  return [(AAUIProfilePhotoViewAccessibility *)self safeBoolForKey:@"isEditing"];
}

- (id)_accessibilityPhotoView
{
  return (id)[(AAUIProfilePhotoViewAccessibility *)self safeValueForKey:@"_photoView"];
}

@end