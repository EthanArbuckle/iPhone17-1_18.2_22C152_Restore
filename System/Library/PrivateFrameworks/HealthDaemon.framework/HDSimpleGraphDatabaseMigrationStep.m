@interface HDSimpleGraphDatabaseMigrationStep
+ (id)migrationToVersion:(int64_t)a3 function:(void *)a4;
- (id)description;
- (int64_t)toVersion;
- (void)function;
@end

@implementation HDSimpleGraphDatabaseMigrationStep

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %ld>", objc_opt_class(), self->_toVersion];
}

+ (id)migrationToVersion:(int64_t)a3 function:(void *)a4
{
  v6 = [HDSimpleGraphDatabaseMigrationStep alloc];
  if (v6)
  {
    v8.receiver = v6;
    v8.super_class = (Class)HDSimpleGraphDatabaseMigrationStep;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    if (v6)
    {
      v6->_toVersion = a3;
      v6->_function = a4;
    }
  }

  return v6;
}

- (int64_t)toVersion
{
  return self->_toVersion;
}

- (void)function
{
  return self->_function;
}

@end