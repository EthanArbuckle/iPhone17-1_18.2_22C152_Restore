@interface CenteringCurvedTextView
- (_TtC19ComplicationDisplay23CenteringCurvedTextView)init;
- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithCoder:(id)a3;
- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CenteringCurvedTextView

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)init
{
  return -[CenteringCurvedTextView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter);
  void *v8 = 0;
  v8[1] = 0;
  id v9 = objc_allocWithZone(MEMORY[0x263F32128]);
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView) = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for CenteringCurvedTextView();
  v12 = -[CenteringCurvedTextView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  [(CenteringCurvedTextView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.isa+ OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView)];
  return v12;
}

- (_TtC19ComplicationDisplay23CenteringCurvedTextView)initWithCoder:(id)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_circleCenter);
  type metadata accessor for CenteringCurvedTextView();
  void *v3 = 0;
  v3[1] = 0;
  swift_deallocPartialClassInstance();
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_21E4175C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19ComplicationDisplay23CenteringCurvedTextView_curvedLabelView));
}

@end