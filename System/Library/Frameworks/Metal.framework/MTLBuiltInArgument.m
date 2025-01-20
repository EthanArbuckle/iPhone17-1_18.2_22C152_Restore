@interface MTLBuiltInArgument
- (BOOL)isEqual:(id)a3;
- (MTLBuiltInArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)builtInDataType;
- (unint64_t)builtInType;
@end

@implementation MTLBuiltInArgument

- (MTLBuiltInArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 active:(BOOL)a6 index:(unint64_t)a7 dataType:(unint64_t)a8 builtInType:(unint64_t)a9
{
  unsigned __int16 v9 = a8;
  v11.receiver = self;
  v11.super_class = (Class)MTLBuiltInArgument;
  result = [(MTLBindingInternal *)&v11 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  result->_builtInType = a9;
  result->_builtInDataType = v9;
  return result;
}

- (unint64_t)builtInDataType
{
  return self->_builtInDataType;
}

- (unint64_t)builtInType
{
  return self->_builtInType;
}

- (id)formattedDescription:(unint64_t)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v6 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)MTLBuiltInArgument;
  id v7 = [(MTLBindingInternal *)&v9 formattedDescription:a3];
  v10[0] = v5;
  v10[1] = @"BuiltInArgumentType =";
  v10[2] = MTLBuiltInArgumentTypeString(self->_builtInType);
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 3), "componentsJoinedByString:", @" "];
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_builtInType != *((unsigned __int16 *)a3 + 84)
    || self->_builtInDataType != *((unsigned __int16 *)a3 + 85))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLBuiltInArgument;
  return [(MTLBindingInternal *)&v6 isEqual:a3];
}

@end