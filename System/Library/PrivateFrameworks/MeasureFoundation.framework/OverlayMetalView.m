@interface OverlayMetalView
- (_TtC17MeasureFoundation16OverlayMetalView)initWithCoder:(id)a3;
- (_TtC17MeasureFoundation16OverlayMetalView)initWithFrame:(CGRect)a3 device:(id)a4;
- (void)didSwipeWithSender:(id)a3;
- (void)drawInMTKView:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation OverlayMetalView

- (_TtC17MeasureFoundation16OverlayMetalView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_22F1A26C8();
}

- (_TtC17MeasureFoundation16OverlayMetalView)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  swift_unknownObjectRetain();
  return (_TtC17MeasureFoundation16OverlayMetalView *)sub_22F1A0A8C((uint64_t)a4, x, y, width, height);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_adWindow));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_swipeUpRecognizer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17MeasureFoundation16OverlayMetalView_swipeDownRecognizer);
}

- (void)drawInMTKView:(id)a3
{
  v4 = (MTKView *)a3;
  v5 = self;
  OverlayMetalView.draw(in:)(v4);
}

- (void)didSwipeWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22F1A196C(v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    uint64_t v9 = sub_22F223AC8();
    uint64_t v11 = v10;
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v14 = a5;
    v15 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  uint64_t v9 = 0;
  uint64_t v11 = 0;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v12 = a5;
  v13 = self;
  sub_22F224268();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_22F1A3134(&qword_2686947A0, type metadata accessor for NSKeyValueChangeKey);
    sub_22F223968();
  }
LABEL_7:
  _s17MeasureFoundation16OverlayMetalViewC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyg6ChangeI0aypGSgSvSgtF_0(v9, v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22F1A2FE4((uint64_t)v16);
}

@end