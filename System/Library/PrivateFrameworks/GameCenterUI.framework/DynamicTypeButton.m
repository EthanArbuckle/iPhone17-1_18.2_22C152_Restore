@interface DynamicTypeButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI17DynamicTypeButton)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17DynamicTypeButton)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DynamicTypeButton

- (_TtC12GameCenterUI17DynamicTypeButton)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17DynamicTypeButton *)sub_1AF6E53F0();
}

- (_TtC12GameCenterUI17DynamicTypeButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF6E55C0();
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3 = sub_1AF6E6230((uint64_t)self, (uint64_t)a2, (double (*)(double))sub_1AF6E5B8C);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3 = sub_1AF6E6230((uint64_t)self, (uint64_t)a2, (double (*)(double))sub_1AF6E5F88);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_1AF6E629C(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_1AF6E636C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF6E643C((uint64_t)a3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  LOBYTE(self) = sub_1AF6E6710(x, y);

  return self & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_fontUseCaseContentSizeCategory));
  sub_1AF3A4630((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_fontUseCase, (uint64_t *)&unk_1E9ACA6D0);
  double v3 = (char *)self + OBJC_IVAR____TtC12GameCenterUI17DynamicTypeButton_imageSpacing;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end