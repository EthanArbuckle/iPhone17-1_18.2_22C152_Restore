@interface MAListSnippetViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
@end

@implementation MAListSnippetViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MAListSnippetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F8B098], a2);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MAListSnippetViewAccessibility;
  v4 = [(MAListSnippetViewAccessibility *)&v11 tableView:a3 cellForRowAtIndexPath:a4];
  v5 = [v4 reuseIdentifier];
  int v6 = [v5 isEqualToString:@"YelpAttribution"];

  if (v6)
  {
    v7 = AXMapsAssistantUILocString(@"YELP_REVIEWS");
    [v4 setAccessibilityLabel:v7];
  }
  else
  {
    v8 = [v4 safeValueForKey:@"resultView"];
    v7 = v8;
    if (v8)
    {
      v9 = [v8 accessibilityLabel];
      [v4 setAccessibilityLabel:v9];
    }
  }

  return v4;
}

@end