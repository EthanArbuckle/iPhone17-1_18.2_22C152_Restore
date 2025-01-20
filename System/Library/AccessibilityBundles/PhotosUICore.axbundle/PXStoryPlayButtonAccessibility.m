@interface PXStoryPlayButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation PXStoryPlayButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXStoryPlayButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryPlayButton", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryViewModel", @"isAtPlaybackEnd", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryViewModel", @"desiredPlayState", "q", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(PXStoryPlayButtonAccessibility *)self safeValueForKey:@"viewModel"];
  uint64_t v4 = [v3 safeIntegerForKey:@"desiredPlayState"];
  if (v4 == 1)
  {
    v5 = @"story.pause";
    goto LABEL_7;
  }
  if (!v4)
  {
    if ([v3 safeBoolForKey:@"isAtPlaybackEnd"]) {
      v5 = @"story.replay";
    }
    else {
      v5 = @"story.play";
    }
LABEL_7:
    v6 = accessibilityPhotosUICoreLocalizedString(v5);
    if (v6) {
      goto LABEL_9;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)PXStoryPlayButtonAccessibility;
  v6 = [(PXStoryPlayButtonAccessibility *)&v8 accessibilityLabel];
LABEL_9:

  return v6;
}

@end