@interface AVTRecordViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isCreating;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AVTRecordViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVTRecordView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTRecordView" isKindOfClass:@"AVTView"];
  [v3 validateClass:@"AVTView" hasInstanceVariable:@"_faceTrackingDelegate" withType:"<AVTViewFaceTrackingDelegate>"];
  [v3 validateClass:@"AVTRecordView" hasInstanceVariable:@"_avatar" withType:"AVTAvatar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTFaceTrackingManager", @"delegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTView", @"faceIsTracked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarAttributeEditorViewController", @"isCreating", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(AVTRecordViewAccessibility *)self _isCreating])
  {
    id v3 = (void *)MEMORY[0x263F22288];
    char v9 = 0;
    v4 = [(AVTRecordViewAccessibility *)self safeValueForKey:@"avatar"];
    v5 = __UIAccessibilitySafeClass();

    v6 = [v3 descriptionForMemoji:v5];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTRecordViewAccessibility;
    v6 = [(AVTRecordViewAccessibility *)&v8 accessibilityLabel];
  }

  return v6;
}

- (id)accessibilityValue
{
  id v3 = [(AVTRecordViewAccessibility *)self accessibilityUserDefinedValue];
  if ([(AVTRecordViewAccessibility *)self _isCreating])
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTRecordViewAccessibility;
    v4 = [(AVTRecordViewAccessibility *)&v8 accessibilityValue];
  }
  else
  {
    if ([(AVTRecordViewAccessibility *)self safeBoolForKey:@"faceIsTracked"]) {
      v5 = @"tracking.enabled";
    }
    else {
      v5 = @"tracking.disabled";
    }
    v7 = accessibilityAvatarKitLocalizedString(v5);
    v4 = __UIAXStringForVariables();
  }

  return v4;
}

- (BOOL)_isCreating
{
  v2 = [(AVTRecordViewAccessibility *)self safeValueForKeyPath:@"faceTrackingDelegate.delegate"];
  char v3 = [v2 safeBoolForKey:@"isCreating"];

  return v3;
}

@end