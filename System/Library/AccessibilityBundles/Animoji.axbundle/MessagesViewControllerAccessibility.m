@interface MessagesViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4;
- (id)_axAvatarCarousel;
- (id)_axLastUserInfoString;
- (id)_axLiveCell;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:(unint64_t)a3;
- (void)_accessibilityUpdateRecordButtonLabel;
- (void)_setAXAvatarCarousel:(id)a3;
- (void)_setAXLastUserInfoString:(id)a3;
- (void)_setAXLiveCell:(id)a3;
- (void)dismissLaunchScreenIfNecessaryForPresentationStyle:(unint64_t)a3 controller:(id)a4;
- (void)handleRecordTap:(id)a3;
- (void)hideUserInfoLabelWithDuration:(double)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)recordingDidFinish:(BOOL)a3;
- (void)showUserInfoLabelWithText:(id)a3;
- (void)updateEditButtonVisibilityForceHide:(BOOL)a3;
- (void)viewDidLoad;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation MessagesViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MessagesViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AVTAvatarListCell"];
  [v3 validateClass:@"AVTAvatar"];
  [v3 validateClass:@"AVTAnimoji"];
  [v3 validateClass:@"AVTMemoji"];
  [v3 validateClass:@"MessagesViewController" isKindOfClass:@"MSMessagesAppViewController"];
  [v3 validateClass:@"PuppetCollectionViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_confirmSendingMessageButton" withType:"UIButton"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_cancelSendingMessageButton" withType:"InsetBackgroundUIButton"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_replayMessageButton" withType:"ImageLabelButton"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_editButton" withType:"InsetBackgroundUIButton"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_recordButton" withType:"RecordButton"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_recording" withType:"BOOL"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_puppetView" withType:"AVTRecordView"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_puppetCollectionViewController" withType:"PuppetCollectionViewController"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_userInfoView" withType:"AVTUserInfoView"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_avatarListController" withType:"<AVTRecordingCarouselController>"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_avatarDataSource" withType:"AVTAvatarRecordDataSource"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_recordingDisplayView" withType:"RecordingTimeDisplayView"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_UIState" withType:"Q"];
  [v3 validateClass:@"MessagesViewController" hasInstanceVariable:@"_arSessionState" withType:"Q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPuppetView", @"mute", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTPuppetView", @"faceIsTracked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MSMessagesAppViewController", @"presentationStyle", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"displaysLaunchScreen", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"liveCell", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"addItemView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"collectionView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"recordListItems", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"displayedRecord", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarListCell", @"avatar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarListCell", @"avtView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTUserInfoView", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"RecordingTimeDisplayView", @"timerLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarPuppetRecord", @"puppetName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarRecord", @"avatarData", "@", 0);
  [v3 validateProtocol:@"AVTAvatarRecord" hasRequiredInstanceMethod:@"isEditable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PuppetCollectionViewController", @"selectedRecord", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"handleRecordTap:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"viewDidLoad", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"updateUIState:animated:", "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"observeValueForKeyPath:ofObject:change:context:", "v", "@", "@", "@", "^v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"handleSceneShortPress:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"recordingDidFinish:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"showUserInfoLabelWithText:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"hideUserInfoLabelWithDuration:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"handleResumeTrackingTap:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"willTransitionToPresentationStyle:", "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"dismissAvatarUIControllerAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"dismissLaunchScreenIfNecessaryForPresentationStyle:controller:", "v", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"updateEditButtonVisibilityForceHide:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MessagesViewController", @"shouldPerformSegueWithIdentifier:sender:", "B", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAvatarRecordDataSource", @"numberOfRecords", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"indexPathForItemClosestToCenter", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"loadRecords", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"displayAvatarForRecord:animated:", "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTMultiAvatarController", @"scrollToViewAtIndex:animated:", "v", "Q", "B", 0);
}

- (id)_axLiveCell
{
}

- (void)_setAXLiveCell:(id)a3
{
}

- (id)_axAvatarCarousel
{
}

- (void)_setAXAvatarCarousel:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v25.receiver = self;
  v25.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v25 _accessibilityLoadAccessibilityInformation];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateRecordButtonLabel];
  LOBYTE(location) = 0;
  objc_opt_class();
  id v3 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_recordButton"];
  v4 = __UIAccessibilityCastAsClass();

  [v4 setAccessibilityTraits:*MEMORY[0x263F1CF40] | *MEMORY[0x263F1CEE8]];
  v5 = accessibilityJellyfishLocalizedString(@"button.record.hint");
  [v4 setAccessibilityHint:v5];

  v6 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_confirmSendingMessageButton"];
  v7 = accessibilityJellyfishLocalizedString(@"button.send");
  [v6 setAccessibilityLabel:v7];

  v8 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_cancelSendingMessageButton"];
  v9 = accessibilityJellyfishLocalizedString(@"button.cancel");
  [v8 setAccessibilityLabel:v9];

  v10 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_replayMessageButton"];
  v11 = accessibilityJellyfishLocalizedString(@"button.replay");
  [v10 setAccessibilityLabel:v11];

  v12 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_editButton"];
  v13 = accessibilityJellyfishLocalizedString(@"button.edit");
  [v12 setAccessibilityLabel:v13];

  LOBYTE(location) = 0;
  objc_opt_class();
  v14 = [(MessagesViewControllerAccessibility *)self safeValueForKeyPath:@"_recordingDisplayView.timerLabel"];
  v15 = __UIAccessibilityCastAsClass();

  objc_initWeak(&location, v15);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __81__MessagesViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v22[3] = &unk_265103A70;
  objc_copyWeak(&v23, &location);
  [v15 _setAccessibilityLabelBlock:v22];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:[(MessagesViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"presentationStyle"]];
  v16 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_avatarListController"];
  v17 = [v16 safeUIViewForKey:@"view"];
  [v16 _accessibilityLoadAccessibilityInformation];
  objc_opt_class();
  v18 = [v16 safeValueForKeyPath:@"multiAvatarController.liveCell"];
  v19 = __UIAccessibilityCastAsClass();

  [(MessagesViewControllerAccessibility *)self _setAXLiveCell:v19];
  v20 = [(MessagesViewControllerAccessibility *)self _axAvatarCarousel];
  if (!v20 && v17)
  {
    v20 = [[AX_AvatarCarousel alloc] initWithMessagesController:self accessibilityContainer:v17];
    [(MessagesViewControllerAccessibility *)self _setAXAvatarCarousel:v20];
  }
  v21 = objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v20);
  [v17 setAccessibilityElements:v21];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

id __81__MessagesViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F21660]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = [WeakRetained text];
  v5 = (void *)[v2 initWithString:v4];

  [v5 setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];

  return v5;
}

- (void)_accessibilityUpdateRecordButtonLabel
{
  objc_opt_class();
  id v3 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_recordButton"];
  v4 = __UIAccessibilityCastAsClass();

  if ([(MessagesViewControllerAccessibility *)self safeBoolForKey:@"_recording"])v5 = @"button.record.stop"; {
  else
  }
    v5 = @"button.record.start";
  v6 = accessibilityJellyfishLocalizedString(v5);
  [v4 setAccessibilityLabel:v6];
}

- (void)_accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:(unint64_t)a3
{
  v5 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_puppetCollectionViewController"];
  id v8 = [v5 safeValueForKey:@"view"];

  unsigned int v6 = [(MessagesViewControllerAccessibility *)self safeBoolForKey:@"displaysLaunchScreen"];
  if (a3 == 1) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1;
  }
  [v8 setAccessibilityElementsHidden:v7];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v3 viewDidLoad];
  [(MessagesViewControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)handleRecordTap:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v4 handleRecordTap:a3];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateRecordButtonLabel];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"faceIsTracked"])
  {
    char v22 = 0;
    objc_opt_class();
    v13 = [(MessagesViewControllerAccessibility *)self safeValueForKeyPath:@"_avatarListController.multiAvatarController.liveCell"];
    v14 = __UIAccessibilityCastAsClass();

    v15 = [(MessagesViewControllerAccessibility *)self _axLiveCell];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      v17 = [(MessagesViewControllerAccessibility *)self safeValueForKey:@"_puppetView"];
      int v18 = [v17 safeBoolForKey:@"faceIsTracked"];

      if (v18) {
        v19 = @"face.tracking.enabled";
      }
      else {
        v19 = @"face.tracking.disabled";
      }
      v20 = accessibilityJellyfishLocalizedString(v19);
      UIAccessibilitySpeak();
    }
    else
    {
      [(MessagesViewControllerAccessibility *)self _setAXLiveCell:v14];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v21 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
}

- (void)recordingDidFinish:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v4 recordingDidFinish:a3];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateRecordButtonLabel];
}

- (id)_axLastUserInfoString
{
}

- (void)_setAXLastUserInfoString:(id)a3
{
}

- (void)showUserInfoLabelWithText:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v7 showUserInfoLabelWithText:v4];
  v5 = [(MessagesViewControllerAccessibility *)self _axLastUserInfoString];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(MessagesViewControllerAccessibility *)self _setAXLastUserInfoString:v4];
    UIAccessibilitySpeakOrQueueIfNeeded();
  }
}

- (void)hideUserInfoLabelWithDuration:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v4 hideUserInfoLabelWithDuration:a3];
  [(MessagesViewControllerAccessibility *)self _setAXLastUserInfoString:0];
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MessagesViewControllerAccessibility;
  -[MessagesViewControllerAccessibility willTransitionToPresentationStyle:](&v5, sel_willTransitionToPresentationStyle_);
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:a3];
}

- (void)dismissLaunchScreenIfNecessaryForPresentationStyle:(unint64_t)a3 controller:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v6 dismissLaunchScreenIfNecessaryForPresentationStyle:a3 controller:a4];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:a3];
}

- (void)updateEditButtonVisibilityForceHide:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MessagesViewControllerAccessibility;
  [(MessagesViewControllerAccessibility *)&v3 updateEditButtonVisibilityForceHide:a3];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MessagesViewControllerAccessibility;
  BOOL v5 = [(MessagesViewControllerAccessibility *)&v7 shouldPerformSegueWithIdentifier:a3 sender:a4];
  [(MessagesViewControllerAccessibility *)self _accessibilityUpdateCollectionViewAccessibilityForPresentationStyle:[(MessagesViewControllerAccessibility *)self safeUnsignedIntegerForKey:@"presentationStyle"]];
  return v5;
}

@end