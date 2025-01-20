@interface TodayCardSmallLockupCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension19TodayCardLockupView)accessibilityLockupView;
- (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TodayCardSmallLockupCollectionViewCell

- (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell *)sub_1000551FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for TodayCardLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView), "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(TodayCardSmallLockupCollectionViewCell *)&v13 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_100019840(0, (unint64_t *)&qword_10094EB40);
  sub_100770A80();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(TodayCardSmallLockupCollectionViewCell *)&v5 prepareForReuse];
  id v3 = objc_retain(*(id *)(*(void *)&v2[OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView]
                         + OBJC_IVAR____TtC20ProductPageExtension14BaseLockupView_artworkView));
  v6.value.super.isa = 0;
  v6.is_nil = 0;
  sub_10076C730(v6, v4);
}

- (_TtC20ProductPageExtension19TodayCardLockupView)accessibilityLockupView
{
  return (_TtC20ProductPageExtension19TodayCardLockupView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38TodayCardSmallLockupCollectionViewCell_lockupView));
}

@end