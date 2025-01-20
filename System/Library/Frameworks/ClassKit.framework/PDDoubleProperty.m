@interface PDDoubleProperty
+ (id)entityName;
+ (id)valueSQLType;
- (PDDoubleProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDDoubleProperty

+ (id)entityName
{
  return @"PDDoubleProperty";
}

- (PDDoubleProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PDDoubleProperty;
  v5 = [(PDProperty *)&v9 initWithDatabaseRow:v4];
  if (v5)
  {
    v6 = sub_100003BF0(v4, @"value");
    [v6 doubleValue];
    v5->_value = v7;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDDoubleProperty;
  id v4 = a3;
  [(PDProperty *)&v6 bindTo:v4];
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_value, v6.receiver, v6.super_class);
  sub_10008C524((uint64_t)v4, v5, @"value");
}

+ (id)valueSQLType
{
  return @"real";
}

@end