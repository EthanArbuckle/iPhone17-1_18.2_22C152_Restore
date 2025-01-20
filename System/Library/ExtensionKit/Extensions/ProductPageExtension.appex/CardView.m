@interface CardView
- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView)initWithFrame:(CGRect)a3;
- (void)didTapFrom:(id)a3;
@end

@implementation CardView

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView *)sub_1005FAA70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView)initWithCoder:(id)a3
{
  return (_TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView *)sub_1005FABA0(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (id)3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView_tapAction);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_1000194B0((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView_tintView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView_view));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtensionP33_9B20F844157AB3EC0D875BF73E8AAF848CardView_tapAction);

  sub_1000194B0(v3);
}

@end