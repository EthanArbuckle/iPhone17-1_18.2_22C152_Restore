@interface DMCProfileTitleTextCell
+ (id)cellIdentifier;
- (DMCProfileTitleTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)text;
- (UILabel)label;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation DMCProfileTitleTextCell

+ (id)cellIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (DMCProfileTitleTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)DMCProfileTitleTextCell;
  v4 = [(DMCProfileTitleTextCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(DMCProfileTitleTextCell *)v4 setUserInteractionEnabled:0];
    uint64_t v6 = objc_opt_new();
    label = v5->_label;
    v5->_label = (UILabel *)v6;

    [(UILabel *)v5->_label setNumberOfLines:0];
    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_label setTextAlignment:1];
    v8 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D2F0]];
    v9 = (void *)MEMORY[0x263F81708];
    v10 = [v8 fontDescriptorWithSymbolicTraits:2];
    v11 = [v9 fontWithDescriptor:v10 size:34.0];

    [(UILabel *)v5->_label setFont:v11];
    v12 = [(DMCProfileTitleTextCell *)v5 contentView];
    [v12 addSubview:v5->_label];

    v13 = [MEMORY[0x263F1C550] clearColor];
    [(DMCProfileTitleTextCell *)v5 setBackgroundColor:v13];

    v14 = [MEMORY[0x263F1C550] clearColor];
    v15 = [(DMCProfileTitleTextCell *)v5 contentView];
    [v15 setBackgroundColor:v14];

    v24 = @"label";
    v25[0] = v5->_label;
    v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", 0x4030000000000000, 0x4030000000000000);
    v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v17 options:0 metrics:0 views:v16];
    v19 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:0 views:v16];
    v20 = [(DMCProfileTitleTextCell *)v5 contentView];
    [v20 addConstraints:v18];

    v21 = [(DMCProfileTitleTextCell *)v5 contentView];
    [v21 addConstraints:v19];
  }
  return v5;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCProfileTitleTextCell *)self label];
  [v5 setText:v4];
}

- (NSString)text
{
  v2 = [(DMCProfileTitleTextCell *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end