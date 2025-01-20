@interface HDSQLiteCheckConstraint
- (HDSQLiteCheckConstraint)init;
- (NSString)SQLCheckConstraint;
- (id)_init;
@end

@implementation HDSQLiteCheckConstraint

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HDSQLiteCheckConstraint;
  return [(HDSQLiteCheckConstraint *)&v3 init];
}

- (HDSQLiteCheckConstraint)init
{
  objc_super v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (NSString)SQLCheckConstraint
{
  return 0;
}

@end