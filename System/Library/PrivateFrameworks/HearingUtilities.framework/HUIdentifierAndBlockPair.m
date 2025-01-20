@interface HUIdentifierAndBlockPair
- (HUIdentifierAndBlockPair)initWithIdentifier:(id)a3 andBlock:(id)a4;
- (id)block;
- (id)identifier;
- (void)setBlock:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation HUIdentifierAndBlockPair

- (HUIdentifierAndBlockPair)initWithIdentifier:(id)a3 andBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUIdentifierAndBlockPair;
  v8 = [(HUIdentifierAndBlockPair *)&v13 init];
  v9 = v8;
  if (v8)
  {
    v8->_identifier = v6;
    uint64_t v10 = [v7 copy];
    id block = v9->_block;
    v9->_id block = (id)v10;
  }
  return v9;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  self->_identifier = a3;
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