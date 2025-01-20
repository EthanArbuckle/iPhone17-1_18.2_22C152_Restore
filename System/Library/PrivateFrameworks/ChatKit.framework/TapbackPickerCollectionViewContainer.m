@interface TapbackPickerCollectionViewContainer
- (void)layoutSubviews;
@end

@implementation TapbackPickerCollectionViewContainer

- (void)layoutSubviews
{
  v2 = self;
  sub_18F76EE14();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_parentMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_centerMask));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_leadingGradientLayer));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit36TapbackPickerCollectionViewContainer_trailingGradientLayer);
}

@end