@interface MFComposeStyleSelectorButton
+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5;
+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5 maximumContentSizeCategory:(id)a6;
- (MFComposeStyleSelectorButton)initWithCoder:(id)a3;
- (MFComposeStyleSelectorButton)initWithFrame:(CGRect)a3;
- (NSString)maximumContentSizeCategory;
- (id)_imageForTextStyleType:(int64_t)a3 maximumContentSizeCategory:(id)a4;
- (int64_t)styleType;
- (void)_commonInit;
- (void)setMaximumContentSizeCategory:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFComposeStyleSelectorButton

+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5
{
  v5 = +[MFComposeStyleSelectorButton buttonWithStyleType:a3 target:a4 action:a5 maximumContentSizeCategory:*MEMORY[0x1E4FB27F0]];

  return v5;
}

+ (id)buttonWithStyleType:(int64_t)a3 target:(id)a4 action:(SEL)a5 maximumContentSizeCategory:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  v11 = +[MFComposeStyleSelectorButton buttonWithType:0];
  v11[93] = a3;
  v11[94] = v10;
  v12 = +[MFComposeTextStyle accessibilityIdenitifierForTextStyleType:a3];
  [v11 setAccessibilityIdentifier:v12];

  v13 = [v11 _imageForTextStyleType:a3 maximumContentSizeCategory:v10];
  [v11 setImage:v13 forState:0];

  [v11 addTarget:v9 action:a5 forControlEvents:64];

  return v11;
}

- (MFComposeStyleSelectorButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButton;
  v3 = -[MFComposeStyleSelectorButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MFComposeStyleSelectorButton *)v3 _commonInit];
  }
  return v4;
}

- (MFComposeStyleSelectorButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFComposeStyleSelectorButton;
  v5 = [(MFComposeStyleSelectorButton *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5) {
    [(MFComposeStyleSelectorButton *)v5 _commonInit];
  }

  return v6;
}

- (void)_commonInit
{
  id v3 = [MEMORY[0x1E4FB1618] labelColor];
  -[MFComposeStyleSelectorButton setTintColor:](self, "setTintColor:");

  id v4 = [MEMORY[0x1E4FB1618] labelColor];
  -[MFComposeStyleSelectorButton setTitleColor:forState:](self, "setTitleColor:forState:");

  id v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  -[MFComposeStyleSelectorButton setBackgroundColor:](self, "setBackgroundColor:");
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MFComposeStyleSelectorButton;
  -[MFComposeStyleSelectorButton setSelected:](&v6, sel_setSelected_);
  if (v3) {
    [MEMORY[0x1E4FB1618] mailComposeFormatButtonSelectedBackgroundColor];
  }
  else {
  id v5 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  [(MFComposeStyleSelectorButton *)self setBackgroundColor:v5];
}

- (id)_imageForTextStyleType:(int64_t)a3 maximumContentSizeCategory:(id)a4
{
  id v5 = a4;
  if (a3 != 7
    || (objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamedNumberAware:textStyle:scale:weight:maximumContentSizeCategory:", @"list.number", *MEMORY[0x1E4FB28C8], 3, 0, v5), (objc_super v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = +[MFComposeTextStyle imageNameForTextStyleType:a3];
    if (v7)
    {
      objc_super v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:textStyle:scale:weight:maximumContentSizeCategory:", v7, *MEMORY[0x1E4FB28C8], 3, 0, v5);
    }
    else
    {
      objc_super v6 = 0;
    }
  }

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFComposeStyleSelectorButton;
  [(MFComposeStyleSelectorButton *)&v10 traitCollectionDidChange:v4];
  id v5 = [(MFComposeStyleSelectorButton *)self traitCollection];
  objc_super v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    int64_t styleType = self->_styleType;
    if (styleType)
    {
      id v9 = [(MFComposeStyleSelectorButton *)self _imageForTextStyleType:styleType maximumContentSizeCategory:self->_maximumContentSizeCategory];
      [(MFComposeStyleSelectorButton *)self setImage:v9 forState:0];
    }
  }
}

- (int64_t)styleType
{
  return self->_styleType;
}

- (NSString)maximumContentSizeCategory
{
  return self->_maximumContentSizeCategory;
}

- (void)setMaximumContentSizeCategory:(id)a3
{
  self->_maximumContentSizeCategory = (NSString *)a3;
}

@end