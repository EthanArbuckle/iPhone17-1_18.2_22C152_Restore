@interface CNContactDowntimeView
+ (id)lockImageAttachment;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContactDowntimeView)initWithFrame:(CGRect)a3;
- (NSDictionary)ab_textAttributes;
- (NSTextAttachment)imageAttachment;
- (UILabel)downtimeLabel;
- (int64_t)elements;
- (void)invalidateIntrinsicContentSize;
- (void)setAb_textAttributes:(id)a3;
- (void)setElements:(int64_t)a3;
- (void)updateAttributedText;
@end

@implementation CNContactDowntimeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAttachment, 0);
  objc_storeStrong((id *)&self->_downtimeLabel, 0);

  objc_storeStrong((id *)&self->_ab_textAttributes, 0);
}

- (NSTextAttachment)imageAttachment
{
  return self->_imageAttachment;
}

- (UILabel)downtimeLabel
{
  return self->_downtimeLabel;
}

- (int64_t)elements
{
  return self->_elements;
}

- (NSDictionary)ab_textAttributes
{
  return self->_ab_textAttributes;
}

- (void)setAb_textAttributes:(id)a3
{
  id v20 = a3;
  objc_storeStrong((id *)&self->_ab_textAttributes, a3);
  [(UILabel *)self->_downtimeLabel setAb_textAttributes:v20];
  v5 = [(UILabel *)self->_downtimeLabel font];
  [v5 lineHeight];
  double v7 = v6 * 0.8;

  [(NSTextAttachment *)self->_imageAttachment bounds];
  if (v9 != v7)
  {
    double v10 = v8;
    v11 = [(NSTextAttachment *)self->_imageAttachment image];
    [v11 size];
    double v13 = v12;
    double v15 = v14;

    double v16 = v13 / v15;
    v17 = [(NSTextAttachment *)self->_imageAttachment image];
    [v17 baselineOffsetFromBottom];
    double v19 = -(v18 * (v7 / v15));

    -[NSTextAttachment setBounds:](self->_imageAttachment, "setBounds:", v10, v19, v7 * v16, v7);
    [(CNContactDowntimeView *)self invalidateIntrinsicContentSize];
  }
}

- (void)invalidateIntrinsicContentSize
{
  [(UILabel *)self->_downtimeLabel invalidateIntrinsicContentSize];
  v3.receiver = self;
  v3.super_class = (Class)CNContactDowntimeView;
  [(CNContactDowntimeView *)&v3 invalidateIntrinsicContentSize];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UILabel sizeThatFits:](self->_downtimeLabel, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_downtimeLabel intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateAttributedText
{
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (([(CNContactDowntimeView *)self elements] & 2) != 0)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F28B18]);
    double v4 = CNContactsUIBundle();
    v5 = [v4 localizedStringForKey:@"DOWNTIME_CONTACT" value:&stru_1ED8AC728 table:@"Localized"];
    double v6 = (void *)[v3 initWithString:v5];
    [v9 appendAttributedString:v6];
  }
  if ([(CNContactDowntimeView *)self elements])
  {
    double v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:self->_imageAttachment];
    [v9 appendAttributedString:v7];
  }
  double v8 = [(CNContactDowntimeView *)self downtimeLabel];
  [v8 setAttributedText:v9];
}

- (void)setElements:(int64_t)a3
{
  if (self->_elements != a3)
  {
    self->_elements = a3;
    [(CNContactDowntimeView *)self updateAttributedText];
    [(CNContactDowntimeView *)self invalidateIntrinsicContentSize];
  }
}

- (CNContactDowntimeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v28[4] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)CNContactDowntimeView;
  double v7 = -[CNContactDowntimeView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    downtimeLabel = v7->_downtimeLabel;
    v7->_downtimeLabel = (UILabel *)v8;

    [(UILabel *)v7->_downtimeLabel setTextAlignment:1];
    [(UILabel *)v7->_downtimeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_downtimeLabel setNumberOfLines:0];
    uint64_t v10 = [(id)objc_opt_class() lockImageAttachment];
    imageAttachment = v7->_imageAttachment;
    v7->_imageAttachment = (NSTextAttachment *)v10;

    [(CNContactDowntimeView *)v7 addSubview:v7->_downtimeLabel];
    v26 = [(UILabel *)v7->_downtimeLabel topAnchor];
    v25 = [(CNContactDowntimeView *)v7 topAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v28[0] = v24;
    v23 = [(UILabel *)v7->_downtimeLabel bottomAnchor];
    double v12 = [(CNContactDowntimeView *)v7 bottomAnchor];
    double v13 = [v23 constraintEqualToAnchor:v12];
    v28[1] = v13;
    double v14 = [(UILabel *)v7->_downtimeLabel leftAnchor];
    double v15 = [(CNContactDowntimeView *)v7 leftAnchor];
    double v16 = [v14 constraintEqualToAnchor:v15];
    v28[2] = v16;
    v17 = [(UILabel *)v7->_downtimeLabel rightAnchor];
    double v18 = [(CNContactDowntimeView *)v7 rightAnchor];
    double v19 = [v17 constraintEqualToAnchor:v18];
    v28[3] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
    [(CNContactDowntimeView *)v7 addConstraints:v20];

    v21 = v7;
  }

  return v7;
}

+ (id)lockImageAttachment
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  [v2 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  id v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2948] scale:1];
  double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill" withConfiguration:v3];
  v5 = [v4 imageWithRenderingMode:2];
  [v2 setImage:v5];

  return v2;
}

@end