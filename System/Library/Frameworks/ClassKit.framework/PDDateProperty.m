@interface PDDateProperty
+ (id)entityName;
+ (id)valueSQLType;
- (PDDateProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDateProperty

+ (id)entityName
{
  return @"PDDateProperty";
}

- (PDDateProperty)initWithDatabaseRow:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PDDateProperty;
  v5 = [(PDProperty *)&v9 initWithDatabaseRow:v4];
  if (v5)
  {
    uint64_t v6 = sub_1001630C8(v4, @"value");
    value = v5->_value;
    v5->_value = (NSDate *)v6;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDDateProperty;
  id v4 = a3;
  [(PDProperty *)&v5 bindTo:v4];
  sub_10008C524((uint64_t)v4, self->_value, @"value");
}

+ (id)valueSQLType
{
  return @"real";
}

- (void).cxx_destruct
{
}

@end