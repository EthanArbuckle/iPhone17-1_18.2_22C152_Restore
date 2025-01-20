@interface CPRouteChoice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPRouteChoice)init;
- (CPRouteChoice)initWithCoder:(id)a3;
- (CPRouteChoice)initWithSummaryVariants:(NSArray *)summaryVariants additionalInformationVariants:(NSArray *)additionalInformationVariants selectionSummaryVariants:(NSArray *)selectionSummaryVariants;
- (NSArray)additionalInformationVariants;
- (NSArray)selectionSummaryVariants;
- (NSArray)summaryVariants;
- (NSUUID)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)userInfo;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalInformationVariants:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSelectionSummaryVariants:(id)a3;
- (void)setSummaryVariants:(id)a3;
- (void)setUserInfo:(id)userInfo;
@end

@implementation CPRouteChoice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPRouteChoice)init
{
  return [(CPRouteChoice *)self initWithSummaryVariants:MEMORY[0x263EFFA68] additionalInformationVariants:MEMORY[0x263EFFA68] selectionSummaryVariants:MEMORY[0x263EFFA68]];
}

- (CPRouteChoice)initWithSummaryVariants:(NSArray *)summaryVariants additionalInformationVariants:(NSArray *)additionalInformationVariants selectionSummaryVariants:(NSArray *)selectionSummaryVariants
{
  v9 = summaryVariants;
  v10 = additionalInformationVariants;
  v11 = selectionSummaryVariants;
  v16.receiver = self;
  v16.super_class = (Class)CPRouteChoice;
  v12 = [(CPRouteChoice *)&v16 init];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F08C38] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_summaryVariants, summaryVariants);
    objc_storeStrong((id *)&v12->_additionalInformationVariants, additionalInformationVariants);
    objc_storeStrong((id *)&v12->_selectionSummaryVariants, selectionSummaryVariants);
  }

  return v12;
}

- (CPRouteChoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPIdentifierKey"];
  v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"kCPRouteChoiceSummaryVariantsKey"];

  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"kCPRouteChoiceAdditionalInformationVariantsKey"];

  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  objc_super v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kCPRouteChoiceSelectionSummaryVariantsKey"];

  v18 = [(CPRouteChoice *)self initWithSummaryVariants:v9 additionalInformationVariants:v13 selectionSummaryVariants:v17];
  [(CPRouteChoice *)v18 setIdentifier:v5];

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CPRouteChoice *)self identifier];
  [v4 encodeObject:v5 forKey:@"kCPIdentifierKey"];

  v6 = [(CPRouteChoice *)self summaryVariants];
  [v4 encodeObject:v6 forKey:@"kCPRouteChoiceSummaryVariantsKey"];

  uint64_t v7 = [(CPRouteChoice *)self additionalInformationVariants];
  [v4 encodeObject:v7 forKey:@"kCPRouteChoiceAdditionalInformationVariantsKey"];

  id v8 = [(CPRouteChoice *)self selectionSummaryVariants];
  [v4 encodeObject:v8 forKey:@"kCPRouteChoiceSelectionSummaryVariantsKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [MEMORY[0x263F08C38] UUID];
  [v4 setIdentifier:v5];

  v6 = [(CPRouteChoice *)self summaryVariants];
  [v4 setSummaryVariants:v6];

  uint64_t v7 = [(CPRouteChoice *)self additionalInformationVariants];
  [v4 setAdditionalInformationVariants:v7];

  id v8 = [(CPRouteChoice *)self selectionSummaryVariants];
  [v4 setSelectionSummaryVariants:v8];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(CPRouteChoice *)self identifier];
    v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CPRouteChoice;
  id v4 = [(CPRouteChoice *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ {identifier: %@, summaryVariants: %@, additionalInformationVariants: %@, selectionSummaryVariants %@}", v4, self->_identifier, self->_summaryVariants, self->_additionalInformationVariants, self->_selectionSummaryVariants];

  return v5;
}

- (NSArray)summaryVariants
{
  return self->_summaryVariants;
}

- (void)setSummaryVariants:(id)a3
{
}

- (NSArray)selectionSummaryVariants
{
  return self->_selectionSummaryVariants;
}

- (void)setSelectionSummaryVariants:(id)a3
{
}

- (NSArray)additionalInformationVariants
{
  return self->_additionalInformationVariants;
}

- (void)setAdditionalInformationVariants:(id)a3
{
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_additionalInformationVariants, 0);
  objc_storeStrong((id *)&self->_selectionSummaryVariants, 0);

  objc_storeStrong((id *)&self->_summaryVariants, 0);
}

@end