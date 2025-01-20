@interface SuggestedRouteConnectedViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)preventsAutomaticDismissal;
- (BOOL)preventsInteractiveDismissal;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC13MediaRemoteUI37SuggestedRouteConnectedViewController)initWithCoder:(id)a3;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)handleCompactOrMinimalViewTapEvent;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setPreferredHeightForBottomSafeArea:(double)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)setPreventsAutomaticDismissal:(BOOL)a3;
- (void)setPreventsInteractiveDismissal:(BOOL)a3;
@end

@implementation SuggestedRouteConnectedViewController

- (_TtC13MediaRemoteUI37SuggestedRouteConnectedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000267A4();
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_contentRole);
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredLayoutMode);
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_maximumLayoutMode);
}

- (int64_t)preferredCustomLayout
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredCustomLayout);
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier));
}

- (NSString)associatedAppBundleIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
  id v3 = self;
  id v4 = [v2 bundleIdentifierAffinity];
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_presentationBehaviors) = (Class)a3;
}

- (BOOL)preventsInteractiveDismissal
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsInteractiveDismissal) = a3;
}

- (BOOL)preventsAutomaticDismissal
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal);
}

- (void)setPreventsAutomaticDismissal:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preventsAutomaticDismissal) = a3;
}

- (UIColor)keyColor
{
  id v2 = [self systemTealColor];

  return (UIColor *)v2;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView));
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_preferredHeightForBottomSafeArea) = a3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleCompactOrMinimalViewTapEvent
{
  id v2 = self;
  sub_100023250();
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000238CC();
  sub_1000234A0();
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1000234A0();
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 96];
  v9[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                          + 80];
  v9[11] = v3;
  v9[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                          + 112];
  uint64_t v10 = *(void *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                       + 128];
  long long v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 32];
  v9[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                         + 16];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 64];
  v9[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                         + 48];
  v9[9] = v5;
  long long v6 = *(_OWORD *)&self->super.sendTapEventForAnyTapInsideView[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v9[2] = *(_OWORD *)&self->super.requesterIdentifier[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v9[3] = v6;
  long long v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute];
  v9[4] = *(_OWORD *)&self->super.idleTimer[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                          + 6];
  v9[5] = v7;
  long long v8 = *(_OWORD *)&self->super.delegate[OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute
                                      + 8];
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_suggestedRoute);
  v9[1] = v8;
  sub_100007760(v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_endpointController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_controller));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_airPlayImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_trailingAccessoryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI37SuggestedRouteConnectedViewController_elementIdentifier));
}

@end