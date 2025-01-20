@interface AUDelayGraphView
- (BOOL)accessibilityActivate;
- (_TtC12CoreAudioKit16AUDelayGraphView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit16AUDelayGraphView)initWithFrame:(CGRect)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AUDelayGraphView

- (void)accessibilityIncrement
{
  v2 = self;
  sub_21E5407AC();
}

- (void)accessibilityDecrement
{
  v2 = self;
  sub_21E540998();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_21E540B84();

  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_21E543EB0();
}

- (_TtC12CoreAudioKit16AUDelayGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16AUDelayGraphView *)sub_21E5441A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16AUDelayGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16AUDelayGraphView *)sub_21E5444D8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_pointLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_accessibilityTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_accessibilityDecimalFormatter));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_dataSource;

  sub_21E544C88((uint64_t)v3);
}

@end