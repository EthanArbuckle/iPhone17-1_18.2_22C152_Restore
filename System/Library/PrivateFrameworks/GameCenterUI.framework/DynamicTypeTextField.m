@interface DynamicTypeTextField
- (BOOL)jet_isTextExtraTall;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIEdgeInsets)jet_languageAwareOutsets;
- (UIFont)font;
- (_TtC12GameCenterUI20DynamicTypeTextField)initWithCoder:(id)a3;
- (_TtC12GameCenterUI20DynamicTypeTextField)initWithFrame:(CGRect)a3;
- (int64_t)jet_textLength;
- (int64_t)textAlignment;
- (void)setFont:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeTextField

- (BOOL)jet_isTextExtraTall
{
  v2 = self;
  char v3 = sub_1AF40B0CC();

  return v3 & 1;
}

- (UIEdgeInsets)jet_languageAwareOutsets
{
  v2 = self;
  sub_1AF40B24C();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (int64_t)jet_textLength
{
  v2 = self;
  int64_t v3 = sub_1AF40B30C();

  return v3;
}

- (UIFont)font
{
  v2 = self;
  id v3 = sub_1AF7302AC();

  return (UIFont *)v3;
}

- (void)setFont:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF730354(a3);
}

- (int64_t)textAlignment
{
  v2 = self;
  id v3 = sub_1AF730424();

  return (int64_t)v3;
}

- (void)setTextAlignment:(int64_t)a3
{
  double v4 = self;
  sub_1AF7304B0(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF730620(a3);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_1AF730928((uint64_t)a4, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  swift_unknownObjectRelease();

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3 = sub_1AF730B80();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3 = sub_1AF730B80();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (_TtC12GameCenterUI20DynamicTypeTextField)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI20DynamicTypeTextField *)sub_1AF730BEC();
}

- (_TtC12GameCenterUI20DynamicTypeTextField)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI20DynamicTypeTextField *)sub_1AF730CC4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI20DynamicTypeTextField_fontUseCaseContentSizeCategory));
  sub_1AF3A4630((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI20DynamicTypeTextField_fontUseCase, (uint64_t *)&unk_1E9ACA6D0);
}

@end