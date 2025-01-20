@interface NavigationBarPalettePresenter.PaletteContentView
- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithCoder:(id)a3;
- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation NavigationBarPalettePresenter.PaletteContentView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_s18PaletteContentViewCMa();
  v2 = (char *)v5.receiver;
  [(NavigationBarPalettePresenter.PaletteContentView *)&v5 layoutSubviews];
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews];
  if (v3)
  {
    uint64_t v4 = swift_retain();
    v3(v4);
    sub_10001A4D0((uint64_t)v3);
  }
}

- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews);
  v9 = (objc_class *)_s18PaletteContentViewCMa();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[NavigationBarPalettePresenter.PaletteContentView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView)initWithCoder:(id)a3
{
  objc_super v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews);
  v6 = (objc_class *)_s18PaletteContentViewCMa();
  *objc_super v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(NavigationBarPalettePresenter.PaletteContentView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtCC22SubscribePageExtension29NavigationBarPalettePresenter18PaletteContentView_didLayoutSubviews));
}

@end