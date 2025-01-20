@interface RPSessionAccessoryView
- (CGSize)intrinsicContentSize;
- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithCoder:(id)a3;
- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RPSessionAccessoryView

- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  id v5 = a3;
  v6 = sub_10002A6B4();
  uint64_t v8 = *(void *)v6;
  uint64_t v7 = *((void *)v6 + 1);
  void *v4 = v8;
  v4[1] = v7;
  swift_bridgeObjectRetain();

  result = (_TtC14ReplayKitAngel22RPSessionAccessoryView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10000AA88();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_10000AFC4();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC14ReplayKitAngel22RPSessionAccessoryView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC14ReplayKitAngel22RPSessionAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package));

  swift_bridgeObjectRelease();
}

@end