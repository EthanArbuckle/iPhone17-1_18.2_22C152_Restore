@interface MTLNamedConstantValue
- (MTLNamedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 name:(id)a5;
- (NSString)name;
- (id)describe;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)dataType;
- (void)data;
- (void)dealloc;
@end

@implementation MTLNamedConstantValue

- (MTLNamedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 name:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLNamedConstantValue;
  v7 = [(MTLNamedConstantValue *)&v9 init];
  if (v7)
  {
    v7->_name = (NSString *)a5;
    v7->_dataType = a4;
    _MTLConstantDataSize(a4);
    operator new[]();
  }
  return 0;
}

- (void)dealloc
{
  data = self->_data;
  if (data) {
    MEMORY[0x18530C120](data, 0x1000C8077774924);
  }
  self->_data = 0;

  self->_name = 0;
  v4.receiver = self;
  v4.super_class = (Class)MTLNamedConstantValue;
  [(MTLNamedConstantValue *)&v4 dealloc];
}

- (id)describe
{
  v3 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  objc_super v4 = objc_msgSend(NSString, "stringWithFormat:", @"name: %@; type: %@; value: %@",
                 self->_name,
                 MTLDataTypeString(self->_dataType),
                 v3);

  return v4;
}

- (id)formattedDescription:(unint64_t)a3
{
  v13[9] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)MTLNamedConstantValue;
  id v7 = [(MTLNamedConstantValue *)&v12 description];
  v13[0] = v4;
  v13[1] = @"Name =";
  name = @"<none>";
  unint64_t dataType = self->_dataType;
  if (self->_name) {
    name = (__CFString *)self->_name;
  }
  v13[2] = name;
  v13[3] = v4;
  v13[4] = @"Type =";
  v13[5] = MTLDataTypeString(dataType);
  v13[6] = v4;
  v13[7] = @"Value =";
  v13[8] = v5;
  v10 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 9), "componentsJoinedByString:", @" "];

  return v10;
}

- (id)description
{
  return [(MTLNamedConstantValue *)self formattedDescription:0];
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)data
{
  return self->_data;
}

@end