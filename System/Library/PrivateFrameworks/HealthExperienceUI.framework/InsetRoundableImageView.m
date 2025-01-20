@interface InsetRoundableImageView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)tintColor;
- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithFrame:(CGRect)a3;
- (int64_t)contentMode;
- (void)layoutSubviews;
- (void)setContentMode:(int64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation InsetRoundableImageView

- (UIColor)tintColor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView), sel_tintColor);
  return (UIColor *)v2;
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)contentMode
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InsetRoundableImageView();
  return [(InsetRoundableImageView *)&v3 contentMode];
}

- (void)setContentMode:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InsetRoundableImageView();
  v4 = (char *)v6.receiver;
  [(InsetRoundableImageView *)&v6 setContentMode:a3];
  id v5 = *(id *)&v4[OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView];
  objc_msgSend(v5, sel_setContentMode_, objc_msgSend(v4, sel_contentMode, v6.receiver, v6.super_class));
}

- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *)sub_1AD68DA34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1838]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_shouldRound) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_drawsBackground) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_inset) = 0;

  result = (_TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1AD68DC14();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView);
  id v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  double v8 = v7;
  double v10 = v9;
  double v11 = *(double *)((char *)&v6->super.super.super.isa
                  + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_inset);

  double v12 = v8 + v11 + v11;
  double v13 = v10 + v11 + v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_37381F576B512AC5ABDEF79DB03BA5A523InsetRoundableImageView_imageView));
}

@end