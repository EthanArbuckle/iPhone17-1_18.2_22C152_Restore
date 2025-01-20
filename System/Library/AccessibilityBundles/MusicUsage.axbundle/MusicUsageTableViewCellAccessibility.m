@interface MusicUsageTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MusicUsageTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicUsageTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicUsageTableViewCell" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"MusicUsageTableViewCell" hasInstanceVariable:@"_subtitleLabel" withType:"MPUAbbreviatingLabel"];
  [v3 validateClass:@"MusicUsageTableViewCell" hasInstanceVariable:@"_fileSizeLabel" withType:"UILabel"];
}

- (id)accessibilityLabel
{
  return (id)[(MusicUsageTableViewCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel, _subtitleLabel, _fileSizeLabel"];
}

@end