@interface HRProviderNotFoundView
- (HRProviderNotFoundView)initWithCoder:(id)a3;
- (HRProviderNotFoundView)initWithFrame:(CGRect)a3;
@end

@implementation HRProviderNotFoundView

- (HRProviderNotFoundView)initWithFrame:(CGRect)a3
{
  return (HRProviderNotFoundView *)ProviderNotFoundView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (HRProviderNotFoundView)initWithCoder:(id)a3
{
  result = (HRProviderNotFoundView *)sub_1C25505F0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HRProviderNotFoundView_providerStatusLabel);
}

@end