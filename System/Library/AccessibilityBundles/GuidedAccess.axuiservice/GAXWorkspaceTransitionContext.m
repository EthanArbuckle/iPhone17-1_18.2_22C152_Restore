@interface GAXWorkspaceTransitionContext
- (id)completion;
- (int)type;
- (void)setCompletion:(id)a3;
- (void)setType:(int)a3;
@end

@implementation GAXWorkspaceTransitionContext

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end