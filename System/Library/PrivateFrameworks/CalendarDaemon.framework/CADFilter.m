@interface CADFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)applicableToEntityType:(int)a3;
- (BOOL)validate;
- (CADFilter)initWithCoder:(id)a3;
- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6;
@end

@implementation CADFilter

- (BOOL)validate
{
  return 0;
}

- (BOOL)applicableToEntityType:(int)a3
{
  return 0;
}

- (id)extendWhereClause:(id)a3 usingOperation:(int64_t)a4 withValues:(id)a5 andTypes:(id)a6
{
  id v6 = a3;
  return v6;
}

- (CADFilter)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CADFilter;
  return [(CADFilter *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end