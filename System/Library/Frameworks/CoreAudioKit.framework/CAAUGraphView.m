@interface CAAUGraphView
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC12CoreAudioKit13CAAUGraphView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit13CAAUGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CAAUGraphView

- (_TtC12CoreAudioKit13CAAUGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit13CAAUGraphView *)sub_21E5A3EA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit13CAAUGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit13CAAUGraphView *)sub_21E5A4170(a3);
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v6 = self;
  id v5 = [(CAAUGraphView *)v6 layer];

  if (v5 == v4) {
    (*(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v6->super.super.super.isa) + 0x380))();
  }
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return swift_dynamicCastObjCClass() != 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_gridPointSelected));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_gridPointHighlighted));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit13CAAUGraphView_guideHighlight));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end