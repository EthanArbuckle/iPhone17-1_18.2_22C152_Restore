@interface LiveListenLeadingView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC10HearingApp21LiveListenLeadingView)initWithCoder:(id)a3;
- (_TtC10HearingApp21LiveListenLeadingView)initWithFrame:(CGRect)a3;
@end

@implementation LiveListenLeadingView

- (_TtC10HearingApp21LiveListenLeadingView)initWithCoder:(id)a3
{
  return (_TtC10HearingApp21LiveListenLeadingView *)sub_100008D50(a3);
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  v4 = &OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_customElementSize;
  if (a4 != 4) {
    v4 = &OBJC_IVAR____TtC10HearingApp21LiveListenLeadingView_compressedElementSize;
  }
  v5 = (double *)((char *)self + *v4);
  double v6 = *v5;
  double v7 = v5[1];
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC10HearingApp21LiveListenLeadingView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10HearingApp21LiveListenLeadingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end