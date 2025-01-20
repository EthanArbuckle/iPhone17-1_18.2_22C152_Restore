@interface CarouselItemModulePlatterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension29CarouselItemModulePlatterView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29CarouselItemModulePlatterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemModulePlatterView

- (_TtC20ProductPageExtension29CarouselItemModulePlatterView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29CarouselItemModulePlatterView *)sub_10023E330(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29CarouselItemModulePlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10023FB20();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10023E8D4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10023EEA8(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29CarouselItemModulePlatterView_materialbackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29CarouselItemModulePlatterView_lockupCollectionView));
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension29CarouselItemModulePlatterView_displayOptions;
  uint64_t v4 = sub_1007736C0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension29CarouselItemModulePlatterView_selectionHandler);

  sub_1000194B0(v5);
}

@end