@interface BaseTodayCardCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BaseTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell *)sub_100611B68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006150BC();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100612238();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1006123E8();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_100612AC0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_shadowView));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_pageGrid, &qword_100934590);
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock);

  sub_10001A4D0(v3);
}

@end