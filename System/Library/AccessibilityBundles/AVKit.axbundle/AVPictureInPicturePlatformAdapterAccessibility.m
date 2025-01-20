@interface AVPictureInPicturePlatformAdapterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (AVPictureInPicturePlatformAdapterAccessibility)init;
- (BOOL)_axIsPictureInPictureActive;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axPostPIPStoppedNotification;
- (void)_axSetIsPictureInPictureActive:(BOOL)a3;
- (void)pictureInPictureViewControllerViewDidAppear:(id)a3;
- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3;
- (void)startPictureInPicture;
@end

@implementation AVPictureInPicturePlatformAdapterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPictureInPicturePlatformAdapter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsPictureInPictureActive
{
  return MEMORY[0x270F09620](self, &__AVPictureInPicturePlatformAdapterAccessibility___axIsPictureInPictureActive);
}

- (void)_axSetIsPictureInPictureActive:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVPictureInPicturePlatformAdapter" conformsToProtocol:@"AVPictureInPictureViewControllerDelegate"];
  [v3 validateProtocol:@"AVPictureInPictureViewControllerDelegate" hasRequiredInstanceMethod:@"pictureInPictureViewControllerViewDidAppear:"];
  [v3 validateProtocol:@"AVPictureInPictureViewControllerDelegate" hasRequiredInstanceMethod:@"pictureInPictureViewControllerViewWillDisappear:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPictureInPicturePlatformAdapter", @"pictureInPictureViewController", "@", 0);
  [v3 validateClass:@"AVPictureInPicturePlatformAdapter" hasProperty:@"playerController" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVPlayerController", @"metadata", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  [(AVPictureInPicturePlatformAdapterAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(AVPictureInPicturePlatformAdapterAccessibility *)self safeValueForKey:@"pictureInPictureViewController"];
  v4 = [v3 safeValueForKey:@"view"];
  [v4 setAccessibilityIdentifier:@"PIPUIView"];
  v5 = [(AVPictureInPicturePlatformAdapterAccessibility *)self safeValueForKey:@"playerController"];
  NSClassFromString(&cfstr_Webavplayercon.isa);
  if (objc_opt_isKindOfClass())
  {
    v6 = accessibilityLocalizedString(@"pip.safari.video.background.view.label");
    v7 = 0;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v8 = [v5 safeValueForKey:@"metadata"];
  v7 = [v8 objectForKeyedSubscript:*MEMORY[0x263EF9DC8]];
  if ([v7 length])
  {
    id v9 = v7;
  }
  else
  {
    accessibilityLocalizedString(@"pip.video.background.view.label");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v9;

  if (v6) {
LABEL_8:
  }
    [v4 setAccessibilityLabel:v6];
LABEL_9:
  [v4 setAccessibilityTraits:*MEMORY[0x263F21B28]];
  [v4 setIsAccessibilityElement:1];
  v10 = accessibilityLocalizedString(@"media.background.ios.view.hint");
  [v4 setAccessibilityHint:v10];
}

- (void)_axPostPIPStoppedNotification
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:AXPIPStoppedNotification object:self];
}

- (AVPictureInPicturePlatformAdapterAccessibility)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  v2 = [(AVPictureInPicturePlatformAdapterAccessibility *)&v4 init];
  [(AVPictureInPicturePlatformAdapterAccessibility *)v2 _accessibilityLoadAccessibilityInformation];
  return v2;
}

- (void)startPictureInPicture
{
  v2.receiver = self;
  v2.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  [(AVPictureInPicturePlatformAdapterAccessibility *)&v2 startPictureInPicture];
}

- (void)pictureInPictureViewControllerViewDidAppear:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  [(AVPictureInPicturePlatformAdapterAccessibility *)&v8 pictureInPictureViewControllerViewDidAppear:a3];
  [(AVPictureInPicturePlatformAdapterAccessibility *)self _accessibilityLoadAccessibilityInformation];
  objc_super v4 = [(AVPictureInPicturePlatformAdapterAccessibility *)self safeValueForKey:@"pictureInPictureViewController"];
  v5 = [v4 safeValueForKey:@"view"];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v5);
  if ([(AVPictureInPicturePlatformAdapterAccessibility *)self _axIsPictureInPictureActive])
  {
    v6 = @"pip.swapped.announcement";
  }
  else
  {
    v6 = @"pip.displayed.announcement";
  }
  v7 = accessibilityLocalizedString(v6);
  UIAccessibilitySpeakAndDoNotBeInterrupted();
}

- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapterAccessibility;
  [(AVPictureInPicturePlatformAdapterAccessibility *)&v4 pictureInPictureViewControllerViewWillDisappear:a3];
  [(AVPictureInPicturePlatformAdapterAccessibility *)self _axPostPIPStoppedNotification];
}

@end