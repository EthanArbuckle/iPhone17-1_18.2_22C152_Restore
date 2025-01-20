@interface MediaControlsBluetoothListeningModeButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityRespondsToUserInteraction;
- (int64_t)_accessibilityExpandedStatus;
- (unint64_t)accessibilityTraits;
@end

@implementation MediaControlsBluetoothListeningModeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MediaControlsBluetoothListeningModeButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_accessibilityExpandedStatus
{
  return 2;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

@end