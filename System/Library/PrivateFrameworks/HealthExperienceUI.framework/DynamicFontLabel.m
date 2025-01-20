@interface DynamicFontLabel
- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithFrame:(CGRect)a3;
@end

@implementation DynamicFontLabel

- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI16DynamicFontLabel *)DynamicFontLabel.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI16DynamicFontLabel)initWithCoder:(id)a3
{
  v4 = (void *)*MEMORY[0x1E4FB2998];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_textStyle) = (Class)*MEMORY[0x1E4FB2998];
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_symbolicTraits) = 2;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DynamicFontLabel();
  id v5 = v4;
  return [(DynamicFontLabel *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16DynamicFontLabel_textStyle));
}

@end