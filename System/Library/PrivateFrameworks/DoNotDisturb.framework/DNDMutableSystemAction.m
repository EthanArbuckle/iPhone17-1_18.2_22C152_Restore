@interface DNDMutableSystemAction
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAction:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setReverseAction:(id)a3;
@end

@implementation DNDMutableSystemAction

- (void)setAction:(id)a3
{
}

- (void)setReverseAction:(id)a3
{
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[DNDSystemAction allocWithZone:a3];
  action = self->super._action;
  reverseAction = self->super._reverseAction;
  BOOL enabled = self->super._enabled;
  return [(DNDSystemAction *)v4 initWithAction:action reverseAction:reverseAction enabled:enabled];
}

@end