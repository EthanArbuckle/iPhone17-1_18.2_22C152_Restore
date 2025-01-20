@interface BackgroundHighlightableButton
- (BOOL)isHighlighted;
- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation BackgroundHighlightableButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BackgroundHighlightableButton();
  return [(BackgroundHighlightableButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BackgroundHighlightableButton();
  v4 = (char *)v7.receiver;
  [(BackgroundHighlightableButton *)&v7 setHighlighted:v3];
  unsigned int v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = &OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_highlightedColor;
  if (!v5) {
    v6 = &OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_regularColor;
  }
  objc_msgSend(v4, sel_setBackgroundColor_, *(void *)&v4[*v6]);
}

- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI29BackgroundHighlightableButton *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI29BackgroundHighlightableButton)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI29BackgroundHighlightableButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_regularColor));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI29BackgroundHighlightableButton_highlightedColor);
}

@end