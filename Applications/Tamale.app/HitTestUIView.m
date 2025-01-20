@interface HitTestUIView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC6Tamale13HitTestUIView)initWithCoder:(id)a3;
- (_TtC6Tamale13HitTestUIView)initWithFrame:(CGRect)a3;
@end

@implementation HitTestUIView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  if (*((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Tamale13HitTestUIView_shouldPassthroughUserInput) == 1)
  {
    v8 = *(uint64_t (**)(uint64_t, double, double))((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC6Tamale13HitTestUIView_isPointInside);
    if (v8)
    {
      id v9 = a4;
      v10 = self;
      uint64_t v11 = sub_10000F724((uint64_t)v8);
      unsigned __int8 v12 = v8(v11, x, y);
      sub_10000F478((uint64_t)v8);
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)type metadata accessor for HitTestUIView();
    unsigned __int8 v12 = -[HitTestUIView pointInside:withEvent:](&v14, "pointInside:withEvent:", a4, x, y);
  }
  return v12 & 1;
}

- (_TtC6Tamale13HitTestUIView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Tamale13HitTestUIView_shouldPassthroughUserInput) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Tamale13HitTestUIView_isPointInside);
  id v9 = (objc_class *)type metadata accessor for HitTestUIView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[HitTestUIView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC6Tamale13HitTestUIView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Tamale13HitTestUIView_shouldPassthroughUserInput) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6Tamale13HitTestUIView_isPointInside);
  v6 = (objc_class *)type metadata accessor for HitTestUIView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(HitTestUIView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end