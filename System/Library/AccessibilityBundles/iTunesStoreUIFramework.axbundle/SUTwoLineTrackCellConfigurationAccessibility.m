@interface SUTwoLineTrackCellConfigurationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation SUTwoLineTrackCellConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUTwoLineTrackCellConfiguration";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  [self _accessibilityReloadMediaStrings];
  id v3 = [(SUTwoLineTrackCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityStringsArrayPointer"];
  v4 = (id *)[v3 bytes];
  id v5 = v4[2];
  id v6 = v4[1];
  id v7 = *v4;
  v8 = [(SUTwoLineTrackCellConfigurationAccessibility *)self safeValueForKey:@"_accessibilityVideoIconString"];
  if ([v7 length])
  {
    v11 = accessibilityLocalizedString(@"explicit.content");
    v9 = __UIAXStringForVariables();
  }
  else
  {
    v9 = __UIAXStringForVariables();
  }

  return v9;
}

@end