@interface SuggestedRouteBannerTitleView
- (CGSize)intrinsicContentSize;
- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SuggestedRouteBannerTitleView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_100005F54();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SuggestedRouteBannerTitleView();
  v2 = (char *)v3.receiver;
  [(SuggestedRouteBannerTitleView *)&v3 layoutSubviews];
  [*(id *)&v2[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel] bounds];
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.setter();
}

- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100007388();
}

- (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC13MediaRemoteUI29SuggestedRouteBannerTitleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_waveformPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_leadingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_trailingLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelPlayingTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_titleLabelNotPlayingTrailingConstraint));
  long long v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 112];
  v11[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                           + 96];
  v11[11] = v3;
  v11[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                           + 128];
  uint64_t v12 = *(void *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                       + 144];
  long long v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 48];
  v11[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                          + 32];
  v11[7] = v4;
  long long v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 80];
  v11[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                          + 64];
  v11[9] = v5;
  long long v6 = *(_OWORD *)&self->titleLabelNotPlayingTrailingConstraint[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[2] = *(_OWORD *)&self->trailingLayoutGuide[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[3] = v6;
  long long v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute
                                      + 16];
  v11[4] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[5] = v7;
  long long v8 = *(_OWORD *)&self->waveformPackageView[OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute];
  v11[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView_suggestedRoute);
  v11[1] = v8;
  sub_100007760(v11);
  v9 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI29SuggestedRouteBannerTitleView__availableTitleWidth;
  uint64_t v10 = sub_1000075A0((uint64_t *)&unk_10005C360);
  (*(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
}

@end