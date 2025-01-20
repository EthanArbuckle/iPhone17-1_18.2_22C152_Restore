@interface ABBinders
- (id)blobBinder;
- (id)intBinder;
- (id)pointerBinder;
- (id)stringBinder;
- (void)setBlobBinder:(id)a3;
- (void)setIntBinder:(id)a3;
- (void)setPointerBinder:(id)a3;
- (void)setStringBinder:(id)a3;
@end

@implementation ABBinders

- (void)setStringBinder:(id)a3
{
  self->_stringBinder = a3;
}

- (void)setPointerBinder:(id)a3
{
  self->_pointerBinder = a3;
}

- (void)setIntBinder:(id)a3
{
  self->_intBinder = a3;
}

- (void)setBlobBinder:(id)a3
{
  self->_blobBinder = a3;
}

- (id)stringBinder
{
  return self->_stringBinder;
}

- (id)pointerBinder
{
  return self->_pointerBinder;
}

- (id)blobBinder
{
  return self->_blobBinder;
}

- (id)intBinder
{
  return self->_intBinder;
}

@end