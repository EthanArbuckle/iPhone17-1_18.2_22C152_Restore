@interface RecentItemCell
- (FPItem)accessibilityItem;
- (UILabel)accessibilitySubtitle;
- (UILabel)accessibilityTitle;
- (_TtC14RecentsAvocado14RecentItemCell)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado14RecentItemCell)initWithFrame:(CGRect)a3;
- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)didMoveToWindow;
- (void)handleTap:(id)a3;
- (void)layoutSubviews;
- (void)thumbnailLoaded:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RecentItemCell

- (_TtC14RecentsAvocado14RecentItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003F46D4();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1003F1738();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003F1A30();
}

- (void)handleTap:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1004CF2A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_100112274((uint64_t)self);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_100035F60((uint64_t)v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1003F1D44(a3);
}

- (FPItem)accessibilityItem
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind);
  unsigned int v3 = self->layoutScale[OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind];
  if (v3 >= 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *v2;
    sub_1001123EC(*v2, v3);
  }
  return (FPItem *)v4;
}

- (UILabel)accessibilityTitle
{
  v2 = self;
  id v3 = sub_1003EF5A0(&OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___title, (uint64_t (*)(uint64_t))sub_1003EF604);

  return (UILabel *)v3;
}

- (UILabel)accessibilitySubtitle
{
  v2 = self;
  id v3 = sub_1003EF5A0(&OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___subtitle, (uint64_t (*)(uint64_t))sub_1003EF950);

  return (UILabel *)v3;
}

- (_TtC14RecentsAvocado14RecentItemCell)initWithFrame:(CGRect)a3
{
  result = (_TtC14RecentsAvocado14RecentItemCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___listBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_listBackgroundBlurEffect));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_thumbnailRatioConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___thumbnailContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___thumbnailView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___badge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___titleWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___subtitleWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___labelContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___title));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___titleOverlay));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell____lazy_storage___subtitle));
  swift_unknownObjectRelease();
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind);
  unsigned __int8 v4 = self->layoutScale[OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind];
  sub_100112460(v3, v4);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  *(void *)(v6 + 24) = a3;
  v9[4] = sub_1003F51A8;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1003A422C;
  v9[3] = &unk_1005D4C88;
  v7 = _Block_copy(v9);
  swift_unknownObjectRetain_n();
  v8 = self;
  swift_release();
  DOCRunInMainThread();
  _Block_release(v7);
  swift_unknownObjectRelease();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1000333C8(0, (unint64_t *)&qword_100639A70);
  sub_1003F506C();
  sub_1004CE120();
  v7 = self;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = 1;
  aBlock[4] = sub_1003F52D4;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1003A422C;
  aBlock[3] = &unk_1005D4C10;
  v9 = _Block_copy(aBlock);
  v10 = self;
  id v11 = a4;
  swift_release();
  [v7 animateWithDuration:v9 animations:0.1];
  _Block_release(v9);
  Class isa = sub_1004CE110().super.isa;
  v13.receiver = v10;
  v13.super_class = ObjectType;
  [(RecentItemCell *)&v13 touchesEnded:isa withEvent:v11];

  swift_bridgeObjectRelease();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1000333C8(0, (unint64_t *)&qword_100639A70);
  sub_1003F506C();
  uint64_t v6 = sub_1004CE120();
  id v7 = a4;
  uint64_t v8 = self;
  sub_1003F2BDC(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = self;
  sub_1003F4860(a4);

  swift_unknownObjectRelease();
  sub_1000333C8(0, (unint64_t *)&unk_100630AE0);
  v8.super.Class isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return v8.super.isa;
}

- (id)dragInteraction:(id)a3 itemsForAddingToSession:(id)a4 withTouchAtPoint:(CGPoint)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  NSArray v8 = self;
  sub_1003F4A50(a4);

  swift_unknownObjectRelease();
  sub_1000333C8(0, (unint64_t *)&unk_100630AE0);
  v9.super.Class isa = sub_1004CDE10().super.isa;
  swift_bridgeObjectRelease();
  return v9.super.isa;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  NSArray v9 = self;
  id v10 = sub_1003F4C84();

  swift_unknownObjectRelease();
  return v10;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  unsigned int v4 = self->layoutScale[OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind];
  if (v4 >= 2) {
    return 0;
  }
  id v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC14RecentsAvocado14RecentItemCell_kind);
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_1001123EC(v6, v4);
  int64_t v9 = sub_1003F3ABC();
  sub_100112460(v6, v4);

  swift_unknownObjectRelease();
  return v9;
}

@end