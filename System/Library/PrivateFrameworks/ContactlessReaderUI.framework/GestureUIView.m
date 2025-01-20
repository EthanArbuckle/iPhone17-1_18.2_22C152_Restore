@interface GestureUIView
- (_TtC19ContactlessReaderUI13GestureUIView)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUI13GestureUIView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation GestureUIView

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_23EDDB868(x, y, width, height);
}

- (_TtC19ContactlessReaderUI13GestureUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUI13GestureUIView_drawNumberRecognizer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for GestureUIView();
  return -[GestureUIView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19ContactlessReaderUI13GestureUIView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19ContactlessReaderUI13GestureUIView_drawNumberRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GestureUIView();
  return [(GestureUIView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end