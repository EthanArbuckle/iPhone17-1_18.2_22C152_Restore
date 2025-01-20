@interface CAAUEQGraphView
- (NSArray)accessibilityElements;
- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithFrame:(CGRect)a3;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)removeFromSuperview;
- (void)tintColorDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CAAUEQGraphView

- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit15CAAUEQGraphView *)sub_21E58B7D8(a3);
}

- (_TtC12CoreAudioKit15CAAUEQGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit15CAAUEQGraphView *)sub_21E58B90C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)removeFromSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAAUEQGraphView();
  id v2 = v4.receiver;
  [(CAAUEQGraphView *)&v4 removeFromSuperview];
  id v3 = objc_msgSend(self, sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_removeObserver_, v2);
}

- (void)tintColorDidChange
{
  id v2 = self;
  sub_21E58BAD8();
}

- (NSArray)accessibilityElements
{
  id v2 = self;
  uint64_t v3 = sub_21E58C120();

  if (v3)
  {
    objc_super v4 = (void *)sub_21E5B6688();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_21E53843C(0, &qword_267D37A20);
  sub_21E5382A0();
  sub_21E5B6758();
  id v6 = a4;
  v7 = self;
  v8 = (void *)sub_21E5B6748();
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for CAAUEQGraphView();
  [(CAAUEQGraphView *)&v10 touchesCancelled:v8 withEvent:v6];

  v9 = (void *)sub_21E5B6748();
  [(CAAUEQGraphView *)v7 touchesEnded:v9 withEvent:v6];

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_21E58DEC4((uint64_t)v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21E54AF98((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit15CAAUEQGraphView_dataSource, &qword_267D379A0);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit15CAAUEQGraphView_gradientLayer));

  swift_bridgeObjectRelease();
}

@end