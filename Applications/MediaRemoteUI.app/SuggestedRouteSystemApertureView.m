@interface SuggestedRouteSystemApertureView
- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SuggestedRouteSystemApertureView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestedRouteSystemApertureView();
  v2 = (char *)v3.receiver;
  [(SuggestedRouteSystemApertureView *)&v3 layoutSubviews];
  [*(id *)&v2[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel] bounds];
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.setter();
}

- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000C508();
}

- (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView)initWithFrame:(CGRect)a3
{
  result = (_TtC13MediaRemoteUI32SuggestedRouteSystemApertureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_activityRouteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_waveformPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_bottomLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_topLabelPlayingTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelPlayingWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_routeLabelNotPlayingTrailingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  long long v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                      + 56];
  v11[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                           + 40];
  v11[11] = v3;
  v11[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                           + 72];
  uint64_t v12 = *(void *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                       + 88];
  long long v4 = *(_OWORD *)&self->waveformPackageStateNameOff[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                                   + 8];
  v11[6] = *(_OWORD *)&self->waveformPackageStateNameOn[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                                      + 8];
  v11[7] = v4;
  long long v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                      + 24];
  v11[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute
                                          + 8];
  v11[9] = v5;
  long long v6 = *(_OWORD *)&self->actionButton[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[2] = *(_OWORD *)&self->topLabel[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[3] = v6;
  long long v7 = *(_OWORD *)&self->routeLabelNotPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[4] = *(_OWORD *)&self->topLabelPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[5] = v7;
  long long v8 = *(_OWORD *)&self->routeLabel[OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute];
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView_suggestedRoute);
  v11[1] = v8;
  sub_100007760(v11);
  v9 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI32SuggestedRouteSystemApertureView__availableTitleWidth;
  uint64_t v10 = sub_1000075A0((uint64_t *)&unk_10005C360);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
}

@end