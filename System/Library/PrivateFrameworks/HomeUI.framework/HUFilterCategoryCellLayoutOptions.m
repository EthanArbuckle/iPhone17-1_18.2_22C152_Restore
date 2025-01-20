@interface HUFilterCategoryCellLayoutOptions
+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3;
- (UIFont)primaryTextFont;
- (UIFont)secondaryTextFont;
- (double)cellHeight;
- (double)iconToTextPadding;
- (double)innerBottomMargin;
- (double)innerLeadingMargin;
- (double)innerTopMargin;
- (double)innerTrailingMargin;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setIconToTextPadding:(double)a3;
- (void)setInnerBottomMargin:(double)a3;
- (void)setInnerLeadingMargin:(double)a3;
- (void)setInnerTopMargin:(double)a3;
- (void)setInnerTrailingMargin:(double)a3;
- (void)setPrimaryTextFont:(id)a3;
- (void)setSecondaryTextFont:(id)a3;
@end

@implementation HUFilterCategoryCellLayoutOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTextFont, 0);

  objc_storeStrong((id *)&self->_primaryTextFont, 0);
}

+ (id)defaultOptionsForCellSizeSubclass:(int64_t)a3
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUFilterCategoryCellLayoutOptions;
  v3 = objc_msgSendSuper2(&v8, sel_defaultOptionsForCellSizeSubclass_, a3);
  [v3 setIconSize:24.0];
  [v3 setIconToTextPadding:6.0];
  [v3 setInnerTopMargin:5.0];
  [v3 setInnerBottomMargin:5.0];
  [v3 setInnerLeadingMargin:10.0];
  [v3 setInnerTrailingMargin:20.0];
  uint64_t v4 = *MEMORY[0x1E4F43890];
  v5 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:*MEMORY[0x1E4F43890] weight:*MEMORY[0x1E4F43930]];
  [v3 setPrimaryTextFont:v5];

  v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:v4];
  [v3 setSecondaryTextFont:v6];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUFilterCategoryCellLayoutOptions;
  id v4 = [(HUGridCellLayoutOptions *)&v8 copyWithZone:a3];
  [(HUFilterCategoryCellLayoutOptions *)self iconToTextPadding];
  objc_msgSend(v4, "setIconToTextPadding:");
  [(HUFilterCategoryCellLayoutOptions *)self innerTopMargin];
  objc_msgSend(v4, "setInnerTopMargin:");
  [(HUFilterCategoryCellLayoutOptions *)self innerBottomMargin];
  objc_msgSend(v4, "setInnerBottomMargin:");
  [(HUFilterCategoryCellLayoutOptions *)self innerLeadingMargin];
  objc_msgSend(v4, "setInnerLeadingMargin:");
  [(HUFilterCategoryCellLayoutOptions *)self innerTrailingMargin];
  objc_msgSend(v4, "setInnerTrailingMargin:");
  v5 = [(HUFilterCategoryCellLayoutOptions *)self primaryTextFont];
  [v4 setPrimaryTextFont:v5];

  v6 = [(HUFilterCategoryCellLayoutOptions *)self secondaryTextFont];
  [v4 setSecondaryTextFont:v6];

  return v4;
}

- (void)setSecondaryTextFont:(id)a3
{
}

- (void)setPrimaryTextFont:(id)a3
{
}

- (void)setInnerTrailingMargin:(double)a3
{
  self->_innerTrailingMargin = a3;
}

- (void)setInnerTopMargin:(double)a3
{
  self->_innerTopMargin = a3;
}

- (void)setInnerLeadingMargin:(double)a3
{
  self->_innerLeadingMargin = a3;
}

- (void)setInnerBottomMargin:(double)a3
{
  self->_innerBottomMargin = a3;
}

- (void)setIconToTextPadding:(double)a3
{
  self->_iconToTextPadding = a3;
}

- (double)innerTrailingMargin
{
  return self->_innerTrailingMargin;
}

- (double)innerLeadingMargin
{
  return self->_innerLeadingMargin;
}

- (double)iconToTextPadding
{
  return self->_iconToTextPadding;
}

- (double)cellHeight
{
  [(HUFilterCategoryCellLayoutOptions *)self innerTopMargin];
  double v4 = v3;
  [(HUGridCellLayoutOptions *)self iconSize];
  double v6 = v5;
  v7 = [(HUFilterCategoryCellLayoutOptions *)self primaryTextFont];
  [v7 lineHeight];
  double v9 = v8 + 2.0;
  v10 = [(HUFilterCategoryCellLayoutOptions *)self secondaryTextFont];
  [v10 lineHeight];
  double v12 = v9 + v11;

  if (v6 >= v12) {
    double v13 = v6;
  }
  else {
    double v13 = v12;
  }
  double v14 = v4 + v13;
  [(HUFilterCategoryCellLayoutOptions *)self innerBottomMargin];
  return v15 + v14;
}

- (UIFont)secondaryTextFont
{
  return self->_secondaryTextFont;
}

- (UIFont)primaryTextFont
{
  return self->_primaryTextFont;
}

- (double)innerTopMargin
{
  return self->_innerTopMargin;
}

- (double)innerBottomMargin
{
  return self->_innerBottomMargin;
}

@end