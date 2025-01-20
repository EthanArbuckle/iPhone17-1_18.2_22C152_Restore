@interface GDGraphOrganization
- (GDGraphOrganization)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 phoneticNameField:(id)a5 allNameField:(id)a6 allPhoneticNameField:(id)a7;
- (GDGraphOrganizationEntityIdentifier)entityIdentifier;
- (NSArray)allName;
- (NSArray)allPhoneticName;
- (NSString)name;
- (NSString)phoneticName;
@end

@implementation GDGraphOrganization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allPhoneticName, 0);
  objc_storeStrong((id *)&self->_allName, 0);
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allPhoneticName
{
  return self->_allPhoneticName;
}

- (NSArray)allName
{
  return self->_allName;
}

- (NSString)phoneticName
{
  return self->_phoneticName;
}

- (NSString)name
{
  return self->_name;
}

- (GDGraphOrganizationEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphOrganization)initWithEntityIdentifierField:(id)a3 nameField:(id)a4 phoneticNameField:(id)a5 allNameField:(id)a6 allPhoneticNameField:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)GDGraphOrganization;
  v17 = [(GDGraphOrganization *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entityIdentifier, a3);
    objc_storeStrong((id *)&v18->_name, a4);
    objc_storeStrong((id *)&v18->_phoneticName, a5);
    objc_storeStrong((id *)&v18->_allName, a6);
    objc_storeStrong((id *)&v18->_allPhoneticName, a7);
  }

  return v18;
}

@end