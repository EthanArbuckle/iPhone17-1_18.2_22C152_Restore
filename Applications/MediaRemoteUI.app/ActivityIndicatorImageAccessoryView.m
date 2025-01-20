@interface ActivityIndicatorImageAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithCoder:(id)a3;
- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ActivityIndicatorImageAccessoryView

- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_isActivityRunning) = 0;
  uint64_t v5 = OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView;
  id v6 = objc_allocWithZone((Class)UIActivityIndicatorView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivityIndicatorImageAccessoryView();
  v2 = (char *)v5.receiver;
  [(ActivityIndicatorImageAccessoryView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView];
  [v2 bounds];
  [v3 setFrame:];
  v4 = *(void **)&v2[OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView];
  [v2 bounds];
  [v4 setFrame:];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  -[ActivityIndicatorImageAccessoryView sizeThatFits:](self, "sizeThatFits:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_imageView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI35ActivityIndicatorImageAccessoryView_activityIndicatorView);
}

@end