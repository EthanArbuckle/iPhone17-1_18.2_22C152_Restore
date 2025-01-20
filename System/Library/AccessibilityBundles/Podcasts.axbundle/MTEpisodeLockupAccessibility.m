@interface MTEpisodeLockupAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityPerformMoreActions:(id)a3;
- (BOOL)updateIsCurrentPlayerItemState;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityLabel;
- (id)automationElements;
@end

@implementation MTEpisodeLockupAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTEpisodeLockup";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeLockup", @"episode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeLockup", @"actionButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeLockup", @"metadataLabel", "@", 0);
  [v3 validateClass:@"MTEpisode" hasProperty:@"title" withType:"@"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"pubDate" withType:"d"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"duration" withType:"d"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisode", @"timeRemaining", "d", 0);
  [v3 validateClass:@"MTEpisode" hasProperty:@"video" withType:"B"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"audio" withType:"B"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"explicit" withType:"B"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"saved" withType:"B"];
  [v3 validateClass:@"MTEpisode" hasProperty:@"byteSize" withType:"q"];
  [v3 validateClass:@"MTEpisodeLockup" hasProperty:@"currentPlayerItem" customGetter:@"isCurrentPlayerItem" customSetter:0 withType:"B"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisode", @"isUnplayed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisode", @"isPartiallyPlayed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisode", @"isPlayed", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeLockup", @"iconView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeStateView", @"_streaming", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeStateView", @"_document", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeStateView", @"_error", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeStateView", @"_airplaneMode", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTEpisodeLockup", @"updateIsCurrentPlayerItemState", "B", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(MTEpisodeLockupAccessibility *)self safeValueForKey:@"episode"];
  objc_opt_class();
  v4 = [v3 safeValueForKey:@"title"];
  v35 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v5 = [v3 safeValueForKey:@"author"];
  uint64_t v6 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  v7 = [v3 safeValueForKey:@"bestDescription"];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  v9 = (void *)MEMORY[0x263F08790];
  objc_opt_class();
  v10 = [v3 valueForKey:@"pubDate"];
  v11 = __UIAccessibilityCastAsClass();

  uint64_t v12 = [v9 localizedStringFromDate:v11 dateStyle:2 timeStyle:1];

  [v3 safeDoubleForKey:@"duration"];
  double v14 = v13;
  [v3 safeDoubleForKey:@"timeRemaining"];
  v38 = (void *)v12;
  if (vabdd_f64(v14, v15) >= 0.001)
  {
    v17 = NSString;
    v18 = accessibilityLocalizedString(@"episode.time.remaining");
    v19 = AXDurationStringForDuration();
    v16 = objc_msgSend(v17, "stringWithFormat:", v18, v19);
  }
  else
  {
    v16 = 0;
  }
  if ([v3 safeBoolForKey:@"video"])
  {
    v37 = accessibilityLocalizedString(@"is.video");
  }
  else
  {
    v37 = 0;
  }
  if ([v3 safeBoolForKey:@"audio"])
  {
    v32 = accessibilityLocalizedString(@"is.audio");
  }
  else
  {
    v32 = 0;
  }
  if ([v3 safeBoolForKey:@"explicit"])
  {
    v33 = accessibilityLocalizedString(@"explicit");
  }
  else
  {
    v33 = 0;
  }
  if ([v3 safeBoolForKey:@"saved"])
  {
    v31 = accessibilityLocalizedString(@"saved");
  }
  else
  {
    v31 = 0;
  }
  if ([v3 safeIntegerForKey:@"byteSize"] <= 0) {
    accessibilityLocalizedString(@"unknown.size");
  }
  else {
  v20 = AXFormatByteSize();
  }
  if ([(MTEpisodeLockupAccessibility *)self safeBoolForKey:@"isCurrentPlayerItem"])
  {
    v21 = @"now.playing";
LABEL_27:
    v22 = accessibilityLocalizedString(v21);
    goto LABEL_28;
  }
  if ([v3 safeBoolForKey:@"isUnplayed"])
  {
    v21 = @"unplayed";
    goto LABEL_27;
  }
  if ([v3 safeBoolForKey:@"isPartiallyPlayed"])
  {
    v21 = @"partial.play";
    goto LABEL_27;
  }
  if ([v3 safeBoolForKey:@"isPlayed"])
  {
    v21 = @"played";
    goto LABEL_27;
  }
  v22 = 0;
LABEL_28:
  v23 = [(MTEpisodeLockupAccessibility *)self safeValueForKey:@"iconView"];
  if ([v23 safeBoolForKey:@"_streaming"])
  {
    v24 = accessibilityLocalizedString(@"streaming");
  }
  else
  {
    v24 = 0;
  }
  v36 = (void *)v6;
  if ([v23 safeBoolForKey:@"_document"])
  {
    v25 = accessibilityLocalizedString(@"document");
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)v8;
  if ([v23 safeBoolForKey:@"_error"])
  {
    v27 = accessibilityLocalizedString(@"error");
  }
  else
  {
    v27 = 0;
  }
  if ([v23 safeBoolForKey:@"_airplaneMode"])
  {
    v28 = accessibilityLocalizedString(@"airplane.mode");
  }
  else
  {
    v28 = 0;
  }
  v30 = AXDurationStringForDuration();
  v34 = __UIAXStringForVariables();

  return v34;
}

- (BOOL)accessibilityPerformMoreActions:(id)a3
{
  id v3 = [(MTEpisodeLockupAccessibility *)self safeValueForKey:@"actionButton"];
  [v3 accessibilityActivate];

  return 1;
}

- (id)_privateAccessibilityCustomActions
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(MTEpisodeLockupAccessibility *)self safeValueForKey:@"actionButton"];
  v5 = v4;
  if (v4 && ([v4 isHidden] & 1) == 0)
  {
    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityLocalizedString(@"more.actions");
    uint64_t v8 = (void *)[v6 initWithName:v7 target:self selector:sel_accessibilityPerformMoreActions_];

    [v3 addObject:v8];
  }

  return v3;
}

- (id)automationElements
{
  v11.receiver = self;
  v11.super_class = (Class)MTEpisodeLockupAccessibility;
  id v3 = [(MTEpisodeLockupAccessibility *)&v11 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  objc_opt_class();
  uint64_t v8 = [(MTEpisodeLockupAccessibility *)self safeValueForKey:@"metadataLabel"];
  v9 = __UIAccessibilityCastAsClass();

  if (v9 && ([v7 containsObject:v9] & 1) == 0) {
    [v7 addObject:v9];
  }

  return v7;
}

- (BOOL)updateIsCurrentPlayerItemState
{
  v4.receiver = self;
  v4.super_class = (Class)MTEpisodeLockupAccessibility;
  BOOL v2 = [(MTEpisodeLockupAccessibility *)&v4 updateIsCurrentPlayerItemState];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  return v2;
}

@end