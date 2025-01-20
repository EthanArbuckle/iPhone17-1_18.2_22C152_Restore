@interface EDAMSharedNote
+ (id)structFields;
+ (id)structName;
- (EDAMIdentity)recipientIdentity;
- (NSNumber)privilege;
- (NSNumber)serviceAssigned;
- (NSNumber)serviceCreated;
- (NSNumber)serviceUpdated;
- (NSNumber)sharerUserID;
- (void)setPrivilege:(id)a3;
- (void)setRecipientIdentity:(id)a3;
- (void)setServiceAssigned:(id)a3;
- (void)setServiceCreated:(id)a3;
- (void)setServiceUpdated:(id)a3;
- (void)setSharerUserID:(id)a3;
@end

@implementation EDAMSharedNote

+ (id)structFields
{
  v12[6] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1669;
  if (!structFields_structFields_1669)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"sharerUserID"];
    v12[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"recipientIdentity" structClass:objc_opt_class()];
    v12[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"privilege"];
    v12[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"serviceCreated"];
    v12[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:10 optional:1 name:@"serviceUpdated"];
    v12[4] = v7;
    v8 = +[FATField fieldWithIndex:6 type:10 optional:1 name:@"serviceAssigned"];
    v12[5] = v8;
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:6];
    v10 = (void *)structFields_structFields_1669;
    structFields_structFields_1669 = v9;

    v2 = (void *)structFields_structFields_1669;
  }
  return v2;
}

+ (id)structName
{
  return @"SharedNote";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceAssigned, 0);
  objc_storeStrong((id *)&self->_serviceUpdated, 0);
  objc_storeStrong((id *)&self->_serviceCreated, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_recipientIdentity, 0);
  objc_storeStrong((id *)&self->_sharerUserID, 0);
}

- (void)setServiceAssigned:(id)a3
{
}

- (NSNumber)serviceAssigned
{
  return self->_serviceAssigned;
}

- (void)setServiceUpdated:(id)a3
{
}

- (NSNumber)serviceUpdated
{
  return self->_serviceUpdated;
}

- (void)setServiceCreated:(id)a3
{
}

- (NSNumber)serviceCreated
{
  return self->_serviceCreated;
}

- (void)setPrivilege:(id)a3
{
}

- (NSNumber)privilege
{
  return self->_privilege;
}

- (void)setRecipientIdentity:(id)a3
{
}

- (EDAMIdentity)recipientIdentity
{
  return self->_recipientIdentity;
}

- (void)setSharerUserID:(id)a3
{
}

- (NSNumber)sharerUserID
{
  return self->_sharerUserID;
}

@end