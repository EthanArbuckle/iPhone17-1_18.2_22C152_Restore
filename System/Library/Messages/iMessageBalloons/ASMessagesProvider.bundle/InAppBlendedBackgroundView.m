@interface InAppBlendedBackgroundView
- (_TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InAppBlendedBackgroundView

- (_TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView *)sub_24CF04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D928();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_24D4A4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView_blurView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProviderP33_022B64CE79A71C516FE97B929617E74E26InAppBlendedBackgroundView_shadowView);
}

@end