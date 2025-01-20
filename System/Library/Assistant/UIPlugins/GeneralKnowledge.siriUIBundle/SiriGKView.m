@interface SiriGKView
- (BOOL)isFullWidth;
- (BOOL)isSelectable;
- (SAClientBoundCommand)command;
- (UIEdgeInsets)edgeInsets;
- (id)selectionResponseTitle;
- (void)setCommand:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
@end

@implementation SiriGKView

- (BOOL)isFullWidth
{
  return 1;
}

- (BOOL)isSelectable
{
  v2 = [(SiriGKView *)self command];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)selectionResponseTitle
{
  return 0;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (SAClientBoundCommand)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
}

- (void).cxx_destruct
{
}

@end