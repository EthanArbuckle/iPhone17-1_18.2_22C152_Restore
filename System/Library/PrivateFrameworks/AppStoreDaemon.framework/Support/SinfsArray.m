@interface SinfsArray
- (SinfsArray)init;
@end

@implementation SinfsArray

- (SinfsArray)init
{
  v2 = self;
  if (self)
  {
    v6.receiver = self;
    v6.super_class = (Class)SinfsArray;
    v2 = [(SinfsArray *)&v6 init];
    if (v2)
    {
      v3 = (NSArray *)[0 copy];
      sinfs = v2->_sinfs;
      v2->_sinfs = v3;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end