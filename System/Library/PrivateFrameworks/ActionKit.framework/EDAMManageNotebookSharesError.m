@interface EDAMManageNotebookSharesError
+ (id)structFields;
+ (id)structName;
- (EDAMNotFoundException)notFoundException;
- (EDAMUserException)userException;
- (EDAMUserIdentity)userIdentity;
- (void)setNotFoundException:(id)a3;
- (void)setUserException:(id)a3;
- (void)setUserIdentity:(id)a3;
@end

@implementation EDAMManageNotebookSharesError

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1735;
  if (!structFields_structFields_1735)
  {
    v3 = +[FATField fieldWithIndex:1 type:12 optional:1 name:@"userIdentity" structClass:objc_opt_class()];
    v4 = +[FATField fieldWithIndex:2, 12, 1, @"userException", objc_opt_class(), v3 type optional name structClass];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:12 optional:1 name:@"notFoundException" structClass:objc_opt_class()];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1735;
    structFields_structFields_1735 = v6;

    v2 = (void *)structFields_structFields_1735;
  }
  return v2;
}

+ (id)structName
{
  return @"ManageNotebookSharesError";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notFoundException, 0);
  objc_storeStrong((id *)&self->_userException, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
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

- (void)setUserIdentity:(id)a3
{
}

- (EDAMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

@end