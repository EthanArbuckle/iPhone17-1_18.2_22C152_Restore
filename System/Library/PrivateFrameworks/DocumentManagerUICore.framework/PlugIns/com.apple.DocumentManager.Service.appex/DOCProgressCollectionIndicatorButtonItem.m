@interface DOCProgressCollectionIndicatorButtonItem
- (BOOL)isActivePopoverSource;
- (_TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem)init;
- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3;
- (void)progressIndicatorViewDidReceiveTap:(id)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem

- (void)progressIndicatorViewDidChangeCombinedProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003BD60C(0);
}

- (void)progressIndicatorViewDidReceiveTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003BCAD4(v4);
}

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_isActivePopoverSource) = a3;
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_containerView);
  v3[OBJC_IVAR____TtCC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItemP33_E1AC084A67264A277C443B7EBBBF6E6325ProgressItemContainerView_isActivePopoverSource] = a3;
  [v3 setNeedsLayout];
}

- (_TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem)init
{
  result = (_TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_widthConstraint));
  sub_10003B3B8((uint64_t)self+ OBJC_IVAR____TtC33com_apple_DocumentManager_Service40DOCProgressCollectionIndicatorButtonItem_inFlightVisibilityChange, &qword_10063B0F0);
}

@end