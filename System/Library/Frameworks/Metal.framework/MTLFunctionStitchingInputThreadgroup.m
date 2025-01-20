@interface MTLFunctionStitchingInputThreadgroup
- (BOOL)isEqual:(id)a3;
- (MTLFunctionStitchingInputThreadgroup)initWithBindIndex:(unint64_t)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)bindIndex;
- (unint64_t)hash;
- (void)setBindIndex:(unint64_t)a3;
@end

@implementation MTLFunctionStitchingInputThreadgroup

- (MTLFunctionStitchingInputThreadgroup)initWithBindIndex:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputThreadgroup;
  result = [(MTLFunctionStitchingInputThreadgroup *)&v5 init];
  result->_bindIndex = a3;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setBindIndex:self->_bindIndex];
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
  unint64_t v7 = [(MTLFunctionStitchingInputThreadgroup *)self bindIndex];
  return v7 == [a3 bindIndex];
}

- (unint64_t)hash
{
  unint64_t v3 = [(MTLFunctionStitchingInputThreadgroup *)self bindIndex];
  return _MTLHashState((int *)&v3, 8uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  objc_super v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingInputThreadgroup;
  v6 = [(MTLFunctionStitchingInputThreadgroup *)&v8 description];
  v9[0] = v4;
  v9[1] = @"bind index = ";
  v9[2] = [NSNumber numberWithUnsignedInteger:self->_bindIndex];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 3), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(MTLFunctionStitchingInputThreadgroup *)self formattedDescription:0];
}

- (unint64_t)bindIndex
{
  return self->_bindIndex;
}

- (void)setBindIndex:(unint64_t)a3
{
  self->_bindIndex = a3;
}

@end