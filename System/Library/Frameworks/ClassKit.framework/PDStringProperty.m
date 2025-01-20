@interface PDStringProperty
+ (id)entityName;
+ (id)valueSQLType;
- (PDStringProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDStringProperty

+ (id)entityName
{
  return @"PDStringProperty";
}

- (PDStringProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PDStringProperty;
  v5 = [(PDProperty *)&v9 initWithDatabaseRow:v4];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"value");
    value = v5->_value;
    v5->_value = (NSString *)v6;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PDStringProperty;
  id v4 = a3;
  [(PDProperty *)&v5 bindTo:v4];
  sub_10008C524((uint64_t)v4, self->_value, @"value");
}

+ (id)valueSQLType
{
  return @"text";
}

- (void).cxx_destruct
{
}

@end