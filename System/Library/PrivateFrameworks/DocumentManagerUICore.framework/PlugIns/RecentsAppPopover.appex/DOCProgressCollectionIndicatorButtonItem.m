@interface DOCProgressCollectionIndicatorButtonItem
- (BOOL)isActivePopoverSource;
- (_TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem)init;
- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10033F104(0);
}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10033E5CC(v4);
}

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItemP33_E5C8BA503D4D7A0A0852519FE063240025ProgressItemContainerView_isActivePopoverSource] = a3;
  [v3 setNeedsLayout];
}

- (_TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem)init
{
  result = (_TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_1000516C4((uint64_t)self+ OBJC_IVAR____TtC17RecentsAppPopover40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_100625560);
}

@end