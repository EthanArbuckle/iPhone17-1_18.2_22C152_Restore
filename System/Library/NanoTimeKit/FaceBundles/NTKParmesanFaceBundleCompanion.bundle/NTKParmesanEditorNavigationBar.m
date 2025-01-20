@interface NTKParmesanEditorNavigationBar
- (NTKParmesanEditorNavigationBar)initWithCoder:(id)a3;
- (NTKParmesanEditorNavigationBar)initWithFrame:(CGRect)a3;
- (UIButton)leadingButton;
- (UIButton)trailingButton;
- (UILabel)titleLabel;
- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)descriptionLabel;
- (void)setDescriptionLabel:(id)a3;
- (void)setLeadingButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTrailingButton:(id)a3;
@end

@implementation NTKParmesanEditorNavigationBar

- (UIButton)leadingButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___NTKParmesanEditorNavigationBar_leadingButton));
}

- (void)setLeadingButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_leadingButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_leadingButton) = (Class)a3;
  id v3 = a3;
}

- (UIButton)trailingButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___NTKParmesanEditorNavigationBar_trailingButton));
}

- (void)setTrailingButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_trailingButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_trailingButton) = (Class)a3;
  id v3 = a3;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___NTKParmesanEditorNavigationBar_titleLabel));
}

- (void)setTitleLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_titleLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_titleLabel) = (Class)a3;
  id v3 = a3;
}

- (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription)descriptionLabel
{
  return (_TtC30NTKParmesanFaceBundleCompanion29ParmesanExpandableDescription *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_descriptionLabel);
}

- (void)setDescriptionLabel:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_descriptionLabel);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_descriptionLabel) = (Class)a3;
  id v3 = a3;
}

- (NTKParmesanEditorNavigationBar)initWithFrame:(CGRect)a3
{
  return (NTKParmesanEditorNavigationBar *)sub_246BE4D04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKParmesanEditorNavigationBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_246BE6300();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___NTKParmesanEditorNavigationBar_descriptionLabel);
}

@end