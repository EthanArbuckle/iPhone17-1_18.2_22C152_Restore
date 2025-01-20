@interface LAACL
- (BOOL)isEqual:(id)a3;
- (LAACL)initWithData:(id)a3;
- (NSData)data;
- (NSDictionary)constraints;
- (void)dealloc;
- (void)evaluateInContext:(id)a3 options:(id)a4 reply:(id)a5;
- (void)initWithSecAccessControl:(void *)result;
@end

@implementation LAACL

- (LAACL)initWithData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LAACL;
  v5 = [(LAACL *)&v7 init];
  if (v5) {
    v5->_acl = +[LASecAccessControl deserializeACL:v4];
  }

  return v5;
}

- (void)initWithSecAccessControl:(void *)result
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)LAACL;
    result = objc_msgSendSuper2(&v3, sel_init);
    if (result) {
      result[1] = a2;
    }
  }
  return result;
}

- (void)dealloc
{
  acl = self->_acl;
  if (acl) {
    CFRelease(acl);
  }
  v4.receiver = self;
  v4.super_class = (Class)LAACL;
  [(LAACL *)&v4 dealloc];
}

- (NSDictionary)constraints
{
  constraints = self->_constraints;
  if (!constraints)
  {
    objc_super v4 = +[LASecAccessControl constraintsFromACL:self->_acl];
    v5 = self->_constraints;
    self->_constraints = v4;

    constraints = self->_constraints;
  }

  return constraints;
}

- (NSData)data
{
  data = self->_data;
  if (!data)
  {
    objc_super v4 = +[LASecAccessControl serializeACL:self->_acl];
    v5 = self->_data;
    self->_data = v4;

    data = self->_data;
  }

  return data;
}

- (void)evaluateInContext:(id)a3 options:(id)a4 reply:(id)a5
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 data];
    objc_super v7 = [(LAACL *)self data];
    if (v6 == v7)
    {
      char v10 = 1;
    }
    else
    {
      v8 = [v5 data];
      v9 = [(LAACL *)self data];
      char v10 = [v8 isEqualToData:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_constraints, 0);
}

@end