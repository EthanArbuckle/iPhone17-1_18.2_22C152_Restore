@interface AEGenerativePlaygroundButton
- (BOOL)isGenerativeAssetAppearance;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithCoder:(id)a3;
- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setIsGenerativeAssetAppearance:(BOOL)a3;
@end

@implementation AEGenerativePlaygroundButton

- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithFrame:(CGRect)a3
{
  return (_TtC13AssetExplorer28AEGenerativePlaygroundButton *)sub_22B529074(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13AssetExplorer28AEGenerativePlaygroundButton)initWithCoder:(id)a3
{
  return (_TtC13AssetExplorer28AEGenerativePlaygroundButton *)sub_22B529234(a3);
}

- (BOOL)isGenerativeAssetAppearance
{
  return sub_22B52940C() & 1;
}

- (void)setIsGenerativeAssetAppearance:(BOOL)a3
{
  v4 = self;
  sub_22B529494(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_22B529B5C();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  LOBYTE(self) = sub_22B529C40(x, y);

  return self & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_sparklesImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonBGColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_buttonTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonBGColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC13AssetExplorer28AEGenerativePlaygroundButton_generativeButtonTintColor);
}

@end