@interface ListTodayCardCollectionViewCell
- (BOOL)isDragging;
- (NSArray)accessibilityElements;
- (_TtC20ProductPageExtension31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)_continuousCornerRadius;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)applyContentSizeCategoryUpdates;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityElements:(id)isa;
- (void)setDragging:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation ListTodayCardCollectionViewCell

- (_TtC20ProductPageExtension31ListTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31ListTodayCardCollectionViewCell *)sub_1005510A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isDragging
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ListTodayCardCollectionViewCell *)&v3 isDragging];
}

- (void)setDragging:(BOOL)a3
{
  v4 = self;
  sub_100552330(a3);
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  [(ListTodayCardCollectionViewCell *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_10076C930();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v10 = self;
  [(ListTodayCardCollectionViewCell *)&v14 _setContinuousCornerRadius:a3];
  v13.receiver = v10;
  v13.super_class = ObjectType;
  [(ListTodayCardCollectionViewCell *)&v13 _continuousCornerRadius];
  double v12 = v11;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for CornerStyle.continuous(_:), v6);
  sub_1005587C4((uint64_t)v9, 3, v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005527CC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100553A80();
}

- (void)applyContentSizeCategoryUpdates
{
  v2 = self;
  sub_100551918();
}

- (void)willMoveToWindow:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  id v5 = a3;
  [(ListTodayCardCollectionViewCell *)&v8 willMoveToWindow:v5];
  Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = Strong;
    sub_100556CDC(Strong);

    swift_unknownObjectWeakAssign();
  }
}

- (NSArray)accessibilityElements
{
  v2 = self;
  uint64_t v3 = sub_100557C18();

  if (v3)
  {
    v4.super.isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityElements:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_10077BED0();
    uint64_t v6 = self;
    isa = sub_10077BEC0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(ListTodayCardCollectionViewCell *)&v8 setAccessibilityElements:isa];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_labelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_lockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_topLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_trailingLockupContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_riverContainerView));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31ListTodayCardCollectionViewCell_cardStyle, &qword_10095CA88);

  swift_unknownObjectWeakDestroy();
}

@end