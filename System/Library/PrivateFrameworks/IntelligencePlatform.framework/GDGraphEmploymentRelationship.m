@interface GDGraphEmploymentRelationship
- (GDGraphEmploymentRelationship)initWithDepartmentField:(id)a3 organizationIdField:(id)a4 allDepartmentField:(id)a5 allOrganizationIdField:(id)a6;
- (GDGraphEntityIdentifier)organizationId;
- (NSArray)allDepartment;
- (NSArray)allOrganizationId;
- (NSString)department;
@end

@implementation GDGraphEmploymentRelationship

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOrganizationId, 0);
  objc_storeStrong((id *)&self->_allDepartment, 0);
  objc_storeStrong((id *)&self->_organizationId, 0);

  objc_storeStrong((id *)&self->_department, 0);
}

- (NSArray)allOrganizationId
{
  return self->_allOrganizationId;
}

- (NSArray)allDepartment
{
  return self->_allDepartment;
}

- (GDGraphEntityIdentifier)organizationId
{
  return self->_organizationId;
}

- (NSString)department
{
  return self->_department;
}

- (GDGraphEmploymentRelationship)initWithDepartmentField:(id)a3 organizationIdField:(id)a4 allDepartmentField:(id)a5 allOrganizationIdField:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GDGraphEmploymentRelationship;
  v15 = [(GDGraphEmploymentRelationship *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_department, a3);
    objc_storeStrong((id *)&v16->_organizationId, a4);
    objc_storeStrong((id *)&v16->_allDepartment, a5);
    objc_storeStrong((id *)&v16->_allOrganizationId, a6);
  }

  return v16;
}

@end