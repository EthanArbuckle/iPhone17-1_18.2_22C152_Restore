@interface MTLFunctionStitchingInputNode
- (BOOL)isEqual:(id)a3;
- (MTLFunctionStitchingInputNode)initWithArgumentIndex:(NSUInteger)argument;
- (NSString)description;
- (NSUInteger)argumentIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)hash;
- (void)setArgumentIndex:(NSUInteger)argumentIndex;
@end

@implementation MTLFunctionStitchingInputNode

- (MTLFunctionStitchingInputNode)initWithArgumentIndex:(NSUInteger)argument
{
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputNode;
  result = [(MTLFunctionStitchingInputNode *)&v5 init];
  result->_argumentIndex = argument;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setArgumentIndex:", -[MTLFunctionStitchingInputNode argumentIndex](self, "argumentIndex"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    return 0;
  }
  NSUInteger v7 = [(MTLFunctionStitchingInputNode *)self argumentIndex];
  return v7 == [a3 argumentIndex];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(MTLFunctionStitchingInputNode *)self argumentIndex];
  return _MTLHashState((int *)&v3, 8uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  objc_super v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingInputNode;
  v6 = [(MTLFunctionStitchingInputNode *)&v8 description];
  v9[0] = v4;
  v9[1] = @"argumentIndex =";
  v9[2] = [NSNumber numberWithUnsignedInteger:self->_argumentIndex];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingInputNode *)self formattedDescription:0];
}

- (NSUInteger)argumentIndex
{
  return self->_argumentIndex;
}

- (void)setArgumentIndex:(NSUInteger)argumentIndex
{
  self->_argumentIndex = argumentIndex;
}

@end