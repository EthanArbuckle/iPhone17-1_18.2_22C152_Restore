@interface GDGraphHandleRelationship
- (GDGraphHandleRelationship)initWithLabelField:(id)a3 emailAddressesField:(id)a4 phoneNumbersField:(id)a5 allLabelField:(id)a6;
- (NSArray)allLabel;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSString)label;
@end

@implementation GDGraphHandleRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allLabel, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

- (NSArray)allLabel
{
  return self->_allLabel;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)label
{
  return self->_label;
}

- (GDGraphHandleRelationship)initWithLabelField:(id)a3 emailAddressesField:(id)a4 phoneNumbersField:(id)a5 allLabelField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphHandleRelationship;
  v15 = [(GDGraphHandleRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_label, a3);
    objc_storeStrong((id *)&v16->_emailAddresses, a4);
    objc_storeStrong((id *)&v16->_phoneNumbers, a5);
    objc_storeStrong((id *)&v16->_allLabel, a6);
  }

  return v16;
}

@end