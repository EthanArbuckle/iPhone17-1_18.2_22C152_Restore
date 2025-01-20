@interface AVEventManagerBlockAction
- (AVEventManagerBlockAction)initWithBlock:(id)a3 event:(id)a4;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
- (void)sendAction:(id)a3;
@end

@implementation AVEventManagerBlockAction

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  uint64_t v3 = [self->_block hash];
  v5.receiver = self;
  v5.super_class = (Class)AVEventManagerBlockAction;
  return [(AVEventManagerBlockAction *)&v5 hash] & v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVEventManagerBlockAction *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v8.receiver = self;
      v8.super_class = (Class)AVEventManagerBlockAction;
      if ([(AVEventManagerAction *)&v8 isEqual:v5]) {
        BOOL v6 = self->_block == v5[2];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)sendAction:(id)a3
{
}

- (AVEventManagerBlockAction)initWithBlock:(id)a3 event:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVEventManagerBlockAction;
  v7 = [(AVEventManagerAction *)&v11 initWithEvent:a4];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1B3E963E0](v6);
    id block = v7->_block;
    v7->_id block = (id)v8;
  }
  return v7;
}

@end