@interface BuddyTableSectionHeaderView
- (BuddyTableSectionHeaderView)initWithPadding:(UIEdgeInsets)a3;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)padding;
- (UILabel)sectionLabel;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSectionLabel:(id)a3;
@end

@implementation BuddyTableSectionHeaderView

- (BuddyTableSectionHeaderView)initWithPadding:(UIEdgeInsets)a3
{
  *((void *)&v25 + 1) = *(void *)&a3.left;
  *(CGFloat *)&long long v25 = a3.top;
  *(CGFloat *)&long long v26 = a3.bottom;
  *((void *)&v26 + 1) = *(void *)&a3.right;
  SEL v23 = a2;
  id location = 0;
  v22.receiver = self;
  v22.super_class = (Class)BuddyTableSectionHeaderView;
  id location = [(BuddyTableSectionHeaderView *)&v22 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    v3 = (char *)location + 16;
    long long v4 = v25;
    *((_OWORD *)location + 2) = v26;
    _OWORD *v3 = v4;
    id v5 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v6 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v5;

    [*((id *)location + 1) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 1) setNumberOfLines:0];
    [location addSubview:*((void *)location + 1)];
    id v21 = [*((id *)location + 1) leadingAnchor];
    id v20 = [location leadingAnchor];
    id v19 = [v21 constraintEqualToAnchor:*((double *)&v25 + 1)];
    v27[0] = v19;
    id v7 = [*((id *)location + 1) trailingAnchor];
    id v8 = [location trailingAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8 constant:*((double *)&v26 + 1)];
    v27[1] = v9;
    id v10 = [*((id *)location + 1) topAnchor];
    id v11 = [location topAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11 constant:*(double *)&v25];
    v27[2] = v12;
    id v13 = [*((id *)location + 1) bottomAnchor];
    id v14 = [location bottomAnchor];
    id v15 = [v13 constraintEqualToAnchor:v14 constant:-*(double *)&v26];
    v27[3] = v15;
    v16 = +[NSArray arrayWithObjects:v27 count:4];
    +[NSLayoutConstraint activateConstraints:v16];
  }
  v17 = (BuddyTableSectionHeaderView *)location;
  objc_storeStrong(&location, 0);
  return v17;
}

- (CGSize)intrinsicContentSize
{
  [(BuddyTableSectionHeaderView *)self bounds];
  v2 = [(BuddyTableSectionHeaderView *)self sectionLabel];
  [(UILabel *)v2 intrinsicContentSize];
  [(BuddyTableSectionHeaderView *)self padding];
  [(BuddyTableSectionHeaderView *)self padding];
  sub_10013E34C();
  double v8 = v3;
  double v9 = v4;

  double v5 = v8;
  double v6 = v9;
  result.height = v6;
  result.width = v5;
  return result;
}

- (UILabel)sectionLabel
{
  return self->_sectionLabel;
}

- (void)setSectionLabel:(id)a3
{
}

- (UIEdgeInsets)padding
{
  double left = self->_padding.left;
  double top = self->_padding.top;
  double right = self->_padding.right;
  double bottom = self->_padding.bottom;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void).cxx_destruct
{
}

@end