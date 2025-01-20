@interface RiverTodayCardCollectionViewCell
- (_TtC20ProductPageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RiverTodayCardCollectionViewCell

- (_TtC20ProductPageExtension32RiverTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension32RiverTodayCardCollectionViewCell *)sub_10069B68C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(BaseTodayCardCollectionViewCell *)&v5 layoutSubviews];
  sub_10069BF64();
  sub_10069C124();
  v3 = (id *)&v2[OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_gradientView];
  swift_beginAccess();
  id v4 = *v3;
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10069D548();
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
    sub_10069C9B4(Strong);

    swift_unknownObjectWeakAssign();
  }
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverStyling;
  uint64_t v4 = sub_10076F500();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_riverContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension32RiverTodayCardCollectionViewCell_labelsView));

  swift_unknownObjectWeakDestroy();
}

@end