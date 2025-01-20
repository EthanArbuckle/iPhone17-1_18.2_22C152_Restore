@interface EDAMManageNoteSharesError
+ (id)structFields;
+ (id)structName;
- (EDAMNotFoundException)notFoundException;
- (EDAMUserException)userException;
- (NSNumber)identityID;
- (NSNumber)userID;
- (void)setIdentityID:(id)a3;
- (void)setNotFoundException:(id)a3;
- (void)setUserException:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation EDAMManageNoteSharesError

+ (id)structFields
{
  v10[4] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1941;
  if (!structFields_structFields_1941)
  {
    v3 = +[FATField fieldWithIndex:1 type:10 optional:1 name:@"identityID"];
    v10[0] = v3;
    v4 = +[FATField fieldWithIndex:2 type:8 optional:1 name:@"userID"];
    v10[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:12 optional:1 name:@"userException" structClass:objc_opt_class()];
    v10[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:12 optional:1 name:@"notFoundException" structClass:objc_opt_class()];
    v10[3] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:4];
    v8 = (void *)structFields_structFields_1941;
    structFields_structFields_1941 = v7;

    v2 = (void *)structFields_structFields_1941;
  }
  return v2;
}

+ (id)structName
{
  return @"ManageNoteSharesError";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notFoundException, 0);
  objc_storeStrong((id *)&self->_userException, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_identityID, 0);
}

- (void)setNotFoundException:(id)a3
{
}

- (EDAMNotFoundException)notFoundException
{
  return self->_notFoundException;
}

- (void)setUserException:(id)a3
{
}

- (EDAMUserException)userException
{
  return self->_userException;
}

- (void)setUserID:(id)a3
{
}

- (NSNumber)userID
{
  return self->_userID;
}

- (void)setIdentityID:(id)a3
{
}

- (NSNumber)identityID
{
  return self->_identityID;
}

@end