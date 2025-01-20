@interface Te_c3seuakuh8Input
- (MLMultiArray)Placeholder;
- (NSSet)featureNames;
- (Te_c3seuakuh8Input)initWithPlaceholder:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setPlaceholder:(id)a3;
@end

@implementation Te_c3seuakuh8Input

- (Te_c3seuakuh8Input)initWithPlaceholder:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Te_c3seuakuh8Input;
  v6 = [(Te_c3seuakuh8Input *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_Placeholder, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26FBC3418];
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