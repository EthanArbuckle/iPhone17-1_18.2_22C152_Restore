@interface BaseTodayCardCollectionViewCell
- (BOOL)_disableRasterizeInAnimations;
- (_TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation BaseTodayCardCollectionViewCell

- (_TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell *)sub_285868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_28906C();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_285F38();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_2860E8();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v10 = sub_2867C0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell_shadowView));
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell_pageGrid, (uint64_t *)&unk_95C520);
  swift_weakDestroy();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC18ASMessagesProvider31BaseTodayCardCollectionViewCell_impressionsUpdateBlock);

  sub_13308(v3);
}

@end