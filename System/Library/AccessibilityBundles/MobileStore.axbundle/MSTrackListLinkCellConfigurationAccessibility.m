@interface MSTrackListLinkCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MSTrackListLinkCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTrackListLinkCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF40];
}

- (id)accessibilityLabel
{
  return *(id *)objc_msgSend((id)-[MSTrackListLinkCellConfigurationAccessibility safeValueForKey:](self, "safeValueForKey:", @"_accessibilityStringsArrayPointer"), "bytes");
}

@end