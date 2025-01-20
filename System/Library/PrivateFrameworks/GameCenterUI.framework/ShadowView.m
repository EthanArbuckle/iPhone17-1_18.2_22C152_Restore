@interface ShadowView
- (_TtC12GameCenterUI10ShadowView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI10ShadowView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShadowView

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF76A5B0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF76A778(a3);
}

- (_TtC12GameCenterUI10ShadowView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI10ShadowView *)sub_1AF76A884();
}

- (_TtC12GameCenterUI10ShadowView)initWithCoder:(id)a3
{
  return (_TtC12GameCenterUI10ShadowView *)sub_1AF76A938(a3);
}

- (void).cxx_destruct
{
}

@end