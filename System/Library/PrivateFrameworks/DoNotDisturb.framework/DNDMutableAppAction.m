@interface DNDMutableAppAction
- (void)setAction:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation DNDMutableAppAction

- (void)setAction:(id)a3
{
  id v10 = a3;
  if ((-[LNAction isEqual:](self->super._rawAction, "isEqual:") & 1) == 0)
  {
    v4 = (LNAction *)[v10 copy];
    rawAction = self->super._rawAction;
    self->super._rawAction = v4;

    v6 = [v10 identifier];
    v7 = (NSString *)[v6 copy];
    identifier = self->super._identifier;
    self->super._identifier = v7;

    encodedAction = self->super._encodedAction;
    self->super._encodedAction = 0;
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->super._enabled = a3;
}

@end