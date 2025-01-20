@interface EDAMBusinessUserInfo
+ (id)structFields;
+ (id)structName;
- (NSNumber)businessId;
- (NSNumber)role;
- (NSNumber)updated;
- (NSString)businessName;
- (NSString)email;
- (void)setBusinessId:(id)a3;
- (void)setBusinessName:(id)a3;
- (void)setEmail:(id)a3;
- (void)setRole:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation EDAMBusinessUserInfo

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_627;
  if (!structFields_structFields_627)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"businessId"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"businessName", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"role"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"email"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"updated"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_627;
    structFields_structFields_627 = v8;

    v2 = (void *)structFields_structFields_627;
  }
  return v2;
}

+ (id)structName
{
  return @"BusinessUserInfo";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updated, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_businessName, 0);
  objc_storeStrong((id *)&self->_businessId, 0);
}

- (void)setUpdated:(id)a3
{
}

- (NSNumber)updated
{
  return self->_updated;
}

- (void)setEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setRole:(id)a3
{
}

- (NSNumber)role
{
  return self->_role;
}

- (void)setBusinessName:(id)a3
{
}

- (NSString)businessName
{
  return self->_businessName;
}

- (void)setBusinessId:(id)a3
{
}

- (NSNumber)businessId
{
  return self->_businessId;
}

@end