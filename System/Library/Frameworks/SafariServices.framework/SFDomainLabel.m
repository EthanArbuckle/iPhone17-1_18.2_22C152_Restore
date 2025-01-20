@interface SFDomainLabel
- (BOOL)isSecure;
- (NSString)text;
- (SFDomainLabel)initWithCoder:(id)a3;
- (SFDomainLabel)initWithFrame:(CGRect)a3;
- (SFDomainLabel)initWithText:(id)a3 isSecure:(BOOL)a4;
- (id)_makeAttributedString;
- (void)_commonInit;
- (void)setText:(id)a3 isSecure:(BOOL)a4;
@end

@implementation SFDomainLabel

- (SFDomainLabel)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFDomainLabel;
  v3 = -[SFDomainLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SFDomainLabel *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (SFDomainLabel)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SFDomainLabel;
  v3 = [(SFDomainLabel *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    [(SFDomainLabel *)v3 _commonInit];
    v5 = v4;
  }

  return v4;
}

- (SFDomainLabel)initWithText:(id)a3 isSecure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 bounds];
  v8 = -[SFDomainLabel initWithFrame:](self, "initWithFrame:");

  if (v8)
  {
    [(SFDomainLabel *)v8 setText:v6 isSecure:v4];
    v9 = v8;
  }

  return v8;
}

- (void)_commonInit
{
  v22[4] = *MEMORY[0x1E4F143B8];
  text = self->_text;
  self->_text = (NSString *)&stru_1EFB97EB8;

  BOOL v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  label = self->_label;
  self->_label = v4;

  [(UILabel *)self->_label setAdjustsFontForContentSizeCategory:1];
  id v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [(UILabel *)self->_label setFont:v6];

  [(UILabel *)self->_label setLineBreakMode:1];
  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1148846080;
  [(UILabel *)self->_label setContentHuggingPriority:1 forAxis:v7];
  [(SFDomainLabel *)self addSubview:self->_label];
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(UILabel *)self->_label centerXAnchor];
  v20 = [(SFDomainLabel *)self centerXAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v19;
  v8 = [(UILabel *)self->_label leadingAnchor];
  v9 = [(SFDomainLabel *)self leadingAnchor];
  v10 = [v8 constraintEqualToSystemSpacingAfterAnchor:v9 multiplier:1.0];
  v22[1] = v10;
  v11 = [(UILabel *)self->_label topAnchor];
  v12 = [(SFDomainLabel *)self topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v22[2] = v13;
  v14 = [(SFDomainLabel *)self bottomAnchor];
  v15 = [(UILabel *)self->_label bottomAnchor];
  v16 = [v14 constraintEqualToSystemSpacingBelowAnchor:v15 multiplier:1.0];
  v22[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
  [v18 activateConstraints:v17];
}

- (void)setText:(id)a3 isSecure:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = &stru_1EFB97EB8;
  if (a3) {
    id v6 = (__CFString *)a3;
  }
  v10 = v6;
  if (!-[NSString isEqualToString:](self->_text, "isEqualToString:") || self->_secure != v4)
  {
    double v7 = (NSString *)[(__CFString *)v10 copy];
    text = self->_text;
    self->_text = v7;

    self->_secure = v4;
    v9 = [(SFDomainLabel *)self _makeAttributedString];
    [(UILabel *)self->_label setAttributedText:v9];
  }
}

- (id)_makeAttributedString
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (self->_secure) {
    [MEMORY[0x1E4FB1618] systemGreenColor];
  }
  else {
  BOOL v4 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  if (self->_secure)
  {
    v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
    id v6 = [v5 imageWithTintColor:v4];
    double v7 = (void *)MEMORY[0x1E4FB1830];
    v8 = [(UILabel *)self->_label font];
    v9 = [v7 configurationWithFont:v8 scale:1];
    v10 = [v6 imageWithConfiguration:v9];

    v11 = (void *)MEMORY[0x1E4F28B18];
    v12 = [MEMORY[0x1E4FB1398] textAttachmentWithImage:v10];
    v13 = [v11 attributedStringWithAttachment:v12];
    [v3 appendAttributedString:v13];

    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v3 appendAttributedString:v14];
  }
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:self->_text];
  [v3 appendAttributedString:v15];

  uint64_t v18 = *MEMORY[0x1E4FB12B8];
  v19[0] = v4;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  objc_msgSend(v3, "addAttributes:range:", v16, 0, objc_msgSend(v3, "length"));

  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end