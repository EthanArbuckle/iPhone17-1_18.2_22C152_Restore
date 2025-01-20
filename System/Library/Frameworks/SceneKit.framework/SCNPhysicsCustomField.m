@interface SCNPhysicsCustomField
- (c3dPhysicsField)_createField;
- (id)block;
- (void)dealloc;
- (void)setBlock:(id)a3;
@end

@implementation SCNPhysicsCustomField

- (void)dealloc
{
  id block = self->_block;
  if (block)
  {
    _Block_release(block);
    self->_id block = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNPhysicsCustomField;
  [(SCNPhysicsField *)&v4 dealloc];
}

- (void)setBlock:(id)a3
{
  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  self->_id block = 0;
  if (a3)
  {
    v6 = _Block_copy(a3);
    self->_id block = v6;
  }
  else
  {
    v6 = 0;
  }
  field = self->super._field;
  if (field) {
    *(void *)&field[7].var5 = v6;
  }
}

- (id)block
{
  return self->_block;
}

- (c3dPhysicsField)_createField
{
}

@end