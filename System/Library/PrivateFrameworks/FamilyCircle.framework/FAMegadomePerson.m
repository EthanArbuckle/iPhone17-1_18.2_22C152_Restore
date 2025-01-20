@interface FAMegadomePerson
- (FAMegadomePerson)initWithEmails:(id)a3 phoneNumbers:(id)a4 names:(id)a5 contactIdentifiers:(id)a6;
- (FAMegadomePerson)initWithVisualIdentifierViewPerson:(id)a3;
- (NSArray)contactIdentifiers;
- (NSArray)emails;
- (NSArray)names;
- (NSArray)phoneNumbers;
@end

@implementation FAMegadomePerson

- (FAMegadomePerson)initWithVisualIdentifierViewPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 emails];
  v6 = [v4 phoneNumbers];
  v7 = [v4 names];
  v8 = [v4 contactIdentifiers];

  v9 = [(FAMegadomePerson *)self initWithEmails:v5 phoneNumbers:v6 names:v7 contactIdentifiers:v8];
  return v9;
}

- (FAMegadomePerson)initWithEmails:(id)a3 phoneNumbers:(id)a4 names:(id)a5 contactIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FAMegadomePerson;
  v15 = [(FAMegadomePerson *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_emails, a3);
    objc_storeStrong((id *)&v16->_phoneNumbers, a4);
    objc_storeStrong((id *)&v16->_names, a5);
    objc_storeStrong((id *)&v16->_contactIdentifiers, a6);
  }

  return v16;
}

- (NSArray)emails
{
  return self->_emails;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)names
{
  return self->_names;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emails, 0);
}

@end