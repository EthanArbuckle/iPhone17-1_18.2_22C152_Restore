@interface MSTrackCellContentsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation MSTrackCellContentsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MSTrackCellContents";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)accessibilityLabel
{
  v3 = [(MSTrackCellContentsAccessibility *)self safeValueForKey:@"_item"];
  v4 = [v3 accessibilityLabel];
  v5 = [v3 safeValueForKey:@"artistName"];
  v6 = [v3 safeValueForKey:@"contentRating"];
  v7 = [v6 safeValueForKey:@"isExplicitContent"];
  int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = accessibilityLocalizedString(@"explicit.content");
  }
  else
  {
    v9 = 0;
  }
  v12 = [(MSTrackCellContentsAccessibility *)self safeValueForKey:@"_accessibilityVideoIconString"];
  v10 = __UIAXStringForVariables();

  return v10;
}

@end