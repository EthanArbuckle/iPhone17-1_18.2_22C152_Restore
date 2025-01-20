@interface MiroSmartMusicMenuCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axRequiresDownload;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)awakeFromNib;
- (void)prepareForReuse;
@end

@implementation MiroSmartMusicMenuCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MiroSmartMusicMenuCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroSmartMusicMenuCell", @"cloudStatus", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroSmartMusicMenuCell", @"songName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroSmartMusicMenuCell", @"artistName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroSmartMusicMenuCell", @"progress", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MiroSmartMusicMenuCell", @"prepareForReuse", "v", 0);
}

- (BOOL)_axRequiresDownload
{
  objc_opt_class();
  id v3 = [(MiroSmartMusicMenuCellAccessibility *)self safeValueForKey:@"cloudStatus"];
  v4 = __UIAccessibilityCastAsClass();

  int v5 = [v4 isHidden] ^ 1;
  return v5;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(MiroSmartMusicMenuCellAccessibility *)self safeValueForKey:@"songName"];
  v4 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  int v5 = [(MiroSmartMusicMenuCellAccessibility *)self safeValueForKey:@"artistName"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = __AXStringForVariables();

  return v7;
}

- (id)accessibilityValue
{
  if ([(MiroSmartMusicMenuCellAccessibility *)self _axRequiresDownload])
  {
    id v3 = accessibilityMemoriesLocalizedString(@"memory.soundtrack.needsdownload");
  }
  else
  {
    [(MiroSmartMusicMenuCellAccessibility *)self safeFloatForKey:@"progress"];
    id v3 = 0;
    if (v4 > 0.0)
    {
      id v3 = AXFormatFloatWithPercentage();
    }
  }

  return v3;
}

- (id)accessibilityHint
{
  if ([(MiroSmartMusicMenuCellAccessibility *)self _axRequiresDownload]) {
    v2 = @"memory.soundtrack.hint.download";
  }
  else {
    v2 = @"memory.soundtrack.hint.playback";
  }
  id v3 = accessibilityMemoriesLocalizedString(v2);

  return v3;
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)MiroSmartMusicMenuCellAccessibility;
  [(MiroSmartMusicMenuCellAccessibility *)&v5 awakeFromNib];
  id v3 = [(MiroSmartMusicMenuCellAccessibility *)self safeValueForKey:@"cloudStatus"];
  [v3 setIsAccessibilityElement:0];

  float v4 = [(MiroSmartMusicMenuCellAccessibility *)self safeValueForKey:@"progressIndicator"];
  [v4 setIsAccessibilityElement:0];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MiroSmartMusicMenuCellAccessibility;
  [(MiroSmartMusicMenuCellAccessibility *)&v3 prepareForReuse];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  [v2 setAccessoryType:0];
}

@end