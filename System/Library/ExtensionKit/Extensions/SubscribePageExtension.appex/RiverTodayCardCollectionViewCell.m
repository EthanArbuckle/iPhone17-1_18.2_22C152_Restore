@interface RiverTodayCardCollectionViewCell
- (_TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RiverTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell *)sub_100090FD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(BaseTodayCardCollectionViewCell *)&v5 layoutSubviews];
  sub_1000918C0();
  sub_100091A80();
  v3 = (id *)&v2[OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_gradientView];
  swift_beginAccess();
  id v4 = *v3;
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100092EA4();
}

- (void)willMoveToWindow:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(RiverTodayCardCollectionViewCell *)&v8 willMoveToWindow:v5];
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v7 = Strong;
    sub_100092310(Strong);

    swift_unknownObjectWeakAssign();
  }
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverStyling;
  uint64_t v4 = sub_10075B000();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension32RiverTodayCardCollectionViewCell_labelsView));

  swift_unknownObjectWeakDestroy();
}

@end