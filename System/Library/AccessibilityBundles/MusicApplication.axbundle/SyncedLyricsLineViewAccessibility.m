@interface SyncedLyricsLineViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setSelected:(BOOL)a3 animator:(id)a4;
@end

@implementation SyncedLyricsLineViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCoreUI.SyncedLyricsLineView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsLineView" isKindOfClass:@"UIControl"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIControl", @"isSelected", "B", 0);
  [v3 validateClass:@"MusicCoreUI.SyncedLyricsLineView" hasSwiftField:@"containerView" withSwiftType:"UIView"];
  [v3 validateClass:@"MusicTextContentView"];
  [v3 validateClass:@"MusicTextContentView" hasSwiftField:@"label" withSwiftType:"UILabel"];
  [v3 validateClass:@"MusicSBS_TextContentView"];
  [v3 validateClass:@"MusicSBS_TextContentView" hasSwiftField:@"text" withSwiftType:"Optional<String>"];
  [v3 validateClass:@"MusicSBS_TextContentView" hasSwiftField:@"attributedText" withSwiftType:"Optional<NSAttributedString>"];
  [v3 validateClass:@"MusicInstrumentalContentView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicCoreUI.SyncedLyricsLineView", @"setSelected:animator:", "v", "B", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CEE8];
  int v3 = [(SyncedLyricsLineViewAccessibility *)self safeBoolForKey:@"isSelected"];
  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v2;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  int v3 = [(SyncedLyricsLineViewAccessibility *)self safeSwiftValueForKey:@"containerView"];
  uint64_t v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 _accessibilityDescendantOfType:MEMORY[0x2456584B0](@"MusicSBS_TextContentView")];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 safeSwiftValueForKey:@"text"];
    id v8 = v7;
    if (v7)
    {
      id v8 = v7;
      v9 = v8;
      goto LABEL_11;
    }
    objc_opt_class();
    v14 = [v6 safeSwiftValueForKey:@"attributedText"];
    v12 = __UIAccessibilityCastAsClass();

    uint64_t v13 = [v12 string];
    goto LABEL_9;
  }
  id v8 = [v4 _accessibilityDescendantOfType:MEMORY[0x2456584B0](@"MusicTextContentView")];
  if (!v8) {
    goto LABEL_6;
  }
  objc_opt_class();
  v10 = [v8 safeSwiftValueForKey:@"label"];
  v11 = __UIAccessibilityCastAsClass();

  v9 = [v11 accessibilityLabel];

  if (!v9)
  {
LABEL_6:
    v12 = [v4 _accessibilityDescendantOfType:MEMORY[0x2456584B0](@"MusicInstrumentalContentView")];
    if (!v12)
    {
      v9 = 0;
      goto LABEL_10;
    }
    uint64_t v13 = accessibilityMusicLocalizedString(@"instrumental.break");
LABEL_9:
    v9 = (void *)v13;
LABEL_10:
  }
LABEL_11:

  return v9;
}

- (BOOL)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  return 1;
}

- (void)setSelected:(BOOL)a3 animator:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)SyncedLyricsLineViewAccessibility;
  [(SyncedLyricsLineViewAccessibility *)&v9 setSelected:a3 animator:a4];
  v5 = [(SyncedLyricsLineViewAccessibility *)self accessibilityLabel];
  if ([v5 length])
  {
    uint64_t v6 = *MEMORY[0x263F219D0];
    v10 = v5;
    uint64_t v11 = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v10 count:1];
    v12[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

    UIAccessibilityPostNotification(0x42Cu, v8);
  }
}

@end