@interface _CATXPCBoostAssertion
- (id)block;
- (void)dealloc;
- (void)setBlock:(id)a3;
@end

@implementation _CATXPCBoostAssertion

- (void)dealloc
{
  v3 = [(_CATXPCBoostAssertion *)self block];

  if (v3)
  {
    v4 = [(_CATXPCBoostAssertion *)self block];
    v4[2]();
  }
  v5.receiver = self;
  v5.super_class = (Class)_CATXPCBoostAssertion;
  [(_CATXPCBoostAssertion *)&v5 dealloc];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end