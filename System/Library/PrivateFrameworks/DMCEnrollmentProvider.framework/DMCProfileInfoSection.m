@interface DMCProfileInfoSection
+ (BOOL)supportsSecureCoding;
- (DMCProfileInfoSection)initWithCoder:(id)a3;
- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 attributedText:(id)a5;
- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 text:(id)a5;
- (NSAttributedString)sectionAttributedText;
- (NSString)sectionFooter;
- (NSString)sectionText;
- (NSString)sectionTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setSectionAttributedText:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionText:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation DMCProfileInfoSection

- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 text:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMCProfileInfoSection;
  v11 = [(DMCProfileInfoSection *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    sectionTitle = v11->_sectionTitle;
    v11->_sectionTitle = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    sectionFooter = v11->_sectionFooter;
    v11->_sectionFooter = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    sectionText = v11->_sectionText;
    v11->_sectionText = (NSString *)v16;
  }
  return v11;
}

- (DMCProfileInfoSection)initWithSectionTitle:(id)a3 footer:(id)a4 attributedText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [v8 string];
  uint64_t v12 = [(DMCProfileInfoSection *)self initWithSectionTitle:v10 footer:v9 text:v11];

  if (v12)
  {
    uint64_t v13 = [v8 copy];
    sectionAttributedText = v12->_sectionAttributedText;
    v12->_sectionAttributedText = (NSAttributedString *)v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMCProfileInfoSection *)self sectionTitle];
  [v4 encodeObject:v5 forKey:@"sectionTitle"];

  v6 = [(DMCProfileInfoSection *)self sectionFooter];
  [v4 encodeObject:v6 forKey:@"sectionFooter"];

  v7 = [(DMCProfileInfoSection *)self sectionText];
  [v4 encodeObject:v7 forKey:@"sectionText"];

  id v8 = [(DMCProfileInfoSection *)self sectionAttributedText];
  [v4 encodeObject:v8 forKey:@"sectionAttributedText"];
}

- (DMCProfileInfoSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMCProfileInfoSection;
  v5 = [(DMCProfileInfoSection *)&v19 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sectionTitle"];
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sectionFooter"];
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    uint64_t v12 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"sectionText"];
    sectionText = v5->_sectionText;
    v5->_sectionText = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"sectionAttributedText"];
    sectionAttributedText = v5->_sectionAttributedText;
    v5->_sectionAttributedText = (NSAttributedString *)v16;
  }
  return v5;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
}

- (NSString)sectionText
{
  return self->_sectionText;
}

- (void)setSectionText:(id)a3
{
}

- (NSAttributedString)sectionAttributedText
{
  return self->_sectionAttributedText;
}

- (void)setSectionAttributedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionAttributedText, 0);
  objc_storeStrong((id *)&self->_sectionText, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end