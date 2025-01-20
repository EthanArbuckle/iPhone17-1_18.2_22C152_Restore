@interface CNHandleStringsClassificationBuilder
- (CNHandleStringsClassificationBuilder)init;
- (NSMutableArray)emailAddresses;
- (NSMutableArray)phoneNumbers;
- (NSMutableArray)unknown;
- (id)build;
- (void)addEmailAddress:(id)a3;
- (void)addPhoneNumber:(id)a3;
- (void)addUnknown:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setUnknown:(id)a3;
@end

@implementation CNHandleStringsClassificationBuilder

- (void)addPhoneNumber:(id)a3
{
}

- (CNHandleStringsClassificationBuilder)init
{
  v11.receiver = self;
  v11.super_class = (Class)CNHandleStringsClassificationBuilder;
  v2 = [(CNHandleStringsClassificationBuilder *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    emailAddresses = v2->_emailAddresses;
    v2->_emailAddresses = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    phoneNumbers = v2->_phoneNumbers;
    v2->_phoneNumbers = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unknown = v2->_unknown;
    v2->_unknown = v7;

    v9 = v2;
  }

  return v2;
}

- (id)build
{
  v2 = [[CNHandleStringClassification alloc] initWithBuilder:self];

  return v2;
}

- (NSMutableArray)unknown
{
  return self->_unknown;
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);

  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (void)addEmailAddress:(id)a3
{
}

- (void)addUnknown:(id)a3
{
}

- (void)setEmailAddresses:(id)a3
{
}

- (void)setPhoneNumbers:(id)a3
{
}

- (void)setUnknown:(id)a3
{
}

@end