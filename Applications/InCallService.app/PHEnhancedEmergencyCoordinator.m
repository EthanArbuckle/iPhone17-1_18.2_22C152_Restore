@interface PHEnhancedEmergencyCoordinator
- (BOOL)isShownAboveCoverSheet;
- (BOOL)mediaUploadIsOnScreen;
- (BOOL)shouldHideVideoStreamingControls;
- (BOOL)videoStreamingIsOnScreen;
- (BOOL)videoStreamingRequestHasBeenAccepted;
- (PHEnhancedEmergencyCoordinator)init;
- (TUCall)tuCall;
- (_TtP13InCallService36EnhancedEmergencyCoordinatorDelegate_)delegate;
- (id)getAudioRouteMenu;
- (int64_t)eedRTTState;
- (int64_t)getRTTState;
- (int64_t)videoStreamingState;
- (void)appWillResignActive;
- (void)cameraFacingChange:(int64_t)a3;
- (void)cameraTurnedOffForRemoteSide;
- (void)cameraTurnedOnForRemoteSide;
- (void)cancelVideoStreamingRequest;
- (void)cleanUpViewAndObjectWhenCallEnds;
- (void)continueVideoStreamingRequest;
- (void)handleBannerPreviewRequest;
- (void)handleBannerUploadRequestDismissDuringStreaming;
- (void)handleBannerUploadRequestPickerDuringStreaming;
- (void)handleDeviceLockEvent;
- (void)handleDismissRequest;
- (void)handleFatalErrorWithRetryable:(BOOL)a3;
- (void)handleJindoRequestToChoosePhoto;
- (void)handleMediaUploadButtonTapped;
- (void)handleRTTVideoStreamingButtonTapped;
- (void)notifyMitigationNeeded:(id)a3;
- (void)notifyNewRequestAvailable;
- (void)requestToReorderWebView;
- (void)runAnimationToFullScreenWebView;
- (void)setDelegate:(id)a3;
- (void)setEedRTTState:(int64_t)a3;
- (void)setShouldHideVideoStreamingControls:(BOOL)a3;
- (void)setTuCall:(id)a3;
- (void)setVideoStreamingRequestHasBeenAccepted:(BOOL)a3;
- (void)setVideoStreamingState:(int64_t)a3;
- (void)torchStateChangeTo:(BOOL)a3;
- (void)transitionToRTTState:(int64_t)a3;
- (void)updateRTTAudioRouteButton;
- (void)updateRTTEnabled:(BOOL)a3;
- (void)videoStreamQuality:(id)a3;
- (void)videoStreamingAboutToStart;
- (void)webRTCstateChange:(id)a3;
- (void)zoomLevelChange:(double)a3;
@end

@implementation PHEnhancedEmergencyCoordinator

- (_TtP13InCallService36EnhancedEmergencyCoordinatorDelegate_)delegate
{
  v2 = (void *)sub_10015C82C();

  return (_TtP13InCallService36EnhancedEmergencyCoordinatorDelegate_ *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_10015C89C();
}

- (TUCall)tuCall
{
  v2 = sub_10015C918();

  return (TUCall *)v2;
}

- (void)setTuCall:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10015C9A4((uint64_t)a3);
}

- (int64_t)videoStreamingState
{
  return sub_10015CA1C();
}

- (void)setVideoStreamingState:(int64_t)a3
{
}

- (int64_t)eedRTTState
{
  return sub_10015CAA0();
}

- (void)setEedRTTState:(int64_t)a3
{
}

- (PHEnhancedEmergencyCoordinator)init
{
  sub_10015CAE8();
  return result;
}

- (BOOL)videoStreamingIsOnScreen
{
  v2 = self;
  unsigned __int8 v3 = sub_10015D084();

  return v3 & 1;
}

- (BOOL)mediaUploadIsOnScreen
{
  v2 = self;
  unsigned __int8 v3 = sub_10015D1D8();

  return v3 & 1;
}

- (BOOL)videoStreamingRequestHasBeenAccepted
{
  return sub_10015D2B8() & 1;
}

- (void)setVideoStreamingRequestHasBeenAccepted:(BOOL)a3
{
}

- (BOOL)shouldHideVideoStreamingControls
{
  return sub_10015D328() & 1;
}

- (void)setShouldHideVideoStreamingControls:(BOOL)a3
{
  v4 = self;
  sub_10015D38C(a3);
}

- (void)cleanUpViewAndObjectWhenCallEnds
{
  v2 = self;
  sub_10015D7C8();
}

- (void)handleDeviceLockEvent
{
  v2 = self;
  sub_10015DA24();
}

- (void)handleDismissRequest
{
  v2 = self;
  sub_10015E478();
}

- (void)handleJindoRequestToChoosePhoto
{
  v2 = self;
  sub_10015E7F4();
}

- (void)handleBannerPreviewRequest
{
  v2 = self;
  sub_10015EC78();
}

- (void)handleBannerUploadRequestDismissDuringStreaming
{
  v2 = self;
  sub_10015ECD4();
}

- (void)handleBannerUploadRequestPickerDuringStreaming
{
  v2 = self;
  sub_10015EFE4();
}

- (void)handleMediaUploadButtonTapped
{
  v2 = self;
  sub_10015FE5C();
}

- (void).cxx_destruct
{
  sub_1001443AC((uint64_t)self + OBJC_IVAR___PHEnhancedEmergencyCoordinator_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PHEnhancedEmergencyCoordinator_emergencyWebRTCViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PHEnhancedEmergencyCoordinator_emegencyMediaRequestViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PHEnhancedEmergencyCoordinator_rttRecentMessageViewController));

  swift_bridgeObjectRelease();
  unsigned __int8 v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PHEnhancedEmergencyCoordinator_dataCollector);
}

- (void)requestToReorderWebView
{
  v2 = self;
  sub_10016561C();
}

- (void)videoStreamingAboutToStart
{
  v2 = self;
  sub_100165708();
}

- (void)cancelVideoStreamingRequest
{
  v2 = self;
  sub_100165930();
}

- (void)continueVideoStreamingRequest
{
  v2 = self;
  sub_100165BE4();
}

- (void)cameraTurnedOffForRemoteSide
{
  v2 = self;
  sub_100165F24();
}

- (void)cameraTurnedOnForRemoteSide
{
  v2 = self;
  sub_100166014("EnhancedEmergency: emergency coordinator gets notified camera is turned on for remote side, going to remove intermittent label", (SEL *)&selRef_requestToRemoveEnhancedEmergencyIntermittentStateLabel);
}

- (void)runAnimationToFullScreenWebView
{
  v2 = self;
  sub_100166178();
}

- (void)handleFatalErrorWithRetryable:(BOOL)a3
{
  unsigned __int8 v3 = self;
  sub_100166358();
}

- (void)videoStreamQuality:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10016654C();
}

- (void)zoomLevelChange:(double)a3
{
}

- (void)torchStateChangeTo:(BOOL)a3
{
  id v4 = self;
  sub_100166658(a3);
}

- (void)webRTCstateChange:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10016670C();
}

- (void)cameraFacingChange:(int64_t)a3
{
  unsigned __int8 v3 = self;
  sub_1001667C8();
}

- (void)notifyNewRequestAvailable
{
  v2 = self;
  sub_100168BE8();
}

- (void)notifyMitigationNeeded:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100168E18(v4);
}

- (void)handleRTTVideoStreamingButtonTapped
{
  v2 = self;
  sub_10016B5D4();
}

- (int64_t)getRTTState
{
  return sub_10016B684();
}

- (void)updateRTTEnabled:(BOOL)a3
{
  id v4 = self;
  sub_10016B6BC(a3);
}

- (void)transitionToRTTState:(int64_t)a3
{
  id v4 = self;
  sub_10016B8E0(a3);
}

- (void)appWillResignActive
{
  v2 = self;
  sub_10016C6FC();
}

- (id)getAudioRouteMenu
{
  v2 = self;
  id v3 = sub_10016C838();

  return v3;
}

- (void)updateRTTAudioRouteButton
{
  v2 = self;
  sub_10016C8E0();
}

- (BOOL)isShownAboveCoverSheet
{
  v2 = self;
  char v3 = sub_10016C994();

  return v3 & 1;
}

@end