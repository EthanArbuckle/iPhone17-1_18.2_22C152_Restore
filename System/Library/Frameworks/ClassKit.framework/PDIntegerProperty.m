@interface PDIntegerProperty
+ (id)entityName;
+ (id)valueSQLType;
- (PDIntegerProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDIntegerProperty

+ (id)entityName
{
  return @"PDIntegerProperty";
}

- (PDIntegerProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PDIntegerProperty;
  v5 = [(PDProperty *)&v8 initWithDatabaseRow:v4];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"value");
    v5->_value = (int64_t)[v6 integerValue];
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDIntegerProperty;
  id v4 = a3;
  [(PDProperty *)&v6 bindTo:v4];
  v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_value, v6.receiver, v6.super_class);
  sub_10008C524((uint64_t)v4, v5, @"value");
}

+ (id)valueSQLType
{
  return @"integer";
}

@end