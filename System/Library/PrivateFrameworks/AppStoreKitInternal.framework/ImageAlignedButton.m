@interface ImageAlignedButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (_TtC19AppStoreKitInternal18ImageAlignedButton)initWithCoder:(id)a3;
- (_TtC19AppStoreKitInternal18ImageAlignedButton)initWithFrame:(CGRect)a3;
- (void)didTriggerPrimaryAction:(id)a3;
@end

@implementation ImageAlignedButton

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double v3 = sub_1E1A4E314(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (double (*)(double, double, double, double))sub_1E1A4DCF4);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double v3 = sub_1E1A4E314(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_1E1A4E160);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v8 = (double *)((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_touchOutsideMargin);
  swift_beginAccess();
  double v9 = *v8;
  double v10 = v8[1];
  double v11 = v8[2];
  double v12 = v8[3];
  id v13 = a4;
  v14 = self;
  [(ImageAlignedButton *)v14 bounds];
  v21.origin.CGFloat x = v15 - v10;
  v21.origin.CGFloat y = v16 - v9;
  v21.size.width = v10 + v12 + v17;
  v21.size.height = v9 + v11 + v18;
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  LOBYTE(v8) = CGRectContainsPoint(v21, v20);

  return (char)v8;
}

- (void)didTriggerPrimaryAction:(id)a3
{
  double v5 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_primaryActionHandler);
  swift_beginAccess();
  double v6 = *v5;
  if (*v5)
  {
    id v7 = a3;
    v8 = self;
    uint64_t v9 = sub_1E160E9F0((uint64_t)v6);
    v6(v9);
    sub_1E160EDD8((uint64_t)v6);
  }
}

- (_TtC19AppStoreKitInternal18ImageAlignedButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_imageAlignment) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_imageWantsBaselineAlignment) = 0;
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_touchOutsideMargin);
  long long v9 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  _OWORD *v8 = *MEMORY[0x1E4FB2848];
  v8[1] = v9;
  double v10 = (Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_primaryActionHandler);
  double v11 = (objc_class *)type metadata accessor for ImageAlignedButton();
  *double v10 = 0;
  v10[1] = 0;
  v13.receiver = self;
  v13.super_class = v11;
  return -[ImageAlignedButton initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC19AppStoreKitInternal18ImageAlignedButton)initWithCoder:(id)a3
{
  return (_TtC19AppStoreKitInternal18ImageAlignedButton *)ImageAlignedButton.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_1E160EDD8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal18ImageAlignedButton_primaryActionHandler));
}

@end