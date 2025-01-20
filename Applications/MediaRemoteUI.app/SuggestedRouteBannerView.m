@interface SuggestedRouteBannerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)updateUserInterfaceStyle;
@end

@implementation SuggestedRouteBannerView

- (void)layoutSubviews
{
  v2 = self;
  sub_1000316A4();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView);
  id v8 = a4;
  v9 = self;
  -[SuggestedRouteBannerView convertPoint:toCoordinateSpace:](v9, "convertPoint:toCoordinateSpace:", v7, x, y);
  LOBYTE(v7) = [v7 pointInside:v8];

  return (char)v7;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SuggestedRouteBannerView();
  id v7 = v13.receiver;
  id v8 = a4;
  id v9 = -[SuggestedRouteBannerView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (!v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  sub_100008C38(0, (unint64_t *)&qword_10005DA80);
  id v11 = v7;
  id v7 = v10;
  LOBYTE(v10) = static NSObject.== infix(_:_:)();

  if (v10)
  {
LABEL_5:

    id v7 = 0;
  }

  return v7;
}

- (void)updateUserInterfaceStyle
{
  v2 = self;
  sub_100031E10();
}

- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000320AC();
}

- (_TtC13MediaRemoteUI24SuggestedRouteBannerView)initWithFrame:(CGRect)a3
{
  result = (_TtC13MediaRemoteUI24SuggestedRouteBannerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_activityRouteView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_subtitleView));
  long long v3 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 96];
  v9[10] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute
                                          + 80];
  v9[11] = v3;
  v9[12] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute
                                          + 112];
  uint64_t v10 = *(void *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 128];
  long long v4 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 32];
  v9[6] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 16];
  v9[7] = v4;
  long long v5 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 64];
  v9[8] = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute + 48];
  v9[9] = v5;
  long long v6 = *(_OWORD *)&self->titleLabelMaxWidth[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[2] = *(_OWORD *)&self->$__lazy_storage_$_titleView[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[3] = v6;
  long long v7 = *(_OWORD *)&self->suggestedRoute[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[4] = *(_OWORD *)&self->maxActivityRouteViewSide[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[5] = v7;
  long long v8 = *(_OWORD *)&self->actionButton[OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute];
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC13MediaRemoteUI24SuggestedRouteBannerView_suggestedRoute);
  v9[1] = v8;
  sub_100007760(v9);
}

@end