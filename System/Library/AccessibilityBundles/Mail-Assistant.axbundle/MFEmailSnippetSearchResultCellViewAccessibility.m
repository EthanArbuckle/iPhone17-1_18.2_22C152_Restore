@interface MFEmailSnippetSearchResultCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (void)setEmail:(id)a3;
@end

@implementation MFEmailSnippetSearchResultCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MFEmailSnippetSearchResultCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [MEMORY[0x263EFF980] array];
  int v4 = [(MFEmailSnippetSearchResultCellViewAccessibility *)self _accessibilityBoolValueForKey:@"isOutgoingEmailKey"];
  v5 = [(MFEmailSnippetSearchResultCellViewAccessibility *)self safeValueForKey:@"_addressLabel"];
  v6 = [v5 accessibilityLabel];

  if ([v6 length])
  {
    if (v4) {
      v7 = @"message.address.to.label";
    }
    else {
      v7 = @"message.address.from.label";
    }
    v8 = accessibilityMobileMailLocalizedString(v7);
    v9 = objc_msgSend(NSString, "stringWithFormat:", v8, v6);
    [v3 addObject:v9];
  }
  v10 = [(MFEmailSnippetSearchResultCellViewAccessibility *)self safeValueForKey:@"_subjectLabel"];
  v11 = [v10 accessibilityLabel];

  if ([v11 length])
  {
    v12 = NSString;
    v13 = accessibilityMobileMailLocalizedString(@"subject");
    v14 = [v12 stringWithFormat:@"%@: %@", v13, v11];

    [v3 addObject:v14];
  }
  v15 = [(MFEmailSnippetSearchResultCellViewAccessibility *)self safeValueForKey:@"_dateLabel"];
  v16 = [v15 accessibilityLabel];

  if ([v16 length])
  {
    v17 = [MEMORY[0x263F21660] axAttributedStringWithString:v16];
    [v17 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21718]];
    [v3 addObject:v17];
  }
  v18 = [(MFEmailSnippetSearchResultCellViewAccessibility *)self safeValueForKey:@"_bodyLabel"];
  v19 = [v18 accessibilityLabel];

  if ([v19 length]) {
    [v3 addObject:v19];
  }
  v20 = [v3 componentsJoinedByString:@", "];

  return v20;
}

- (void)setEmail:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFEmailSnippetSearchResultCellViewAccessibility;
  [(MFEmailSnippetSearchResultCellViewAccessibility *)&v20 setEmail:v4];
  objc_opt_class();
  v5 = [v4 safeValueForKey:@"outgoing"];
  v6 = __UIAccessibilityCastAsClass();

  uint64_t v7 = [v6 BOOLValue];
  [(MFEmailSnippetSearchResultCellViewAccessibility *)self _accessibilitySetBoolValue:v7 forKey:@"isOutgoingEmailKey"];
  v8 = [MEMORY[0x263EFF980] array];
  v9 = [v4 safeValueForKey:@"statusFlags"];
  char v10 = [v9 intValue];

  if (v10)
  {
    uint64_t v11 = accessibilityMobileMailLocalizedString(@"unread");
    if (v11)
    {
      v12 = (void *)v11;
      [v8 addObject:v11];
    }
  }
  if ((v10 & 8) != 0)
  {
    uint64_t v13 = accessibilityMobileMailLocalizedString(@"flagged");
    if (v13)
    {
      v14 = (void *)v13;
      [v8 addObject:v13];
    }
  }
  if ((v10 & 2) != 0)
  {
    uint64_t v15 = accessibilityMobileMailLocalizedString(@"replied");
    if (v15)
    {
      v16 = (void *)v15;
      [v8 addObject:v15];
    }
  }
  if ((v10 & 4) != 0)
  {
    uint64_t v17 = accessibilityMobileMailLocalizedString(@"forwarded");
    if (v17)
    {
      v18 = (void *)v17;
      [v8 addObject:v17];
    }
  }
  v19 = [v8 componentsJoinedByString:@", "];
  [(MFEmailSnippetSearchResultCellViewAccessibility *)self setAccessibilityValue:v19];
}

@end