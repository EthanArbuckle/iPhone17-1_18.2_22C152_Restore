@interface CNDFDonationStringCollector
- (CNDFDonationStringCollector)init;
- (NSArray)strings;
- (NSMutableArray)visitedStrings;
- (NSString)description;
- (void)_addNonEmptyString:(id)a3;
- (void)collectStringsFromDonation:(id)a3;
- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 imageData:(id)a4;
- (void)visitDonationValue:(id)a3 nameComponents:(id)a4;
- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5;
- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6;
@end

@implementation CNDFDonationStringCollector

- (CNDFDonationStringCollector)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNDFDonationStringCollector;
  v2 = [(CNDFDonationStringCollector *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    visitedStrings = v2->_visitedStrings;
    v2->_visitedStrings = (NSMutableArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  v4 = [(CNDFDonationStringCollector *)self visitedStrings];
  id v5 = (id)[v3 appendName:@"strings" object:v4];

  v6 = [v3 build];

  return (NSString *)v6;
}

- (NSArray)strings
{
  v2 = [(CNDFDonationStringCollector *)self visitedStrings];
  uint64_t v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (void)collectStringsFromDonation:(id)a3
{
}

- (void)_addNonEmptyString:(id)a3
{
  id v5 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x263F334E8] + 16))())
  {
    v4 = [(CNDFDonationStringCollector *)self visitedStrings];
    [v4 addObject:v5];
  }
}

- (void)visitDonationValue:(id)a3 nameComponents:(id)a4
{
  id v5 = a4;
  v6 = [v5 namePrefix];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v6];

  objc_super v7 = [v5 givenName];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v7];

  v8 = [v5 middleName];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v8];

  v9 = [v5 familyName];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v9];

  v10 = [v5 nameSuffix];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v10];

  id v11 = [v5 nickname];

  [(CNDFDonationStringCollector *)self _addNonEmptyString:v11];
}

- (void)visitDonationValue:(id)a3 emailAddress:(id)a4 label:(id)a5
{
}

- (void)visitDonationValue:(id)a3 phoneNumber:(id)a4 label:(id)a5
{
  objc_msgSend(a4, "stringValue", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v6];
}

- (void)visitDonationValue:(id)a3 postalAddress:(id)a4 style:(int64_t)a5 label:(id)a6
{
  id v7 = a4;
  v8 = [v7 street];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v8];

  v9 = [v7 subLocality];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v9];

  v10 = [v7 city];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v10];

  id v11 = [v7 subAdministrativeArea];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v11];

  v12 = [v7 state];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v12];

  v13 = [v7 postalCode];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v13];

  v14 = [v7 country];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v14];

  id v15 = [v7 ISOCountryCode];

  [(CNDFDonationStringCollector *)self _addNonEmptyString:v15];
}

- (void)visitDonationValue:(id)a3 imageData:(id)a4
{
  id v5 = [a4 base64EncodedStringWithOptions:0];
  [(CNDFDonationStringCollector *)self _addNonEmptyString:v5];
}

- (NSMutableArray)visitedStrings
{
  return self->_visitedStrings;
}

- (void).cxx_destruct
{
}

@end