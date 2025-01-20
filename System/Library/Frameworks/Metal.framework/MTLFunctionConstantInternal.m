@interface MTLFunctionConstantInternal
- (BOOL)required;
- (MTLFunctionConstantInternal)initWithName:(id)a3 type:(unint64_t)a4 index:(unint64_t)a5 required:(BOOL)a6;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)name;
- (unint64_t)index;
- (unint64_t)type;
- (void)dealloc;
@end

@implementation MTLFunctionConstantInternal

- (unint64_t)index
{
  return self->_index;
}

- (id)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)required
{
  return self->_required;
}

- (MTLFunctionConstantInternal)initWithName:(id)a3 type:(unint64_t)a4 index:(unint64_t)a5 required:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MTLFunctionConstantInternal;
  v10 = [(MTLFunctionConstantInternal *)&v12 init];
  v10->_name = (NSString *)[a3 copy];
  v10->_type = a4;
  v10->_index = a5;
  v10->_required = a6;
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLFunctionConstantInternal;
  [(MTLFunctionConstantInternal *)&v3 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v11[12] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLFunctionConstantInternal;
  id v6 = [(MTLFunctionConstantInternal *)&v10 description];
  name = self->_name;
  v11[0] = v4;
  v11[1] = @"name =";
  if (name) {
    v8 = (__CFString *)name;
  }
  else {
    v8 = @"<none>";
  }
  v11[2] = v8;
  v11[3] = v4;
  v11[4] = @"type =";
  v11[5] = MTLDataTypeString(self->_type);
  v11[6] = v4;
  v11[7] = @"index =";
  v11[8] = [NSNumber numberWithUnsignedInteger:self->_index];
  v11[9] = v4;
  v11[10] = @"required =";
  v11[11] = [NSNumber numberWithBool:self->_required];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 12), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLFunctionConstantInternal *)self formattedDescription:0];
}

@end