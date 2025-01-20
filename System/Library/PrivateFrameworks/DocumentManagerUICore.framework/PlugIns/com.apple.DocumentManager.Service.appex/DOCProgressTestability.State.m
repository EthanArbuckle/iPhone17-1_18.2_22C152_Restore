@interface DOCProgressTestability.State
- (BOOL)enabled;
- (void)setEnabled:(BOOL)a3;
@end

@implementation DOCProgressTestability.State

- (BOOL)enabled
{
  return self->enabled[0];
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled[0] = a3;
}

@end