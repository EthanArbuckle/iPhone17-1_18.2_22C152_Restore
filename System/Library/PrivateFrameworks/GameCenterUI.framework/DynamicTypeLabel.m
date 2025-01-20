@interface DynamicTypeLabel
- (NSAttributedString)attributedText;
- (UIFont)font;
- (_TtC12GameCenterUI16DynamicTypeLabel)initWithCoder:(id)a3;
- (_TtC12GameCenterUI16DynamicTypeLabel)initWithFrame:(CGRect)a3;
- (int64_t)textAlignment;
- (void)setAttributedText:(id)a3;
- (void)setFont:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeLabel

- (_TtC12GameCenterUI16DynamicTypeLabel)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI16DynamicTypeLabel *)sub_1AF4A4C0C();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4A4D48();
}

- (UIFont)font
{
  v2 = self;
  id v3 = sub_1AF4A5624((SEL *)&selRef_font);

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF4A5338(a3);
}

- (int64_t)textAlignment
{
  v2 = self;
  id v3 = sub_1AF4A54E0();

  return (int64_t)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  v4 = self;
  sub_1AF4A556C(a3);
}

- (NSAttributedString)attributedText
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  v2 = [(DynamicTypeLabel *)&v4 attributedText];

  return v2;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(DynamicTypeLabel *)v5 lineBreakMode];
  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for DynamicTypeLabel();
  [(DynamicTypeLabel *)&v7 setAttributedText:v4];
  [(DynamicTypeLabel *)v5 setLineBreakMode:v6];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1AF4A579C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_fontUseCaseContentSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_systemDesign));
  sub_1AF3A4630((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI16DynamicTypeLabel_fontUseCase, (uint64_t *)&unk_1E9ACA6D0);
}

@end