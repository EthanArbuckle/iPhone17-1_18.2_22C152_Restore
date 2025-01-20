@interface TrackCellViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TrackCellViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicMessagesApp.TrackCellView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.TrackCellView", @"isNowPlaying", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.TrackCellView", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.TrackCellView", @"artist", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicMessagesApp.TrackCellView", @"isExplicit", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  int v3 = [(TrackCellViewAccessibility *)self safeBoolForKey:@"isNowPlaying"];
  v4 = [(TrackCellViewAccessibility *)self safeValueForKey:@"title"];
  v5 = [(TrackCellViewAccessibility *)self safeValueForKey:@"artist"];
  char v6 = [(TrackCellViewAccessibility *)self safeBoolForKey:@"isExplicit"];
  char v7 = v6;
  if (v3)
  {
    v8 = accessibilityMusicMessagesAppLocalizedString(@"now.playing");
    if ((v7 & 1) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v11 = accessibilityMusicMessagesAppLocalizedString(@"explicit");
    v9 = __UIAXStringForVariables();

    if (!v3) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v8 = 0;
  if (v6) {
    goto LABEL_6;
  }
LABEL_3:
  v9 = __UIAXStringForVariables();
  if (v3) {
LABEL_7:
  }

LABEL_8:

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)TrackCellViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(TrackCellViewAccessibility *)&v3 accessibilityTraits];
}

@end