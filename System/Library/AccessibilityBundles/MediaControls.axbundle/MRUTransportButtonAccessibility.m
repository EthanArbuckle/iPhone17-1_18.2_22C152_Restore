@interface MRUTransportButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MRUTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUTransportButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MRUTransportButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUTransportButton", @"packageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MRUCAPackageView", @"glyphState", "@", 0);
}

- (id)accessibilityCustomActions
{
  id v3 = [(MRUTransportButtonAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_2 startWithSelf:0];
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MRUTransportButtonAccessibility;
    v4 = [(MRUTransportButtonAccessibility *)&v7 accessibilityCustomActions];
    v5 = AXGuaranteedMutableArray();

    UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  }
  else
  {
    v5 = (void *)MEMORY[0x263EFFA68];
  }

  return v5;
}

uint64_t __61__MRUTransportButtonAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Mrucontrolcent_6.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [(MRUTransportButtonAccessibility *)self imageForState:0];
    v4 = [v3 imageAsset];
    v5 = [v4 safeStringForKey:@"assetName"];

    v6 = [(MRUTransportButtonAccessibility *)self safeUIViewForKey:@"packageView"];
    objc_super v7 = [v6 accessibilityIdentifier];

    if ([v5 isEqualToString:@"airplayaudio"])
    {
      v8 = @"airplay.audio.label";
LABEL_9:
      v9 = accessibilityLocalizedString(v8);
      goto LABEL_10;
    }
    if ([v5 isEqualToString:@"airplayvideo"])
    {
      v8 = @"airplay.video.label";
      goto LABEL_9;
    }
    if (([v5 isEqualToString:@"play.fill"] & 1) != 0
      || [v7 isEqualToString:@"play"])
    {
      v8 = @"play.button.label";
      goto LABEL_9;
    }
    if (([v5 isEqualToString:@"pause.fill"] & 1) != 0
      || [v7 isEqualToString:@"pause"])
    {
      v8 = @"pause.button.label";
      goto LABEL_9;
    }
    if (([v5 isEqualToString:@"stop.fill"] & 1) != 0
      || [v7 isEqualToString:@"stop"])
    {
      v8 = @"stop.button.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"appletvremote"]
      || [v5 isEqualToString:@"appletvremote-b519"])
    {
      v8 = @"tv.remote.button.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"captions.bubble"])
    {
      v8 = @"language.options.button.label";
      goto LABEL_9;
    }
    if (([v5 isEqualToString:@"backward.fill"] & 1) != 0
      || [v7 isEqualToString:@"backward"])
    {
      v8 = @"previous.track.button.label";
      goto LABEL_9;
    }
    if (([v5 isEqualToString:@"forward.fill"] & 1) != 0
      || [v7 isEqualToString:@"forward"])
    {
      v8 = @"next.track.button.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"line.horizontal.3"])
    {
      v8 = @"menu.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"hand.thumbsup"])
    {
      v8 = @"like.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"hand.thumbsdown"])
    {
      v8 = @"dislike.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"plus"])
    {
      v8 = @"wishlist.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"speaker.wave.2.fill"])
    {
      v8 = @"playback.destination.button.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"goforward.5"])
    {
      v11 = NSString;
      v12 = @"fast.forward.button.label.with.seconds";
LABEL_46:
      v13 = accessibilityLocalizedString(v12);
      v9 = objc_msgSend(v11, "stringWithFormat:", v13, 5);

LABEL_10:
      if (v9) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
    if ([v5 isEqualToString:@"gobackward.5"])
    {
      v11 = NSString;
      v12 = @"rewind.button.label.with.seconds";
      goto LABEL_46;
    }
    if ([v5 isEqualToString:@"gobackward.minus"])
    {
      v8 = @"gobackward.minus.label";
      goto LABEL_9;
    }
    if ([v5 isEqualToString:@"goforward.plus"])
    {
      v8 = @"goforward.plus.label";
      goto LABEL_9;
    }
    if ([v7 isEqualToString:@"favorite"])
    {
      v8 = @"favorite.button.label";
      goto LABEL_9;
    }
    if (v5)
    {
      v14 = AXLogAppAccessibility();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        [(MRUControlCenterRouteButtonAccessibility *)(uint64_t)v5 accessibilityLabel];
      }
    }
  }
LABEL_11:
  v15.receiver = self;
  v15.super_class = (Class)MRUTransportButtonAccessibility;
  v9 = [(MRUTransportButtonAccessibility *)&v15 accessibilityLabel];
LABEL_12:

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v10.receiver = self;
  v10.super_class = (Class)MRUTransportButtonAccessibility;
  unint64_t v3 = [(MRUTransportButtonAccessibility *)&v10 accessibilityTraits];
  v4 = [(MRUTransportButtonAccessibility *)self safeUIViewForKey:@"packageView"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 safeStringForKey:@"glyphState"];
    int v7 = [v6 isEqualToString:@"On"];
    uint64_t v8 = *MEMORY[0x263F1CF38];
    if (!v7) {
      uint64_t v8 = 0;
    }
    v3 |= v8;
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 1;
  }
  uint64_t v3 = [(MRUTransportButtonAccessibility *)self imageForState:0];
  v4 = [(MRUTransportButtonAccessibility *)self safeUIViewForKey:@"packageView"];
  uint64_t v5 = [v4 safeStringForKey:@"packageName"];
  uint64_t v6 = v3 | v5;

  BOOL v7 = v6 != 0;
  return v7;
}

@end