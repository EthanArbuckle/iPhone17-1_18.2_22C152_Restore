@interface DMCProfilePayloadSection
+ (BOOL)supportsSecureCoding;
- (DMCProfilePayloadSection)init;
- (DMCProfilePayloadSection)initWithCoder:(id)a3;
- (DMCProfilePayloadSection)initWithSectionTitle:(id)a3 footer:(id)a4 payloadViewModels:(id)a5;
- (NSMutableArray)payloadViewModels;
- (NSString)sectionFooter;
- (NSString)sectionTitle;
- (void)encodeWithCoder:(id)a3;
- (void)setPayloadViewModels:(id)a3;
- (void)setSectionFooter:(id)a3;
- (void)setSectionTitle:(id)a3;
@end

@implementation DMCProfilePayloadSection

- (DMCProfilePayloadSection)init
{
  v6.receiver = self;
  v6.super_class = (Class)DMCProfilePayloadSection;
  v2 = [(DMCProfilePayloadSection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    payloadViewModels = v2->_payloadViewModels;
    v2->_payloadViewModels = (NSMutableArray *)v3;
  }
  return v2;
}

- (DMCProfilePayloadSection)initWithSectionTitle:(id)a3 footer:(id)a4 payloadViewModels:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)DMCProfilePayloadSection;
  v12 = [(DMCProfilePayloadSection *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionTitle, a3);
    objc_storeStrong((id *)&v13->_sectionFooter, a4);
    uint64_t v14 = [v11 mutableCopy];
    payloadViewModels = v13->_payloadViewModels;
    v13->_payloadViewModels = (NSMutableArray *)v14;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMCProfilePayloadSection *)self sectionTitle];
  [v4 encodeObject:v5 forKey:@"sectionTitle"];

  objc_super v6 = [(DMCProfilePayloadSection *)self sectionFooter];
  [v4 encodeObject:v6 forKey:@"sectionFooter"];

  id v7 = [(DMCProfilePayloadSection *)self payloadViewModels];
  [v4 encodeObject:v7 forKey:@"payloadViewModels"];
}

- (DMCProfilePayloadSection)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DMCProfilePayloadSection;
  v5 = [(DMCProfilePayloadSection *)&v18 init];
  if (v5)
  {
    objc_super v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"sectionTitle"];
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    id v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"sectionFooter"];
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"payloadViewModels"];
    payloadViewModels = v5->_payloadViewModels;
    v5->_payloadViewModels = (NSMutableArray *)v15;
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

- (NSMutableArray)payloadViewModels
{
  return self->_payloadViewModels;
}

- (void)setPayloadViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadViewModels, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end