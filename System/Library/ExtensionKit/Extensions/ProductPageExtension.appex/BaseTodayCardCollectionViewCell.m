@interface BaseTodayCardCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BaseTodayCardCollectionViewCell

- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell *)sub_1003F32EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F685C();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003F39BC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1003F3B6C();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_1003F4244((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_shadowView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_pageGrid, &qword_100955830);
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock);

  sub_1000194B0(v3);
}

@end