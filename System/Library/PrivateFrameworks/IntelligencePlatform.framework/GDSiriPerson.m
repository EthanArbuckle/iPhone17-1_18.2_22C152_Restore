@interface GDSiriPerson
- (GDSiriPerson)initWithContactIdentifiers:(id)a3 givenNames:(id)a4 phoneticGivenNames:(id)a5 middleNames:(id)a6 phoneticMiddleNames:(id)a7 lastNames:(id)a8 phoneticLastNames:(id)a9 prefixes:(id)a10 nickNames:(id)a11 organizations:(id)a12;
- (NSArray)contactIdentifiers;
- (NSArray)givenNames;
- (NSArray)lastNames;
- (NSArray)middleNames;
- (NSArray)nickNames;
- (NSArray)organizations;
- (NSArray)phoneticGivenNames;
- (NSArray)phoneticLastNames;
- (NSArray)phoneticMiddleNames;
- (NSArray)prefixes;
@end

@implementation GDSiriPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizations, 0);
  objc_storeStrong((id *)&self->_nickNames, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_phoneticLastNames, 0);
  objc_storeStrong((id *)&self->_lastNames, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_phoneticGivenNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);

  objc_storeStrong((id *)&self->_contactIdentifiers, 0);
}

- (NSArray)organizations
{
  return self->_organizations;
}

- (NSArray)nickNames
{
  return self->_nickNames;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (NSArray)phoneticLastNames
{
  return self->_phoneticLastNames;
}

- (NSArray)lastNames
{
  return self->_lastNames;
}

- (NSArray)phoneticMiddleNames
{
  return self->_phoneticMiddleNames;
}

- (NSArray)middleNames
{
  return self->_middleNames;
}

- (NSArray)phoneticGivenNames
{
  return self->_phoneticGivenNames;
}

- (NSArray)givenNames
{
  return self->_givenNames;
}

- (NSArray)contactIdentifiers
{
  return self->_contactIdentifiers;
}

- (GDSiriPerson)initWithContactIdentifiers:(id)a3 givenNames:(id)a4 phoneticGivenNames:(id)a5 middleNames:(id)a6 phoneticMiddleNames:(id)a7 lastNames:(id)a8 phoneticLastNames:(id)a9 prefixes:(id)a10 nickNames:(id)a11 organizations:(id)a12
{
  id v34 = a3;
  id obj = a4;
  id v33 = a4;
  id v32 = a5;
  id v26 = a6;
  id v31 = a6;
  id v27 = a7;
  id v30 = a7;
  id v29 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)GDSiriPerson;
  v22 = [(GDSiriPerson *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_contactIdentifiers, a3);
    objc_storeStrong((id *)&v23->_givenNames, obj);
    objc_storeStrong((id *)&v23->_phoneticGivenNames, a5);
    objc_storeStrong((id *)&v23->_middleNames, v26);
    objc_storeStrong((id *)&v23->_phoneticMiddleNames, v27);
    objc_storeStrong((id *)&v23->_lastNames, a8);
    objc_storeStrong((id *)&v23->_phoneticLastNames, a9);
    objc_storeStrong((id *)&v23->_prefixes, a10);
    objc_storeStrong((id *)&v23->_nickNames, a11);
    objc_storeStrong((id *)&v23->_organizations, a12);
  }

  return v23;
}

@end