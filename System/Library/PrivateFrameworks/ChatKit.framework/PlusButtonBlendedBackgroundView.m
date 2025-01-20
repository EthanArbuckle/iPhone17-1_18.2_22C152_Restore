@interface PlusButtonBlendedBackgroundView
- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)init;
- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithCoder:(id)a3;
- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PlusButtonBlendedBackgroundView

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  v2 = -[PlusButtonBlendedBackgroundView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_18F54616C();

  return v2;
}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  id v4 = a3;
  v5 = [(PlusButtonBlendedBackgroundView *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_18F54616C();
  }
  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlusButtonBlendedBackgroundView();
  id v4 = a3;
  id v5 = v6.receiver;
  [(PlusButtonBlendedBackgroundView *)&v6 traitCollectionDidChange:v4];
  sub_18F54616C();
}

- (_TtC7ChatKitP33_3A4F9EFB16D832C5123E30AA2C9D387331PlusButtonBlendedBackgroundView)initWithFrame:(CGRect)a3
{
}

@end