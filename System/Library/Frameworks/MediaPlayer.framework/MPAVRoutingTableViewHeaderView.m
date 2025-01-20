@interface MPAVRoutingTableViewHeaderView
- (MPAVRoutingTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (UIEdgeInsets)titleInsets;
- (void)_updateFont;
- (void)layoutSubviews;
- (void)setTitleInsets:(UIEdgeInsets)a3;
@end

@implementation MPAVRoutingTableViewHeaderView

- (void)setTitleInsets:(UIEdgeInsets)a3
{
  self->_titleInsets = a3;
}

- (UIEdgeInsets)titleInsets
{
  double top = self->_titleInsets.top;
  double left = self->_titleInsets.left;
  double bottom = self->_titleInsets.bottom;
  double right = self->_titleInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateFont
{
  id v7 = [MEMORY[0x1E4FB1798] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] maximumContentSizeCategory:*MEMORY[0x1E4FB27B8]];
  v3 = [v7 fontDescriptor];
  v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  v5 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v4 size:0.0];
  v6 = [(MPAVRoutingTableViewHeaderView *)self textLabel];
  [v6 setFont:v5];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MPAVRoutingTableViewHeaderView;
  [(MPAVRoutingTableViewHeaderView *)&v3 layoutSubviews];
  [(MPAVRoutingTableViewHeaderView *)self _updateFont];
}

- (MPAVRoutingTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPAVRoutingTableViewHeaderView;
  objc_super v3 = [(MPAVRoutingTableViewHeaderView *)&v8 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] whiteColor];
    v5 = [(MPAVRoutingTableViewHeaderView *)v3 textLabel];
    [v5 setTextColor:v4];

    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(MPAVRoutingTableViewHeaderView *)v3 setTintColor:v6];
  }
  return v3;
}

@end