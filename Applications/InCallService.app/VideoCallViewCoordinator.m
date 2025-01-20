@interface VideoCallViewCoordinator
- (BOOL)hasPresentedFullScreenCallUI;
- (BOOL)isAlertAvailable;
- (BOOL)isAmbient;
- (BOOL)isMultiwayViewControllerShowingInMiniWindow;
- (BOOL)isPresentingFullScreenCallUI;
- (BOOL)isShownAboveCoverSheet;
- (BOOL)wantsStandardControls;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)inCallSceneSessionIdentifier;
- (UIImage)audioRouteGlyphForDevice;
- (_TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator)init;
- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4;
- (id)audioRouteMenu;
- (id)bottomControlsViewForViewController:(id)a3;
- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3;
- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3;
- (void)bannerPresentationManagerShowFullscreenUI;
- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3;
- (void)dealloc;
- (void)setAudioRouteGlyphForDevice:(id)a3;
- (void)setHasPresentedFullScreenCallUI:(BOOL)a3;
- (void)setIsAmbient:(BOOL)a3;
- (void)setIsPresentingFullScreenCallUI:(BOOL)a3;
- (void)unansweredCallUIDismissed;
- (void)updateBackgroundStartPipAuthorizationState;
- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5;
- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4;
- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4;
- (void)viewControllerDidRequestAddParticipants:(id)a3;
- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3;
@end

@implementation VideoCallViewCoordinator

- (void)dealloc
{
  v2 = self;
  sub_10013A9E0();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_bannerPresentationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_viewController));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator_audioRouteGlyphForDevice);
}

- (void)viewControllerDidRequestAddParticipants:(id)a3
{
}

- (void)viewController:(id)a3 setStatusBarHidden:(BOOL)a4
{
}

- (void)viewControllerDidRequestTemporaryPreventSuspension:(id)a3
{
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantOrientationChanged:(int64_t)a4
{
}

- (void)viewController:(id)a3 fullScreenFocusedParticipantAspectRatioChanged:(CGSize)a4 participantGridIsFullScreen:(BOOL)a5
{
}

- (id)audioRouteMenu
{
  v2 = (void *)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();

  return v2;
}

- (id)audioRouteGlyphFor:(id)a3 buttonStyle:(int64_t)a4
{
  v4 = (void *)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();

  return v4;
}

- (UIImage)audioRouteGlyphForDevice
{
  v2 = sub_10013AEC8();

  return (UIImage *)v2;
}

- (void)setAudioRouteGlyphForDevice:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10013AF54((uint64_t)a3);
}

- (id)bottomControlsViewForViewController:(id)a3
{
  v3 = (void *)_s13InCallService15ScoreControllerC8delegateAA0dE8Delegate_pSgvpfi_0();

  return v3;
}

- (void)updateBackgroundStartPipAuthorizationState
{
}

- (BOOL)isMultiwayViewControllerShowingInMiniWindow
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (BOOL)isShownAboveCoverSheet
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (BOOL)wantsStandardControls
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (void)unansweredCallUIDismissed
{
}

- (BOOL)hasPresentedFullScreenCallUI
{
  return sub_10013B088() & 1;
}

- (void)setHasPresentedFullScreenCallUI:(BOOL)a3
{
}

- (BOOL)isPresentingFullScreenCallUI
{
  return sub_10013B0F8() & 1;
}

- (void)setIsPresentingFullScreenCallUI:(BOOL)a3
{
}

- (BOOL)isAmbient
{
  return sub_10013B168() & 1;
}

- (void)setIsAmbient:(BOOL)a3
{
}

- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  FactoryOutcome.rawValue.getter(sub_100138B58, v4);

  swift_release();
}

- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3
{
  uint64_t v4 = sub_10011EB3C(&qword_100321178);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v9 = 1;
  }
  sub_10011EB80((uint64_t)v7, v9, 1, v8);
  FactoryOutcome.rawValue.getter(v7, v10);
  sub_10013C174((uint64_t)v7, &qword_100321178);
}

- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  FactoryOutcome.rawValue.getter(v7, v8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (void)bannerPresentationManagerShowFullscreenUI
{
}

- (NSString)inCallSceneSessionIdentifier
{
  sub_10013B458();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (NSSet)backgroundActivitiesToSuppress
{
  variable initialization expression of AudioControlService.cancellables();
  type metadata accessor for STBackgroundActivityIdentifier(0);
  sub_10013C12C(&qword_100321A40, type metadata accessor for STBackgroundActivityIdentifier);
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (BOOL)isAlertAvailable
{
  return UniqueAddress.init()()._placeholder & 1;
}

- (_TtC13InCallServiceP33_54F15DC26ECDE4E093E20EA054ADA2B524VideoCallViewCoordinator)init
{
}

@end