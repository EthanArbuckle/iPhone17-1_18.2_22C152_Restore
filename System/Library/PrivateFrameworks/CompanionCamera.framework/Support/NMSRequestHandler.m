@interface NMSRequestHandler
- (SEL)action;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation NMSRequestHandler

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
}

@end