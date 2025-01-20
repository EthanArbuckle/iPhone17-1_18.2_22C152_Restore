@interface CARPaletteSelectorView.SelectionRingView
- (_TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView)initWithCoder:(id)a3;
- (_TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)userInterfaceStyleChanged;
@end

@implementation CARPaletteSelectorView.SelectionRingView

- (void)layoutSubviews
{
  v2 = self;
  sub_10004FDF4();
}

- (_TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer;
  id v6 = objc_allocWithZone((Class)CAShapeLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)userInterfaceStyleChanged
{
  v2 = self;
  sub_10005005C();
}

- (_TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC15CarPlaySettings22CARPaletteSelectorViewP33_ABAA97FD5F3EB8BD1002BD19D9BB143117SelectionRingView_shapeLayer));
}

@end