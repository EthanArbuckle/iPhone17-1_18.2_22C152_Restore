@interface CKInlineMediaView
- (BOOL)isGenerativeAssetAppearance;
- (BOOL)showGenerativeButton;
- (_TtC7ChatKit17CKInlineMediaView)initWithCoder:(id)a3;
- (_TtC7ChatKit17CKInlineMediaView)initWithFrame:(CGRect)a3;
- (void)didTapGenerateButton:(id)a3;
- (void)layoutSubviews;
- (void)setIsGenerativeAssetAppearance:(BOOL)a3;
- (void)setShowGenerativeButton:(BOOL)a3;
@end

@implementation CKInlineMediaView

- (BOOL)isGenerativeAssetAppearance
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_isGenerativeAssetAppearance);
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_isGenerativeAssetAppearance) = a3;
  v4 = self;
  sub_18F5E5F14(a3);
}

- (BOOL)showGenerativeButton
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_showGenerativeButton);
}

- (void)setShowGenerativeButton:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_showGenerativeButton) = a3;
  v3 = self;
  sub_18F642F68();
}

- (_TtC7ChatKit17CKInlineMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit17CKInlineMediaView *)sub_18F642B8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit17CKInlineMediaView)initWithCoder:(id)a3
{
  return (_TtC7ChatKit17CKInlineMediaView *)sub_18F642D78(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F643290();
}

- (void)didTapGenerateButton:(id)a3
{
  v5 = self;
  id v6 = a3;
  v9 = self;
  id v7 = objc_msgSend(v5, sel_sharedFeatureFlags);
  LODWORD(v5) = objc_msgSend(v7, sel_isGenPlaygroundSparkleButtonEnabled);

  if (v5
    && (v8 = (void *)MEMORY[0x192FBC390]((char *)v9 + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_delegate)) != 0)
  {
    objc_msgSend(v8, sel_inlineMediaViewDidSelectGenerativeButton_, v9);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_delegate);

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7ChatKit17CKInlineMediaView_imageView);
}

@end