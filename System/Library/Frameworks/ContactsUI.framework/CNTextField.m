@interface CNTextField
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNTextField)initWithFrame:(CGRect)a3;
@end

@implementation CNTextField

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  v5.receiver = self;
  v5.super_class = (Class)CNTextField;
  [(CNTextField *)&v5 intrinsicContentSize];
  double v4 = v2;
  result.height = v3;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = CNUILogContactCard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "%@ did not use fast-path for sizing", buf, 0xCu);
  }

  v9.receiver = self;
  v9.super_class = (Class)CNTextField;
  -[CNTextField sizeThatFits:](&v9, sel_sizeThatFits_, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 0;
}

- (CNTextField)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNTextField;
  double v3 = -[CNTextField initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v5 = v3;
  if (v3)
  {
    LODWORD(v4) = *MEMORY[0x1E4F4BEE0];
    -[CNTextField setLayoutSize:withContentPriority:](v3, "setLayoutSize:withContentPriority:", 20.0, *MEMORY[0x1E4F4BEC8], v4);
  }
  return v5;
}

@end