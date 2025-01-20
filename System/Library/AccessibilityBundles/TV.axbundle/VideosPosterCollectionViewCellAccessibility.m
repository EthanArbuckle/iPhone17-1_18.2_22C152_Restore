@interface VideosPosterCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsDeletable;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (id)accessibilityHint;
- (id)accessibilityLabel;
@end

@implementation VideosPosterCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VideosPosterCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VideosCollectionViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"subtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"editingButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"showCloudIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"artworkView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosPosterCollectionViewCell", @"badgeCount", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"VideosArtworkView", @"placeholderTitle", "@", 0);
}

- (BOOL)_axIsDeletable
{
  v2 = [(VideosPosterCollectionViewCellAccessibility *)self safeValueForKey:@"editingButton"];
  char v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v3 = [(VideosPosterCollectionViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(VideosPosterCollectionViewCellAccessibility *)self safeValueForKey:@"subtitleLabel"];
  v20 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  if (!objc_msgSend(v6, "length", v20, @"__AXStringForVariablesSentinel"))
  {
    v7 = [(VideosPosterCollectionViewCellAccessibility *)self safeValueForKey:@"artworkView"];
    uint64_t v8 = [v7 safeValueForKey:@"placeholderTitle"];

    v6 = (void *)v8;
  }
  v21 = [(VideosPosterCollectionViewCellAccessibility *)self _accessibilityValueForKey:@"AXArtistName"];
  v9 = __UIAXStringForVariables();

  if ([(VideosPosterCollectionViewCellAccessibility *)self safeBoolForKey:@"showCloudIcon", v21, @"__AXStringForVariablesSentinel"])
  {
    v22 = accessibilityLocalizedString(@"in.icloud.badge");
    v24 = @"__AXStringForVariablesSentinel";
    uint64_t v10 = __UIAXStringForVariables();

    v9 = (void *)v10;
  }
  if ([(VideosPosterCollectionViewCellAccessibility *)self _axIsDeletable])
  {
    v11 = NSString;
    v12 = accessibilityLocalizedString(@"video.thumbnail.delete");
    uint64_t v13 = objc_msgSend(v11, "stringWithFormat:", v12, v9);

    v9 = (void *)v13;
  }
  uint64_t v14 = [(VideosPosterCollectionViewCellAccessibility *)self safeUnsignedIntegerForKey:@"badgeCount"];
  if (v14)
  {
    uint64_t v15 = v14;
    v16 = NSString;
    v17 = accessibilityLocalizedString(@"unplayed.episodes.count");
    v23 = objc_msgSend(v16, "stringWithFormat:", v17, v15);
    uint64_t v18 = __UIAXStringForVariables();

    v9 = (void *)v18;
  }

  return v9;
}

- (id)accessibilityHint
{
  if ([(VideosPosterCollectionViewCellAccessibility *)self _axIsDeletable])
  {
    v2 = accessibilityLocalizedString(@"video.thumbnail.delete.hint");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(VideosPosterCollectionViewCellAccessibility *)self _axIsDeletable])
  {
    char v3 = [(VideosPosterCollectionViewCellAccessibility *)self safeValueForKey:@"editingButton"];
    [v3 accessibilityActivationPoint];
    double v5 = v4;
    double v7 = v6;

    double v8 = v5;
    double v9 = v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VideosPosterCollectionViewCellAccessibility;
    [(VideosPosterCollectionViewCellAccessibility *)&v10 accessibilityActivationPoint];
  }
  result.y = v9;
  result.x = v8;
  return result;
}

@end