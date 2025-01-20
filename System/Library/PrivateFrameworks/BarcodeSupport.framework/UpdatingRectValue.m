@interface UpdatingRectValue
- (CGRect)CGRectValue;
- (UpdatingRectValue)initWithUpdateBlock:(id)a3;
@end

@implementation UpdatingRectValue

- (UpdatingRectValue)initWithUpdateBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UpdatingRectValue;
  v5 = [(UpdatingRectValue *)&v10 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x223CAD0D0](v4);
    id updateBlock = v5->_updateBlock;
    v5->_id updateBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (CGRect)CGRectValue
{
  (*((void (**)(void))self->_updateBlock + 2))();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end