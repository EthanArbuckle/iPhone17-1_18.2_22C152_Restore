@interface PDGenericProperty
+ (id)entityName;
+ (id)valueSQLType;
- (PDGenericProperty)initWithDatabaseRow:(id)a3;
- (void)bindTo:(id)a3;
@end

@implementation PDGenericProperty

+ (id)entityName
{
  return @"PDGenericProperty";
}

- (PDGenericProperty)initWithDatabaseRow:(id)a3
{
  v4 = (uint64_t *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PDGenericProperty;
  v5 = [(PDProperty *)&v9 initWithDatabaseRow:v4];
  if (v5)
  {
    uint64_t v6 = sub_100003BF0(v4, @"value");
    data = v5->_data;
    v5->_data = (NSData *)v6;
  }
  return v5;
}

- (void)bindTo:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDGenericProperty;
  [(PDProperty *)&v10 bindTo:v4];
  value = self->_value;
  if (value)
  {
    id v9 = 0;
    uint64_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:value requiringSecureCoding:1 error:&v9];
    id v7 = v9;
    v8 = v7;
    if (v7) {
      objc_msgSend(v7, "cls_debug:", CLSLogDatabase);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_10008C524((uint64_t)v4, v6, @"value");
}

+ (id)valueSQLType
{
  return @"blob";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end