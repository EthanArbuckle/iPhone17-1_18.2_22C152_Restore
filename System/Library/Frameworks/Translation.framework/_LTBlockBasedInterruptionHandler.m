@interface _LTBlockBasedInterruptionHandler
- (id)handler;
- (void)didReceiveInterruptionFromHandler:(id)a3;
- (void)setHandler:(id)a3;
@end

@implementation _LTBlockBasedInterruptionHandler

- (void)didReceiveInterruptionFromHandler:(id)a3
{
  v4 = [(_LTBlockBasedInterruptionHandler *)self handler];

  if (v4)
  {
    v5 = [(_LTBlockBasedInterruptionHandler *)self handler];
    v5[2]();
  }
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end