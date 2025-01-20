@interface CKInlineMediaViewGenerateButton
- (BOOL)isGenerativeAssetAppearance;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithCoder:(id)a3;
- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setIsGenerativeAssetAppearance:(BOOL)a3;
@end

@implementation CKInlineMediaViewGenerateButton

- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithFrame:(CGRect)a3
{
  sub_18F5E5868(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7ChatKit31CKInlineMediaViewGenerateButton)initWithCoder:(id)a3
{
  sub_18F5E5B54(a3);
  return result;
}

- (BOOL)isGenerativeAssetAppearance
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_isGenerativeAssetAppearance;
  swift_beginAccess();
  return *v2;
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  v4 = self;
  sub_18F5E5F14(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F5E65D8();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8 = self;
  v9 = self;
  id v10 = a4;
  id v11 = objc_msgSend(v8, sel_sharedBehaviors);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_entryViewLinkViewDiscardButtonExtraHitTestPadding);
    double v14 = v13;

    [(CKInlineMediaViewGenerateButton *)v9 bounds];
    CGRect v18 = CGRectInset(v17, -v14, -v14);
    v16.CGFloat x = x;
    v16.CGFloat y = y;
    LOBYTE(v12) = CGRectContainsPoint(v18, v16);

    LOBYTE(v11) = (_BYTE)v12;
  }
  else
  {
    __break(1u);
  }
  return (char)v11;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_sparklesImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_buttonBGColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_buttonTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_generativeButtonBGColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit31CKInlineMediaViewGenerateButton_generativeButtonTintColor);
}

@end