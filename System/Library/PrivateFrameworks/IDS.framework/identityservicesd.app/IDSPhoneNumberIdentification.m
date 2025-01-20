@interface IDSPhoneNumberIdentification
- (IDSPhoneNumberIdentification)initWithPhoneNumber:(id)a3 phoneToken:(id)a4;
- (NSString)phoneNumber;
- (NSString)phoneToken;
@end

@implementation IDSPhoneNumberIdentification

- (IDSPhoneNumberIdentification)initWithPhoneNumber:(id)a3 phoneToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSPhoneNumberIdentification;
  v9 = [(IDSPhoneNumberIdentification *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_phoneNumber, a3);
    objc_storeStrong((id *)&v10->_phoneToken, a4);
  }

  return v10;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)phoneToken
{
  return self->_phoneToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneToken, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end