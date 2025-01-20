@interface MRUMediaSuggestionCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unsigned)_accessibilityMediaAnalysisOptions;
@end

@implementation MRUMediaSuggestionCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUMediaSuggestionCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMediaSuggestionCollectionViewCell", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMediaSuggestionCollectionViewCell", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UICollectionViewCell", @"isSelected", "B", 0);
  [v3 validateClass:@"MRUMediaSuggestionCollectionViewCell" isKindOfClass:@"UICollectionViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUMediaSuggestionCollectionViewCell", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUArtworkView", @"iconImage", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MRUMediaSuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"artworkView"];
  v4 = [v3 safeValueForKey:@"iconImage"];
  v5 = [v4 accessibilityLabel];

  if ([v5 length])
  {
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"media.source.app.description");
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
  }
  else
  {
    v8 = 0;
  }
  v9 = [(MRUMediaSuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"title"];
  v12 = [(MRUMediaSuggestionCollectionViewCellAccessibility *)self safeValueForKey:@"subtitle"];
  v10 = __UIAXStringForVariables();

  return v10;
}

- (id)accessibilityValue
{
  if ([(MRUMediaSuggestionCollectionViewCellAccessibility *)self safeBoolForKey:@"isSelected"])
  {
    id v3 = accessibilityLocalizedString(@"media.item.loading");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MRUMediaSuggestionCollectionViewCellAccessibility;
    id v3 = [(MRUMediaSuggestionCollectionViewCellAccessibility *)&v5 accessibilityValue];
  }

  return v3;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0;
}

@end