@interface Te_tjejjxf8q3Input
- (MLMultiArray)Placeholder;
- (NSSet)featureNames;
- (Te_tjejjxf8q3Input)initWithPlaceholder:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation Te_tjejjxf8q3Input

- (Te_tjejjxf8q3Input)initWithPlaceholder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Te_tjejjxf8q3Input;
  v6 = [(Te_tjejjxf8q3Input *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Placeholder, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26FBC3448];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"Placeholder"])
  {
    v4 = [MEMORY[0x263F00D50] featureValueWithMultiArray:self->_Placeholder];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MLMultiArray)Placeholder
{
  return self->_Placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end