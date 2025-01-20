@interface CapsuleLabelView
- (_TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView)initWithCoder:(id)a3;
- (_TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CapsuleLabelView

- (_TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView)initWithFrame:(CGRect)a3
{
  return (_TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView *)sub_246C2792C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246C297E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_246C27EE4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_subtitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC30NTKParmesanFaceBundleCompanionP33_EBF95A84E200E7A60B1CF147358B195716CapsuleLabelView_activeBackgroundColor);
}

@end