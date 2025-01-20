@interface EmergencyWebRTCViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSize;
- (EmergencyWebRTCViewController)initWithCoder:(id)a3;
- (EmergencyWebRTCViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)flashButtonTapped;
- (void)flipCameraButtonTapped;
- (void)pinch:(id)a3;
- (void)recentMessageViewTapped;
- (void)requestCancel;
- (void)requestContinue;
- (void)rttAudioRouteButtonTapped;
- (void)rttCallControlsButtonTapped;
- (void)rttVideoButtonTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateCallStatus;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)zoomButtonTapped;
@end

@implementation EmergencyWebRTCViewController

- (void)rttAudioRouteButtonTapped
{
  v2 = self;
  sub_100124CA8();
}

- (void)rttCallControlsButtonTapped
{
  v2 = self;
  sub_100124FA4(3);
}

- (void)rttVideoButtonTapped
{
  v2 = self;
  sub_100124EF8();
}

- (void)recentMessageViewTapped
{
  v2 = self;
  sub_100124FA4(4);
}

- (CGSize)preferredContentSize
{
  v2 = self;
  sub_100125C14();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (EmergencyWebRTCViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10014CBE0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10014D2E4();
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4 = self;
  sub_10014D368(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10014D4B0((uint64_t)a3);
}

- (void)updateCallStatus
{
  v2 = self;
  sub_10014DA1C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)flashButtonTapped
{
  v2 = self;
  sub_100151018();
}

- (void)flipCameraButtonTapped
{
  v2 = self;
  sub_100155A3C();
}

- (void)zoomButtonTapped
{
  v2 = self;
  sub_1001561D8();
}

- (void)pinch:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100156AA0(v4);
}

- (EmergencyWebRTCViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100157B08();
}

- (void).cxx_destruct
{
  sub_1001443AC((uint64_t)self + OBJC_IVAR___EmergencyWebRTCViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_webViewEventsHelper));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_videoStreamingRequest));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_actionButtonsWaitingView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonBottomAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonRTTBottomAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_webViewRTCViewControllerWaitingStataTopAnchor));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_waitingStateSubtitlelabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___liveLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___callNumberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___webRTCQualityLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flashButtonBackdropView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttAudioRouteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttCallControlsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController____lazy_storage___rttVideoButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_cameraStateBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_webViewPlaceHolderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_exclamationImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_titleLabelScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_titleLabelScrollViewContentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_viewControllerWaitingStateHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWaitingStateTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWaitingStateTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonSharingStateBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonSharingStateTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flipCameraButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_zoomButtonWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___EmergencyWebRTCViewController_flashButtonWidthConstraint));

  swift_bridgeObjectRelease();
}

- (void)requestCancel
{
  v2 = self;
  sub_100157EB4("EnhancedEmergency: video streaming request cancelled, request to remove webview", (SEL *)&selRef_cancelVideoStreamingRequest);
}

- (void)requestContinue
{
  v2 = self;
  sub_100157EB4("EnhancedEmergency: video streaming request continued, request to start streaming video", (SEL *)&selRef_continueVideoStreamingRequest);
}

@end