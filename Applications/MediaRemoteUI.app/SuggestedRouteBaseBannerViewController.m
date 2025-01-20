@interface SuggestedRouteBaseBannerViewController
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (_TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController)initWithCoder:(id)a3;
- (void)actionButtonTappedWithSender:(id)a3;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
@end

@implementation SuggestedRouteBaseBannerViewController

- (_TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView) = 0;
  id v4 = a3;

  result = (_TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_100021430();
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller);
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  id v13 = [v8 metadataController];
  id v14 = [v13 artwork];

  swift_getKeyPath();
  swift_getKeyPath();
  v15 = (void (*)(uint64_t *, void))static Published.subscript.modify();
  v17 = *(void **)(v16 + 104);
  *(void *)(v16 + 104) = v14;

  v15(&v18, 0);
  swift_release();
  swift_release();
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  sub_1000217C0();
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return 1;
}

- (void)actionButtonTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100022434();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute;
  uint64_t v4 = sub_1000075A0(&qword_10005CDC0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_endpointController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView));
  v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter);
}

@end