@interface DMCProfileInfoTextCell
+ (id)cellIdentifier;
- (DMCProfileInfoTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSAttributedString)attributedText;
- (NSString)text;
- (UILabel)label;
- (void)setAttributedText:(id)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
@end

@implementation DMCProfileInfoTextCell

+ (id)cellIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (DMCProfileInfoTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17[1] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)DMCProfileInfoTextCell;
  v4 = [(DMCProfileInfoTextCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    [(UILabel *)v4->_label setNumberOfLines:0];
    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(DMCProfileInfoTextCell *)v4 contentView];
    [v7 addSubview:v4->_label];

    v16 = @"label";
    v17[0] = v4->_label;
    v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"|-%f-[label]-%f-|", 0x4030000000000000, 0x4030000000000000);
    v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:v9 options:0 metrics:0 views:v8];
    v11 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:0 views:v8];
    v12 = [(DMCProfileInfoTextCell *)v4 contentView];
    [v12 addConstraints:v10];

    v13 = [(DMCProfileInfoTextCell *)v4 contentView];
    [v13 addConstraints:v11];
  }
  return v4;
}

- (NSString)text
{
  v2 = [(DMCProfileInfoTextCell *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCProfileInfoTextCell *)self label];
  [v5 setText:v4];
}

- (NSAttributedString)attributedText
{
  v2 = [(DMCProfileInfoTextCell *)self label];
  v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = [(DMCProfileInfoTextCell *)self label];
  [v5 setAttributedText:v4];
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