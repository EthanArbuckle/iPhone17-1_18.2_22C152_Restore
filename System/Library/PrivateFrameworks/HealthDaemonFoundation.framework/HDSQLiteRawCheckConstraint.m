@interface HDSQLiteRawCheckConstraint
+ (id)checkConstraintWithSQL:(id)a3;
- (id)SQLCheckConstraint;
- (void)_initWithSQL:(void *)a1;
@end

@implementation HDSQLiteRawCheckConstraint

- (void)_initWithSQL:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)HDSQLiteRawCheckConstraint;
    a1 = objc_msgSendSuper2(&v7, sel__init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

+ (id)checkConstraintWithSQL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = -[HDSQLiteRawCheckConstraint _initWithSQL:]([HDSQLiteRawCheckConstraint alloc], v3);

  return v4;
}

- (id)SQLCheckConstraint
{
  return self->_rawSQL;
}

- (void).cxx_destruct
{
}

@end