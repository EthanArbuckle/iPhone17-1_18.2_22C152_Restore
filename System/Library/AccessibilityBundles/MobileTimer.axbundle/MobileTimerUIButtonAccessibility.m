@interface MobileTimerUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_isAlarmTableViewCellDescendantDisclosureButton;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityLanguage;
- (unint64_t)accessibilityTraits;
@end

@implementation MobileTimerUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(MobileTimerUIButtonAccessibility *)self accessibilityIdentifier];
  if ([v3 isEqualToString:@"WeatherButton"])
  {
    v4 = @"weather.button";
LABEL_5:
    uint64_t v5 = accessibilityNonLocalizedString(v4);
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"YahooButton"])
  {
    v4 = @"yahoo.button";
    goto LABEL_5;
  }
  v8.receiver = self;
  v8.super_class = (Class)MobileTimerUIButtonAccessibility;
  uint64_t v5 = [(MobileTimerUIButtonAccessibility *)&v8 accessibilityLabel];
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityLanguage
{
  v3 = [(MobileTimerUIButtonAccessibility *)self accessibilityIdentifier];
  if (([v3 isEqualToString:@"WeatherButton"] & 1) != 0
    || ([v3 isEqualToString:@"YahooButton"] & 1) != 0)
  {
    v4 = @"en-US";
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileTimerUIButtonAccessibility;
    v4 = [(MobileTimerUIButtonAccessibility *)&v6 accessibilityLanguage];
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3 = [(MobileTimerUIButtonAccessibility *)self accessibilityIdentifier];
  if (([v3 isEqualToString:@"WeatherButton"] & 1) != 0
    || [v3 isEqualToString:@"YahooButton"])
  {
    id v4 = (id)*MEMORY[0x263F1CF10];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileTimerUIButtonAccessibility;
    id v4 = [(MobileTimerUIButtonAccessibility *)&v6 accessibilityTraits];
  }

  return (unint64_t)v4;
}

- (BOOL)isAccessibilityElement
{
  if ([(MobileTimerUIButtonAccessibility *)self _isAlarmTableViewCellDescendantDisclosureButton])
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MobileTimerUIButtonAccessibility;
  return [(MobileTimerUIButtonAccessibility *)&v4 isAccessibilityElement];
}

- (BOOL)_isAlarmTableViewCellDescendantDisclosureButton
{
  if (_isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClassOnceToken != -1) {
    dispatch_once(&_isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClassOnceToken, &__block_literal_global_1);
  }
  v3 = [(MobileTimerUIButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:_isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClass];

  objc_super v4 = [(MobileTimerUIButtonAccessibility *)self accessibilityIdentification];
  char v5 = [v4 isEqualToString:@"UITableCellViewDisclosure"];

  if (v3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t __83__MobileTimerUIButtonAccessibility__isAlarmTableViewCellDescendantDisclosureButton__block_invoke()
{
  uint64_t result = MEMORY[0x245657200](@"MTAAlarmTableViewCell");
  _isAlarmTableViewCellDescendantDisclosureButton__AlarmTableViewCellClass = result;
  return result;
}

@end