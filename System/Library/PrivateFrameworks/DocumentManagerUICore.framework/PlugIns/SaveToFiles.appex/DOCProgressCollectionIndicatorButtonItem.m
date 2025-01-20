@interface DOCProgressCollectionIndicatorButtonItem
- (BOOL)isActivePopoverSource;
- (_TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem)init;
- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F3514(0);
}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000F29DC(v4);
}

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC11SaveToFiles40DOCProgressCollectionIndicatorButtonItemP33_62164D6436625E40E0E1054A9CD2E29D25ProgressItemContainerView_isActivePopoverSource] = a3;
  [v3 setNeedsLayout];
}

- (_TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem)init
{
  result = (_TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_10003D810((uint64_t)self + OBJC_IVAR____TtC11SaveToFiles40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_1006312F8);
}

@end