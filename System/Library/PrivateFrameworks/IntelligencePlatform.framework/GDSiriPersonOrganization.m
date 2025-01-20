@interface GDSiriPersonOrganization
- (GDSiriPersonOrganization)initWithOrganizationName:(id)a3 phoneticOrganizationName:(id)a4;
- (NSString)organizationName;
- (NSString)phoneticOrganizationName;
@end

@implementation GDSiriPersonOrganization

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);

  objc_storeStrong((id *)&self->_organizationName, 0);
}

- (NSString)phoneticOrganizationName
{
  return self->_phoneticOrganizationName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (GDSiriPersonOrganization)initWithOrganizationName:(id)a3 phoneticOrganizationName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GDSiriPersonOrganization;
  v9 = [(GDSiriPersonOrganization *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_organizationName, a3);
    objc_storeStrong((id *)&v10->_phoneticOrganizationName, a4);
  }

  return v10;
}

@end