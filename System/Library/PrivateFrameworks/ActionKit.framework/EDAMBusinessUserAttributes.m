@interface EDAMBusinessUserAttributes
+ (id)structFields;
+ (id)structName;
- (NSNumber)companyStartDate;
- (NSString)department;
- (NSString)linkedInProfileUrl;
- (NSString)location;
- (NSString)mobilePhone;
- (NSString)title;
- (NSString)workPhone;
- (void)setCompanyStartDate:(id)a3;
- (void)setDepartment:(id)a3;
- (void)setLinkedInProfileUrl:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMobilePhone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setWorkPhone:(id)a3;
@end

@implementation EDAMBusinessUserAttributes

+ (id)structFields
{
  v13[7] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_334;
  if (!structFields_structFields_334)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:1 name:@"title"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"location", v3 type optional name];
    v13[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"department"];
    v13[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"mobilePhone"];
    v13[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"linkedInProfileUrl"];
    v13[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"workPhone"];
    v13[5] = v8;
    v9 = +[FATField fieldWithIndex:7 type:10 optional:1 name:@"companyStartDate"];
    v13[6] = v9;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:7];
    v11 = (void *)structFields_structFields_334;
    structFields_structFields_334 = v10;

    v2 = (void *)structFields_structFields_334;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessUserAttributes";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companyStartDate, 0);
  objc_storeStrong((id *)&self->_workPhone, 0);
  objc_storeStrong((id *)&self->_linkedInProfileUrl, 0);
  objc_storeStrong((id *)&self->_mobilePhone, 0);
  objc_storeStrong((id *)&self->_department, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setCompanyStartDate:(id)a3
{
}

- (NSNumber)companyStartDate
{
  return self->_companyStartDate;
}

- (void)setWorkPhone:(id)a3
{
}

- (NSString)workPhone
{
  return self->_workPhone;
}

- (void)setLinkedInProfileUrl:(id)a3
{
}

- (NSString)linkedInProfileUrl
{
  return self->_linkedInProfileUrl;
}

- (void)setMobilePhone:(id)a3
{
}

- (NSString)mobilePhone
{
  return self->_mobilePhone;
}

- (void)setDepartment:(id)a3
{
}

- (NSString)department
{
  return self->_department;
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

@end