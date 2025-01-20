@interface MTLIndexedConstantValue
- (MTLIndexedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 index:(unint64_t)a5;
- (id)describe;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)dataType;
- (unint64_t)index;
- (void)data;
- (void)dealloc;
@end

@implementation MTLIndexedConstantValue

- (MTLIndexedConstantValue)initWithValue:(const void *)a3 type:(unint64_t)a4 index:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MTLIndexedConstantValue;
  v7 = [(MTLIndexedConstantValue *)&v9 init];
  if (v7)
  {
    v7->_index = a5;
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
  v4.receiver = self;
  v4.super_class = (Class)MTLIndexedConstantValue;
  [(MTLIndexedConstantValue *)&v4 dealloc];
}

- (id)describe
{
  v3 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  objc_super v4 = objc_msgSend(NSString, "stringWithFormat:", @"index: %@; type: %@; value: %@",
                 [NSNumber numberWithUnsignedInteger:self->_index],
                 MTLDataTypeString(self->_dataType),
                 v3);

  return v4;
}

- (id)formattedDescription:(unint64_t)a3
{
  v11[9] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = (void *)newStringFromConstantValue((unsigned __int16 *)self->_data, self->_dataType);
  v6 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLIndexedConstantValue;
  id v7 = [(MTLIndexedConstantValue *)&v10 description];
  v11[0] = v4;
  v11[1] = @"Index =";
  v11[2] = [NSNumber numberWithUnsignedInteger:self->_index];
  v11[3] = v4;
  v11[4] = @"Type =";
  v11[5] = MTLDataTypeString(self->_dataType);
  v11[6] = v4;
  v11[7] = @"Value =";
  v11[8] = v5;
  v8 = (void *)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", @" "];

  return v8;
}

- (id)description
{
  return [(MTLIndexedConstantValue *)self formattedDescription:0];
}

- (unint64_t)index
{
  return self->_index;
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