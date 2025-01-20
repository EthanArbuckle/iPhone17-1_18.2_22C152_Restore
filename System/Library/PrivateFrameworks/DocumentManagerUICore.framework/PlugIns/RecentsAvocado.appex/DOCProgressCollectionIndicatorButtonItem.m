@interface DOCProgressCollectionIndicatorButtonItem
- (BOOL)isActivePopoverSource;
- (_TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem)init;
- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000683AC(0);
}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100067874(v4);
}

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView_isActivePopoverSource] = a3;
  [v3 setNeedsLayout];
}

- (_TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem)init
{
  result = (_TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_100049B74((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_1006293E0);
}

@end