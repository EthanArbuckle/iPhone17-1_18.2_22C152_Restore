@interface APDatabaseColumn
- (APDatabaseColumn)initWithName:(id)a3 forColumnType:(int64_t)a4 withValue:(id)a5;
- (NSString)name;
- (id)description;
- (id)value;
- (int64_t)type;
- (void)setValue:(id)a3;
@end

@implementation APDatabaseColumn

- (APDatabaseColumn)initWithName:(id)a3 forColumnType:(int64_t)a4 withValue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9) {
    APSimulateCrash(5, @"APDatabaseColumn initialized with name == nil.", 0);
  }
  v14.receiver = self;
  v14.super_class = (Class)APDatabaseColumn;
  v11 = [(APDatabaseColumn *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_type = a4;
    objc_storeStrong(&v12->_value, a5);
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(APDatabaseColumn *)self name];
  v5 = [(APDatabaseColumn *)self value];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end