@interface _IKDOMBindingControllerUpdateRecord
- (BOOL)isCancelled;
- (id)preUpdate;
- (id)update;
- (void)setCancelled:(BOOL)a3;
- (void)setPreUpdate:(id)a3;
- (void)setUpdate:(id)a3;
@end

@implementation _IKDOMBindingControllerUpdateRecord

- (id)preUpdate
{
  return self->_preUpdate;
}

- (void)setPreUpdate:(id)a3
{
}

- (id)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_update, 0);
  objc_storeStrong(&self->_preUpdate, 0);
}

@end